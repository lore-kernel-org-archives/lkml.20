Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC5433BC0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420766; cv=none; b=AFnalNizw0HK+Fnbq7jPcxV5SspTWvtMUEo24VE+ph5d1QH4hxTpv6oAbFOEWYQi1q3TjyICESMjXV+/CwrExUCiqYKIDMDa6xidgp6JT072YlBqarkYWplJ6keaVntKQlggpqWaE7Z2K8ZWGYJWF9lD8MffEddMhn2WNre2VgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420766; c=relaxed/simple;
	bh=0s3bNimsrqWe9GNhW5pAbHyHtCuEZz9KdHNzWJpL4Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2HIa/rPaAIIBbV/fjD9JXQVyvHvJpbrDddBr8gYiLzkEKPHsAval/YEjXBgIo3y/PDcTAdLbcthKEf/yfchUHMDVyC2+lEUVWZbi8M/tpgoYuFjr2c1GL2HNR0+K99zRJ8GXcg7Ec1TBMhDOclxsHiDcD65x9npwBRb/VOhowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAcPx5nX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAcPx5nX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so549955e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420758; x=1791025558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcxN/79QVpYtVff94ulfQvl1HxttnjVCiZaViBlDJ8g=;
        b=PAcPx5nX+oK2OuqcCHhXxLrVH8cwjh0R1bzJHASYu1/3AoIT18oAAmABwVGxGbAuqO
         RpjsnbGg/1CkekKphfoSf+R1CDMkOWTHaPuHF/meLahvx3X/KhGQvzgYPPlZro+ZhYTX
         Ysu7Svc+VnI7+kHnx7NxNQJwVThiuFlCKEa6KYuTFFejFih4yyrmGsZCpIpX3uQobYLM
         n4cQGBoCix8ISp6SBs+Be2N+nJ4DpX64Xg7YtmqEJy2EsLrjOq5q5QlyOBXEHz9ZjvIb
         7dgwGc8yzDegYSO0DYdB1OMtDT3scnkxrvNP1fiZoLY1sQ8bbnspwPrgfIS5hdAkmT7Y
         rjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420758; x=1791025558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QcxN/79QVpYtVff94ulfQvl1HxttnjVCiZaViBlDJ8g=;
        b=WaCKd9QcvZaT46Tp6mkbzzrfV5LwKTBsYmKha4xOoH0zBNbN0aeFsGVrFeVrEIWKkL
         fyMxI13vHzsGOeVybWDCCoUWLZdDZBsjkPzH+I7WDv5hedxeaMAKRYBU0MDuo4hpWzy0
         dJc3syuT8Mx3Z5lEZa3bAmhNpKf7On+F2TFgxhKDn6xXhmF/M5AuHA1jmpumx+qo+xE6
         e7zJHd3mlMollJpLDvAW0VDkFrui4bSVp5MfiMl4aCgEjTKAfw/GiTUmqQdVN2Qyx4J9
         VfVZgFTx3p+efJaAHKOBGPBao1mxvXrwGXyU2fCBH4hm/X31OAPCZZBxeQ1omIlF5PHa
         lQWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj1WaiYFCQpXhPV2HEDTQwhSkw8Uuw7rORihBehnyJxCmitq9/QnCR1UmgSyHU3xFU0SXHffEL177gKTI=@vger.kernel.org
X-Gm-Message-State: AFuF++kvOw8fXaWrc2ACT8Ad7xlmuctYm2UrI1EQ0hmWNnRIxhrsFEnO
	RQWJEenZsbUoGbIc+yYIIhyyjAl6SzV+hezIDLe2QjJzfEsTO0fbVfsm
X-Gm-Gg: AYBFou2vkG181jMXHGjQMV7mKiRmZRfdZDdNWMY2XpsyNvTmOxXW0eBH4Kp997ZOytq
	MHc1EUNaW+YbNnDFuqcegwg1SxzIC6E/bsBzlEnRTNQehuSz3N8loZvCzPhPTSVu8TlSot1R44T
	uCypGIp7OF7xNMN6ndsKM0ZIEURV4iFtO+exJ6sV0q3XaC0vvagtccLa2+W3i7pu/Hbkp2afm7P
	a0H5s51tIdWz9IiDLEWF6gC3gPdJLsgjjxfT06BGcsWmbgS3KVY9hcSvGr/wChFZ2+E4ekwXZ3+
	rOfNPFqpqi2zR0rYntEDie/CkOx6Z+CahBbtJMZi0w420KfHZx86Y9KHJmWZ2QtPPBd7zylsOs0
	SKgxVnDnygrNPdnhrG+7qh6LshJMyjlkbzcq2Q7af9s+OFxMLpQinUvXf7+jp5NqP/k3SYfbq+3
	g/ps+WA74NoWVSKkaBQnNWdvirwzSFhfh1Qn7LkOwA0S9BsmXWS8rsXzBKWVaaQi66uT8+kOYFW
	jHxTsfOpY0+kEu51S7fuu8duvVA6JwQtEddy/WhGHNptgTjkSBtFn893HkENevUJDQp9jGhXaSq
	Fcl/Viijp+OxIYH+wMKpbA==
X-Received: by 2002:a05:600c:19d1:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49fe7b62c5bmr147032075e9.11.1790420757450;
        Sat, 26 Sep 2026 04:05:57 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm12124664f8f.31.2026.09.26.04.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:05:56 -0700 (PDT)
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
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v2 04/11] ARM: dts: imx6ul: Add Variscite audio codec files
Date: Sat, 26 Sep 2026 13:05:32 +0200
Message-ID: <105aca6e5126b1f45108f33f93f1176cd7fa685f.1790413032.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
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
 - Share the WM8904 codec description between VAR-SOM-6UL and DART-6UL,
  keeping the DART-specific microphone routing in a small wrapper.
 - Consolidate the identical WM8731 descriptions into one shared DTSI
  and update the board includes.

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

