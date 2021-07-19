require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:actors).through(:movie_actors) }
  end

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

  # it 'lists actors associated with the movie by age from youngest to oldest' do
  #   expect(@movie_1.order_actors_by_age.length).to eq(3)
  #   expect(@movie_1.order_actors_by_age.first).to eq(@actor_5.name)
  #   expect(@movie_1.order_actors_by_age.last).to eq(@actor_1.name)
  # end
end
