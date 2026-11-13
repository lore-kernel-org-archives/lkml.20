Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585152;
	b=Seknj3/2oPL26xzAgzJRwxVDjefD7eJfDIK0Qv1o1gCFI92Ea3CkiRQNX5VYBacMPb9D
	 hi1R9sn6gyuHMKVWe+EWcYo8GxBprUrTzlT2EWPkGr9k8JNrxDLTPMFOoNbEdxB7K7UkZ
	 ObULDe/dthvmjQ2sJWcAGwjLc6WqY2C7DGBj9Ds+z3SY2u1doFyIwkz+1i9UcNly5vjjA
	 eVHfOhOM1lu7JTPRLRsbfa7b/xTflY3p1ZedH9mFbrf4ovSAP4ymt3AwdjQYipReXxFtV
	 MCjbSGqqtJqgSEKnk1H3goq4PWed/4gFUi9crHdixMamyKZKCcX3wnUm1QvBbX5BE3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=;
	b=ObKzc2PYoyrfB8ZkIP8/mH6jRBrb5cI/VPQDnVx7JDdesuflcvJwHtMRKrli0Vlev/ew
	 sWknNNeavhEjTkysPABtyYgFLfztxh8jkxs935VZOJRHtcXvDGAB0ZZP50DD1zJh4wv0V
	 Lch/Khurmn5F9bin0DmY5n+PIy2pXBgrvSjzCubz/DA5d8ywtOUwIMJBsk6y6odthq3Pg
	 85MKNTTEuNk6zubii56Iv+1IO4iWjtlFy35A4Do+0Rok2Zwejdfcsz9qKdJ7YHNTet4rT
	 lg6H3bJVDgkzQAUPyF3DldY7OTMw47/WjZs9yRyau3htZDme2NPUZ61WNMx9osZ/tdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wC8JvY7X;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358AB606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358AB606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wC8JvY7X
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso285747241.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585151; x=1795189951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=;
        b=wC8JvY7XWlFCtylruT2OQGv3maIhkzJlnmYvK1HsDz9mJcwvsH29+5TEaO5uAzaVSu
         GcqiqlpPwi4maM7XPp78l4zdw2f3Errl0GqbDQ0W5c+7xcBBT72sWVOcJpNKw/ZZNezN
         Y+EJUisjWcv6KCcScD9SKb102YfKhk1IXl62/8Pibz5WOlzGKEpY0rb+128yzq3RkGvd
         qdXtWdzQIJ2QlT/o4rqAhWB4F+X49ahdWVgV5fQo1yB8oKxEdB7P6+VNfCeAYu0vgZzb
         HsR2WAKBTtN1ZBqsddOhx28mmtcy+CA1VYrvj7I1JOCuqGhsu/jk4zOFy32ltEC4FAM4
         8VAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585151; x=1795189951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HS8PPeqYM/99TwtIsC0HfLuufEZcQH3nS14cV+C4Nnw=;
        b=eJafeOmPn4Vv1gsiUm+xtgf/Talh6qvX2dPtEn2AYvYHbAj/m6N4inCRddFxGI+BNE
         zHHBbhAXZFQWsCWoLzWG1/te7jSBEiZFEDiZp4ZYZQx742tmZlBD/AyD79blkM8cIZL7
         9zOWDobU/ljdvLk9xcWIQxn9023E9SCnTAFZsgYuATIXZ5RW4dL1tAcpx4J+ERB+HLuM
         Aw0zoxWAWkkcZEcumFTEII2OYOqFXk6k+xqBgAu4JTGOvBg3OPzb6GxgIOjBkl5ccFYB
         7aMwcYKKmXLSwHFm/PhJEaGdF5qU56znHQydEsErRC48Zysf53qHgCyVnDnMyaXdQ2t3
         8iBw==
X-Forwarded-Encrypted: i=1; AL+hErHo4fYD4jjUGazUOgRPM5PDgzLiJu+id46ZOTrjAQ4QHzyqTuS9uHPWjrat42Bmnt8wVKncJ1HabzJhhq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ti1J6W5Dk2bp8v+IcWa+KjNkuW8bz2HhWjLFVbmPK4uMKJtyI
	1TDykV81AF0ecbtR85MfGP4fbAVbifibIjs7phB6tihbrSRObIGscsXQ
X-Gm-Gg: AYBFou2C1ABYcwbNXhJ5qSZ/ONS/Cgh6cKvFdZrJv0DYRC0Bp21nCtWwwG40Pt1FYY2
	ou8biA3buSGS/uxCZWdqfHpvGF0DFqSXI0ZlA/BMeUw2q30hCCpClWkGEzm+KXkG5sWnt6lEK3Z
	9RS1BaReoIG7vy36BdLJAJ5DxPIv29P+4QFJEeMEH6AwFtS5Wabnr/7qyvjj4bzL3DlIl15wG9l
	Qwr43KpbcUoE+Jt1k/564WX7hU/JRMw5IN7RZ0QLZN4r8XGsR3EAvImdUKPewk0yp3We/Fwr2qp
	PVanqDscxPddcAcPWQIeely6ZRVTMTB3Z/HzCLOBunL6jH/NZGU51QkQdcE69wfYOgoHOB0Gavr
	igZsaobMvRm/wGuaduwE4y8tLXr7mfoVI+UWrIiGx4anwjtKnH68+HPIUneEpIbH0WspK3dwrRL
	n9UUNoMgmLoAisGIDP6r75hHiCEW66XNU0G9YXYofO/kNDlSyWZ8ggUcI92D5bZEq3mqgGHTRTk
	tE1txCgowTQ6qGR6pn79UNf9y7UWlxSZ2YK0iWLCr1XuOpv/saDIUjkIygOMV9Nv2xx19TRYval
	0NMg4YG24vkVL05Qts/yBR+7jcUU1jrh7FwbJH/uhHW0Guo0FV0Fjw==
X-Received: by 2002:a05:6102:2c85:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d64d80d3b9mr811140137.24.1794585150917;
        Fri, 13 Nov 2026 07:52:30 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:30 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:16 -0300
Subject: [PATCH v2 5/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" LVDS V2
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-5-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5590;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=OZsqf/Mxkw+YXhvycv2OCRQ35UFpHe7rjP/Hh/ssQlk=;
 b=uF1NmeAHqkz7VMUSPPnJDBCC2AGpB/Cuqety/UIZlEyshp4f8Y6cdLZA/+OfFpPLwTSiwWptq
 z1EuJaxRsYKBS2WIYr9/7fjK+EIU41XZgjD201AKOx0GGjyaHCAn6mE
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
V2 on the Toradex SMARC Development Board LVDS0 interface. The panel is
an Opto Logic SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is
provided by an ILITEK ILI251x capacitive touch controller.

The overlay is also combined with the Toradex SMARC Development Board
device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 +
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso | 98 ++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 604bb35675930..f7f09d3cde5b9 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -714,9 +714,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inc
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -726,6 +728,8 @@ imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-t
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
+imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v2-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..0235aa1acbacb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch controller
+ * to J49.
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
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 0>;
+	};
+
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
+		data-mapping = "vesa-24";
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
+/* SMARC I2C_LCD */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_RISING>;
+		/* SMARC GPIO4 (SMARC P112) - LVDS_RST# */
+		reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_native_in>;
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
+};

-- 
2.43.0

