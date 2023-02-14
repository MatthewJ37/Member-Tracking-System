# test for event model 
require 'rails_helper'

RSpec.describe Event, type: :model do 
    subject {
        described_class.new(name: "Wayland Moody", date: "2023-02-09", point_type: "Outreach" , event_type: "Service" , phrase: "1234")
    }
        # resets attributes before test to ensure they are not changed 
        before do 
            subject.name = "Wayland Moody"
            subject.date = "2023-02-09"
            subject.event_type = "Service"
        end

        # when all inputs are entered it should be valid
        it "is valid with valid attributes" do
            expect(subject).to be_valid
        end

        it "is not valid without date" do
            subject.date = nil
            expect(subject).not_to be_valid
        end
        
        it "is not valid without name" do
            subject.name = nil
            expect(subject).not_to be_valid
        end
        
        it "is not valid without event_type" do
            subject.event_type = nil
            expect(subject).not_to be_valid
        end

        # if there is a meeting there needs to be a phrase 
        context "when event_type is Meeting" do 
            before do
                subject.event_type = "Meeting"
                subject.phrase = nil
            end

            it "is not valid when there is not phrase" do
                subject.phrase = nil
                expect(subject).not_to be_valid
            end

        end

        # if there is a service there needs to be a point type
        context "when event_type is Service" do
            before do
                subject.event_type = "Service"
                subject.point_type = nil
            end

            it "is not valid when there is not a point_type" do
                subject.point_type = nil
                expect(subject).not_to be_valid
            end
        end
        # if service needs to be point_type

        # right now it is set up to where you can enter point_type with meeting as the event type but it is changed
        # before it is entered into the database. The same goes for phrase and Service
end