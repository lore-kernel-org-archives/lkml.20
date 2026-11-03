Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672538;
	b=qTtlbrxSO2oVAuRl9GRIQqHGdIoGGh4i7SdgWTVFMdk1CdRzXjBAawJgq2xzefFwe3s4
	 BbhjPTjiJyDzllGSt4uoIrfhYysqjS3qV/8E1L3UQChMSf2Eg72W83JBOAwImS2mobwF5
	 74QBJaQ/VwdPVyBwshhMLCNq64Hplr8vmSlqJkVa7cmUvojtNJ/H9WLb8+ZbZldDcr40p
	 gZ3RkUoSEf8oRSA72xWG/q6PuBHpDVPDzuUz4acmxkEciGHmEADf00uYWRLm0fginEiZW
	 Er+SQHpc4MmnuoiVz73i7eUlw856chKU7qHJ9u13aLzwIOYbb5vzJbt5YgriruKsf9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c6o6PLfOQ/7KuRbl8bHOcYkGmLHd5N5tTbX+9m2iR9o=;
	b=VTNmsj3MEQVyvD2gK3CI/9yhfYrjA+Etx00edGQ1bsRLPljg+5cn7P2ab4TuvNAsCRoh
	 EAlFtJogtzQZup1tkbHDSFcTxAJRZPkSLnvNaW47oQCBr7KoWOLIKM8IfVO9cA7gHI5a+
	 zsKUSEzFko0YmgwRhdcYoAHQaVGeEs3oyEswtg/ZyWrqaS6E2MmzpluG8bdCFHFRdPV3E
	 rnLD3aW7DIjVsOHfaIK4GB1GzoBSdLBBWl56qmoZF56Ipkh+hVQviAhMd4oN+JQY3ueBC
	 QjH5ghm+yKpNl/aWZ7rFzeemqeVHVu+/6WNPmZS9gcs5xvaTKHQvq5ilARYvt0EBPIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2TT2Anp;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DF4606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DF4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2TT2Anp
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e812e2b31bso21730125ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672538; x=1794277338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6o6PLfOQ/7KuRbl8bHOcYkGmLHd5N5tTbX+9m2iR9o=;
        b=m2TT2Anp45931/GbpPEfD/jEZWQDpLLp5MNAFB0D+d4TLBq6QJ6swR9O39ofTgNgBj
         eqY0UTxeAd1ot3BtcdwpqCxipc+7EUclOjtxBtOHUDoqrrWVlaRzadNb+rx0SN/omHg7
         u/54ORaaNI78u0d1f3z1uc66QgyLMQcDIbFC7nBAnL9Dj7VwIuNHgb4agSFVXhvbMWcB
         tcCm0eS7lLEiivtuY27U9NhreZhMULytjVms5Rf/+zGjsS1pRDFLTXC2YmIiAO0tBHmy
         mleiO6f54qJ/uDQMTL37SvmwHAYcbmKnwHO5DX29ejGu1zl38s8FcOjPsPOSc47+USNk
         97cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672538; x=1794277338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6o6PLfOQ/7KuRbl8bHOcYkGmLHd5N5tTbX+9m2iR9o=;
        b=T66jv7fD0051/L2O1IQLpKC1yzWMePvj6XmfVBQPRKqqNrBiHmg/gLlcPZLF7b8t9Q
         Q0ftm/Dfcxsgq7Wy9AO8M/3cetOHozQrn+YtQGCVm4Lwy4WvKHXFmTYsefQtR2v98H1x
         /HZ8i65NieFbt+QDvZyRs1tbIqZllEYyKmi9v/PTkPJKGOg5kyjQWhOsD1eRChdZ7r7u
         i3+cpfhQfCQZh011st1cm8BsZakfOZ00BVn8HflN7B4HkIqx1NlIoI+8fhEvoMRfWm++
         o54x0g+rRK4xTpMqaXOHn/D3XMFs7kiLPdMIkD5fAS3w2X2SiHKMzLYO5OGJj/w+Kt5I
         689w==
X-Forwarded-Encrypted: i=1; AKwUvBwmasXFxH4A7TSOjclu4FLrTiHIutreEo3Vj9wzyjtbDBJ8j5PNs2cExt3wpDsTG3I92xlAlGu1vd3YnI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hyVlaLsmPCI9Eq4n+1JkR5NI0Q9ejy2g+yFtqPXmTzpqvU5RW
	86oV/QjjsDkaXCstX7XOtpHqu7Vpp0xwkxnQg1QzS1m0RWwIGpQTe1qV
