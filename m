Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDC33D25A2;
	Mon, 12 Oct 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786689; cv=pass; b=G6YW6Tke3TOG6JnOJtQkfoyXRGZyg7x6i2rptthKaC23VuRqpJQ3H4dpFBpMOq1dGI3Ee6PB0FaifjkibNKFjuTFJ/Qigj56dZBl8uCDZjdhz0iNd7HJMz2XD0LHCEr14lwkIbX9cxoJROJNTKQO8bF3wIcs3JnVEocdVMsKcCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786689; c=relaxed/simple;
	bh=5DWkwLuvhVI9WkXp7/Um5OAn9pxep4COzyUwq/dLrrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjL/+NNyNC6/NktxEhCnIGfskzuYnrrEEFJH3pCh4ColwBi1qH6qg6MMjE5E9w8796lya4YL4kAhNdukWT77YuNdWq4KanlKG933B77ErzOBL5oeJO5yZHSX4TzDo201QOP8MEyKVDiZ6v+HcNG6aZXb3MO06NwwPds0QiS44uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=V/EuV0xm; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="V/EuV0xm"
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 018B7201DCF;
	Mon, 12 Oct 2026 08:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZUpjWP2/jJqlHsKNZbKckpigr+fdFmUOwOX/VucnJY=;
	b=V/EuV0xmKRIXznGueED31w775+uwZndAQ2mkBg7Z307O8FlojjE1bq41jwWUttB5WqCjmD
	EDyxL0cXDbX9UtGR8fVR1NIFMzCV9JDCszjTkkFhQObIJ0IdEBrHo7gnEdjVeodMS3zvAj
	XlPINrgn5DRLeiiz7FTMoJR2I3ZLpu+1odOxOw+kYRrIQcChSdXEH5vSkyGl6NZy+AWTrL
	6RQETnu3q9eqTwt+o7iZb/L+24rYtqw/zALd2RW/XR7Pb9CR3xaR2rKrl/nxdxLuLPfdtq
	DtfIUATavQWObrrOzCgVJlazFKJFnzcZf5nbm+fHNlEDRN72HYYkAx6kuNeOJg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791786680; a=rsa-sha256;
	cv=none;
	b=JeHaB1XZuZfzH0khOwXCIPLsBThxd6JpbFN21D72qxorir4M9/dfS7Mejq6ceViCCb6ssh
	1EXnCLnTtB70hvk3I6jAsexUYsQJ6NcUxUQxiPctSparcvJYhLFA9hDo706jvH4xDqvO4I
	dTtloRYAM1ECH9IbMDwPFdy7ySy3Xm99YNGrQgvB2laqWr3rA5IGksHS+ZMbwqREfWnC9N
	M3J2PjjRpRyeQIOAeRggD8NdbR5AYmL/lmmJEzyfrfF0VlFvaW0bsSgJIFYT8q8SkXG0Rh
	L8O5gudoPkhpLcSZ2GXRm/z9Hn5BFghW6Thd5sMRWfY8CGwt36Ak8v3JItG2PQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZUpjWP2/jJqlHsKNZbKckpigr+fdFmUOwOX/VucnJY=;
	b=bNMqs7pq1SOYC2xuvPVId26QA7rEU7bvq/QGFPmBK47JlAIrWDRSBb50ESUPSioZE95GXr
	+gHAZZoQ6A98K1KIDtvzPFukZ0Zd5sBPOArHZSL1NHef4lbkOQrlI3p9pMkCE+kjdxXl6k
	phv0ofpnQAns3SSkbiv1K/diVboLj4VvM/H6O1BYNeRSHjqcceEAD1b2V5YGeYtK2lZMSU
	CQcyaOkiQhK2z8KZOFT4lx31jqVnSJ0KSIFfq6tNne1mrhXktyvygXzrUvO8jZ2cXsdugC
	cF09VAkRHRyNfSvrDw6X3f7xE7/+US2xgovsmsgA5hv3XPx8oel+1OeoSNTtMg==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Oct 2026 08:30:32 +0200
Subject: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8062;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=5DWkwLuvhVI9WkXp7/Um5OAn9pxep4COzyUwq/dLrrA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9aZum3N05esvWm7huWZ2iSbi4u4CxWc/AM5IzjNPj+VK
 Sv0ONzUUcrCIMbFICumyKKysIJP1OODZ+Q0ES6YOaxMIEMYuDgFYCITVBgZ+oq1OJpObdC/zPp0
 ttemZXejLVbGazIrLtXRi2+/vaTBgeGfTt4n/dK/EeK7t78Q9/oi8swu78qWhpDyL8vzhH14nGt
 ZAA==
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
similar, apart from the Display and touch controller.

Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
variants to use overlays applied on this base version.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
 .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
 ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
 5 files changed, 91 insertions(+), 99 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 475e1ad9116e1..7c1b61249778e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
