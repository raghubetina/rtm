require "rails_helper"

RSpec.describe TaskResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "tasks",
          attributes: {},
        },
      }
    end

    let(:instance) do
      TaskResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Task.count }.by(1)
    end
  end

  describe "updating" do
    let!(:task) { create(:task) }

    let(:payload) do
      {
        data: {
          id: task.id.to_s,
          type: "tasks",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      TaskResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { task.reload.updated_at }
      # .and change { task.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:task) { create(:task) }

    let(:instance) do
      TaskResource.find(id: task.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Task.count }.by(-1)
    end
  end
end
