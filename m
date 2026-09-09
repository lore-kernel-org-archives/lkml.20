Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD05437C7;
	Wed,  9 Sep 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966874; cv=none; b=FEaj4WI/gjYOVihTiDBA0AEGGgb4PRQRETScQ3PDCzERQozgArh1AQYjWVQQxklkLP24CdUMha/H0iYCn1cW0tXwlDLvke1c/5ITh8LK1rokoKpPN3Swzx2k/50ywyKPEBFd8W8bMM/VVucjFuPTPojoB+coQbwhlUhSoTo2Tpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966874; c=relaxed/simple;
	bh=NWo98yh3UDHnCrLVd1UVEfAByvGYrnUIgbiSl7qUb58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXrIaMovQInbZoIUFSy+oMA0cF9Xv4o4Am3D53ECBmid6Vu55PUPHLAELiixpiLV8JXHrZzbhFHOC/sM+UvC01ocWtgNyda1SBUhfy/GSCO2Lh32knqaLtbGvr3YNVnH34n3t/+dcO+Id0UqzaFNgQPuOVPuuORVZodLUlYVIQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=awzQbg+0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CUEEvUGP; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="awzQbg+0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CUEEvUGP"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hg4921xQLzMlDG;
	Wed, 09 Sep 2026 17:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788966870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FHRx7wOPho4cF95Tvg/O53cRuFRQttg9t3cb9/+lFgM=;
	b=awzQbg+0WuHBXAzA3KMNF1Ty50/hrWfvF36UkuB2vOL4FJqrs0Kr0E/NdZgz8OE8lyL9dN
	5KG0UhBrO3+y9pJw94FR0M9w+I1EgYPK7bhbbCCB1l5qbyWo4aqrbS8VfDSimbM75An0YH
	40cb+HBeVlfJYiW9j0ALA5jbY/beQAjC+kAudxRjA1Belfocn/yEymd6fNlzAHS41Xn9r3
	Tkjs4QXo7H+c8cO9qLft70dtzNKtUZOHVdX0fWAEWFrptolGFLO1gUXgiFHmDV5FKVi7e+
	7H00DLaPtiC3ktCAAbCd793Eu0QbUfMl+KkHCEQ0vw3ai9RBg7mixTLChgDPZA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CUEEvUGP;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788966868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FHRx7wOPho4cF95Tvg/O53cRuFRQttg9t3cb9/+lFgM=;
	b=CUEEvUGPu9aU31JwV6RQjU7ZfILjqumd2gdhsxT+ZXMHUgMtw+ATpqAlksS4vNni3mlC3A
	Mmvdl3kUsGh12pyX23QReXc6PnxyVqvIXpB1h5D9m9QikF/Fl3+W+IUo88QV31a6DBa8Rr
	LzT5/40GaQysQ/AtV5xc1EWS6RbyOPbl1kHjJ+c1XrimsN4nwraxaQK04Hlcks3fMMzxuP
	t6DJ7YA1hOhZCoxKuhaVLKIYQWCKGkl5u++8j9mF/0IiVTsV16dinwO40LzAnEPSL512uZ
	jVQrUfbaopAno5ksJW7A2ygqqETLqv5+wHHecQvN4dkvaq/FKxTyv/bm+Yxpmg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare 2CH CANFD HAT
Date: Wed,  9 Sep 2026 17:13:55 +0200
Message-ID: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 89e2888c1d20c75e8e1
X-MBO-RS-META: qfsu8qqwdpdmxdh5bqxnx63z684595px
X-Rspamd-Queue-Id: 4hg4921xQLzMlDG

Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.

Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Drop the unique spi controller node identifier
    - Switch IRQ to active low
    - Sort compatible and reg properties
    - Add "CN7 pin 22" comment
    - Move pwm1 node to the top and add comment
    - Rename MSIOF0 PFC node
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso   | 135 ++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index e4a7d7ab5b0e9..b742baf509a14 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -124,6 +124,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 r8a779g3-sparrow-hawk-rpi-display-2-7in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-2ch-canfd.dtbo
+r8a779g3-sparrow-hawk-ws-2ch-canfd-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-ws-2ch-canfd.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-2ch-canfd.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtbo
 r8a779g3-sparrow-hawk-ws-display-13in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-ws-display-13in.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso
