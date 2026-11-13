Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584697;
	b=1LQ4etEcI7ABHOAGUvIQ5u7ZMxz8uqOiHDUxuCatznbAVIvS4VmMdt/0plq8mlR6gKTs
	 IjrKdjWIS2vyocUYkGBXnjotcLLw/XfrAN5O/v0EyWLBRIVmPhiQ1GFi6nuMKWOWi8L8h
	 bNQQSc2fxWzQvFlj8fqVicNj4/rHMiMgFc9XW/gcUacfTJFZ3xcDJF26g8Hiymt2qBOeh
	 IngjXJswaA0wc8KTHehuF0wd0CxYwwAhmSBIEFhCLHaZcNCKW4kc/2qpVB5uA//DtHcLx
	 ah5XrKB1jIfxrjB/mpm+Zs/YClMIpDvtZaE8ihsYuG1J/2qseOhODoBZ1qWVpgh7Y2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
	b=pM5oBcb8CMifz5Kk0cOVOEw1/cVOr2JnqWYMz5PmMQsdpQE7v3g7s9urBR75tUt+ls9M
	 9xMlNeXtnSdICcn8PVhEWT5cUe8mIKDGwx5FmARTHPFjD1sv/KYNFSOuqpHmVySKDZcm9
	 wEqFlFUqSys1cjQhWnYtMM+G6PAjl96ZgaymOnoeSfQeYK8pRdWZ5TuAn0M2P3DxgrBSs
	 +YnYd9Qep5KZunv2RiyymkhLlUHA5v0bPIduTAUbWt+w6HkbIlfQuAxsZ7V5a5RXgg/AS
	 avbONm5fdpCHfQ2jWtlSqWZhBZqWy79GrPybwVfz6wAwSKO1hlvs7wx6gMXkCogD87w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmFPDRsY;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7C1606A88F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7C1606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmFPDRsY
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b308fca7c3so10257167b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584696; x=1795189496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
        b=GmFPDRsYr2kM/ZpRS48pfe5JYfbSXIHtrblHI8lOgoEVNNG4m6Vw2XAdc7lSpaVxcY
         ZoDxREU0Op+VC1bEX+4V8UR/mNiTWHiPC8NEGb7QuugwMjL1b9pcYKx3T6I5xdjkJpd8
         965MjYMXQvuYRUdVQUOkJxImEdnb+W/YldDhmcM0IHSfiDFfQnQiTdpz8N5iIDdY8Ps3
         5wBNd3DvSIpw25rgHsPJ44DvOAJVHgvRgWMixu4gSd4dk1hJO/8jFu2+VmQZDDmSK/u1
         4DctIBwcYmoY9swKKsAMjllMDRknWwjtHn+RQueXp37slW9DEBtQaDwQap/QJ3IroRCY
         wnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584696; x=1795189496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzZaPDLW6Ok2/D816MTzOvdhBrNsHMyuYZFKk6EjbIE=;
        b=AZ6fs9tNAZOIf1ZjsHTsdk3GO+CZOLFrAH8sqG1vZgAfQWvejKEpGIzsfSYhIqwODT
         b6PTf5jjVyA+WimYvWpL8jFdxkJeZMqs41wAHEkklakCwJNML3bz/trGiL9yfIUZd8y6
         7YcIWoRY+96ZZAfA2O5bqvOXR6Jk0lDbPNwdNHNx3lUwPDBVS7EDH2aDVO2bjlIg7N6O
         2eIXmKPpTX7OFEU0m/s7y6ma8gHYeh0y3jxYGGEFig2YVLCaZ2HebGdAHMjxuY+pfqsX
         5irWsMZJAjKLHGq/tYz2pdLg3g1b3kIkWgJuwO3sZxAILh4MOOvah2aE7qjpuFbptnJr
         Dy8w==
X-Forwarded-Encrypted: i=1; AL+hErGfJ/F29RBIk+MPo5/654FN63rp7+8aZOSBlhC9NLpT4qhyPthpm5FQk+9wR9qoaHpdVKTMx4Xxkl2iKNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MRhVbVQ8xEilgV1RTmitj3epQd7cHxOPqROKiEezVVr7O1J8e
	1YKofLQcGRPc7WDmAlDlUZkm5uM4nPwEWNrqG6jr9nd4qtF6k2s7Fi/W
X-Gm-Gg: AYBFou2zsOVbFsYSm+OsV0QJ1EBUpWuLlq2NpOx3r9fa9EWgLeijUIhLBDSg1UlNWyN
	jahqksovnK1zMhdvNMZjROC5NW2TR3JvOuXEubPFf/Nski9tVm6/X5zBM6htML4xWd3/8vES2m1
	7DqQQJKb+hmkdsvS+T1uhT9UyMyyRK+BXwaWaJ5coiVSzS/s/CkU57JLUkCYKPd2R13fCgHinJe
	FWiWHK1C+OvZ5MyBXKnlq0nGY5Cr8V//lCVMkxFtdHCnptu3j+HXXqve2VRx6We14/XJL+dHGU9
	eU6rjfUTohGD3OjplSmLt4bKLQs+hk8Im7KMWjco/SIVKSJbgA4VdzeU5Fpqm1VYMhoJsF2FLyJ
	NGXacLYJWOFs3xYq6OTjaN26zZ1YoApa+bJI+XTKz4fSrMWGHizEfZ3vYO5jUiKMunRqvzoWbWT
	Vy7Gk8rwXAxM5bulAvwYCQR/dualsW2Ricx3VXtqRU5gyDZ4Un7Sumhr/3vzOdjGQTZQFD130p5
	1amPqUfzFVfx884Kxc+WUFVtuMAz6/4xzDlACpahv5BwCkKz68f7TNKy+3OSTuqvXZaro0B+AO+
	xL4j5TZN81SpYlKWJBjuJ1O3IRjD0jSm
X-Received: by 2002:a05:690c:f8a:b0:8ab:485b:9bc8 with SMTP id 00721157ae682-8b4aa257b89mr17110137b3.24.1794584695620;
        Fri, 13 Nov 2026 07:44:55 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa98caffsm22687767b3.27.2026.11.13.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:44:55 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:44:08 -0300
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 DSI to LVDS adapter with 10.1" display
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
Message-Id: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-2-59c45f0a0d8e@toradex.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794584681; l=5177;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=T1cPEZIk+cuERyGphRtG8eWr+AAKWp75eJwZYeMfJY0=;
 b=LHKy+f8d1gKR/GQgJynp2HgVYUNYmk0XOSunC+OOaw980MREimd2/L5xubXvJDkIdWBDQcgh4
 uRE4lIFrIVkD1TX4bIvf5s3tzcG6LCXacLKXzfpm83SN8yT2NiDNGMi
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 ...-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso | 94 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 79ba27665f4d2..4cd72926b80e0 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -731,6 +731,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
@@ -740,6 +741,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -749,6 +751,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
 imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
+imx8mp-verdin-wifi-dev-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mp-verdin-wifi-mallow-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
new file mode 100644
index 0000000000000..da05a02568893
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-tdx-panel-cap-touch-10inch-v1.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1", used on Dahlia (X17) and Development Board (X48) that expose DSI_1
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
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_dsi_lvds>;
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
+&atmel_mxt_ts {
+	vdd-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
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

