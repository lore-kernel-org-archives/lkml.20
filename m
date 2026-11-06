Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953841;
	b=Nfm1n19zY5hJTYX4Spz3wE2Yk1ZMNGl7znepzJJf3igtbGxYgtannyXbYsjJvYjbhuAE
	 FVtIKnmVqpM6fa5Np99nq9O12/bFGRxvAc5mUkCgKrfoUZj3uULb2TJVKVJJTwghOpPLv
	 JcL8ycZR3wWtETBtCGC+lmlHQ8bZj0QP0rKRzjELcDxlMt0+Ri6X8ZIlS7+bTmm1eyQpa
	 fU9M4ypJWk53lZ1jnvhym0qDs2UZBRXEM4k0oisS0kG4jVCnF8WerABgZ8bH+ex/o6L21
	 mTQ+UvJ8JD/yXdbFfAg2Ou1Uw8O7NGWo73hSTvcbCREsa1BJLmVvZ5GxMwjRfZZ/o3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tF+tFlmcY2LYJavWdPxf0AHWMr7F2V6Ff8GR//at/Fg=;
	b=lSQFeCIkiriucyH2kll0urlvD5oBkiKSXFlsweCRM4xLRTudQcjXXfdS4M/Zo1wW3YdJ
	 GStPRSXD4qgeTIVZF5u3qoNuMOdtv4e96uy/yOMKDLm/c8ACwqJpGDwIszv25CU2jGKN4
	 UdSLmczkTHhcbSwPT/lDl6BG27KDYac9xyjjjwKK4E2GjPJ0osqvUjrr1rGR2GhmUeKDc
	 ayoEvfhUN0dxNJd+MkZFK/m3ySLc7/qWn2fJSaoLp8rOcGPr5uWViX2KxVhFhuJc0SHAt
	 UrDlpYklqdD0WPbq3k+w8Gnd7c5bx+nY0K+pcy8Utd3Rk2A7swv6TvmCq/qMjrwjyWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GoOnJFFW;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808AE606EE88
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808AE606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GoOnJFFW
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49231763f81so193463f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953839; x=1794558639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tF+tFlmcY2LYJavWdPxf0AHWMr7F2V6Ff8GR//at/Fg=;
        b=GoOnJFFW5qWwSmxVisDbsNnZedI3xttGlnQH2Q7I5/Jl3kwNHDPW4pUuN+YE2GRLsA
         rm/pDabnsOHPQhwef+A0P/su56PC4+lwUgsBEytdiA9NaqTd30GkYrsFjB0Ugn47fTSB
         Pu8XxP3pyj2iVxeH+5Y5bSriA0WidETTWq9eg5CGC6fuCvglIJk0IAoTE2Tt5QrLBbYq
         iXFOlMrHAsK0y1CLiD8UzYcukgvS2FGbPTKwt4Krw09nLQPE8OQTlfwyOgyypKHNVUGb
         QjOuExOLsJMGgIPbpjBNyuEY2DMdK8zzxJgZ3G61A+dYoUk5uw8+C4MeAoQ94Hdv4pAP
         ohXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953839; x=1794558639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tF+tFlmcY2LYJavWdPxf0AHWMr7F2V6Ff8GR//at/Fg=;
        b=c974AF5QBLq+nALS0rwfXqkjOjjp/3EoH6Hy2woD/Qq4fyZvRbOuMeezG7sxUmuX59
         Z2Nu4yp/ZovJh1cYGnwcEbQZQC1H/BOxXzJOhjmZ31oEMqQI/26/na+DkCfPUGem0aiZ
         6RV3vlsSJ7/ibdGqyletuMRm20U730826inK3bIBa1N18+SP9NV1x3kGUOHu74yfHKMz
         XBvTAvP1US7yvPVRnfZ4TccsO106HPVtDgZobQDbpJQZadHNxQT/Eb24nPUrHLTcdxjS
         xBRIkczC30AK0t2QHVFXy0KhnJQIAoPgrQSvXnB4rCzzNmT+9cwEIT2i1cdXzaYBKdUh
         A68A==
X-Forwarded-Encrypted: i=1; AL+hErEoBmo3jvY8WynXdtuVpEnTHx6sGuKSRKzAUZDv2yI/ES0R1XIJ4DC4G9GH8z69QuhjQk4Qx9koJXm23gU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bS7Mi46b2ny/nXVDlcgyphZFVihAK6OJmcru+gZtfae54VR9u
	+NdsBU7j7RWq1JFEyK3ps3dRBBQk6EAGGHk7904WhpicW5igDUZj2l4xgxGp4siqEvw=
