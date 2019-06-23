# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Spacedrepetition < Formula
  desc ""
  homepage ""
  url "https://github.com/prathik/spacedrepetition/archive/v0.0.2-alpha.tar.gz"
  version "1.0.1"
  sha256 "7464ef77744f9c127b9aa2eae169126e7d6fc306279f8290bb8c0a031e65abd3"
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/prathik/spacedrepetition").install Dir["*"]
    opoo buildpath
    cd buildpath/"src/github.com/prathik/spacedrepetition" do
      system "go", "get", "./..."
      system "go", "build", "-o", bin/"sr"
      prefix.install_metafiles
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test spacedrepetition`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "sr add 'test'"
    system "sr all"
  end
end
