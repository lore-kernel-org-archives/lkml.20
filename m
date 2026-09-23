Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2851DC198
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194661; cv=none; b=JyF1inMsVvSBhAGzkBmweLBjWEnybeiCqp5itCA9dKra9Mx7xrZQwW6vO60kzS3RyQMqzZZ3xMuPMbDzs8xo4nMBYuGWn2pM80jrxcbdsWQ5YzU5gg4V92y17llthoETC/kPkE9Y2dDSf3iZ2vqT+7j07ZzikKg22DNRCinvfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194661; c=relaxed/simple;
	bh=IRhuTM0kLZsYFMp3Lrgkw0bn0kAOxMdvDnoLmBzNWoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nWBgKKN7ebbHBJmyH9SrfKQx149sxGGdih2/sw95eKss+pzWeKygJcVq0MFHvYAS6ooFf3q+U7lb25btUwI5enRWnolIye+qZ+UnIqBl1h6f1uFWR8X1Vs4OEq04YZU8ab9Ot3IEMSl0kti9DHb02a/f/EhJ1AheaPZlBKxLNxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJL6yBLW; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJL6yBLW"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so161721466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194654; x=1790799454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgPtV1IXszkLhG6uHST7dgneJNufVJJ9/BLgDeMeRlk=;
        b=ZJL6yBLWkBcJzrLYyUTdEfCIA+QPROzG80OrQGmhnGm5TxpYKY5ZnsNw2Y09qciGfX
         3eV2H8ffg5t+LX3xzHYr/8NJnEMkqZfWjQWMMKqoDkoNdZqzj0uXH9Uo1EQgL+H4Oo8k
         cUOxEFuuP0D8/LQYNZjgkVSAhv+GvnE4NhZDbllSKsNrK8UaS3Afcf+g7oD/kP+J6mVj
         VXFgUSX6fJA1D85JGezKrCPXEIUTLpSqld2TYYW2H++yQXsWYGktjfOXgOs0kbe58F+4
         j8Rb5JyFK/aS9PYaHFxCPhpx4852Sy5oUUz4v+MFh1zGA/yynES7YltbBvYI0gRoJdRf
         zBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194654; x=1790799454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgPtV1IXszkLhG6uHST7dgneJNufVJJ9/BLgDeMeRlk=;
        b=sojp9BOcdjFhRbvhRY9Og3UsPwRVGZcSOp27+u5b44Ui5OL61CXNR33jWWnEtfZ98K
         iynvceBgdvU/oPXXA9cXRSYZ59O3IwTpcw+4tVDHmX53x49/2DYXTMf4IDUaxE+y2bJ/
         sBZ9kMxPzSgvNkocqxW9gwADs7EsirvYvlJs+PLMHTv2wctATchVKiP7MJpYqzhvdTOL
         3miG+pgBgqeGwgTgOvyYfyxXMfTx2R0ByUmPY75ng0nqvSsgG15xeCIG2/hIwd65wXLV
         ZjEctnhys2RXpZJxLdu9pp11DiD1kzllCFLM0ksvXbsQfkdTMLP1I2EnTDdtHuQ1go1Z
         R9bw==
X-Forwarded-Encrypted: i=1; AKwUvBxuLgKj2FcdQ6nSRTLcEM4cppLCYLiD0GapdFXzjw6oULI+rB2DzPdn0qMOGEqf0yaS1RUamVyGr35VTHU=@vger.kernel.org
X-Gm-Message-State: AFuF++mG3HzphTwMbmwMUZPsG1ADiN2n7BdrWZZGllQUaEsq3fFFevlQ
	hpi3n90k6u/DIT2Gqnsi+QZGBOIAeMeszEDoCOXQGMfceazD7Q4bhcFL
