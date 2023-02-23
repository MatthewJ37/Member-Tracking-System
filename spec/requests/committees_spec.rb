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

RSpec.describe "/committees", type: :request do

  # need to run the oauth before each test 
  include_context 'test user requests'
  
  # This should return the minimal set of attributes required to create a valid
  # Committee. As you add validations to Committee, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: "Name"
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Committee.create! valid_attributes
      get committees_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      committee = Committee.create! valid_attributes
      get committee_url(committee)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_committee_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      committee = Committee.create! valid_attributes
      get edit_committee_url(committee)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Committee" do
        expect {
          post committees_url, params: { committee: valid_attributes }
        }.to change(Committee, :count).by(1)
      end

      it "redirects to the created committee" do
        post committees_url, params: { committee: valid_attributes }
        expect(response).to redirect_to(committee_url(Committee.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Committee" do
        expect {
          post committees_url, params: { committee: invalid_attributes }
        }.to change(Committee, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post committees_url, params: { committee: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "Name2"
        }
      }

      it "updates the requested committee" do
        committee = Committee.create! valid_attributes
        patch committee_url(committee), params: { committee: new_attributes }
        committee.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the committee" do
        committee = Committee.create! valid_attributes
        patch committee_url(committee), params: { committee: new_attributes }
        committee.reload
        expect(response).to redirect_to(committee_url(committee))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        committee = Committee.create! valid_attributes
        patch committee_url(committee), params: { committee: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested committee" do
      committee = Committee.create! valid_attributes
      expect {
        delete committee_url(committee)
      }.to change(Committee, :count).by(-1)
    end

    it "redirects to the committees list" do
      committee = Committee.create! valid_attributes
      delete committee_url(committee)
      expect(response).to redirect_to(committees_url)
    end
  end
end
