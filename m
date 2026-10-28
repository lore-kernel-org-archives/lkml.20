Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200950;
	b=EqLIhcHPOP686KzZqYQBt1gUfB1kQ6wnnAYXDYOa5lW29X90166MVbiX+8ubCviFCJk7
	 LUKgpK3738xl3IkQ7HrntA4LTJRq/3Ufbc4dCUqhk1uUWt0VX1cMxiScfp6UpYvg5Yvn8
	 tMnMJkLeA+BUX7HymhxFkIgEXAha/e5rWEV4c760/2y/AniKZew9UovCmxPFy6CM2ggq/
	 IcuIDqCCKhYe3fYb4vCUQYko41PkC4j+Iqs+ad9iHEOrJCm5pFCEVMS1/VvXJev2CMVQw
	 eZ5szN8nUOTP2yrNgzJCsnMhRQND4dbiDGCQ4p/2PeS8qR7n6RsmC4ksP7Kwc+7UbyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200950;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:
	 X-EPHeader:X-CMS-RootMailID:References;
	bh=eBVG4o5Q+efGxzA1i/yK8O3OZQl+XBXEI5EUCcqeJDk=;
	b=wod1U3rzSm89ujob1uWjtjzbcpPmB5/dRnd/WIbw84TBpAlT6opTEdFjVQtFKXUSSIDs
	 xPlNbInd7D54iiEw/LlR+X+V/h6KEEtrRWnoV3YcxxRJWQGF4ZqZ+wEV4u21PAqij/dGr
	 ipf1Aho4Wdjdhs/8nqV3yiUk7uJKsJlWzMFhaHqpq5Ikr0TMz++6rH7xsugfdX2ne/1sQ
	 nVATYrfk9JArIkFg6mWLVALPmITwwsDM88Vlt0modSJgMhP29IloRrzxH5UqCaGUWMs4O
	 S0hcKyXQ8Uglqbz5jIMZ2bxjkNOhxw9oK1/BzlOQHZZvut3ZmH9SMzlP51XtxnofgYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Ht3r8ZbP;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612A606C02D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E612A606C02D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Ht3r8ZbP
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028152226euoutp020e606c9d23ae9ea941f304125bd47c69~iusKBAreO1405914059euoutp02m
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028152226euoutp020e606c9d23ae9ea941f304125bd47c69~iusKBAreO1405914059euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793200946;
	bh=eBVG4o5Q+efGxzA1i/yK8O3OZQl+XBXEI5EUCcqeJDk=;
	h=From:Subject:Date:To:Cc:References:From;
	b=Ht3r8ZbPzNEEKcx+1KxOvYF+okaPL4voM/rlfSDkgIHFrGiJTrm4xVAzuPadR+sGQ
	 S2qRspU0ZOteNKzZXxVI3rpIXg7b7s3YErZNqRsozWyNPwDlEk0YWfQn7PKAtrBjAo
	 PVOSvY6o4vKJquq3KMzELmpp1fYIxd4NI3GKc0LI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b~iusJjPOhi0628506285eucas1p1y;
	Wed, 28 Oct 2026 15:22:25 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152224eusmtip14ff4edada07d0beea9c9bddae2f23311~iusIrBPBq1826418264eusmtip1i;
	Wed, 28 Oct 2026 15:22:24 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v6 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI PHY
Date: Wed, 28 Oct 2026 16:21:40 +0100
Message-Id: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQT4moC/zWNwQ6CMBAFf4X07JrSQime/A/DobYLXSOFtEokh
	H+3knicSd68jSWMhIldio1FXCjRFDKoU8GsN2FAIJeZCS5UyYWGh2/KkgOFMIF3I8HsV9ASa9s
	bVUmULE/niD19juyty+wpvaa4Hi9L/bNHkLei/QftE02AhMHBUgMHLe6V0yitss01mTG9w3C20
	8i6fd+/FvQ0wLcAAAA=
X-Change-ID: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>, 
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3586;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=DYIe08HIrEITFvW4Wmq05N5Ik9goDCsoGozIIBA8kp4=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9EjaQWs9msu2tYfjK3+2JRnETs2bv+KK+Zb3Zkr9/q
	vz4ksQqOkpZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBE1FsYGXZvWjUz/V789JgH
	fed3/Tv3anvpc5GFxa28H9JPnv35pWkKI8P+O9JKzm2851jOK3QWvPAzWr/o9OLyjVu4QoPrdaU
	XGDMDAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b
X-EPHeader: CA
X-CMS-RootMailID: 20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b
References: <CGME20261028152225eucas1p133ea1b7981dfa2afe085b83e1bd6de3b@eucas1p1.samsung.com>

This series adds the HDMI PHY driver for the StarFive JH7110 and shares
the pre-PLL code it has in common with the Rockchip RK3328 Innosilicon
HDMI PHY.

Up to v5 it was part of the JH7110 display series [1]. It is split out
as Vinod suggested, so it can go through linux-phy on its own; the rest
continues as v6 of "drm: starfive: jh7110: Enable display subsystem".
Nothing here depends on the display series. The display series depends
on this one: its HDMI subsystem binding references the PHY binding from
patch 1, and it needs the PHY driver at runtime.

[1] https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

The JH7110 has the same Innosilicon PHY as the RK3328, offset by 0x100
because it sits behind the HDMI controller in a shared register block.
Patch 2 factors out the pre-PLL config format, table lookup,
determine_rate, recalc_rate and the pre-PLL programming; patch 3 moves
Rockchip onto it; patch 4 adds the JH7110 driver. Pixel clock tables,
post-PLL and analog config stay SoC specific.

Patch 3 should be a no-op for Rockchip - same writes, same order, same
values - and RK3228, whose pre-PLL is at different addresses, keeps its
own register code and shares only the lookup. I have no Rockchip
hardware, so it is build tested only (arm and riscv). A Tested-by would
help.

Patch 5 adds a MAINTAINERS entry for the binding and the driver, as the
other JH7110 PHY drivers have.

Testing
=======

Tested on a VisionFive 2 v1.3B together with the display series, using
modetest: all 42 modes the sink advertises work, with pixel clocks from
25.175 MHz up to 297 MHz.

Every commit builds for riscv and arm.

Changes in v6:
- Split out of the JH7110 display series (Vinod)
- inno_read() returns the regmap_read() error and recalc_rate checks it,
  instead of a failed read turning into a zero divisor (Vinod)
- Bound the pre-PLL and post-PLL table walks with the table size instead
  of relying on a sentinel (Vinod)
- Lowercase hex in the JH7110 pixel clock table (Vinod)
- New patch 5: a MAINTAINERS entry for the JH7110 HDMI PHY, moved out of
  the display series' entry
- Rebased onto v7.3, collected tags
- Link to v5: https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

---
Michal Wilczynski (5):
      dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
      phy: Add common Innosilicon HDMI PHY helpers
      phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
      phy: starfive: Add jh7110-inno-hdmi-phy driver
      MAINTAINERS: Add StarFive JH7110 HDMI PHY entry

 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
 MAINTAINERS                                        |   6 +
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-inno-hdmi.c                        | 358 +++++++++++++
 drivers/phy/rockchip/Kconfig                       |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 169 +-----
 drivers/phy/starfive/Kconfig                       |  20 +
 drivers/phy/starfive/Makefile                      |   1 +
 drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 587 +++++++++++++++++++++
 include/linux/phy/inno-hdmi-phy.h                  |  88 +++
 11 files changed, 1144 insertions(+), 144 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

