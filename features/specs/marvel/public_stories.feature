#language: en

@full_smoke
@marvel_public_stories
Feature: API MARVEL PUBLIC - STORIES
  Me as a system user
  when requesting the endpoints
  hope the values are returned correctly

  Swagger: 'https://developer.marvel.com/docs'

  @stories.get
  Scenario Outline: Validate endpoint stories.get return limits - "<maximum_registration>"
    - The purpose of this scenario is to validate the number of records returned by the endpoint.

    Given that I have the record limit data "<maximum_registration>"
    When call the endpoint stories.get
    Then i check that the limit of returned records is ok "<maximum_registration>"

    Examples:
      | maximum_registration |
      | 5                    |
      | 1                    |
