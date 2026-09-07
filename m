Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C34F4741;
	Mon,  7 Sep 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790456; cv=none; b=MT3Yd0HHvGepu6MdhlZBljVrlE8Tjua0s3Lda9qfmsMM+6ahg1E2u4bI0zu5It1Ylza1hReX7WqaqYPg6ABLV8s3d1UJL2nt+4FVC+GnIucDYtdXUf0h5JU3qIXbypQSlnVqRFo9OBfSQ6UWvC+B9DpxC5xRdXLIdZc/8a9zh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790456; c=relaxed/simple;
	bh=upxHPP9ArbDCrRBkmQM8oFLShkIqVXPIci/IXpan42U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BWsvYCpEpfmUxDHUOsbCXZnIYh3EenjaD/x9g/KO6rr3XtKFX9Tv/BRq4cwPIMYrnQJ+MAqzOlcqsijaLcVawDkFLSywImG016DVxUfJWuYfr95DslwcMD05IqbJp6Wd6LSkrhCn5PQ+IGIRkgQMS/4O8+c6k/4gw7xZc0zquvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rr58TWjM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rr58TWjM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA673C2BCFA;
	Mon,  7 Sep 2026 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788790456;
	bh=upxHPP9ArbDCrRBkmQM8oFLShkIqVXPIci/IXpan42U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Rr58TWjMVe+P2pY9jidCowTTYxQBFO8VSsJky9yv/Tl5UuulSgYESfY7QiulrJ3j/
	 gOxxKtfFlYzTBRMFMtn6FOJShlvrTIGUXrwvbT3KjZX876AgjMmQNvGIIVPWzox/zd
	 TTctrpMobaTc7rVTfohhgtEeDDToDC1e7xd4e49eNv69zCsO52Rq9sasVm2LBBjC62
	 WckQlbp+Ot1mjfm5IoXtciokIQawc/PirjEUKFvoWMMRbj/LEzJ9YrnMmEZ1BmZkyL
	 eeJSlaJjJBK0NCO8cbjobDkcy02f69otykUvSSyxMLyYorRkkJK03Ql+pRb4qigIWl
	 mJUifSibh/b0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C204CC79F99;
	Mon,  7 Sep 2026 14:14:15 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Mon, 07 Sep 2026 22:13:54 +0800
Message-Id: <20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbU07hgquuIdhgTBITaBkphAN6
 d2luHb5kvff30CIHQncsg2YVifOTzvgKYN2aKYnKdftDKjR6lLnirEQtcwSmJpRERokvHbW2Bz
 2zczUu/fRu9c/luXxojakSDIGJ8Hz5zhcTfL+tVejtOpt0eWXokRbNtXMPvjpPBLUMcYv9b06Y
 rwAAAA=
X-Change-ID: 20260905-r28s-upstream-e212e27d6165
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2794;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=upxHPP9ArbDCrRBkmQM8oFLShkIqVXPIci/IXpan42U=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqx5x7bFa+woUbApXbLNuU94kVaD381VvSaSt7dlMakVs
 /7N/J7VUcrCIMbFICumyCK7qTpSaFX0zCIWqeMwc1iZQIYwcHEKwETKvzD8z+ngy/h3aQK3qujx
 umh1VcNjc3crHphRbbmzYRbDJ02mDEaGH145tVeF41u+ry5YVfmy4ec6hhWr591KDQv6IyGZeug
 OLwA=
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
this by decompiling the dtb before and after the split and comparing
them with the phandle numbering normalised.

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

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 142 +++++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 271 +-------------------
 arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 279 +++++++++++++++++++++
 5 files changed, 428 insertions(+), 270 deletions(-)
---
base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
change-id: 20260905-r28s-upstream-e212e27d6165

Best regards,
--  
安容 <HystericalDragons@proton.me>


