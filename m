Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082934;
	b=MXaVJvqUkt0ntYLJ7080AZvREcQOYLRdkFGyl9vBN8KgMRRlSs4+EyZ66KCGM6x94Tkx
	 OmJm6E+hGEzHbUrlfbAzOClvOixD54SbCwQqpbNerSda5QROLc9Rl+8SgDAwN76lt4A1A
	 C7QMJtAi2VZj+80mhlKNt8FLTLTxIkToh6RJUzEfOvf4bKji3VkuosSgH8cmRej46DwKF
	 EugvPjTNBKCnVKcyQFi+xuOHDq99nMIDXh8EK45rGIVfdZthj2cFT6ZMo5WQox5/oMWih
	 M7nVlt01U6B2t3zDN8f4rrQUa6e0oopmna2uT4wz80p+jqQBza8OUV4X8zjMbMZZBZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082934;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t3UtieEmmk/gVvAXyJNWWiM6U34t2QVAUEQ1LOXQpq8=;
	b=F+6+XofByyqFEOEiGAk8lH2zhqWnl6sqJPuPgqOovIOJpTD2Pu8F5n0jzSR9o9vzL9Zo
	 idiJZINwz6yG9IF5CtwpRZTcpC9xs7zL9FtI6qhhCwQQ+Ub36RtakcB6SDfCManVz2AhJ
	 OK88UnwtSJtd2FNtgnvuU0YpklzLOyp6sAiRS8HZsLwBoFJ97sLOmSm54j23oIwbQvzcW
	 scKBOO6zLD8OTFYOsB0qC4NmPir+13ZUEg7UfFVGARQzR231KIYxX5m2ZPdo+m1uNny9C
	 S488tbLdfB0YOOUeOw6xqp9rYGUbrvpdv1vHoGxU1RLwOWp/pVt+z44gzXk5Hxq8i0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oUTyCYaq;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557C8606A335;
	Sat,  7 Nov 2026 20:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 557C8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oUTyCYaq
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0EDA42384D;
	Sat,  7 Nov 2026 21:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794082923;
	bh=t3UtieEmmk/gVvAXyJNWWiM6U34t2QVAUEQ1LOXQpq8=; h=From:To:Subject;
	b=oUTyCYaq5yXX/qnBuuocYKg55FNP24yXMYZ2u9PjxfIIb3bxmF3rftwMQIayripE3
	 uKXQP0+mETehN+7QpUooHRpENOlJVBHQ7vtVrAuJlpbcIlMFSUq9/KKDtCzfumWVla
	 dMi8bHtlkoOE1sSPOvFNv67WafAIcCHZkfxcmTqvIUe4v2ToFJ8BJ4JO9T2WIPv620
	 t/YwR15/CytMAzKXjrSX0WTt1dTUbACE0KtVcP2IioAIyCuWKH7RP5c6ShfcP8qnYU
	 DsC+rJKW9DQGYWycRKIJl0MmlxrlJUs8Ba68BODJ8OH2Anwo5zKKxCP5fDPStRUnOI
	 PYGs+gzEgdEtg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 5-inch
Date: Sat,  7 Nov 2026 21:21:56 +0100
Message-ID: <20261107202157.163218-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a device tree overlay for the Raspberry Pi Touch Display 2 5" on
the Verdin DSI_1 interface.

The display is identical to the 7" one apart from the panel compatible.
To avoid duplicating the 7" overlay, rework it moving the common part to
a shared dtsi file.

Link: https://www.raspberrypi.com/products/touch-display-2/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  5 +
 .../ti/k3-am625-verdin-rpi-display-2-5in.dtso | 17 ++++
 .../ti/k3-am625-verdin-rpi-display-2-7in.dtso | 90 +----------------
 .../dts/ti/k3-am625-verdin-rpi-display-2.dtsi | 97 +++++++++++++++++++
 4 files changed, 122 insertions(+), 87 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-5in.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2.dtsi

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index da654153a35b..5db6ca5b7f18 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-rpi-display-2-7in.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
@@ -294,6 +295,9 @@ k3-am625-verdin-wifi-dev-ov5640-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+k3-am625-verdin-wifi-dev-rpi-display-2-5in-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-rpi-display-2-5in.dtbo
 k3-am625-verdin-wifi-dev-rpi-display-2-7in-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-rpi-display-2-7in.dtbo
