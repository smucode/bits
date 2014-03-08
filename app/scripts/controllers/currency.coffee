'use strict'

angular.module('bitsApp')
  .controller 'CurrencyCtrl', ($scope, $http) ->
    # http://rate-exchange.appspot.com/currency?from=nok&to=gbp&callback=123
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings

    $scope.convert = ->
      ((from, to) ->
        url = "http://rate-exchange.appspot.com/currency?from=#{from}&to=#{to}&callback=JSON_CALLBACK"
        $scope.err = false
        $scope.serr = false
        $scope.wait = true
        $scope.conv = 0
        $http.jsonp(url)
          .success (data) ->
            $scope.wait = false
            $scope.err = data.err
            $scope.to = to
            $scope.from = from
            $scope.conv = data.rate
          .error ->
            $scope.wait = false
            $scope.serr = true
      )($scope.f, $scope.t)
