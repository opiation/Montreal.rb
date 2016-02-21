require "rails_helper"

RSpec.describe NewsItem, type: :model do
  describe ".published" do
    # Published
    let(:recent_item) { create(:news_item, :published) }
    let(:older_item) { create(:news_item, :published, published_at: 1.year.ago) }
    # Unpublished
    let(:archived_item) { create(:news_item, :archived) }
    let(:draft_item) { create(:news_item, :draft) }

    it "returns a sorted array of most recently published items first" do
      expect(NewsItem.published).to eq [recent_item, older_item]
    end

    it "does not return archived items" do
      expect(NewsItem.published).not_to include archived_item
    end

    it "does not return draft items" do
      expect(NewsItem.published).not_to include draft_item
    end
  end
end
