#!/usr/bin/env Rscript
# --------------------------------------------------------------------------- #
# nolint start
#
#   parseqif - simple parser for qif formated files
#
#   This file is part of the Parsers::Parse-Qif-R project
#
#   Copyright (C) 2019 DC Slagel

#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.

#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License along
#   with this program; if not, write to the Free Software Foundation, Inc.,
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#   URL: https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
#
#   License-Identifier: GPL-2.0-or-later
#
# nolint end
# --------------------------------------------------------------------------- #

#' Parse a Qif file
#'
#' This function loads a Qif-formatted file, parses the file and displays the 
#' data in a structured way.
#'
#' @param source_file Path to the input file
#' @return the Qif data in a data-frame
#' @export
parse_qif <- function(source_file) {

  all_data <- readLines(source_file)
  qif_account_type <- all_data[1]


  df <- data.frame(date = as.Date(character()),
                   u_amount = numeric(),
                   t_amount = numeric(),
                   check_num = character(),
                   payee = character(),
                   memo = character(),
                   exp_category = character(),
                   stringsAsFactors = FALSE)


  new_row <- list(date  = "",
                  u_amount = 0.00,
                  t_amount = 0.00,
                  check_num = "",
                  payee = "",
                  memo = "")

  for (item in all_data[2:length(all_data)]) {
      field_id <- substr(item, 1, 1)

      if (field_id == "D") {
          new_date <- substr(item, 2, nchar(item))
          new_date <- as.Date(new_date, format = "%m/%d'%y")
          new_row$date <- new_date
      }

      if (field_id == "U") {
          u_amount <- substr(item, 2, nchar(item))
          # remove non-numeric symbols
          u_amount <- gsub("[^-.0-9]", "", u_amount)
          new_row$u_amount <- as.numeric(u_amount)
      }

      if (field_id == "T") {
          t_amount <- substr(item, 2, nchar(item))
          # remove non-numeric symbols
          t_amount <- gsub("[^-.0-9]", "", t_amount)
          new_row$t_amount <- as.numeric(t_amount)
      }

      if (field_id == "N") {
          new_row$check_num <- substr(item, 2, nchar(item))
      }

      if (field_id == "P") {
          new_row$payee <- substr(item, 2, nchar(item))
      }

      if (field_id == "M") {
          new_row$memo <- substr(item, 2, nchar(item))
      }

      if (field_id == "L") {
          new_row$exp_category <- substr(item, 2, nchar(item))
      }

      # -----------------------------------------------------
      # "^" is the end of record indicator
      # add new row to dataframe
      # -----------------------------------------------------
      if (field_id == "^") {
          df[nrow(df) + 1, names(new_row)] <- new_row
      }
  }

  cat("#----------------------------------------------------------#\n")
  cat("# Current Summary\n")
  cat("#----------------------------------------------------------#\n")
  print(df)
  cat("#----------------------------------------------------------#\n")
  cat("U_Amount Summary Data\n")
  print(summary(df$u_amount))
  cat("\n")
  cat("#----------------------------------------------------------#\n")

# nolint start
# write.csv(df, file = "qif_data_with_headers.csv")
# new_df <- read.csv("qif_data_with_headers.csv")
# nolint end
  df
}
