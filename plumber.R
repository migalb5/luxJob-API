
library(plumber)
# plumber.R


#* @apiTitle API for ADEM dataset
#* @apiDescription This is a simple API to demonstrate the use of plumber.
#* @apiVersion 2.0.0
#* @apiContact pierrick.kinif@datagrowth.io
#* @apiLicense MIT



#* Obtain details of skills
#* @param limit:int (optional) integer defining the maximum quantity of skills returned.
#* @get /skills
function(limit = 100){
  limit <- as.integer(limit)
  luxJob::get_skills(limit)
}

#* Obtain the details of a skill, given a skill ID
#* @param skill_id:string identifying the skill
#* @get /skills/<skill_id:int>
function(skill_id){
  luxJob::get_skill_by_id(skill_id)
}

#* Obtain details of companies
#* @param limit:int (optional)integer defining the maximum quantity of companies returned.
#* @get /companies
function(limit = 100){
  luxJob::get_companies(as.integer(limit))
}

#* Obtain the details of a company, given a company ID
#* @param company_id:int integer identifying the company.
#* @get /companies/<company_id:int>
function(company_id){
  luxJob::get_company_details(as.integer(company_id))
}

#* Obtain details of vacancies
#* @param skill_label:string (optional) string identifying a skill by designation (label).
#* @param company_name:string (optional) string identifying a company by its name.
#* @param canton:string (optional) string identifying the canton by its designation.
#* @param limit:int (optional) integer defining the maximum quantity of vacancies returned.
#* @get /vacancies
function(skill_label = NULL, company_name = NULL, canton = NULL, limit = 100){
  luxJob::get_vacancies(skill_label, company_name, canton, as.integer(limit))
}

#* Obtain the details of a vacancy, given a vacancy ID
#* @param vacancy_id:int integer identifying a vacancy.
#* @get /vacancies/<vacancy_id:int>
function(vacancy_id){
  luxJob::get_vacancy_by_id(as.integer(vacancy_id))
}

#* Obtain details of learning tracks
#* @param skill_id:int (optional) string identifying a skill by its ID.
#* @get /learning_tracks
function(skill_id = NULL){
  luxJob::get_learning_tracks(skill_id)
}

#* Obtain the details of a learning track, given a learning track ID
#* @param learning_track_id:int integer identifying a learning track.
#* @get /learning_tracks/<learning_track_id:int>
function(learning_track_id){
  luxJob::get_learning_track_by_id(as.integer(learning_track_id))
}

#* Obtain details of books
#* @param skill_label:string string (optional) string identifying a skill by designation (label).
#* @get /books
function(skill_label = NULL){
  luxJob::get_books(skill_label)
}

#* Obtain the details of a book, given a book ID
#* @param book_id:int integer identifying the book.
#* @get /books/<book_id:int>
function(book_id){
  luxJob::get_book_by_id(as.integer(book_id))
}

#* Log the details of a performed query
#* @param user_id:int integer identifying the user.
#* @param query:string string containing the search criteria.
#* @post /log_search
function(user_id, query){
  luxJob::log_search(as.integer(user_id), query)
}
