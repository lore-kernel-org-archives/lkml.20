Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4824AB1A9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947942; cv=none; b=CxLasQtzX72mROAgWqgEZoAbtFI7iiwexP9S3ceu4k03okjngy4K+NlZpVwJmFEGEIQZf0P1deO7C+7cGrb2UOCHm7K3iV+42sKqTI3yZEcWqFxjpNO1+mjJ36UxXELx2dKx20SEBLdWyHrmMfKleVzliOTQvkV7OXg5wdZMq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947942; c=relaxed/simple;
	bh=DiAB0qflJ662j+l2WxyGH79c8v/pnQ16HPWoCMXaodI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhzCrfaqQ2PA4jlWfoNznkHLP/j7lsa5uaTZyqJRp/p6w6snZ+djimSlIQORC81QYUpnjuphjK3N320lBbydPWuDEP9hNqyeosG2IDDSr953GjKU3pWWk3QiMvyxAu89DAQLmhpMQWQ4F8Yr9mTiTZ+6j7B2+62ITqoKyknsDng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDowp6Oc; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDowp6Oc"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so500800f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947938; x=1791552738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zayP4WDTOu5O+niuDClNFcuxUww+7ip1Eh7ZVrZJwtg=;
        b=JDowp6OcXK3C0+rVJs+A4Uyyk8dYx0uIGSKCEnS7MZ0k9vvBSUGO5+sZu8AczPvRpU
         1MGbWZOvGt/Db4Tf4HFcTYytPrV0tGbmlaDym7xRcK4R2wGnJtoWHEq5CHixtLsFv4U7
         IpQ4yMqVTN4aCPVQ359nQOV+PTGX3RzWjYMObUeQAqJToDe0vWS34Na0iSKhKODO2txc
         sNufRcBttio5RaVxEQN+ureluBSHDbqQ4Pg1TPfJ7pNgLBf100QBrMr7RDPJyxiiNZag
         oAfFMf7qaUoNphZ0t7kN/yzSK/m2844cn6kgKbUsTMNG3jhvpUno0XU2GmnhlByd/+Ct
         AciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947938; x=1791552738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zayP4WDTOu5O+niuDClNFcuxUww+7ip1Eh7ZVrZJwtg=;
        b=aQwT7/r7kxZ3bIMVYAx4eYGPiSFmL7uK1iHUL3bTjf0adkTof9I6RRSYPhDoBbye4B
         /04du207ffeIVLgkrosAgbLt4fy/9u5hnTtrhChYRiaWkN0QRjLb7uYvX+hQNmJup6Ch
         6ZC7UIGEk9vOg5THP8zq9iaQRayW8+wRsuhOQJXoHa6WmhPy+A3d88Jw6S5Vm+sFTuKE
         QSaKod09a17AyySk+apD1bH7CeFcbbNLqvxCzxG7rQFIMp0Nd3hGSjh37I4839SZ4UNl
         n9WixFfaS5AUW/fD8LOXagVcwvwOmYIlowVDwzq0jO2f5PCDtz+OHyURBePKzZaceO4L
         hSig==
X-Forwarded-Encrypted: i=1; AKwUvBzcevVRt7JO3Cl6Gxy2Fz9PHLG78sTfEUpzSb3kgrXntr6cFlWuCX3xUHgWlFByOjyLFoCUmkj9uvfoCy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNWIhXgDhsWG1IDYahYlEpCDRayi9zyZ6g6H0fDwuZU97YTb16
	qnxjeLi14HkpcI/gYVFPBI0nJcp6R8ySyTG6jh7kGa/bnuZjHxwSeLeYcUlTs/nlM7o=
