Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52565803B3;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964435; cv=none; b=MqeCM24HmRYF57VkehvOi4wEo6cXoEVnuV+hl7A1P/H/kBbw8eWZz4tmo8cdVqaPD/FQrXM7bhbUTRDVHRKEfCfiGB6L5+H93cN/wutcHm73eyj7/WnZYrVw95mmu+ShjHkB5/muCK90PsnhxT5K5prKy1FoF8s1KciAOXMvDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964435; c=relaxed/simple;
	bh=M+gdn9bgR3lkxhAgqB4Nv6rYR7CI1y4judKjqeu65wo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cp6oCKZH1CiQ+WB0kEsxzSTc2yV7pfwSObBTibo+/Vk17R5AsthF3y49AXtZ78EpDayS3D5DathpVk/ril9G6cbW8Erv6lD9ALaXceEiwQhYQ7kQjEvE9p0gPdhJSVo29t8R6hr/RuhjDoJqRZjpo2GocR8aXOHtmIPelnfspqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1f8e/mk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1f8e/mk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56303C2BCB9;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788964435;
	bh=M+gdn9bgR3lkxhAgqB4Nv6rYR7CI1y4judKjqeu65wo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=e1f8e/mkEyV6YiCjDfykVQzc9Wb30usUctCmM9ykk/fYbpn2ACe2UEURX3FHVSnYv
	 FT5Ysy4rZfkV00xLaYkukkBzD7jgIW+fF8mq0MpJPST7Z0durNSftz1xhjNMDiXCos
	 4S33Yeey1bRqTCxTJKGQ7hcdmBl5t7e/vosLUzFi/NydugVxQLyY4wArqovr1VBNzT
	 5vELIQJ9eA1tApmkW0DNRTtGikr4qGEudUBQmU7ft2QDGa/FzMhzFVpaaQc9iGl2oq
	 P9eqFr20Lfxwx+tECCF0USKa6N/D6UOrcB3gnNDpWEG3ba3+NXjjvHWM0drN1IagUg
	 H5Ic+7uMsY5cg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F486C79FBB;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Subject: [PATCH v3 0/5] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed, 09 Sep 2026 22:33:21 +0800
Message-Id: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNywrDIBQFfyW4rkVv0MSu+h+lC2NuGgt5oEZaQ
 v69mm5CocuBM3NW4tFZ9ORSrMRhtN5OY4LyVBDT6/GB1LaJCTCQTDFBHdSeLrMPDvVAETggVK3
 kUpDkzA47+9p7t/uX/dI80YQcyYve+jC5934Yed79a0dOGe1k3YqyViCVvs5uCtN4HpDkdoSjX
 f3akGzguhEV64zi5mhv2/YBUZ16QfoAAAA=
X-Change-ID: 20260905-r28s-upstream-e212e27d6165
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4356;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=M+gdn9bgR3lkxhAgqB4Nv6rYR7CI1y4judKjqeu65wo=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqyFeYGXhcq49d7uvXL2/wbHIyzvVkgmfg4q01wSzuh9Q
 v7m9949HaUsDGJcDLJiiiyym6ojhVZFzyxikToOM4eVCWQIAxenAEzk7wtGhgdzOZuO6rmKdR3c
 daV92mfW8pT0PxYf9ny/2/ZUoO5nQDPD/3D79RMUTSYs/OK5JTJpot6VlEVqspxnV5hdvFwqHvN
 OjxkA
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
most of its power tree and peripheral routing. Patch 3 therefore moves
the common parts into rk3528-nanopi.dtsi, and patch 4 adds the board on
top of it. The split leaves the NanoPi Zero2 dtb unchanged; I verified
this by decompiling the dtb before and after the split and comparing
them with the phandle numbering normalised.

Patch 1 fixes the NanoPi Zero2 and comes first so that it can be
backported on its own. Its RGMII PHY reset is described in the PHY
node, where the MDIO core applies it only after it has already read the
PHY ID over the bus, so a PHY that the bootloader left in reset is
never found. Describing the reset on the MDIO bus instead makes it
happen before any device on the bus is registered. The R28S wires the
same net and inherits the fix through the dtsi. Patch 5 is a coding
style cleanup across the three NanoPi RK3528 devicetrees.

The devicetree was derived from the vendor tree:

  https://github.com/friendlyarm/kernel-rockchip/commit/ee640c5344b13a0a317436e2357df01af8268ce7

but with many changes to make it suitable for mainline.

Tested on a metal-case unit without the optional onboard eMMC: boots
from microSD, both Ethernet ports link up at 1000 Mbps, the HYM8563 RTC
registers, and all three LEDs are functional. The USB Type-C connector
registers as a DWC3 UDC in peripheral mode; gadget enumeration against
a USB host was not completed, because that connector is also the 5V
input and a PC port cannot power the board.

Two things I did not do, because my hardware cannot verify them:

- The AICSemi AIC8800D80 WiFi chip on sdio0 has no upstream driver, so
  only the SDIO controller is described.
- The eMMC is described as HS200 rather than the vendor's HS400 with
  enhanced strobe, since the board at hand has an unpopulated eMMC
  footprint and the faster modes could not be verified.

---
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
安容 (5):
      arm64: dts: rockchip: Reset the NanoPi Zero2 PHY from the MDIO bus
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Split out the common NanoPi RK3528 parts
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Follow the DTS coding style in the NanoPi RK3528 devicetrees

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 145 +++++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 274 +-------------------
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 288 +++++++++++++++++++++
 5 files changed, 442 insertions(+), 271 deletions(-)
---
base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
change-id: 20260905-r28s-upstream-e212e27d6165

Best regards,
--  
安容 <HystericalDragons@proton.me>


