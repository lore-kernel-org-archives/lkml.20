Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883879;
	b=ko7CajpIMSgcI34m4ESTRIBIMvj7KpGB4j2xPJqv8lhHvVCsr/L40TzZRevqsoGv50Vq
	 8DqPRBuKLsdxc48olp+s8CR0ElrtcWu6wSETi6587rYoFqCCm8gagwjZcSinDFOZIgYjy
	 kOyhaMxj295vUQ02b8bwmDg5hgrXpWRr616rB3WCbWz9aLoZM10FfmofUkYRR1AWGO9EM
	 ekOLZ1w7DXzM+gXUP+Lq7DX735G+XZGVrVc6XVneKHybMvqIPVfuxvKcLq6V3vWeKLx4+
	 hEHJRMf5Lj+xnjZ+ftrLj6x5eE2nOwCWXgY7Nnk97V70X8k7iEDwRZ5ZcmmS3icWIMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883879;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=oIQ2mdaegpafaksDeX1yjnFF1ZlqGsdtXcF828uy7SA=;
	b=mBtjLnq+yEFN7TQkVSL7Hj7mcsZdeBpJ3WLSTLwiwliDEAuNtdIIoW1x3CCJGfDt/k9H
	 TUVJUi26fFi+fPJywCTPt2tmjWWNmnuu5qzCQ8YX1QsDVK4K+xWqIZ9LhSADx2r5e4F/R
	 iYBx5JeHdF0BORDIIQOlNedBPW4XHBTBpEqN9tPgjRcS7OL9xZ+kBNnv4kIQ+/p1sMsFw
	 416cxMy23KNwBbQXZvC+zh9oH/WMicFHpRA9TQTO2o57H0jI4deUQXXtAVuZ9EQ0H6F2G
	 /CJtt6QpHHSHLGwoMokOk8EOSQrf9/uQ6cvmgIYWy221KDQ2+qfwZgCV3RbejV5fdaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jhkWdtPK;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC78606A33C;
	Thu,  5 Nov 2026 13:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC78606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jhkWdtPK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=oIQ2mdaegpafaksDeX1yjnFF1ZlqGsdtXcF828uy7SA=;
	b=jhkWdtPK6p1loENU2B3AUiJs7sxe7jwuTjczLDKttPEdIEy8gZXH+1xPTcRqsH
	WCI35Fj3i0FzGwHvchkySUTuAAOBIq0PSHjuM15R7NfiDOutjowausPlBGOAtLtJ
	z7rkBAK9OCr6J5VywmSHbQhyYWVwTGKxgLfGBO5h0Eegs=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD39xKpfuxqIBOEEw--.52808S2;
	Thu, 05 Nov 2026 21:03:38 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v16 0/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
Date: Thu, 05 Nov 2026 21:03:29 +0800
Message-Id: <20261105-quarkpi-ca2-v16-0-b48eacb64a60@163.com>
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
X-B4-Tracking: v=1; b=H4sIAKF+7GoC/33QS07DMBAG4KtUXhM0Hj+HFfdALPwKNYimJG0Eq
 nJ37CLUxItK3ow13+8ZX9iUxpwm9rS7sDHNecrDoRRcP+xY2LvDW+pyLBcMATUHkN3X2Y0fx9w
 Fhx3yiE5RUBAEK+I4pj5/X+NeXv/q6ezfUzjViNqxz9NpGH+u782m9v0nm03ybOqBzlkZdFRRp
 14/cy0ew/DJavRs72BbpLeCE/oUwfitpJVEvpVUpVEA2iP6oLaSw5qKLeVQLEVPIDnJBKKx/GY
 LbiwvNnmUGox2FvvG4j2LxUYjKZL36HtqrFjbdmZR/zjaICBEr01qrLxnZbFIQGVhCQU3Vq2ta
 qyqVkijwUbDjbvZZVl+AXTgiV+WAgAA
X-Change-ID: 20261004-quarkpi-ca2-21d2a59c50c3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Andrew Lunn <andrew@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD39xKpfuxqIBOEEw--.52808S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFW7ArWUJw4DZw15KFWktFb_yoWxur1UpF
	ZxCFs8GrsrtryI9rs7Ww1xurWxAFs7JrW5tFn5J345Za15ur1Iyr9akw1Fv3Z8Crn5AFyU
	tr15W3yrWF9xArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREApUUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+QufDWrsfqvJsgAA3I

This series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer. The binding patch documents the board, the DTS
patch describes the hardware.