+
+imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
+imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-tian-g07017.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
new file mode 100644
index 0000000000000..33ddd08a7adb5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
+};
+
+&{/panel} {
+	compatible = "jutouch,jt101tm023";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@2a {
+		compatible = "eeti,exc81w32", "eeti,exc80h84";
+		reg = <0x2a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
+		vdd-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
+	assigned-clock-rates = <0>, <506800000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
deleted file mode 100644
index 9a562c011f2c2..0000000000000
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
+++ /dev/null
@@ -1,81 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-
-/dts-v1/;
-
-#include "imx8mp-skov-reva.dtsi"
-
-/ {
-	model = "SKOV IMX8MP CPU revC - TIAN G07017";
-	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
-
-	panel {
-		compatible = "topland,tian-g07017-01";
-		backlight = <&backlight>;
-		power-supply = <&reg_tft_vcom>;
-
-		port {
-			in_lvds0: endpoint {
-				remote-endpoint = <&ldb_lvds_ch0>;
-			};
-		};
-	};
-};
-
-&backlight {
-	status = "okay";
-};
-
-&i2c2 {
-	clock-frequency = <100000>;
-	status = "okay";
-
-	touchscreen@38 {
-		compatible = "edt,edt-ft5506";
-		reg = <0x38>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_touchscreen>;
-		interrupts-extended = <&gpio4 28 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
-		touchscreen-size-x = <1024>;
-		touchscreen-size-y = <600>;
-		vcc-supply = <&reg_vdd_3v3>;
-		iovcc-supply = <&reg_vdd_3v3>;
-		wakeup-source;
-	};
-};
-
-&lcdif2 {
-	status = "okay";
-};
-
-&lvds_bridge {
-	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
-				 <&clk IMX8MP_VIDEO_PLL1>;
-	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
-	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
-	assigned-clock-rates = <0>, <358400000>;
-	status = "okay";
-
-	ports {
-		port@1 {
-			ldb_lvds_ch0: endpoint {
-				remote-endpoint = <&in_lvds0>;
-			};
-		};
-	};
-};
-
-&pwm4 {
-	status = "okay";
-};
-
-&pwm1 {
-	status = "okay";
-};
-
-&reg_tft_vcom {
-	regulator-min-microvolt = <3160000>;
-	regulator-max-microvolt = <3160000>;
-	voltage-table = <3160000 73>;
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
new file mode 100644
index 0000000000000..b9781a418e4d5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - TIAN G07017";
+	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
+};
+
+&{/panel} {
+	compatible = "topland,tian-g07017-01";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5506";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		vcc-supply = <&reg_vdd_3v3>;
+		iovcc-supply = <&reg_vdd_3v3>;
+		wakeup-source;
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
similarity index 56%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
index 3e320d6dea3a2..c830f3ca8cb45 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
@@ -5,11 +5,10 @@
 #include "imx8mp-skov-reva.dtsi"
 
 / {
-	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
-	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
+	model = "SKOV IMX8MP CPU revC";
+	compatible = "skov,imx8mp-skov-revc-touch", "fsl,imx8mp";
 
 	panel {
-		compatible = "jutouch,jt101tm023";
 		backlight = <&backlight>;
 		power-supply = <&reg_tft_vcom>;
 
@@ -28,18 +27,6 @@ &backlight {
 &i2c2 {
 	clock-frequency = <100000>;
 	status = "okay";
-
-	touchscreen@2a {
-		compatible = "eeti,exc81w32", "eeti,exc80h84";
-		reg = <0x2a>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_touchscreen>;
-		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
-		touchscreen-size-x = <1280>;
-		touchscreen-size-y = <800>;
-		vdd-supply = <&reg_vdd_3v3>;
-	};
 };
 
 &lcdif2 {
@@ -48,14 +35,17 @@ &lcdif2 {
 
 &lvds_bridge {
 	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
-				 <&clk IMX8MP_VIDEO_PLL1>;
+			  <&clk IMX8MP_VIDEO_PLL1>;
 	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
-	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
-	assigned-clock-rates = <0>, <506800000>;
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			ldb_lvds_ch0: endpoint {
 				remote-endpoint = <&in_lvds0>;
 			};

-- 
2.51.0

