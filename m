Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E12443C39
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927812; cv=none; b=b6aq2VZjW6eGP8etvLI0ZRyiU9+IAZMo2HKfSwTucbgVpF98pz8tEWECZrRHdarzMvueGDAPfZjtSDrq8zgidNaNcZ6JymYsmZqw/y/r1YReE/c1tIxK/ILiUW0PMcdgxfvfsYK1hLe4vnCZZfdJ3jF1OWj2eA8j5frdFQKRaZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927812; c=relaxed/simple;
	bh=8YdLh4ZCnwDwZQ/aIKC8ya5+UfbTiD6xxi99nvSGj8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlGmbczDfwvS+gy6QiYlqaKdsS0b8yVFKYU9814kZByo6liRLRyMlrgvBZGmttBSC5pJlIiz/sjRUUj6+x0KGauCXSMejOHx9IVLeuXmbWKcR0JxUNnSoArh8kdSe8ifpbcXEJmTQRP1RmFL9Vhwqwh2B3of7c2tK9GapFREj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEY+UAny; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEY+UAny"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso46315605e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927808; x=1791532608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKeQ7pMRDpSMvOsTqMY3Sd6L9YDjUesHcennVqLoo8U=;
        b=HEY+UAnyQYsJYNeVTMnudMNB4WyCUDBYf7lcabfnD4DA7f6l/M5cuJzTPWdiTi/wXQ
         kHLdav0Olih9gnZyiJSolpbfCjoUbtXgzaLkDvCvKg0nO6I7O/ZUU8exeT/xlQhQb43w
         i1Ov0f5BLqiUUo9Vc+P2PVFrdVP6a3TNXft2IniIPQTkNSDTqYd/qQoQPlo/Kd7O5/2L
         qR4GV7y3FhTKJ3WSNLN+1lPnhVy8QvlwOOxZueUCGkU9FhPM9nqkP17gQXQEd0Q+NJV8
         zxCunny8Po73MehJsoynlI0Ods6CpiRWUZjPh1iJ9064rjvH4N/wsNXbCYJaodSucnGK
         r6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927808; x=1791532608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKeQ7pMRDpSMvOsTqMY3Sd6L9YDjUesHcennVqLoo8U=;
        b=Ycg72TLIFBWfL5fK9JoR5qGsoueIljGKFRutdgkUbYmxTfptwjx+1J5v0Hmmo6L7sr
         nb+Xt/BkLP596jL4eyK/wVkyx2FBly6esemPxupKYQLoil/k4V/sOAXQ/SpZrXjLUq5K
         ofKIapzpM7f9SXlRsabOUuw6qEw+tEkhPg21bdF1yUbGkNK56Fw4bXWGxs/xVV/gM3Iz
         V4QjbMOs09+BGNrgVcyuLK9Ml+4v5xXQEOogOBTA3pGPCN6CKCowcv90iml3e4wZZ5st
         r0Ye6C9YBs5cPitghl0shtV5+kw9jtTEZfB1+ex5KbLeF/HFMP8aAQ9JaPl3rSDhDTcc
         6uRw==
X-Forwarded-Encrypted: i=1; AKwUvBz4HE/xj97BZpoiU4T3LReyUfvUJPruaOejOkpCGcePPjPVa7zbB5bxF1F4QIoUQPAEkm3yUTpt4FjTE08=@vger.kernel.org
X-Gm-Message-State: AFuF++me7fAICzb61szlu9HiTQygRNgt3D0rIZpwq6pjjj6TOJhu4/9Y
	oV4nbgaDoh4zShWT1FSytPFK0U6pVYckKHsE+XJABy2xoO3VyxXLaYZH
X-Gm-Gg: AYBFou0RbxGHVMjhb1IcwsFVVVa02+4lgYqYSkpr8BXtZWV27NLYFlCp3HbuqQeX9z2
	PDV8nEb9ZpElmaWcSvPu9BZ1M+dDJz30RKd5OevirE26QHyMZvhGHjIWRv4Di079fqNZF3EJ2mZ
	e0y9ZGqN4XWY2k5nw7MvIfY789qtzzhOIrU6UEJf4S1zTu86a7qGSrkw1Mj1FgnWz7AxbqSWqH4
	HdZz50oYAKKs0i/R3cbHF/gNDA9cHsQ7WdDLRE3cmPpCqJS1dDlXH57c0LO8wli04j4qn86+5wE
	y4iqZcukgmQVJHEsrmg5MJfe+7hvyLq8j1XRpBYOq9cgqI+E6Fx/zKLp9YHJPmmE7zjPvmeMglo
	0IlvjU4U6jbtk6EGek7JVrg0O6ftj2U47BcJoqBKqpL0y0UsY/wq3KQSq3e89kaGoCoRZs7XuPL
	CM3uAYxQc2I9MIVZasY2Waa3mdNClDvUDPz5P5juPlySOd/03bC5w3mI26b2a/7l97gNgmB+Nun
	m1VpuAEHzVC+shOA8P75qc2USiZiNFGDkMGgAKvjjeOiAeIXvQ499WY/dCt35wqK0rn1NGSoOu5
	P9Q0tifL
X-Received: by 2002:a05:600c:4f04:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a027564c91mr37915915e9.18.1790927808420;
        Fri, 02 Oct 2026 00:56:48 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:48 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:41 +0200
Subject: [PATCH 5/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 Toradex Capacitive Touch Display 7" DSI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-5-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
on the Toradex SMARC Development Board DSI connector. The display
features an internal Texas Instruments SN65DSI83 DSI-to-LVDS bridge
driving a Riverdi RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch
input is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...ex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2ec50811ee1a..1310b34178e5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,7 +710,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
@@ -722,6 +724,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
 imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
+imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..bbf945997703
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" DSI connected via Toradex SMARC
+ * Development Board DSI connector J44 through the Toradex DSI Display
+ * Adapter. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-dsi
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-display-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lcd1: backlight-lcd1 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) */
+		pwms = <&pwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight_lcd1>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 160 pixels.
+		 * Treating the panel data sheet's 160-pixel back porch separately
+		 * from the sync pulse results in unstable display output with the
+		 * i.MX8M Plus DSI display pipeline.
+		 */
+		panel-timing {
+			clock-frequency = <51200000>;
+			de-active = <1>;
+			hactive = <1024>;
+			hback-porch = <100 100 100>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <50 60 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <23 23 23>;
+			vfront-porch = <1 12 126>;
+			vsync-active = <0>;
+			vsync-len = <1 10 20>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 52/54 */
+&i2c_dsi_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		enable-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2132";
+		reg = <0x41>;
+		/* SMARC GPIO8 (SMARC P116) - DSI_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
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

