# Use the same image as specified in devcontainer.json
FROM ghcr.io/rocker-org/devcontainer/tidyverse:4

RUN apt-get update && apt-get install -y default-jdk

RUN R -e "install.packages(c('pak', 'renv'), repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages(c('textrank'), repos='http://cran.rstudio.com/')"
#RUN R -e "install.packages(c('text2vec'), repos='http://cran.rstudio.com/')"
#RUN R -e "pak::pkg_install(c('text2vec'), dependencies=TRUE)" 
#RUN R -e "pak::pkg_install(c('word2vec'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('rJava'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('janeaustenr'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('gsubfn'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('ore'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('lsa'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('tm'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('topicmodels'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('lda'), dependencies=TRUE)" 
#RUN R -e "install.packages(c('text2vec', 'textrank'), repos='http://cran.rstudio.com/')"

RUN R -e "pak::pkg_install(c('fastText'), dependencies=TRUE)" 

RUN R -e "pak::pkg_install(c('duckplyr'), dependencies=TRUE)" 
RUN R -e "install.packages(c('openNLP', 'wordnet'), repos='http://cran.rstudio.com/')"
RUN R -e "pak::pkg_install(c('udpipe'), dependencies=TRUE)" 

RUN R -e "pak::pkg_install(c('text2vec'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('textrank'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('word2vec'), dependencies=TRUE)" 
RUN R -e "pak::pkg_install(c('ggraph'), dependencies=TRUE)"
RUN R -e "pak::pkg_install(c('tidygraph'), dependencies=TRUE)"
RUN R -e "pak::pkg_install(c('igraph'), dependencies=TRUE)"
RUN R -e "pak::pkg_install(c('tidytext'), dependencies=TRUE)"

# Create a new user 'rstudio' with a home directory and bash shell
# RUN useradd rstudio

# Set the password for the 'rstudio' user to 'password'
RUN echo 'rstudio:1234' | chpasswd
#RUN wget https://rstudio.org/links/github-copilot
#RUN tar -xzf copilot-rstudio-extension.tar.gz -C /path/to/rstudio/extensions
# Set copilot-enabled=1 in /etc/rstudio/rsession.conf
#RUN echo "copilot-enabled=1" >> /etc/rstudio/rsession.conf