Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973546;
	b=RIrlMnjMs1pnbFzOXr9fsYbL0x5qEjYFW0BvzmJbSpWHcr+KUmajQdon6p3XlbT11rJv
	 wTuTbIuvwri8lkFIAgaQ2S4ee+rCpHogkFDEkgaHcyoaSS7SzJ0y3/S4wrzKNay0PSB9/
	 mu4/SAHtqLW1pXEDnMytHL3KVnkTVO2ghEXUBwWQzL9gMifLcDtlcjP8eI2IDVbo8csu1
	 43Yryyqq0D1sO760GJWXSIA4hbiAcjMafS1koDnzabO17mDW5GqDtWzC9+1IR6jo4gNF2
	 F1Z3BoC5CXWIx95HAC4JLxt8bx7WdHMygPgkDyJAzbYESbNlpFMxoeMQY4sBaQeGhbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973546;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=06NeDKUV+cw25CPPV7IC7Ih02Eu8nwvQREl9MM5uqzI=;
	b=Y8Mu2dx8+ArbqB7UOfYiAQ72DdWtIvTWT0+KC8zYgeIiAZPSO0ya9I03DMH22q6g0sS9
	 WkwpZ/drF2HhXICs2jBrE5oWvvTVDGKy4nu5KcnUFuqsziXwlCe9obK4qtCkrcktO8gdu
	 iK0D9MIUkwiNvW/nB027sdQHu0hh06cd6wTM8vO2HLTfFjHvuM27aEcxGW05JrokwxBTd
	 KM6CdE6JCso4rdqWhLe3k3BAM9hIH/xz2cWDhbMWxcEuDU3HuW+Ocot2+ayZKQHVc9b4W
	 Wjc/ms9ae2/QcBS/U3wrBFmVVKBEse3QXQfpUbHCbK8nzZO56lvOGIaMMFv38mWb9sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=pxnRD3zV;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF390606D833;
	Fri,  6 Nov 2026 13:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF390606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=pxnRD3zV
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135903euoutp020a575911893c0db8f78dde3ae09fb896~leW689XHw2517925179euoutp02b;
	Fri,  6 Nov 2026 13:59:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106135903euoutp020a575911893c0db8f78dde3ae09fb896~leW689XHw2517925179euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973543;
	bh=06NeDKUV+cw25CPPV7IC7Ih02Eu8nwvQREl9MM5uqzI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=pxnRD3zVsYOlkfJ7AQDlkf6dykIJmQ6+DrcqrDWrpSnmFlx1BugfHjOT+oiOKhTxM
	 oEbokhQMEjMa0ujtMTA2XMEH+9hFX3DdX6Ku6DuXC//uRnrjw1tkdjN+0gBzd17I93
	 bVn98JMGwW3erCUl8/ZA/hmP3YzMRKmX1v5jKhdk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135902eucas1p1d8900fa2623e3230e42a67072602562d~leW6l-O3I2282722827eucas1p1W;
	Fri,  6 Nov 2026 13:59:02 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135900eusmtip159f43c3201c53fbd3be7664725f66ef8~leW454U7o0459804598eusmtip1W;
	Fri,  6 Nov 2026 13:59:00 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:41 +0100
Subject: [PATCH v7 07/19] dt-bindings: display: starfive: Add
 starfive,jh7110-vout-subsystem
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
Message-Id: <20261106-jh7110-clean-send-v7-7-68f7ea9913db@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8422;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=2utQJ3gDn4xONVVmMQqOybizZ9wJSKDIsm6yZ8wiDhw=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSuWvNBA4/95gRYd/soupQ/2iq/ePpxq0Rx9UOzk0
	poi8xPVHaUsDGIcDLJiiixnN0YbSf5jeFp+/PEvmDmsTCBDGLg4BWAid74zMnyvufYxR7bmykTt
	lVw/mYSzNp11WDaTrfWm3NY/d246911mZLhh6KcdaHn5u5bcSykb/mu3pgkZbdx4fv7WHxuE7D+
	sN+EEAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135902eucas1p1d8900fa2623e3230e42a67072602562d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135902eucas1p1d8900fa2623e3230e42a67072602562d
X-EPHeader: CA
X-CMS-RootMailID: 20261106135902eucas1p1d8900fa2623e3230e42a67072602562d
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135902eucas1p1d8900fa2623e3230e42a67072602562d@eucas1p1.samsung.com>

The JH7110 groups its display hardware into a video output subsystem,
dom_vout_top, covering the DC8200, the HDMI transmitter, the video
output clock generator and the video output system controller.