The DTS was rebuilt from scratch against the vendor 5.10 BSP device tree
and then translated to current mainline bindings, so that every node and
property has a vendor-side or schematic origin instead of being carried
over from the earlier revisions.

Changes in v16:
- Drop the direct LOUT1/ROUT1 routes to the headphone jack, as the Sashiko
  bot suggested on v12, v14 and v15.  The jack was silent without them in
  an earlier test, but that test predates v13, which moved the amplifier's
  enable-GPIO pinctrl from the sound card to the amplifier node, so the pin
  was never muxed and the amplifier could not be enabled.  With the pin
  configuration in place the amplifier path alone drives the jack, and the
  DAPM graph no longer has a parallel unamplified path.
- Link to v15: https://patch.msgid.link/20261105-quarkpi-ca2-v15-0-2347608d717a@163.com

Changes in v15:
- Rebase onto v7.4-rc1 and re-check the DTS with that tree's dt-schema.
- Move the Ethernet PHY reset from the MAC to the MDIO bus, as the Sashiko
  bot suggested on v14: snps,reset-gpio, snps,reset-active-low and
  snps,reset-delay-us are deprecated, and stmmac_resume() pulses that
  reset while the YT8531 clock is only programmed once in probe, so the
  link may not come back after a resume.  &mdio1 now carries reset-gpios,
  reset-delay-us, reset-post-delay-us and a pinctrl group for the GPIO.
- Drop the &sata0 node, as the Sashiko bot suggested on v14: rk3588-base
  .dtsi already leaves sata0 disabled, so the override only repeated the
  default.
- Drop cap-mmc-highspeed from &sdmmc, as the Sashiko bot suggested on v14:
  with no-mmc set mmc_of_parse() never initialises MMC mode, so the
  capability could not take effect.
- Describe the USB-C data path with the graph the drivers parse, as the
  Sashiko bot suggested on v14: rk_udphy_probe() looks its DisplayPort
  output up with fwnode_graph_get_endpoint_by_id(dev, 3), so the Type-C
  connector, the USB 3.0 host controller and the USBDP PHY now use ports
  with port@N and reg, and the endpoints are connected through labels.
- Fix the indentation of the added graph nodes and the SPDX line.  No
  property is changed by that.
- Link to v14: https://patch.msgid.link/20261103-quarkpi-ca2-v14-0-290990440b67@163.com

Changes in v14, addressing the Sashiko bot's suggestions on v13:
- Drop the unused media/video-interfaces.h include.
- Write the ramoops zone sizes as powers of two.  ramoops_probe() rounds
  record_size and pmsg_size down, so 64 KiB and 128 KiB are the sizes the
  driver already used and the layout does not change.
- Link to v13: https://patch.msgid.link/20261103-quarkpi-ca2-v13-0-ad8c30cdb67e@163.com

Changes in v13:
- Add a link to the board schematics and the Reviewed-by tag from Shawn
  Lin, who reviewed the sdmmc, sdhci and PCIe parts.
- Move the pin configuration of the headphone amplifier's enable GPIO from
  the sound card node to the amplifier node itself, as the Sashiko bot
  suggested on v12: pinctrl is applied per device, so the amplifier can
  probe before the sound card and request that GPIO while it is not yet
  configured.
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

Changes in v11, addressing Heiko Stuebner's review of v10:
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
95.00% correct on 200 images).

Note: the debug console is ttyS2 and there is no fiq_debugger node, so
console=ttyS2,1500000 has to be added to the bootargs manually, and capture
from the headset microphone needs the separate ASoC series for
sound/soc/codecs/es8328.c, which does not affect playback.  PWM14 has no
consumer, because it is only described with the pinctrl group for pin 33 of
the 40-pin header, and it is enabled so that user space can drive it
through the pwmchip interface.  The unconsumed combophy_avdd0v85 and
combophy_avdd1v8 regulators are kept as well, because they document the two
PHY rails of the board and the combphy driver has no supply property to
attach them to.  The connector's port@0/port@1 numbering stays as it is and
the v14 suggestion to swap it is not applied, because that numbering
matches rk3588-evb1-v10.dts, and rockchip,dp-lane-mux stays too because the
other RK3588 boards that route DisplayPort over USB-C set it as well.

Please review.

---
Bob Hui (2):
      dt-bindings: arm: rockchip: Add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1238 ++++++++++++++++++++
 3 files changed, 1244 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261004-quarkpi-ca2-21d2a59c50c3

Best regards,
--  
Bob Hui <bg9oxa@163.com>

