Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A7748CD77;
	Sat,  5 Sep 2026 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607309; cv=none; b=JzG6EEJ+MpePNUMkxUvmIcQJYc3GspnelYvpymb3m1N8xJFt+Ig8oHfJ7Zi6qtF7XgK0J3U0q1y1nTAHDAu1pnplRf9OuEKYiOnRotRWvCJOqycPk94wtFHCA2g6QF93+4kBqbWtj3OhS5L5bQmjAo7h9woHBoT8sRjY00xC0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607309; c=relaxed/simple;
	bh=oAmDDrKnMv/AyVbWT0Wk8eZYpbvdxe5fXhli2PbtOEg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rqlmnlKaYJUTT0qyyD8Vom3dsluehfsI0V1bLSN/4Ezgi9klYWdH6L9PuVlre36Fxlw2o3gzXPOX5kIx03WT0+ACWXN6xxRpShM+QM1gmcoNQ3lATMp8fTMBP22+3aQXyDwLk2ff0OSsQmkRckFt4tEwqAHPTizAEfS2aDNj2o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS2aSADF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oS2aSADF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7333C2BCFB;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788607308;
	bh=oAmDDrKnMv/AyVbWT0Wk8eZYpbvdxe5fXhli2PbtOEg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oS2aSADF/U8/vSBvgIerW4NKRx11q7YGSjN/B7awXvJ/H0YCv8jBWXypKBVgEPzsR
	 l3A0CHlTlnuJ5Uf//RsaRaB8Oj7//1fw9iws7PibgS5JZ44LgJStNisRkYttOCmqMN
	 N1ANr8YQeAbYR9aRjxLVSPRZJ9Iu2VEhjQAtWUq2VvgtANSNGr8WSq+krGhGRqR6td
	 8A04HEZM0BOFFzaXflW45iNHNhdoOB44Ga5pQ0Gy3i3Cie/54btx+EXwwA23NOng/y
	 2VxLkJt4eNYuMJV79MdaHrIdL5DMTfY9tQeYZwkIvJOlvvGtqFv/gyRnzUi1yqp2al
	 R0TaqXqzZ2CDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9655BC624D6;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Sat, 05 Sep 2026 19:17:25 +0800
Message-Id: <20260905-r28s-upstream-v1-0-f68d5389269a@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNT3SIji2Ld0oLikqLUxFzdVCNDo1Qj8xQzQzNTJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaABtk4b1xAAAA
X-Change-ID: 20260905-r28s-upstream-e212e27d6165
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 jensen <jensenhuang@friendlyarm.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=oAmDDrKnMv/AyVbWT0Wk8eZYpbvdxe5fXhli2PbtOEg=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzZv71PLerYNfnZBvaoZZdaI6qZFjxf2XOXhd1bVqb0/
 bqVphy1HaUsDGJcDLJiiiyym6ojhVZFzyxikToOM4eVCWQIAxenAEwkuIXhJ6Pel+MTvVhbdk5a
 /PrxU7WGX1++1N7UfRV0Ma47eqrvzShGhvWKCyfHh719vXbvvEkJl2yzfvoyWP8u299w3a9wdeG
 +XGYA
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Reply-To: HystericalDragons@proton.me

The [NanoPi R28S](https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R28S) is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC. It is closely related to the already supported
NanoPi Zero2, sharing most of its power tree and peripheral routing.

Tested on a metal-case unit without the optional onboard eMMC: boots
from microSD, both Ethernet ports link up at 1000 Mbps, the HYM8563 RTC
registers, and all three LEDs are functional. The USB Type-C connector
registers as a DWC3 UDC in peripheral mode; gadget enumeration against
a USB host was not completed, because that connector is also the 5V
input and a PC port cannot power the board.

The patch referred to [fridendlyarm/kernel-rockchip](https://github.com/friendlyarm/kernel-rockchip/commit/ee640c5344b13a0a317436e2357df01af8268ce7) but with many changes make it suitable for kernel mainline.

Two things I didn't do because they are limited by my current hardware:

- The AICSemi AIC8800D80 WiFi chip on sdio0 has no upstream driver, so
  only the SDIO controller is described.
- The eMMC is described as HS200 rather than the vendor's HS400 with
  enhanced strobe, since the board at hand has an unpopulated eMMC
  footprint and the faster modes could not be verified.

---
安容 (2):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 404 +++++++++++++++++++++
 3 files changed, 410 insertions(+)
---
base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
change-id: 20260905-r28s-upstream-e212e27d6165

Best regards,
--  
安容 <HystericalDragons@proton.me>


