Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260468;
	b=Uj9T4Zk+CZqqzvaw/BxrM+HuFVNZz8sxvg4v8fbP2q/HEtcnjxCycAA79L9mc5lx6Ggf
	 46F1UedRosQoc/xCeWyFpAPxHpBIxvg3gPb/dF+uzRCQQ5waDwLGRS+hsfoq7l+MYXcG4
	 CzHXGPDXdwrAuewXlo1WQ+EPRqLZXDL4E8UnUPLTs4fEkascv6gPzfJtNYVk1PCiRXl/4
	 caS5m9wtnQ6lU0ohjpddUAKahSCQwjSY+WjITwgwWz1ppRm672aAdBsmAXFSFtQmdNBZN
	 G4RnclaS3/xfJSJfHzwDkvNm8oz/Qf09YYCBx+8d8VlaY1FplpzRH5YN87nG7Lypr4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260468;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=AyVr3lOpu/F2i5Ks3iABCsnY+vxN70X05XRSjT2mOPM=;
	b=bleEwmOJQv4qVf8iVkB78x181FkNSaqltcjK8fcmD1XokD5TSSHUFnMZVHjnBU6JtMag
	 o8dKJDEw3I69I0YSJFE/Lbpu2IKiuaflwx6zpwFpaxfX9u9U1CXoNMDK1NYmJ8iGa3GBx
	 xxAKOjjWvAvyCeSqbw4l+b6MGmUugFyIKwveS2s+07Jhh1Oe58ZKx/cRhL8Yw8QE7s0uC
	 ODSHvaZJsycSEkVjb/DNIgHSYB8ByolT8KpKjFhQRKMdV2di+zGKYkmwBXG8WMXSsmWI9
	 a3PjzT6Ub129waEI9a53rXfQeBNO0+hr89EKHdNLMebI3j3ftDCB+0GEK/rRsvuRqJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=n1alky5d;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C1C606A323;
	Thu, 29 Oct 2026 07:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=n1alky5d
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261029075426euoutp01369546df8908cfe34e8ea0ab7b2f9283~i8OSYKmdh1137711377euoutp01E;
	Thu, 29 Oct 2026 07:54:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261029075426euoutp01369546df8908cfe34e8ea0ab7b2f9283~i8OSYKmdh1137711377euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793260466;
	bh=AyVr3lOpu/F2i5Ks3iABCsnY+vxN70X05XRSjT2mOPM=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=n1alky5dzEkz9xA4OPM5nRtudisC0UDamz3bbXg1UkUJggDECZ49/6mikH3+TqlID
	 u0EQEw73ubIrkvr6hFV4s9x36KKQe7OZ6bTeAUOFYfwf314jkj4hRepMG4WUnUrL3R
	 d+KH5eQZtZ5FZgFuTp7s4b4V8MlBpUjBI8PrAhac=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075425eucas1p199247568ca0be9033d41404369b94f5d~i8OR_6CIM2480524805eucas1p1F;
	Thu, 29 Oct 2026 07:54:25 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075424eusmtip13dc100187357fe3b2e7c45660f929b75~i8OQWIaz31493914939eusmtip1d;
	Thu, 29 Oct 2026 07:54:24 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 29 Oct 2026 08:53:52 +0100
Subject: [PATCH v6 18/18] MAINTAINERS: Add StarFive JH7110 display subsystem
 entry
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
Message-Id: <20261029-jh7110-clean-send-v6-18-759594e43acf@samsung.com>
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
	<u.kleine-koenig@baylibre.com>,  Byron Stanoszek <gandalf@winds.org>,
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=LUj0063FiWN/8UaUC2czOis8u1SJBVWarE/3ww68nsA=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9+t1zWPyg8+5TJs7vOP7PKb54TzjSyLoqrUOH/+DCX
	xH99/Zf6yhlYRDjYJAVU2Q5uzHaSPIfw9Py449/wcxhZQIZwsDFKQAT+fSI4b+3qPyVfds2HPS9
	xJ6XGO/0p8u44ctPrXZ2n7+1p7U2qa9lZPhk0u389vua+z9eKGy2fLTzQWfVOp/4/1Kb5zyvihP
	5doILAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261029075425eucas1p199247568ca0be9033d41404369b94f5d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029075425eucas1p199247568ca0be9033d41404369b94f5d
X-EPHeader: CA
X-CMS-RootMailID: 20261029075425eucas1p199247568ca0be9033d41404369b94f5d
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075425eucas1p199247568ca0be9033d41404369b94f5d@eucas1p1.samsung.com>

The JH7110 display subsystem spans a PHY driver, a DRM bridge driver,
a parent device and their bindings, and has no existing maintainer entry.

Add an entry covering them so patches reach someone who can review them.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3d9e0117ebdfae707e1f61cb3e772..c26ac0bc60e5a9b777b0cb07ff0109e5a7cd1ae4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26093,6 +26093,17 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
 
+STARFIVE JH7110 DISPLAY SUBSYSTEM
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+R:	Icenowy Zheng <zhengxingda@iscas.ac.cn>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
+F:	drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
+F:	drivers/soc/starfive/jh7110-hdmi-subsystem.c
+F:	drivers/soc/starfive/jh7110-vout-subsystem.c
+
 STARFIVE JH7110 DPHY RX DRIVER
 M:	Jack Zhu <jack.zhu@starfivetech.com>
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>

-- 
2.34.1

