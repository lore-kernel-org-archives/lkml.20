Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686428;
	b=mHXbI1X4lV39rG31qAF42Gga+WGaM8Jtqk7JuNhhZzcpKYi6EWU5C5FMiBkCeBiSfCI6
	 7ljxA+peI5HQ6DULM3WDwAzMx4e04gLfrlfTSI0NCVYTSyioqOHPLZxArUw1tjJZkF44A
	 MZNgG3RYVyTmJ92zIC676lU+/OgkU7nRdQeU9vnkWE0HyhuniQY1UPnnpNrEvq1kKe/mM
	 +dz3B5k8A9M/CHwZ/Z4dUcKItfV8iBE2fToK7qPFSmW4IP7w05+ObxNFhXaV2oZmdWhTI
	 voxeWRMI3ChCj/GdEGg7EAgdZ7KAeTJjClNfQKzBCGayP4piFVHApTHjM8jzqxfSxHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686428;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=2ff+/gIuPzFUbS2DDhHVsYfcXhgHpPTspCAbttWyAOk=;
	b=nJFpdxGq8vjj9A2poa68S51fKQH9G42JWTSYUHGKCccAW7jK1TSz5GWsAnl5bxZk25R4
	 TFm/gKqJ9ocD9ACgVhG5jS1/m8QUGPvt7vzA2EPNyt0iuql8JXTYxTjWlb3CG7qWMojjc
	 ZSjm7nsKaWsBKmIkisB0+7Z3Wl4PJIQWBHMAUSynmbCsqTq/6tDzamxCDDuAMldSxrXq5
	 WQLvBeZuz4HQr0WMoSrM7XYIQamBT7LHfNv88AB5inHlh/5qjhMGmoZzQLmXgWWFxHUDD
	 i9ULG7t1XDW81H8aooQ8ub/ayYo0IPgrg/JgFoEVGuWmgTRR83l/8whbXucsFgpZYWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GcisWyIz;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCDC606A31F;
	Thu, 22 Oct 2026 16:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDCDC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GcisWyIz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=2ff+/gIuPzFUbS2DDhHVsYfcXhgHpPTspCAbttWyAOk=;
	b=GcisWyIzH7aZnD1hBCyiC6mbByNEXjGdwo4D7W+R+2cG/q+b04ErCihKmJoQ8l
	O1DFs9ZD4gmC8aUj5VOwDjX+vBXHmpfeSrVT4Zkm24hKlMgAJh+1XR8Zy5sg0jpo
	V2rVfGeCWyCWVqSnTnBpAW5OJ1kc0kLsRaIwLYvTtccco=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnPxIuOdpqqEgDCA--.49816S2;
	Fri, 23 Oct 2026 00:26:23 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v10 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Fri, 23 Oct 2026 00:26:19 +0800
Message-Id: <20261023-quarkpi-ca2-v10-0-9db904194e03@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACs52moC/33NSw6CMBCA4auYrq2ZDrQFV97DuOhLrUbAFoiGc
 Hcpxigbk25mMt/fgUQXvItkuxpIcL2Pvq6mgcF6RcxZVSdHvZ0WBAEFA8jpvVPh2nhqFFJkFhU
 vDQeTkUk0wR39Y87tD+85dvriTJsS6eLsY1uH5/xfL9PdpywX5V6mB1QVuRGWW+GOYsdEtjH1j
 aR0X/zBxSR1kbEStbMg9VKWPxLZUpZJSg4gNKI2/CvHcXwBFvUVsi4BAAA=
X-Change-ID: 20261004-quarkpi-ca2-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wDnPxIuOdpqqEgDCA--.49816S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3uw48uF15AryfCF1fCFyUKFg_yoWDuF48pF
	ZxXrs8Jrs8GryIgan7Cw47Za4rZa18Jw4agr1kJ34Fva1YvF18Arna9r4Yqa4jkr95Kw1j
	qFsxWa48Ka4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUU8n5UUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3RCrGWraOTAmkQAA3x

This series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer. The binding patch documents the board, the DTS
patch describes the hardware.

The DTS was rebuilt from scratch against the vendor 5.10 BSP device tree
and then translated to current mainline bindings, so that every node and
property has a vendor-side or schematic origin instead of being carried
over from the earlier revisions.

Changes in v10:
- Add the Acked-by tag from Conor Dooley, which I missed.
- Add the missing domain-supply for the GPU and NPU power domains.  Without
  it the power domain driver falls back to a dummy regulator for both.
- Enable the three NPU IOMMUs the enabled NPU cores reference.  Without them
  opening /dev/accel/accel0 fails with -ENODEV.
- Link to v9: https://patch.msgid.link/20261021-quarkpi-ca2-v9-0-b75006b22bc5@163.com

