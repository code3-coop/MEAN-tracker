issueRepository = require "../IssueRepository"
assert = require "assert"

console.log "NOT WORKING"
#TODO this test must use the rest api
issue = 
  creator:"Paul Lalonde"
  created_on:"2013-01-01"
  title:"Ca marche pas vraiement"
  text:" en fait j'en sais rien"

issueRepository.createIssue issue

assert.equal(issueRepository.findAll.length, 1)
