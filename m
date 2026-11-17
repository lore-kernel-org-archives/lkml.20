Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919501;
	b=i3j1iCUuEClRp7rdoUBhml0HZ7VeuNbMRzVx0mWy9rAXSmP6sto7K0RQ1/QMDkAe1UQz
	 Khqcwsxk+HJLNTw3T7UESwnQ0LuTPChgB/wNPSzCunIUjC9nB+/WiBrL3Pn6WN7n2sPOc
	 YaXCxt7qMtfsn561z+uHFBPO7t2VaSvB5atxHCuQMhrLBgCA30PzQhruG7F2m4DnSeE+G
	 P4qmE3nqx2qCer5l+R3BQYXefJk52aZwFag39Z4XGnvy75bDvK76eo6ndqTDzgchkl7gh
	 KAzBgQjMzbMdf04PYBAmakD8V/XGgmp/4tC7s80mZWe99wNe+ssHhl8AzKuXvvH8Daw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U3eIe+zxkNhC3x1FOaH9hTSZUT+PYfO56KR+OgT0gCM=;
	b=chqKgoYhu6GPVCW08bc9h54qmqyzsic9BXypxHweHfIAB17jJ72E0Cmy7Ju7fv39DePb
	 maTnVXgX3skdqEbatdvR6hl2IKCEaNwzWFu6YUbyHu38q/qnQEaLxtTOW5u/zVn5ncqdW
	 9jixlmoRgBsQKpk/7PoJOOnWs+olCUEb5aYWpcd85DchcXIQRLpprMjtSgvIoNQ0a4psg
	 /yR2Ekguc++Tq4fEdzglbg9BBpYO/Qz3swnSvj5PO/AE4xF9tjYxH+Ahm4sKBiZBagBuA
	 lvcOObAMp2HsUlY8A7Rx9BK3bHNhU7w4U2eUJEiXS96GJb8tuarSWRXLbZuXH2oEt/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVyKmmA9;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C9606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE2C9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVyKmmA9
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso3065975a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919499; x=1795524299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U3eIe+zxkNhC3x1FOaH9hTSZUT+PYfO56KR+OgT0gCM=;
        b=fVyKmmA9pEiKvZ14sEq2SvMoWrRIUvuCFQD21JG6KUvGhsrLnWfVtlC12Y2/tO/GMM
         IHbn93ELU2zhrj9H9Pey92WuvkwvcGZ5Ayjmum5hKJuBEC7CuOHENnjpIG+xmywxGEWA
         atnGLb9ziTiT9lzmnEdcMkUHqolDcagRl3cLpSqxwjsP+Nj2qi8lgcXaghy1BlxMbQL5
         VsRHJUTVdHR4taEAVr+SJGU7/QTJG6pfVam7UA8/GM5wgdsAB8dfu2jos5+DezeUA6ZE
         OH4PJsG2Vhc7mdDTtWh40t30mNiUMv8ou6dFtA0krwA8F/x9DyaxZAkA5OtR8jLq4D6j
         l8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919499; x=1795524299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3eIe+zxkNhC3x1FOaH9hTSZUT+PYfO56KR+OgT0gCM=;
        b=2W/JV948B7Xn4vNV+r5n+ET6+dSfHdefG7d09wDYV2kT+IojhsToiohm3N7eNg1HP6
         FlOD4U81SOLAo2BRjUeP7Ptkc3vzxMcsf2ne1ZKH92m1V2/81FYAbnhQ5wEt1vSkxoU5
         Sa6mtQOM6/2CAnB3+KepfQrnsv98aEn+IE4BSbBehpY0nQFi2IjFoQeQ26bsMM0XTIOu
         LaT8+loT3nI6lw48AKQ/hPugWO7T0h0TqduRCUKnMHgSu8CAyWXISauoKDdAiTeqMpng
         V3JJe7MnflY0AokOcAvNPaxDucZtO7KXxwGHiXbnofGi9hrMWyBLiKWq7B/cPAU/uqA5
         sKFw==
