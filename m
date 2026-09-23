Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC0E5275A4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188239; cv=none; b=avkrgfV5dou5ZyaBVJcRBDAxBSNsID2yr2vIoJMHWR2tvOzbozWhI5w6MTbjcjwcz2NrupboaGM4333LHUksoNpX3PhjYEM5IzMJgmqDzw+aVjLa+0k8l1K928HIls0yGRJPhc7HGNIeCozH2NRyqQDGMyzO7G6dFs3AemBTcoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188239; c=relaxed/simple;
	bh=nf0EyPFH35tSBIK5oZ5/jJ+smy+BLU/nT0Pmxgc+7L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YD7Te1EkIkLI2PaOLwMAvCbp/J5ATY90Hq191cy/9M3MGv1gHzKC77ULBFOgq+9C8AntR8Fb1hrTI5PvOT+ciRuXrjPbvyW7WUgKnBlSxDcIZ62ajGdC6uyR1x+n+CYSL22gC9GNmmzsl8pNU0WpTSM8K93ELWZa+IYWJp7SRHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9ohjYIs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9ohjYIs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso9033875e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188231; x=1790793031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=;
        b=c9ohjYIssdrqyFrjrf3b9Q9MIqMg/b6D9Jnvsl5mz42wSeoJ0UKq5KQZWq1N+EpLFF
         qu/uNT90LiOwsmetTC4QzwhaJOhAazDoe2feCUsUoSEeVE9rH55VE6y4X4moj2aaTSgd
         mXzPxNWBlYLxBPUuzqQhA1LHzrMPkRK51z9BFJFLMXkid1/iz0JNaWnxe4feh+wtvdFs
         FcsonO7eBEDUoLwsFvJ4t6sQ2aWb1yz29yBpctmHXJDWfNAZe20Ehge8hqPcqlOj/aXD
         kPVKG2QLmWJiQ69fpm89ZjIGKZKBG2eimLTnPvZX++ZWHB74D1RN0J7TUcfBNFcZrZHc
         6Vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188231; x=1790793031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=;
        b=zutvAE7xLEfuJoqoN0ghmQp7T0iafDzLjcqQi2D58uwQrppfFOQ8QOBqrUcQcU0Ak1
         DrHhHEMuZlk6k5IA99YTQ0rhbdx7S6gXRwkuFYWkYon5/4yAQYZ9qNDgBYpw7yDhoDj0
         x2MUx8ySCfUtmoJmEhwTJvxGXh4tifq688TDMKCfqXYBbuuP/hfdDCBjXIFITmsOULX2
         Rb8YZFAV1joirfui3LBLyKNBrOxOgMYn5dJfFYuald2DQkdZK68q7VFS2FAZ+53rcSMX
         0xVgO31Fgi1rCgQCzkT1jiBx+vXdPYktowY4YedwRw/75W3UCbhrB0ESPd0oN68/lmW7
         1HkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7MFI57La649L5fWWYHHZktqKsXokrzsc1YaZ7jmsLW7s5V8nRl7Msq/MLTZj67nkuv8fbx6WqVomcAII=@vger.kernel.org
X-Gm-Message-State: AFuF++lhmP7JaVJ6SafxIeIzMICDxsYHcWZaZY6dlSQM99OgAZQUirsm
	38nAo3D0jVdZU/GbknNC3YYdrk0Ie31G9TabOHz78Q6egF8EYF3i/HZd
X-Gm-Gg: AYBFou38UhEMQ1OP+9GuK1OsqyVGqCj/Jl6xzYo9C6B8meOLL+hIo1hec21+dJ6q2Nm
	AyRGNTHC5XuS3Sf110vSsmeGKpuFWgndL8X9D7xQocfbOTOgBE29NSrdyELH5zSydtRZrPW3Flx
	WOjH0EdFSNtJZ/Kw0Ou3hCQWX46WGcqOcTwk2Dl30DYnmWCus5v4X8o8ok6lzzI2bdunUx4Okgn
	3LVGaDTXST7aRm76uRgL/UDz6bVl3N2I+/gJzMtRZ+Ij8G4oOQ7HL7wjlrHSaNyRvHzyXcBzTfn
	Me0pgUjbBatOnZLCx8kuy8yfqY2qfTgiOwHwl8sIFwwXfUYVUXn45/8RPt0nRXAgk7LJoe5Lxu6
	ihDsS7YlRUArz+nbtpdwvKZHuSiztbLF+FGIX6I89vAusKz+Tsi5LoZYsNLN0TvX6at7X2PMuo+
	Drx6/eu6rq8eSH7QqbwyHl6z0uLXj1fz+mP4wPQzdofYohmqFHzLxORxvz+Nv6D/p3XVk1TCGuS
	gTh30Vt7PiWEHo2