Testing: boots from microSD with this series on a v7.3 kernel, and the
on-board hardware (microSD, eMMC, HDMI, USB-C DP altmode, USB 3.0 and
USB 2.0, PCIe Wi-Fi, Bluetooth, GbE, ES8388 playback, PWM fan) works;
"make CHECK_DTBS=y" is clean.  The NPU works on this revision (all three
cores detected, IOMMUs attached, /dev/accel/accel0 opens, MNIST classifier
95.00% correct on 200 images), and so do the H.264, HEVC, VP8 and AV1
decode paths.

Note: there is no fiq_debugger node, so the debug console is ttyS2 and
console=ttyS2,1500000 has to be added to the bootargs manually.  Capture
from the headset microphone does not work with the in-tree es8328 driver;
that is fixed by a separate ASoC patch series (sound/soc/codecs/es8328.c)
and does not affect playback.

Changes in v9:
- SD card: drop enable-active-high again, the power switch of the card
  slot (vcc_3v3_sd_s0) is active low.  The v8 conclusion that it was missing
  came from a test run with the wrong DTB loaded; with the property present the
  regulator core drives the enable pin high and the card's rail stays off.
- Audio: the I2S0 MCLK pinmux moved from the I2S controller node to the codec node.
Link to v8: https://lore.kernel.org/all/20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com/

Changes in v8:
- SD card: add the missing enable-active-high to the SD card power switch
  (vcc_3v3_sd_s0).  Without it of_gpio_quirk_polarity() forces
  OF_GPIO_ACTIVE_LOW onto the GPIO descriptor, so enabling the regulator
  switched the rail off instead of on and the card lost its power.
  Reported by the sashiko review; verified on hardware, the board now
  boots from an SD card:
  https://lore.kernel.org/all/sashiko-outbox-162297@kernel.org/
- SPI0: describe the two chip selects as GPIOs (cs-gpios) instead of
  muxing the dedicated SPI0_CS0_M3 / SPI0_CS1_M3 pins, so that both chip
  select lines stay usable from the 40-pin header.  Verified on hardware:
  both lines are claimed by the SPI core.
- Link to v7:
  https://lore.kernel.org/all/20261007-quarkpi-ca2-v7-v7-0-a84c6d5d6ef6@163.com/

Changes in v7:
- Rebuilt the board DTS from the vendor 5.10 BSP device tree.
- USB-C: the connector now describes data-role "dual" with role-switch and
  DP-altmode endpoints, the dwc3 uses usb-role-switch, and the VBUS switch
  is marked enable-active-high.  v5 had set data-role "host", following the
  vendor configuration; the port is a dual-role connector and the tested
  behaviour is host mode with DP altmode on an attached display.
  https://lore.kernel.org/all/20261001140429.1710C1F000FF@smtp.kernel.org/
  https://lore.kernel.org/all/20260927140406.5C3381F000FF@smtp.kernel.org/
- GbE: the RGMII delays are now documented as PHY-side only, matching
  "rgmii-id" in the DTS; re-measured with this setting, a 500 MB transfer
  completed with zero retransmissions.
  https://lore.kernel.org/all/80eceb66-b573-463a-a577-30ba5793dbc4@lunn.ch/
  https://lore.kernel.org/all/20261001153113.E4B131F000FF@smtp.kernel.org/
- Audio: both the codec and the amplifier paths to the jack are kept,
  with the hardware evidence in the patch description.
  https://lore.kernel.org/all/20261001140429.1710C1F000FF@smtp.kernel.org/
- Codec: the compatible list is "everest,es8388", "everest,es8328".
  https://lore.kernel.org/all/20260927125456.4D5501F000FF@smtp.kernel.org/
  https://lore.kernel.org/all/20260927140406.5C3381F000FF@smtp.kernel.org/
- Microphone wiring matches the board schematic: the microphone signal
  (HP_MIC) is on LINPUT1 and its reference (HP_MIC_GND) on RINPUT1.
- rk806 DVS1 pin names, node names, indentation, blank lines and
  regulator prefixes cleaned up to match the mainline style.
  https://lore.kernel.org/all/20260927125456.4D5501F000FF@smtp.kernel.org/
  https://lore.kernel.org/all/20260929-analytic-cocky-magpie-afefcc@quoll/
- Recipients collected with "b4 prep --auto-to-cc".
  https://lore.kernel.org/all/20260929-ambitious-festive-orca-b59ffe@quoll/
- Link to v6:
  https://lore.kernel.org/all/20261002-b4-quarkpi-ca2-v6-0-9fc33f27ebb9@163.com/

