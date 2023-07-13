terraform {
  cloud {
    organization = "terransible_gal"

    workspaces {
      name = "asus_transible"
    }
  }
}