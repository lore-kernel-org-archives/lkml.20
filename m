Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584706;
	b=F7kUltaiXEQxQUetfwDa0+aGxdJaQcsoDeAt7LgLhjc0Z7OLg1CCgMxDuVAMAbrOCgb7
	 UYs/bLU7GkWc4qGSVbgzsr+mVFakg2/lUdLbUPlboJ6FQRZqk13ffMaNaRgA6I1u03kRG
	 6tLRwhEtzB4Ezr311XGELo/rZ8BW6NNPps2AiKAu0/FiN5l/Qy08PKmqxmZ+Q2Dm6IDnk
	 t6W48kZ/85Vgga6PZHnVNqGDC0lbqKRS1xws00IYjyEFNr3DLlFuc2ieUBW/U9zrFT0cl
	 qd7topUZM8OHupS3UZNMCAibjRIk5yQxC8acZNceMqkYENkXlYNHogVafXzP7VGs49Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=;
	b=HcfBeu34CYuwmj/tClmMq0CMHPmH38EGwou4V/KtBZFo4sd9HcuZHgS+kpjy6y4TvfZw
	 FRMtZlyup93oPIRAIg2KTPvfLYZ7QpwTgwC+oLt4LXc96m5cXVYlHfu8d7jiNH5hvk7o7
	 jT6bmFDV3DHgbq2XgxzlCz9tEIP1CqDXEoihogi3bP4qPYIAtA/6F+AnHDPfuCfUttIeJ
	 9jz9TzbgdMm/5IkHWbpcSBkiGhvMBH9+pQGB8SPzbgQq+ot2PrbIAcX1yIxlPOrDCBfC4
	 uC8RgsXHMTsdHCaw54gZOgS5AjmLCqFb5lIivzV6XRFjHI/HDapRiitO/WAykZpNYGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXMWARFE;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE45606A8A5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE45606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXMWARFE
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b2d14968c9so13665037b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584704; x=1795189504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=;
        b=HXMWARFEgb+oAe0mg7pMHhDOeDxO4GH5Vrq9jwy0K1gmAqkkTZ+SPTah+oh7xsMiC4
         oFOBvp2+0WGoYo15Ezwiryg3ow/sq2H+mHqxo3xaiJ/CRXQ5mV2PMHkIXNDQurg9QkVf
         rp1JqGGgz6SgLzuTtuTZLdQTTYeZzG/6YTOgfCjVAXAxeRbQD7YI8lfv5D3FIfy7BwXK
         eFSfpr4wCmjXYzT/gzYzf7fTi/q7IxleV7NP0sher9IptJrDv5vA0dw5EsUHncwNR9Le
         BJteuEslHDqSugIgJzMxQUq7Jic27AgL3is3evBL2CcR1eIgtoWymeO0r+e/KDJ3npjZ
         u66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584704; x=1795189504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SL7U9XOTOx+APgRR8YLQnTh8OeScFnHHAxVLwwDeNFU=;
        b=0IJkq11TO/dkVZfFKvNoyDXnznrhVC2j9YuLJJf0MVTXbob3p8av9dO7REd615GYX6
         vx4UmKaFs73BT8XmS3HIfv41nJ7upbynufGmmQouRDNkUQjJkig8tDgtr+hAJynZuCT+
         SHnOGIGnbJ033y2twV6V+s7lCP7gkomqG0XjgpAYY0Z5m2vsI9XAI5R5PNJ2YZrDs+wX
         Z6w/z6Oi9MMcEknLg86bq2KgoCiCxOxcm4pp2zVasSLMpEAmBCmHugCSxEfIcnZwjnNt
         YH1KDLW7UuXGuN6Y8WdCAoQhehdI2NQ91Qvg3U/7YivzB2Hk/EvLoKzewSPm5unCt6Ki
         cuFQ==
X-Forwarded-Encrypted: i=1; AL+hErFcvSx+Mo02iJjrQWOdg/Gj4X3C7Ocx/sldWa8ZgCsVl1JkCLdZ/3rEcRHGv4k4KUMnWhu8+6YeAqbV2a4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c/Ejsu6p5bAou5jVV0ukthgoTpW88P7KKz8A66E+NIBUfMott
	jvIaOEPcTdg8RIDCczDiyDGciN7KjNX9pBh1AwDfiZpJOZW/KIkzSNOj
X-Gm-Gg: AYBFou0Ax63l6NT+TPlt+Ab4qykO0+0L+Q+15ZkNQlQgknRWNS0ZdK4ita6s1NVWJUn
	eIkrSSJ2uAwJl3UFVPVTfIh53fHkcvG4HxfbI/pu8EvMKOUpneNLUJomOUjr3FyaMdY47nQ3wOf
	WdklFuGwgsWxAORZMNxNlgHTq1lfcocH45O/7ROIYE/wO1jWHN+l+kuovoMsjj56Gsh5/jvuL2B
	0mTRe8526DZTDNhnIyddSp4AuIkUDR/czlQCNUYSGG1tLrISJT1MDKLWXtpVtgOZplqd2pwp+pR
	r4ii9HL+aAZfrQPYQ/AIw6f8cDrRuHu/JJn1oUF41fjZOGCGuNFyDiVgNmEfWXtXhZfpJaG9jRR
	4EB+xd30nM6FtuCBMmlJG4KzHByhO9+LreP5cVQ+vjAfGKhxBLyPc+yFuRd9ey6Kqg/f2n8igme
	DGVtI2/eIZKztvOdqvuf/FOVShevqXIaTtvdEy2nzf6YBZ9mdYhSO5WrLBU1iwCRH+eaKgD4Ppu
	n0X3/7n1Q+wTwIqugHtTY0OXsyQcL6CsTDxWpDh3d2dCwLvtuVM1mcnnJsxJnJIfhSOqJSn/jwR
	YpelKCHnKG6c0o+O6epe43TIsEv+6qns
X-Received: by 2002:a05:690c:19:b0:8b2:9c73:95aa with SMTP id 00721157ae682-8b4aa3c17dfmr16559497b3.68.1794584704381;
        Fri, 13 Nov 2026 07:45:04 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:45:04 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:10 -0300
Subject: [PATCH v2 4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS V2
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-4-59c45f0a0d8e@toradex.com>
References: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
In-Reply-To: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5946;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=aCRXq5ggGAK0uezl8OeiOliynvx2lSh59aVdl5UwyoE=;
 b=ZLl09oRDrgj0qFrvx1+g1k3SBVWb33UfmuULHRjl3TW6/lpRWdHewv41x4OqGTbG3O+o+jb/v
 B3QeEJxo6qLAi6Nk/emeF3zSufNsZ6v+lqy4RQdF9LF9FCOePBlrI0x
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS V2 connected via Verdin iMX8M Plus LCDIF on carrier boards exposing
LVDS interface (e.g., Mallow). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is provided by an
ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   5 +
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 118 +++++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 915507fe936de..51c74fbb8e0ce 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -741,6 +741,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
@@ -748,6 +749,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
@@ -763,6 +765,9 @@ imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-na
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..6b0c1a10ae2a9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Verdin iMX8M Plus
+ * LCDIF on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_3p3v>;
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
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
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
+			    <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&gpio4>;
+		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;	/* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;	/* SODIMM 44 */
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

-- 
2.43.0

