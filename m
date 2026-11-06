Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953838;
	b=bSjqaqhTV3rjsxoGKFUd9swPlK7dlX/WZrdPxkiYWaDZn4IPY1xWixsPLURTqKugkC5l
	 4emRDqtK0aaJRUxGIrT/zbUaIOp0RN7m5wiQKBMUhOS8vu2YVr7shbDLMcfcwdHrl02ug
	 +pwpJ2J2WK3NCCSlIDBkZ6aMigwQ65VN+wSAuC7bGqiKL6Y4OtaZgX5KwV51H3UOrRPCa
	 3HS0uAwy+KH4/hUHeYVgrmkDIbC/iLEG1+Md4pgWIFEIPlWoE+yxBva9NoG7eqMiPGkDD
	 gkqS1vFE3AZroV+2Bc0WtvBBRgdlM5l1OzQrK7oaBP1/BPcuVYRRIljcFoJFMz4D0KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=b25tkkPNAeRRnpE+CMTponpLZXifzTvvMAoqNcMPDG8=;
	b=0yGEigQ7J61kM6Od2nSLqtt/Rz5AK96YhqXP3ORQr1+Q1BIGnk5zOufOfVRvbEJ5FyYo
	 8XKlZlA6zoROjzKsYIisg17hqs5MjABRwo6Gn0P0gQS4GiCYWSbufqSjJlIQiGsfSxgd1
	 qNGRN6mjUZOHzgas44tS/czEvO5E6Ft5TLwwp+V9RYXRBE4FINnX0DkgNbJKXfuDuaEXV
	 r+cMrCEnUd7JRbd0fvT7DNEHgHYL1ly68iHaConD4VJCVGUYX4cHaBAIp4iqIsvjI1ZaT
	 g9FvlLNhB979b8rAU5YkWy7P4amCaHOm6AWNJCIlONEkNo6uzCB6cYEswjvUC2Fh2tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MQzhgVuq;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B63606D826
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B63606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MQzhgVuq
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3edaso220582f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953837; x=1794558637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b25tkkPNAeRRnpE+CMTponpLZXifzTvvMAoqNcMPDG8=;
        b=MQzhgVuqv9aCoMgN5m/GJk5548Kc+RKc3fi+W1wagAe0Jvf4cRo7RkdDQib4+4IKBr
         awlrWOpV9qRQdVq5pRLW5xRzUoFA7vOIF/DIkZakAK/LKtujLWcVvKXZA4A4wa5feadX
         00ljeVAGLZdLpRD+VkAq/tlkiWGeDT38+0/M0/S6/kKdNzOI0jsabLZl2Uxby1KIU8xF
         WthxojxM/+wmhbew4q5QmTKtnxCcsy404B8zIeIJ4KsHBaiZ/9W4ZPX0x9+nmR8jkluR
         cGJ+h0EN8WW0jgnFmaiPjtN0tvHdNk/f3TGoKXf9qSTHRgZ0/vulm3kYQSlIYdTI6bmJ
         3R6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953837; x=1794558637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b25tkkPNAeRRnpE+CMTponpLZXifzTvvMAoqNcMPDG8=;
        b=x7xouPtjgABGcQe2GIoF22JdtFlkmdGrKokBDwLcML+NK5+HOWTRL8+pFtilc4NpPX
         teUEiPJOxS3IWquWCEdDc8dKpBSQhTs8FLnlayq119VhwLZiCq9yl8VcReOSUTadJMha
         6PGJHgXapyGF7mWR2/tMYsI90iTkqdFlgWIFBiYCgMJ3JpiHu6GNYc+fD+VEDL8qokf0
         ejJpZRVEZ38AwllgrOwnSWwoJHTLwVYoCjaAwlqTjCw3qWUGmXstub79mYgfLUbx7keh
         sTYoczdyDok7NuJzwZc0UyJ6IGF0vPmD9jPslYuWRARYJCBZK2RdeunZrF5NP0bntu29
         gCWw==
X-Forwarded-Encrypted: i=1; AL+hErHqFo7gJOfq1IvPgF6s0JXM7q78e+DtkhhBx1hE4OfdKL3bnDEAr0IwDy2+r2n7Efu+jSiLzQspMWFSIe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vqzj8CeM70AW7iM1Zy1OySqYGNG83bXG2e7k8JGzWHayjF6m6
	UFv2oaVIfj5tnqhjf7Fhyy2wGoUS3j5hGmbA2081+jnkcl96mYuMMIAG59w28gpTi90=