X-Forwarded-Encrypted: i=1; AL+hErE+aq0x3PkiaTkIuSZUpth5Va88OE2rY7SoRfQzgqG6Kalr9o1NIpGeSFxYKVD/ARjGIV9HOppQoh1w52U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MUa1Gt6bupcAyG80mlNvCCmdn89TcQEqtFI+05tMt2VbSkasg
	MKDp4dDh6UXzCvriPDz6ImgAkyA8dyDtqKIJ4SVw1VrIoIT+zNGYPc1d
X-Gm-Gg: AZFdTZdPpOhJ8wEu0VcCpQR3XKXpA22K6Bn5GxNHxLwgs34INbY+pKlH+4u93yszeIp
	2WiPX8tRY7N4cwkVAYoqrBY6cgnydzzYnlTiKf7YU/O8MK3jsyFDoJ/m99z8SDYMXbCEApvmNmO
	TwwAHk0wJsHXC4iEsU0sf5H9oDGXS8a3b4TCKiLDc7YbhjpsMPbZwBfgwjuuwWtJf9RslqKIyab
	p3S6wclNOOunl/EBBnN0ARpwAuSUzS+Y/+AZCvZd4MdYZyAnO9w7lqs9hQTC2tCdJV+CtYurK49
	CRDCFccEM2huYtWTuTJB58rvrplC1Mo2b6SCW4dIZgtxTmibfheRH8QxDO9GT+K02QHIDw6EAbf
	yJDwWovGXelSzQT3RYcV0Fk5yNAqHoFkzOG0J3+lH8wgGwlxAYNiZ1yEQjyGBTykylPXBiRFKe6
	wvwZttEZNPvy5LosGLKEDvlgTQuSLG8f4JJukiWjEXYl/UG3/nzE0dyoXvwpLXqFwX/xqAWaQ/h
	LhW3PxMr5Opn3mTXbILim34sE7AOvIZPe6WzYqA8eFRPHd48KU4zld+fMUdHNR2Q4EnFIRuVtxm
	gMTGmlA7YdDBZSwrloVdwULamlFw097q5Ys=
X-Received: by 2002:a17:90b:1f81:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b1b0d753ebmr13700852a91.59.1794919499020;
        Tue, 17 Nov 2026 04:44:59 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85f1dsm14585725ad.59.2026.11.17.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:44:57 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Tue, 17 Nov 2026 09:44:14 -0300
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 DSI to LVDS adapter with the 10.1" V2 display
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
Message-Id: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-2-ecfd237cf7ee@toradex.com>
References: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
In-Reply-To: <20261117-v2-imx8mm-verdin-add-lvds-v2-v2-0-ecfd237cf7ee@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919484; l=6885;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oileKM9NWf3LIxFH+bWjLKnDxeS3R++Bhw1jN8xh1DM=;
 b=W/3ZI6a1L4XOu9EJvQ1kh8Owh9i7WoY6j7p0X/zutKQwN3WSrNF0zCI/TbL7gKsMHvav/4k4k
 bYSyoV5LW7sAo6et2IxZ3Jz/tAIfsNaq/C6eifAqgw3zr+DzFxuWYjs
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
touch controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 134 +++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0bbc4b6a6b537..b5d4afac550b6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -258,6 +258,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
@@ -275,6 +276,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-d
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
@@ -296,6 +298,8 @@ imx8mm-verdin-wifi-dahlia-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-w
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-tdx-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-tdx-panel-cap-touch-7inch-dsi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
new file mode 100644
index 0000000000000..6b0c989dbc75a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1" V2 Used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_dsi_1_bkl_en>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT (SODIMM 46) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_dsi_lvds>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <70000000>;
+			hactive = <1280>;
+			hback-porch = <55>;
+			hfront-porch = <55>;
+			hsync-len = <45>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>, <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio3>;
+		interrupts = <15 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0

