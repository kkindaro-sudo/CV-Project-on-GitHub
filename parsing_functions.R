library(dplyr)
library(tidyr)
library(purrr)
library(glue)

print_section <- function(position_data, section_id) {
  position_data %>%
    filter(section == section_id) %>%
    mutate(id = row_number()) %>%
    pivot_longer(
      starts_with("description"),
      names_to = "description_num",
      values_to = "description"
    ) %>%
    filter(!is.na(description) | description_num == "description_1") %>%
    group_by(id) %>%
    mutate(
      descriptions = list(description[!is.na(description)]),
      timeline = case_when(
        is.na(start) | start == "" ~ end,
        start == end ~ end,
        TRUE ~ glue("{start} - {end}")
      ),
      description_bullets = map_chr(
        descriptions,
        ~ if (length(.x) == 0) " " else paste("-", .x, collapse = "\n")
      )
    ) %>%
    ungroup() %>%
    filter(description_num == "description_1") %>%
    mutate(
      title = coalesce(title, ""),
      institution = coalesce(institution, ""),
      loc = coalesce(loc, ""),
      timeline = coalesce(timeline, ""),
      description_bullets = coalesce(description_bullets, " ")
    ) %>%
    glue_data(
      "### {title}", "\n\n",
      "{institution}", "\n\n",
      "{loc}", "\n\n",
      "{timeline}", "\n\n",
      "{description_bullets}", "\n\n\n"
    )
}

build_skill_bars <- function(skills, out_of = 5) {
  bar_color <- "#0b5278"
  bar_background <- "#d5dfe5"
  skills %>%
    mutate(width_percent = round(100 * level / out_of)) %>%
    glue_data(
      "<div class='skill-bar' style=\"background:linear-gradient(to right, ",
      "{bar_color} {width_percent}%, {bar_background} {width_percent}% 100%)\">",
      "{skill}</div>"
    )
}
