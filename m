Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585133;
	b=nJzJGqhCIDgWpOlEKwtPPCe7Ne/1JsQ3WxDWohxqnFGpveu/Z+u/LpiQ3H2CLZP8Glvm
	 DK8Wpl3YWYF5M05T7naAaBK37xI0b3eeQlljqbv/ZMQxlwepHo/SlOeiKmqvhZ+StNMbP
	 x8BbO1Rc+v5/gkHBRpPP3YUJdsQLVnO+wUx7QUe6xQcgOGpKLoC01avvhoWDdh+MR44UU
	 9eu4j6G3xf3vWhyJK5ehUIJhFIXsB6/4autIC/8ngOJ/Z5ZyWmkunO+3VZFZ8CZVyOatq
	 mnMUCCth5URPMdfT2lVHoDD4pdyw7hX6SHrGYGjyoFJuchYXEPIpAqxuuPuJpif1Tew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
	b=EgdZ9YjvIncJa0nGSkgeQ/CXQSsrPcQz2V/FDb2Xy4j8O3CI+IQgQJRY/+wUgUwR0WGL
	 9EeLKUqdKYiLJqgxvWY3jvYF5zcSl+5ML48iFV74azNX+jZZrU0L8baodiA+XiBp7jqs6
	 NS7IMp4sULuB3l9QXd8YdBjhvsvhorxbaAhG7lTqiie9BFsF7J94yYxW5EUJCss9Wl+Bd
	 cFP1ycW0ifEMSi7DDtNEDbJprud/15m0C1Hn159gYLRRbopsQLNwPNzXWms/EqevbmqBL
	 AwyxRx7GhQWRFQ+kD8AO78X8c7sASnUTFOUPpyM7gIILAditeWIkaIBf0B88v+EOZ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9ltO027;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9452B606A880
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9452B606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9ltO027
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2bf046d7fso1527621137.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585132; x=1795189932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
        b=g9ltO027D41Ot2oPQl9PbsfeY04jICO52J54ovQ7Voi+qucuV+D8ShHbG15X9j3yKF
         5868WGsVmp3/QqLfflMpMuYKwnmzMY73sLwq7s4LhyZ6nSQ3J4wc4RknjhfFmIPfoNGZ
         aVU+HgSU88VKnBlHB+HZk5xwI75/dlvbvwTwZuVNIB0OXp9fs2PYRJQwU5v5TfXlavXC
         RjChCHbi5bvx+rvusDPB6JnGs72eXm06lqAjuUpyrjj1MKHFSM5nmjGjVBPTKJMYnc0J
         Y89wR9rCMV62YYJ9R7Rec3YYg5T8fSKXWanArX+5YgvHlPqBSJo6in1ekvnWtD+K7Owv
         FnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585132; x=1795189932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Ik0gHsfdd16nhHnjQyqDcxvqmph40nuj+OLJYJgm3k=;
        b=2QiBynPdaBzm40GypT09hb6m2BLu7Ko3VitoWy5iVKFnsXFLCbdh9TmuYdyhlYUerR
         wf12vPy9cxp9Jw6LhsLNwQ4OnNRKNbVecw8/C5GgquWpbN0ilRF29ih9a4z3MfBjX+Z0
         D7YsyVX5/H/dPCqLWYgUDyEj/+6HdnSoe1eGadt1/YsgVoCzBAf4FewQSq8waQ1fAfL3
         ZNUO88TCR8xHqmLSfxaqcXkZ6SuNg8EhKMSW03sngQ/zyrHQsPMPsOUe24meglzZ6IzX
         i9PoKC65jfWRnGqp0rEAPePx0d04wC+JzZKh/yTYdm9sx2P7KMuKIKTSC/T13jhTGo5v
         xQyA==
X-Forwarded-Encrypted: i=1; AL+hErEzyP5LVY1nLLANF2UNr5f3pihTRTYEg4J35df9Q9aQuQH8zU0o8fw7MWYvAa6v6sXYqce9OYFxZLvAt6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z97UmvI3v4l4tpdhGmC9LEv0h4hpr9E5AqAfKVeB2+KG6xGNjye
	AY8BskAd1UEgtXU3yQmoTV+7lJ7sAKgFcIiFdvJ9nhCtQPvYMsbIY1uQ
X-Gm-Gg: AYBFou1HAnkz31hEdu+hU2t4bN6m6UY/XOyDvj/jjec9IOfmZqGfgeQXPcDoNiITs7G
	uZwi5ZPXyOFatM2qIDONDW+up8h8QHyGaHI6biJZI+L8Ucfy7x1qzVLFJYwOo35vN5qOFbn1Y0K
	DiOjovSBSqGnlEFvnpqKxILNnLOgQQO9Bjpg908cjApoNe0NmV5GTyqbMLuCBZkdNDlWjgXvz7X
	Esj7Vck7z3mxt2U3fLPc9eKWykUjSFpSXxubd8tH2ZU9kqqQxBqGIfDaPVIf7yUOc6m2V+GjYWc
	kvN4as6Ktk8+fk3mcyF1MjmMhWk5jzbW2iVkaCDnuZhLS0ohiJ2Wx41g7LzQMGXujVMX7JB9Jq2
	l+p7nEqasAm25kpS3aktoMnsocksbEVLrFi/iEn3d0Kqi2pKwOloWudPyQYufWTwi2o+BncZqpY
	cOG2LgAmoCVbK6hfCZCHzV81BULZqTl+7WdLIbrjyK4xh5Ka9Zso07f7mpeK1LeG5Znz4x7XN4J
	/4Hksg0ZJCP7VqjmT7foSVh84KS8ns19eBScRVyfsehp02PIpkYE+TRcqnJk5PX6tvxXSAG7W1l
	VoYj7PisdComcjaY9Uf6wZmiZp8capLa
X-Received: by 2002:a05:6102:6c4:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d64d6f8a81mr959235137.18.1794585132255;
        Fri, 13 Nov 2026 07:52:12 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:12 -0300
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 DSI to HDMI adapter overlay
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
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-1-327f5d37a9c5@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=4733;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=6gWisAoRL3n8veatx12VoVaqY4HAjgDwneKFrMNA53o=;
 b=YbAc7Dfi9KrryWwhYmgXbDasotxsHNMYCe2MqmRznTR9jWWd4uQiWoDUXcz/S9ifj05cVTsJk
 JBmp86tv4QrD8nPztn7gFCNOjifwXoLzo/61UqDUJ4/POQT8g+Tz7xD
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to HDMI Adapter, an
accessory that connects to the Toradex SMARC Development Board DSI
connector and provides a full-size HDMI Type-A output. The adapter is
based on the Lontium LT8912B DSI-to-HDMI bridge.

The overlay is also combined with the SMARC Development Board device
tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-hdmi-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..3c424071f8fc0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -710,11 +710,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
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
index 0000000000000..270cf567ace1c
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

