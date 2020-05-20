# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::AvoidRequireRailsHelper do
  subject(:cop) { described_class.new }

  it "registers an offense when require rails_helper is found" do
    expect_offense(<<~RUBY)
      require 'rails_helper'
      ^^^^^^^^^^^^^^^^^^^^^^ Don't require rails_helper in your spec. It should be in .rspec file
    RUBY
  end

  it "no offense when file is not rails_helper" do
    expect_no_offenses(<<~RUBY)
      require "some_other_file"
    RUBY
  end
end
