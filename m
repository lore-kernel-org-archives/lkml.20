Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339854854EC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843316; cv=none; b=oN1L+Al21ySNFSGsP125nPeGFMR+VeFD4SZuAIkz788XltUK22HWZQvboyOqvBlXgUy0jE6U9te6+xi9LvC58izmH1ShCZzHJJf7o/DF1biq0G8pwDTD59ATNSHnMHfJrlm1WeSzpPvO2Uc/C8npeel3DnYZoT9lTkIPQC/N7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843316; c=relaxed/simple;
	bh=CBpNfB0k+b46U//Pj60Gez3psv46g1IOnpZ8DHzDA7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcLuozFtBAZBXbDFt9rYdR3hRS7flqE1TBM/av2lt6VJybOh9jeD+/Rjuj+Jm0g5jILwJTm5VO0K8Nesv9itgvfMto3yVFKDClR9oLF+UNHXC9mvYykwfQ0Z45ti+OgbBF45pMpyktJI+rks0BjUOcAqH+PRurT/jNadyMyrWls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hb+ZLMfC; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hb+ZLMfC"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c86945164so18787231fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843312; x=1788448112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYfKpm6t2d+y0gofCUNcKVDrQT5uFhjArzVmA/STbho=;
        b=hb+ZLMfCnyzDti9TZIqmqUdVxrNSBPK4lPcm/WBDICPoEI1uTgQXd0C1r+s1cUlqCQ
         egH5Ts+CY3iNV8kQAsZE8/O0LzLNCB5cnvs+2bx3A8pnuhR2zgyfWE4EgDTAAwe/j+Fh
         ZZKTWj3J8f67DcpOWsONZn1DNQgIkeBHiqey2UP2CU/jUeBWq31vYVY6ZZ6jEmePh0dw
         VSlj7V3VizjFdubks5wbHRVvcwrjDCgtxvR/+SuaLBAhZZHpRE4YnmeZVCDSxoAE7zIu
         Sw+xTx9HV6ed3+5rn/8rkBSGaSTxDRP7RvA2ww3WZQOM/droFTI24bmBPfGo8Q34jB4Y
         KB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843312; x=1788448112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYfKpm6t2d+y0gofCUNcKVDrQT5uFhjArzVmA/STbho=;
        b=GZy1FoSVNK1MEzLSVL3bn95cTrjsS1sNYKxcC0yj667Tuqf44A0PtPuJ13GF9onKmB
         Ez1y8lhq/4j2sMtLgkrKyjBg63iMUMVsoAWpQfJmIdjJTKi2bjkvp2tOrrOMqjJoIOXL
         2xn+SgGEwJ3v4ftCzZFPHWoXui/xHhZfp43dF4sdvJYlhBqzuPZc3+KmPFRL+9bMlGKn
         5IAhbjNXLOB08pg5tX6WGW/1SHi+AS/DBeHcmfGyhY0mGMbPx48Q87anWCI0Bvq96XDY
         +wHBPzl01mf+DlFkN6wa9l2TthCst2DXgynu0ovHgxSWmpMkmYWaGVJJlxVhIsvQqgsr
         It+w==
X-Forwarded-Encrypted: i=1; AHgh+RriSqP37Rdc/bQncCe2MQkHlIAyfFbm3KvtryMKneZISRjzSXWLUlqfb1V7lJdi2qF8mu1w5tORtOwxAa4=@vger.kernel.org
X-Gm-Message-State: AFuF++mRHo25IJ85hFn497RLTw8eo8MTCZX5Q86+h7jc/Le0NkjATQ/D
	ZsMJA/q9e+Xo8JDYxjTmU2kLtnnk93aF1LHtkM7LBkiT5nP4C/TR/sc5
