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

# Other Dockerfile commands...

# Copy the entrypoint script into the container
# COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
# RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint script to be executed when the container starts
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Specify the default command (this can be overridden)
# CMD ["/bin/bash"]

# Copy the current directory contents into the container at /workspace
#COPY . /workspace

# Install any additional dependencies or perform further setup

# Verify Java installation
# RUN java -version



# Specify any default command or entry point; for example, starting a shell
#CMD ["/bin/bash"]