require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_many(:taggings) }
  it { should have_many(:tags) }

  it "has a valid factory" do
    expect(FactoryGirl.create(:post)).to(be_valid)
  end
end
