Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428634;
	b=UsX9QETaev73DNNpvXIBqjReXEfKvVzXS6XD0bUH5LjO9Kl8IwC6FHTZNWhlfqgcMxHF
	 JXvyZPicTBlrq40UErqTgQn75xmhsHDWopmPQv7frCbfVcOU9HY2o8ZP4lPP94bjc5AYX
	 BstYhGMU7FO8NM9ZH3Te3RK1dPHyUEvYWQV81nBeMkEZXSa3QZYZbHKqI6mNyhmErhO8d
	 nCpg4hL5zu/xSfesx+WcDqeWvtwpBu34+UgWbL8tvgSO+YV9Kw720L6iRpbSRMGw7UoGI
	 yxIagvT20s0F9dHBCjVtjRa5M80LN6pgyuDP3hA7uZIvtho3YANCg/csECW1Oj1qtSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5CBMO2BubPA4XjfiC3sOfSYOswHT5U9IkKVq5XRZJoA=;
	b=L6IVyGXMp5QG9yqn1VXi7r9L3eqNcWRcezuzArH1uCKqMonUjo3BEdixB3TTYHaXL1Gd
	 yNX2o06jGjTzQ8b48sXJtd67h22zoTK15ywDpso3IK+2CVa1gV7Tdz4m034YYvsgZSfjQ
	 mYBteayqnJwjHc1RHS2ze7/p1LfLQqH/lyMJoznuKLM9Pua9xs6zul9Kq0YbPD18fFx8p
	 XpKZgQtKPc1kwy5eoDB3Hv04Z2bCMwRl8oKVhf0BY03HB3B22whqCOAtSCOCo843kRt+c
	 uF/1yF201ei/HuQ8MuYJmOu+qmB0GJ19WsszslX1KFBpHy89X5jFfD4tfKza0M0SPaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayaPPouI;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E76606A890
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E76606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayaPPouI
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e47347279so2322534f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428632; x=1795033432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CBMO2BubPA4XjfiC3sOfSYOswHT5U9IkKVq5XRZJoA=;
        b=ayaPPouIf3P4Ky6AF5mCNGuGpg7eFFPWLcQv25a87lVKHJC96wprEwZ2gHxVBp34Xy
         /vc3NbpiZq3qbqu8wdl8Rxzp/HkWLxmgbYb4s0ctoSzrzMjT6gUnjhvycT7qhP8WItVS
         wDonNseMlkmRwwj6QayYmZbuCT0SC3XzBEKXGqV0vqTD8/J3cPQhZ/NFqTNJcEzsu1Ry
         /9U2c+/Z5OOcQpAPpcVDxL/hestSpXSBnCkU+xrnJeVpKCYf66CdMiWPiYLDNmXxyCFl
         LQSwv1Zhn19Ch0utuQQzd+Xn07Aurjx+rNMnJ88hfV/BDa6If3Xq5djtHgKGYnT3orec
         YGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428632; x=1795033432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5CBMO2BubPA4XjfiC3sOfSYOswHT5U9IkKVq5XRZJoA=;
        b=Xq8YOhvXA0tbmUew/TzZZbrjg8eyAaHxdFMQxxq+MyuMIhBYQQeJmIUusvM7M2i/g2
         SWkXYuu2+roXqipc7AIdqSgO9zMcd8u69sDkc9iQWEPdCliGsDgOVkjxg+upAv3ozV3y
         t/kGWfk2CWYJEE+imAAGAzrRjfZA+gp+9QhSoSLuvK9w4tiRMtbTz3d41Grvb6u9owwi
         frI9ARmjTMXdR480hvVGx3No7zWaSyVNaf53x+MltFqALz8O98UQ3R74lPWasZlVVUSt
         tYAlSeiGXs2saprv5McMLJH4/wz1ky1UB2H+mRaWteYEA/zj+/saWUwu4nNw4ZwN+T+E
         Zjew==
X-Forwarded-Encrypted: i=1; AL+hErEjSLprjI6NrG+gtTcLynLwZTWgxpE4Eyq8CqxikBtaXiBtLh2Eh/gywAZzvR6oTis4jIwa/XFhYmQG2dQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z83I1jHeiG/Tn+sORKEHpbrTn/8K1S8rCLpxJvEvMuF1UHGDS33
	7BXiSU/Lj//nB1iPM3VAIdf6ZbDLtxdgiXZVu8qxS64njrkWb0CM7vzA
X-Gm-Gg: AYBFou0OEPD5GzKH7pwNx5aM/XHMHJtQsycvjZZlxYTrF/XFtp/zkn9e/Lm2ClKWEFi
	GL6/mCTlax3nLOVaumu7FmZUumH3wxcJgCpZCOTPIGq0W522QSgn3C2xyi9Y6HC0ZtMeKZOnA16
	Fi+EBAg/3H1XXkBf/0Ok6H4ztE4Bvh7fhgH4hLFHwElLXQGvG1IH3SdWg5h1/27pMvulos+YjI3
	JhXVcWMoxef9CRMqSB8fOdiBdt4w6bvRXK9Os3dttvfAMxKXbslA+F1rxpfMCx7FwA/TFqgXmyT
	OC9zfi6kGkfmfYG60IbygQDeV8wxdzMmFc5A+rBU7OAvhuCjTpzkoyvbFlBGu5RB1JlBMvAOhPW
	2Fw4W2fWMAWBaa7kw+8UtUVspbKE8WfmRfCV9jhpcwLSW/+hm+7ouXkjamq1Wbeu4SDp3eS2rq9
	Ybt8lrJTPYEay59Cngjuh9uX6bXnF9BSIUNVUuKNp/GbDhcjv48V6ro5Qn4/OWYrnsJWgouEVFI
	Peuu/iQIJXmC1Uz6K1nKL/V+pDvCmaKposxhqqsjWPGDpfXkB9ETZScwHuQkUYtTBYtpuXplthN
	06Fi8ytDbsVv772eLGkhp6l08NZcvDOD4yQxPwTI5qthT66Qv4S8eudA6UEpBBvMOmW6vhg6uQw
	79GsMjUHHw8R103omwD4ibW5l/sFdQDB5/HztbCl90ry1TDCjHCIzZuE=
