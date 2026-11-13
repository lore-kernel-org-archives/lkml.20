Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585147;
	b=lgLkLrMysZho+9qqbm07CLfNpSrsTreBDEWkovonthADZEDmIzOjV4UvwPSWeWKu2aQ4
	 T4dJ7MZ953mfgjQRBNCkWNg4dEgrFymD8xmrodr1pCsHg+35Pk47BtF6PW54yaDmosCbV
	 J2f9447Km7IpbsJMz32GbqqLP9I71i+BexZ/K2GJ8+JLSxu6wtIH++MjQTz2nXS9aLpWE
	 AM44IXTEHHySafnftmlHh3sF2QZTSpo4005PUu9GHw4GrjWx7hMhDOs2yLahbtW8ErqEg
	 zISiqOtu4nvhwVYxL43zC2bs3avJImwdkcqJqqGTq+tbyVCh/MPi57pAnYOBzuTsE0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=;
	b=MFJePi4IohHlC2BgqgLCJOoCZDWzT0ohmuc43DfhUB9tV/tf3ZdnXsAnMWxehyPZXkF7
	 9rKlKgkXfyEBhY9hAjX4OS0P6MkIa+nxdX26c+B6zjmm/fKcqC5bAXGnyqwxtTyJF0rb5
	 CQ7Jrv2aNUWtWSsrRI5XSkXhO5mqfeUHlLOEh1RpxTqkj/uEebA5p5mZs3mcbmoFfKihi
	 lcHUEqzjIi1i3dGJinbWyCo92XEJozUOW59+wT4sQo1ushobl2AIAdqBOySyc8IlY9KMQ
	 EeazIaMebFMUyrnKjyETGH/ovg9+AgX28ZGlpwiQHDRutnG/2mJF+6jMTBVdyxHUDLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qYQ38gY;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80841606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80841606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qYQ38gY
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so284977137.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585146; x=1795189946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=;
        b=0qYQ38gYp8CVioEeSU0qMC0mTJY2POFLu0Jc4KJHNWu+KEOo18jLqY7019oVFa/Jbr
         MQWFUEwGH9gSXqZCwJaB8NPDGhgdVpX2U9nDQLhW3oy3J+B9ubeJ+uqIiVGsejLV3p7O
         OLW5wK/SveJ9fEcHh0ze9t/q5mEMWWX3pJYSJ3UetRKV6/sROGrC0Y4h2IeIcjEinLDq
         Ldk9WlgMjCviXB9Jrmj5v1LVGT2y+PqmXHpc3kLSg5y5fqnISUkcKuxw2358P7NEDiSv
         XSkXQufKp9Cet65F8Uwanx268ro6C5AQTUiCAAVDNpeEbxZSn9YvhgrHIc5mUQ2aQomz
         KFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585146; x=1795189946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIWRN9vLoPyHTcFB7Jp/w2r6/s827ZL0kNYZ9k2LMNg=;
        b=Dn8Au7jgMtHuykXY06nYJWrutlVypMdnRpbwaxwFP3n4yr4rRb6DdBgG2lpNZSYZm7
         jxwJxTHBVrxrgvhzwXkHK3i2coYBIaT8DBh6OWiB8IMlAurrRwT5+IoezEnFBawabN1z
         qg27NBYeqmaC6fskXRZCn5B+J/M2MB8y/WhvMI+4RYcrYKlixyS5NNBhQFSKtsg3oc1U
         ZcAkATmS/+k9eFe7MnWcENghPx5xwv1VuXDHwBLWens8VcYdibIfTIFip8DXyBEieUqw
         5/gzP8j79ksnAhTRJfyb8CmryhB9FuFX9W9rrEUlqEje0ELp70WL3kECMhMZxy7gwlZl
         w2kw==
X-Forwarded-Encrypted: i=1; AL+hErEUFBp5xkTUcyMlXePEk7YioEKpqQytT2uiosKdYLRntRA6R20qps5zTvR8Eu999vROvHZXR8TeS9apZhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SdQQsBDBX4knH509ws4olfGLwD2+LCVkG9IZeT1Lg+HpVo+Gn
	k8BD63Q9bzDBlihgJspX7wnfRvs7qVC4zprU0nPZxpfg9a4JHdoVSwlH
X-Gm-Gg: AYBFou1jIyvHFbpjqhiCDceUSr4YYto1y7qE86SG9Ejij1VKzFpKVFQOPP/aJrpsY3P
	W3FdTj4CwrTB1jG9RInPHK9niiO0UK5A4V5URQvFywzxDi1aAK15OIx7gA7h035duMkMYIumvOA
	mWsyOC/tIIxcB8Oo0YQpkXdFJdLkeM6AYELWC/coBTb7DFjCfQsEpPfu6bLF8wUE8fa3n4dkyXr
	Lxby9F00ZvpM2NtT1LSCs2MEsvSerJZzyWTnWn36w+6S/WQ2qc79WKzZBuG19lv58yR6qnnpiO4
	Yf8uYSHjp7vi1XRddNgbjNK6BRKmiypT/y9JwOgtTpCRMqoKD0ApBHgsyCBLJvam9omTtZGTCJz
	zoosKxU4XyzMhINJCmVoIPKF0Yd/mXqYmrj9QxU77cdLK5bXampWgICtNvMzUvFcvV0PtS0uBh3
	m0kjnC5sAei4J39cGJXbe4G1WuYiB2ykrIyNlazpGA0UM/en+nj7SJKedma+2etZ6+oHeh9NglJ
	Tp+v4vYT0fkI1n8SM+JKmV9XKPK4P+Xn4ovb+MrP/HjxPwHmM251HdX9GRf4vZb3+yvXMB/IsEy
	mpao5zD0qhv6QAZJQm3NCBfln6t2Uq8f
X-Received: by 2002:a05:6102:3e8e:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7d64d7454e6mr798389137.14.1794585146176;
        Fri, 13 Nov 2026 07:52:26 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:25 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:15 -0300
Subject: [PATCH v2 4/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 10.1" LVDS
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-4-327f5d37a9c5@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=5136;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=qBu6AF0oDnpXjHX9V9XIiZrMULpT0BgZODCiPSH/VuU=;
 b=ahR6En2etBvCKOtaQfJtXALIXppt4UGBMA5qhBII05IfV4TUQf5OfmbYr7WbIYp8KjD+SMqRb
 TMgC4/CTUM9Bi0UcVUo4aj+qatRT6GhLyEicl53UdjGXCC1cgIMKO4k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Toradex SMARC Development Board LVDS0 interface. The panel
is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is
provided by an Atmel maXTouch capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 80 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b147b93b2a067..604bb35675930 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -713,8 +713,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
@@ -722,6 +724,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 imx8mp-toradex-smarc-dev-adapter-tdx-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-tdx-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+imx8mp-toradex-smarc-dev-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..a177cf61cc383
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Toradex SMARC
+ * Development Board LVDS0. Connect the panel to J48 and the touch
+ * controller to J49.
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
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD0_BKLT_EN (SMARC S127) */
+		enable-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
+		/* SMARC LCD0_BKLT_PWM (SMARC S141) */
+		pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_lcd0>;
+		power-supply = <&reg_carrier_3p3v>;
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
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		/* SMARC GPIO6 (SMARC P114) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
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
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1 MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
+
+	status = "okay";
+};

-- 
2.43.0

