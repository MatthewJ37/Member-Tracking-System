require 'rails_helper'

RSpec.describe 'excuses/new', type: :view do

  let!(:member) { Member.create!(name: 'MyName1') }
  let!(:event) do
    Event.create!(
      name: 'Park clean up',
      date: Date.parse('2022-12-15'),
      point_type: 'Outreach',
      event_type: 'Service'
    )
  end

  before(:each) do
    assign(:excuse, Excuse.new(
      description: 'MyText',
      event_id: event.id,
      member_id: member.id,
      file: nil
    ))
  end

  it 'renders new excuse form' do
    render

    assert_select 'form[action=?][method=?]', excuses_path, 'post' do

      assert_select 'textarea[name=?]', 'excuse[description]'

      assert_select 'input[name=?]', 'excuse[file]'
    end
  end
end
