library(worldfootballR)

# Team Statistics
team_stats <- c(
  "league_table",
  "league_table_home_away",
  "standard",
  "keeper",
  "keeper_adv",
  "shooting",
  "passing",
  "passing_types",
  "goal_shot_creation",
  "defense",
  "possession",
  "playing_time",
  "misc"
)

for (val in team_stats)
{
  campeonato_brasileiro <- fb_season_team_stats(country = "BRA", gender = "M", season_end_year = 2023, tier = '1st', stat_type = val)
  write.csv(campeonato_brasileiro, file = sprintf("% s_team.csv", val))
}


# Player Statistics
league_url <- fb_league_urls(country = "BRA", gender = "M", season_end_year = 2023, tier = '1st')
teams <- fb_teams_urls(league_url)
player_stats <- c(
  "standard",
  "shooting",
  "passing",
  "passing_types",
  "gca",
  "defense",
  "possession",
  "playing_time",
  "misc",
  "keeper",
  "keepers_adv"
)

for (val in player_stats)
{
  campeonato_brasileiro <- fb_team_player_stats(team_urls=teams ,  stat_type = val)
  write.csv(campeonato_brasileiro, file = sprintf("% s_player.csv", val))
}


# Matches Statistics
league_url <- fb_league_urls(country = "BRA", gender = "M", season_end_year = 2023, tier = '1st')
teams <- fb_teams_urls(league_url)

match_stats <- c(
  "shooting",
  "keeper",
  "passing",
  "passing_types",
  "gca",
  "defense",
  "misc"
)

for (val in match_stats)
{
  print(val)
  campeonato_brasileiro <- fb_team_match_log_stats(team_urls=teams ,  stat_type = val)
  write.csv(campeonato_brasileiro, file = sprintf("% s_match.csv", val))
}
