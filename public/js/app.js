angular.module('issuetracker', []).
  config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/issues', {templateUrl: 'partials/issue-list.html',   controller: IssueListCtrl}).
      when('/issue/new', {templateUrl: 'partials/issue-create.html', controller: IssueCreateCtrl}).
      when('/issue/:issueId', {templateUrl: 'partials/issue-details.html', controller: IssueDetailCtrl}).
      otherwise({redirectTo: '/issues'});
}]);

IssueListCtrl=function($scope, $routeParams) {
  $scope.phoneId = $routeParams.phoneId;
}
IssueDetailCtrl=function($scope, $routeParams) {
  $scope.phoneId = $routeParams.phoneId;
}
IssueCreateCtrl=function($scope, $http, $location) {
  $scope.issueTypes=[{label:"GUI"},{label:"API"},{label:"Documentation"}];
  $scope.issuePriorities=[{label:"low"},{label:"middle"},{label:"high"}]
  $scope.saveIssue=function(){
	$http.post("/api/issue", $scope.issue).success(function(data){
		$location("/issue/"+data);
	});
 	
  }
}