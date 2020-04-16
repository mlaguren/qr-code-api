require "valid_url"

describe ValidUrl do

  describe ".check" do
    context "given a www compliant url" do
      it "returns true" do
        expect(ValidUrl.check("https://www.example.com")).to eq true
      end
    end

    context "given an non www compliant url" do
      it "returns true" do
        expect(ValidUrl.check("https://example.com")).to eq true
      end
    end

    context "given a non secure url" do
      it "returns true" do
        expect(ValidUrl.check("http://example.com")).to eq true
      end
    end

    context "given an invalid www url" do
      it "returns false" do
        expect(ValidUrl.check("test")).to eq false
      end
    end

    context "given a valid url with a path" do
      it "returns true" do
        expect(ValidUrl.check("https://example.com/some_path")).to eq true
      end
    end
  end
end