X-Gm-Gg: AYBFou3Cbaz83oN/3b64BlGTgVhE8q2Z1AVusbZ7y13vyPztOnlNMq2iq2x+VqVg3b+
	yg4Dr1dQKZ84CCyiQdfYF/hdL7sADhEQJrS+sJfY2chgHD6448pV6H2XO/W1KmtgJe8UDyohSPc
	AnO491pZX3bIoPtOzRB9Vki9Bd4VjvNQPZbTD2ILdTA42ymkk/CelnmNxFFnvVsShgsP439R1fw
	6zh50gl6dmizfh9e2fXTOmMjv4QDNOhkPocIQY9ZFOGA4oGyISMoH3pHCBmwLP4pnZg/eDaI3k3
	i4LWLrFL2JOdoEAt9A9h4gaJ6l6stNM795qQIwwcLHyEZqyqIJGK5KwKUslGtyGf8lvVxVW4sgu
	6W4rhRZak84QALAGt7WEnoUEidYmS17wQITyleTRBjyudyi+i1ZkM/MBmpQR5OxXU7+QMN9bgfX
	TUOZqTqRFGOZgKPpgtK5K4OUx72Ft3anPWxkreT0LQnEgmxC1drk761JEPoaWxziUe5c0POyXAl
	B2h08aftFYKkJNyi7cfIQyBYO+NGID2H4sWULLQ8ftT2CDZiOza4VoD/rukOBXHq1dGsOS/hvLU
	S8z4EhzSycHK7v00McP4sWqTN38FmI9p1OGC7m8xW3pFVrbHMonwrVr7Vl9TRi2FbKnhJ57WX0O
	0ua4i+zdREWVvEVg=
X-Received: by 2002:a17:90b:4a46:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3ae8953617fmr10497917a91.3.1793672537642;
        Mon, 02 Nov 2026 18:22:17 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm1570124a91.5.2026.11.02.18.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:22:17 -0800 (PST)