X-Gm-Gg: AYBFou0UIE2Xh12/L8U7EO8sabVZchsAMt7ezO9hLvH8ww38WDFh+rcFDHOWnfOPuDH
	cATbW/Io4W1htUAOptr1uYCrYdvZBd9R68L0utX/OpK5lUpvPkbAetDRTKA418dZrcNAgYSe/72
	OTcPaupSOrNNycPGniNd/pnSTyrFujjmRTlrO8PrHdQzQDZ1T42SHoiYNEsJgZXkpFKqJ8utqpD
	ZCRJPHbs+THKOd5W8ZO7ldGdlCYl7YOftJC+4v2CgUMe0x0GbddnD3xMBVqqQjiv4hGWHpdIIEi
	d7mZT9NU1CsHnvPzbGlNPWjCpmakWFlgebGIN3kQjLBQS7tdz61vqtPS0EsWSLg8qXe4/FioO7L
	cYBHzlj8JfZuqORTaf/Dj0obduvfeFuyDQ37p7NSIUeWq7Gd/tA+7cB+fdjqyHIgPW9Bsq8WN8+
	cX6SCbuLryz7e8Bcrl0NZK1QME4D8KlGucZNTpVokw/8ZZ56WL/FhXEsVrMdTlKO7ji2N3POlMF
	jNExjv2FBmHlq2VMf5JCnHUv+1BLbjKocSrAOX0uByX5APcwEZwXYoi3Xd6nfqHY+BkZlOD5hUt
	PiGvoEQlin50TtkLEBizAgUQ3gD13JAAIeEAw4c7ld+a8aszmkrRDz9eBnNuMAi/1y8GBXaWAFD
	bhPJqWp46wP2sVCB3lwOmi5FxPg5X07Ov8y5hZggInx2Hdw==
X-Received: by 2002:a05:6000:469b:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-4911ab4c665mr5700123f8f.29.1793953836751;
        Fri, 06 Nov 2026 00:30:36 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:36 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:27 +0100
Subject: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The S7 PLL controller supplies clock sources for the peripheral clock
tree and receives its reference clocks through firmware-controlled
oscillator gates.

Add the binding and clock identifiers needed to describe this
controller and its connections.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 73 ++++++++++++++++++++++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
new file mode 100644
index 000000000000..e2b5ba5524a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S7 Series PLL Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Carlo Caione <ccaione@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,s7-pll-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: input fixed pll
+      - description: input gp0 pll
+      - description: input hifi pll
+      - description: input hifi1 pll
+      - description: input hdmi pll
+
+  clock-names:
+    items:
+      - const: fix
+      - const: gp0
+      - const: hifi
+      - const: hifi1
+      - const: hdmi
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@8000 {
+            compatible = "amlogic,s7-pll-clkc";
+            reg = <0x0 0x8000 0x0 0x1e8>;
+            #clock-cells = <1>;
+            clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_TOP_PLL_OSC>,
+                     <&scmi_clk CLKID_HDMI_PLL_OSC>;
+            clock-names = "fix",
+                          "gp0",
+                          "hifi",
+                          "hifi1",
+                          "hdmi";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
new file mode 100644
index 000000000000..4014314a3eb0
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
+
+#define CLKID_FIXED_PLL_VCO			0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2_DIV			2
+#define CLKID_FCLK_DIV2				3
+#define CLKID_FCLK_DIV3_DIV			4
+#define CLKID_FCLK_DIV3				5
+#define CLKID_FCLK_DIV4_DIV			6
+#define CLKID_FCLK_DIV4				7
+#define CLKID_FCLK_DIV5_DIV			8
+#define CLKID_FCLK_DIV5				9
+#define CLKID_FCLK_DIV7_DIV			10
+#define CLKID_FCLK_DIV7				11
+#define CLKID_FCLK_DIV2P5_DIV			12
+#define CLKID_FCLK_DIV2P5			13
+#define CLKID_GP0_PLL_DIV0P5			14
+#define CLKID_GP0_PLL_VCO			15
+#define CLKID_GP0_PLL				16
+#define CLKID_HIFI_PLL_DIV0P5			17
+#define CLKID_HIFI_PLL_VCO			18
+#define CLKID_HIFI_PLL				19
+#define CLKID_HIFI1_PLL_DIV0P5			20
+#define CLKID_HIFI1_PLL_VCO			21
+#define CLKID_HIFI1_PLL				22
+#define CLKID_HDMI_PLL_DIV0P5			23
+#define CLKID_HDMI_PLL_VCO			24
+#define CLKID_HDMI_PLL_OD0			25
+#define CLKID_HDMI_PLL_OD1			26
+#define CLKID_HDMI_PLL				27
+#define CLKID_HDMI_PLL_PIX_DIV5			28
+#define CLKID_HDMI_PLL_PIX_DIV6P25		29
+#define CLKID_HDMI_PLL_PIX_DIV7P5		30
+#define CLKID_HDMI_PLL_PIX			31
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */

-- 
2.56.0

