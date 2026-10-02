Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18443DEBC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927808; cv=none; b=jr5YdzmOjjzANptAmUFLlDsKNi7amZCoE056OC7LN/AXkwhBXDqE+vPxTVrOSNdZmYyDcFYJR7fqjGXg4fH64ft7g3W1dNi/H7BySGBiXvey2EwA+XZiv7US2IGW4ea4qV7dosusAP7mgFxb8B09SJ4A+y+X18qGoPNImM02qRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927808; c=relaxed/simple;
	bh=15KlGrAuHqAXKMBwWOYYGuttAHdXhkehH+S3oNKzL54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBCRiqnhqKLUzd+wZJUa/qJm/x6GyKbkU2nxu6SC0XbBFzesNzSzbL0uUQFzkQsA/XcyAuMv4cqe6hHUciNvDdSOzu4pQ5ZwXmIJHM63e8Cf39moRfInWp3pp750/fs+spPxirJf/QLoYkIxS2WvirRUvrStuBu06DYfAGHsL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGsPslTV; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGsPslTV"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so1160097f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927804; x=1791532604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6LcBsrn3qmklfWXf6wHISNXjWe9EOmsJSpM+lvYuXY=;
        b=VGsPslTV3Afh1h0Yq9muE9y5bOidItdzut32Row73AR5Ntg5TNqN4wtOgt9QQW1d8O
         rXqzWffChHwAKRsBednMUhd1miZWPWW95UhbEbTZBEyxs1BD61UtPRS5OxK/9zNgfocy
         fCVb5kOAG/dAfwLylcm9hKAv1uigZElzyAD2Vyc8NZ+nlQFoGR65nyeQw7CpTW/CRD74
         VUNajZ8RofEFuLROcBkuybhTUB8tKD3mjS6LoWAmizwdCdd4Y/PmbdilOwAIvkEUTwY4
         iHdK0FWT8/n3jCnAf7wrhc3bJUMnQNoD11xvylveNN2dbDhHJS/PW1FWPZSmfwg3Eq/X
         RQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927804; x=1791532604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6LcBsrn3qmklfWXf6wHISNXjWe9EOmsJSpM+lvYuXY=;
        b=m2jK4WYRvX4CviL/WGxymmLjF/S5/TVXEUjqIFxy5Ajz21fiU+q6xX5qR4DQg3rAeP
         pCFJjC92S/Q6DxmjWtQvpVwHx8xGqd5P7k1sFx93vaWHvHgY4o9HGcdeBSOMoxl0JAG6
         NIlQRZp/7bXevxRrG3Nd+ImFfAVhz1klaHhxi6GyuWA/lb0j0t1UWPU84gsXjRNokLLy
         t1gAD6O2f6TXOBJbx0WPu0Bpa3anAR9MDBa5UqOVMzR3lCRSyF9QSlvTtieKrseKcqmZ
         iPUuW2bFHlbZ+w/Xbew6sqp3BhiHfpcnwecIDJ9RH8vOjA6Seb9g54ND7unDHVGjt4hl
         ulpA==
X-Forwarded-Encrypted: i=1; AKwUvBzqZzwXIGOrLSIe8Ovt/1kHEIq4/dJjENwjCvtEeDZs+bNTZHhpBDo5OQPaKfx0dQjUwHPpdCL85+GFZ8I=@vger.kernel.org
X-Gm-Message-State: AFuF++k1Hgph/7gue463Nc4v+uCQ5OVJHqnX4EXjjP4Bkd9AJDbMoUsb
	xwE2ODq4tBUtsqE9IccX2biZ1dTjrWh0h+z+Pon1Jc9qwr3cZPu6IRtF
