#
#
#
#
#
#
#
library(dplyr)
library(tibble)
library(pander)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
revenue = tribble(
    ~Category , ~`Cook County`, ~`Lake County`,
    "General Merchandise", 1207, 242,
    "Food", 42511, 589833,
    "Drinking & Eating Places", 173970, 137030,
    "Apparel", 33634, 23638,
    "Furniture & Household & Radio", 48406, 30638,
    "Lumber, Building, Hardware", 102653, 5572,
    "Automotive & Filling Stations", 4105594, 1491312,
    "Drugs & Misc. Retail", 335802, 413918,
    "Agriculture & All Other", 128781, 194005,
    "Manufacturers", 20781, 8288
) |>
  mutate(
    Total = `Cook County` + `Lake County`,
    #Total = scales::label_dollar(accuracy = 1)(Total)
  )

#
#
#
#| label: tbl-revenues
#| echo: false
#| results: asis
#| warning: false
#| tbl-cap: Revenue Generated by 1% Municipal Tax in Barrington, IL (FY2022)

revenue_total = tibble(Category = "Total",
                            `Cook County` = sum(revenue$`Cook County`),
                            `Lake County` = sum(revenue$`Lake County`),
                            Total = sum(revenue$Total))

bind_rows(revenue, revenue_total) |> 
  mutate(across(`Cook County`:Total), scales::label_dollar(accuracy = 1)(.)) |>
  select(Category, `Cook County`, `Lake County`, Total) |>
  pandoc.table(justify = "lccc", missing = "—", digits = c(1, 3))


#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
