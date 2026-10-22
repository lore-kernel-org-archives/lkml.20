Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679493;
	b=Fgt6lWaTMOVQ6nwO4hgs9vunzUrr8bWtD5Di5SFBkiCKcHFt7hvH7h8Uq6XZKcMvlv+b
	 BID/UrkUkOuIndDj4155NEiH0aZ1+061+xEzEOmk1U0zYJJnKHD0xIUUvtqZ1DzECJR1j
	 mP4UpO9ArV77FoESl4MVMrWl6HGOs4jaRfVuUCmcWdnCGNDtUUHBsRL5ywtawNTSyutsQ
	 EykdM2dExQWKMYJ9jxnrc9/VlHPaOlGF57uMRic1NZL8wEyOb+MjdLAroOt1yFGsHYgC4
	 3FGZ+aCpsOqW+SPrIXWZPOhro7sWUWt3sAL1NOdiM2+sOzBVWyZOPGh8RmSSIG+IfHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BCyMFzGkZTUeeg+gfaW4ejgXMtcsKjsZDaaqWxXwkfU=;
	b=h3AsJUlUMAlk5jKANHPbaPx/X+YSciSt91HcuTHigj66ckg6LwTRaBAMKseBWWGmpzmJ
	 W0xPGPpcPnVHEOPTUE278mSHKliw/3K63p2t5tlh05m4dLE8sDVsXc+AKbCEApKRji8iW
	 QARaXh2MQDE274hqmGQqbYUU3J0lc8uRV26JL0x1PSzXfW+31/KjulP4VDnNh9rHuIyW1
	 pqcnrxyJDw/H3zr54MTLfweK8dzu3ZjVl5qeJ33U5TPRWtS5kZcO/dDIonqkQgoSTZgwj
	 bCRQSIGaMSOifSsBM6CkVG0QsZhEuI1ti+h+J1o5dhjN2dinBFeyVmgd07ekXp+fF4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nZrhHPen;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1481560A2603
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1481560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nZrhHPen
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20803a757so3963285e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679491; x=1793284291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCyMFzGkZTUeeg+gfaW4ejgXMtcsKjsZDaaqWxXwkfU=;
        b=nZrhHPenvf3Lo6lRa0AgU1tpYHjPcYkMXwn8ta85adnvaAxjeM1uQd0Pd9JFo8j//R
         xtOFp0A3PzWdvMJwFpmmiUFHeKSSUhSwb80tUTzMkzsOt9r1b/AgG8teBJFDgka9U/0K
         DJGpbhCjZgFFBqDiKdsTvW1nV0SxoWtpIrGJfQlbA1ox6eLfa8FYmGDPVCLK/A8ZPRX+
         GemYVyz0n+Aa783Xc8YCFOC21f6oGY0bNYvhi01kGonbHp8ox+cQzsrdP6EhW1dHCVJB
         fFTw/kb7PpzacEirsIWp3CZsw+TWB6OfXcBYav2Vb/uILRQBhf9a/QV3eMOdhscb7Aaq
         Jcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679491; x=1793284291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCyMFzGkZTUeeg+gfaW4ejgXMtcsKjsZDaaqWxXwkfU=;
        b=tL6CtoTKnXkxRoC12xuztTFRhsYwaPIFpCbCRxBDUpXqRadqqwisyD1DgcAxVkhelp
         vYsC26qd7MJqfuiYUeChgQK/Pw84hXAX8rVJnLatnLg1LlYJAaFeJc9xcbedtIa5/Gf0
         HPXoGhpZHOhqV8E09Kop3culpXglYIx9lQEQa5RRXn9sYwXh2UbZ6dL6gYhz4WX0rjmI
         tY5+eyPyC1Le/4og8wsePyzRF9jUCoLU4prsyh5S0XvOBO/mJk1scCiHdJ8qOHDIprBf
         0//WDy8Bu9Yem28sqkzaluxy/tExle04LCalFO92Cs+tdVb1+apD69n1TRZw1nfffHEn
         45RA==
