Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794448873;
	b=E7sHNR5cF+5q6jH4ua2kMn9OjdamCfl64B7EvMBp61LONKP6hNG9IesmCHnPni6OXuVJ
	 CE+Z2jfBytcA01dHQZiaUn4/2uztJVdETBR/84cdwEXxuVr/0Hfs3/bRk6iwFtq/7jeGF
	 jyWmnZ/HOmBLw5zWs+fuRWZTNlVeg+Cwd3IbgrnA6aYTiubjmqUfsqOnFq+Xs1rcpozPh
	 AeOGCGX6Dw0w3Px2NKP5w6pzNbSOiC/Oy6ZVShKfgG+3/TyRcJ0SRFCW0Wes9v+su7i4z
	 yqpBR4wxeAZmj4Kc5WZwvoc79ugHxLccjGJtBojajzQpWB+FyBo5N6ZKooo5V1Y+Y4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448873;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ANbufowx2QF2Fk1+MP59Lm3vFBfOaU4yXxPrMbLVvQc=;
	b=LGoeYGI6S4wolJIBpR4oaYVb0FClSIO1MptgoXxdUYbDKn7Jt8PgtDB7/Bcocvuf0o/K
	 TuiSyQg0mKclqqG1wIo4tZ61tvuY2q+/3Srpm9Cpk6dlYUpRB/csQSpsOFKbLO4P/ZC2s
	 nN4TgLMklXMVCSeb33VQF1ejvwR66YU/pd3+6Ip4IOd/2eots5vx1ihFdliFr9TftvUFJ
	 JCGrwDDbQk5PiOQP2O+PG9rQzIX0sKO6v41ESo/UuW3+wKrTa0lpN7pJxCKg4A+9MHb8C
	 qyV7d0s0fCx/IIZ5BSZ2NH1Z8rrxVwhq0yPyvgHrFXkAB/3Z7HcfP63rvpWXOlPO6XA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPUfdOY5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FF7606A89C;
	Thu, 12 Nov 2026 02:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jPUfdOY5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794448873;
	b=iIDznmTuDPYc3HUbiyRYbYGTWnc9mIa5tlkatC5UHPxF2CoYuqU6o7Supe9GjxGkW5E1
	 YiQYMWvnj8O0qxCDhqq5sT7dT0ipupXxBFbpO0PjScTWCRjySXNfwWnfs+9nFv+tzI1SC
	 ONleQ3iRx7/ZAlygPBTfVG58lfBhtIP8JOV3YX+5tPNIWQwSZJDyGqIbbRYiXnz7hFHTl
	 CeSRyUFMGoQLtGesVqf8uijelQ9CiBU4O+l1PkX9YaxBoy46xuRacFRFpW/MqmYsK0Pvu
	 1HahIXk/EzW3PMYfFlIwNgGDy4URhKJyK0rcXmu8pO6xxCeU1VCxXnyL7RZMYztkHow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794448873;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ANbufowx2QF2Fk1+MP59Lm3vFBfOaU4yXxPrMbLVvQc=;
	b=y1EsqWS8tVISJF1mMdMcj4CZaySjjcN4fLVoGB+HwiNh7sokLPznZgcCr/wVb8+KDu+5
	 j5FTi8Dkt8ZDI+cSyIAyyMsGlUNP+Gb82uoDW22RyLTGJBzjDyOcxCEVEE/3xnuVdvcMN
	 w6GYeICa9O5iZoVMrz6QuwQD/N+JFZBhyc4CXHW9dvzV7Rjlm2f196dnsTQ+UJM57Qzfa
	 w5oMoDwImnuC0Y4Ct+mM0F4DwOhZI00TKTJuwbeE2EAAJYc+4PVcTwqII3OIN8+EjyEFU
	 +BNCKWXmNtky+ibgDiTNdCbpXaJFWtXxlrcxFV/1sKx+8Vt+30+s+03YJpRZoxAKyIA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EDA61F00A0A;
	Thu, 12 Nov 2026 02:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448873;
	bh=ANbufowx2QF2Fk1+MP59Lm3vFBfOaU4yXxPrMbLVvQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jPUfdOY5GulYkRTk7I4q3Ca9DtnHItAfOdtEtTXknmBJKaTOCjiEqCR7EXaT5A7nh
	 PtcuRdc5TUU4025e/+d2frwCIZsr4n9RQFYzJE/UvRWAyrghu9USyuRl0PIIpqyGIZ
	 xs0T/VCzPsHkQBdU7OM+DJ9Og2P7DantCqTc0YnTnV00Xu3KzykQbG2CmOzr31AE9N
	 ENySTtRgLKRx9RnXHVYhWIqs/eR07KPXnktKohnyj/H4+q/uvMgPR/IL9neG4VSCmp
	 q+qDBPX+fid0SFGcGHyrNKbdM0h3qutSsk89wPocK60t52uz7iHF7VTl6fxxlMG+Ta
	 9mnayIoxxiJFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 097634921F;
	Thu, 12 Nov 2026 02:01:11 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Thu, 12 Nov 2026 10:01:05 +0800
