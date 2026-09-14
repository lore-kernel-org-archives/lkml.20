Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F847208F;
	Mon, 14 Sep 2026 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392910; cv=none; b=K63Io3Jl3fdYcwNwHVrBskMlFzLw0HIPnQaGdmSkPXyCg7CZFYt80syh5OnosTz/rwflPH81DvDM9FXt36ayoar0p//mA0h4uRDgEO+aGKIJWTv2fZskFSc3a156s7vzqnXjz5yk0TnXmfUwnUSb0gFvDkhY01RwcVpxEIum8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392910; c=relaxed/simple;
	bh=R3btyI4w5tF6ZHcJlaEq9PHDX+T4GAzDlq3NNhEgWtI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b3r0YNlX2fXqoVM56ZYYPOG7g86TUSBntkwZ/rYumlpV+jp/oyVKgiBa9PY1FKRXpeWxGPm4LScbfQxqHRPfSJMjP1M0NDfS6X6XSojh07m6LMtks4SjXOIeUT8fl2Drs/eEVT6+gkbkGTBYNKDlJo8bEyE99rNqVPUErOqv8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiZdbr2D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiZdbr2D"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E7C6C2BCB8;
	Mon, 14 Sep 2026 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789392910;
	bh=R3btyI4w5tF6ZHcJlaEq9PHDX+T4GAzDlq3NNhEgWtI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZiZdbr2DyvURkNawUJ040CbfMyRCjEIiLv1ziUfGGGBrQdlRmaOnPvSZu0TcnYsOg
	 5b83qMdKLDxcA5upNZLhHq0c7kC0qMvp7JaVYigbKVZBmbhj6vdwlKybxp5fLzIC8K
	 iTOxlrxJNgFEY9pBDGAMHMlN31j5Utq5Lcv1w3DEu0QPfuLtusv48PMj4g/PALYMi7
	 C5bWSbI/v+rLiMGOgOcNnNID0gohI/U2BGLDJ8dcvfeSDJcC3ID4p3bo26jDqcnuYY
	 QTNLMqXUvF029OG3M1MU5BNVKuWWegbpsO3AM96hlgLz0J5XGm1K6TH4RcFeGAip1U
	 ovC1DeqMXSq0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D70C88E64;
	Mon, 14 Sep 2026 13:35:09 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Subject: [PATCH v6 0/3] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Mon, 14 Sep 2026 21:35:00 +0800
Message-Id: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTW7DIBAF4KtErEMEw4+hq96jygLDuCFSbAscq
 1HkuxfSjYPU5ZPe92aeJGOKmMnH4UkSrjHHaSxBHw/EX9z4jTSGkgkw0MwyRROYTO9zXhK6G0X
 ggNAFzbUixcwJh/jz2vs6/+V876/olzpSG5eYlyk9XgdXXnv/ba+cMjpoE5QwFrR1n3Oalmk83
 ZDU7RX2ums1FA3c9apjg7fct1rstW21KBpRIHdCOqFEq+VOc95qWT/vtTdqANBBtlrttWy1Krq
 TzHppDZrw9vm2bb/ajblqtAEAAA==
X-Change-ID: 20260905-r28s-upstream-e212e27d6165
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, 
 jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8046;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=R3btyI4w5tF6ZHcJlaEq9PHDX+T4GAzDlq3NNhEgWtI=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzlP3h+Wr+wc//S8+nFZT9BNY+CmmNCmzzz/HKDci03L
 3yuEr+to5SFQYyLQVZMkUV2U3Wk0KromUUsUsdh5rAygQxh4OIUgIkIrGH4K/JR9vQrzn18Vve/
 pthobXwalWA3XUdH4N7B76sfzK+J5GJkWLNe+FWG7/23Cv8VnaduNsh3rlBn5TosXW1U1bomZIs
 8JwA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC:

  https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R28S

It is closely related to the already supported NanoPi Zero2, sharing
most of its power tree and peripheral routing. Patch 2 therefore moves
the common parts into rk3528-nanopi.dtsi, and patch 3 adds the board on
top of it. The split leaves the NanoPi Zero2 dtb unchanged; I verified
this by comparing the node and property sets of the dtb before and after
the split, which differ only in node order and phandle numbering.

The devicetree was derived from the vendor tree:

  https://github.com/friendlyarm/kernel-rockchip/commit/ee640c5344b13a0a317436e2357df01af8268ce7

but with many changes to make it suitable for mainline.

Tested on a metal-case unit without the optional onboard eMMC: boots
from microSD, both Ethernet ports link up at 1000 Mbps, the HYM8563 RTC
registers, and all three LEDs are functional. The USB Type-C connector
registers as a DWC3 UDC in peripheral mode; gadget enumeration against
a USB host was not completed, because that connector is also the 5V
input and a PC port cannot power the board.

The bootloader was U-Boot 2026.07 with a board specific R28S target,
which releases the RGMII PHY reset before Linux starts, so the reset
description in the PHY node is all the kernel needs.

Two things I did not do, because my hardware cannot verify them:

- The AICSemi AIC8800D80 WiFi chip on sdio0 has no upstream driver, so
  only the SDIO controller is described.
- The eMMC is described as HS200 rather than the vendor's HS400 with
  enhanced strobe, since the board at hand has an unpopulated eMMC
  footprint and the faster modes could not be verified.

---
Changes in v6:
- Dropped the coding style patch, and the blank line before "status" in
  the new devicetree along with it. Only 18 of the ~2900 "status"
  properties in arch/arm64/boot/dts/rockchip are preceded by a blank
  line, so the series now does what the rockchip devicetrees do (Jonas
  Karlman).
