Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80E440A2C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806407; cv=none; b=ObOBL6PUIJ9kTjSCShqrQcCtnp62KvKu4Rkb8fdCQtDAeI/2/sMRTw51hgspiBJOdrt8JmOXkoVckw+TsNQzEkqKFXfZcerF7YVoxkfDolWvFm7UxhykTt2Htzsws6gxC0CzW0aLsSKVLzd3QXbzxsuSTXR+TnsgB4H1PDIrB7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806407; c=relaxed/simple;
	bh=9gQe7ZwJRkms0gIhZk1W9IBEQkejhnw/iwt5Jas2L3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7ayRwtVGA74IxxhHzpr/P2xYU0mffLahr/NOBWS62UZ5uMztcxZPKLB7XHOjn1VlnA5/66gBt/tADkyAClR0GNSMA+Tx2BPftw512604HliWmyYbn/UDF9iQglRCSN09WhALzgZA+WvcG367fcTr9PhbgMssT3WXKJU56GygqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gykmuSdu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gykmuSdu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1016692f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806403; x=1792411203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNLlR0YvXjvrOwI1ZyczykLX/cGoczyD2gqEtIS6gn4=;
        b=gykmuSdutz6Osx4MI5JgPIdD41+rTyzLCvKsBE0I+Vx7/Ch/wgj/YK/GBd28WchJwL
         reyTMNw+goHtfsZjC1ZAgRi1S0vrqrIvKdlVgJQHnaC08Tjg3ziuATdqhbL5kI8TxZje
         jni27AeghUwPjhWEdc6jg02YKBgV9VTrLeFtcgKWIedxWu6VFiESiP1OZlFo3/IsJ71y
         cHW2X8ZWKZnIvIMZfh1Dvp4MXWcAxi3OVNfkfzHHvTGgjI2DZtLuvLTJwPW7IwJutkju
         HQegKG7GPeLBSoCH6ek5xPPRRXAbZdkj4zPpqsMGlA1v/nNk9l/VoBpef0KSkWK6I2L0
         hekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806403; x=1792411203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QNLlR0YvXjvrOwI1ZyczykLX/cGoczyD2gqEtIS6gn4=;
        b=E/1LFk2aEFkYMo08xtxU8tQrc6G58iHwQ1/cVQAd5oXhIxDZf1bStIo+bXmTvgfOFn
         9wg2mnKzZoXiiNXRgH2tlPwMrWg0MtrHotZqHGzacUvn8WVJs6Re0K7AhXF/itjPn0CD
         RGjn1qIon18UZAtnhkK8sz+6VyXUyoqKPRRGljrBv093yLs8y3lKYxskHnhov5vqi0wi
         QMHe6FDINPQZabwyT6qusjoPCSgj0Xd6OvmNW8ctL88XR1IFsJK5Oi4EnVI4lNx+lXak
         mzxtCzG/2KIBaykFiSaEOkJ1cukU3WcDdEqphsSPwz38a31408pxiRdBTsGwwSOJezLq
         j/3A==
X-Forwarded-Encrypted: i=1; AKwUvBx/yw92mmLHsN5kkA79QhOmZBpMx6p8pBHCNFwuQWVTDx2ESL/Fmp/gpIpKWYOj4lYee3l8XaFHmSi27Ho=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5Lm0ErxH4hGY+CdtaNQA3AQwoienoOJezmkQ7Pm7KGTDTrWN0
	N78MqJ1YWsXIWnibBSznMs4dJE7gCapTR/LncIZOjlROCY7uZLYPkO1x
X-Gm-Gg: AYBFou3BglJvLcEjKa7bN9RB5quiEvCyJbWKLm8Y557Xwuw2J+XeRdjl2/KARWcmCKy
	mj4QLsEma6ve16q5TAvCl5KFQ4O09k3T1BIu8u0xqOBb1WlzrsNeebCTcjMopJmMAmxDS3nRGvC
	jKfW6IZTAV6mwWlGktdyGuCh+SgQKVcCK/s8WhpjL/7wrX6rgb4Pg6EkGFB3EEY/ggRxvzzr9Ej
	y598fcBEi7MHG/3Inh8VL5enxP+8qGOAQfA0EDPOJEmTUFYslbDY0j4RYJlJv+dN8bRb08CvLjl
	sBSqzBe5trDrrtMPcVZn4CKW6wJC+iIbChPUqFEUFdBQu/FYzJCCtAbtKhPXP8g47ZaOHZXtwRB
	sgQ7gKYaG2FsspMoDT1jYA9zEiQPgMT6JKIccjIisRz93XZhatu6DNq7yKy63BXdw+agxogi7bt
	xTmOPmB38ie3jcaqcBDgYH2jWFavTkoJmBDpTkDlkquX1Kan4yvO8ZetolBI2D+mm3zBV9M+wlx
	xXKxMRDOXBChfxxuKUf2bm7+TUGG4FiNy7oFkGTKX1B6sqs/t5GKVjiAU8ZCJxzVAxi31Y8mWFs
	UMbTTQvfpttG3xRsbsrJ6+2Rdnkv2c5u4Q==
