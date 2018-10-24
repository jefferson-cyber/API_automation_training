@api
Feature: API

  Scenario: api get
    Given I want to get the users
    When I send an api request
    Then the response is a success

  Scenario: api post
    Given I want to add a user
    When I send an api request
    Then the user is added