new file mode 100644
index 0000000000000..213bac3e3abca
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the Waveshare 2-Channel Isolated CAN FD HAT
+ * on connector CN7 on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2026 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ *
+ * Example usage:
+ * - Connect HAT signals to Sparrow Hawk board CAN BUS connector CONN2:
+ *   HAT CAN_0 H -- CONN2 pin 6
+ *   HAT CAN_0 L -- CONN2 pin 2
+ *   HAT CAN_1 H -- CONN2 pin 5
+ *   HAT CAN_1 L -- CONN2 pin 1
+ *
+ * - Determine which interface is which:
+ *   $ ip -d link show
+ *   2: can0: <NOARP,ECHO> ...
+ *      ...
+ *        clock 40000000 ... e6660000.can <------ Native Renesas CANFD
+ *   3: can1: <NOARP,ECHO> ...
+ *      ...
+ *   4: can2: <NOARP,ECHO> ...
+ *      ...
+ *        clock 40000000 ... spi1.0 <------------ SPI CANFD on this HAT
+ *   5: can3: <NOARP,ECHO> ...
+ *      ...
+ *
+ * - Bring connected interfaces up:
+ *   # CAN_0 link
+ *   $ ip link set can0 up type can bitrate 125000 dbitrate 250000 fd on
+ *   $ ip link set can3 up type can bitrate 125000 dbitrate 250000 fd on
+ *
+ *   # CAN_1 link
+ *   $ ip link set can1 up type can bitrate 125000 dbitrate 250000 fd on
+ *   $ ip link set can2 up type can bitrate 125000 dbitrate 250000 fd on
+ *
+ * - Perform CAN test, run each of the pair commands in separate terminals:
+ *   # CAN_0 link
+ *   $ canfdtest -v can0
+ *   $ canfdtest -g -v can3
+ *
+ *   # CAN_1 link
+ *   $ canfdtest -v can1
+ *   $ canfdtest -g -v can2
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/*
+ * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
+ * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
+ * in case this hat is in use.
+ *
+ * In case of a dynamic overlay, pwm1 must be disabled before SPI_1
+ * is probed. Otherwise the latter will fail with -EBUSY due to the
+ * conflicting pin being still in use. Hence place pwm1 node here.
+ */
+&pwm1 {
+	status = "disabled";
+};
+
+&{/} {
+	/* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
+	clk_can0: clk-ws-2ch-canfd0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	clk_can1: clk-ws-2ch-canfd1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <40000000>;
+	};
+
+	/*
+	 * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
+	 * muxed on the pins allocated for SPI_1 on this CANFD HAT.
+	 */
+	spi {	/* SPI_1 */
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		sck-gpios = <&gpio0 10 0>;		/* CN7 pin 40 */
+		miso-gpios = <&gpio0 9 0>;		/* CN7 pin 35 */
+		mosi-gpios = <&gpio0 12 0>;		/* CN7 pin 38 */
+		cs-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>;	/* CN7 pin 12 */
+		num-chipselects = <1>;
+
+		can@0 {
+			compatible = "microchip,mcp2518fd";
+			reg = <0>;
+			clocks = <&clk_can1>;
+			/* CN7 pin 18 */
+			interrupts-extended = <&gpio1 25 IRQ_TYPE_LEVEL_LOW>;
+			spi-max-frequency = <20000000>;
+		};
+	};
+};
+
+&msiof0 {	/* SPI_0 */
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&msiof0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/*
+	 * Native MSIOF chipselect does not work with MCP2518FD
+	 * because MCP251xFD driver needs to keep the chipselect
+	 * line asserted between transfers. This requirement is
+	 * fulfilled only by using GPIO chipselect.
+	 */
+	cs-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		clocks = <&clk_can0>;
+		/* CN7 pin 22 */
+		interrupts-extended = <&gpio1 26 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&pfc {
+	msiof0_pins: msiof0 {	/* SPI_0 */
+		groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
+		function = "msiof0";
+	};
+};
-- 
2.53.0

