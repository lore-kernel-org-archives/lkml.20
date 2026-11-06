Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973543;
	b=NcedIiSyxZxtW1KAScViAu+rEUT1YDNFCd2oRyFoWvbcGUkUwsn8ub61snC9y60hyGuU
	 /dJbtI5b+Capdg6RNkTCfBcJGAa3FOfAy0lArtAHptt5rJ7Q0xoNkCZdFjPi7SzQLT0Rs
	 PER3COG+bmybS6AFWuYMq5c0rbBXtk/2qwK+btQWnuZNmnAB95iVyfCgd7WsS8OXQcdYV
	 1aF6BBTqDGBNLlSPQR8gxUxffVRVzwADGbrUfNpBGrshImtiKb3MNTOdQKCWEUrENshrI
	 Eh+7efiTFxGSckoLxlqc+EPIiIrGw8fzBKmiF5s10cdJdjEr5Cu0FtUTbJeNSsq5F/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973543;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=ZWj7QASkmSIyTParfRCzIhJpisMTNMwYHjF17hKyQWY=;
	b=u4+uHysD/MDKVZ/zQvHuFNjHZaGlDZnwe6cYH9++K4101iQ2uksnxwc/OqD8hcdYztY2
	 THd3cdSCS2vWJZA0sgAA9fKjOMR9d00jTAMnwAIAndNW2qalyx/q9kwaiHPbuHPreqy97
	 jWui/RIqfQJdO6LnWTT59tHNqf8RBQuq5mJirO7ByFD2uRr2H6m899wqJ+hT4MIbADbba
	 b2x6pYLSOGWVrHhV/LycMJjXIYaPBpeOrrLIVsupy1L7zLTKw2kJB2EXduIXK6GbvSzo2
	 JunY1s2QszTGkZ1cGpVOuyhg0yavUchDfzQ1rbe+b+PF26pVnKyQ2qzNPlTfKVmXolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mQtvUbM4;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A49606D811;
	Fri,  6 Nov 2026 13:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A49606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mQtvUbM4
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135900euoutp02da064129ccabfd396baf700be3706812~leW4NDcT_2548725487euoutp02X;
	Fri,  6 Nov 2026 13:59:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106135900euoutp02da064129ccabfd396baf700be3706812~leW4NDcT_2548725487euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973540;
	bh=ZWj7QASkmSIyTParfRCzIhJpisMTNMwYHjF17hKyQWY=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=mQtvUbM43MLMjjn3RJYruezqH+1kA1Zad845skV668o6oPVtTRtl6yPZFrVmekBQ8
	 hCQKenD6ouYNGRyTyhX0LvNf4C9zJ+g7JRJEdzs7DvAVwRlabsg75L6+JtMkpxe6Fz
	 EYnjaVPT6uP2FIFyAX50FX/0xnuZie2IraIFKzGw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135858eucas1p25582287f0bc6486b39942f025fecabf6~leW3HDj442505325053eucas1p2h;
	Fri,  6 Nov 2026 13:58:58 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135857eusmtip1bdc45f84e9e07974fb228d756054a2b7~leW1aRBDk0565905659eusmtip1B;
	Fri,  6 Nov 2026 13:58:57 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:39 +0100
Subject: [PATCH v7 05/19] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
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
Message-Id: <20261106-jh7110-clean-send-v7-5-68f7ea9913db@samsung.com>
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
	<cristian.ciocaltea@collabora.com>,  Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=4moaK26KmVJdQxiXnAOI2ZUcs+I1C/g2i7ggIWEm7ZU=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSt223LdfLkFMfvN/uw6EH2qXFY0W3PbzknTVlo8W
	ntPWVimqaOUhUGMg0FWTJHl7MZoI8l/DE/Ljz/+BTOHlQlkCAMXpwBMpImNkaFh9V7lL4zxHsq3
	LPhE/6+60fqszcCXZeP8ti/L1hSY1jsw/FO1FD0ZaLXmR3bVlfdfOuK7TnJs97pjGiJk8Xle5Io
	GKw4A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135858eucas1p25582287f0bc6486b39942f025fecabf6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135858eucas1p25582287f0bc6486b39942f025fecabf6
X-EPHeader: CA
X-CMS-RootMailID: 20261106135858eucas1p25582287f0bc6486b39942f025fecabf6
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135858eucas1p25582287f0bc6486b39942f025fecabf6@eucas1p2.samsung.com>

The video output subsystem has its own system controller, documented as
dom_vout_syscon. Among other things it holds the mux that selects which
DC8200 output drives the HDMI transmitter, so the HDMI controller needs
to reach it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index 0039319e91fe6e6aadc4300114626348e4dfb7ce..cf9b657d0e8a3ed5c5688336fee4123e14a2ac58 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - starfive,jh7110-aon-syscon
               - starfive,jh7110-stg-syscon
+              - starfive,jh7110-vout-syscon
           - const: syscon
 
   reg:

-- 
2.34.1

