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
app.use express.bodyParser()

app.use express.static __dirname + '/public'

app.get "/", (req,res)->
  res.render "index"
app.get '/partials/:name.html', (req,res)->
  res.render "partials/#{req.params.name}"

app.get "/api/issues", issueRepository.findAll
app.post "/api/issue", issueRepository.createIssue
app.get "/api/issue/:id", issueRepository.getIssue
app.put "/api/issue/:id", issueRepository.updateIssue

app.listen 3000
console.log 'Listening on port 3000'