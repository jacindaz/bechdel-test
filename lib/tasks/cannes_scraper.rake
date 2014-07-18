require "cannes_scraping"

desc "This task is called by the Heroku scheduler add-on"
  namespace :canne do
    task :scrape => :environment do
      scraper = CannesScraping.new(2014, 1)
      scraper.save_cannes
    end
  end