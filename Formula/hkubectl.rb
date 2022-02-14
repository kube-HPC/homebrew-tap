class Hkubectl < Formula
  desc "HKube CLI"
  homepage "https://hkube.io"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kube-HPC/hkubectl/releases/download/v1.1.74/hkubectl-macos"
      sha256 "c57c05f07741de44fbf45ac6e06b0ca192af2f076e5aca91f5f1cad35262f58e"

      def install
        bin.install "hkubectl-macos" => "hkubectl"

        # Install bash completion
        output = Utils.safe_popen_read("#{bin}/hkubectl", "completion", "bash")
        (bash_completion/"hkubectl").write output

        # Install zsh completion
        output = Utils.safe_popen_read("#{bin}/hkubectl", "completion", "zsh")
        (zsh_completion/"_hkubectl").write output
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kube-HPC/hkubectl/releases/download/v1.1.74/hkubectl-linux"
      sha256 "b3e2b6fc1937df3625314175b5021ac89653159ca6893a26cd7f67bd16c8ffac"

      def install
        bin.install "hkubectl-linux" => "hkubectl"

        # Install bash completion
        output = Utils.safe_popen_read("#{bin}/hkubectl", "completion", "bash")
        (bash_completion/"hkubectl").write output

        # Install zsh completion
        output = Utils.safe_popen_read("#{bin}/hkubectl", "completion", "zsh")
        (zsh_completion/"_hkubectl").write output
      end
    end
  end
end
