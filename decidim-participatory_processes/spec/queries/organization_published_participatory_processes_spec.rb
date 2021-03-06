# frozen_string_literal: true

require "spec_helper"

describe Decidim::ParticipatoryProcesses::OrganizationPublishedParticipatoryProcesses do
  subject { described_class.new(organization) }

  let!(:organization) { create(:organization) }
  let!(:published_participatory_processes) do
    create_list(:participatory_process,
                3,
                :published,
                organization: organization)
  end

  let!(:unpublished_participatory_processes) do
    create_list(:participatory_process,
                3,
                :unpublished,
                organization: organization)
  end

  let!(:foreign_participatory_processes) do
    create_list(:participatory_process, 3, :published)
  end

  describe "query" do
    it "includes the organization's published processes" do
      expect(subject).to include(*published_participatory_processes)
    end

    it "excludes the organization's unpublished processes" do
      expect(subject).not_to include(*unpublished_participatory_processes)
    end

    it "excludes other organization's published processes" do
      expect(subject).not_to include(*foreign_participatory_processes)
    end
  end
end
