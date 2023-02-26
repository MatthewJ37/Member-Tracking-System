require 'rails_helper'
require "support/test_user"


# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/member_events", type: :request do

    # need to run the oauth before each test 
    include_context 'test user requests'

  # This should return the minimal set of attributes required to create a valid
  # MemberEvent. As you add validations to MemberEvent, be sure to
  # adjust the attributes here as well.
  let(:member) {
    Member.create!(
      name: "MyName"
    )
  }

  let(:event) {
    Event.create!(
      name: "MyName",
      date: Date.parse("01-01-2023"),
      event_type: "MyType"
    )
  }
  
  let(:member2) {
    Member.create!(
      name: "MyName2"
    )
  }

  let(:event2) {
    Event.create!(
      name: "MyName2",
      date: Date.parse("01-01-2023"),
      event_type: "MyType"
    )
  }
  
  let(:valid_attributes) {
    {
      event_id: event.id,
      approve_by: "wayland",
      member_id: member.id,
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      MemberEvent.create! valid_attributes
      get member_events_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      member_event = MemberEvent.create! valid_attributes
      get member_event_url(member_event)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_member_event_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      member_event = MemberEvent.create! valid_attributes
      get edit_member_event_url(member_event)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MemberEvent" do
        expect {
          post member_events_url, params: { member_event: valid_attributes }
        }.to change(MemberEvent, :count).by(1)
      end

      it "redirects to the created member_event" do
        post member_events_url, params: { member_event: valid_attributes }
        expect(response).to redirect_to(member_event_url(MemberEvent.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MemberEvent" do
        expect {
          post member_events_url, params: { member_event: invalid_attributes }
        }.to change(MemberEvent, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post member_events_url, params: { member_event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          event_id: event2.id,
          member_id: member2.id,
        }
      }

      it "updates the requested member_event" do
        member_event = MemberEvent.create! valid_attributes
        patch member_event_url(member_event), params: { member_event: new_attributes }
        member_event.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the member_event" do
        member_event = MemberEvent.create! valid_attributes
        patch member_event_url(member_event), params: { member_event: new_attributes }
        member_event.reload
        expect(response).to redirect_to(member_event_url(member_event))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        member_event = MemberEvent.create! valid_attributes
        patch member_event_url(member_event), params: { member_event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested member_event" do
      member_event = MemberEvent.create! valid_attributes
      expect {
        delete member_event_url(member_event)
      }.to change(MemberEvent, :count).by(-1)
    end

    it "redirects to the member_events list" do
      member_event = MemberEvent.create! valid_attributes
      delete member_event_url(member_event)
      expect(response).to redirect_to(member_events_url)
    end
  end
end
