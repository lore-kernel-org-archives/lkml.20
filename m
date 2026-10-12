Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7B64CA768
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828679; cv=none; b=iYWM1eu4px+sVc+I2HAgT4YeI9qxeECjEdXJfHp7fpB1YdC6aVMraoLpI/AVOgwKYfngXdxPWo8pVPH2fG3ZR60UvqS2/vAq7rvSx8CBjbTatyb6rwv2/txqg53sQjQjt3Uj12SC6lsLk+KrRi10vtF2HGxr0zXtGiv/U8vLL2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828679; c=relaxed/simple;
	bh=me4kgkDxl4oTqvv2SgWOYYHObNOgTKdHxOxZ7ZE6Y7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlyvRBYOLw3+rL3XvE2JiuYgefqddU00Sye1qndNlu6eK1T7jIf1rKh+KUpP12ryXk0CmQYQQnHH9MLri/cygjudXRZ1v/htRK8bbgIpKCktZ/rzdnRoHBMqEvHUKJYqO60mDNm6bBX5DpoWFIz7evkroyZ/2RkqihaJFLzlVdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1oFYc5pb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1oFYc5pb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2861876a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791828675; x=1792433475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3a82ddz5GrnUXDGUPzMm5pep0Z9lqtKy5jkX8QwoyUY=;
        b=1oFYc5pbPwC37cyjAkBRa2fAbFlAkzt9TBvoZ0ZFku1DOYyu4S+PyUk+ASQqfyxgOm
         iHOHoxLvDOLKnj7H3+v7zc4+unrOMHL2NOam7RzAdcrOe4e/9nMVAHIgsbMq9rZ3Dj24
         tS5bii5Bv8dxsFDrp5bPBhiJJezqKHFCVoQI+0IbCq9R7HRIypvDHEPCfWEFFcegNXPN
         aoNSisCPkV/hiRV0NtpY9kR+XAxPZEudACwsJT1yjOGFHyfgb87sXVYTNByd7bL9t20h
         sWrvu48LHbjhHw8QWZ2l4ORp5P1kOHXeD9h+wz+oAIyQ5bE3ZblM+nn3sxw2OSy2VFc8
         oWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828675; x=1792433475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3a82ddz5GrnUXDGUPzMm5pep0Z9lqtKy5jkX8QwoyUY=;
        b=IDqab9xNljcioiuFY4dR8hcNdXNH7Liu6f6EejmBC9USLXEPCSDJrq0FVzW2D6HW4b
         bLkrxPBZIFv7zunDUVRZXH6sefSuWwfIw4Uxu0oHQrkymJJpn7Jge8Ho/RqwDXmKx4Ic
         eWTSauA2VF4zQc+ot25K3x1gU2HAv3uNM+4E51JHVp+hli+wf9j5a4YTcc5+eym8LfOA
         epBYNQGGdX/snJF45gXgExvU2oYugdZF+jQKQQ2G1HB0f12Bmau1QuCHs4i5CmYEnjoW
         3bou1ttJqcnWW5G71xK71NaL8MZ5WSkF1DIzvNFa9D0SjmJlVe1AKxkHpGW0JAjaeGPZ
         k0nw==
X-Forwarded-Encrypted: i=1; AKwUvBxbUmanSyH85x4AbimbTRuymzsoi9xuukJHWma3NGlEePuQKpMq/+64/mrL3JrYGLBGOjEf8fYfRT5iK6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkPWm1Lgn6qmN/p4jZ4VgmDuv2CzhW8FwPKpGZh92oH+3ylw/U
	inEx82aJE33MoJS8lmRUuD+NMj5sn9pi/7apgem9oLzVYk9ZJKc+29i9DC3AfgDETnA=
X-Gm-Gg: AYBFou32fWo5FgT2XIQAFR7Jl58Ry20X6W/zPYnBP9igo6uVfYwf4+WvWve+ZSxfyIo
	pZDssrQPxUBHJGHaRMuSioHzdhWHKH9drS/mqf/iFRrWT/qo3daIspg8YHmphxrlwSHjEaQHYAN
	l6kscG0Z9kVUe/fCsAFiGfXvBdT55xAdfcN7mh8RW22wZey5p9tX3Rh4cAZ1VXuOO+bBuWFIZJ6
	ElcVxZiONrJe6Mz6fBQP968pfzRsNPUX3fGQJbNVopEs8AswBAOXBG0DGn+UA2lURvXxM+sIDtA
	kV6hNIcRukPGKJ97KddIJXV2k8qhodE35f7tf3LOoHz2/IagZh7HU9IBqBK/mJ3+YxNbnpJnYB3
	kVhU2ICnahjd+rZ8x9N9njFreDv4XIRM9SUIxFAyBECWi4igXCOnw6jjZWZa8dY6igJWQZYlrJ0
	r8RN0n1nQcihZCv+SIEuOXIbwD+v1OeHeoMlAJuXXxhHDIQm+b08G9O6iSX4NgEnfzFQZlMhIu6
	pYV8fTQ8nDtbmuQowkXQQKmqC43lm+vLgh9ESPHc9mypApSo3h0yyd5ZoYkBpaCfunmqVPvtECq
	VGhmZbtLiV3CqQSJtbXG