X-Gm-Gg: AYBFou3vZsFo8SdLnHiMkGDD1GOIlms/7Hgr2lSCGS27+UPabTuR0JV/VS1ZhhwfOM+
	U/iDT5xg6UDqMnXNivv+ITshN7LNHcBe5x/svUYi7sNnUDnqiqs3/xlJMvHmJzlnUOdow6CgV9I
	oj7dnjh0TB5RlbcFzy7Xmgn5gZqXHi53RYDM3S1P5E32eXAjrGGK+hTFdPRHtGfsduT+ehQ1lRt
	kuf5dRhWpfgjKZCuxRXCrKII07feGOMrxUyxdxqkIQB5x5hcMm0npqeGmX9jpzjQTsaJvFhf61X
	nLd9Py+nPPlnXxSFqBRFy1q9682Zi0aB6RI+Kp4ZdbSHcIQ0rLAxQccwbPuc/qCsSOfvhFT1V0X
	7KttONtKPY61y5vDDh9YSQgGXRrfs4bt9RJ0YwVjKrvX5LtcT5FP77v68CbYEUa5Ah8KmQKZ8AW
	8iSjKr9LE254dRmMSERNhnG8xAkh3+3JTgmVQ4f47d75sYxPINLTInUW05CHqdHMY5D9TkrOXbI
	bKiPTjF5pQihgfI+uUe2WchPBD3b8IdR/LL6glWQM6YbqrDUHv2FekcH1qSkqKcPPSfHi0mj73V
	4tmczdMpLdKN1UAgafiIP89w4kbPVS58Y6rEDf8VKTyYeRpyxjxyOBnkmhRvNKSqnTJQe/PvV3+
	Hi7TUT26waoNyIcNv3caVVrZo3KsA9aHhzK2xJMG78sHDbKA=
X-Received: by 2002:a05:6000:490d:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-49277404453mr3695813f8f.38.1793953838875;
        Fri, 06 Nov 2026 00:30:38 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:38 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:29 +0100
Subject: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
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
Message-Id: <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
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

The S7 peripherals clock controller supplies the SoC buses and
peripherals, using sources from both the PLL controller and firmware.

Add the binding and clock identifiers so peripheral devices can
reference their clocks in devicetree.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../clock/amlogic,s7-peripherals-clkc.yaml         | 126 +++++++++++
 .../clock/amlogic,s7-peripherals-clkc.h            | 245 +++++++++++++++++++++
 2 files changed, 371 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-peripherals-clkc.yaml
