Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081647125B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256125; cv=none; b=ZC2I4TJFRp+4ZZNM9YmEWV3KtIDOjVMS1c98pOB06Cbw7M8hRRcBRYJ+aEFIae94L4DxYdcuGfcbyZsB0VBJVsCYE2VdnbqpgHtsRa9casFHZnQrBAgP2EchAztaD4OFtNjb48MskMo7Z09TfjqmPfY0UoE2MGr69jW6M7By3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256125; c=relaxed/simple;
	bh=iGT1FRX7jJCP3NO1p/Q2RKrJIpvEFGaB8Y7gkSH6xcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UnyO/Ks9BQ5G3wn/zppCarhC8XNkzhSj3gd5RsFdptxlYmqJ5VEM5AFnn+i61g30yJQrRcfBNsqPKWpa7XnX3pYC4sRHSH3+8Hm/lqIereiaMZ0APc7PnA4+c+krwsq+qvA/MuIVe8FMWshGjYCHVvYwrCZEBuEXdHvHkowmKXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHPrVpHx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHPrVpHx"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d01663d816so5184355ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788256122; x=1788860922; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZpqxQoA2pYAwfyAQrGPoeItEdZO7LP1X/h7d7UP/hgk=;
        b=gHPrVpHxsPrK9FnJUaAYS7pR9YLp/SuDFoylpLI0bt6oY9nhUE2AV7Au6feXGSlcqI
         Iaow+ZkGChP/VhamBnBWpxi035x5Ds8urnYCWYfgI57F9iV+b00ypyMcMM8F4rHkr72P
         lSxZGL0HcsNEbamNuOOht3Cd+wRbsmNJVIm6K1lQwwScD7xTnhhVjD1dQJztyvi/1q8L
         eX34fE/GViGfMxTNu8ncqA/FnIIe+j2v+EqgFmnpTsYhNvL4Te1GgAKR5Hf0fFnxFz5E
         seMguW40OSPqxTZXtbVNNuAej+CjTFoIxDAuYrVg970C806kqJzEBVqFvwq+KdnZkKY4
         vgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256122; x=1788860922;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZpqxQoA2pYAwfyAQrGPoeItEdZO7LP1X/h7d7UP/hgk=;
        b=czaxpHY4yJEDvZ3XiLuVJGnJbIpsUm2xW6vCX5+EjJb2f/n/WHmV9V+jK+NprxEtta
         CjemRwpKUZpUOV9QfW22ZmDD1R3VB3Vk7S7XfsVm9txQSWxb7ApJxv8+erJSlfmvvfh3
         XW5tYh2uBNYlz7R6T5JbZxJMn6p5D2HlIDiSAP4XBfoIewas0EZp+sEdoeQM0ihoW78b
         6bXbuIxfQwtUO/wigL5f3mL5x63WD+52N+JgOaWebzBFtLBJ4ueD4XlZkYdrNNqa9s4r
         wEe6hKNJRGWELsNTTGfhx4dRAwMoc/2odYioVPsl/cvFhWOomaP9Y5hfp/m/EBz1STfH
         BZdA==
X-Forwarded-Encrypted: i=1; AKwUvBw4/Rh2vmb8ZgpMSAfSazC5DUv/Wmw7RzqWsWiVbqpxCfz64X6c4KxNbMutrmP1PUm7FQIwd4kFms3NN4c=@vger.kernel.org
X-Gm-Message-State: AFuF++kt1pEY7RO7hfQ2QeLKk1CTl78CJUpnqKA0X17DP3p4OuJcHLRe
	MpjeY6f5Z28nnf4Yfleo67+mQiugZAzrXjSkoAmuLVumwvBC/C510jit
