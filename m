Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7852CCD2;
	Thu,  1 Oct 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790868022; cv=none; b=TCuOODV6Hj02eMUwLxfADTAmkwKweZV0weimRPh9YXWtdOsqKIUDZJ3CeUNBeYh1gnCxmH+LfWTMvmetPVmt8DdmVDyjZxK+i1MXLzgKLzRYPI8mskif3yh4SVou3ZHXeuDJPBlRoaWMwP5umY2z5ryPOBejCVEbYPHF17UrdXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790868022; c=relaxed/simple;
	bh=90bflpLqzsTvqoe04lww2HwXw9oJ2EBTYBvvRb4z7wE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Suu6ewWdkhMloGJHVZslcG6qxeK0fcPK/ENiRnM4sxO6VuZyqEv6RUlRsvfBFptJzBL7tuLo3HlHDVwdpK+f3xV2IPIn9Z845int0sl2Uoex38Q+LgtOiZF36R0kvy3EHGulwuPp3xQVKsQAqjpY3D++AU9EAaUUKMhTo0N5jMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H1drRLNr; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H1drRLNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=O4qyVl+AVJG6RJD5ze+LMjUa+9vr53j/SWXI1uO7JWo=;
	b=H1drRLNrK+XIjOxONxBb59jMSHyTbVexrsZaAFfhYZ6m5IZWrsgvTXsmpPR2vm
	TmN15FM/rizA66Zb4Au8iB9mWEg761XJR9auOnnJAD4N3dkuQ6PUj26brivRaMek
	/jm41A5UwINYqiclEC8VXbly89nqGTpzW1iR9sNqVSC8I=
From: BG9OXA <bg9oxa@163.com>
Subject: [PATCH v5 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Date: Thu, 01 Oct 2026 23:19:45 +0800
Message-Id: <20261001-b4-quarkpi-ca2-v5-0-e19296802978@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABF6vmoC/yXMQQqDMBBA0auEWXcgGUyEXqV0EeOoY8HapCmC5
 O6munyL/3dIHIUT3NUOkX+S5L1U2JuCMPllZJS+GkiTM1ob7Br8ZB9fq2DwhJaCbQenjWGCGq2
 RB9nO4eN5OeVu5vD9X6CUA8FZVdByAAAA
X-Change-ID: 20261001-b4-quarkpi-ca2-52c57f6011e2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 BG9OXA <bg9oxa@163.com>
X-Mailer: b4 0.16.0
X-CM-TRANSID:_____wD3H2MRer5qrBReCA--.56692S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF4ktFy8AF1UJr1fJw4ruFg_yoWfZryfpF
	W5Xr45Kr4DGryxua97AF4UJryFva1fGay5Kr1qq340ya15Gr1rtFsak3Z8Xa4UCr4SgF12
	qF4jgayUGa1DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUj38bUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3hTtW2q+ehQvkgAA37

Hi all,

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
playback over the 3.5 mm jack (checked with music), the ADC keys, the IR
  receiver, the PWM fan and ramoops.  The M.2 socket is described following the vendor
design; no suitable device was available here to exercise that link.
dtbs_check is clean for both patches.

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

 * The 3.5 mm jack is fed from the codec outputs (LOUT1/ROUT1) and from the
   headphone amplifier outputs, as in the vendor tree.  Describing only the
   amplifier path was tried as well, and on this board that gives no output
   at the jack at all (verified on hardware with a test tone), so both
   routes are kept.

 * The board has three MIPI CSI and two MIPI DSI connectors, but no camera
   or panel is described here: those are plug-in modules.  Enabling the
   CSI-2 receiver without a sensor attached makes the driver fail to find
   its endpoint at probe (verified on hardware), so, as in the vendor
   tree, camera and panel descriptions belong in overlays.

 * GbE: phy-mode is "rgmii-id".  As you explained, phy-mode describes the
   PCB, and this PCB does not add RX/TX delays, so the delays have to come
   from the PHY.  I went through where each delay is actually applied:

     - MAC side: none.  dwmac-rk takes the delay values from the DT only
       for the plain "rgmii", "rgmii-rxid" and "rgmii-txid" modes; for
       PHY_INTERFACE_MODE_RGMII_ID it calls set_to_rgmii(priv, 0, 0), so
       the RGMII delay registers are written with zero.  (The driver still
       logs "set tx_delay to 0x30"/"set rx_delay to 0x10" when the
       properties are absent, but those values are only the parse-time
       defaults and do not reach the GRF in this mode.)

     - PHY side: the delays.  The Motorcomm driver programs its internal
       RGMII delay for RGMII_ID, using 1950 ps for both directions when
       rx-internal-delay-ps / tx-internal-delay-ps are not specified,
       which is its documented default for both directions.

    So with "rgmii-id" nothing is added twice.  Measured on hardware with
    iperf3 at gigabit line rate: in one 900 second run, 96.8 GB transferred
    at 924 Mbit/s with zero retransmissions; in a second run on the final
    revision of the series, 300 seconds in each direction, 925 Mbit/s
    transmit and 937 Mbit/s receive, with 114 and 23 retransmits out of
    roughly 24 million segments each way (a few ppm).  rx_crc_errors and
    the other error counters stay at zero in both runs.

This is my first patch to the Rockchip platform.  I am a Chinese amateur
electronics hobbyist (amateur radio callsign BG9OXA) working on this board
in my spare time, so please point out anything that does not follow the
expected style.

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

---
BG9OXA (2):
      dt-bindings: arm: rockchip: add ALIENTEK QuarkPi-CA2
      arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1154 ++++++++++++++++++++
 3 files changed, 1160 insertions(+)
---
base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581
change-id: 20261001-b4-quarkpi-ca2-52c57f6011e2

Best regards,
--  
BG9OXA <bg9oxa@163.com>