X-Forwarded-Encrypted: i=1; AKwUvBxb+sb0dvqR7Raq32YqbGXuxEjSHbG/M6p/Bh3OJy3hmhZJ+B7Gm6cptKNM81KTaZk+rMdEZ9vIjFnysoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIceIC/RWatBQw+VyTpNXhCIe55qTyAgDNLMvX6sPcZDX2tcMOa
	V/BsbmHhR813nQGmSMWWX43DFM+DOwxGxvaSFGUXykUAW6iAHSLKOt8f
X-Gm-Gg: AYBFou1F8vLAXD1EyLyH7MgIJdomoOPC9UJzgESDu1A1sb8HcjPVAzZnYOZZXwFZJJl
	egTkWjHqm7TujTI1Tmn2sD8V75wmtnHG2D5Up1yy/hzDyWGDI94tSnZBzP8/61+ntHh8emM/nBR
	kDjlguCH5ouWIgqvkqPUjOVe0dmo45InAVhhAbPVGscGaAjkd9DZJbxzVLFFsmyk35TG20eNYcV
	K/1ZcgKXfGsEkMH7Il5vCOXfNvz9ysG4ZB8k1cho8/0GQmgXphiW0852lwdiD7tyqH+pX8RaXUh
	ybAj91ckkh8bDLioewBZ65MUyPMQNETjg8bllxHYNBwG70MWZK3xENKW7wYjee1JnRgnhTZUnb8
	Y/x0Jpfmlq3CEEEz9LZjqJp/cmgKNXW89Ixp76nKP6xoNtaePbmAdkAE2Tz1l5fb8u8C9VslgKg
	OylOSZD/huStz6TnQXRYL/b65QuauRA+AKKuQ8Lmp3ksNLKtVV654zOBR8rE91NLKTFh2GKF1XT
	3bClQSVWUPZ85IHspyJ5B91OhTFQ+wnsoIQB3uhXxY/zpNIjn/p0AKq0158MgAd5a7wWOlQxJJU
	H6UyymTozo+pkjYgM9MOgo1J1CvUrhEsf73oFy4cIpeSByJuMvj10j+KulPNTPsQ4nnHMbsO6Do
	k
X-Received: by 2002:a05:600c:34c4:b0:4a2:1a:a10a with SMTP id 5b1f17b1804b1-4a2001aa275mr103308895e9.29.1792679491166;
        Thu, 22 Oct 2026 07:31:31 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:30 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:31:27 +0200
Subject: [PATCH v3 3/4] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 shared OV5640 overlays
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-3-90a30b0b0d55@toradex.com>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
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

The current and legacy Toradex OV5640 camera modules use the same connector
on Verdin iMX8M Mini and Verdin iMX8M Plus. Keeping SoC and carrier GPIO
references in the overlays would require a separate camera description for
every combination.

Use the connector nexus and stable CSI_1 media labels to describe the
camera once. Keep separate variants only for the current 27 MHz and legacy
24 MHz camera oscillators.

Build both DTBOs for installation and compose each with the two Verdin
Development Board DTBs to validate the module integrations.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 11 +++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 4 files changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..5ce923d87072 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -120,6 +120,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8m-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8m-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
 imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
@@ -275,6 +277,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
@@ -296,6 +300,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
+imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
@@ -737,12 +743,17 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
+imx8mp-verdin-wifi-dev-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..af77c065c3c2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8m-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..39204a14f0d0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin CSI_1.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_ov5640_osc: ov5640-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	reg_ov5640: regulator-camera {
+		compatible = "regulator-fixed";
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		gpios = <&verdin_camera_connector 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&verdin_csi_capture {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&verdin_csi_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+		clocks = <&clk_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_ov5640>;
+		DOVDD-supply = <&reg_ov5640>;
+		DVDD-supply = <&reg_ov5640>;
+		/* CAM_1_CON_PWRDWN, pin 22 */
+		powerdown-gpios = <&verdin_camera_connector 1 GPIO_ACTIVE_HIGH>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&verdin_camera_connector 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_verdin_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&verdin_csi_rx_in>;
+			};
+		};
+	};
+};
+
+&verdin_csi_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			verdin_csi_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_to_verdin_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso
new file mode 100644
index 000000000000..332811f53743
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8m-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <27000000>;
+};

-- 
2.43.0

