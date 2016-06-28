var myApp = angular.module('Magazine', ["ui.bootstrap"]);

myApp.config(["$httpProvider", function($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);

myApp.controller("NewArticleController", ['$scope', '$http', function($scope, $http) {
    $scope.currentUser = JSON.parse($('meta[name=current_user]').attr('content'));

    var articleForm = {
      title: "",
      body: "",
      user_id: null
    };

    $scope.articleForm = angular.copy(articleForm);
    $scope.createArticle = function() {
      if(!$scope.articleForm) {
        return;
      }

      if($scope.articleForm.title == "") {
        alert("Please type Title of the Article.");
        return;
      }
      if($scope.articleForm.body == "") {
        alert("Please type Body of the Article.");
        return;
      }

      $scope.articleForm.user_id = $scope.currentUser.id;

      $http({
        method: 'POST',
        url: '/articles',
        data: {article: $scope.articleForm}
      }).success(function(response) {
          alert(response.server_message);
          $scope.articleForm = angular.copy(articleForm);
      }).error(function(response){
          alert(response.server_message);
      });
    };
}]);

myApp.controller("ArticlesController", ['$scope', '$http', function($scope) {
    $scope.articles_data = $('#articles-container').data('content').articles.data;
    $scope.currentUser = JSON.parse($('meta[name=current_user]').attr('content'));
}]);

myApp.controller("ArticleController", ['$scope', '$http', function($scope, $http) {
    $scope.single_article = $('#single-article-container').data('content').data;
    $scope.currentUser = JSON.parse($('meta[name=current_user]').attr('content'));

    if($scope.single_article) {
      $scope.articleForm = {
        title: $scope.single_article.title,
        body: $scope.single_article.body,
        user_id: $scope.single_article.author.id,
        id: $scope.single_article.id
      };
    }

    $scope.updateArticle = function() {
      if(!$scope.articleForm) {
        return;
      }

      if($scope.articleForm.title == "") {
        alert("Please type Title of the Article.");
        return;
      }
      if($scope.articleForm.body == "") {
        alert("Please type Body of the Article.");
        return;
      }

      $http({
        method: 'PUT',
        url: '/articles/'+$scope.single_article.id,
        data: {article: $scope.articleForm}
      }).success(function(response) {
        alert(response.server_message);
      }).error(function(response){
        alert(response.server_message);
      });
    };
}]);

myApp.controller("CommentsController", ['$scope', '$http', function($scope, $http) {
    $scope.currentUser = JSON.parse($('meta[name=current_user]').attr('content'));
}]);

myApp.controller("CommentController", ['$scope', '$http', function($scope, $http) {
    $scope.currentUser = JSON.parse($('meta[name=current_user]').attr('content'));

    $scope.showReplyBox = function() {
      $scope.show_reply_box = !$scope.show_reply_box;
    }
}]);