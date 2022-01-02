cask "mounty" do
  if MacOS.version <= :catalina
    version "1.9"
    sha256 "5fcedfe712f59c14f39c3385dfed9aebc99d4e8d88f6e870f364cc48624590ef"

    livecheck do
      skip "newer versions only available for Big Sur or higher"
    end
  else
    version "1.13"
    sha256 "c42980bf69eb98d5faeecf54d3b89f92a90dbc54986118dd597e1ea10110aeda"

    livecheck do
      url :homepage
      regex(/Latest\s+version:\s*(\d+(?:\.\d+)+)/i)
    end
  end

  url "https://mounty.app/releases/Mounty-#{version}.dmg"
  name "Mounty for NTFS"
  desc "Re-mounts write-protected NTFS volumes"
  homepage "https://mounty.app/"

  app "Mounty.app"

  zap trash: "~/Library/Preferences/com.cu4uc.mounty.plist"
end
