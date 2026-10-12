Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CAB43DA4C;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788789; cv=none; b=ke5Alcip6tlt2RrTk1Ziwfn8qZGcGUA02BZaaD0K8QAthgCGwOKO/WveCJx4E7+n/1n79624JgrWic7hjXwad0BHoUmbrSVNFSWivWA6z4mX7Bf21ZaFKFdzf1gPvz3ZwbTDF8Oa2fjdmPOtUvsFLpRRXdF3pBNk20j/Kest9s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788789; c=relaxed/simple;
	bh=wPJsLrkxhzUKYdB94n4ND+0sJIedzi6L9CUpyTZEOW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IEMnWsY+XABeopxXAdgpcsZvO0efpEEMs4ARkZauIC0A+WbHQvZ1HjezEiTkhUnE0HVXKwUF15+n/G6bbKwWCO5YW1faQ/A335F71PznWOwqPPPTZr2M0PrgEyj7uoIBhPoEX3JnB3JIJHupg/MNy/c7As9xAZgwNEQqyqrFvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dfk7CQw4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dfk7CQw4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F52CC2BCFA;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791788789;
	bh=wPJsLrkxhzUKYdB94n4ND+0sJIedzi6L9CUpyTZEOW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Dfk7CQw44SNAIRmCjPu87FO2tiPjZIyW5/gU+48DB1cwptd0xjItVULUlrq4PcMdu
	 ZidnXTUHfYp2LOPC6DuCg+2T7AMt4Urc3gdaj421L9sgHQFjjnfVv4FjpVwLMUWaHz
	 7jPq3zZNpBPXo+UqwmrKrOLnFA/ylY5h+ugUQI1MLUpV0aWwQ9JrSY2nTmS8S6L2lg
	 F7UV0WLpx+1I0IBYF4D5Uf5YYpyRX0SHQ+ULQy3tWjLKKITsVJJAqeANngkd4xDyDv
	 oLRXSPLNZPF2AL9juIiGaYRK3VV6bOcvkbifUPA3F3pf9WI300VoPUx1Zv6BjVeuGA
	 gWWkjujd1LtAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D81BCA9EDC;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 12 Oct 2026 15:06:12 +0800
Subject: [PATCH v11 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791788786; l=3590;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=zyjxN8033m3FgiOPqOUyLqFD8Zb50A574z3Ms3mffuQ=;
 b=LjktZ9rpIl8sZGRFISD2xyH9gBZ8tMRHGvPS6f8X1cYmxDxkQEdi0F4OBqlGcJ0cdJzpQ2wPy
 zAn1AAGZIeoC6LHMzSnt3yGmleAyQAeGl8ztNRuSB4Q+ddZXmwkvDnf
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add bindings for Amlogic hardware decoder accelerator.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
new file mode 100644
index 000000000000..75b9ba3cb08d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
@@ -0,0 +1,114 @@
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
+  interrupt-names:
+    items:
+      - const: hvdec
+      - const: vdec
+
+  clocks:
+    items:
+      - description: Clock for dos core
+      - description: Clock for vdec core
+      - description: Clock for hvdec core
+
+  clock-names:
+    items:
+      - const: dos
+      - const: vdec
+      - const: hvdec
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: vdec
+      - const: hvdec
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
+                    "vdec",
+                    "hvdec";
+      power-domains = <&pwrc PWRC_S4_DOS_VDEC_ID>,
+                      <&pwrc PWRC_S4_DOS_HEVC_ID>;
+      power-domain-names = "vdec",
+                           "hvdec";
+      resets = <&reset RESET_DOS>;
+      amlogic,canvas = <&canvas>;
+      amlogic,secure-monitor = <&sm>;
+    };

-- 
2.42.0


