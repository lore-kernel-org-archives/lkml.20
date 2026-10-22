Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679495;
	b=iHxtbE/SHwVjKKMwhM1lMqxdeuTcIcXNsg8oyQXOnAsJ3EOBGlj44bRy+ZuQmb8e56WE
	 xqwXv4tQVIzIXjskLRiq0SjlMYNk/3a3tcPfqv/u7S3qD6UUk1KJRcGpLDGRRW88lBvH+
	 pBf4B2SuVnq2ITrFGHtProAxBFKbT3RvW73SwtEnzhAQWfQoXUNPw8mYiiROVH3FMWIBM
	 ChKpSM8UBtmNKCSzT01T1hIlMgov1RtXVbWEEG0vghM0CW63y2Mj3gGIs94Vl4dWTlVGl
	 1Z3w2NtJWlrc1J6YEQyksUh5pttkJ8oIG/6MePvR6iXn/apFeA+UaoWY51v8cTV494w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eFurNZ4Qi9WBAhlvk04LJ2D2k0beVmwbAr4QjxB3MNE=;
	b=qjpr/0EkF19X7frSPZ1HD9Yey9wEjs5a8t554I9QS2XQU/SQtft9pGRtoqo7AN14iXEH
	 eoV2lB6Q4ZY9hteaQFfcB+0vIApgPPdHjxhlXLciQUn9/B73DdeEHDiWSN0qJf7W8gh1G
	 YNrdYIS2vvfyUkAX0MuPJ/iRmQbV6q+XKUFraeIjKPbNeoGKO08DtRKHABMxGQAKX6zoY
	 l7KePoo+/zJTioCLUV7axY2ksOTXx6Zj9S2iKieLAxeRfMdfKbW7tbVU1uLTjcYwE9YRy
	 909gFE05Uk9+4zzNZIPFup4tdqEDeQoEeRcHPFnrBZyRbPlY1jhEmOeBgL2oGl6BASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aJivQMf8;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B50E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B50E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aJivQMf8
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so14920895e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679492; x=1793284292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFurNZ4Qi9WBAhlvk04LJ2D2k0beVmwbAr4QjxB3MNE=;
        b=aJivQMf8yMW8GmtEzrbMsJDGve0qZYytyTQUvp9A63+pYBqJFOZE5t58bfYTHrXDU+
         mrCwF4jSeBjOyoraRi3zTHysB8Tgn/PJNge3nNW8DXD00SvebOuDbjWRG+6nSCGFoWFF
         PnwszodfBnqhh80hoBvF+ybWwsJHfw1uNP/l/wcoDrJO7MlGf1KFkQA35FisLyhi6VTV
         LtKaPnP1cSW/x2Os3RkY25ektOpWX6LdMzuu8rZ34OrllSz71ID7FaJstQkP5fRSQJHn
         DdWolcHgjqHoSOxAZfDRV2FINOJtmCC3BlG3g9YhprI+3siU3NjDxavaTskxkMaWklA0
         2kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679492; x=1793284292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFurNZ4Qi9WBAhlvk04LJ2D2k0beVmwbAr4QjxB3MNE=;
        b=k5iPUvbrFdMipNsuWK/BhFRdPhxNTLxrrHOkrUISN51WbHkFqwBJcoTpfPFXAL8eIz
         DYwSjRipfJaR5zU+94Wsx0EF8780PbwzDvkXsvVT0OzkNxT0yhyX1ZZdhJoMeGtm9b3j
         GmsFJNUmty+DTFX8sZleBCS7qeUTKhavd7skENerMVreV7Kfb4ewGPAdE0TlOCAFEIJL
         Fq1o2F3q3veDDgNTnGy4i5UptvmXjC6eMun+wyoAAIhosl78LCxXbzNTOBjlFG+CBzVd
         Rr2DoUl6PV8AzYJL9VWze7KTtHqidukZ3v0r6y0nYv4wb/c6xHHUOXfglyU2DtJ8PU2z
         N+oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNCdb6Im1SkMLU2+Ci1Vx8NYd8Syk6OIEzCyrXXO4xaU42bNlOAOCnP1iJLhVMRGcv9qqivOBNesFAze8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtQTNLbeYeDw9j+emLdp9U4814HGCkCC6tvW2qmWDGR0LtLBC3
	kN1nQ+OPQ4fCQky3nnj5lmEykf/ZzCjPzRC5yud+HyX3O7VupthWSioj
X-Gm-Gg: AYBFou0zlfy5g8nDhvz2bVqmx/2KN7MkZiNrI8zWYwxbs0xoF4R7GoQvGwTP3P5/5oT
	eQrbAPf0+VsidxbbfcEylVAICx4uvpoZ52R8eqTiLL/2jaP59NTUUE/aQm3zWXFF4bYBkIMA3RE
	dOdDH/BktMx+TtZbe0A4fJNRUEXaQvbsyIpu0AFKXzrhFrhaQo5yLNChWFPNlK3jWIV0WVN1Kcn
	zi9OPoCmuewU01IdssSCgokwZ22OvnTrbvzhPoUkdVDaj9+Jim7zFoMIVIxeJVoZp8wQfAJEVZo
	Zbs+dwAeM3r4meaGtIUizau9PsMJdaSx5PKYgol2dguP9CdSH6tsF2z1v4kJg++ID+lOXwFzvsO
	nIP/oESgIckWG5RspM1ADyLeDy+B8ZxNJ2acSeIJex+qMp3HV7gEo46ndCt/YMgxU5F7dEtED1/
	5Iy14/dCyoueh2Z4L4fLaO4oA18QbADT8rW8XX2AN8g/ZHD2D3+j6bJm0GVUqt9+y4920FAwE+8
	xDZf2+GdwFcMcLrUlQZkfBtGTLP5JuBbe5La9LREJHLhtNvFyFOkt1TP3z6eAMqiZlpqqhSFIKF
	UBpdZpM+XaxI4bqZMji7YeOmZNKpipJ08DF6hmdJZVbYl51dFDr8Pn5H
