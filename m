Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43DE282F17;
	Thu, 27 Aug 2026 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827756; cv=none; b=XA+mpbq+a20/FivMKENg3rSGswb3p0wYFwvuoPH05ul55gEfWwssCodWAm93Lx5uqzZA+xtK3qMPYtxa2gphK25tvCvQ2nOgwrOObXK0EstuiQK1yMPjAoz5aEDJ81LVfy60bJbtMy4J4I7W88USia20J6M6MI56sfO9Iff1UiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827756; c=relaxed/simple;
	bh=yMUcHa3/s68pnJKlAYgv+xVwb+t/cMWwna4xXfRlR4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLrvAO4BZvLAvvGTU4qKP1FZ0Cr6q4M4ilQLFzii/koJxbh7ynQQeidqHk9DYdo2bFN6M4Am4ieb5VcVmbf5O1YXtLalg7i5GRSwQYNR6G4Dtha4FNHV8bKRHJut/UIMfcogancZJx7lBRc4GmIh/7KysKBrdOwYna7RQCxNcII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SAfoQRzL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SAfoQRzL"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:306c:5b5b:3c7f:eabd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3E05C1;
	Thu, 27 Aug 2026 12:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787827664;
	bh=yMUcHa3/s68pnJKlAYgv+xVwb+t/cMWwna4xXfRlR4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SAfoQRzLDZv+zWtxes8F+HfqHFr/8SCuwivvbI8nMoACOHQyxi1DpCIJ52wwuOcsY
	 XjS36gR+iyL/7PUrK8svo0+WifH4ea67mze9v18xceIkFex6p68OPS373rGWe75gyC
	 9EieVrMUI2TskzKPonasa2Ueos4r1efsHxDTTMAk=
From: Paul Elder <paul.elder@ideasonboard.com>
Date: Thu, 27 Aug 2026 19:48:33 +0900
Subject: [PATCH v3 4/5] dt-bindings: media: Add rockchip rkisp2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-rkisp2-v3-4-e91ff0a604d6@ideasonboard.com>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
In-Reply-To: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com, 
 stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com, 
 xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.2

Add documentation for the Rockchip rkisp2 bindings. This is meant to
support multiple versions of Rockchip ISPs going forward, including the
2.x series and 3.x series. The current version only adds the compatible
for the RK3588, which is a 3.0.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v3:
- reorder patches

No change in v2
---
 .../devicetree/bindings/media/rockchip-isp2.yaml   | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp2.yaml b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b85c28e4d7aa8ceb5db55b49b4de10ef8ed704ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-isp2.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip-isp2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoC Image Signal Processing unit v2
+
+maintainers:
+  - Paul Elder <paul.elder@ideasonboard.com>
+
+description: |
+  Rockchip ISP2 is the Camera interface for the Rockchip series of SoCs which
+  contains image processing, scaling, and compression functions.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3588-isp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: isp_irq
+      - const: mi_irq
+
+  clocks:
+    minItems: 3
+    items:
+      - description: ISP AXI clock (aclk)
+      - description: ISP AHB clock (hclk)
+      - description: ISP core clock (isp)
+      # for rk3588
+      - description: ISP core clock (marvin)
+      - description: ISP core clock (vicap)
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: aclk
+      - const: hclk
+      - const: clk_core
+      # for rk3588
+      - const: clk_core_marvin
+      - const: clk_core_vicap
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: ISP power domain
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for VICAP in inline mode
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-isp
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+
+    parent0: parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp0: isp@fdcb0000 {
+            compatible = "rockchip,rk3588-isp";
+            reg = <0x0 0xfdcb0000 0x0 0x7f00>;
+            interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>,
+                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH 0>;
+            interrupt-names = "isp_irq", "mi_irq";
+            clocks = <&cru ACLK_ISP0>, <&cru HCLK_ISP0>,
+                     <&cru CLK_ISP0_CORE>, <&cru CLK_ISP0_CORE_MARVIN>,
+                     <&cru CLK_ISP0_CORE_VICAP>;
+            clock-names = "aclk", "hclk", "clk_core",
+                        "clk_core_marvin", "clk_core_vicap";
+            power-domains = <&power RK3588_PD_VI>;
+            iommus = <&isp0_mmu>;
+        };
+    };

-- 
2.47.2

