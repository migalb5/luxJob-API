
auth_helper <- function(
    res,
    req,
    FUN,
    ...
) {
  auth_header <- if (!is.null(req$HTTP_AUTHORIZATION)) req$HTTP_AUTHORIZATION else ""
  token <- sub("^Bearer ", "", auth_header)

  if (!luxJob::verify_token(token, "student_miguel")) {
    res$body <- "Unauthorized"
    res$status <- 401
    "Missing or invalid Bearer Token, or invalid configuration!"
  } else {
    FUN(...)
  }
}
