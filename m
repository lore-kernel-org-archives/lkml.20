Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68942480331
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408732; cv=none; b=uf3UvC9ciq3EmhhYDTthIVjOI+L9h3uyC8qUOlGFMpiAx5Gdk4TspZ958XaKbCUZOcTPdP9s/V0KqXqrtDLL+BlVD7MrnQw7XPE7zhF0Kv0l2kSp5f3U1ZE7Kr8T9M1z7F4bjrji5Gj3xZymJvqOVpM1+/2vPIpDTgWgaJM9Hwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408732; c=relaxed/simple;
	bh=gazPgJ3DS8KLEAMl28pu8yFODWHBBY3+9gNNd5HjOWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpmnGxrWnuwwmBjtG2u+ZgX4tdlrjUIvMz5FU74eIvvAtiPoXOdgXOH7A7FhbyP1r2lMUCfV8k/mnpzVqlj94GL99qqk9VCEWaSUo0XopLbX7rV3bOEAeMIvATUd8tBcqYMlfMu9r1c5Np3VB13h/DfiHBb7DAxsuZ8fxvYN030=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzSblMPq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzSblMPq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so24773905e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408724; x=1793013524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvDp0WFEeyAl+OoOvKN3vOw6sm+QjhbDzPXRSM8jJo0=;
        b=OzSblMPqil6gR7XHRq7gaJGuoR8ui5c1Eqnk6XFxvn3971J0sxKQKl9THbpJkAvk9C
         em1iFwo9RU6oozvxZh5LeWICBJzH0WLWOJU++4Kk+zVfR8tsX2xHAOkSAjNJO7yRkfdw
         fNNNTcpewTlO3gCWBdqFfPk1kFOkFdXzegU9TWd2oru+XKVLstDfujUuHvBmcUzG2hfi
         p/P0psUwqSCE7iVkRMzZBbl54JD0KdldfMUxfTcdKTIw7YPKvAMs9+4W9zaaCV5j1ykx
         pMiLSCuqDyZfuY7YODMZRmTNA6Q5XJuBeMiPXa8eldzj8vOBILmzScWtRSNz8eScnt2b
         jXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408724; x=1793013524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvDp0WFEeyAl+OoOvKN3vOw6sm+QjhbDzPXRSM8jJo0=;
        b=FZ82XGtH/0UGZZv0KxB26imr6etzPFRsGLDB5Em3HTvnQZ4TC8dbDACnfS1+S8DCke
         962ut95RSlEkHhtIwEuurnc05smi9RtQZYPSjXfhevIQhhaY9QU4+8liM7xgVDO7TXkQ
         1tS1hcEUKh6+F/orPS+O/mBBeEL3sDXxh0C6UehdE6KlaXPz5xB5DU7BkWGPgy3Jjuzo
         kg4k3ZUPkCo4VYjfU2BySl0JcFBvNUMpWR000q0aGYHGuMHWSj9Sz7D9Rncu88dLe5I6
         SzrvRjb/9V+SUs2aJdEjSThKcaAnAq8x5DShxPXCuNmHI4SU4LqSBKphORgV0Qeb5Pj0
         hwUw==
X-Forwarded-Encrypted: i=1; AKwUvBxAhRU0tuzKqU6LzZrEdv1szYf08TcE6hPLzppRDx/NoxG79OcN0tGvQ62Qq3yWreUVw68bcdEUGu/V2Uk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKruMayGWZpIeA8GmvTIHMO6TSAlIDpeKx83zHBoUhU+a2Rqcjs
	6Xkow+Th+Ti9IN4QXJsN91HqSYdAfxuVpnSsU/ZX3gM8RMTbPI9klwP9
X-Gm-Gg: AYBFou2ZKdyavOXRCGfmOWwTgqX7eswwLKB793ydNbatPSgqLXvvoi7P5YuPX1RA93c
	eusnhdTvy/K8zahNjFk72QhGor8N2sKc14CuHTJwl2tGPhIeBEDD7iw26nNQc9ag/dvLABNuHg+
	Vw4oma0JDf46GABD16ZcaGp4ZpcjXcGMXmJli3ZStl9xi5i9BlvdfOhl/O3gL6jYsCk5YoelSW2
	ndTnbkH2XkXJ3OiHsTKNHSU7IXAl56iV7UqFtnEe4ozFX/Ps2+JkKMcmhI+RgH09eT4EgkaQA45
	WlzhQ/7TOgh6ho3ibuJRBE2eh4RArgGCfD2pLziov8gAJnLRL+V6IrzRJgiIEjyEXoSWkGPVnlb
	D0asp3Om5FpsDEASJTNykxW8Kihsaqk/i+z4xRGhw19JWi+BVxl3oNqnVMcTjEHbwVm2JHhuVrK
	6tbB9QF9H+339jw7ukX0ZOykhdCuuxaz78AGMbPwHWjFF8rpwTNfsd95EE3ENjDXmfdah8lOxcT
	OYDQmtvE3KuPpOknfD6e72C7t0DGaN8/7NGHqGPppYQAPJZK/bC6zAO5dMIw+21VOR56GLOAUUg
	EORFyG4a+wfGvlW0sotGpg==
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1d75aa87cmr173201555e9.2.1792408724379;
        Mon, 19 Oct 2026 04:18:44 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:43 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:32 +0200
Subject: [PATCH 3/5] ARM: dts: imx6dl-colibri: Add Toradex Capacitive Touch
 Display 7" Parallel with Touch Adapter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-3-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4582;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=tztsGziNQEcNmWY0BqahbIqgqteAXBpXCYB6S3NjaSU=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qd//yk2n7UTMx/2TFWIXJbWnRq3JTe8fVqVxCcfo
 Zo9k0qiOkpZGMS4GGTFFFkynqgK8imEyHpwNCfDzGFlAhnCwMUpABOxrWRkmJbC/FhV+sWVskVP
 dvye6bT02PxTFiKS1fsNEu88z/pVqsnwz7LKsY+NQdNhx3s/38ZTRvd97BbpWNct4N3C+vyTogg
 XNwA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex Capacitive Touch
Adapter, the connection to the various carrier boards is documented in
the datasheet [1].

The touch interrupt and reset signals on SODIMM 28 and SODIMM 30 share
their pads with the Colibri PWM<B> and PWM<C> outputs, disable PWM1 and
PWM4 to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Link: https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
Link: https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso | 57 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 7897d9dbdfac..4f59ef0855cb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -88,6 +88,10 @@ imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -141,11 +145,13 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
+	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
+	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtso
new file mode 100644
index 000000000000..ffc54438d33b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector and Toradex Capacitive Touch Adapter.
+ *
+ * Toradex Capacitive Touch Adapter connection with the various carrier boards
+ * is documented in the datasheet [1].
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ * https://developer.toradex.com/hardware/accessories/add-ons/capacitive-touch-adapter/
+ * https://docs.toradex.com/104615-capacitive-touch-adapter-datasheet.pdf [1]
+ * https://www.toradex.com/accessories/capacitive-touch-adapter
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&atmel_mxt_ts {
+	pinctrl-0 = <&pinctrl_atmel_adap>;
+	/* Colibri SODIMM 28 - TOUCH_INT# */
+	interrupt-parent = <&gpio1>;
+	interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
+	/* Colibri SODIMM 30 - TOUCH_RST# */
+	reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&pwm1 {
+	status = "disabled";
+};
+
+&pwm4 {
+	status = "disabled";
+};

-- 
2.55.0