Changes in v6:
- My oversight, sorry for the noise: when I switched phy-mode to "rgmii-id"
  in v5 I forgot to update the commit message of patch 2/2 at the same time,
  so the message still described the v3/v4 approach (delays applied on the
  MAC side) while the code had moved to the PHY-side delays.  The message now
  describes what the code does: the PHY adds the delays internally and the
  MAC adds none, so nothing is applied twice.  The device tree is not touched
  by this change; the compiled .dtb is byte-for-byte identical to the one in
  v5 (verified).
- Keep the headphone routing as in v5.  On this board the 3.5 mm jack needs
  the direct codec output routes: describing only the amplifier path gives
  no output at the jack, which I verified on hardware with a test tone and
  with music playback.  So the parallel routes are intentional here and
  were not changed.
- Link to v5: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077620.html

Changes in v5:
- Use phy-mode = "rgmii-id" and let the PHY add the RGMII delays, instead of
  "rgmii" with the delay applied on the MAC side, as pointed out by Andrew
  Lunn.  The MAC adds no delay in this mode, so nothing is applied twice;
  see the GbE note above for the details and the measurements.
- Move the Makefile entry so that the list stays in alphabetical order.
- Rename the headphone amplifier node to the generic name "audio-amplifier";
  the labels are unchanged, so no reference is affected.  The audio routing
  itself is unchanged, see the note above.
- Set the Type-C connector data-role to "host".  The XHCI controller is
  host-only on this board (dr_mode = "host" and no usb-role-switch), and
  the vendor DT lists "dual" only because the vendor configures that
  controller as OTG.  The power role stays "dual", as the board can be
  powered over Type-C.
- Link to v4: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077616.html

Changes in v4:
- Add the missing blank line between the include block and the root node.
- Fix the node indentation in a few places.  That cleanup is whitespace only;
  the compiled .dtb is unchanged by it (verified byte-for-byte).
- Rename the Type-C controller node to the generic name "typec-port", as the
  other boards using this part do, and drop its redundant status property.
- Give the fixed regulator nodes the "regulator-" name prefix, as the other
  boards do; the labels are unchanged, so no reference is affected.
- Route the Type-C SuperSpeed lanes through the USBDP PHY, as the other
  RK3588 boards do, so that the PHY does the orientation muxing.
- Feed the headphone amplifier from one codec output pair only; that is what
  the other ES8388 boards do.
- Cc the people and lists reported by scripts/get_maintainer.pl.
- Link to v3: https://lists.infradead.org/pipermail/linux-rockchip/2026-October/077611.html

Changes in v3:
- Rebase onto current mainline and re-run dtbs_check.
- Drop the explanatory device tree comments, as requested.  The rationale
  that was in them is in this cover letter instead; the compiled .dtb is
  unchanged by that cleanup (verified byte-for-byte).
- Use phy-mode = "rgmii" with the RGMII delay applied on the MAC side
  instead of "rgmii-rxid", as pointed out by Andrew Lunn: phy-mode
  describes the PCB wiring, and only one side should add the delay.
- Rename the fixed regulators that used a different naming scheme so that
  all of them follow the same style, and use generic node names.
- Drop two redundant "status = \"okay\"" properties (rga3_core0 and
  rga3_core1 are already enabled in rk3588-base.dtsi).
- Add the missing "enable-active-high" to the Type-C VBUS regulator.
- Use the binding-documented codec compatible pair and drop the
  "clock-names" property, which everest,es8328.yaml does not allow; the
  codec node now passes dtbs_check.
- Drop the phy-supply of u2phy0_otg, the USB 2.0 PHY of the USB-C OTG
  port.  That rail is the Type-C VBUS and is already owned by the TCPC;
  while the PHY held it enabled as well, VBUS was powered from boot, the
  TCPM state machine never saw a VBUS-off event, and the port could not
  finish a source attach, so DisplayPort altmode never came up (the
  monitor had power but no picture).  Verified on hardware: the port now
  attaches at boot and the monitor gets a picture.
- Add the LED color so the work LED is exposed as "green:heartbeat".
- Drop the camera sensor and its regulator: camera modules are plug-in
  devices, and enabling the CSI-2 receiver without a sensor attached makes
  the driver fail to find its endpoint at probe.  Following the vendor
  tree, camera and panel descriptions belong in overlays.

Changes in v2:
- Fix the RK806 DVS1 pin configuration: dvs1-null-pins used
  "gpio_pwrctrl2" instead of "gpio_pwrctrl1", as reported by the
  sashiko review.
- Translate all device tree comments to English, and drop a stale
  comment that no longer matched the Type-C / USB3 nodes.  Comment
  changes only: the code is otherwise byte-for-byte identical to v1.

Please review.

---
Bob Hui (2):
      dt-bindings: arm: rockchip: Add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1228 ++++++++++++++++++++
 3 files changed, 1234 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261004-quarkpi-ca2-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>

