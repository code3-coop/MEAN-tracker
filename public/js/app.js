angular.module('issuetracker', []).
  config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/issues', {templateUrl: 'partials/issue-list.html',   controller: IssueListCtrl}).
      when('/issue/new', {templateUrl: 'partials/issue-create.html', controller: IssueCreateCtrl}).
      when('/issue/:issueId/edit', {templateUrl: 'partials/issue-create.html', controller: IssueEditCtrl}).
      when('/issue/:issueId', {templateUrl: 'partials/issue-detail.html', controller: IssueDetailCtrl}).
      otherwise({redirectTo: '/issues'});
}]);

var issueTypes = ["GUI","API","Documentation"];
var priorities = ["low","middle","high"];
var status = ["new","affected","WTF","closed","fixed"]

IssueListCtrl=function($scope, $http) {
  $http.get("/api/issues").success(function(issues){
    $scope.issueList = issues;
  });
}
IssueDetailCtrl=function($scope, $routeParams, $http, $location) {
  var issueId = $routeParams.issueId;
  $http.get("/api/issue/"+issueId).success(function(data){
  	$scope.issue = data;
  }).error(function(){
  	console.log("failed to get issue");
  });
  $scope.editIssue=function(){
    $location.path("/issue/"+issueId+"/edit")
  }

}
IssueCreateCtrl=function($scope, $http, $location) {
  $scope.issueTypes= issueTypes;
  $scope.issuePriorities=priorities;
  $scope.saveIssue=function(){
	$http.post("/api/issue", $scope.issue).success(function(data){
		$location.path("/issue/"+data);
	});
 	
  }
}
IssueEditCtrl=function($scope, $http, $location) {
  $scope.issueTypes=issuesTypes;
  $scope.issuePriorities=priorities;
  console.log("Test"+$scope.issue);
  $scope.saveIssue=function(){
  $http.post("/api/issue", $scope.issue).success(function(data){
    $location.path("/issue/"+data);
  });
  
  }
};
