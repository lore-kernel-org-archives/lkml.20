Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792720618;
	b=jYOF/mvfqCtezmBdu1WiEwf0Z4ly5DZArJCRHn6pSsiMiJJcNLYP9JUFMds3TYz6xHBe
	 kMKFgJhgoA5IqhfUjqmMqRt3TfluB8diLJ/+daV1yA3cqeTz4WeWjwY9sUAfOcQRCwH+Y
	 kehNCP8aJFtzexsSu2ohhvqUK6z9fMcXiJiW/+Zqw6KpTGHQNHVtGi+Fm02LQVBxImiP8
	 Jq5t60zvH9OsbVPjkKWksLBtKvDug6NcgJYBC4rnyLruT+7t+nSUANoorGpRc0foKNpOG
	 3k7lwOjNfGmplbTqEeMZBqzqQRFYsV11h3dmBQZgWAD8oOzMcQqrkqrVgEZp7UIo73g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720618;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Vw7ZEhGFs1BjehCmf3SdDN3rq9JuYZ50K+jNCEaZYok=;
	b=PzDznHdSpVTEUyVlMiyecN46W1LiCSs5iSh5EaXrX1uPZZRTQ7kx1BerYZgMxPjN4BHM
	 hRWMH9hNgY3BN+Qpfa1aBaRE83cgM7zasf587bWOIGxcljDSeKMOV3dRDtju80QE+zFqT
	 N84PyOSFkT4QJMeqctnsi4u+K95k9iNnXf7/zCB35IMrMUtntQJmZRICv14NIXe9lcUBP
	 lPvCK31uc0o0crxtLjWRNJLme1linX9FSZwRATIq3uDGMtp/NeSp3IlIttj84hPQHApGC
	 TYTn8HZR5mDQsr58kvQrkZBsyJq5mTQVcjLZ+gbbYcGkCqA7pKJs3pelmeZAUyHZPkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cIyTQO+b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3221606A330;
	Fri, 23 Oct 2026 01:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cIyTQO+b
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792720617;
	b=q7bz4EAYKQQ4pQ6trt4mozWvQ3JgE+a9mxthMn9ja/S97WiuvvcK6VKdymR3TKMzkOQW
	 cfAtP/LkZOIFwZIhrE7CYVlXYD20Ta2DGKOVXVSlWmNhPIoXs8DM0WTQlnKB5UOzfmzNu
	 Phl6nS+MgcScf7uUoaKdOmqXtjc3OIPqI8ridTurPhETLobA6rSJ65XhtMNDLNhq+mVNz
	 xW/wVfSLpf0sbnSPoWalbrENpr3QtGZAs/szYJxG/XCiWuoeSEZ8CLsOigqynnaZcHeEL
	 RLwUDgBHyWXqqqX2kjyhjbNhEx9asIt2UTyE+EMZV7rLnGwBgQkEBMqBhfmcQtyxDUQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792720617;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Vw7ZEhGFs1BjehCmf3SdDN3rq9JuYZ50K+jNCEaZYok=;
	b=dV8dNJKVS6H89yQ+Z7WYXOVNgAojzYzDiLlAn3e6crAFv66Yy9fmeHcv96mNlWdmii7P
	 bResnDcgJi7ybvRrl2OoPTdUYXG9IAI+l8qKysHSPqfZBgsy2TUNSkNFSN/1GqPBbQeO1
	 gv2mOVlcBqwsJoE5hNYtfyyMpohtkctUTZsS294FiDalBQAnjG5xff+qEOeVM8M0tjVnL
	 K1kAJ6q8FRwBClsxC1TVtuR6UEP7rjDxPGLTeAoLruKxHo/crIb1ZI6B1QxjvK764GT1O
	 pzjGoVs5Qab1GsuoM22OluHsB7FmUfYBG6I3yAy2jHUfhdU0k7W/fhx1N2JVuNffXpQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 919B11F031E3;
	Fri, 23 Oct 2026 01:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792720617;
	bh=Vw7ZEhGFs1BjehCmf3SdDN3rq9JuYZ50K+jNCEaZYok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cIyTQO+bsF45Eei2AhWhS2SLpsdslrym3p9Acc7yqL0tBsRKAQxHqhyT0p5maAPNr
	 kuaFqH/y3iP03SqnAOt3Pi+vz0GWpR5j5g6P5ON1EGdiUoVk7lJhaF+0yIGJfHdzPJ
	 wHfbFIIipP+vik4SiNHZeLRJpJ2Y12PJY4Nyo0fdsdQ170cwZQQODhFhnh1KFJ/Wcl
	 YjSZTD/Ic8jgHU+3NiFq42J5hX8GH6qp2zmqwK6lER1E+US42eOHJRpwKsYWLc4NEn
	 dIxBxpOCjdROdHOVGjEwpSc79/I2xnGgIjE4Hr4qIzOToXKtAlc1Gqil7HKjBj9+l5
	 e0WSRG8w2feJA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0917E42188;
	Fri, 23 Oct 2026 01:56:55 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Fri, 23 Oct 2026 09:56:46 +0800
Subject: [PATCH v5 6/7] riscv: dts: ultrarisc: Add Shenzhen Rongda M0 board
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
Message-Id: <20261023-ultrarisc-dts-v5-6-af79dbd6ccec@ultrarisc.com>
References: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
In-Reply-To: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792720613; l=6533;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=FLco8EKil9coXfOOohEgx8XQNQE43bTkwaWzTcrXeQk=;
 b=ix6HlFtvT99tB+w/usnZ3cQqOMd6WAk5Cs3XemBTzJA3a3fihuqdmtXXy315AyrgNvEupMtVx
 y4W70tA5RmoD5pz2a2iMgZx7kLRCwdchwKluZkiQkMHoDoevPlfKYmV
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
index 000000000000..43f713bcea25
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
+		phy0: phy@0 {
+			reg = <0>;
+		};
+	};
+};

-- 
2.34.1


