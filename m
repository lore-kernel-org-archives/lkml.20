Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8F3EDAC1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855076; cv=none; b=izIXwac0rB2tp7PRpM1upR2dbBfXZdT5dWYGl31OLvSXdHiNipeZAT1JjnUHA62HbAtbIULr618PLM7bLBUt719yXLORhn4KqhMH9uKsu0bpbtBMVyCIhkNLyRPNFIqDYUY7YFlacUOBoahe4YJEIaIN6ATHgqRzo89GAsdH8sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855076; c=relaxed/simple;
	bh=NcGqYo1OnwdYAKNH7EPXqJzl68E/NOHlN8Xd5sliOkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNiIuSSuhD0EmN+yEJpzS2mNWuH/j8ObrKbwBI9ZGyNb36MFTkLjVzlOCNW8gbFG1d8dWE3VPlqb9FoVglT8MpL2xOiQGyt6iH84bEADy9h9/yTQxp0ddZjBzSzPIJG/PAxZRiuaRQ+JYlHW15LC4U50ZGSxV/t1lb96CcSNaMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkjwfUDY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkjwfUDY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so24306255e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855061; x=1791459861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Hv7iEv8847rRd+Yspj++pyIEYShjXqQiTuC8kxfzTw=;
        b=VkjwfUDY4mviEFa1/6tqM1VPIlNQ0+9DUq1TGZ16R0w2z2EMEyi2tueDzZA6O9Chft
         zJSqMTTw+xz6uS0Hiz/mawYJ9pzjDR6HNHKxJbjbuXB57b0O4rxz2kk5J6t3m0Uhgkjj
         nd7XTcjJ3tDKPWN1U9/TzEat6sak0g3NgH78FDtpyqtykQdqUo+ElxtYSV8rFdGVZydx
         WVfkEDfr0qafkmzWMI5HRda3uAs+J5k+3kVQIBvCG1KuYANCHBbaOTrt1SYVbCWqyEY8
         VlS0JKx1VuDljiBrH0FPowfuBJLdI5vK3bn/TcVpTFhCgFiMd8E4nhu15u+E7PDXetd4
         MJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855061; x=1791459861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Hv7iEv8847rRd+Yspj++pyIEYShjXqQiTuC8kxfzTw=;
        b=IcOAhLqjAlKKFkdRx4yhoF3jV3saHzXnjZE3XJt3EAHAA8scThwGT5r1HZIL9QVxyy
         7c8gyXQKUyJlI4jdjnK8Z5m6MGWwg8ZUbXqqSNeq9wVwaNhn6FYnSuvZrKeqDVZBcL/Q
         leh7ZEArFcrdteSaEZAHWTB7lGmaF3U0e3RyANcwKllO3ef+AqKls5YSCUL+72cptnbc
         n9dy/l4C8fIo7G2JWN/FDaQnomNlQ2P3Bo0LK/ciIRp2wVa7T2WeauHSU10xx97xJHCk
         eRHj72PoPvlujCbSWyU7sMiragOzVorZj149yUOZLd6pX5SMKPYpahnJgml8q+pHWySO
         wYyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSbQA0NxjcH0FqeVnxAF/86mASeu/NtU79atfJS8dmxY/8HOKarPvgjBxGCB4bhrXJfH3A1GqoRvzFg8k=@vger.kernel.org
X-Gm-Message-State: AFuF++lEf1X57CNQbOLtp/kxUGAlDpTFlQpzOMTDuJGoXjDcGiZKjXKb
	KbYPvocBKzfq24gVP0QxZWnzdN23yiVL965sRkj1I0eTZyoO6r7Irhtl
X-Gm-Gg: AYBFou0FEWj7xA8HDq4CMhBx+QXfH91YzxWcOfQ3PfCtSUPBG5bRaI4z8lkj5QjlnRg
	5ZVRool0lkb2ewvgLPyw/34XHK2/6UW/URV+nZtt7olA6Gpbc52i3fqAf3ntf9g894SkTX75Hci
	cz/AthlFdLaQxDr03WjiyGRbdzIZ3YjJVco6JN07QMzRh3W0JdQDkMl5upYwriKVAKc+VJ/uyVv
	R5hUcCmKeoVrkXs5PmSYNiXSTqM4u89E+5A0AaLFgIaT0q5GOCuOhG8pJO6PyCM1fZHpW7Gp3q0
	h4VikeYbtAioH1i1eXjaiCrLW+01rrwLrbK/dyNGjgwqZABxfwyOUSHvQDyQ6Rik8KzKs+VUN1e
	fFVkLS+Ui1ehO32EXYnUqOnP43FmU8Km/y8EAUJ2q3tiKquVQWMmmuccZdgvjxgdrZ/n5Tm6Lg9
	5asQffHN14YIgZgO8pRX2zsFyVqDFRFiWKaV6bJe2nMyeY0E4Xc7f3bcKYPyNSZKnjLW0tm02HL
	Riv1TbvceOq/ifmWEKPW5+9WFatoLGCx5LwH/8sZBu8b77kDUgvcxQs4VVWoxf4CFX1Nn8GyA==
X-Received: by 2002:a05:600d:6414:10b0:4a0:1b14:ce81 with SMTP id 5b1f17b1804b1-4a01b14cf1dmr54994265e9.3.1790855060652;
        Thu, 01 Oct 2026 04:44:20 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:20 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:14 +0200
Subject: [PATCH v2 6/6] arm64: dts: freescale: imx8mp-verdin: Add mezzanine
 OV5640 overlays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-6-7d1343ecd3ec@toradex.com>
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
index d2422f1d692a..3d2cbdac22bb 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,6 +738,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
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
@@ -756,6 +760,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
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
@@ -777,6 +786,16 @@ imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8
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

