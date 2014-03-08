'use strict'

angular.module('bitsApp', [
  'ngMd5'
  'ngRoute'
  'ngCookies'
  'ngResource'
  'ngSanitize'
  'ui.bootstrap'
])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'partials/main'
        controller: 'MainCtrl'

      .when '/gravatar',
        templateUrl: 'partials/gravatar'
        controller: 'GravatarCtrl'

      .when '/currency',
        templateUrl: 'partials/currency'
        controller: 'CurrencyCtrl'

      .when '/temperature',
        templateUrl: 'partials/temperature'
        controller: 'TemperatureCtrl'

      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true