Subject: [PATCH v8 6/8] riscv: dts: ultrarisc: Add Shenzhen Rongda M0 board
 device tree
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
Message-Id: <20261112-ultrarisc-dts-v8-6-14fa0834cac4@ultrarisc.com>
References: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
In-Reply-To: <20261112-ultrarisc-dts-v8-0-14fa0834cac4@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794448869; l=6542;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=S7URPdE9mBx4a+aal3Qfs614r7pz+1027a/WNiAAv4I=;
 b=Fdsj+231tzgi3Vf4D+lBT6gjwooGInRZB0ZOXYVxEqZtRDQH8MtDJGkU6Z8ZPpw52c3t5dgUc
 rhBhgKhn9ohAyAk9vHP/ZZkJlsZ1gz0SNwjptkWJJDqmjhAkIpMlPTx
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Shenzhen Rongda M0 is an mATX motherboard based on the UltraRISC DP1000
SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/ultrarisc/Makefile             |   2 +
 arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h     |  63 ++++++++++++
 .../ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi    |  79 ++++++++++++++
 .../boot/dts/ultrarisc/dp1000-shenrongda-m0.dts    | 113 +++++++++++++++++++++
 5 files changed, 258 insertions(+)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c..702882974251 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -12,3 +12,4 @@ subdir-y += spacemit
 subdir-y += starfive
 subdir-y += tenstorrent
 subdir-y += thead
+subdir-y += ultrarisc
diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts/ultrarisc/Makefile
new file mode 100644
index 000000000000..454d849a6ce4
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-shenrongda-m0.dtb
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h b/arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h
new file mode 100644
index 000000000000..4668e45d2335
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#ifndef _DP1000_PINCTRL_H
+#define _DP1000_PINCTRL_H
+
+#define PA0		0
+#define PA1		1
+#define PA2		2
+#define PA3		3
+#define PA4		4
+#define PA5		5
+#define PA6		6
+#define PA7		7
+#define PA8		8
+#define PA9		9
+#define PA10		10
+#define PA11		11
+#define PA12		12
+#define PA13		13
+#define PA14		14
+#define PA15		15
+#define PB0		16
+#define PB1		17
+#define PB2		18
+#define PB3		19
+#define PB4		20
+#define PB5		21
+#define PB6		22
+#define PB7		23
+#define PC0		24
+#define PC1		25
+#define PC2		26
+#define PC3		27
+#define PC4		28
+#define PC5		29
+#define PC6		30
+#define PC7		31
+#define PD0		32
+#define PD1		33
+#define PD2		34
+#define PD3		35
+#define PD4		36
+#define PD5		37
+#define PD6		38
+#define PD7		39
+#define LPC0		40
+#define LPC1		41
+#define LPC2		42
+#define LPC3		43
+#define LPC4		44
+#define LPC5		45
+#define LPC6		46
+#define LPC7		47
+#define LPC8		48
+#define LPC9		49
+#define LPC10		50
+#define LPC11		51
+#define LPC12		52
+
+#endif /* _DP1000_PINCTRL_H */
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi
new file mode 100644
index 000000000000..ab927c6cd614
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000.dtsi"
+#include "dp1000-pinctrl.h"
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		pins = <PA12 PA13>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c1_pins: i2c1-pins {
+		pins = <PB6 PB7>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c2_pins: i2c2-pins {
+		pins = <PC0 PC1>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c3_pins: i2c3-pins {
+		pins = <PC2 PC3>;
+		function = "i2c";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	spi0_pins: spi0-pins {
+		pins = <PD0 PD1 PD2 PD3 PD4 PD5 PD6 PD7>;
+		function = "spi";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	spi1_pins: spi1-pins {
+		pins = <PA0 PA1 PA2 PA3>;
+		function = "spi";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart0_pins: uart0-pins {
+		pins = <PA8 PA9>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart1_pins: uart1-pins {
+		pins = <PB4 PB5>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart2_pins: uart2-pins {
+		pins = <PC4 PC5>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart3_pins: uart3-pins {
+		pins = <PC6 PC7>;
+		function = "uart";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+};
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
new file mode 100644
index 000000000000..b6027420175c
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0.dts
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000-shenrongda-m0-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Shenzhen Rongda M0 Board";
+	compatible = "shenrongda,m0", "ultrarisc,dp1000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+
+	rtc@32 {
+		compatible = "whwave,sd3078";
+		reg = <0x32>;
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+};
+
+&spi1 {
+	num-cs = <1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+};
+
+&pcie_x16 {
+	status = "okay";
+};
+
+&pcie_x4a {
+	status = "okay";
+};
+
+&pcie_x4b {
+	status = "okay";
+};
+
+&ethernet {
+	phy-handle = <&phy0>;
+	/*
+	 * The PCB does not add RGMII TX or RX clock delays. The DP1000
+	 * integration adds fixed delays in both directions.
+	 */
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};

-- 
2.34.1


