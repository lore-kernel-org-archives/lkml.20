Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E404AE138
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054696; cv=none; b=fdQdd2eLxDKk1iUAmarvVIv+3MlwdBPTnfWNOc5iNQMjRBr8M69de+noTyeyAqJgCJEZCjD9rde2yWjPJhDXtofyON2/0jPSs9NTglhdgsIaH17LB1T3nQ4NL9VaxcHvNrfhqYU4lDBQcWCX0gmdxB2c6mPsndr5XQ3XfqVG238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054696; c=relaxed/simple;
	bh=XR+ZLq+yZuWg0LwgG5a3OLn0lNhcJAYoSoOClYOLK5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2dnMRsxM2SfdJlI4A3K/ms0gjBMnwtjx9Vdz+G02FPnyw+bYWJVgBvIOCqSDZigW7j7OqayA/l3c3/HmGFAAxmec2jJwiIqoNwiTKROuH7HnRycEtrtUhGwUpEbANdmpmimXgDPL8ozN+46Y+PBKWqJKQaAuuzUSLDgaVE1zIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYSM9kMf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYSM9kMf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so56052215e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054690; x=1789659490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IG04Beex0G5ze2V85Caxm9OJioEWxsuxn7cmI959WRk=;
        b=fYSM9kMf/Ye3xBOS3+A2ot8DtZwHplTEzNvDFvm+1mNrFzWE+V+JRo+eUPJuaKHjDw
         QH9tTvf9+K07X9wIdqW5uEGanB740NtYqN/FlYD1z+xFjN7JwZ0TjSqP8URThgCWiKzs
         6UKmfmFYdQWOJaW0ugt3c9OTSUzIqsTz2qVU1ILYQxFIWGq8YrVeAHVXB6sCz9dIOexq
         Xe1bySpmBHUJuHd0tntjWgA2UJmJEsVRxqRQ44fRHJ94YKed/iQu+k7tpgbUGQgVO5RO
         8XkqNMSzvb9HGN6Kb8zNi4oJ0xAsb37U4rZ5bLvS6bHxe81iKcVDoI5taRmOrmI0by/5
         374g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054690; x=1789659490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IG04Beex0G5ze2V85Caxm9OJioEWxsuxn7cmI959WRk=;
        b=szocryVVj6fn5inHYelzsvNkGkCSBPs/0/V7Q4XfoakBiu09GnQtCRiLhWlI4nVGM/
         H9f7txqXU+3sTCFc3AaI2MZmnJu9wCTiHSpP0J/NkyrctB5nPiazC/bsIuYBTqTiMhqY
         J/IBoZSqEcQEH7F/IW664WYPZ/hSSw+dAnOkivUf5DZQGHIHdGt9O2M/ZEyv9M1tHuEg
         48GgKMMcdKpCX/kRSHsjCHe3RqooZFc9kVmiAxM7Fq9C4TByJ5yFMmkeI6w2VJakhXBm
         d9UlJGmkqy/h+NgfOIG1lw8QCYPy5pTLHQBSBGnlJ1jx6BoBRr9g9ZzaW05mBp/IA5U7
         5sug==
X-Forwarded-Encrypted: i=1; AKwUvBxnyEizSUSYeIaTIhSzkb/5LSK3rP5/Od/MWSGTSTJOfsil6SLGgDwkRcOVcQHRWT+Elvc3es/XNudbP70=@vger.kernel.org
X-Gm-Message-State: AFuF++n6IbPZLtJNUyhdVmJwwYiOCZyFv4BhnpBnxKGnH0a5exvHODgX
	RzPV5DcuSK1SXmsjaNL0G50T/iv2O4N/3vtjc2/OgjQHE5oegBCvzapC
X-Gm-Gg: AYBFou1SrTp9DzdPcQX9rahCFMk2seql2FwiF1jP3cDY/+c4LnKb22yb1mp3QwJhOwK
	bbn27iu9UywXd3np5hjoVp/BZYOHOh5uQgx5INrg3mC9CpAT28Mg4uSNZakgBawrui0WdTNQIhB
	VW8ug5MDPwTFAsxhy56S4WsuD4WTjmJEKDPT7AnCVPVIYv5nXY5ick3uYEcBPo4w0Bbxzrzc4v3
	ISmEE4WPnC35KQ/nZW8DKuqxBJhmrdxf9U0UVWYh2YvKzl1pINxRBFW1JS2X8BZ1pijWg3KN3s4
	hFiWt3C2pTATGFt9DjS4pj3FdmcX4g7+CqayM9W2W/xP/KRUw5bWP2VTWkXETUqqUHbO7kEiDTv
	LBXsu9jbn+5VCZxCxtdUQ3s0L8NYi+dX7eQZpw+EgE/LK+CVdvQA28qKZzXcvZZCrbe1U/SpmCn
	Mokp5e559k4AUuejy8VeWRESaDVEwQusQgXBQ5YkcRfYSOtCishu/4uVP+0g3Ge1pu0cVZEOQcI
	QKx1eVf5a+PglZTzgOymAFMbawab5lssg850g7y8AYwVLIMhrtzIxdKxl03cmm/lxlJgocX/Q==
X-Received: by 2002:a05:600c:4685:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49cf7f32214mr415062205e9.0.1789054689877;
        Thu, 10 Sep 2026 08:38:09 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:38:00 +0200
Subject: [PATCH 4/6] arm64: dts: freescale: imx8m{m,p}-verdin: Add camera
 connector nexus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-4-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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
index ac450fc6cbfb..5c72b279d506 100644
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