X-Gm-Gg: AYBFou1RJD9hYaSBE5LVCl8ljQxIahbORqIrHOa0u7bN8OHDhQ5wscq8TqVA9A7Ctgk
	DA8nM3Me4XOERMYISdieb+55bx8lAFLfi+H+s/zhe41BfAptg0zVproWNLbRSFPRpkcnN85jCKH
	aHWLHb9+NwONMDLdCchwQRPEuh3i0Rfb1orhwTwXRYkQDSXSKRRt/Y9k59HYU52ZzjDWMJVROYm
	vP//zayx7aiDGm0ZQ8tJjKFCCWwswFZAmeajcgLuxLqRncC61BnMksLw3li3WmdPU56ezbJPPxl
	mBK2StKydOC1PTqOb8ksa9W2kRjIpRqPEsp4lOYghkSJOIsHO6F6C8k7lU2bFsve6mQFjBN0FCs
	DmHJ+2FcmgTERzkXZCxcCet+uviGQym9Y9olKtn6leEeRTlZvlou80QaOE9ttj3bbeRrQD0MMnj
	xRSRIcOcJXx/oXMAeL9Sqb8rl/PDZs4+dasmv2F9ETrcaLar/vllHp5f5Hqu9sgqRdGVno
X-Received: by 2002:a17:903:238a:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2d91dee4591mr213553185ad.18.1788256122533;
        Tue, 01 Sep 2026 02:48:42 -0700 (PDT)
Received: from [127.0.1.1] ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm42595632eec.7.2026.09.01.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:48:41 -0700 (PDT)
From: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
Date: Tue, 01 Sep 2026 15:18:24 +0530
Subject: [PATCH v2] arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGiflmoC/3WNywqDMBBFf0Vm3SlJwJh21f8oLkIeZkCNJKlUx
 H9vKnTZ5Tlwz90hu0Quw73ZIbmVMsW5grg0YIKeB4dkK4NgQjIlJBY9xoxpISzxZQJaysuoN/T
 CK9MqJhizUNdLcp7eZ/nZVw6US0zbebTyr/01u7/NlSPHG+cda72TVtrHMGkaryZO0B/H8QH0c
 WzkvgAAAA==
X-Change-ID: 20260826-talos-rpi-touch-display-f2f8c580200d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abhishek Thomas Varghese <tessolveupstream@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788256118; l=4128;
 i=tessolveupstream@gmail.com; s=20260826; h=from:subject:message-id;
 bh=iGT1FRX7jJCP3NO1p/Q2RKrJIpvEFGaB8Y7gkSH6xcA=;
 b=mL3q3lemYNFfjz0l03jaA/upr/e/tAO9wKyew3EKEMoK2ybb5C0vOdMIJaqLsdgp1LXWSRExZ
 Oz1oFUHtv2WBPlLCmk2qF0MrgbkQ9DqouvfgrMVfn6RrbfmNkQN4gW9
X-Developer-Key: i=tessolveupstream@gmail.com; a=ed25519;
 pk=0KMY9Olg1jw9bWLd5hZXnm7zZLgGk5yq+WqoY7YLkzY=

Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.

The overlay describes the display controller, panel, touch
controller, power supplies, and backlight. Disable the ADV7511
bridge to avoid a conflicting device on DSI virtual channel 0.

Display output, touch input, backlight control, and concurrent
DisplayPort operation have been tested.

Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
---
Changes in v2:
- Reference the existing hdmi_bridge node by label.
- Add blank lines before status properties consistently.
- Link to v1: https://lore.kernel.org/r/20260827-talos-rpi-touch-display-v1-1-911705fe6d6d@gmail.com
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso | 88 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55d539f5292816ce06c9a46bd4904c..7fbf79f65ecb8283e572554838c044d24298d360 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -421,6 +421,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+talos-evk-rpi-display-2-5in-dtbs	:= \
+	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso b/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e49da096d9e38476373f8b10f0fb5bec994949a5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "raspberrypi,dsi-5inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_display>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1>;
+};

---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260826-talos-rpi-touch-display-f2f8c580200d

Best regards,
-- 
Abhishek Thomas Varghese <tessolveupstream@gmail.com>