- Listed the NanoPi R28S and the NanoPi Zero2 in a single binding entry,
  since they share a devicetree. The entry only changed shape, so I kept
  Conor's Acked-by; please shout if that is not fine (Jonas Karlman).
- Kept all USB nodes in the board devicetrees instead of moving the OTG
  port into rk3528-nanopi.dtsi, since the NanoPi NEO3 Plus has USB 3.0
  and configures it differently (Jonas Karlman).
- Added the serial2 alias for the Bluetooth UART (Jonas Karlman).
- Named the user button pin configuration after its net in the
  schematic, GPIO4_B2_USR_BTN (Jonas Karlman).
- Described the SDIO slot more precisely: no-mmc, no-sd and the missing
  vmmc-supply. The module's VBAT comes from VCC_3V3 through a ferrite
  bead, VDDIO from VCC_1V8 (Jonas Karlman).
- Enabled DMA on uart2 with dma-names (Jonas Karlman).
- Kept dr_mode = "peripheral" and said why in a comment. The Type-C port
  is the 5V input: both CC pins have a 5.1k pull-down (R3811, R3812),
  USB20_OTG0_ID is not connected (R3922 is /NC) and VBUS only feeds
  VCC5V0_SYS through the input protection. So the port cannot present
  itself as a host or source VBUS, not even behind a powered hub.
- Did not add the WiFi and Bluetooth wake pin configurations. The pins
  are there, HOST_WAKE_WL and WL_WAKE_HOST on GPIO1_A6 and GPIO1_A7,
  HOST_WAKE_BT and BT_WAKE_HOST on GPIO1_B4 and GPIO1_B5, but the
  AIC8800D80 has no upstream driver, so there is no wifi@1 or bluetooth
  node to reference them from and the pin states would never be applied.
  They belong in the patch that adds those nodes (Jonas Karlman).
- Link to v5: https://patch.msgid.link/20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me

Changes in v5:
- Dropped the pinctrl-0 before pinctrl-names reordering from the coding
  style patch and used the order the rest of the rockchip devicetrees
  use, pinctrl-names first, in the new devicetree as well. The strict
  mode of scripts/dtc/dt-check-style asks for the alphabetical order,
  but it does so for many other properties that no rockchip devicetree
  sorts that way either (Chukun Pan).
- Moved the SYS LED, which the NanoPi R28S shares with the NanoPi Zero2,
  and the led1 and led_sys pin configurations into rk3528-nanopi.dtsi.
  Both boards now only add their own LEDs to &leds (Chukun Pan).
- Renamed the NanoPi R28S LED nodes to led-1 and led-2, to use the
  led-[0-9] node naming (Chukun Pan).
- Changed the user button from KEY_RESTART to BTN_1. It is a general
  purpose button on this board, not a reset button (Chukun Pan).
- Link to v4: https://patch.msgid.link/20260911-r28s-upstream-v4-0-fb6c85f226d4@proton.me

Changes in v4:
- Dropped the patch that moved the NanoPi Zero2 RGMII PHY reset to the
  MDIO bus. GPIO4_C2 resets the PHY, not the bus, so describing it on
  &mdio1 is not a description of the hardware. It would also break
  Ethernet in U-Boot, which reads reset-gpios, reset-assert-us and
  reset-deassert-us from the PHY node and has no support for a bus
  level reset. The nanopi-zero2-rk3528 U-Boot target releases the PHY
  reset before Linux starts; the failure I reported was seen with the
  generic-rk3528 target, which carries no board devicetree. Pointed out
  by Chukun Pan, and by Jonas Karlman in the same discussion for the
  HINLINK H28K:
  https://lore.kernel.org/lkml/1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwiboo.se/
  My own R28S has in fact been running a board specific U-Boot target
  all along, with the PHY node description this series now keeps, so
  the reset ordering problem I described does not arise there.
- Reworded the coding style patch to state the coding style violation
  itself as the reason, rather than the tool that found it (Diederik de
  Haas).
- Link to v3: https://patch.msgid.link/20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me

Changes in v3:
- New patch 1: describe the NanoPi Zero2 RGMII PHY reset on the MDIO
  bus rather than in the PHY node, so that it is applied before the PHY
  ID is read. A PHY held in reset by the bootloader was otherwise never
  probed, leaving the port dead. Reported by Andrey Korshunov, who
  proposed the deprecated snps,reset-gpio properties on the MAC; the
  bus level reset-gpios in mdio.yaml fixes the same ordering without a
  deprecated property.
- New patch 5: follow the DTS coding style in the three NanoPi RK3528
  devicetrees, as found by scripts/dtc/dt-check-style --mode=strict:
  pinctrl-0 before pinctrl-names, and a blank line before status.
  Suggested by Diederik de Haas.
- Picked up Conor Dooley's Acked-by on the binding.
- Link to v2: https://patch.msgid.link/20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me

Changes in v2:
- Split the parts shared with the NanoPi Zero2 into a new
  rk3528-nanopi.dtsi (new patch 2). The NanoPi Zero2 dtb is unchanged.
- Name the pinctrl labels after the nets in the schematic: usr_btn,
  led1, led2, led_sys, pwr_wf and pcie_eth_perstb.
- Rename the button node to button-user and its label to "USER".
- Link to v1: https://patch.msgid.link/20260905-r28s-upstream-v1-0-f68d5389269a@proton.me

---
安容 (3):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S

 .../devicetree/bindings/arm/rockchip.yaml          |  12 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 146 +++++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 291 +--------------------
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 288 ++++++++++++++++++++
 5 files changed, 451 insertions(+), 287 deletions(-)
---
base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
change-id: 20260905-r28s-upstream-e212e27d6165

Best regards,
--  
安容 <HystericalDragons@proton.me>


