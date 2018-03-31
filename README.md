# Shiny apps in cagua.co

This repo contains the structure used to host the shiny apps in cagua.co. Uses a containerized version of shiny server.

To run it, make sure just run `bash start-shiny-docker.sh`. Make sure that the volumes paths are correct and shiny is serving on the port 3838. 

The shiny apps in particular are not contained here. Rather they are included as submodules in the `./apps` directory
