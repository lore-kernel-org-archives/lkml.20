Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04203D7A0F;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165135; cv=none; b=qZpc3WVidsd9AHfk4DIHNZmzupOAX8SXAomdLTCgwmCpyY0eyWaQlJkyp8UIZvSw1bu2JOyPbQ3GIyvwzwgbm8fG7LLBVcucUr2fB3f3dbHn0hLrlsFzUYODP6OzczhBcgtmEcau+eIBg6okK0YUYWBDzf3J67VgJEhAuo5YfU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165135; c=relaxed/simple;
	bh=6uhrYpOtVZLp88TeIyr7vc0Cn3M9as0VJK52Z8yLVz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ld++8xVcyOF/UdmMam9HrRk4TyrVaOx10NgslOIKgpTdBO4Jy0l0ip8Nq15vHBIUZE/Gmxgkk0XFF9lUAvkevnlr1EZ0Sb4b0YHofLgWtpxEPQ+bcKF+kgFEWTc20KfPteq4BSt8meGxY2nDFxiMaNDn3en0I4c0f56rB+kaim8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtJqBi/5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtJqBi/5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3105EC2BCFD;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788165135;
	bh=6uhrYpOtVZLp88TeIyr7vc0Cn3M9as0VJK52Z8yLVz0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TtJqBi/5zSJjGJbAxk4QtGwAhmL72xSWjS69eALP0RMRP1vM61jzHkUDvnqv7V1T/
	 kP3MPgEffnlXFslDUqEyNTeYi/fPom3WSyYPU6bvJQ/ER7finrGHOjk8RoiHzQM02i
	 8tBn/JwgSuDlzN8Sfua33xDM8HiQc4FtQuZjQ/BHIsraZSj/tBiRAeFYTMVW+L7P0A
	 Okq6zZ3NcA2kxmkJNKa0u7iXBmtC6OyZM+h9XbcLjZeHLsSbc64EMlKapTRKCkA5CY
	 kB6cytETULSX2ego62dM+K4DecT5MDt0hm1ZPV7qDqYtAwzNMiif8zJdZhGhSkMSBt
	 DFRNVeKKfgiaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B018C624C6;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 31 Aug 2026 16:32:04 +0800
Subject: [PATCH v8 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788165132; l=3483;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ulRIFePdp9aejiMT2s8F2+Ow8Q3VDBAIg+orPFx2ohY=;
 b=mDdgapk1uYA1ln/mZ7NZk5bP9DNpZBgRlWlW2w7up1Fy+dqMTCOC8tw/3L0tLWDmcr8hmo3wS
 qRKisrRIJcwCY2EjxHEOQG7NGXotDOfaFgCekV6JPy+kcjLFHj2ziGl
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Describe the initial support for the V4L2 stateless video decoder
driver used with the Amlogic S4 (S805X2) platform.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
new file mode 100644
index 000000000000..a93a2140801b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Video Decode Accelerator
+
+maintainers:
+  - Zhentao Guo <zhentao.guo@amlogic.com>
+
+description:
+  The Video Decoder Accelerator present on Amlogic SOCs.
+  It supports stateless h264 decoding.
+
+properties:
+  compatible:
+    const: amlogic,s4-vdec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dos
+      - const: dmc
+
+  interrupts:
+    maxItems: 2
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: dos
+      - const: core_vdec
+      - const: core_hvdec
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: dos_vdec
+      - const: dos_hvdec
+
+  resets:
+    maxItems: 1
+
+  amlogic,canvas:
+    description: Canvas maintains an index-to-physical-address
+     mapping table that allows the 16-bit AMRISC decoder core
+     to access 32-bit or 64-bit physical address.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  amlogic,secure-monitor:
+    description: Used to decrypt and load the signed decoder
+     firmware through ARM SMC (Secure Monitor Call).
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - amlogic,canvas
+  - amlogic,secure-monitor
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
+    #include <dt-bindings/power/meson-s4-power.h>
+    #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
+    video-codec@fe320000 {
+      compatible = "amlogic,s4-vdec";
+      reg = <0xfe320000 0x10000>,
+            <0xfe036000 0x20>;
+      reg-names = "dos",
+                  "dmc";
+      interrupts = <GIC_SPI 91 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 92 IRQ_TYPE_EDGE_RISING>;
+      clocks = <&clkc_periphs CLKID_DOS>,
+               <&clkc_periphs CLKID_VDEC_SEL>,
+               <&clkc_periphs CLKID_HEVCF_SEL>;
+      clock-names = "dos",
+                    "core_vdec",
+                    "core_hvdec";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "dos_vdec",
+                           "dos_hvdec";
+      resets = <&reset RESET_DOS>;
+      amlogic,canvas = <&canvas>;
+      amlogic,secure-monitor = <&sm>;
+    };

-- 
2.42.0


