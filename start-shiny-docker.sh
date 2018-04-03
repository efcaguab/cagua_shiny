#!/bin/bash

docker run --name shiny -d -p 3838:3838 \
    -v ~/github/cagua-website/cagua_shiny/apps:/srv/shiny-server/ \
    -v ~/github/cagua-website/cagua_shiny/logs:/var/log/shiny-server/ \
    rocker/shiny

docker exec -it shiny apt-get update
docker exec -it shiny sudo apt-get install -y libxml2-dev libssl-dev
docker exec -it shiny Rscript -e "install.packages('packrat')"

# data-rich-insight-poor-live-demo
# docker exec -it shiny sudo chown -R shiny:shiny /srv/shiny-server/data-rich-live-demo
# docker exec -it shiny Rscript -e "packrat::restore('/srv/shiny-server/data-rich-live-demo')"

# demografia del voto app
docker exec -it shiny sudo chown -R shiny:shiny /srv/shiny-server/demografia-del-voto
docker exec -it -w /srv/shiny-server/demografia-del-voto shiny Rscript -e "packrat::restore()"
docker exec -it -w /srv/shiny-server/demografia-del-voto shiny Rscript -e "packrat::on()"
# docker exec -it shiny Rscript -e "setwd('/srv/shiny-server/demografia-del-voto'); packrat::on()"
# docker exec -it shiny make -C /srv/shiny-server/demografia-del-voto
