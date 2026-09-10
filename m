Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B64AB1CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054699; cv=none; b=qOgHko6whHcTOoL9tl5C0i6o2X5JNBy6zfrM2D/ucWiJ6HV+9DCIlGdWdwggBcRYdYY8J5f5lv4aLqlUTWlZi5qbRkrizKCVDDl2uceBUgPTpLd2e750Qbh0JflVr0FulbrOD5zf80AlLpJYM44x2p2XLhpeBoUCjBEpbyDoH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054699; c=relaxed/simple;
	bh=ysSjDibRjO2oI1uCODoaVvwGrAqJg2RP+x0qrJLzDPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfwShHKXvEUqzz3RHFBP+j/Sy4w+5Kr83ZAninKH1WP8w4DcEbuKl+saKhAjsnjABqlc2BwIK45Ww4Wa59r2EOQrl7dgvb2XliYWnpF13Sb8WH7xS1Hc4a+G5EaDdAIlLQl8mVCFyBdkj+WKuH+dVeszsOrMZEHSGFtJdIQCaPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI3MCtyW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI3MCtyW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so21490835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054693; x=1789659493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8B/tP0CTjVes5Gi9EiEiXMc6ToyqS4obd7jDFuSMeg=;
        b=GI3MCtyWb4PuJyPsx4X426FUyL0NBjWToCOLRzYhw6oUv7MHvuZEvwB5QEXYHx0gB/
         akmoRq9bG3nRXFtcKH+9Or+tQD4sgbmt9oyQO1y/YPVBoe/4Ut+ch+Y8NcoYLRCb2TBk
         bWwpf60WD23Abpy+49csWYIOfWpEYd2qOqszcAn6m/XkYpTqNFx1ME89/OpzAsZ2Hgw3
         D8pItUAeD1vsZo6pfqd+Nxfrha/LSO6VN0VVlyVkphyEbXLaTZekEiQiq5ZYyZ28MUWa
         Z2IezyXlBryU/RrrbKYPxMkNbJoiFdMsiX6XKyxYUURODwSoLSZtiCeeoM7wx6aUbraX
         u7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054693; x=1789659493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8B/tP0CTjVes5Gi9EiEiXMc6ToyqS4obd7jDFuSMeg=;
        b=PsT6SnhY2OBNC9uTcmd9rBIMkbk2ScaiCjJ9eF7NK2sq7ufzlYnQzpd4g2xpJNlY+U
         gH4TA3KuxdNsBHLnOKt654/JR5lBx/MRARPrS8k6U+AUlC2XRpLwfFyI+TzEoWZK/G4M
         VzxmZwqZdNo5EbvavF5ife5W53kuONZoBMKPXRaT+z+gxr7mcbjciRJXsYQS4P0eK4Ks
         TMbFvk7DXLum6rwGcysrpHVpqXJr/eDS6VFfPam1UBQXi1aWzCztrBKYinQwZys7tUS7
         aVZQCJprl5KXcJP+GLcsjbD07l+ktcuk3FZ42gdSU51sIgOfYYD6BBwgX78qeCIQXNFm
         AOmg==
X-Forwarded-Encrypted: i=1; AKwUvByb0wa15CpCWykfzRSoDUNpYsKGkICRzx1y9hQkjZYEg656LQ3KGrQQlVPycvpSnjLuniOegkEOlR8NjVw=@vger.kernel.org
X-Gm-Message-State: AFuF++lianAiUad9jN7WRdWR6bqXRsgPvwBEwoOrsTtB0FFeJ52KTIDe
	d72JQWiejId+527IA6E7oC/ts7lEwfs793JMFpHW7d3tKlyXNA0NGde4
X-Gm-Gg: AYBFou3kEEiz32gpM5+AtVe/+qLH2Nd1JiKY+SjOjhPWWtTLSjzMeGyRkuOoYXGrpja
	eb4p0dF9r2+5hfdz7afI/u++w33LyxBe0DbAiv5lMocFAmPdh8HFcHYUJVSnJ04qH62y6YE79Wk
	C+Hu4thnMOT6vMvXllf17bXSp8l4nWIarnf8vOYwGsRUs8MwNBI303QBcNkE60J0CY4jruQMl1O
	j8IjRJX4YuoGOxqi85LwPqAiJL39kQNkGmulAIwPU09mhF8FWiyAg0wfIIEid1/WKF7z/8pkq5f
	h0gI7u8YcZbf1L7J8GJDipl0YzIAUM7Pu/ux0yljBnx6GQkrZapoi4FfOL55AJRbLVKDrsHGF77
	F84R/t0lJBs97XC3Szm4tNWx3uALqBeOxjzrIYpGbI34oMdNqzDfJHLaSkwPXbRTtPUiYR7EGQD
	jrYBOM5AtaEtidsyohjkWNn05O2gd0sqyGnSAvtBd1dpLdMl2GwULX+hbrbhwTy3pB+BDdrdCs9
	oMnOSq6wvhFNQC4mm2FDP/uzTNgUUzySZjcon/fxjhvaFy/IkYfKuxbdaqdOfyYFrOijYwHXQ==