X-Received: by 2002:a05:600c:1c09:b0:4a1:e3e2:93e0 with SMTP id 5b1f17b1804b1-4a1fdd3b20emr113399565e9.32.1792679492179;
        Thu, 22 Oct 2026 07:31:32 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:31 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:31:28 +0200
Subject: [PATCH v3 4/4] arm64: dts: freescale: imx8mp-verdin: Add mezzanine
 OV5640 overlays
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
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-4-90a30b0b0d55@toradex.com>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The Verdin iMX8M Plus exposes its second MIPI CSI-2 interface through the
Verdin iMX8M Plus Mezzanine. Add overlays for using a Toradex OV5640 camera
on this interface.

The mezzanine can route the camera control signals through two jumper
configurations. Describe each configuration as a GPIO nexus mapping so the
camera description remains independent of the physical routing.

The default positions share the native CSI_1 GPIOs and are intended for a
single camera. The alternate positions permit simultaneous native and
mezzanine cameras, but conflict with the Atmel MXT touchscreen GPIO.

The current camera set uses a 27 MHz on-board oscillator. The legacy camera
module uses 24 MHz, so provide variants for both.

Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 19 ++++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 ++++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 +++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 ++++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++++
 6 files changed, 214 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5ce923d87072..32168279f933 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -736,6 +736,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -743,6 +747,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dual-ov5640.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-alt-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-default-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-alt-jumpers.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-ov5640-default-jumpers.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640-24mhz.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
@@ -751,6 +760,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-dual-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo \
+	imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-alt-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-24mhz-default-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-alt-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-ov5640-default-jumpers-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtbo
 imx8mp-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
 imx8mp-verdin-wifi-dev-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso
new file mode 100644
index 000000000000..9579ad2f2235
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on the Verdin iMX8M Plus Mezzanine with
+ * alternate GPIO jumper positions.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso"
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso
new file mode 100644
index 000000000000..2079f9ead22d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-24mhz-default-jumpers.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on the Verdin iMX8M Plus Mezzanine.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso"
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso
new file mode 100644
index 000000000000..9f2372227a8d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on the Verdin iMX8M Plus Mezzanine with
+ * alternate GPIO jumper positions.
+ * These positions support two cameras but share Verdin GPIO_2 with the Atmel
+ * MXT touchscreen.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640.dtsi"
+
+&{/} {
+	verdin_mezz_camera_connector: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CSI_2_GPIO_0_RST (pin 11) - JP5 1-2 - Verdin GPIO_1
+		 * CSI_2_GPIO_1     (pin 22) - JP6 1-2 - Verdin GPIO_2
+		 * CSI_2_GPIO_3     (pin 24) - JP8 1-2 - Verdin GPIO_4
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 6 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+};
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso
new file mode 100644
index 000000000000..801beb8f48a6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640-default-jumpers.dtso
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on the Verdin iMX8M Plus Mezzanine.
+ * The default jumper positions share GPIOs with the Verdin CSI_1 interface
+ * and do not support using both camera connectors at the same time.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-verdin-mezzanine-ov5640.dtsi"
+
+&{/} {
+	verdin_mezz_camera_connector: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CSI_2_GPIO_0_RST (pin 11) - JP5 2-3 - Verdin GPIO_5_CSI
+		 * CSI_2_GPIO_1     (pin 22) - JP6 2-3 - Verdin GPIO_6_CSI
+		 * CSI_2_GPIO_3     (pin 24) - JP8 2-3 - Verdin GPIO_8_CSI
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+};
+
+&clk_ov5640_mezz_osc {
+	clock-frequency = <27000000>;
+};
+
+&ov5640_mezz {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi
new file mode 100644
index 000000000000..3902ba62fb91
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mezzanine-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on the Verdin
+ * iMX8M Plus Mezzanine.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "toradex,verdin-imx8mp";
+};
+
+&{/} {
+	clk_ov5640_mezz_osc: ov5640-mezzanine-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	reg_verdin_mezz_csi: regulator-mezzanine-csi {
+		compatible = "regulator-fixed";
+		gpios = <&verdin_mezz_camera_connector 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI_MEZZ";
+		startup-delay-us = <5000>;
+	};
+};
+
+&isi_0 {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI (Mezzanine JP3 and JP4 in position 2-3) */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	ov5640_mezz: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_ov5640_mezz_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_verdin_mezz_csi>;
+		DOVDD-supply = <&reg_verdin_mezz_csi>;
+		DVDD-supply = <&reg_verdin_mezz_csi>;
+		powerdown-gpios = <&verdin_mezz_camera_connector 1 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&verdin_mezz_camera_connector 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_mezz_to_mipi_csi_1: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi_1_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi_1_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mezz_to_mipi_csi_1>;
+			};
+		};
+	};
+};

-- 
2.43.0

