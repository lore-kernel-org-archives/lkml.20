Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C750C54280D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695092; cv=none; b=WnPg7/wLOV92ZZ4SeO+B0vsd1c4ZNaQntwUZZsaNS8F39KjzMitdL6YOz4TCvzYTOuswFLJsaKif1htw6ssfoYfDTSyjyzvN3ClptSM1/qWhDrJC0OiNCPCF7caVu8VqAFc1oPn2QNTF/xKyiLiwal2Jhnwsl9QVa0zRUjRZsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695092; c=relaxed/simple;
	bh=xGk9jTRysFq1xMJGgvf4PgE7aL4WLroGrjc8dG5KjBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLyejfXneUhbcVqmLOFZuCVxRj6bW84xiZNdq3v1FRaGlmx7BYBGHK0Hsc1Mf4g0+RE46O/Xx9+47vibm/1mbcf6qEIG0DaAOQvsSaBuJvGArgFJb2fVfahWsaccLISa+PBH8sw3yE0HJkYMuh0jOVB1rao7WjFbLvuKZpg3g+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxMrs56s; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxMrs56s"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso16759035e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695077; x=1791299877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQEEneNhkSGMagWc44r//3s8R86QBncqDPoJlJvrhsg=;
        b=sxMrs56svR62IOAgB2dZJnpZ6M9ksof2aFygw/ugV1eYtR4lwhpy+l/0al7D7C2eRJ
         pisVtdY+lDSdfFLF5dk6nGsZX7midK9ch+1RJNbqQJrhlAqyl99DZTdGkyslIOzE0Cx+
         06hEAttI2PPlT5kKwM6OToXh38EztdZInGO7AAEltZOOtlizI0LFx09c/4uPT+7pArEb
         jQc3c//teyePLI0zAaBV3+4CZlmgSQyfiyr89OKj8hU5gO2qkhFgM8Oe23OfE6dCGUvE
         +7A4OAVcUJV0DQSkk/YmBp4DII/hlC30BnyiCg7/SqJRRWsLIsEA+ibe8Ozalvi5TaWk
         RMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695077; x=1791299877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQEEneNhkSGMagWc44r//3s8R86QBncqDPoJlJvrhsg=;
        b=zK2FMv7Tn2wpwGSkxsF75JzuRvAgpBAk3XTHTlqzIxQlrzDt/6iXaa1RW1aMDIDgy4
         0nLK23GOwxBb8eAemPpfMITV64ki8fATAX/juMCob7z8NGTVkP5YVqpNLpbqF/vp5x/K
         ovinZLQWcRC1f7WKhzJL8OD55MY0uUm51vodZ5uYKU28+YL+VusADs9NZcYoLkdxgMpN
         hMkripvSRbs3J90p5mVWFypejO+gt/lXz/EKn/BfZn+8LCHoxJJb6e+pSAduZXcoD1Cb
         RnbX7nsCxXFUESVm/6U4OqPZXs2qxpSgCIDhHHt9+ie+Nm6q4xQaxTye+87G+m1Ue+P1
         YZxw==
X-Forwarded-Encrypted: i=1; AKwUvBzKDNmk1/X+3xOxzCFunndYPnThx0tkOrXFT0K6Kxyk4aUp8Dh0cXCsfZHlBiOiBMKiJalZM8OkdSYrang=@vger.kernel.org
X-Gm-Message-State: AFuF++krByEeFVp3DERV4IWIEfiJp3Uw8b6txj25On9mLhcNzG/ise5q
	6p/pus5JFjafLO0+M2x7uR2owS/tE+a9myth92h6vuQmMgUg4j/tqQrd
X-Gm-Gg: AYBFou3uWNfXRouhonk8qz0uSDUx2XzExcKX8rgP3Xu3BX6mL50PiL1uY24YXapDtGQ
	K5lNNJpuIssZtbOhW1xP61EefouJwn2pcBTuzqaKkn0BG+aBg5SkUd8XRiyuk1ycb0W50I8maRg
	JivUrN9EbLeVIyhRr72fMLfiVkMfjdcbCnRw3SZIjC7bsYd266T2GT0gci5S/GMSvHrtopdVeqJ
	jaGuE+PeBVNnYRKaFB9MBu4u+rEWWAxxhXVIx7B+xcYyuabGU6qa5/AgCxPLYnB95XysECKKfWS
	cEsYpi6Csdhlz3CAIgpEk7G2IooR5sHYL6fTWXqldYBGLIc2h1Tm55enESx6eh6L2dKqy/JKhw5
	7Sg8Gku/A71EVniP9DdsWipYwbIgOy5Fyq0Ez7cFAS+WT0cBQNMXKR9pl/lpBJyWnZ9blMoT+uQ
	NufsIj2WA61HvgdsYGm6VK3EVr/Q/W8XUa2sEmiUGBrZkNJKNJcgFyANMOi5r+9vUl/0Ajt2NIE
	xe5PDRkDvGA9ol2r9NS7sn+aaZQVFH/BB1SsJ/A0PJ89fD69yFkwVusga4m1KYrFEHcYx7ckkgb
	nLYtHnbZ8AV6voh0HE8h5gc=
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fe66c8a5amr298185815e9.7.1790695076835;
        Tue, 29 Sep 2026 08:17:56 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:56 -0700 (PDT)
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 07/13] ARM: dts: imx6ul: Add Variscite audio codec files
Date: Tue, 29 Sep 2026 17:17:34 +0200
Message-ID: <3d0698540d019da51c650675c7e22cec6488bcd6.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add shared WM8904 and WM8731 audio option DTSI files for
VAR-SOM-6UL and DART-6UL. Keep the codec, SAI2 setup and pinctrl
out of the module base so each board selects its fitted codec.

The DART-6UL WM8904 wrapper adds the microphone routes to IN2L,
IN2R and MICBIAS. Both modules use the same WM8731 description.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Share the WM8904 description with a DART-specific microphone
   routing wrapper, and consolidate the identical WM8731 files.

 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 17 ++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi    | 71 ++++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi    | 85 +++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
new file mode 100644
index 000000000000..236022f3da10
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+
+&sound_wm8904 {
+	simple-audio-card,routing =
+		"Headphone Jack", "HPOUTL",
+		"Headphone Jack", "HPOUTR",
+		"IN1L", "Line In Jack",
+		"IN1R", "Line In Jack",
+		"IN2L", "Microphone Jack",
+		"IN2R", "Microphone Jack",
+		"Microphone Jack", "MICBIAS";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
new file mode 100644
index 000000000000..7d74fc3b7014
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		HPVDD-supply = <&reg_3p3v>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_sai2: sai2-grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
new file mode 100644
index 000000000000..dd5f6e4edad5
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	sound_wm8904: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8904audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN1L", "Line In Jack",
+			"IN1R", "Line In Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		CPVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		MICVDD-supply = <&reg_3p3v>;
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
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <11565177>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_sai2: sai2-grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
-- 
2.47.3