X-Received: by 2002:a5d:5886:0:b0:48c:718a:b266 with SMTP id ffacd0b85a97d-48dbaced581mr15219037f8f.47.1791806402553;
        Mon, 12 Oct 2026 05:00:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20234313f8f.9.2026.10.12.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:00:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 1/3] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Mon, 12 Oct 2026 13:59:51 +0200
Message-ID: <20261012115954.92718-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115954.92718-1-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN7583 clock. This is based on the EN7523
clock schema with the new requirement of the "airoha,chip-scu".

The register for clock and reset for normal system and PCIe are scattered
between the "SCU" and "chip SCU" registers (they are 2 different register
block, the name is taken from the programming guide)

- Chip SCU provide register access to some clk gate and clk rate
- SCU provide register for reset, PCIe clock, other clock gate and PHY
  SERDES.

Upcoming and current airoha clock driver all follow this pattern of
declaring one of the 2 register and use a sysconf for the other as the 2
register block are tighlty coupled.

EN7581 internally handle the syscon with a direct reference by the use of
syscon_regmap_lookup_by_compatible while AN7583 wants to make this
explicit in DT with the new "airoha,chip-scu" phandle.

Similar to EN7581, also AN7583 permit the selection of the serdes line.

Add additional binding for additional clock and reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 23 +++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..8b94113d00ab 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -31,6 +31,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,an7583-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -57,12 +58,34 @@ properties:
       available serdes port.
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the Chip SCU providing the registers required
+      for configuring the PCIe related clocks and resets.
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-scu
+
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+      required:
+        - airoha,chip-scu
+
+    else:
+      properties:
+        airoha,chip-scu: false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index edfa64045f52..0fbbcb7b1b25 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -14,4 +14,7 @@
 
 #define EN7581_CLK_EMMC		8
 
+#define AN7583_CLK_MDIO0	9
+#define AN7583_CLK_MDIO1	10
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
new file mode 100644
index 000000000000..410e19802cf7
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7583-reset.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
+
+/* RST_CTRL2 */
+#define AN7583_XPON_PHY_RST		 0
+#define AN7583_GPON_OLT_RST		 1
+#define AN7583_CPU_TIMER2_RST		 2
+#define AN7583_HSUART_RST		 3
+#define AN7583_UART4_RST		 4
+#define AN7583_UART5_RST		 5
+#define AN7583_I2C2_RST			 6
+#define AN7583_XSI_MAC_RST		 7
+#define AN7583_XSI_PHY_RST		 8
+#define AN7583_NPU_RST			 9
+#define AN7583_TRNG_MSTART_RST		10
+#define AN7583_DUAL_HSI0_RST		11
+#define AN7583_DUAL_HSI1_RST		12
+#define AN7583_DUAL_HSI0_MAC_RST	13
+#define AN7583_DUAL_HSI1_MAC_RST	14
+#define AN7583_XPON_XFI_RST             15
+#define AN7583_WDMA_RST			16
+#define AN7583_WOE0_RST			17
+#define AN7583_HSDMA_RST		18
+#define AN7583_TDMA_RST			19
+#define AN7583_EMMC_RST			20
+#define AN7583_SOE_RST			21
+#define AN7583_XFP_MAC_RST		22
+#define AN7583_MDIO0_RST		23
+#define AN7583_MDIO1_RST		24
+/* RST_CTRL1 */
+#define AN7583_PCM1_ZSI_ISI_RST		25
+#define AN7583_FE_PDMA_RST		26
+#define AN7583_FE_QDMA_RST		27
+#define AN7583_PCM_SPIWP_RST		28
+#define AN7583_CRYPTO_RST		29
+#define AN7583_TIMER_RST		30
+#define AN7583_PCM1_RST			31
+#define AN7583_UART_RST			32
+#define AN7583_GPIO_RST			33
+#define AN7583_GDMA_RST			34
+#define AN7583_I2C_MASTER_RST		35
+#define AN7583_PCM2_ZSI_ISI_RST		36
+#define AN7583_SFC_RST			37
+#define AN7583_UART2_RST		38
+#define AN7583_GDMP_RST			39
+#define AN7583_FE_RST			40
+#define AN7583_USB_HOST_P0_RST		41
+#define AN7583_GSW_RST			42
+#define AN7583_SFC2_PCM_RST		43
+#define AN7583_PCIE0_RST		44
+#define AN7583_PCIE1_RST		45
+#define AN7583_CPU_TIMER_RST		46
+#define AN7583_PCIE_HB_RST		47
+#define AN7583_XPON_MAC_RST		48
+/* RST_PCIC */
+#define AN7583_PCIC_PERSTOUT0_RST	49
+#define AN7583_PCIC_PERSTOUT1_RST	50
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_ */
-- 
2.55.0

