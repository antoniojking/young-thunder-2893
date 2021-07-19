require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Universal City')
    @studio_2 = Studio.create!(name: 'Warner Brothers', location: 'Hollywood')
    @studio_3 = Studio.create!(name: 'Pixar Animation', location: 'Anaheim')
    @movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @studio_1.movies.create!(title: 'Tomb Raider', creation_year: 2001, genre: 'Action/Adventure')
    @movie_3 = @studio_1.movies.create!(title: 'Wedding Crashers', creation_year: 2007, genre: 'Comedy')
    @movie_4 = @studio_2.movies.create!(title: 'The Kings Speech', creation_year: 2010, genre: 'Drama')
    @movie_5 = @studio_2.movies.create!(title: 'Black Widow', creation_year: 2020, genre: 'Action/Adventure')
    @movie_6 = @studio_3.movies.create!(title: 'Luca', creation_year: 2021, genre: 'Family')
  end

  # Story 2
  # Movie Show
  #
  # As a user,
  # When I visit a movie's show page.
  # I see the movie's title, creation year, and genre,
  # and a list of all its actors from youngest to oldest.
  # And I see the average age of all of the movie's actors
  it 'shows the movie and its attributes' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
  end

  xit 'lists actors associated with each movie by age in ascending order' do

  end

  xit 'lists the average age of actors associated with the movie' do

  end
end