X-Gm-Gg: AYBFou3fm1pUfzfBleWjPW0yzBpuSjNxLTdFyyWfpkzIL7CH0Wy9LvQuF4CHHQSzTIP
	KnV0n0Fj/0M9JUCWNudJdbXzzRQD6vRR7PRq7NMzUsaQ36HQngjpzZqG5OWdWlELN0kHCNnWzDx
	FmO8/Lfs4LUgppN1n1PAlD4ZRNKEQnYeXHseVS5iFkXVOTjR6XHBtE6oTgvfKx4eJdwiTtmJltp
	QksVCkbDQPR+gzGxN7J1zuEK37NOADm+Ywd3h1MlSYUVHQWg1BtMc1G7oTuo3pI/aFTkZzxg1x1
	dKfM5IboStZB5Koh7vy1JVF80zfWAbVLaOloqksMRUe/+s897dYQC19miCtREKqORY8EAwH6Jng
	ucMPIP80G8PGUYWW8TPMZcwKz0VxCr6nbAwAqjO2uY34qKwKO3rG+UJpo0yagB03NZ7h+wmsUU3
	s5n/YSN8FSgtFUNM+U9tlUmM4gXL+3xu3eg79gepfESByTs6/kEzrMMqyfDyNyD+pmK7AJnb4VT
	iC47hl4TE9+798q+Ld4pQFIQqrGAqfA
X-Received: by 2002:a17:907:9452:b0:c29:4b79:e41a with SMTP id a640c23a62f3a-c2ac24cf5c4mr18473566b.20.1790194654447;
        Wed, 23 Sep 2026 13:17:34 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:17:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 01/11] dt-bindings: clock: add Allwinner B288 CCU
Date: Wed, 23 Sep 2026 21:16:51 +0100
Message-ID: <20260923201701.43391-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../clock/allwinner,sun8i-b288-ccu.yaml       | 55 ++++++++++++
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 90 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
new file mode 100644
index 000000000000..22b59d5b652c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/allwinner,sun8i-b288-ccu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner B288 Clock Control Unit
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+properties:
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  compatible:
+    const: allwinner,sun8i-b288-ccu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: hosc
+      - const: losc
+
+required:
+  - "#clock-cells"
+  - "#reset-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    ccu: clock-controller@1c20000 {
+        compatible = "allwinner,sun8i-b288-ccu";
+        reg = <0x01c20000 0x400>;
+        clocks = <&osc24M>, <&osc32k>;
+        clock-names = "hosc", "losc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..3dc1704d001e
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_SDMMC0_BUS	34
+#define CLK_BUS_SDMMC1_BUS	35
+#define CLK_BUS_SDMMC2_BUS	36
+#define CLK_BUS_SDMMC3_BUS	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_USBOHCI0	46
+#define CLK_BUS_USBEHCI0	47
+#define CLK_BUS_USBOTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI_S	52
+#define CLK_BUS_CSI_M	53
+#define CLK_BUS_CSI_MISC	54
+#define CLK_BUS_ADDA	55
+#define CLK_BUS_SDRAM	56
+#define CLK_BUS_PSRAM	57
+#define CLK_BUS_DMA	58
+#define CLK_BUS_UART0	59
+#define CLK_BUS_UART1	60
+#define CLK_BUS_UART2	61
+#define CLK_BUS_UART3	62
+#define CLK_BUS_UART4	63
+#define CLK_BUS_UART5	64
+#define CLK_BUS_TWI0	65
+#define CLK_BUS_TWI1	66
+#define CLK_BUS_TWI2	67
+#define CLK_BUS_PIO	68
+#define CLK_BUS_GPADC	69
+#define CLK_BUS_KEYADC	70
+
+/*
+ * mmc0 and mmc1 are v4p1x controllers driven in the old timing mode, which
+ * needs the sample and output phase clocks. mmc2 and mmc3 are newer blocks
+ * that do their own delay calibration and have none.
+ */
+#define CLK_MMC0_SAMPLE	71
+#define CLK_MMC0_OUTPUT	72
+#define CLK_MMC1_SAMPLE	73
+#define CLK_MMC1_OUTPUT	74
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..675145654548
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USBPHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_ADDA	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.53.0

