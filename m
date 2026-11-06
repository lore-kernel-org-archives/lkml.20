Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973544;
	b=CnbWQpBnQq4u5Zuty1VHh4EzGQQab0xYqi+22knkjDdx60mftKMr+A80w2WG43k5Cq1P
	 t60UMzZNp/Yvu1kBBZjP4nWbFajxCYQIRxyqza0xavhD0zgXKWlzr06v5gjOsSwQGdXPl
	 KIeZJMnQBLEyE3Vbc+qVigiaTwtm953YYGc61jtV3NJkIWkOigJx6m8A6ZK5pTkCXWEMx
	 NapUnQBcbxKjkKlturekKAZwuY852rntnmfoIJ/n9bZ9JRn0CrnTCzJ0HZxXS/capXubS
	 R6t7UZNp17NAqukC8rRyPiuSLtMfMvvQQKFAqo30Sm7nQ4b6W++3O5L3iNFR4WpUPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973544;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=RHo4ksSMFTqpRYw3uQoglMFwqaYV5jcly92lZB1Eo2I=;
	b=hpmS6mDqddyNjIBPXdBy4mmW4lrPVJc1wsVrIaTvJOl+G7qNH+7XeWgFz4n+1DRdwrvK
	 aNCmgl+1m0zH6p6hz4XauDSVJk+IxtfbPCzcb/BKOCzR1AZ5iNEkcVw2FeqJE8atSeWP0
	 o7IV8EK+fPlQeSAgliY4Oae/mlKxjSK9P3I/HaeGg22R+b1Y0uvzNv9eX9fUL0JWsfHGh
	 KTqOhuNahIuhUYTkl4n0Oy7vLDSFpp7VFf34AkmoVG93S2sEdtumjn1emVWxhN0nocUc9
	 GUNKuvn6rsbzX3VDEHqHeC2bkMuopA4kSgF8ZTCYC/CkrTH791EuK4cYvxusXxGyYmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=MhPfV8AU;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AD6606D801;
	Fri,  6 Nov 2026 13:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AD6606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=MhPfV8AU
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135901euoutp025e40b27f9535daf9f0959da75b18707e~leW5OHKrU2548725487euoutp02Y;
	Fri,  6 Nov 2026 13:59:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106135901euoutp025e40b27f9535daf9f0959da75b18707e~leW5OHKrU2548725487euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973541;
	bh=RHo4ksSMFTqpRYw3uQoglMFwqaYV5jcly92lZB1Eo2I=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=MhPfV8AUAsjkSxgc1xGxqc94xKeL39Jfx0vT59kwFrHRipIk9hnBoERuZQcrJNdma
	 hQ1BJtvojUaJJPgE9rS0LhI2ua7JrHfvTJq9dKDeCzhr4yolB+W+x0n3+lq+cGZ0wJ
	 x4Q425/iyuRVtdfAqcEyCOLOFxQdQSF0VSg2qIFk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135900eucas1p17159021cc747335b62cad6b3326605be~leW41-tE92279422794eucas1p1K;
	Fri,  6 Nov 2026 13:59:00 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135859eusmtip192823125372105a1533bc3e8d32faa4c~leW3LPF5p0570305703eusmtip1y;
	Fri,  6 Nov 2026 13:58:59 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:40 +0100
Subject: [PATCH v7 06/19] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
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
Message-Id: <20261106-jh7110-clean-send-v7-6-68f7ea9913db@samsung.com>
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
	<cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=41iA01RWnUWvGtQAbZNvE1TbUzxo7jNLq+NLQx4Yies=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSsm5r6ZtZgnfvsSnoCmb6cyo5SjvohP8ys1eWZdH
	Jqayd3SUcrCIMbBICumyHJ2Y7SR5D+Gp+XHH/+CmcPKBDKEgYtTACbi8Yfhr0yfwz2XhCqmgH9n
	RL7x/Z612rVCebOk8exE0T/nHnJ5mjEyfHmfdC15jdZNm/V5bF+m6pRlTmYSZ5BWCxbzfMKxgam
	HAwA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135900eucas1p17159021cc747335b62cad6b3326605be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135900eucas1p17159021cc747335b62cad6b3326605be
X-EPHeader: CA
X-CMS-RootMailID: 20261106135900eucas1p17159021cc747335b62cad6b3326605be
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135900eucas1p17159021cc747335b62cad6b3326605be@eucas1p1.samsung.com>

The JH7110 embeds a DC8200. The binding requires an SoC specific
compatible ahead of the generic one, so add the JH7110 to the enum.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 919a9001220120054cb62d1d01b7293367266f95..05a202633cd273fec358c095c64584d959d96d90 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     items:
       - enum:
+          - starfive,jh7110-dc8200
           - thead,th1520-dc8200
       - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
 

-- 
2.34.1

