# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'create member' do
    let(:user) { create(:user) }
    let(:member_attributes) { { name: 'Person One', website_url: 'http://www.my-url.com', user_id: user.id } }

    it 'succeeds when required fields are present' do
      expect(Member.create!(member_attributes)).to be_truthy
    end

    it 'fails when required fields are not present' do
      expect { Member.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'fails when there it another member with the same name and url' do
      expect(Member.create!(member_attributes)).to be_truthy
      expect { Member.create!(member_attributes) }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
