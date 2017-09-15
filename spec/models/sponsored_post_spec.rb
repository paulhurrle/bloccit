require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
    let(:title) { RandomData.random_sentence }
    let(:body) { RandomData.random_paragraph }
    let(:sp_post) { SponsoredPost.create!(title: title, body: body, price: 99) }

    it { is_expected.to belong_to(:topic) }

    describe "attributes" do
        it "has title, body, and price attributes" do
            expect(sp_post).to have_attributes(title: title, body: body, price: 99)
        end
    end
end