X-Received: by 2002:a17:907:d8f:b0:c29:d31f:7d73 with SMTP id a640c23a62f3a-c31a9fd5dc1mr1021443466b.9.1791828675437;
        Mon, 12 Oct 2026 11:11:15 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm498415466b.70.2026.10.12.11.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:11:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Oct 2026 20:11:05 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, Jasper Korten <jja2000@gmail.com>, 
 Federico Amedeo Izzo <federico@izzo.pro>, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828669; l=15911;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Y6IkfJVo8OdD/E5asQkmfMjQa0Pptj/sIYcLSB1GiEQ=;
 b=o8udCmoEQniTklG5LQtU4+NXjB49mpF3nyRi64VwOB8PpUs055HvzbRuiXWA85PEQtGHO6Hwd
 jphrC+pmASJDkI/Vtf6gP99mcKGUKXg/Hmmixmbu6il54Z52LXYBvfe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Jasper Korten <jja2000@gmail.com>

The Samsung Galaxy Book2 Go is a laptop with a Snapdragon 7c+ Gen 3 SoC
(SC7280).

Add initial functionality:
* Display (with backlight, GPU)
* Touchpad & keyboard (without Fn key mapping support)
* UFS storage
* SD card
* USB Type-A port
* Modem and mobile data
* WiFi & Bluetooth
* ADSP & CDSP bootup
* Battery fuel gauge
* Venus/Iris
* Lid switch
* RGB LED (Operating status LED)
* Webcam (USB UVC)

Notably missing:
* Speaker & microphone
* Charging
* USB Type-C ports (except when active at boot)
* DisplayPort on right-side USB-C port

Signed-off-by: Jasper Korten <jja2000@gmail.com>
Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/sc7280-samsung-galaxy-book2-go.dts    | 643 +++++++++++++++++++++
 2 files changed, 644 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..8e54d9ce5f3d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -287,6 +287,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-zombie-nvme-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-samsung-galaxy-book2-go.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-lenovo-flex-5g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-primus.dtb
 sc8280xp-crd-el2-dtbs	:= sc8280xp-crd.dtb sc8280xp-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts b/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts
