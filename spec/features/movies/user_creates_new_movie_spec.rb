require 'rails_helper'

feature 'user creates a new movie' do

  context 'as an authenticated user' do
    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in(user)
    end

    scenario 'user creates a new movie using a form' do
      movie = FactoryGirl.build(:movie)
      visit new_movie_path

      puts "Movie title: #{movie.title}, Year: #{movie.year}"

      fill_in "Title", with: movie.title
      select movie.year, from: "Year"
      fill_in "Summary", with: movie.summary
      select movie.language, from: "Language"
      select movie.country_produced, from: "Country"
      click_on "Submit New Movie"

      expect(page).to have_content "Movie saved."
      expect(page).to have_content movie.title.upcase
      expect(page).to have_content movie.year
      expect(page).to have_content movie.summary
    end

    scenario 'user enters a blank movie' do
      visit new_movie_path
      click_on "Submit New Movie"
      expect(page).to have_content "Movie not saved."
    end

  end
end