X-Received: by 2002:a05:600c:4fcb:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49d26db4274mr57671805e9.9.1789054692973;
        Thu, 10 Sep 2026 08:38:12 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:12 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:38:02 +0200
Subject: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add mezzanine
 OV5640 overlays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-6-3c9349ecdb9f@toradex.com>
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

The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
on this interface.

The mezzanine can route the camera control signals through two jumper
configurations. Describe each configuration as a GPIO nexus mapping so the
camera description remains independent of the physical routing.

The default positions share the native CSI_1 GPIOs and are intended for a
single camera. The alternate positions permit simultaneous native and
mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.

The current camera set uses a 27 MHz on-board oscillator. The legacy camera
module uses 24 MHz, so provide variants for both.

Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
 6 files changed, 214 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 06d41b9faa79..8dcb5d9fc74f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -736,6 +736,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
@@ -754,6 +758,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dual-ov5640.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-alt-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-default-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-alt-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-default-jumpers.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640-24mhz.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640.dtb
@@ -775,6 +784,16 @@ imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8
 imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-wifi-dev-dual-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo \
+	imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-alt-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-default-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-alt-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-default-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
 imx8mp-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
 imx8mp-verdin-wifi-dev-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso
new file mode 100644
index 000000000000..9579ad2f2235
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on the Verdin iMX8M Plus Mezzanine with
+ * alternate GPIO jumper positions.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso"
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso
new file mode 100644
index 000000000000..2079f9ead22d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on the Verdin iMX8M Plus Mezzanine.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso"
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso
new file mode 100644
index 000000000000..9f2372227a8d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on the Verdin iMX8M Plus Mezzanine with
+ * alternate GPIO jumper positions.
+ * These positions support two cameras but share Verdin GPIO_2 with the Atmel
+ * MXT touchscreen.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640.dtsi"
+
+&{/} {
+	verdin_mezz_camera_connector: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CSI_2_GPIO_0_RST (pin 11) - JP5 1-2 - Verdin GPIO_1
+		 * CSI_2_GPIO_1     (pin 22) - JP6 1-2 - Verdin GPIO_2
+		 * CSI_2_GPIO_3     (pin 24) - JP8 1-2 - Verdin GPIO_4
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 6 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+};
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso
new file mode 100644
index 000000000000..801beb8f48a6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on the Verdin iMX8M Plus Mezzanine.
+ * The default jumper positions share GPIOs with the Verdin CSI_1 interface
+ * and do not support using both camera connectors at the same time.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640.dtsi"
+
+&{/} {
+	verdin_mezz_camera_connector: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CSI_2_GPIO_0_RST (pin 11) - JP5 2-3 - Verdin GPIO_5_CSI
+		 * CSI_2_GPIO_1     (pin 22) - JP6 2-3 - Verdin GPIO_6_CSI
+		 * CSI_2_GPIO_3     (pin 24) - JP8 2-3 - Verdin GPIO_8_CSI
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+};
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <27000000>;
+};
+
+&ov5640_mezz {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi
new file mode 100644
index 000000000000..3902ba62fb91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on the Verdin
+ * iMX8M Plus Mezzanine.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "toradex,verdin-imx8mp";
+};
+
+&{/} {
+	clk_ov5640_mezz_osc: ov5640-mezzanine-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	reg_verdin_mezz_csi: regulator-mezzanine-csi {
+		compatible = "regulator-fixed";
+		gpios = <&verdin_mezz_camera_connector 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI_MEZZ";
+		startup-delay-us = <5000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI (Mezzanine JP3 and JP4 in position 2-3) */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	ov5640_mezz: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_ov5640_mezz_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_verdin_mezz_csi>;
+		DOVDD-supply = <&reg_verdin_mezz_csi>;
+		DVDD-supply = <&reg_verdin_mezz_csi>;
+		powerdown-gpios = <&verdin_mezz_camera_connector 1 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&verdin_mezz_camera_connector 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_mezz_to_mipi_csi_1: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi_1_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi_1_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mezz_to_mipi_csi_1>;
+			};
+		};
+	};
+};

-- 
2.43.0

