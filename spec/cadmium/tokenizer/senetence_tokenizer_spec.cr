require "../../spec_helper"

describe Cadmium::Tokenizer::SentenceTokenizer do
  subject = Cadmium::Tokenizer::SentenceTokenizer.new

  it "should tokenize strings and trim whitespace" do
    subject.tokenize("This is a sentence. This is another sentence.").should eq(["This is a sentence.", "This is another sentence."])
  end

  it "should tokenize strings via String#tokenize" do
    "This is a sentence. This is another sentence.".tokenize(Cadmium::Tokenizer::SentenceTokenizer).should eq(["This is a sentence.", "This is another sentence."])
  end

  it "should include quotation marks" do
    subject.tokenize(%{"This is a sentence." This is another sentence.}).should eq(["\"This is a sentence.\"", "This is another sentence."])
  end

  it "should include brackets" do
    subject.tokenize("This is a sentence. [This is another sentence.]").should eq(["This is a sentence.", "[This is another sentence.]"])
  end
end
