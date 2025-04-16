
library(plumber)
# plumber.R

source("auth_helper.R")


#* @apiTitle API for ADEM dataset
#* @apiDescription This is a simple API to demonstrate the use of plumber.
#* @apiVersion 3.0.0
#* @apiContact pierrick.kinif@datagrowth.io
#* @apiLicense MIT



#* Obtain details of skills
#* @param limit:int (optional) integer defining the maximum quantity of skills returned.
#* @get /skills
function (res, req, limit = 100) {
  auth_helper(res, req, api_get_skills, limit)
}

api_get_skills <- function(limit){
  limit <- as.integer(limit)
  luxJob::get_skills(limit)
}

#* Obtain the details of a skill, given a skill ID
#* @param skill_id:string identifying the skill
#* @get /skills/<skill_id:int>
function (res, req, skill_id) {
  auth_helper(res, req, api_get_skill_by_id, skill_id)
}

api_get_skill_by_id <- function(skill_id){
  luxJob::get_skill_by_id(skill_id)
}

#* Obtain details of companies
#* @param limit:int (optional)integer defining the maximum quantity of companies returned.
#* @get /companies
function (res, req, limit = 100) {
  auth_helper(res, req, api_get_companies, limit)
}

api_get_companies <- function(limit){
  luxJob::get_companies(as.integer(limit))
}

#* Obtain the details of a company, given a company ID
#* @param company_id:int integer identifying the company.
#* @get /companies/<company_id:int>
function (res, req, company_id) {
  auth_helper(res, req, api_get_company_details, company_id)
}

api_get_company_details <- function(company_id){
  luxJob::get_company_details(as.integer(company_id))
}

#* Obtain details of vacancies
#* @param skill_label:string (optional) string identifying a skill by designation (label).
#* @param company_name:string (optional) string identifying a company by its name.
#* @param canton:string (optional) string identifying the canton by its designation.
#* @param limit:int (optional) integer defining the maximum quantity of vacancies returned.
#* @get /vacancies
function (res, req, skill_label = NULL, company_name = NULL, canton = NULL, limit = 100) {
  auth_helper(res, req, api_get_vacancies, skill_label, company_name, canton, limit)
}

api_get_vacancies <- function(skill_label, company_name, canton, limit){
  luxJob::get_vacancies(skill_label, company_name, canton, as.integer(limit))
}

#* Obtain the details of a vacancy, given a vacancy ID
#* @param vacancy_id:int integer identifying a vacancy.
#* @get /vacancies/<vacancy_id:int>
function (res, req, vacancy_id) {
  auth_helper(res, req, api_get_vacancy_by_id, vacancy_id)
}

api_get_vacancy_by_id <- function(vacancy_id){
  luxJob::get_vacancy_by_id(as.integer(vacancy_id))
}

#* Obtain details of learning tracks
#* @param skill_id:int (optional) string identifying a skill by its ID.
#* @get /learning_tracks
function (res, req, skill_id = NULL) {
  auth_helper(res, req, api_get_learning_tracks, skill_id)
}

api_get_learning_tracks <- function(skill_id){
  luxJob::get_learning_tracks(skill_id)
}

#* Obtain the details of a learning track, given a learning track ID
#* @param learning_track_id:int integer identifying a learning track.
#* @get /learning_tracks/<learning_track_id:int>
function (res, req, learning_track_id) {
  auth_helper(res, req, api_get_learning_track_by_id, learning_track_id)
}

api_get_learning_track_by_id <- function(learning_track_id){
  luxJob::get_learning_track_by_id(as.integer(learning_track_id))
}

#* Obtain details of books
#* @param skill_label:string string (optional) string identifying a skill by designation (label).
#* @get /books
function (res, req, skill_label = NULL) {
  auth_helper(res, req, api_get_books, skill_label)
}

api_get_books <- function(skill_label){
  luxJob::get_books(skill_label)
}

#* Obtain the details of a book, given a book ID
#* @param book_id:int integer identifying the book.
#* @get /books/<book_id:int>
function (res, req, book_id) {
  auth_helper(res, req, api_get_book_by_id, book_id)
}

api_get_book_by_id <- function(book_id){
  luxJob::get_book_by_id(as.integer(book_id))
}

#* Log the details of a performed query
#* @param user_id:int integer identifying the user.
#* @param query:string string containing the search criteria.
#* @post /log_search
function (res, req, user_id, query) {
  auth_helper(res, req, api_log_search, user_id, query)
}

api_log_search <- function(user_id, query){
  luxJob::log_search(as.integer(user_id), query)
}