new file mode 100644
index 000000000000..fe1a1b01f67e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts
@@ -0,0 +1,643 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Jasper Korten <jja2000@gmail.com>
+ * Copyright (c) 2026, Luca Weiss <luca@lucaweiss.eu>
+ */
+
+/dts-v1/;
+
+/* PM7250B is configured to use SID8/9 */
+#define PM7250B_SID 8
+#define PM7250B_SID1 9
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "kodiak.dtsi"
+#include "qcs6490-audioreach.dtsi"
+#include "pm7250b.dtsi"
+#include "pm7325.dtsi"
+#include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
+
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &rmtfs_mem;
+/delete-node/ &wpss_mem;
+/delete-node/ &xbl_mem;
+
+/ {
+	model = "Samsung Galaxy Book2 Go";
+	compatible = "samsung,galaxy-book2-go", "qcom,sc7280";
+	chassis-type = "laptop";
+
+	aliases {
+		serial1 = &uart7;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			label = "Switch Lid";
+			gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+		};
+	};
+
+	pm8350c_pwm_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8350c_pwm 3 65535>;
+		enable-gpios = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pmic_lcd_bl_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reserved-memory {
+		wpss_mem: wpss@84800000 {
+			reg = <0x0 0x84800000 0x0 0x1900000>;
+			no-map;
+		};
+
+		rmtfs_mem: rmtfs@a0800000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xa0800000 0x0 0x300000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+
+		ipa_fw_mem: ipa-fw@81800000 {
+			reg = <0x0 0x81800000 0x0 0x70000>;
+			no-map;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7325-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vreg_l1b_0p8: ldo1 {
+			regulator-name = "vreg_l1b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+		};
+
+		vreg_l6b_1p2: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vreg_l7b_2p9: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_1p2: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_1p8: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l19b_1p8: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_s1b_1p8: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1872000>;
+			regulator-max-microvolt = <1872000>;
+		};
+
+		vreg_s7b_0p9: smps7 {
+			regulator-name = "vreg_s7b";
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <952000>;
+		};
+
+		vreg_s8b_1p2: smps8 {
+			regulator-name = "vreg_s8b";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l6c_2p9: ldo6 {
+			regulator-name = "vreg_l6c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-name = "vreg_l7c";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-name = "vreg_l9c";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		vreg_l10c_0p8: ldo10 {
+			regulator-name = "vreg_l10c";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+		};
+
+		vreg_l12c_1p8: ldo12 {
+			regulator-name = "vreg_l12c";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+};
+
+&gcc {
+	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
+			   <GCC_EDP_CLKREF_EN>,
+			   <GCC_MSS_CFG_AHB_CLK>,
+			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
+			   <GCC_MSS_OFFLINE_AXI_CLK>,
+			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+			   <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_SEC_CTRL_CLK_SRC>,
+			   <GCC_WPSS_AHB_BDG_MST_CLK>,
+			   <GCC_WPSS_AHB_CLK>,
+			   <GCC_WPSS_RSCP_CLK>;
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sc7280/Samsung/galaxy-book2-go/qcdxkmsuc7280.mbn";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* SSTP0001 */
+	touchpad@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		hid-descr-addr = <0x0e>;
+
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_l7c_3p0>;
+		vddl-supply = <&vreg_l18b_1p8>;
+
+		post-power-on-delay-ms = <2>;
+
+		pinctrl-0 = <&hid_touchpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	/* A96T396 Proximity @ 0x20 & 0x21 ? */
+};
+
+&i2c4 {
+	status = "okay";
+
+	/* LIS2DLC12 Accelerometer @ 0x1d ? */
+};
+
+&i2c9 {
+	status = "okay";
+
+	/* A96T396 Proximity @ 0x20 ? */
+};
+
+&i2c10 {
+	status = "okay";
+
+	/* ? @ 0x09 */
+
+	battery@b {
+		compatible = "sbs,sbs-battery";
+		reg = <0x0b>;
+	};
+};
+
+&i2c12 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	/* SSEC0001 */
+	keyboard@5 {
+		compatible = "hid-over-i2c";
+		reg = <0x5>;
+		hid-descr-addr = <0x20>;
+
+		interrupts-extended = <&tlmm 131 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&hid_keyboard_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c14 {
+	status = "okay";
+
+	/* EC2 (?) @ 0x62 */
+};
+
+&ipa {
+	firmware-name = "qcom/sc7280/Samsung/galaxy-book2-go/ipa_fws.elf";
+
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_edp {
+	status = "okay";
+
+	aux-bus {
+		edp_panel: panel {
+			compatible = "edp-panel";
+
+			power-supply = <&vreg_edp_3p3>;
+			backlight = <&pm8350c_pwm_backlight>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_edp_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_edp_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_edp_phy {
+	vdda-pll-supply = <&vreg_l10c_0p8>;
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pm8350c_gpios {
+	pmic_lcd_bl_en: pmic-lcd-bl-en-state {
+		pins = "gpio7";
+		function = "normal";
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		output-low;
+		power-source = <0>;
+	};
+
+	pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
+		pins = "gpio8";
+		function = "func1";
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		output-low;
+		power-source = <0>;
+	};
+};
+
+&pm8350c_pwm {
+	pinctrl-0 = <&pmic_lcd_bl_pwm>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sc7280/Samsung/galaxy-book2-go/qcadsp7280.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sc7280/Samsung/galaxy-book2-go/qccdsp7280.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sc7280/Samsung/galaxy-book2-go/qcmpss7280.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_wpss {
+	firmware-name = "qcom/sc7280/Samsung/galaxy-book2-go/wpss.mbn";
+
+	status = "okay";
+};
+
+&sdc2_clk {
+	drive-strength = <16>;
+	bias-disable;
+};
+
+&sdc2_cmd {
+	drive-strength = <10>;
+	bias-pull-up;
+};
+
+&sdc2_data {
+	drive-strength = <10>;
+	bias-pull-up;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+
+	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>;
+	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>;
+
+	status = "okay";
+};
+
+&tlmm {
+	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
+		pins = "gpio28";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
+		pins = "gpio29";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
+		pins = "gpio30";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
+		pins = "gpio31";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	hall_int_default: hall-int-state {
+		pins = "gpio35";
+		function = "gpio";
+		bias-disable;
+	};
+
+	hid_touchpad_default: hid-touchpad-default-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio96";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
+
+	hid_keyboard_default: hid-keyboard-default-state {
+		pins = "gpio131";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&uart7 {
+	/delete-property/interrupts;
+	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6750-bt";
+
+		pinctrl-0 = <&bluetooth_enable_default>, <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&vreg_l19b_1p8>;
+		vddaon-supply = <&vreg_s7b_0p9>;
+		vddbtcxmx-supply = <&vreg_s7b_0p9>;
+		vddrfacmn-supply = <&vreg_s7b_0p9>;
+		vddrfa0p8-supply = <&vreg_s7b_0p9>;
+		vddrfa1p7-supply = <&vreg_s1b_1p8>;
+		vddrfa1p2-supply = <&vreg_s8b_1p2>;
+
+		max-speed = <3200000>;
+	};
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b_2p9>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p8>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p8>;
+	vdda33-supply = <&vreg_l2b_3p0>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	qcom,hs-rise-fall-time-bp = <0>;
+	qcom,squelch-detector-bp = <(-2090)>;
+	qcom,hs-disconnect-bp = <1743>;
+	qcom,hs-amplitude-bp = <1780>;
+	qcom,hs-crossover-voltage-microvolt = <(-31000)>;
+	qcom,hs-output-impedance-micro-ohms = <2600000>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l6b_1p2>;
+	vdda-pll-supply = <&vreg_l1b_0p8>;
+
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sc7280/Samsung/galaxy-book2-go/qcvss7280.mbn";
+
+	status = "okay";
+};
+
+&wifi {
+	status = "okay";
+};

-- 
2.56.0

