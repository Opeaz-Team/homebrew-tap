class Aval < Formula
  desc "Command-line client for Aval plans (get and push)"
  homepage "https://aval.opeaz.com"
  url "https://aval.opeaz.com/cli/aval-0.1.43.cjs"
  version "0.1.43"
  sha256 "615c14c0a39e7047fa3116f65c1703e3229d8da2a3ca15cd3336f09f4023c96f"
  depends_on "node"

  def install
    libexec.install "aval-#{version}.cjs" => "aval.cjs"
    (bin/"aval").write <<~SH
      #!/bin/sh
      AVAL_INSTALLED_BY=homebrew exec "#{Formula["node"].opt_bin}/node" "#{libexec}/aval.cjs" "$@"
    SH
    chmod 0755, bin/"aval"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aval --version")
  end
end
