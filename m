Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B3516161;
	Thu,  1 Oct 2026 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862696; cv=none; b=TOGNPDH+phuOdqEyGH+7WK4hHFOewSJ6ep7tN9Sq1T3MdSpXBu7jkQ4hZCzudVheNubYixu8gMoGDgNsrZftDl+OvLwNxt/dLIyxeUg+DQrRa6ViVHy04xUE5Y2SEQXJWcBG0Y9mBFzdxoXO5YW3lYzaR+1WjG95GZhe8B5VXFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862696; c=relaxed/simple;
	bh=+sMG5dpOY7jRtme6nj50BlVr0zcHQuwIbLM3mhoTd4s=;
	h=From:To:Cc:Subject:Date:Message-ID; b=izbwby20xN8xhlU7KggLDj1XFNjyA6cHLnYxfjmLsyuGbYsst2k72SmyQEeqYrRByBr9oQLI+fDRHUSde3AeMi1Spo658AO5yaMRHXCtVeHTDHUO+fLqpJmtNlLzWIvqoe1imD6xRVYK4Jf6/OA+DUM8nwt36VoG9bV4XwBWGeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kdtx+6iZ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kdtx+6iZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=6vmdlekG85p5Xf9
	tRb0RaW6F7FKN3fI82Fpqe1I5ja4=; b=kdtx+6iZGe6/MrEzoIWiyNEEWgtCX++
	dp6APPfNOXByh2Aowz2zH+Q5Bia/jC8nl/gdhRUTL1K1q6DGGBM5bt9/V7PuaUft
	D8SAqM+v9waW1lm/5Ax99ziotKeY7Wsc/IGWcvK4SchK1QhsT7mxfHJaOceOYnBs
	ThPRB6+NSpVU=
From: BG9OXA <bg9oxa@163.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Thu, 01 Oct 2026 21:50:59 +0800
Message-ID: <179086265917.29834.8120199704469908241@163.com>
X-CM-TRANSID:_____wD3H5NDZb5q71IsBw--.40675S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF4ktFy8AF1UJr1fJw4ruFg_yoWxtr1UpF
	Z8Xw43tr4DGr1xuw4IkF4UArWFvF4fJay5WF1qq34jyay5WF1ftFnak3Z0qa47CwnagFyj
	vF4j9ay8Ga1DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPPEhUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+QOzIWq+ZUP86AAA3O
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi all,

Apologies for the extra round: v3 was sent before I had read all of the
review mail, so it only carried part of the fixes.  The remaining points
from Krzysztof's review are in this version now.  Sorry for the churn, and
thanks for the reviews.

This short series adds support for the ALIENTEK QuarkPi-CA2, an RK3588S
based single board computer.

Board summary:
 - Rockchip RK3588S (4x Cortex-A76 + 4x Cortex-A55), LPDDR4x
 - eMMC, microSD slot, M.2 socket (PCIe 2.0 x1)
 - Gigabit Ethernet, USB 3.0 Type-A, USB 2.0 Type-A ports and a USB-C
   port (USB 2.0/3.0 plus DisplayPort altmode, two DP lanes)
 - HDMI output, three MIPI CSI and two MIPI DSI connectors
 - ES8388 analog codec with 3.5 mm jack, HUSB311 USB-C PD controller
 - 40-pin header, RK806 PMIC, IR receiver
 - No SPI-NOR; the vendor bootloader reads extlinux.conf from the SD/eMMC
   boot partition

Patch 1 documents the board in the Rockchip platform bindings, patch 2
adds the device tree itself (plus its Makefile entry).  The "alientek"
vendor prefix is already present in vendor-prefixes.yaml, so no vendor
prefix change is needed.

Tested on hardware: boot from SD and eMMC, gigabit Ethernet, the USB 2.0
ports, the USB 3.0 Type-A port (UAS storage device, 5000 Mbps link,
309 MB/s), USB-C DisplayPort altmode, HDMI video and audio, ES8388 analog
playback, the ADC keys, the IR receiver, the PWM fan and ramoops.  The M.2
socket is described following the vendor design; no suitable device was
available here to exercise that link.  dtbs_check is clean for both patches.

Notes worth the reviewer's attention:

 * The codec is clocked through I2S0_8CH_MCLKOUT_TO_IO rather than the
   internal I2S0_8CH_MCLKOUT mux that the other boards reference.  On
   RK3588 the MCLK-to-IO routing is a gate in SYS_GRF SOC_CON6 which the
   bootloader leaves closed, so nothing drives MCLK out to the codec;
   pointing "clocks" at the _TO_IO clock makes the codec driver open that
   gate at probe, while "assigned-clocks" stays on the internal mux to
   keep the 12.288 MHz rate.  Verified on hardware: i2s0_8ch_mclkout_to_io
   is enabled with the codec (1-0011) as its consumer, and playback works.

 * The codec compatible list is "everest,es8388", "everest,es8328", as
   documented in everest,es8328.yaml and as used by the other boards with
   this part.  The standalone ES8323 driver cannot instantiate a card on
   this board at all, which is how the fitted part was confirmed.

 * Analog capture from the 3.5 mm TRRS jack (headset microphone) does not
   work yet: the capture stream returns a constant idle pattern (0xFFFF)
   although the analog bypass path works, and the DAPM routes and the ALSA
   controls look correct.  This looks like the same ES8328 capture problem
   that has been reported for other boards, so I kept it out of this
   series.

 * The USB 3.0 Type-A port is wired to usb_host2_xhci through combphy2_psu;
   both are enabled here, as in the vendor BSP.  combphy2_psu is free on
   this board because the M.2 socket uses pcie2x1l2 (combphy0_ps).

 * The board has three MIPI CSI and two MIPI DSI connectors, but no camera
   or panel is described here: those are plug-in modules.  Enabling the
   CSI-2 receiver without a sensor attached makes the driver fail to find
   its endpoint at probe (verified on hardware), so, as in the vendor
   tree, camera and panel descriptions belong in overlays.

 * GbE: phy-mode is "rgmii" and the RGMII delay is applied on the MAC side
   (tx_delay), matching the other boards in mainline that use the same
   YT8531 PHY.  Tested for 900 seconds at full rate in both directions
   (922 Mbit/s, zero retransmissions) and with 1000-packet pings; the MAC
   error counters stay at zero.

This is my first patch to the Rockchip platform.  I am a Chinese amateur
electronics hobbyist (amateur radio callsign BG9OXA) working on this board
in my spare time, so please point out anything that does not follow the
expected style.

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


BG9OXA (2):
  dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
  arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts | 1157 +++++++++++++++++
 3 files changed, 1163 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

-- 
2.47.3

