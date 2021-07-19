require 'rails_helper'

RSpec.describe 'Studio Index Page' do
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

  # Story 1
  # Studio Index
  #
  # As a user,
  # When I visit the studio index page
  # I see a each studio's name and location
  # And underneath each studio, I see the titles of all of its movies.
  it 'lists all studios along with attributes and associated movie titles' do
    visit '/studios'
    # save_and_open_page
    within("#studio-#{@studio_1.id}") do
      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content(@movie_3.title)
    end

    within("#studio-#{@studio_2.id}") do
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
      expect(page).to have_content(@movie_4.title)
      expect(page).to have_content(@movie_5.title)
    end

    within("#studio-#{@studio_3.id}") do
      expect(page).to have_content(@studio_3.name)
      expect(page).to have_content(@studio_3.location)
      expect(page).to have_content(@movie_6.title)
    end
  end
end
