# -*- coding: utf-8 -*-
require 'spec_helper'

describe RspecApiDocumentation::Writers::JsonExample do
  let(:configuration) { RspecApiDocumentation::Configuration.new }

  describe "#dirname" do
    it "strips out leading slashes" do
      example = double(resource_name: "/test_string")

      json_example =
        RspecApiDocumentation::Writers::JsonExample.new(example, configuration)

      expect(json_example.dirname).to eq "test_string"
    end

    it "does not strip out non-leading slashes" do
      example = double(resource_name: "test_string/test")

      json_example =
        RspecApiDocumentation::Writers::JsonExample.new(example, configuration)

      expect(json_example.dirname).to eq "test_string/test"
    end
  end

  describe '#filename' do
    specify 'Hello!/ 世界' do |example|
      expect(described_class.new(example, configuration).filename).to eq("hello.json")
    end
  end
end