new file mode 100644
index 000000000000..980a215ed4dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s7-peripherals-clkc.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2026 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s7-peripherals-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S7 Series Peripherals Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Carlo Caione <ccaione@baylibre.com>
+
+description:
+  The peripherals clock controller provides the system (bus) clock, the bus
+  clock gates and the clocks of the peripherals. Its inputs are the board
+  oscillator, the fixed PLL dividers and the GP0, HIFI0 and HIFI1 PLLs of the
+  PLL block, the GP1 PLL and the CPU AXI clock provided by the firmware, the
+  HDMI PLL and its pixel clock, and a few optional sources from outside the
+  clock controllers (pads, audio codec).
+
+properties:
+  compatible:
+    const: amlogic,s7-peripherals-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 14
+    items:
+      - description: input fixed pll div2
+      - description: input fixed pll div2p5
+      - description: input fixed pll div3
+      - description: input fixed pll div4
+      - description: input fixed pll div5
+      - description: input fixed pll div7
+      - description: input hifi pll
+      - description: input gp0 pll
+      - description: input hifi1 pll
+      - description: input gp1 pll
+      - description: input hdmi pll
+      - description: input hdmi pll pixel clk
+      - description: input oscillator (usually at 24MHz)
+      - description: input axi clk from the cpu
+      - description: input external 32kHz reference (optional)
+      - description: input external rmii reference (optional)
+      - description: input audio codec dac clk (optional)
+
+  clock-names:
+    minItems: 14
+    items:
+      - const: fclk_div2
+      - const: fclk_div2p5
+      - const: fclk_div3
+      - const: fclk_div4
+      - const: fclk_div5
+      - const: fclk_div7
+      - const: hifi_pll
+      - const: gp0_pll
+      - const: hifi1_pll
+      - const: gp1_pll
+      - const: hdmi_pll
+      - const: vid_pix
+      - const: xtal
+      - const: axi_frcpu
+      - const: ext_32k
+      - const: ext_rmii
+      - const: acodec_dac
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
+    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@0 {
+            compatible = "amlogic,s7-peripherals-clkc";
+            reg = <0x0 0x0 0x0 0x49c>;
+            #clock-cells = <1>;
+            clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+                     <&clkc_pll CLKID_FCLK_DIV2P5>,
+                     <&clkc_pll CLKID_FCLK_DIV3>,
+                     <&clkc_pll CLKID_FCLK_DIV4>,
+                     <&clkc_pll CLKID_FCLK_DIV5>,
+                     <&clkc_pll CLKID_FCLK_DIV7>,
+                     <&clkc_pll CLKID_HIFI_PLL>,
+                     <&clkc_pll CLKID_GP0_PLL>,
+                     <&clkc_pll CLKID_HIFI1_PLL>,
+                     <&scmi_clk CLKID_GP1_PLL>,
+                     <&clkc_pll CLKID_HDMI_PLL>,
+                     <&clkc_pll CLKID_HDMI_PLL_PIX>,
+                     <&xtal>,
+                     <&scmi_clk CLKID_ACLKM>;
+            clock-names = "fclk_div2",
+                          "fclk_div2p5",
+                          "fclk_div3",
+                          "fclk_div4",
+                          "fclk_div5",
+                          "fclk_div7",
+                          "hifi_pll",
+                          "gp0_pll",
+                          "hifi1_pll",
+                          "gp1_pll",
+                          "hdmi_pll",
+                          "vid_pix",
+                          "xtal",
+                          "axi_frcpu";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,s7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s7-peripherals-clkc.h
new file mode 100644
index 000000000000..44bf1521e25e
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-peripherals-clkc.h
@@ -0,0 +1,245 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PERIPHERALS_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PERIPHERALS_CLKC_H
+
+#define CLKID_SYS_AM_AXI			0
+#define CLKID_SYS_DOS				1
+#define CLKID_SYS_ETH_PHY			2
+#define CLKID_SYS_MALI				3
+#define CLKID_SYS_AOCPU				4
+#define CLKID_SYS_AUCPU				5
+#define CLKID_SYS_CEC				6
+#define CLKID_SYS_SD_EMMC_A			7
+#define CLKID_SYS_SD_EMMC_B			8
+#define CLKID_SYS_SD_EMMC_C			9
+#define CLKID_SYS_SC				10
+#define CLKID_SYS_ACODEC			11
+#define CLKID_SYS_MSR				12
+#define CLKID_SYS_IR_CTRL			13
+#define CLKID_SYS_AUDIO				14
+#define CLKID_SYS_ETH				15
+#define CLKID_SYS_UART_A			16
+#define CLKID_SYS_UART_B			17
+#define CLKID_SYS_UART_C			18
+#define CLKID_SYS_UART_D			19
+#define CLKID_SYS_UART_E			20
+#define CLKID_SYS_TS_PLL			21
+#define CLKID_SYS_GE2D				22
+#define CLKID_SYS_SPICC				23
+#define CLKID_SYS_USB				24
+#define CLKID_SYS_I2C_M_A			25
+#define CLKID_SYS_I2C_M_B			26
+#define CLKID_SYS_I2C_M_C			27
+#define CLKID_SYS_I2C_M_D			28
+#define CLKID_SYS_I2C_M_E			29
+#define CLKID_SYS_HDMITX_APB			30
+#define CLKID_SYS_I2C_S_A			31
+#define CLKID_SYS_HDMI20_AES			32
+#define CLKID_SYS_MMC_APB			33
+#define CLKID_SYS_CPU_APB			34
+#define CLKID_SYS_VPU_INTR			35
+#define CLKID_SYS_SAR_ADC			36
+#define CLKID_SYS_PWM_J				37
+#define CLKID_SYS_GIC				38
+#define CLKID_SYS_PWM_I				39
+#define CLKID_SYS_PWM_H				40
+#define CLKID_SYS_PWM_G				41
+#define CLKID_SYS_PWM_F				42
+#define CLKID_SYS_PWM_E				43
+#define CLKID_SYS_PWM_D				44
+#define CLKID_SYS_PWM_C				45
+#define CLKID_SYS_PWM_B				46
+#define CLKID_SYS_PWM_A				47
+#define CLKID_RTC_DUALDIV_IN			48
+#define CLKID_RTC_DUALDIV_DIV			49
+#define CLKID_RTC_DUALDIV_SEL			50
+#define CLKID_RTC_DUALDIV			51
+#define CLKID_RTC				52
+#define CLKID_SYSCLK_A_SEL			53
+#define CLKID_SYSCLK_A_DIV			54
+#define CLKID_SYSCLK_A				55
+#define CLKID_SYSCLK_B_SEL			56
+#define CLKID_SYSCLK_B_DIV			57
+#define CLKID_SYSCLK_B				58
+#define CLKID_SYS_CLK				59
+#define CLKID_AXICLK_A_SEL			60
+#define CLKID_AXICLK_A_DIV			61
+#define CLKID_AXICLK_A				62
+#define CLKID_AXICLK_B_SEL			63
+#define CLKID_AXICLK_B_DIV			64
+#define CLKID_AXICLK_B				65
+#define CLKID_AXI_CLK				66
+#define CLKID_AXI_SYS_NIC			67
+#define CLKID_AXI_SRAM				68
+#define CLKID_AXI_DEV0_MMC			69
+#define CLKID_CECB_DUALDIV_IN			70
+#define CLKID_CECB_DUALDIV_DIV			71
+#define CLKID_CECB_DUALDIV_SEL			72
+#define CLKID_CECB_DUALDIV			73
+#define CLKID_CECB				74
+#define CLKID_SC_PRE_SEL			75
+#define CLKID_SC_PRE_DIV			76
+#define CLKID_SC_PRE				77
+#define CLKID_SC				78
+#define CLKID_CLK24M_IN				79
+#define CLKID_CLK12_24M				80
+#define CLKID_SD_EMMC_A_SEL			81
+#define CLKID_SD_EMMC_A_DIV			82
+#define CLKID_SD_EMMC_A				83
+#define CLKID_SD_EMMC_B_SEL			84
+#define CLKID_SD_EMMC_B_DIV			85
+#define CLKID_SD_EMMC_B				86
+#define CLKID_SD_EMMC_C_SEL			87
+#define CLKID_SD_EMMC_C_DIV			88
+#define CLKID_SD_EMMC_C				89
+#define CLKID_SPICC_SEL				90
+#define CLKID_SPICC_DIV				91
+#define CLKID_SPICC				92
+#define CLKID_PWM_A_SEL				93
+#define CLKID_PWM_A_DIV				94
+#define CLKID_PWM_A				95
+#define CLKID_PWM_B_SEL				96
+#define CLKID_PWM_B_DIV				97
+#define CLKID_PWM_B				98
+#define CLKID_PWM_C_SEL				99
+#define CLKID_PWM_C_DIV				100
+#define CLKID_PWM_C				101
+#define CLKID_PWM_D_SEL				102
+#define CLKID_PWM_D_DIV				103
+#define CLKID_PWM_D				104
+#define CLKID_PWM_E_SEL				105
+#define CLKID_PWM_E_DIV				106
+#define CLKID_PWM_E				107
+#define CLKID_PWM_F_SEL				108
+#define CLKID_PWM_F_DIV				109
+#define CLKID_PWM_F				110
+#define CLKID_SAR_ADC_SEL			111
+#define CLKID_SAR_ADC_DIV			112
+#define CLKID_SAR_ADC				113
+#define CLKID_GEN_SEL				114
+#define CLKID_GEN_DIV				115
+#define CLKID_GEN				116
+#define CLKID_TS_DIV				117
+#define CLKID_TS				118
+#define CLKID_ETH_125M_DIV			119
+#define CLKID_ETH_125M				120
+#define CLKID_ETH_RMII_SEL			121
+#define CLKID_ETH_RMII_DIV			122
+#define CLKID_ETH_RMII				123
+#define CLKID_MALI_0_SEL			124
+#define CLKID_MALI_0_DIV			125
+#define CLKID_MALI_0				126
+#define CLKID_MALI_1_SEL			127
+#define CLKID_MALI_1_DIV			128
+#define CLKID_MALI_1				129
+#define CLKID_MALI				130
+#define CLKID_VDEC_0_SEL			131
+#define CLKID_VDEC_0_DIV			132
+#define CLKID_VDEC_0				133
+#define CLKID_VDEC_1_SEL			134
+#define CLKID_VDEC_1_DIV			135
+#define CLKID_VDEC_1				136
+#define CLKID_VDEC				137
+#define CLKID_HEVCF_0_SEL			138
+#define CLKID_HEVCF_0_DIV			139
+#define CLKID_HEVCF_0				140
+#define CLKID_HEVCF_1_SEL			141
+#define CLKID_HEVCF_1_DIV			142
+#define CLKID_HEVCF_1				143
+#define CLKID_HEVCF				144
+#define CLKID_VPU_0_SEL				145
+#define CLKID_VPU_0_DIV				146
+#define CLKID_VPU_0				147
+#define CLKID_VPU_1_SEL				148
+#define CLKID_VPU_1_DIV				149
+#define CLKID_VPU_1				150
+#define CLKID_VPU				151
+#define CLKID_VPU_CLKB_TMP_SEL			152
+#define CLKID_VPU_CLKB_TMP_DIV			153
+#define CLKID_VPU_CLKB_TMP			154
+#define CLKID_VPU_CLKB_DIV			155
+#define CLKID_VPU_CLKB				156
+#define CLKID_VPU_CLKC_0_SEL			157
+#define CLKID_VPU_CLKC_0_DIV			158
+#define CLKID_VPU_CLKC_0			159
+#define CLKID_VPU_CLKC_1_SEL			160
+#define CLKID_VPU_CLKC_1_DIV			161
+#define CLKID_VPU_CLKC_1			162
+#define CLKID_VPU_CLKC				163
+#define CLKID_VAPB_0_SEL			164
+#define CLKID_VAPB_0_DIV			165
+#define CLKID_VAPB_0				166
+#define CLKID_VAPB_1_SEL			167
+#define CLKID_VAPB_1_DIV			168
+#define CLKID_VAPB_1				169
+#define CLKID_VAPB				170
+#define CLKID_GE2D				171
+#define CLKID_HDMITX_SYS_SEL			172
+#define CLKID_HDMITX_SYS_DIV			173
+#define CLKID_HDMITX_SYS			174
+#define CLKID_HDMITX_PRIF_SEL			175
+#define CLKID_HDMITX_PRIF_DIV			176
+#define CLKID_HDMITX_PRIF			177
+#define CLKID_HDMITX_200M_SEL			178
+#define CLKID_HDMITX_200M_DIV			179
+#define CLKID_HDMITX_200M			180
+#define CLKID_HDMITX_AUD_SEL			181
+#define CLKID_HDMITX_AUD_DIV			182
+#define CLKID_HDMITX_AUD			183
+#define CLKID_VDIN_MEAS_SEL			184
+#define CLKID_VDIN_MEAS_DIV			185
+#define CLKID_VDIN_MEAS				186
+#define CLKID_CDAC_SEL				187
+#define CLKID_CDAC_DIV				188
+#define CLKID_CDAC				189
+#define CLKID_VID_PLL_DIV			190
+#define CLKID_VID_PLL_SEL			191
+#define CLKID_VID_PLL				192
+#define CLKID_VCLK_SEL				193
+#define CLKID_VCLK2_SEL				194
+#define CLKID_VCLK_INPUT			195
+#define CLKID_VCLK2_INPUT			196
+#define CLKID_VCLK_DIV				197
+#define CLKID_VCLK2_DIV				198
+#define CLKID_VCLK				199
+#define CLKID_VCLK2				200
+#define CLKID_VCLK_DIV1				201
+#define CLKID_VCLK_DIV2_EN			202
+#define CLKID_VCLK_DIV4_EN			203
+#define CLKID_VCLK_DIV6_EN			204
+#define CLKID_VCLK_DIV12_EN			205
+#define CLKID_VCLK2_DIV1			206
+#define CLKID_VCLK2_DIV2_EN			207
+#define CLKID_VCLK2_DIV4_EN			208
+#define CLKID_VCLK2_DIV6_EN			209
+#define CLKID_VCLK2_DIV12_EN			210
+#define CLKID_VCLK_DIV2				211
+#define CLKID_VCLK_DIV4				212
+#define CLKID_VCLK_DIV6				213
+#define CLKID_VCLK_DIV12			214
+#define CLKID_VCLK2_DIV2			215
+#define CLKID_VCLK2_DIV4			216
+#define CLKID_VCLK2_DIV6			217
+#define CLKID_VCLK2_DIV12			218
+#define CLKID_ENCI_SEL				219
+#define CLKID_ENCP_SEL				220
+#define CLKID_ENCL_SEL				221
+#define CLKID_VDAC_SEL				222
+#define CLKID_VDAC_PRE_SEL			223
+#define CLKID_HDMITX_PIXEL_SEL			224
+#define CLKID_HDMITX_FE_SEL			225
+#define CLKID_ENCI				226
+#define CLKID_ENCP				227
+#define CLKID_ENCL				228
+#define CLKID_VDAC				229
+#define CLKID_HDMITX_PIXEL			230
+#define CLKID_HDMITX_FE				231
+#define CLKID_VID_LOCK_SEL			232
+#define CLKID_VID_LOCK_DIV			233
+#define CLKID_VID_LOCK				234
+
+#endif  /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PERIPHERALS_CLKC_H */

-- 
2.56.0

