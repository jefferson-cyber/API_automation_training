#@api
Feature: API

  Scenario: api get
    Given I want to get the users
    When I send an api request
    Then the response is a success

  Scenario: api post
    Given I want to add a user
    When I send an api request
    Then the user is added

  Scenario: api put
    Given I want to update a user
    When I send an api request
    And the response is a success
    Then the user is updated

  Scenario: api get with parameters
    Given I want to get the users with parameters
    And I want to get "3" pages with "4" users per page
    When I send an api request
    And the response is a success
    Then the response displays "3" pages with "4" users per page

  Scenario: api delete
    Given I want to delete a user
    When I send an api request
    Then the user is deleted

  @api
  Scenario Outline:
    Given I want to register a user with email <email> and password <password>
    When I send an api request
    Then the following <error_message> is returned

    Examples:
      | email                   | password          | error_message             |
      |                         | password1         | Missing email or username |
      | email@address.com       |                   | Missing password          |

