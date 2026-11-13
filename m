Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584692;
	b=Ypoj18twqKBzzg/h19fWNrNKzRW2yZ1c4lbb4Used7kHR0dTTgyCH0LlNBI25Xrh/YtC
	 er3ADHYkPnfOe5EcMBGw3sM54OEtxHgfdfPv9R9BTMw66i1Vv4H335Z7MKAxMdcFQLF0I
	 0ZaUeLXDFAn8x8T7HXhTTMM5tEvjrnKud0T2VpIP3rI3c86fASgrVW1Jp09olRED4J2d6
	 JP+28XEKNvTEcIIqTiXMYsWK+ZY7FyqB+MPG6vPcRv2FxX2kgjP/xHxqTd6kGdA5sIy7w
	 Sv5d33IDC1Lh0UP9fA6PJFJv9rCG4JGuXMJZmqNv3zwIkFTlSF618zCrnJ+c5dJb9yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
	b=t3RaoiINISQ4rFWoqDvO63zNz4amzQVVC51XKXo/EGtCX2V4AU733Cx9VcumffKuTwmr
	 HrF/1wFyNM4O95KHz72SfkjUr2c2Ufc9zcGsZvyT9A+W54zIN74dCqYlegk4n3qWzrT5V
	 SEKo1iC3ua+HB0tHLhEZEzVhlifnLqVBfV30zTWHGEHfEzNWFeG+qb9xBY2fbdhW4LGD4
	 bikTcGEwwQ5rF885Ifei9SLqkO3+kTAaZyd0Uc0PGFhinVoePnbk+4KKXGYsift99zP8N
	 y53UZSXoP3gUgOrP2/IU+4pgSxRGY33IfficRZhnMbudZszpZvD4DSqpjx5jQRmQBjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E79belzc;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB77F606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB77F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E79belzc
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d126f631so11483907b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584691; x=1795189491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
        b=E79belzckzcp6rG3EhOHGtCJlnyOpt49fhRV4rexcUXpMot5duoPGEvOK2cvadQt+e
         Mckk7Eapwq19/VZCo5VHbr5To7PkRpwzESW+vKYXTFZcErIY86Q8Den00lraxwu1Idak
         Oy8NOAG38MZJ/KpD43zQlFUScsqZrCg/Lfw5h1HtO9lsRA4O8qGnBX74hBdig6wImcy1
         gzU/pBoMKUHvuCfOgEGM9lJBQu2wSVfE/OHpprt9N3rdMoHw2Cd1kSlb5pTxakIHBjfW
         DxfuJs+DSlZBD/QpqcHACha0MmS6R1l1V88y4jesrNTcorByNRc7xm2NG0228jd0CBWS
         4oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584691; x=1795189491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0mk9TaZ4jjNeW0s27BsKd5edLJnpGl4TDx2zVL7cGw=;
        b=Dak+IzNbihtZ9FBpa4fz6t9H4QGgR9XBlzmiTQz5ua3k37u/REOfl6A4F1+yMFGn0S
         wGIjRLWZv8EKjNOlqYeAHgIi5Q5EZFqpTWmLmv6uKJYjNPnt3lGhtAfw/Z9MPnWVN558
         KAWBi0ILwHc0TLyE5X1TyROFhDYzgIGPnmpy/t8XfP0gMOFPKzEvmPGGvScUh3I2+wiZ
         ITsgIaC0vq2AgHR0pLTkIvSP3n+/fWmwrotpSZwrt3sBb40TPHrJDcyw4Fr5xx1pzGJ4
         nqa4+CRHJEX1T8l/ftFd6QEYUA7MlXJGwrZ34Jho83kowdIoR4dz3F5iUBTxwNiLvaJg
         a3Aw==
X-Forwarded-Encrypted: i=1; AL+hErEIkEDRAlMzLcKUf0+fPSAAfpGEZW3MyL/aAT9YJGv0RHGvyeyebsoOdNhUtrh9PigEORiU8cFE4nhRAVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rWO56WvIq53OBJmajywh8vEUd25LgpAwfYk5obtpoIa/JhX3z
	RR2XaEYv9TFC7Gav1OE/9I1aifDFKZ3T9XJyQP0Oi6Ctf0eqpJtG0eEt
X-Gm-Gg: AYBFou29PZue6QdOry/2HdO5OVrw05V1mCtFSV8TmQHtETB8heOODkDlVVsRbsLXmJh
	gs9UqRuC8TcVRJk5nOf0Hnp60X7bEHH5RA0L3Dhh0GTxXlVcrdhfLGXbf0DtkjfQJDTxSenYAc5
	3dCky321JMocw0TUYyb4yx4d9q7NWaoihHb+fkKN2ukmuaftOV8MyS6TelSfIGH2+olEHEHua2+
	8u/PxgZE5PjxqNpMlLmV87heZfMdXIJQoXo9MZJQAT0eZH4W02cl4MU5YSAZg516ZGMirtPANSz
	v/XW9VUYUcE4fh+sBENKufa3T8RT6NNAF+47dn1E6OY0Fa958HD/OhOrBwZJVI2HxTLiBYxw1dG
	ziCPlte/UZXlGs54DGg1RWcGG8iOEsNpY9a4/WgW//9DDewVDL7oa0AdKS8mOUYN9Vzsu2j75X8
	Vx7k0ArltJNEM8OWhljZzkXtZ9Zq98/Ltgm3Zf8b1U7qFAaFkR1nej4KhqIQcN928bKCKJbZO/W
	uMozq54l8TT4qN/L1X2JXrtCOA3AMBO/iJIEl3hzrKhyZ6GI1zFhqNLnmwin1alhWzB6zb3ZmXP
	1pUM1HDyVKGOWyC+wowWwOz0c+nc9kFC
X-Received: by 2002:a05:690c:e1c6:10b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b4aa352b0bmr14048677b3.37.1794584690765;
        Fri, 13 Nov 2026 07:44:50 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:50 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:07 -0300
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-1-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5076;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Tz5ERP1gVTN03h114IyqCZCKmbVPmIkPUTjRMol8SJQ=;
 b=wR+GtWb98MCONzVOGNbUDPA93mS4bj4kcZJot5NE7c145bcOglNZ86saT0GQG4JZBxBfB/aPs
 MpDCMjXDL1vDV2oWrh7/oK8mtUXQwPIjueZ32LyQJfdDqf2tNuswd+k
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin iMX8M Plus LCDIF on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso | 95 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd5482843586..79ba27665f4d2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,16 +738,21 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
new file mode 100644
index 0000000000000..9079c6284dfae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin iMX8M Plus LCDIF
+ * on carrier boards with a Toradex standard LVDS display connector
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
+#include <dt-bindings/pwm/pwm.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
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
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 PWM_POLARITY_INVERTED>;
+
+	status = "okay";
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
+&atmel_mxt_ts_mezzanine {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+	/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+	interrupt-parent = <&gpio4>;
+	interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+	/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+	reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	vdd-supply = <&reg_3p3v>;
+
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