From: Shan-Chun Hung <shanchun1218@gmail.com>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Shan-Chun Hung <shanchun1218@gmail.com>
Subject: [PATCH 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document MA35D1 PDMA controller
Date: Tue,  3 Nov 2026 10:22:01 +0800
Message-Id: <20261103022202.2139674-2-shanchun1218@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103022202.2139674-1-shanchun1218@gmail.com>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
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

Add binding for Nuvoton MA35D1 PDMA controller.

Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
---
 .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 +++++++++++
 include/dt-bindings/dma/ma35d1-pdma.h         | 113 ++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
 create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h

diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
new file mode 100644
index 000000000000..cd752571242c
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PDMA controller
+
+description:
+  This describes the devicetree bindings for four Peripheral DMA engines to perform
+  memory-to-memory, memory-to-peripheral, or peripheral-to-memory data transfer
+  capable of supporting 10 channels, implemented in Nuvoton MA35D1 SoCs.
+
+maintainers:
+  - Shan-Chun Hung <shanchun1218@gmail.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-pdma
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#dma-cells":
+    const: 2
+    description:
+      The first cell is the channel number. The second cell is the
+      peripheral request source (REQSRC) selection, which defines which
+      peripheral is connected to that PDMA channel.
+
+  dma-channels:
+    const: 10
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - "#dma-cells"
+  - dma-channels
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@40080000 {
+            compatible = "nuvoton,ma35d1-pdma";
+            reg = <0x0 0x40080000 0x0 0x2000>;
+            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk PDMA0_GATE>;
+            #dma-cells = <2>;
+            dma-channels = <10>;
+        };
+    };
+
+...
diff --git a/include/dt-bindings/dma/ma35d1-pdma.h b/include/dt-bindings/dma/ma35d1-pdma.h
new file mode 100644
index 000000000000..0ddc99d29661
--- /dev/null
+++ b/include/dt-bindings/dma/ma35d1-pdma.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ */
+
+#ifndef __DT_BINDINGS_DMA_MA35D1_PDMA_H__
+#define __DT_BINDINGS_DMA_MA35D1_PDMA_H__
+
+#define MA35D1_PDMA_MEM			0
+#define MA35D1_PDMA_UART0_TX		4
+#define MA35D1_PDMA_UART0_RX		5
+#define MA35D1_PDMA_UART1_TX		6
+#define MA35D1_PDMA_UART1_RX		7
+#define MA35D1_PDMA_UART2_TX		8
+#define MA35D1_PDMA_UART2_RX		9
+#define MA35D1_PDMA_UART3_TX		10
+#define MA35D1_PDMA_UART3_RX		11
+#define MA35D1_PDMA_UART4_TX		12
+#define MA35D1_PDMA_UART4_RX		13
+#define MA35D1_PDMA_UART5_TX		14
+#define MA35D1_PDMA_UART5_RX		15
+#define MA35D1_PDMA_UART6_TX		16
+#define MA35D1_PDMA_UART6_RX		17
+#define MA35D1_PDMA_UART7_TX		18
+#define MA35D1_PDMA_UART7_RX		19
+#define MA35D1_PDMA_UART8_TX		20
+#define MA35D1_PDMA_UART8_RX		21
+#define MA35D1_PDMA_UART9_TX		22
+#define MA35D1_PDMA_UART9_RX		23
+#define MA35D1_PDMA_UART10_TX		24
+#define MA35D1_PDMA_UART10_RX		25
+#define MA35D1_PDMA_UART11_TX		26
+#define MA35D1_PDMA_UART11_RX		27
+#define MA35D1_PDMA_UART12_TX		28
+#define MA35D1_PDMA_UART12_RX		29
+#define MA35D1_PDMA_UART13_TX		30
+#define MA35D1_PDMA_UART13_RX		31
+#define MA35D1_PDMA_UART14_TX		32
+#define MA35D1_PDMA_UART14_RX		33
+#define MA35D1_PDMA_UART15_TX		34
+#define MA35D1_PDMA_UART15_RX		35
+#define MA35D1_PDMA_UART16_TX		36
+#define MA35D1_PDMA_UART16_RX		37
+#define MA35D1_PDMA_QSPI0_TX		54
+#define MA35D1_PDMA_QSPI0_RX		55
+#define MA35D1_PDMA_QSPI1_TX		56
+#define MA35D1_PDMA_QSPI1_RX		57
+#define MA35D1_PDMA_SPI0_TX		60
+#define MA35D1_PDMA_SPI0_RX		61
+#define MA35D1_PDMA_SPI1_TX		62
+#define MA35D1_PDMA_SPI1_RX		63
+#define MA35D1_PDMA_SPI2_TX		64
+#define MA35D1_PDMA_SPI2_RX		65
+#define MA35D1_PDMA_SPI3_TX		66
+#define MA35D1_PDMA_SPI3_RX		67
+#define MA35D1_PDMA_I2C0_TX		70
+#define MA35D1_PDMA_I2C0_RX		71
+#define MA35D1_PDMA_I2C1_TX		72
+#define MA35D1_PDMA_I2C1_RX		73
+#define MA35D1_PDMA_I2C2_TX		74
+#define MA35D1_PDMA_I2C2_RX		75
+#define MA35D1_PDMA_I2C3_TX		76
+#define MA35D1_PDMA_I2C3_RX		77
+#define MA35D1_PDMA_I2C4_TX		78
+#define MA35D1_PDMA_I2C4_RX		79
+#define MA35D1_PDMA_I2C5_TX		80
+#define MA35D1_PDMA_I2C5_RX		81
+#define MA35D1_PDMA_I2S0_TX		86
+#define MA35D1_PDMA_I2S0_RX		87
+#define MA35D1_PDMA_I2S1_TX		88
+#define MA35D1_PDMA_I2S1_RX		89
+#define MA35D1_PDMA_TMR0		94
+#define MA35D1_PDMA_TMR1		95
+#define MA35D1_PDMA_TMR2		96
+#define MA35D1_PDMA_TMR3		97
+#define MA35D1_PDMA_TMR4		98
+#define MA35D1_PDMA_TMR5		99
+#define MA35D1_PDMA_TMR6		100
+#define MA35D1_PDMA_TMR7		101
+#define MA35D1_PDMA_TMR8		102
+#define MA35D1_PDMA_TMR9		103
+#define MA35D1_PDMA_TMR10		104
+#define MA35D1_PDMA_TMR11		105
+#define MA35D1_PDMA_EPWM0_P1_RX		110
+#define MA35D1_PDMA_EPWM0_P2_RX		111
+#define MA35D1_PDMA_EPWM0_P3_RX		112
+#define MA35D1_PDMA_EPWM1_P1_RX		113
+#define MA35D1_PDMA_EPWM1_P2_RX		114
+#define MA35D1_PDMA_EPWM1_P3_RX		115
+#define MA35D1_PDMA_EPWM2_P1_RX		116
+#define MA35D1_PDMA_EPWM2_P2_RX		117
+#define MA35D1_PDMA_EPWM2_P3_RX		118
+#define MA35D1_PDMA_EPWM0_CH0_TX	122
+#define MA35D1_PDMA_EPWM0_CH1_TX	123
+#define MA35D1_PDMA_EPWM0_CH2_TX	124
+#define MA35D1_PDMA_EPWM0_CH3_TX	125
+#define MA35D1_PDMA_EPWM0_CH4_TX	126
+#define MA35D1_PDMA_EPWM0_CH5_TX	127
+#define MA35D1_PDMA_EPWM1_CH0_TX	128
+#define MA35D1_PDMA_EPWM1_CH1_TX	129
+#define MA35D1_PDMA_EPWM1_CH2_TX	130
+#define MA35D1_PDMA_EPWM1_CH3_TX	131
+#define MA35D1_PDMA_EPWM1_CH4_TX	132
+#define MA35D1_PDMA_EPWM1_CH5_TX	133
+#define MA35D1_PDMA_EPWM2_CH0_TX	134
+#define MA35D1_PDMA_EPWM2_CH1_TX	135
+#define MA35D1_PDMA_EPWM2_CH2_TX	136
+#define MA35D1_PDMA_EPWM2_CH3_TX	137
+#define MA35D1_PDMA_EPWM2_CH4_TX	138
+#define MA35D1_PDMA_EPWM2_CH5_TX	139
+#define MA35D1_PDMA_EADC0_RX		146
+
+#endif /* __DT_BINDINGS_DMA_MA35D1_PDMA_H__ */
--
2.25.1