X-Received: by 2002:a05:600c:3511:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49fe66fca74mr955715e9.23.1790188230531;
        Wed, 23 Sep 2026 11:30:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:30:30 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:58 +0300
Subject: [PATCH v12 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-12-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5992;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=nf0EyPFH35tSBIK5oZ5/jJ+smy+BLU/nT0Pmxgc+7L8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpu3JRLG91BIUi3oCJuTumCMec0ZWhqcpJPh
 P78Khtbk0mJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKuPxAAoXY2IxIgFRL+DH+XhDc+HjVDfbf9qAE
 ecqWNdsYcAc5XYgZNBixnxFcVWWKFxIoCw8kOta8KLN8eoFlbkKJwFbxwzhUmfV1YgeSQ9d6cN7
 7pEOgO78Z1KDl8scfTC76/87e5PpbbI/QiEGisnb6Y28VU1hvWZlnspKnBN69PpPwFz6YbxKAeW
 4a8m3houAA7uA6GXXBeUiUnuTKqAHlmKs3KX1yfyK9kPYzlon39u09euzsimwhtQ/yE5CdI9QwL
 jDbJwexmlZmWGV1LYZTV6+/zVVp82yQ9m1NwFNxC43i1Kd3s0wnhJgLvCTRj+3XWZ5eLw6u8tCH
 fm0LD8B3V+d1pZ+bLYe1luaiEtH1kqJ4P3nQRgggU3OQ6yq9wgYocGeGPqyFLhPOO31zCqvVGBc
 +Aakk7EfTsK4fV4lH3Xous0pQuK/YLprIV4CWWeyM48kgfh19GVEUmmc/iaLjsESwWsJtWrWkV8
 JBPjJq/ZLM7vJ2kLvSFiGFcblEwVfEOP2ghm+OKnf+QrejirhEUTZg4NpBakM9bVMLG+KXa4C20
 Ae86y81FycBnrcIXXsIT3N9F20Z8SRTsa3TKzT4JASsmGKadfu01FuPgqO0qDLQKjIIz7TrzS7v
 Fil1kcBuX0Hq5VrX9yejrcu/V/biOEYgHqxM/XqSN2ZISKOhArQU=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This patch adds DT nodes for the main clock and reset controllers on the
zx297520v3 board. It replaces the temporary placeholder UART clocks with
the proper clocks exported by topcrm and lspcrm.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Version 11: Improved the above the line commit description, removing
references to "previous patches" that won't make sense when reading it
in the kernel commit log.

Version 10: Fix issues with dt-check-style --mode=strict in newly added
code, but left issues in existing nodes alone.

Version 9:
Sort new nodes by mmio address
rename syscon-reboot to "reboot"
adjust to changes in bindings

Version 7:
Add phy nodes to topcrm
Remove syscon from matrixclk again
Adapt remove now-removed extra clk inputs from matrix
Add reset to LSP
osc26m -> clock-26m for the fixed rate clocks, likewise for 32k

Version 6:
Add syscon to matrixclk

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 101 ++++++++++++++++++++++++++++++----
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..ebac3cd137df 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -3,12 +3,26 @@
  * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	osc26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	osc32k: clock-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -20,15 +34,6 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
-	};
-
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
@@ -75,18 +80,87 @@ uart0: serial@131000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>,
+				 <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
+
 			status = "disabled";
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-up", "usb-down",
+					  "hsic-up", "hsic-down";
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			reboot {
+				compatible = "syscon-reboot";
+				mask = <0x1>;
+				offset = <0x0>;
+				value = <0x1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_AHB_PCLK>,
+				 <&topcrm ZX297520V3_MPLL>,
+				 <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>,
+				 <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>,
+				 <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "ahb", "mpll",
+				      "mpll-d5", "dpll", "gpll", "gpll-d2",
+				      "wclk-osc26m";
+			#hwlock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lspcrm: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspcrm";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_PCLK>,
+				 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll-d5", "mpll-d4", "mpll-d6",
+				      "mpll-d8", "mpll-d12", "osc26m", "osc32k",
+				      "pclk", "tdm-wclk", "dpll-d4";
+			#reset-cells = <1>;
+			resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+		};
+
 		uart1: serial@1408000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>,
+				 <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
+
 			status = "disabled";
 		};
 
@@ -95,8 +169,11 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART2_WCLK>,
+				 <&lspcrm ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART2_RESET>;
+
 			status = "disabled";
 		};
 	};

-- 
2.55.0

