store = []


exports.findAll = (req,res)->
  res.json store

exports.createIssue = (req, res)->
  uuid = new Date().getTime().toString()

  issue = req.body
  issue.id = uuid
  store.push issue
  
  res.send uuid


exports.getIssue = (req,res)->
  id = req.params.id
  issues = store.filter((issue)->
    issue.id == id
  )
  if issues.length == 0 
  then res.send 404
  else res.json issues[0]

exports.updateIssue = (req,res)->
  id = req.id
  issues = store.map (issue)->
    if issue.id == id 
    then return req.body
    else return issue
  store = issues
