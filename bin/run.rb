#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character1 = get_character_from_user
# that_character_movies = get_character_movies_from_api(character)
character_movies = get_character_movies_from_api(character1)

print_movies(character_movies)