They share one NoC port whose clock and reset gate access to every
register in the region, and the region sits in the PD_VOUT power
domain. Describe the subsystem as a bus node so those resources are
owned by the block that shares them.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../starfive/starfive,jh7110-vout-subsystem.yaml   | 218 +++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-vout-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-vout-subsystem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..74ac777d0406206b86ac77ca77003a32a7b10721
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/starfive/starfive,jh7110-vout-subsystem.yaml
@@ -0,0 +1,218 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/starfive/starfive,jh7110-vout-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 video output subsystem
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+description:
+  The JH7110 groups its display hardware into a video output subsystem, named
+  dom_vout_top in the documentation. It covers the DC8200 display controller,
+  the HDMI transmitter, the video output clock generator and the video output
+  system controller, all behind one NoC port. That port's clock and reset gate
+  access to every register in the region, and the region sits in the PD_VOUT
+  power domain, so this node owns those resources on behalf of its children.
+
+properties:
+  compatible:
+    const: starfive,jh7110-vout-subsystem
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: NoC display bus clock.
+
+  resets:
+    maxItems: 1
+    description: NoC display bus reset.
+
+  power-domains:
+    maxItems: 1
+
+  dma-noncoherent: true
+
+  ranges: true
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+patternProperties:
+  "^display@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: starfive,jh7110-dc8200
+
+  "^hdmi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: starfive,jh7110-hdmi-subsystem
+
+  "^syscon@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: starfive,jh7110-vout-syscon
+
+  "^clock-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: starfive,jh7110-voutcrg
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - power-domains
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/power/starfive,jh7110-pmu.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        display-subsystem@29400000 {
+            compatible = "starfive,jh7110-vout-subsystem";
+            reg = <0x0 0x29400000 0x0 0x200000>;
+            ranges;
+            #address-cells = <2>;
+            clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
+            dma-noncoherent;
+            power-domains = <&pwrc JH7110_PD_VOUT>;
+            resets = <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
+            #size-cells = <2>;
+
+            display@29400000 {
+                compatible = "starfive,jh7110-dc8200", "verisilicon,dc";
+                reg = <0x0 0x29400000 0x0 0x2800>;
+                clocks = <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
+                         <&voutcrg JH7110_VOUTCLK_DC8200_PIX1>;
+                clock-names = "core", "axi", "ahb", "pix0", "pix1";
+                interrupts = <95>;
+                resets = <&voutcrg JH7110_VOUTRST_DC8200_CORE>,
+                         <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
+                         <&voutcrg JH7110_VOUTRST_DC8200_AHB>;
+                reset-names = "core", "axi", "ahb";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        dpu_out_dpi0: endpoint@0 {
+                            reg = <0>;
+                            remote-endpoint = <&hdmi_in>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                    };
+                };
+            };
+
+            hdmi@29590000 {
+                compatible = "starfive,jh7110-hdmi-subsystem";
+                reg = <0x0 0x29590000 0x0 0x4000>;
+
+                controller {
+                    compatible = "starfive,jh7110-inno-hdmi-controller";
+                    clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
+                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
+                             <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
+                             <&hdmi_phy>;
+                    clock-names = "pclk", "mclk", "bclk", "pixel";
+                    interrupts = <99>;
+                    phys = <&hdmi_phy>;
+                    resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
+                    starfive,vout-syscon = <&vout_syscon>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+
+                            hdmi_in: endpoint {
+                                remote-endpoint = <&dpu_out_dpi0>;
+                            };
+                        };
+
+                        port@1 {
+                            reg = <1>;
+
+                            endpoint {
+                                remote-endpoint = <&hdmi_con_in>;
+                            };
+                        };
+                    };
+                };
+
+                hdmi_phy: phy {
+                    compatible = "starfive,jh7110-inno-hdmi-phy";
+                    #clock-cells = <0>;
+                    clocks = <&xin24m>;
+                    #phy-cells = <0>;
+                };
+            };
+
+            vout_syscon: syscon@295b0000 {
+                compatible = "starfive,jh7110-vout-syscon", "syscon";
+                reg = <0x0 0x295b0000 0x0 0x10000>;
+            };
+
+            voutcrg: clock-controller@295c0000 {
+                compatible = "starfive,jh7110-voutcrg";
+                reg = <0x0 0x295c0000 0x0 0x10000>;
+                #clock-cells = <1>;
+                clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
+                         <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
+                         <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
+                         <&hdmi_phy>;
+                clock-names = "vout_src", "vout_top_ahb",
+                              "vout_top_axi", "vout_top_hdmitx0_mclk",
+                              "i2stx0_bclk", "hdmitx0_pixelclk";
+                power-domains = <&pwrc JH7110_PD_VOUT>;
+                #reset-cells = <1>;
+                resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
+            };
+        };
+    };
+...

-- 
2.34.1

