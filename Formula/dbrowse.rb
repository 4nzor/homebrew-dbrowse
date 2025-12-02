# Homebrew formula for dbrowse
# 
# For local installation:
#   brew install --build-from-source ./Formula/dbrowse.rb
#
# For tap installation (after creating homebrew-dbrowse repo):
#   brew tap 4nzor/dbrowse
#   brew install dbrowse

class Dbrowse < Formula
  desc "Terminal-based database management utility (TUI) for multiple database types"
  homepage "https://github.com/4nzor/dbrowse"
  url "https://github.com/4nzor/dbrowse/archive/refs/tags/v0.1.0.tar.gz"
  sha256 ""  # Will be filled after first release - use: make sha256 VERSION=0.1.0
  license "MIT"
  head "https://github.com/4nzor/dbrowse.git", branch: "main"

  depends_on "python@3.10"

  def install
    python3 = "python3.10"
    venv = virtualenv_create(libexec, python3)
    
    # Install requirements first
    requirements = buildpath/"requirements.txt"
    venv.pip_install requirements.read if requirements.exist?
    
    # Install the package
    venv.pip_install_and_link buildpath
  end

  test do
    # Test that the command exists and shows help
    system "#{bin}/dbrowse", "--help"
  end
end

