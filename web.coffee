express = require "express"
app = express()
issueRepository = require "./IssueRepository"
stylus = require('stylus')

compile = (str, path) ->
  stylus(str).set('filename', path).use(nib())

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
app.use express.logger('dev')
app.use stylus.middleware(
  src: __dirname + '/public'
  compile: compile
  
)
app.use express.static __dirname + '/public'

app.get "/", (req,res)->
  res.render "index"

app.get "/issues", issueRepository.findAll
app.post "/issue", issueRepository.createIssue
app.get "/issue/:id", issueRepository.getIssue
app.put "/issue/:id", issueRepository.updateIssue

app.listen 3000
console.log 'Listening on port 3000'