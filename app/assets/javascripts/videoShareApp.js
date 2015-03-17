angular.module("videoShareApp", []).controller('videoShareController', function($scope, $http) {
    $scope.orderByField = 'firstName';
    $scope.reverseSort = true;
    $scope.currentPage = 1;
    $scope.pages = 0;
    $http.get("http://salty-wave-2170.herokuapp.com/videos").success(function(response){
        $scope.pages = Math.ceil(response.length / 6);
    });

    $scope.loadPage = function(){
      $http.get("http://salty-wave-2170.herokuapp.com/videos?page=" + $scope.currentPage).success(function(response){
        $scope.videos = response;
      });
    };
    
    $scope.nextPage = function(){
      if ($scope.currentPage < $scope.pages) {
        $scope.currentPage++;
        $scope.loadPage();
      }
    }
    
    $scope.prePage = function(){
      if ($scope.currentPage > 1) {
        $scope.currentPage--;
        $scope.loadPage();
      }
    }
    
    $scope.sort = function(){
      $scope.orderProp = 'title'; 
    }
    
    $scope.loadPage();
});