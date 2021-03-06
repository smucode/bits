'use strict'

describe 'Controller: GravatarCtrl', () ->

  # load the controller's module
  beforeEach module 'bitsApp'

  GravatarCtrl = {}
  scope = {}
  $httpBackend = {}

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/api/awesomeThings').respond ['HTML5 Boilerplate', 'AngularJS', 'Karma', 'Express']
    scope = $rootScope.$new()
    GravatarCtrl = $controller 'GravatarCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->