@@ -454,6 +458,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
+	k3-am625-verdin-wifi-dev-rpi-display-2-5in.dtb \
 	k3-am625-verdin-wifi-dev-rpi-display-2-7in.dtb \
 	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-5in.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-5in.dtso
new file mode 100644
index 000000000000..a6ee870aae0d
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-5in.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Raspberry Pi Touch Display 2 5" on Verdin DSI_1 and I2C_2_DSI
+ *
+ * https://www.raspberrypi.com/products/touch-display-2/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am625-verdin-rpi-display-2.dtsi"
+
+&panel_rpi {
+	compatible = "raspberrypi,dsi-5inch", "ilitek,ili9881c";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
index 8366bebbd5d2..8cda872effc0 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
@@ -10,92 +10,8 @@
 /dts-v1/;
 /plugin/;
 
-#include <dt-bindings/gpio/gpio.h>
+#include "k3-am625-verdin-rpi-display-2.dtsi"
 
-&{/} {
-	backlight_rpi: backlight-rpi-display {
-		compatible = "pwm-backlight";
-		brightness-levels = <0 31>;
-		default-brightness-level = <15>;
-		num-interpolated-steps = <31>;
-		pwms = <&mcu_display_rpi 0 200000 0>;
-	};
-
-	reg_display_rpi: regulator-rpi-display {
-		compatible = "regulator-fixed";
-		regulator-max-microvolt = <5000000>;
-		regulator-min-microvolt = <5000000>;
-		regulator-name = "rpi-display";
-	};
-
-	reg_display_rpi_touch: regulator-rpi-display-touch {
-		compatible = "regulator-fixed";
-		gpio = <&mcu_display_rpi 1 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-max-microvolt = <3300000>;
-		regulator-min-microvolt = <3300000>;
-		regulator-name = "rpi-display-touch";
-		startup-delay-us = <50000>;
-	};
-
-};
-
-/* Verdin I2C_2_DSI */
-&main_i2c2 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	mcu_display_rpi: regulator@45 {
-		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
-		reg = <0x45>;
-		#gpio-cells = <2>;
-		#pwm-cells = <3>;
-		gpio-controller;
-	};
-
-	touchscreen@5d {
-		compatible = "goodix,gt911";
-		reg = <0x5d>;
-		AVDD28-supply = <&reg_display_rpi_touch>;
-		touchscreen-size-x = <720>;
-		touchscreen-size-y = <1280>;
-	};
-};
-
-&dsi_bridge {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	status = "okay";
-
-	panel@0 {
-		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
-		reg = <0>;
-		backlight = <&backlight_rpi>;
-		power-supply = <&reg_display_rpi>;
-		reset-gpios = <&mcu_display_rpi 0 GPIO_ACTIVE_LOW>;
-
-		port {
-			dsi_panel_in: endpoint {
-				remote-endpoint = <&dsi_bridge_out>;
-			};
-		};
-	};
-};
-
-&dsi_bridge_ports {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	port@1 {
-		reg = <1>;
-
-		dsi_bridge_out: endpoint {
-			remote-endpoint = <&dsi_panel_in>;
-		};
-	};
-};
-
-&dss {
-	status = "okay";
+&panel_rpi {
+	compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2.dtsi b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2.dtsi
new file mode 100644
index 000000000000..cb63db881615
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2.dtsi
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Raspberry Pi Touch Display 2 5" and 7"
+ * on Verdin DSI_1 and I2C_2_DSI
+ *
+ * https://www.raspberrypi.com/products/touch-display-2/
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight_rpi: backlight-rpi-display {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 31>;
+		default-brightness-level = <15>;
+		num-interpolated-steps = <31>;
+		pwms = <&mcu_display_rpi 0 200000 0>;
+	};
+
+	reg_display_rpi: regulator-rpi-display {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "rpi-display";
+	};
+
+	reg_display_rpi_touch: regulator-rpi-display-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu_display_rpi 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "rpi-display-touch";
+		startup-delay-us = <50000>;
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu_display_rpi: regulator@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+		gpio-controller;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_display_rpi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&dsi_bridge {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel_rpi: panel@0 {
+		reg = <0>;
+		backlight = <&backlight_rpi>;
+		power-supply = <&reg_display_rpi>;
+		reset-gpios = <&mcu_display_rpi 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi_bridge_out>;
+			};
+		};
+	};
+};
+
+&dsi_bridge_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@1 {
+		reg = <1>;
+
+		dsi_bridge_out: endpoint {
+			remote-endpoint = <&dsi_panel_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
-- 
2.47.3

