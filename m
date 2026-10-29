Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260445;
	b=Ey/V3TeJwKBBgBlDbp72rIujpoZ0OYK7mBcmEevPfBAoWi3buj8ME2Q9rYBa909hcal2
	 KDUAAqqbt7RTZWYJvXM9+uLufcw2bkZQ1jQ7JG/ZTiSO639Pphs/AyYb43GPLZqv8rJ0z
	 O2Ani/C01Ezuib2de8AJYlaroeccFLyvRJ6exfSDzK2MMW5YbJ53Vkb5jw1wq/Ileic1u
	 1wcJJzWIpyV8Bzx10lxvXou6K7xkwj/gvkNTpJkdeVzYt3oNQxzic3mtdW7GEzWPx6KJx
	 JedH3+3AbzJpOZgoYrmnrUEIEaDmeEvAEweggGyr4dl150OgEfGqn45nF4mt86coo/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260445;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=RHo4ksSMFTqpRYw3uQoglMFwqaYV5jcly92lZB1Eo2I=;
	b=rM7nXr8BsCK7V/b4sWUU5vZXMJIWpuiO0SkpgoFmXfKC0x8nxNSwmF2KYIw5GHve6h0t
	 +p9kMqBnAl1HVUwV3VId4Z3W9QdFTw1T+etbufkjZETfAqf/g44iFLkFY+iRMaN45ZQ+R
	 G21LTqQILWHTYR3t3+W+8G+BLEkFrdRCqFzitkA/cnN6UxkLDYnijoOXReEFcJd7AGmpk
	 KNz9OFl0tzBQhykA8U24TSfaHccBMsJHyVMfZKyjmx/ixNS1qFhHlF6Ixl7FTa2ezLjht
	 2AzV1pHxsO+aQ0skQUNm6pHDu7EySvEctcgZgrWEZVEPXBtiniL9GKcU31h79STPcpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AScjFEul;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA351606A336;
	Thu, 29 Oct 2026 07:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA351606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AScjFEul
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261029075402euoutp02f14f0159405154af6a3d68d7dc748d93~i8N8jxRuB1871618716euoutp02r;
	Thu, 29 Oct 2026 07:54:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261029075402euoutp02f14f0159405154af6a3d68d7dc748d93~i8N8jxRuB1871618716euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793260442;
	bh=RHo4ksSMFTqpRYw3uQoglMFwqaYV5jcly92lZB1Eo2I=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=AScjFEulN75U1Luf4MtUE6R+BytYIHPuNq0LhFxumn3iofIdIgbEJXtMTPy48a3ru
	 Wdhaxaw0RVAMVQXd3Gci15QeC66TqGEkd/a4g1DnHPRZrPKjHHSms8AOVZ6YZXMp7O
	 i1TXTYFRHPKn4JhpraQruzNbyOrrAagM00Ct8rxQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da~i8N8KurDv2479624796eucas1p1I;
	Thu, 29 Oct 2026 07:54:02 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075400eusmtip101cc657f59153249e5ac29e8d60a05f2~i8N6lezse1408514085eusmtip1n;
	Thu, 29 Oct 2026 07:54:00 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 29 Oct 2026 08:53:40 +0100
Subject: [PATCH v6 06/18] dt-bindings: display: verisilicon: Add
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
Message-Id: <20261029-jh7110-clean-send-v6-6-759594e43acf@samsung.com>
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
	<u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=41iA01RWnUWvGtQAbZNvE1TbUzxo7jNLq+NLQx4Yies=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9+t1Tur+wujbM1Ov2vRaVbj3hVcfPrfsgoPTcy/1mT
	XGFzYmwjlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjCRniBGhubNvVwX9zkGLZ+z
	9HSM3Ae7VV4bXbQ9DyrHJN7g4O88PJvhryRb7KanTPHJogr/pVWuCtl2XF6mYN13+fUuB3YGjxZ
	7JgA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da
X-EPHeader: CA
X-CMS-RootMailID: 20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075402eucas1p1da7f497ccc2e469112e08cc58e0bb0da@eucas1p1.samsung.com>

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

