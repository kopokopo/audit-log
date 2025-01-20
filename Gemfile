# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem "rails", "~> 8.0.1"
eval File.read(File.expand_path("Gemfile-dev", __dir__)), nil, "Gemfile-dev"
