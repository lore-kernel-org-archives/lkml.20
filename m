Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584701;
	b=04vaLQ0rYkL4lAueXshM7erVgnimmo0XA5e61COlQ3Slqu6R9THQV1CVUgouRt7ODPqt
	 EC0lGs9rMvbvUB1RyHIMPmfGzk+enSCBg0v9KD07J5/8jMBCq6/MHONPq7Az7mjU4HVRX
	 gUTfiKzZk/CV8BZI0sxQureMDzb8FvNDXratGCUatHWO6ZRwcsOTnSXLcCDivdPjrGdWK
	 9RQS4dERpv26XjsuyQl3DCcNnclkZZzUvPKx1/dYz89IB7pG+05OPDdOkiN0k1pJrePjH
	 zDwf2GoeyzteA+tdeQ9v0jkO9702JgW+L8X5amXcubY0L95dQsoeyrfRq0s5ZPAzOIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
	b=u6y8QmqT48pOU95A3GW2RzRaALqr3yRRNsllAxLa0WpOvYjYeayg/50qJGSOdGvdc06e
	 vRO3UsZAWM4xJPd0vOQOJRyTxy8y30AnW6cAeolhKkkfnr754oJC1NerVUUfarCak8ZOG
	 NLflcnDBx5+0ymhL648NmUaE1yX7kQlvGGSSI5E0TuTfku7hjN9gwn3Rp01SzHB0stdsf
	 /53qn6cFnxe7zS0c8KMPTnMP6HlsVgNYNCqObX6gMnp8JIoZwUeIN8tAuHkHxwolehsKd
	 gTRjCWMH+LqUaWGUKtJuLkLgjaY2qh+EgMiM8ME+ch+khSuIU8U49ePTQzzh9eu36WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKPT02lv;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E460A2605
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D9E460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKPT02lv
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b360828905so11728897b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584700; x=1795189500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
        b=JKPT02lvht4LsCjSgtzRHWYmqTYNGv0xOhBaAxSY643IfoM4BH6N4smG9Pt+miwGlf
         ttbuuDRJFJGua83iGLjWTbvBplX67xAWrOcBBVtfZz8NMsp6ti6CnxNmM6n6zuJ/i4vx
         m/DSpZQvjvmUQgl46Gp239qDkzbt0bjrO0pL4o/JayZ7HRCRbk5rOiH2hau9nnRJv6Df
         1qXHFEP+Dapzp52SZxPldFLXNhIOpbyj2pDNyObBxkulbDEP2W/eI9o7dR/Si/9U10nT
         7PosU+3rB4fTnTYyNWVUdCOHXKUayM0ewwNPuk762R3E1k/FQbjQSW/H8y0lM7u8T6gk
         dL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584700; x=1795189500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHtE73vhqIdWc0I+UqTverKQ3sxYALK0cFNNVPTEYDU=;
        b=RS/OeDu1eag5MApLLHVrJD9knOqmM5PhTkdMjFb+Q0hIfE6O5OdtL6UjvCFs+B+zCP
         V6Wtds/9FltNB0INhl/O+HY1bKpZvIqvSfaSp5v/qTHSS5r+FUD6anxJjccXo1ku70fX
         X6JOEX2pETIryKXx6+L4ptPYg6xFerUfGHI5Mhx2HUOxyLXyJk8iELHmLyhRrk/EoLUv
         nzRwTfkOU4qu4vBdfkznRySgNE8ufpm9XWCYvh1ISCkJVvBuknBymE+Mlme+V8gPiAKq
         06snO1OCk2JaO+OrVZ+cr0nME9XuTEDG2IXnygE7lPaNfy+3I7V42IM1U8RLEVx6tP00
         vxdQ==
X-Forwarded-Encrypted: i=1; AL+hErExJ8NJJgWBZ5XC/Yye9tAGW+5XwIUA++Hw3TM9iNf1UNe63wJOJ3H1ubwP1bHzS3dZ3grWx0+r/Ncr2DU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q7Odtlr4lR0JpUUnZppBxHfLf7XdDZnebJDzOVx4gDcXbh1j3
	4AQDJRE90CPLx11AFIKCVfGykmgnvI1zXr3vJPbKzE8IMR2NzclfhwcS
X-Gm-Gg: AYBFou0Nv0JcUJuAK04+htqji6X9ikjKmHsKx5lSY4Su4kPF6vpNYDEOyB6dblOYNpV
	BLozvXTb3ch2wKGM8p30wwfPk+qBo9/P7fMpxW2TyJveM9BsuOrg+eLssZAylEQjjGNn6D32HUn
	sNXPtN2EH7I3KIvOEZtdTlUc4WnEPA+8Ejgnx2ZcsD32qkaJAzi0D36BL28FmT4s5mAuojoX76j
	xQkioMFEjwQCAwKPfGNvPKI6PvPGwKUfJf8BmOPsJtuFus3xnLZ9Y+PT0pLhZ+HnyauGu1cI14L
	4zCiuL1m5d02D44zcqgoqKRNOGJmut+UWht4b33T2VkQq5TYpi8AoesWRmIGOilu5RG6NxNco6h
	jE+XRhlguy+RyCtisqUGearb4G2Wtn3tg2IDg/J/Bhk7F0bZRNiYUQmYZByytDxDrsonfFyq9F3
	hT/RI8u+R3eFAqeSVtlK5BfzScQ+5pSo9ynTzzz95ZFn+wDDgYVIqJdpKxi96iHHt/axyUPqcSP
	gYUcC8zAu6BOaHNcwfSQgbx6NOEpOCoVQ0tJzLutpz1FNUuX28o5FR86W72gOpIPUzomhhGwbO2
	45i/mDw0YgXuSdh2RQfBFKZ8JRLQfzxu
X-Received: by 2002:a05:690c:386:b0:8b0:b1dd:c09a with SMTP id 00721157ae682-8b4aa29f563mr16924097b3.64.1794584699912;
        Fri, 13 Nov 2026 07:44:59 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:59 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:09 -0300
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-3-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5024;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=wd7JjVXjadga4ELg+VIdxEXEfAr2w33RKXLjgv7ivC4=;
 b=CqHxEnZYhjZDB9Wuj005NZAt0tE3LkmC2TXKbUNRJIFlIkB0k7ZbxzCsVtfUjv+USdQuubvQx
 EuoP9sp1y3HC6AUu/J0/9s1LVOIm2+2g/qB5IzVpXd8aw3Y5a/Qi/D6
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is a LogicTechno
LT170410-2WHC 10.1" WXGA IPS LCD and the touch input is provided by an
Atmel MaxTouch capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...zzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 71 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4cd72926b80e0..915507fe936de 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
@@ -742,6 +743,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -754,6 +756,9 @@ imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-td
 imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..ce426288081c8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_mezzanine>;
+		power-supply = <&reg_3p3v>;
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts_mezzanine {
+	status = "okay";
+};
+
+&backlight_mezzanine {
+	status = "okay";
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
+	 * This display uses 71.1 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 71.1MHz, or 497.7 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <497700000>;
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