X-Gm-Gg: AYBFou1NDn8Kxm8vjz9ZXq4i28FWii0pO+jUP134DMz5MU4uXd6AD17Hc/cg3MNAs5X
	QNqLQKGlVLqr/euLqOyvK8RzIT05i4ChsF4QxN5NqOt8YSdnv/cclStt/zkWFmOWaC5xK5F95FK
	hFUQZPU6YI8++BzBYn+FK32VYoQA8xs5fs3cwO27/Y6D7vv/0yNUvdj1bMYAEt85LbqKrYRZmrj
	SPQUIYbS7Bc7JEiNhZ9fXdvDGlj286qvECDIZQtJXCwwFKfoRLxZmcxYRvXkj353MvXPfQ3V7aN
	CLdANFApyAz6fM2rPmk2Fpl+iNd460jJmM4viWAgCirFtL3CeB9aYDkYZcuzuFubkP4x3DEBVMi
	kZTYUxyJeghHItBp+INxgzTm4zfshg5pZ8SQU/aVQuzXTCo6QM0SdFi9A4Ap4yMSpLfKGr4Qamo
	+FFOmXS+ACAe/+1aEkfm17zRqQhPP8UQJz+EPCo4XX1KntOgs/RrOms0r19hveJD5TsGLpx4zWq
	NHkG0C0ZmxUNOpCJaXlGwdllJ18qcLMHPocUkryh8IkLWm/igd1P85b0ZWbhOKY1P1p11oZYA==
X-Received: by 2002:adf:fec2:0:b0:48b:3f2:2ec7 with SMTP id ffacd0b85a97d-48b1274a1a3mr4164575f8f.31.1790947938402;
        Fri, 02 Oct 2026 06:32:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 15:31:31 +0200
Subject: [PATCH 2/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-2-a0e89182c625@toradex.com>
References: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
In-Reply-To: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add device tree overlays for the current 27 MHz and legacy 24 MHz
Toradex OV5640 camera modules connected to CSI0 and CSI1 on the SMARC
Development Board.

CAM_n_CON_PWRCTRL (pin 24) is an active-high power-up input of the
camera module, so it is described as an active-low powerdown GPIO.

The overlays are also combined with the SMARC Development Board device
tree to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 16 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 5 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 1310b34178e5..357d0afbd41f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -711,8 +711,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi0-ov5640.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-csi1-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi0-ov5640.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-csi1-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
@@ -726,6 +734,14 @@ imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := imx8mp-torad
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-toradex-smarc-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-adapter-panel-cap-touch-7inch-dsi.dtbo
+imx8mp-toradex-smarc-dev-csi0-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi0-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi0-ov5640.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-24mhz-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtbo
+imx8mp-toradex-smarc-dev-csi1-ov5640-dtbs := imx8mp-toradex-smarc-dev.dtb \
+	imx8mp-toradex-smarc-csi1-ov5640.dtbo
 imx8mp-toradex-smarc-dev-dsi-to-hdmi-dtbs := imx8mp-toradex-smarc-dev.dtb imx8mp-toradex-smarc-dsi-to-hdmi.dtbo
 imx8mp-toradex-smarc-dev-panel-cap-touch-10inch-lvds-dtbs := imx8mp-toradex-smarc-dev.dtb \
 	imx8mp-toradex-smarc-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..7e6991b95dec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi0-ov5640.dtso"
+
+&clk_csi0_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
new file mode 100644
index 000000000000..23b155beec2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi0-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI0 connector J45.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi0_ov5640_osc: ov5640-csi0-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM0 */
+&smarc_csi0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi0_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_0_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi0 3 GPIO_ACTIVE_LOW>;
+		/* CAM_0_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi0 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi0_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi0_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi0_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi0_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi0_to_smarc_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..f6bfc3d49f5e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 with 24 MHz oscillator connected
+ * via Toradex SMARC Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+#include "imx8mp-toradex-smarc-csi1-ov5640.dtso"
+
+&clk_csi1_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
new file mode 100644
index 000000000000..d78f46a764f8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-csi1-ov5640.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 connected via Toradex SMARC
+ * Development Board CSI1 connector J46.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_csi1_ov5640_osc: ov5640-csi1-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <27000000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* SMARC I2C_CAM1 */
+&smarc_csi1_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_csi1_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_carrier_3p3v>;
+		DOVDD-supply = <&reg_carrier_3p3v>;
+		DVDD-supply = <&reg_carrier_3p3v>;
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		powerdown-gpios = <&smarc_csi1 3 GPIO_ACTIVE_LOW>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&smarc_csi1 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_csi1_to_smarc_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&smarc_csi1_rx_in>;
+			};
+		};
+	};
+};
+
+&smarc_csi1_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			smarc_csi1_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_csi1_to_smarc_csi_rx>;
+			};
+		};
+	};
+};

-- 
2.43.0

