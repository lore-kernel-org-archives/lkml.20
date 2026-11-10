Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269289;
	b=eUEHJ0mOZtzMC05xZYudbzXA1mNUPyji2H5+FqdqFEhxc8bUkM38CvCO6VSftOx3vxGQ
	 PZyi67Mgf76PNb/hwcpJc9u0jn4JLogub8fn23y5Vgi2gjo0YaD9DjVA3W1pCr1D6Ktq7
	 QoqHetFVc/iednQPxfQy4ZMRXLkXoapymJgAmZpfT4oit+5+pU3VkTQT6DTfdf/r20nK0
	 hUx6WDz8TQE3dkWHyqFC8NrAaOEUsDPwVpYvIZQUGMr3b5fC5vjyNAtkQ2J2sS0jLwVQM
	 Q1R2L/q5Yuz+Ckszpxui64KDOt3NJgoCvVoZHXkEI9dKveMuF+9d6RKyF7K4FgNg4NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
	b=lC/VeFB0eMa7T/Tr1NwUjco9LVxbEl498xZLzmWvJhrv8aMmEyBgQ3Ud1Vc37DgnqDh+
	 d8Lm+QCASaS9yujvKKeItHZf9X8Yd5T+roYvZ3/WL7C3Wc1KjvisN1OEWVP9ILplEYnoB
	 Xeitw/8+ILlFqqot2U9LR21gSx5pixSQa+GsqsB3RaV3bgMCkBHb9jCXJfjTbPIcHPy2c
	 +/2F2+Dvh/4lmxO5w0gaMHrgegftIdvFFU8QTiiNlirZaUE21mmiLbDd30G6gZEbgd7aL
	 4KGtkxjGs27IrqR+a9qAlhZ0yR2Pdw9ZeNjk3WAprwL9zNgZKZjmS1pASt0995go2IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR93sN0J;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017AB60A2609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 017AB60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR93sN0J
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so8528995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269287; x=1794874087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=TR93sN0JjFV2ftO9VMO3mmKie2OgvCyhqtAkn5jH92BrIESPpmCbBKlTf/KudKxMoc
         +dhLdg3CWXQvUfsg3Ax/YBy2cOXyRjPfOsuJmuq4Ipi8zgvynxDmFFg5LK0tbmtEM9K0
         NoaZqZJ4dq3dEyIRI8dvU0crh+QL8kPCTCJVWXjbHRBLeqbcAsUpRBj33F4MvVyS7kFq
         /s1M9Zvh3DhAeQi6pceWe5QV3IlyfcAxuip4wLDbCkfLck/aUBIm+oOAEKmauS5C+qdj
         IcJQhjU91XRCmczDEeadT2AlsDmaBsp9/8tX+V7dQAslaoo08PxSo+k18nFHs1kj61PV
         zGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269287; x=1794874087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QdSlhWqpADpPe9T2ErdMYqWejUZfwswA3oJg9BBjNa4=;
        b=OGkwkvNEQqg1qRuxJSSLsLr2mR9BqVYc2EWmaOp7ZhaE9L+vHMO1AHLSAdgF6riLVO
         uuym/SDJLPEO6iWt+p9yZminPfHuxpvJrsnEjp0RhiPTpwyWfzS25JT7SS64K2rLvK/Z
         MvZ4lq+hGxdiXs78t7OTFMPBSRN/lbvPIzPyCgncyi2li4ue3hbDU2xnuwHV1K2IWsuv
         o2F0aGx8tad3Zr3oxxA5S7Byj2Dk6287Y9M6efiOivst86YeYrFXZY2prwPt7eByWrjb
         Uq/c42nbIav848qI1XwpbfdxURBIjYZ2KjGWAA7vnrCpjc7EEsgjqk6YOQPre3HJ6Ltm
         Zgug==
X-Forwarded-Encrypted: i=1; AL+hErFuZo7CWJKQC/C0McAcphmahsEx6i2SoqYRTsysfaMB5ohbUJkrkwyj/1oyWvhtb+CNrUeWpL/+B/WNMqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OhJlig9+0ToaQD8c8kkFdr2U+PIJ+qt+6xqW1Ue7mSwvgO5i4
	/dtyFQkyfdqexX1xYkIuho4DdaPkOREguFqor+ylFp6PKT0wVvihvulj
X-Gm-Gg: AYBFou0gwAEoG/05Zv+GFfCtcIw2vSzXECvJ5l1YVaOrLmqxm6SI+IZupaV+aSwAjBB
	Zu1eg3vCGqMyKO0LAyGR6qWLItGNeOelKgS4ZiZVuA5uFwPGwpZZ8ifNcU53iUHUp6kMWFU3hue
	J2Z9nSnRbWisUSbbXVWacLhV4uYRQ6Jxtp9EVo3jrSHl17HsbOakoAf6oGso/h0K5zQOf50XMqQ
	QpJ6hCHz8YYaui/QppuTHWP+O7jFVu1RonpZttrnE4SCIEam65NCcNSJNhbYMAg2KdOFSLk9F0M
	eJy5dA4M+QuKWUhCgbtuvawGSUVgdGkEi6irJ08dn8Ml6KCy97fI1cZOT4+KtrcvDzQiju4kzzW
	4CJdW1f2u3B0qkGl/MRvqJJThJQ8sR0Cgr8v0whjIaLkT7NprXNV3TjT6PXwylquYixS4/WAqDg
	TNTVIASgZjoFO2F9Jo92pZia1PghEqfPCHEh+gO+T+kIIF+9aVTj6cgskGzDusMBqT+Im7NW2xd
	BvBJozfIgmR+O/yeLW/1R+8lWeO/KtY/E+Xucknrg0kMLEGSf65hjr7Jhod/LtA7aaSdEKbJ24G
	wBUwoxDlwctayVIFPRIWbnc7QGSbC7J0nP+vs1oqS+EzJVEwAxp7QY5oZwleZTLo7C6kf9XJPPc
	Bw6lvouEOpXoApVA2yMXsDnUSfebdY/6sQLRHCOOxx0BD/6v1bQ==
X-Received: by 2002:a05:600c:55c1:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4ba01db744bmr16387325e9.11.1794269287318;
        Mon, 09 Nov 2026 16:08:07 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:06 -0800 (PST)
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
Subject: [PATCH v12 1/5] dt-bindings: clock: airoha: Document support for AN7583 clock
Date: Tue, 10 Nov 2026 01:07:46 +0100
Message-ID: <20261110000753.508-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 25 +++++++
 include/dt-bindings/clock/en7523-clk.h        |  3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fc37786ac7ed..05cd20ce3ab9 100644
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
@@ -57,12 +58,36 @@ properties:
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
+        - '#reset-cells'
+        - '#phy-cells'
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
index 000000000000..433a5c6180bf
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
+#define AN7583_XPON_XFI_RST		15
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

