Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0BE42A168
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855068; cv=none; b=SmGl/UFKnVXUsk2AnNBHWZINMnLFMOVk2EJoPH6Zd/l/aVP1azTBbbXDsUlhCoYgOcUJ/9UTs1oIjWSRphNjI2DOOmLMPm11k+ppUUfRYMvR3DhJ9p/59WOMFLFM1Wx+Oh2epCEXjij25/JTnYoiuhighwjn5HrXQEizc7LBh7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855068; c=relaxed/simple;
	bh=qOOD0tS88P1qyjX3OgLktFlU/VM66bR2pG8PjD6bTcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9of2rjdT0KlBwgGwAQZy3ggAV+6Pg23PQLV+7qqZeE1XhdiHfyK1FYvKkFeZ8ctYBimqIF5kHlm0PAt+5dQw9EwlvtbOW7t2J4+Mh4stEs18LFZWdbDvTwUKp/4ZhId/SEQ0ByJRhoyjnznLcdgsSliFNm5jiaJa+Jw84v4Sb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SD8EWtLi; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SD8EWtLi"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so3818893f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855059; x=1791459859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtEL2g/8NWsR/SmZXJaalescOgxFX8anBFjSYLZjBpc=;
        b=SD8EWtLiqhYbj+bqFs/eUo/H9IY+Q2OrrNYfNOIOkJ0fAAVmfUkOV9Akv2I9w7VFuQ
         U56eOJ9WaoQRlMq0D1vFaOi6Jt7bumK4ZIkNvUj7azb4Fyx6mxvHlYR35cOWxX9DFGv6
         RdDYd9o8+RbBh4MBrqmZq6q/HoVSWxMUZ2O7qdv1fh5qPkUzYXe58OuCKQtcDi/EK4iv
         nF/qB1twacZs/JfRsCxmthKzuRxTQ/OpIWh/3Cq9pdCX1Xa+wM2u1ibVNI0ZrnZhHc+0
         AZfjPwJeV2rj5Z6oM0k+OtoY7OVMXsb4ukvMEtF3Ex6Ool1QRRHPiSMfDzNB3ZbSrXYD
         QbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855059; x=1791459859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtEL2g/8NWsR/SmZXJaalescOgxFX8anBFjSYLZjBpc=;
        b=KLpV3wRh1Cm1RGnnRoInDraVCQXCIiPcDDYLWYGpge9xcOkBta2XIlErJY0BfP3tDX
         rwTmDQd6niD1cqPOurkdfFnrtghWWkgNNqpwqiwBtmMC9x8ykA+HIpxUTeWmZsXIPW7o
         pFEOXUltDeFKDZIpP8qICgAPbGLlVVSMykXqG0a4FDX95mAo4vlNGcJ3QJku+ib5a4a+
         gsWi4RHzZAOxpyfJ0wPA+x8wcNc9NAjl3Q+J0THPYmn7+gsHo3JsvDZYJC5oxkK8+AIE
         b2ApXWFsolmJ+dMYH0szEI6OhTnTfylOjM5auNeTWLsiWmaCl40sA3pKDQrafimeKILZ
         XiFg==
X-Forwarded-Encrypted: i=1; AKwUvBx41PnHlBvAXhFmDOpCB+ksJOCVST6dxgOMTsrij95B0e/EIiurpig0PNVvVjJXUv0YQkSJvamNwUjq5EQ=@vger.kernel.org
X-Gm-Message-State: AFuF++koDHwFQlAu+ZriZ6c0Yd+o+uQTOCeA41b+M06uwKmcQytVdxz7
	SbV0j5QnwNw1w7aEvuY1tMTHLSZNEn2N6HUznWj07QtGdYJj29q4Oqyk
X-Gm-Gg: AYBFou2zjrCFRa3unpnRFSV38OBxNb4F9cc+6yPNgfi6y7uY3pX0KmTKidVlcQ65hkF
	bqWz0EXZzNYK3nm3fCtuf5NnWtt9BshtIu05KmboEfsxxAjD016exYa4Y8UglroFtz2xW+sIKVe
	5CQjJvTvxn0jZRRiOWirQMlOCmKRHZyTsk5GO8j4SFVcGZc47Uw5n8Ejjr1NBeDIZwmKnKc9xrR
	oaPFgbe7IfIiUKGGhnXrrnQJPZhjP4QKkoKQj9rocgxws+skQna/AusLpKze+nFrgscutnatild
	hjAKf0KBjuX1QKjQxwmcMS6qb15YU5YCaxD+IQBHZGBPpYFrIOddU/5kAUe+CIYyXO+07XhGsO4
	l/IOYUUNidsdp9BhdYGVWeHeWHAknbATnDLCS5VndQq/J2RpQJSwPmq0TihZJr9UAglI69qQnTw
	CCLyZiFF14RNNjTEtEIZw9JwlIiSfp3rLgeWz0tokj2A/3FBx9AT7TxU9UJJdjT8ykEsiU4XTOO
	BdDsLcrny1n7kMmP5O5Kptk77NdSJ+H5Xwf++DOtAwaLSEQJKPM7LuNI+8yRKIieCjFqppZvvVA
	mWTlG4RqtA==
X-Received: by 2002:a05:600c:8b5b:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-4a01b00b470mr68455805e9.35.1790855058853;
        Thu, 01 Oct 2026 04:44:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:18 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:12 +0200
Subject: [PATCH v2 4/6] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 camera connector nexus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-4-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
sideband signals and media pipeline through different SoC resources.

Add a GPIO nexus to each carrier description and stable Verdin-level labels
for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
nexus in the carrier files avoids describing the physical connector on
carriers which do not provide it.

This gives accessory overlays a stable connector and media interface
without embedding either module's wiring in the accessory description.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi    | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi        |  8 +++++++-
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi    | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi        |  7 ++++++-
 8 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index 3d0b14968131..4cf77559e69b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	sound_card: sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
index 1d8d146d9eeb..51a836324c16 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	sound_card: sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
index 4a0799d63446..5951cd19a84c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
@@ -11,6 +11,23 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4f64c5da8d15..1eb6b5d2b432 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -224,6 +224,9 @@ &cpu_crit0 {
 	temperature = <105000>;
 };
 
+/* Verdin CSI_1 */
+verdin_csi_capture: &csi {};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 
@@ -596,7 +599,7 @@ &i2c2 {
 /* Verdin I2C_3_HDMI N/A */
 
 /* Verdin I2C_4_CSI */
-&i2c3 {
+verdin_csi_i2c: &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
@@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
 	};
 };
 
+/* Verdin CSI_1 */
+verdin_csi_rx: &mipi_csi {};
+
 /* Verdin PCIE_1 */
 &pcie0 {
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index 0e218e6b8e29..164031d5dd86 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X21";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index 72a4f846d694..c52e46738110 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X37";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
index 846b36706821..b915fbbd04b6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
@@ -11,6 +11,23 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X14";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 45a4713c260f..53499289cf61 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -719,7 +719,7 @@ atmel_mxt_ts_mezzanine: touch-mezzanine@4a {
 };
 
 /* Verdin I2C_4_CSI */
-&i2c3 {
+verdin_csi_i2c: &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
@@ -829,6 +829,11 @@ &i2c5 {
 	single-master;
 };
 
+/* Verdin CSI_1 */
+verdin_csi_capture: &isi_0 {};
+
+verdin_csi_rx: &mipi_csi_0 {};
+
 /* Verdin PCIE_1 */
 &pcie {
 	pinctrl-names = "default";

-- 
2.43.0

