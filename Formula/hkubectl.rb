class Hkubectl < Formula
  desc "HKube CLI"
  homepage "https://hkube.io"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kube-HPC/hkubectl/releases/download/v1.1.71/hkubectl-macos"
      sha256 "aca5a512fc96b96ee0a9fb97e0f2fd1cbc6da7cb30235b7f8dc02cbf127a0605a5200d2fc4bc7b56ffa9ff24cf648812761ad1e33b4f7ffa46069a00c07c1795"

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
      url "https://github.com/kube-HPC/hkubectl/releases/download/v1.1.71/hkubectl-linux"
      sha256 "1d661dc97d88373b6f7a66b375bf8d027c4cabf5f661df4f86d487b8fd06627f5a25a020d81e88c3c14b8dd911ce6c155985dec42c68218843de7ef616236737"

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
