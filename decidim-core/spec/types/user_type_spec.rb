# frozen_string_literal: true
require "spec_helper"
require "decidim/api/test/type_context"

module Decidim
  describe UserType, type: :graphql do
    include_context "graphql type"

    let(:model) { create(:user) }

    describe "name" do
      let(:query) { "{ name }" }

      it "returns all the required fields" do
        expect(response).to include("name" => model.name)
      end
    end
  end
end