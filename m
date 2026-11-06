Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973535;
	b=nB8Hro7NjwmuNo3kJwkP6FZOJpn8ed25c23Hk0fYvA0DWQn/Gb6dhpTJ/xUyEegJR/Zz
	 4+xz1GbM0ZL8iAn9o5rFk4IlwAfDT6OSZh6Bg+KXPTmdz1YQ+yvXDNKbpVVRc+tkw6aST
	 BQXupWVduXRwvGW/Pt7kBo7ob1C0/sRAWsG6439xv0foM73pigm6AUUQppyUFXAAx6+ns
	 7Mgk/ikS0bKpPCnJNmtRy44co/andXfsvPkXoqz+usJl0P1WbcNcLzK9NhmWvD70v9V3N
	 kLYidNjLxJyjHs0RcsNAczwSFlWR/XI30soeblFCcn1eviNqzyja8B5sC3p4zIM4Ynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973535;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=6uD1NOeC3m2popKJLD06ag5QQLPpkABoklTQbDrYzFI=;
	b=4RMiprFi6t9voYcFgQjOpPWjWROFEXrPb0dDg2PrI71rSu8WKZBVrwqJrKdlOAY188jF
	 a/4O66H2T3/IHddGCkkxdbr9/N9VNJEfCVaaapydv4341+TMgZrzFUHCDqUZ156AFw79e
	 tQduY7VuCD936Vbbyos4egPpSfRhiZaFqRuL2J/FQ1LucU/hV76JQTgTEmj/kPEqUhFTb
	 77Rv3cx+0HcQWzAoywDhxEA7V3bkpcdCdM+jB72bQEPZ0AX9PF6g3riCvrZiA4UfP8qwi
	 xHFiAip7KTpfdkFMwWD1y+juGON9XOx0+ai+76omfizEurMEzC31jtQLKSCxSyR42ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=GIJgBd5s;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E756606A332;
	Fri,  6 Nov 2026 13:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E756606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=GIJgBd5s
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135851euoutp01a81f442f83a36b3893c3bfccca3faa81~leWwe6APj0206502065euoutp01A;
	Fri,  6 Nov 2026 13:58:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106135851euoutp01a81f442f83a36b3893c3bfccca3faa81~leWwe6APj0206502065euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973531;
	bh=6uD1NOeC3m2popKJLD06ag5QQLPpkABoklTQbDrYzFI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=GIJgBd5skUk28siKytzsCMBsdIzuaVyjjupRA5P2i/XXpujgwpkEW/lpHopPg81GK
	 qSFIZGQ8Z0YRTl+BK+HnjUzLfOGFUIDIiseIua5T0ltmWYeJTDvxSq5ZV6vn62pGUA
	 VgFjLl4XB9Mbxpf9MJW0OvSfSzWYNVj6YTkQcgVA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135851eucas1p29a537bb4785f0a187619958bced510ec~leWwFFMYV2499924999eucas1p2m;
	Fri,  6 Nov 2026 13:58:51 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135849eusmtip171959c0b9b6db85903ceb3fa3cda6b0b~leWuWKrFt0459804598eusmtip1U;
	Fri,  6 Nov 2026 13:58:49 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:35 +0100
Subject: [PATCH v7 01/19] drm/bridge: inno-hdmi: fix swapped HSYNC and VSYNC
 polarity
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
Message-Id: <20261106-jh7110-clean-send-v7-1-68f7ea9913db@samsung.com>
In-Reply-To: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Andrzej Hajda
	<andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>,  Byron Stanoszek <gandalf@winds.org>,
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=4ksjJOGI7nSOdpmUM5sT0GIhqY+4m9fLCQ8MRF9P9VI=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vStmtWpxoP/9pSb2n90yRH8/CHpx89aGnBIrnblLl
	z1c/fhiS0cpC4MYB4OsmCLL2Y3RRpL/GJ6WH3/8C2YOKxPIEAYuTgGYSPo6Road5tyLXFvWnZ3X
	JiTuurGFxWPtJbvWwyuEPk15cdfVhc2QkaG7g9FjmnfqeQEdZ4PajjdcitkPPl6y4yi06vav/Fn
	2mw8A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135851eucas1p29a537bb4785f0a187619958bced510ec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135851eucas1p29a537bb4785f0a187619958bced510ec
X-EPHeader: CA
X-CMS-RootMailID: 20261106135851eucas1p29a537bb4785f0a187619958bced510ec
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135851eucas1p29a537bb4785f0a187619958bced510ec@eucas1p2.samsung.com>

v_HSYNC_POLARITY() and v_VSYNC_POLARITY() write the wrong bits: the
hardware puts HSYNC in bit 2 and VSYNC in bit 3, the macros do the
opposite. Most CEA modes drive both syncs with the same polarity so it
goes unnoticed; it only shows up on modes where the two differ.

Fixes: 412d4ae6b7a5 ("drm/rockchip: hdmi: add Innosilicon HDMI support")
Reported-by: Maud Spierings <maud_spierings@murena.io>
Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io/
Reported-by: Byron Stanoszek <gandalf@winds.org>
Closes: https://lore.kernel.org/all/b8b046ee-c574-3e16-6079-2fc415633dae@winds.org/
Suggested-by: Dominique Belhachemi <db@domibel.de>
Tested-by: Maud Spierings <maud_spierings@murena.io>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index ea3447d4f285ba5a6ba9d2bc42f450b97e5f22c8..cfb74cca96039cdc30cb3a3a1147a659dc2891fd 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -122,8 +122,8 @@ enum {
 #define v_VIDEO_MUTE(n)			((n) << 0)
 
 #define HDMI_VIDEO_TIMING_CTL		0x08
-#define v_HSYNC_POLARITY(n)		((n) << 3)
-#define v_VSYNC_POLARITY(n)		((n) << 2)
+#define v_VSYNC_POLARITY(n)		((n) << 3)
+#define v_HSYNC_POLARITY(n)		((n) << 2)
 #define v_INETLACE(n)			((n) << 1)
 #define v_EXTERANL_VIDEO(n)		((n) << 0)
 

-- 
2.34.1

