Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260443;
	b=Jg9gQ5JOVEY3+VBgL+vyZyp3T0SGYEFPpKTO8if/WAYDDIbQtOa0pwX4woMb1szY3HG/
	 3ycrqSIFkl2SzYuX7Ltx943oSk2XTlAUDBObZFR65sJe14xHqsyaWHS4V4zeylEvztpLc
	 JllDj6SyepdkrWjiit2WXmsYZTVyKXwGD2RSGxKgkNdnooX/KtyR6JrZ6BCen21lWTNgZ
	 bHjQrBVQiwWN8EeLZMxebaVGVZDLAa7I6J0IdL31nsq6uHn7ut73p7ImVrXnc/lUxNfK9
	 wKtwlARS8MCqZOJoP7X22mDRtrmatS3XUIloBwYXszHiG5TxC5S9I3bsHajY2DKGQ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260443;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=ZWj7QASkmSIyTParfRCzIhJpisMTNMwYHjF17hKyQWY=;
	b=kVEdkdbfZGDEkfYX5l3jkXBuYXHDKF5QimFWTP7mXxKe0Zup1VJUtBruGt7ac/doAzvm
	 w/ztYNopYR6Y/Dk+sPbvIUfzCzUbR58QLyjGzYSnEHEeI1Pie6OYGPzgBO0WhqzhyKllv
	 OMuEa63YpN9vFFoYm7zcsP9v1NdxLckweeAI16blUJULtK34zxIlMsLggYcvEXoa56fRX
	 xkUOQwcVsX3K+tiBg2vlGCL+FrU8JM/3PSHtAFaDti0peczoUsvR9IyjQZgjVtSPLoqRH
	 kEVbViaEb2BdtV027GFW0fRfXIRLukd+1uURnih9bHGUd/DCnxjBSa2SZrH58dNrnEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="CR/mYtPK";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085FC60A2618;
	Thu, 29 Oct 2026 07:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 085FC60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=CR/mYtPK
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261029075400euoutp0209d1710d6cb324774c0bfb35895f2931~i8N6zDqoP1871618716euoutp02q;
	Thu, 29 Oct 2026 07:54:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261029075400euoutp0209d1710d6cb324774c0bfb35895f2931~i8N6zDqoP1871618716euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793260440;
	bh=ZWj7QASkmSIyTParfRCzIhJpisMTNMwYHjF17hKyQWY=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=CR/mYtPKPGH8FNpXGaTx+JIYuVrc0+LxpV2N+1CqOqkpcoTE7g6LBHUa/a5h9hK/W
	 FHBd7p9HGt1OzyquC85WaVrZbd1ontWNJHQtqRXwN7n9o2jNkFTq1k3OhEjxX7Gks0
	 LwQN2XXLX8RZKsiGaLaPVTEE3spMMgsjWkBk9+cQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261029075400eucas1p2cc7aec382fc3c977927c59b3dbcc254e~i8N6hpAIG2715027150eucas1p2M;
	Thu, 29 Oct 2026 07:54:00 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075358eusmtip15d399b24e070f3d8563ae739614ca126~i8N45sz2E1314413144eusmtip1E;
	Thu, 29 Oct 2026 07:53:58 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 29 Oct 2026 08:53:39 +0100
Subject: [PATCH v6 05/18] dt-bindings: soc: starfive: Add
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
Message-Id: <20261029-jh7110-clean-send-v6-5-759594e43acf@samsung.com>
In-Reply-To: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
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
	<u.kleine-koenig@baylibre.com>,  Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=4moaK26KmVJdQxiXnAOI2ZUcs+I1C/g2i7ggIWEm7ZU=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9+t2z55pQ9kXfOVp8i6b1vTn+7U7aIduSitkRF6d17
	y31kXnf3lHKwiDGwSArpshydmO0keQ/hqflxx//gpnDygQyhIGLUwAmkqXHyNCQwqQjKX/KseGB
	/NRE3/pTPzTTw53tHLzmH/XI+XR8divD/+KNPqtaDgYxrp89+a/M4Wl7rA2OOtyzXdalZ/Kv4af
	wUw4A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261029075400eucas1p2cc7aec382fc3c977927c59b3dbcc254e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029075400eucas1p2cc7aec382fc3c977927c59b3dbcc254e
X-EPHeader: CA
X-CMS-RootMailID: 20261029075400eucas1p2cc7aec382fc3c977927c59b3dbcc254e
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075400eucas1p2cc7aec382fc3c977927c59b3dbcc254e@eucas1p2.samsung.com>

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

