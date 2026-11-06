Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973538;
	b=UNdFTQqxiPkSsv+PeJu/Mms8Ymjsh63YwGJwvSbi5SAcOQshewUARHBzx2sbgc/zLJ6W
	 sA97OT8f5OkdSTwk9ZNfOuhyrV9F+wRE1qc+jDflJWk4VUQRvNfoaV08N2wxkZbqHm6vy
	 8GIdxvBViBJa39ISSufyZl4JMaZ98mGPJ9Tp3i29puJH1uGvPuLlnG5RAb9q0IYbTqCKY
	 WThXDBhD7C8udDCJaR3MMLIlB65+akWplIfev/QwdGPaem2hzIDGxS935EBbRViwxO0sN
	 eGOFbCYtHZj9vRUWG7A0RXy6ukjU82tmSDSLuO9tEqDmp+sP1uhJMt/xAa4ByVcZp2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973538;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=jENpz6dzCvEP9Gnuo5alwVcJmoZBCGPAfNYJOI8T6Fs=;
	b=ashCTg3jMPoVqlI/HurDwsiDA4x9iNRscHqOCd4vGomyYmS/q3Lnrsu9QnQe5wQ31cOf
	 aHNzcQwfFNkaCrl3tT9hm+6NnBeKCbplbOf4iJIOmZW7GhCQq/pje0h+jrXmcymHXqVKi
	 U7Yp3f/7It5L/rTms2Jqoz+Y5VsRs8Y18GWxpDHVnyuAc/38ju5ywMfoCnVfmybXS2MGp
	 h2VbIqT40LJn14wHNN/NkiWovJqRJcgfIW1IBotT0seCjYwYK+fT/CA4JTzfnHmtX2M04
	 Y15L4lWQzte3ABtOm64Dj1XA6wGYpUM8IEMLWIeaiky6uolMPej1b49aREEFOnUakBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Q2eTMr9s;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8535C606D80D;
	Fri,  6 Nov 2026 13:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8535C606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Q2eTMr9s
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135856euoutp01a3d4bfcaf97702118216edbb62377a63~leW0W0D_X0206502065euoutp01C;
	Fri,  6 Nov 2026 13:58:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106135856euoutp01a3d4bfcaf97702118216edbb62377a63~leW0W0D_X0206502065euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973536;
	bh=jENpz6dzCvEP9Gnuo5alwVcJmoZBCGPAfNYJOI8T6Fs=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Q2eTMr9s48C4JNx1mFcTqe5RgWTPUcdS2c3eUJRnm+i0zqgozqhjXCnjoe+6J2oed
	 40Cc6aw69PCG5ye4RnTJcTbVuppwyftSW3zKa2A8gRi3hGsIDhHj22utTJm4g54nM1
	 1pqrN002Qn4q1jId2WNpmombQw/9vBppigqL+KMw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135855eucas1p141de720b324f4deb00c73981ffef51f7~leW0B_N5d2007020070eucas1p1S;
	Fri,  6 Nov 2026 13:58:55 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135853eusmtip1b7856f0a643eaf38301e025718b5c7c5~leWx7EwcI0679006790eusmtip1f;
	Fri,  6 Nov 2026 13:58:53 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:37 +0100
Subject: [PATCH v7 03/19] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
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
Message-Id: <20261106-jh7110-clean-send-v7-3-68f7ea9913db@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4310;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=0Pe+zrvXANQYyAd1ud584zGkokHB97sZliMA0xpSBQ8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSsm4FirwL7e/oZt6PaJUvq8k8w9fz2oZcozy6gSN
	k+4rtPQUcrCIMbBICumyHJ2Y7SR5D+Gp+XHH/+CmcPKBDKEgYtTACaisY+R4c1KwX0hk/tf/fc8
	eUD+nqiWDLf2Cpll+p+Ln332ubbK04Dhr0CtXotE5bRv0k+/H547qfF/fLnEzhLufWUsNkF3Jq/
	g5wAA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135855eucas1p141de720b324f4deb00c73981ffef51f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135855eucas1p141de720b324f4deb00c73981ffef51f7
X-EPHeader: CA
X-CMS-RootMailID: 20261106135855eucas1p141de720b324f4deb00c73981ffef51f7
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135855eucas1p141de720b324f4deb00c73981ffef51f7@eucas1p1.samsung.com>

Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
(DRM bridge).

This device is the second child of the starfive,jh7110-hdmi-subsystem node.
It consumes its register access, audio master and audio bit clocks
(pclk, mclk, bclk) from voutcrg, and both the pixel clock (pixel) and
the PHY from its hdmi_phy sibling.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive,jh7110-inno-hdmi-controller.yaml      | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..eb03404d8c60a6ecadd0a4f5aee7c46b6f4da3ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Innosilicon HDMI Controller
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The controller portion of the StarFive JH7110 INNO HDMI IP.
+
+properties:
+  compatible:
+    const: starfive,jh7110-inno-hdmi-controller
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HDMI controller main clock
+      - description: Audio master clock
+      - description: Audio bit clock, from the I2S transmitter
+      - description: The pixel clock, generated by the PHY
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: mclk
+      - const: bclk
+      - const: pixel
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  starfive,vout-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the dom_vout_syscon system controller, which holds the mux
+      selecting the DC8200 output that drives the HDMI transmitter.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input from the DC8200. The remote port number selects the DC8200
+          panel and the remote endpoint number the interface on that panel,
+          0 for DPI and 1 for DP.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - starfive,vout-syscon
+  - ports
+
+additionalProperties: false
+
+examples:
+  # Shown as a child of the HDMI subsystem node; see
+  # Documentation/devicetree/bindings/display/starfive/starfive,jh7110-hdmi-subsystem.yaml
+  # for the full node.
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    controller {
+        compatible = "starfive,jh7110-inno-hdmi-controller";
+        clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                 <&hdmi_phy>;
+        clock-names = "pclk", "mclk", "bclk", "pixel";
+        interrupts = <99>;
+        phys = <&hdmi_phy>;
+        resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+        starfive,vout-syscon = <&vout_syscon>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&dpu_out_dpi0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&hdmi_con_in>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.34.1

