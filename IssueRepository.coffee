store = []

exports.findAll = (req,res)->
  res.json store

exports.createIssue = (req, res)->
  issue = req.body
  issue.id= store.length+1
  store.push issue
  res.send "store.length"

exports.getIssue = (req,res)->
  id = req.id
  issues = store.filter((issue)->
    issue.id = id
  )
  if issues.length == 0 then res.error 404
  res.json issues[0]

exports.updateIssue = (req,res)->
  id = req.id
  issues = store.map((issue)->
    if issue.id == id then return req.body
    else return issue
  )
  store = issues