X-Received: by 2002:a05:6000:4816:b0:490:2033:1477 with SMTP id ffacd0b85a97d-499c9134147mr5006243f8f.56.1794428631684;
        Wed, 11 Nov 2026 12:23:51 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:51 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
Date: Wed, 11 Nov 2026 21:23:11 +0100
Message-ID: <b76a07664068aa8cdeada3f44b3b1c4fa56cc887.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794420001.git.stefano.r@variscite.com>
References: <cover.1794420001.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite VAR-SMARC-MX8M-PLUS system on
module. This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX8M Plus MPU processor
- Up to 8GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Two integrated 10/100/1000 Mbps Ethernet transceivers
- WM8904 audio codec
- Dual-band Wi-Fi 6 and Bluetooth
- USB 3.0 hub
- GPIO expander
- RTC, EEPROM and ST33 TPM

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/var-smarc-mx8m-plus/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - No changes.

 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 ++++++++++++++++++
 1 file changed, 640 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi
new file mode 100644
index 000000000000..139815cfd5f8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi
@@ -0,0 +1,640 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite VAR-SMARC-MX8M-PLUS
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/var-smarc-mx8m-plus/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+#include "imx8mp.dtsi"
+
+/ {
+	model = "Variscite VAR-SMARC-MX8M-PLUS Module";
+	compatible = "variscite,var-smarc-mx8mp", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos;
+		ethernet1 = &fec;
+		spi1 = &ecspi1;
+		spi2 = &ecspi2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0xc0000000>,
+		      <0x1 0x00000000 0 0xc0000000>;
+	};
+
+	reg_audio: regulator-audio-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904_smarc_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_phy0_vddio: regulator-phy0-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_phy0_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_phy1_vddio: regulator-phy1-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_phy1_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_usb_hub: regulator-usb-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-hub-1v1";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		gpio = <&pcal6416 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+	};
+
+	sound-smarc {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&smarc_codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&smarc_codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		smarc_codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904_smarc>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+
+	iw61x_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_wifi>;
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio2 19 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_eqos>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <4>;
+			reset-gpios = <&pcal6416 6 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy0_vddio>;
+			ti,min-output-impedance;
+			enet-phy-lane-no-swap;
+		};
+
+		ethphy1: ethernet-phy@5 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <5>;
+			reset-gpios = <&pcal6416 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&reg_phy1_vddio>;
+			ti,min-output-impedance;
+			enet-phy-lane-no-swap;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	wm8904_smarc: codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		DCVDD-supply = <&reg_audio>;
+		DBVDD-supply = <&reg_audio>;
+		AVDD-supply = <&reg_audio>;
+		CPVDD-supply = <&reg_audio>;
+		MICVDD-supply = <&reg_audio>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		wlf,in1l-as-dmicdat1;
+	};
+
+	pcal6416: gpio@20 {
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcal6416>;
+		reset-gpios = <&gpio4 3 GPIO_ACTIVE_LOW>;
+	};
+
+	pca9450: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2: LDO2 {
+				regulator-name = "LDO2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3: LDO3 {
+				regulator-name = "LDO3";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6416 13 GPIO_ACTIVE_LOW>;
+	};
+
+	rtc@51 {
+		compatible = "nxp,pcf85263";
+		reg = <0x51>;
+		interrupt-parent = <&pcal6416>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <11536000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&snvs_rtc {
+	status = "disabled";
+};
+
+/* BT */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>, <&pinctrl_bluetooth>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&usb_dwc3_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8142";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&pcal6416 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8140";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&pcal6416 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+};
+
+/* WIFI */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <4>;
+	non-removable;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog1>;
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&iomuxc {
+	/* Managed by user-space to enable bt correctly */
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			/* BT_EN */
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11				0xc0
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0				0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1				0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2				0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3				0x90
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC				0x90
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0				0x00
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1				0x00
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2				0x00
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3				0x00
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL			0x00
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC				0x00
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__I2C1_SCL				0x400001c2
+			MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
+		>;
+	};
+
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
+	pinctrl_pcal6416: pcal6416grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05				0xc0
+			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03				0xc0
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD2__GPIO4_IO04				0x1c0
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC			0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK			0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00			0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00			0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK			0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC			0xd6
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK			0xd6
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX				0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX				0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS				0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS				0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0				0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1				0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2				0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3				0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0				0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1				0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2				0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3				0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK				0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD				0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0				0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1				0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2				0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3				0x1d6
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x196
+		>;
+	};
+
+	pinctrl_wdog1: wdog1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B				0xc6
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			/* WIFI_EN  */
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10				0xc0
+			/* WIFI_PWR */
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19				0xc0
+		>;
+	};
+};
-- 
2.47.3

