'use strict'

angular.module('bitsApp', [
  'ngCookies'
  'ngResource'
  'ngSanitize'
  'ngRoute'
  'ngMd5'
])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'partials/main'
        controller: 'MainCtrl'

      .when '/gravatar',
        templateUrl: 'partials/gravatar'
        controller: 'GravatarCtrl'

      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true