X-Gm-Gg: AR+sD11g0KFwzAN3KvRWRvItM3YBDc6rm+k8LkGBxsbADczLHmdzwZ+8XAfibGBSDIv
	UoylXZAxaU48mKHhw/kAS4XGIa6ac/z1YhEQP94YK1I/CBjFkaNEuen3ChZeCWbGgbvBrxhIkAB
	BirKEGclEYlha1KtJUO5ClG97JoMh11dTvIE6CYA5Sr+AvZt0egA6ENQTwQ4WY0Wyk3oJSteEU8
	PeBJlJirX543NC79cAP+RzOYCuayPHcwyMRNkdo0oxWVu4/aYpQi6Fpb3dxvEpGHGDQhQa+krIL
	jnNm8IjrWbVhus4fSapRX1nlaPzzOLoHhAbCmCTqr1lv8Bs6t2+FWqNCh/C4zGgPKvOSWYW7KMu
	gr6xzkdvVOj4GB2o7N6GWnfVRJwO4RraWfPXtyn6L6n9auVTxzuCbbCTMenTgrPflBlA0jvIB/a
	HIpmhGach2dIad293TdyNP142DTb+yDulrMtnLLZckSrbGDtb1F7tVqicjIWVK2jwxqr54iHSSk
	m3bFB9TzhcTa48=
X-Received: by 2002:a05:651c:a38e:10b0:396:9897:4cc5 with SMTP id 38308e7fff4ca-3a1fd49833dmr30925551fa.5.1787843311736;
        Thu, 27 Aug 2026 08:08:31 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:31 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
Date: Thu, 27 Aug 2026 08:06:57 -0700
Message-ID: <20260827150657.1657-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
References: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add basic support for NXP's MR-NAVQ95 board. This board is designed for
robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
following hardware feats (list is not exhaustive):

* based on i.MX95 19x19 SoC
* 64GB eMMC
* up to 16GB of LPDDR5 memory
* 1 x USB 2.0 TypeC
* 1 x USB 3.0 TypeC
* 1 x RJ45 port with RTL8211 PHY

The support targets revision B of the board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 237 +++++++++++++++++++
 2 files changed, 238 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..4c5ef83cd857 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -712,6 +712,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
new file mode 100644
index 000000000000..7458e77dc2ae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95.dtsi"
+
+/ {
+	model = "NXP MR-NAVQ95";
+	compatible = "fsl,imx95-navq", "fsl,imx95";
+
+	aliases {
+		ethernet0 = &enetc_port0;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VDD_SD2_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <12000>;
+		bootph-pre-ram;
+	};
+};
+
+&edma1 {
+	/* owned by M7 */
+	status = "reserved";
+};
+
+&edma2 {
+	/* channels 30-63 owned by M7 */
+	dma-channels = <30>;
+};
+
+&enetc_port0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&lpi2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	i2c3_gpio_expander_21: gpio-expander@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
+	};
+};
+
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	bootph-pre-ram;
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emdio>;
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <1>;
+		reset-gpios = <&i2c3_gpio_expander_21 1 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		realtek,clkout-disable;
+	};
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x57e
+			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
+		>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <
+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3         0x57e
+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2         0x57e
+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1         0x57e
+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0         0x57e
+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL   0x57e
+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK      0x58e
+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL   0x57e
+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK      0x58e
+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0         0x57e
+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1         0x57e
+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2         0x57e
+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3         0x57e
+		>;
+	};
+
+	pinctrl_i2c3_gpio_expander_21: i2c3gpioexpander21grp {
+		fsl,pins = <
+			IMX95_PAD_ENET2_RD3__GPIO4_IO_BIT27			0x31e
+		>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
+			IMX95_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
+		>;
+		bootph-pre-ram;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX		0x31e
+			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
+		>;
+		bootph-pre-ram;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
+		>;
+		bootph-pre-ram;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
+			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
+		>;
+		bootph-pre-ram;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
+		>;
+		bootph-pre-ram;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
+			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
+			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
+			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
+			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
+			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
+			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
+		>;
+		bootph-pre-ram;
+	};
+
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	bus-width = <8>;
+	non-removable;
+	no-sdio;
+	no-sd;
+	bootph-pre-ram;
+	status = "okay";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	bootph-pre-ram;
+	status = "okay";
+};
-- 
2.53.0

