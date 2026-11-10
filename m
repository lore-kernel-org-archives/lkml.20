Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308364;
	b=z9ibSYaKxiNcQgFX1ObBvKHhf2jgUNUCkXify6HVr8TuehRCfADi5Qnv2y1S9eX7xoiC
	 RHjfCCN36nVeD5E6PlVPBfGZZG+lEq7UqjQl9a+EEHVkr2QTbDYiIJt4DrfWsYLXJCPHv
	 z6Lz8gq0HqtFszwNGSuGAIST6DRo16LEol8TgvlzvcabJj0Xsm0DMEpgC7K/jfM3AEmbo
	 XYGi8DM0+R9WAKk2gd/DAeIkOEav7ggcYOBpdctddDa34fp4xMxWuP2kE2HzEi41okTjM
	 SczzyWI+8t0PodlMdQ6Ghq3PhciEM7zohW5recTfYbso1RFY6WqxnruFsRhl2LQaqeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pvF6QhKLZwUOSdpU5it2yFnQfDJc4l9yR6jPH+WNhbY=;
	b=I0O2o6qt55aCp4qVaVsG+SfHSxyLgGJs3vAYstkLWFE83+Xb/QSsmhPNVbklv5Xsh28C
	 svXy/OL8TvAcjnlrvsbkJxVhkGQZrPsEW6wRmCblyBAB35Pcp8VASj8kQRyY82j+yT334
	 5rz9lR1L0oRwubYzfNF/0JpG+ibq1mr3/b+QIOOQ4GuYdmqECD/yChoT52TBWdDDAJhfX
	 kEMd/aMTgFsiFyru0Kgxoyh17lHxY6QCehOVcT1P23sF0JS2pRCFEx36cJTj3KH3dp9b6
	 Zkwc5gLSC6157uHgAGHcK86ArLDbxQUBOiBcPm8p6AztFN+DXkK+sGcTcwJgCTXz5gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nxe6uiks;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2995760A381A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2995760A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nxe6uiks
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1245635f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308362; x=1794913162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvF6QhKLZwUOSdpU5it2yFnQfDJc4l9yR6jPH+WNhbY=;
        b=Nxe6uikseMUheSg2vxV6HL1VexUTVPduXnxZ3w8EfD4rNVJxr9ytAdl+2XkblTP+6t
         XIDyRLPhpyVUWEHQBUbZh5wSpNmtURlaNKIEvaBhdDDoMh5rbFG3QHSGARQJ+LzhOEwb
         pCOCkwMcHeevUtee/8OJ2WCApv/2974d+G7SfqI2c7KvBZP1vLzH3wSLGwdVH8WFqmIT
         UaWmM51IDTqRWRTpucI0BOS5S2MgrglX5PN53lZOqoZNUAyoXkxk7c+ogCRiBKHLISbU
         cCKzfBxe5rnY1K2pJdTMr67y/NG2PT03AJVDSmy/q26CQ05z9fdWnTmmojSYBz6SXwqL
         qYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308362; x=1794913162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvF6QhKLZwUOSdpU5it2yFnQfDJc4l9yR6jPH+WNhbY=;
        b=QK+mGEVQjxAGheZUMReJR3o0/+b3Pakoe5TADl4I8/xLxu3hD3bQlVYVg/dP1ms+sx
         MYk6JYLx4L9oopYooJCFJ19kR8xFBoJvyVBXxdzaZHCigj4NAZB/472DJKffzYn7KCKR
         JY+G1u0Qx1eZ714TvUih7QbnqvDLL23SxHWRLW1KVfPTCvz/q9U09Er6msZ+x93zg5JQ
         wA2NWwder79yParIJ8pHXwu+CXGtbmTjSjwnf4yIZZxcvJ7/V4i0M/3SoIkqzjkDGGKw
         YITvyTaEFI8IYl5pulkDwM6N965200yP4oowfA+CUWVUbVvCYMjD+UXTLPR/HBWyUuyx
         zzvA==
X-Forwarded-Encrypted: i=1; AL+hErFQldnTz28jrQKqmJhBiejvSqfQ8kB8xbLXPIsNE/+3RKwMh0J/pZYTfrLyPJBFkMlyPh6akaTZg7wS98U=@vger.kernel.org
X-Gm-Message-State: APuU4Z91vUuuYKXARzlU8vPC4f+6P+dBWXTIZfxpL894cq8ZHCrDM/K+
	psvDDbUTSIa+O8RDkKwSipxXsGQVIITmHBpKXp5579VjpWuPU+W4LMmt
