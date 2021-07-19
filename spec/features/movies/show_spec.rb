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
    @actor_1 = Actor.create!(name: 'Harrison Ford', age: 80)
    @actor_2 = Actor.create!(name: 'Angelina Jolie', age: 45)
    @actor_3 = Actor.create!(name: 'Owen Wilson', age: 45)
    @actor_4 = Actor.create!(name: 'Brendan Frasier', age: 50)
    @actor_5 = Actor.create!(name: 'Timothy Chalamet', age: 24)
    @actor_6 = Actor.create!(name: 'Jennifer Lawrence', age: 33)
    @actor_7 = Actor.create!(name: 'Rachel McAdams', age: 37)
    MovieActor.create!(actor: @actor_1, movie: @movie_1)
    MovieActor.create!(actor: @actor_2, movie: @movie_1)
    MovieActor.create!(actor: @actor_5, movie: @movie_1)
    MovieActor.create!(actor: @actor_2, movie: @movie_2)
    MovieActor.create!(actor: @actor_4, movie: @movie_2)
    MovieActor.create!(actor: @actor_7, movie: @movie_2)
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
    # save_and_open_page
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)

    expect(page).to_not have_content(@movie_2.title)
    expect(page).to_not have_content(@movie_3.title)
  end

  it 'lists actors associated with each movie by age in ascending order' do
    visit "/movies/#{@movie_1.id}"
    # save_and_open_page
    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_5.name)
    expect(@actor_5.name).to appear_before(@actor_2.name)
    expect(@actor_2.name).to appear_before(@actor_1.name)
  end

  xit 'lists the average age of actors associated with the movie' do

  end
end
