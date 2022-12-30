#language: en

@full_smoke
@marvel_public_characters
Feature: API MARVEL PUBLIC - CHARACTERS
  Me as a system user
  when requesting the endpoints
  hope the values are returned correctly

  Swagger: 'https://developer.marvel.com/docs'

  @characters.get
  Scenario Outline: Validate character search on endpoint characters.get - "<characters>"
    - The purpose of this scenario is to obtain the details of the character.

    Given that I have the character id "<characters>"
    When call the endpoint characters.get
    Then I check that the returned character is correct "<characters>"

    Examples:
      | characters      |
      | agents of atlas |
      | agent brand     |
      | balder          |
      | nonexistent     |
