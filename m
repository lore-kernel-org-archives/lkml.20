Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584709;
	b=HEKJk9RRHpJGblPNJS52sJjbRmFLMxtTrsWCmcuS7rD7P9sHJNwL7wUIEK/NJ53FbS66
	 HhCfoCcFzT7O1oUq1IlK+z2QRTXB5dQkQTaIU9qcZ9NHiVhIE2dfS3zjzRNxs+9uxCO/9
	 6DW4bcbtLqXUmzt0IrD/B1tXBOuXOptRcV7eWr8yzMI+RRZt41Ijh0+J8tnpkDUuJQob9
	 SEXSDs2ZUmDSZLj6E561M6V2YG9LQbjaph02NXfPVUOXgWyNAhThcN5c3Eh04bwGrRe6Z
	 ifPUUp6Pw5y8/sJVDw5R+Qg1tyl9waKHcXfNBOIhg17X0jwSjCZ/r2f1N6EKMnPN0dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=CfsJcWiWo3pVKRPryoM7AoQydDYjteLi5x8NUPXncGU=;
	b=dru7R7UqFFiK+naWAhCPBkQzd1IBn8Ijcpm+34Vd7MaEguYY9g8M4d0wpDblQ5ImZBqP
	 qkmxElbhUoJ206spTxVYAP9ww+4OA5wlX/cd0MPtXSEFF9bqc9OraRpe2fUDxCIKuCDnB
	 O+KDwS97lDWH5/MmrZ36zBvXFmbkmCr0f+TPv+G82qbQ1+vuyQ/l0+StVD2ZEzdKEmM7D
	 IG+pWrxUCYWohMPA1TLAQtLnQLDjurLL6hdNZP+S9Ui0nxy/luCLopgMVtMIGVPJz1N8v
	 0H4pPxblDyFFNEwrORp7k9zAONQQJ504+k6f5lmp9gvKn4pVBe4XfPNU91bE8L5ublQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArBuUVuZ;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D210606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D210606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ArBuUVuZ
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso13683517b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584708; x=1795189508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfsJcWiWo3pVKRPryoM7AoQydDYjteLi5x8NUPXncGU=;
        b=ArBuUVuZiAbJR6hF5xl+fsOERRos0omC6EHpUCOnkjQvHP2lGMMR9TpMlYIwNy1OSQ
         g7klN8V6lrpKIawpl336meSMdier8OIU6Xm/W/0VWlB3uLAcDBSnvmevB3I/G7uGyDaB
         eqf3rxU9GganHDDC7NsvfI0FcS62UKk685V126wPrlewz5eknck0USsHKkt1Ga3UMRrE
         Zctdfto9YbCBVhSBq2fDtDwdPzuwdt1CJNjXrHV41fIBZHHA7Lbhe0I5xmGB+iKWj2Aw
         Ppkm5qyTIH0cZOHudVCH6yxgU9k/WgbOltGXfkJkO3Nawi8Pk5uWa78AODFGvl4cbxgv
         GilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584708; x=1795189508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfsJcWiWo3pVKRPryoM7AoQydDYjteLi5x8NUPXncGU=;
        b=2NPtDlQmJJoeyzrU5Qhyo2P3KXt7mO24gPt/5ma1HVdESmQWibzG5dF6VmIN9TjFqd
         DmEIRaiiIgnEHV+Kab8BwMgI+Ce2CYOI28YoNcSPQy97rGSWHSFb3+cJDY3zRy7gh+gq
         R3kAGf30mcYsQWvutoq4Xr44iwzMtS7xhv6038t+JrFgWVsYBBY++VfQHGdD8AGUqqza
         f2h79MM+yJMP81qVNDuC5jCc8D4A/Rg058NiKPAUk3K7cEiKgeyfnxhrxJPl9eD18+jY
         uG+cmWQjCceJabwXWYrXxxf521iCov9TKiyIJHXT7juEdwn2ByLRxKjimtI8vXcdrkBo
         4qKg==
X-Forwarded-Encrypted: i=1; AL+hErEQgMJRD1qVEuyDIhn3nLTBUc0Nkl43TQMDBMHftdsJLiSTMLTrCK00kR9fvELiwm1ceOJiGwI95JYL2ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kNwdgwldJbdKWyamxMgTcrEwV+w5Ne0iAxE4rsFl6C+b0+By4
	jCtcKGEzZTWqueP7ybZIyGl+1nKXl635LmtuvqE0Q26DaE7SUwV/d3MJ
X-Gm-Gg: AYBFou2lPKkFB9TadhgiRbjZpLvUImhyvC15RP4CvDIfTTx4YFZhR4lLXlZ4HJPlViB
	kkWpOwxDYfleiNN/ctwhuhgpt4NiMDwOD5uKaf+gofnGi5iKwuKn4cFaa59PjjjlTKVn9M8onSl
	IAU+nMo/hReSZwIhgMXxfr3BTGOQqdDbDoIc94ZBGs/hSEyTS0fXpsGT2RdNc8k4Xdpda/u6Mvu
	bKU1vXfRqy+epORngs8vUN0zjqjCNmZyWnGQFCzOLRX4qZZYokGvRV3AhuuCtp7rGnleZz3AN3j
	bI7ZLKwJLka7y5q0SFibQYbpBQG1jrVX89wmhvw4Yxv+txdTtdtMsfjjTf7svSXCBRRgDfQy47h
	69GJhl4Llh9j2izEK2EhJTXUKo3JuOgntO4rqPEh3ff9FG1v3L54Gz3ji4NabEi2aYR6tZgUYA5
	JQxyEpFppmacjFdshsyie3hNC4W7rkyJjVmgy5jZg7XqpdL0VRaeobata2I7YLwjqYpL3LmLG+Y
	T9hqX+RHKPd2CpQSIs+k52ltU3ElOKUMP1y3UwaKV2Eij2pDeVy3WFbSiNlmYJKT1iAsvoxF+/z
	6vI8LgKPXqAwkdjpq115ncGnzft90PR/
X-Received: by 2002:a05:690c:c4e8:b0:8b3:5eaf:29e1 with SMTP id 00721157ae682-8b4aa25c264mr17934757b3.24.1794584708193;
        Fri, 13 Nov 2026 07:45:08 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:45:07 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:11 -0300
Subject: [PATCH v2 5/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-5-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=6412;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=vzIjLmWFSOX7Q6KoUjTuv+EQnM6QYoejqFUSsc1st0w=;
 b=sg58hm4Vc+Xkmyt5ji7AMipyZqNirhtACUMRUsS5Q4GGg/S6FTko7vm/p0KIGG87WsY6dtve4
 2FxxDenshHJCFY2RHf9s5rxYC8VKUzgpaPKI/Bndg5GHhLI9eUYoiNq
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
 arch/arm64/boot/dts/freescale/Makefile             |   5 +
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso | 129 +++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 51c74fbb8e0ce..2a4118add28b5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -733,6 +733,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -744,6 +745,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
@@ -758,6 +760,9 @@ imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-td
 imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtbo
 imx8mp-verdin-wifi-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
new file mode 100644
index 0000000000000..32828e9bc5345
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v2.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1" V2, used on Dahlia (X17) and Development Board (X48) that expose DSI_1
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
+	panel-lvds-bridge {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
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
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
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
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>,
+			    <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif1 {
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

