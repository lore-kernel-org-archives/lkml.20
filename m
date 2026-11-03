Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713487;
	b=klgNRUmguIfNv5csOL9llQf/D+uWyxdJAwwfbTaKRhvbgI/6rAX8ABmpFs+DTKk1n57S
	 CuxMntGuSjoTabC0HpDon/DbwefiBSaWtxUvBwAyyimsC8wxZ1ykcr1Brj17sPYxj0EeK
	 z67cGFUisrKMIa5SOZeKO93O7izNJLgzjYD7Uy21wJNMQHSozP/JJ8fjUNV5dErXn5IYY
	 SEvOs5LViAojhNk9Yg3nV77PiQt34tprReQohapH1lm5oDyd/qxgU/jZ580Pyjc6JZ0ud
	 7zt+U47sjZbj307yoCYs4nYtSH8TPZ+NlDnlPT07Plkj7fXaZuj4VRRIjFHoR69VWdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713487;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=OFa9NYwblVXsNxwCmedAg15Dy8pvSEcHS+ZvMp80oKE=;
	b=t4fntBd1deiiYXrO0YPGeZaxc17+zveIZAjpmewtD4uX7TiNrHh3zYr4udBqlExQ95wZ
	 NXXLb1EdIJdrEan7rVk/KNrepMgF6F3CFvSZHP3WGEUs1L5Nx0QwIAlQPpLmqqHoO3oxJ
	 5Fwvm2pCYz0XI7oI/pZheT9Kg8j9mw4BFNl4bVL00RX/LZe/qe2SC8CBN5Ja7bAO5v1hW
	 F8YIrWzsEcgfV0IJ21wkUoPhUwhxLD2Z+zcnGdrAluAg/KPwE+CazBV7TJDdKDzY/oHQY
	 ENQP8fXtn0Axo4gbOtLMKTq9/Mqh1t4cWggHAYb7YBZ2/cDj2I1BwSdWP6FMjPkMvBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gMGx3sIC;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E86606A324;
	Tue,  3 Nov 2026 13:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E86606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gMGx3sIC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=OFa9NYwblVXsNxwCmedAg15Dy8pvSEcHS+ZvMp80oKE=;
	b=gMGx3sICt1PfUThSDg7C04IZPD3ZB8b4n2bDBDcH9Cj0hQj5+mQQGDvpY/NsR4
	HcsWLjh4uYEVsD33dCrpAK3misy9zphjipA3zYnVSJbyIX5aChhLHhO+2Bx6mBYj
	WLnucJ0ITLbXahQhAcciA86JEsehtyj3LkjJIszP4pHpw=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHNzkg5elqJ57LEw--.46800S2;
	Tue, 03 Nov 2026 21:44:01 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v13 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Tue, 03 Nov 2026 21:43:58 +0800
Message-Id: <20261103-quarkpi-ca2-v13-0-ad8c30cdb67e@163.com>
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
X-B4-Tracking: v=1; b=H4sIAB7l6WoC/33NwW7DIAyA4VepOC+TbQiEnfYeUw8YyMqmNR1po
 05V3n3QaWqTQyUutvz9XMQYc4qjeNlcRI5TGtOwLwPKp43wO7d/j00KZSEISCOAar5PLn8eUuM
 dNYSBXGt9C16KIg459ul8zb1t/+bxxB/RH2uiXuzSeBzyz/W/ydS7/7JZlCdTHzSuU16HNujY6
 1fU8tkPX6Kmp+4B7orkTqIljgEML6W9k4RLaas0LYBmIvbtUiLcU7mkCMXawBYUWhVBrizebME
 ri8VGJqXBaNdRv7L0yFKxwSgbLDNxb292nudfaUe8eOIBAAA=
X-Change-ID: 20261004-quarkpi-ca2-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wBHNzkg5elqJ57LEw--.46800S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFWrAr18ur4UAw45Kw45Jrb_yoW7Cr4DpF
	ZxuFs8GrsrtryI9Fs2gw1xuayIvws7JrWSqrn5J345Za1Yvr1xArySkw1FvFn8Grs5Aa4U
	Gr15Wa4kGF9rZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRiYFJUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+QOWBGrp5SNn5gAA3s

This series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer. The binding patch documents the board, the DTS
patch describes the hardware.

The DTS was rebuilt from scratch against the vendor 5.10 BSP device tree
and then translated to current mainline bindings, so that every node and
property has a vendor-side or schematic origin instead of being carried
over from the earlier revisions.

Changes in v13:
- Add a link to the board schematics and the Reviewed-by tag from Shawn
  Lin, who reviewed the sdmmc, sdhci and PCIe parts.
- Move the pin configuration of the headphone amplifier's enable GPIO from
  the sound card node to the amplifier node itself, as suggested by the
  review of v12: pinctrl is applied per device, so the amplifier can probe
  before the sound card and request that GPIO while it is not yet
  configured.
- Keep the direct LOUT1 and ROUT1 routes to the headphone jack alongside
  the amplifier ones, contrary to the Sashiko bot's suggestion on v12:
  describing only the amplifier path leaves the jack silent on this board,
  while with both routes LOUT1 and ROUT1 each have two active consumers
  during playback.
- Drop the leftover Assisted-by tag from the bindings patch.
- Link to v12: https://patch.msgid.link/20261102-quarkpi-ca2-v12-0-d749d9bb2bf9@163.com

Changes in v12, addressing the Sashiko bot's suggestions on v11:
- Sort the PMIC regulator nodes in natural order, so that dcdc-reg1 comes
  before dcdc-reg10.
- Sort the phandle references in natural order, so that pwm7 comes before
  pwm14.
- Put simple-audio-card,codec before simple-audio-card,cpu.
- Add the blank lines between sibling nodes that were missing.
- Link to v11: https://patch.msgid.link/20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com

Changes in v11:
- Trim the commit message down to the board description and the list of
  supported peripherals.
- Drop the Assisted-by tag.
- Note on the Reviewed-by line which nodes were reviewed.
- Sort the properties in aliases alphabetically.
- Sort the nodes without unit addresses alphabetically, everywhere.
- Drop the deprecated regulator-suspend-microvolt properties.
- Sort the phandle references alphabetically.
- Keep a single root node and merge the extra root nodes and the &{/}
  block into it.
- Link to v10: https://patch.msgid.link/20261023-quarkpi-ca2-v10-0-9db904194e03@163.com

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

Please review.

---
Bob Hui (2):
      dt-bindings: arm: rockchip: Add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1211 ++++++++++++++++++++
 3 files changed, 1217 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261004-quarkpi-ca2-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>

