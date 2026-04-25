class Cortex < Formula
  desc "Project memory — doctrine, map, plans, journal. Reflective layer of the autumngarage composition."
  homepage "https://github.com/autumngarage/cortex"
  url "https://github.com/autumngarage/cortex/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "ec426ba25083b97093a1045196f189ba453582b468484ffaacecf18ba4a4a708"
  license "MIT"

  depends_on "python@3.11"
  depends_on "uv"

  # Optional — `cortex grep` shells out to ripgrep. Other commands work
  # without it, so it's recommended, not required.
  depends_on "ripgrep" => :recommended

  def install
    venv = libexec/"venv"
    system "uv", "venv", venv, "--python", "python3.11"
    system "uv", "pip", "install", ".", "--python", venv/"bin/python"
    bin.install_symlink venv/"bin/cortex"
  end

  def caveats
    <<~'EOS'
      cortex
        ___ ___  ___ _____ _____  __
       / __/ _ \| _ \_   _| __\ \/ /
      | (_| (_) |   / | | | _| >  <
       \___\___/|_|_\ |_| |___/_/\_\

      Get started:
        cd your-project
        cortex init
        cortex doctor    # verify the scaffold
        cortex           # status summary (active plans, journal activity, digest age)

      Cortex is the reflective layer of the autumngarage trio. Each tool stands
      alone; installed together they compose by file contract, not code:

        brew install autumngarage/touchstone/touchstone   # standards + pre-push review
        brew install autumngarage/sentinel/sentinel       # autonomous agent cycles
        brew install autumngarage/cortex/cortex           # this package

      Cortex reads .sentinel/runs/ and respects .touchstone-config when present.
      Neither is required — Cortex degrades gracefully if either is missing.

      Ships targeting SPEC v0.3.1-dev and Protocol v0.2.0. See:
        https://github.com/autumngarage/cortex#readme
    EOS
  end

  test do
    assert_match "cortex #{version}", shell_output("#{bin}/cortex version")
  end
end
