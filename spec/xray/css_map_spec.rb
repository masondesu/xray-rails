require 'spec_helper'

describe "Xray CSS Mapping" do
  before { visit '/' }

  # The basics

  it "adds class-based selectors to the map" do
    find('#xray-css-mapping-script').should have_text('.dummy-class-2')
  end

  it "adds id-based selectors to the map" do
    find('#xray-css-mapping-script').should have_text('#dummy-id')
  end

  it "doesn't add element-based selectors to the map" do
    find('#xray-css-mapping-script').should_not have_text('blockquote')
  end

  it "doesn't add properties to the map" do
    find('#xray-css-mapping-script').should_not have_text('display')
  end

  it "matches selectors regardless of case" do
    pending
  end

  # Comment exclusion

  it "doesn't add text from comment blocks to the map" do
    find('#xray-css-mapping-script').should_not have_text('http://fakewebsite.com/this/should/not/appear/in/the/css_map/')
    find('#xray-css-mapping-script').should_not have_text('fakewebsite.com')
    find('#xray-css-mapping-script').should_not have_text('not')
    find('#xray-css-mapping-script').should_not have_text('20392')
  end

  it "doesn't add text from single line comments" do
    find('#xray-css-mapping-script').should_not have_text('Spoof')
    find('#xray-css-mapping-script').should_not have_text('and')
    find('#xray-css-mapping-script').should_not have_text('goof')
  end

  # Selectors after comments

  it "should add selectors immediately following single line comments" do
    find('#xray-css-mapping-script').should have_text('.dummy-class-after-single-line-comment')
  end

  it "should add selectors immediately following multi line comments" do
    find('#xray-css-mapping-script').should have_text('.dummy-class-after-multi-line-comment')
  end

  # I added the following two tests because I was doubtful that the selector
  # regex was catching the first selector correctly in every circumstance

  it "adds the first class-based selector in file to the map" do
    find('#xray-css-mapping-script').should have_text('.dummy-class-1')
  end

  it "adds the first id-based selector in the file to the map" do
    find('#xray-css-mapping-script').should have_text('#secondary-dummy-id')
  end

  # Multiple files

  it "adds selectors from multiple files to the map" do
    find('#xray-css-mapping-script').should have_text('.dummy-class-4')
    find('#xray-css-mapping-script').should have_text('.secondary-dummy-class-1')
  end

  # Mapping accuracy

  it "accurately maps selectors to the correct file" do
    pending "What's the smartest way to check that this is accurate?"
  end

end
