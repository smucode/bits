'use strict'

angular.module('bitsApp')
  .controller 'TemperatureCtrl', ($scope) ->
    # http://jsfiddle.net/yMLqz/2/

    $scope.from = 'F'
    $scope.to   = 'C'
    $scope.temp = 375

    s = K: 'K', F: '°F', C: '°C'

    c =
      C2F: (c) -> (1.8 * c) + 32
      C2K: (c) -> c + 273.15
      F2C: (f) -> (f - 32) * 5 / 9
      F2K: (f) -> c.C2K c.F2C f
      K2C: (k) -> k - 273.15
      K2F: (k) -> c.C2F c.K2C k

    $scope.convert = ->
      temp = parseInt $scope.temp, 10
      if isNaN temp then return '???'

      conv = if $scope.to is $scope.from
        temp
      else
        c["#{$scope.from}2#{$scope.to}"](temp)

      "#{+conv.toFixed 2} #{s[$scope.to]}"

    $scope.info = ->
      if $scope.from is 'F' and $scope.temp is '100'
        return "The human body temperature is 100 °F."

      if $scope.from is 'K' and $scope.temp is '0'
        return "The coldest theoretical temperature is 0 K."

      if $scope.from is 'C' and ($scope.temp is '0' or $scope.temp is '100')
        return "Water freezes at 0 °C and boils at 100 °C."

      "Let's convert some temperatures!"
