library(janeaustenr)
library(udpipe)
library(fastText)

japp <- janeaustenr::prideprejudice#[10:120]

#udmodel <- udpipe::udpipe_download_model(language = "english-ewt")
udmodel_filepath <- "/home/rstudio/english-ewt-ud-2.5-191206.udpipe"
udmodel <- udpipe::udpipe_load_model(file = udmodel_filepath)
#m_eng <- udpipe::udpipe_load_model(file = here::here("english-ewt-ud-2.5-191206.udpipe"))

text_ann <- udpipe::udpipe_annotate(udmodel, x = japp, parallel.cores = 4L)
text_anndf <- text_ann |> dplyr::as_tibble() |> duckplyr::select(c(-sentence, -sentence_id, -paragraph_id))

mutated_anndf <- text_anndf |>
  dplyr::mutate(concatenated = paste(token, xpos, lemma, sep = "_"))

anndf_concatenated <- as.list(mutated_anndf[["concatenated"]])

# Adjust the paste function to use newline as the separator
tagged_text <- paste(text_anndf$token, "_", text_anndf$xpos, "_", text_anndf$lemma, collapse = "\n", sep = "")

# Now write the 'tagged_text' to a file, each tag on a new line
writeLines(tagged_text, "tagged_text.txt")

