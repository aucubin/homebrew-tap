cask "zmk-battery-applet" do
  version "0.1.1"
  sha256 "7db16c38cbcf3db1730a1b2e4c340517c5cea4a7842309f618abf914dae25ae1"

  url "https://github.com/aucubin/zmk-battery-applet/releases/download/v#{version}/zmk-battery-applet-macos-universal.zip"
  name "ZMK Battery"
  desc "Menu bar applet showing the battery level of ZMK split keyboards"
  homepage "https://github.com/aucubin/zmk-battery-applet"

  depends_on macos: ">= :big_sur"

  app "ZMK Battery.app"

  # The app is only ad-hoc signed, so Gatekeeper would report it as damaged.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ZMK Battery.app"]
  end

  uninstall quit: "de.aucubin.zmk-battery-applet"
end