X-Gm-Gg: AYBFou1maptQOWiEsU3xGXbwbu1clpAbUIDwoIubIr6zHt9sAiL8OAiiiKBmzulEJ1K
	CBLiZnY6HVKVnXlnvLyLUowyjMtKwCIeRyQYNS7AwbfPR5MGzRr9qFZ6UyfKyBay0JsPSyJUzYQ
	YMTUXtbJA4YIAibMkoGykwYu8Dv+7aVjJaBfD+XBsGDE0akYTSsdOzW8x/Q4q+F4QDHXCCwAk0O
	1P5wgAl3TY/LGUWYMUgjSO0sr5Y/UjYUDxNITnlvZcw+CYjg5x7jaifZoKLLl5jvpLivbZ9Ikdr
	GSNm386+G59vGP97rJhDY6wobg9OmRfEr7aG4iDGAr4kq8zw/QjaC/g5ttVsbPTfcQBpX+6q/vv
	b9LLRdo9Sfp2yahlqFjA4FMehGy0XzDsOM88+SpNU2SuX0D2ubxJvwSSTehVByDMSUhPYr/GM4w
	A7AS+DFPLIVkbvJ1QZvPNyb8toUJ/cD84lqAktxjz3Cv/IxGeNa8AoTEBcQKy3QiUw7AzffQj8M
	+uL6EXlwjgsxPO40sp8JgV8ed+z4MwdqvDyfhF2bFJwzaYkZEAG40IIgRYam29HNoUQSFxef8C3
	DIsrc3oLauEkZg2FLjs06uN/UXPXozX0SjZlllXrdGNYf2xwVffQ+leMwUD1RwcI3ghJOA1uJFX
	vRLp+GKgCB3NKG3JVoibyi5LFw5KH5nHNbCk7mUbrnUVTKDP0lng=
X-Received: by 2002:adf:e00b:0:20b0:491:273c:9649 with SMTP id ffacd0b85a97d-4982ecf6922mr2926241f8f.15.1794308362368;
        Tue, 10 Nov 2026 02:59:22 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:21 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:18 +0100
Subject: [PATCH v2 6/6] ARM: dts: imx6dl-colibri: Add VGA overlay
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
Message-Id: <20261110-colibri-imx6-overlays-v2-6-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4935;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=BTOXFn7FRMReU92cBtLstQ5vnpngA8gkkNTJbTILgmo=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JPZo//o0vZ5PDcNAx6brspzm/9t6edJf1f6+Gzfs
 PWJkfSuNR2lLAxiXAyyYoosGU9UBfkUQmQ9OJqTYeawMoEMYeDiFICJKEgyMnSkxU3lErp3ny+r
 IcJp+ezJG2qS4v+l1a379uVgXhXLztcM//Su3Xp7TElgf8qi1XJ+R7jXrJ6u2c+7TUo5/vgJi9B
 di/kB
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX6
parallel RGB LCD interface. The VGA output is driven through a
non-programmable video DAC without VESA DDC I2C signals to a DVI
connector. The DAC power-save input is driven by the BL_ON signal on
SODIMM 71, like on the Colibri iMX6ULL and Colibri iMX7.

The overlay is also combined with the Colibri iMX6 V1.2 Aster,
Evaluation Board v3, Iris and Iris v2 carrier board device trees to
provide ready-to-use DTBs.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                | 21 +++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso | 67 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c15b09c058eb..cd4c8062e678 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -84,6 +84,10 @@ imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-aster-vga-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
@@ -96,10 +100,18 @@ imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-vga-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx-hdmi.dtbo
@@ -108,6 +120,10 @@ imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -154,15 +170,20 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-aster-vga.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-eval-v3-vga.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-vga.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-iris-v2-vga.dtb \
+	imx6dl-colibri-vga.dtbo \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
new file mode 100644
index 000000000000..f22f1969a6a8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ *
+ * The DAC power-save input is driven by the BL_ON signal on SODIMM 71.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		/* Colibri SODIMM 71 - BL_ON */
+		enable-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcd_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&lcd_display_out {
+	remote-endpoint = <&vga_enc_in>;
+};

-- 
2.55.0

