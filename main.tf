terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "playlist" {
  name        = "Example playlist made by Terraform"
  description = "Ege created this playlist by using Terraform xd"
  public      = true

  tracks = flatten([
      data.spotify_search_track.dream_theater.tracks[*].id,
      data.spotify_search_track.opeth.tracks[*].id,
      data.spotify_search_track.metalium.tracks[*].id,
      data.spotify_search_track.diabolizer.tracks[*].id
  ])
}

data "spotify_search_track" "dream_theater" {
  artist = "Dream Theater"
  limit = 3
  explicit = true
  year = 2021
}

data "spotify_search_track" "opeth" {
  artist = "Opeth"
  limit = 3
  explicit = true
  year = 2021
}

data "spotify_search_track" "metalium" {
  artist = "Metalium"
  limit = 3
  explicit = true
  year = 2020
}

data "spotify_search_track" "diabolizer" {
  artist = "Diabolizer"
  limit = 3
  explicit = true
  year = 2021
}