X-Gm-Gg: AYBFou3MrhbOabTi5kZa2g2l9L3vYfmS9p98kyJ7L8d1grzvxfHTH3CJOKke7+okxae
	+6cGSqrjPfynHrWKMvF/Y9EKslpY/csoLWfyseliTsVPDExlrUgRJad+9joBp9R1E2Fy4R9Sv4J
	XrZj0M8tIToWEVCE2c/wji+V6yGVEyB9UHF4J//CTUQMmpsd4BS3QgSGIwIC1O7KRdvlivYfkWV
	XcTtMQudD3IyUxEE/1DZF9b392LnK/gGtgJ3JdiDs6cJlZ82GKJ+rSWV9rA/65NMf+3c1DHwS1h
	DAbSNmzgdbd02STiUqvboaIsyTyD1/wFpr82Ooc0J0Yzx/XA+OOj9/HUb5bSjuy7N+t00zxmvH/
	iJhGNtZ/ahmYrmP3acQp0FAhyxMidMMrF57BY11DzFsKkyezDDkwDaIZFjP+8uL6yOE9kbGktpQ
	cbjvZk+1LjqNz37XNhoO2NYZiODMoaitNV91ezKAafaG2jgDftwkfbHfVrhodgLXAytsOoXDWXa
	gnmEGxCD43cOaWGOvaaEOltVCO9oxA4ifyD1cXe+pcHZV0lbQ1kGXxJtJBQ3sjdNo/gG4WjHw==
X-Received: by 2002:a05:600c:c102:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-4a027534963mr27502755e9.4.1790927803714;
        Fri, 02 Oct 2026 00:56:43 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:37 +0200
Subject: [PATCH 1/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI
 to HDMI adapter overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-1-f578c63fb676@toradex.com>
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

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Toradex SMARC Development Board DSI
connector and provides a full-size HDMI Type-A output. The adapter is
based on the Lontium LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..b5519fb36b5b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -709,11 +709,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2.dtb
 
+imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
+
 imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
 	imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtbo
 imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17-dtbs += imx8mp-tx8p-ml81-moduline-display-106.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
new file mode 100644
index 000000000000..270cf567ace1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dsi-to-hdmi.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to HDMI Adapter connected via Toradex SMARC Development
+ * Board DSI connector J44. Open J95 to select the carrier DSI route.
+ *
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-hdmi-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	dsi-hdmi-connector {
+		compatible = "hdmi-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hdmi_hpd>;
+		/* I2C on DSI Connector Pins 52/54 */
+		ddc-i2c-bus = <&i2c_dsi_1>;
+		/* SMARC LCD1_BKLT_PWM (SMARC S122) - HPD */
+		hpd-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		type = "a";
+
+		port {
+			dsi_hdmi_connector_in: endpoint {
+				remote-endpoint = <&dsi_hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+/* I2C on DSI Connector Pins 4/6 */
+&i2c_dsi_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi-bridge@48 {
+		compatible = "lontium,lt8912b";
+		reg = <0x48>;
+		/* SMARC LCD1_BKLT_EN (SMARC S107) */
+		reset-gpios = <&som_gpio_expander 7 GPIO_ACTIVE_LOW>;
+		vcchdmipll-supply = <&reg_carrier_1p8v>;
+		vcchdmitx-supply = <&reg_carrier_1p8v>;
+		vcclvdspll-supply = <&reg_carrier_1p8v>;
+		vcclvdstx-supply = <&reg_carrier_1p8v>;
+		vccmipirx-supply = <&reg_carrier_1p8v>;
+		vccsysclk-supply = <&reg_carrier_1p8v>;
+		vdd-supply = <&reg_carrier_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_hdmi_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dsi_hdmi_bridge_out: endpoint {
+					remote-endpoint = <&dsi_hdmi_connector_in>;
+				};
+			};
+		};
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
+	remote-endpoint = <&dsi_hdmi_bridge_in>;
+};
+
+/* SMARC LCD1_BKLT_PWM (SMARC S122) repurposed as HDMI HPD GPIO */
+&pwm1 {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl_hdmi_hpd: hdmihpdgpiogrp {
+		fsl,pins = <MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x104>; /* SMARC S122 - LCD1_BKLT_PWM */
+	};
+};

-- 
2.43.0

