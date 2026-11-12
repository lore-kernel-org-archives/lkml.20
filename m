Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515123;
	b=rDpqTq5HWyfkLbacJQhuGxZL4o3kdaYiyAjFnS510c6i4Qf11DygcQ/bYI0Y72XZ7ZLn
	 U5SL8xR3bbGJkqdVYdX/v0xTDaDF/q/Z3lPH8D6bUDRSwbB7QP3Hb3+N/m0OwYScXCkOG
	 FPBqfWJI0USMjbQwLGiCzCvsBggpK6J0bcwXHoM/ecC6CluLxDQHPU+7AgphjApMwvBiA
	 WwtRl5XMsUZst6t7ZYVlXUgxVMxYGSsvL2oKvH8eAMKtGtWYUBOwiiI4uBuHj0ysOpXK6
	 UTCHFKT1KwaKmR4LsWbE04P7p/QyAeaHD9ux9E638vcrxnrbMirwA2pm0ZE3JwyKTXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1VzZEHJcJ+vp+pdkBmdK1oTXcFN5N4/X1/G64qzwI5U=;
	b=O091/c5QhIX6Gw5vewXmNU/sjj4kV4GjYm5OzRtxD0rZWI5ZzTHaHEDO8kfh9tDDBVxf
	 1qf6S2JhYM1WwmtqokqxJVPGStHL3JkewjR8SOwU0F20tFdAG5dkscomjApD2O2xmo7we
	 CLmzrWM3Lr1fpQjGfEYkOH1NhmFTNS15jCzIpJ3TIe15ZKj/3kNHDH3SK/7mPy/vjH/jo
	 sF56DPLeS6WOtc33obmkyDrz+Vja2gkK1RikLr0yCuu78RQU1whj9RQK01Bb3KruTnyKv
	 xaLca7gcnhkpvNBwZXbK6To9qQIMRKcI/4R7TQYiA6ZFCuX7bfoXpLZmmq/eikMfHFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=k12cRKh2;
	arc=none smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D31606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D31606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=k12cRKh2
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c50515c3ba6so14707966b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794515120; x=1795119920; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1VzZEHJcJ+vp+pdkBmdK1oTXcFN5N4/X1/G64qzwI5U=;
        b=k12cRKh26zksVO8S824tp/DolPEFhTQ/HaDRc8qqsPIRhEMSezynLaLVjj1m4tFV3g
         clbSSzznizZAPQfW4HojBdgAO1drWUAYpABP0F2wP/XQFxH4idY3RxdFQoDMLJGqDjNM
         MICHZjEy7oHne/QNi6KP4c/T6Ae4n7Fk53aQKOkm2NkI4lQoDnI87TKxTKwtsDFQhrd2
         Jw8TM4CKvqHZvlIwB548+RJr+l2rCWGRTBSzLx0gNTQS2kCUYghWXFrxFVGFS+K5JD5T
         6MMGMZ/NJQMEFGyKb8LgIB/Nc69c9+QSFwfzAT8acZKMR7vJAwV3Lrb5QGEX0aKFLS/5
         PpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794515120; x=1795119920;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1VzZEHJcJ+vp+pdkBmdK1oTXcFN5N4/X1/G64qzwI5U=;
        b=qKf3Iwl5cScT6GPBL7N+4bbJ+VAJwfB902DIzqGeqs9qWgoJ5XpQNB9uqtA34lMaeI
         +gMKS7CYV5CiYv/4QR3TgZzYqKLH8q5F+hpyqYxi6NO677/N8stXrU2PVrQQHQfUKVe9
         JiuNi9tuaoXa/5rIEtvbh0Hzd2oWjNYWWA4ea+Bb6ouurpwYCGBI2d4+X83/4bA4HXDm
         K5fTUH/w8I3fq8CiLaHV4GqT0IRC2bK4gZZjuhiP6ripfWATcqwf917ZxpQs4jBsDefb
         ZKUEklJDbamfsq1Z3u1uuuSUaSpsYUudKJ/+til6HJcyWJ4lVKWMJDJOD6MgCLH+Ti+t
         79zA==
X-Forwarded-Encrypted: i=1; AL+hErH2oF4+WHCg388tLnX6pqeoq3ZPJ2Y58Bf+cLWwWNKy4yrN0HhREd+zXrxOoLfwLZxGyY+IhI1K3MsWd/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o/YLExQqWVNzYqYxB4udvXNxSLDkllKerFV3NDAsWGjzPAN55
	NrKcbE0kZDYZESOLso5x4sb45ctx470GSMj/C2ap9z6ofRm4+g3e/8vDPENyNNy4VdI=
X-Gm-Gg: AYBFou2aYtxGzHCUp8xwG1s3/wlX9cHm7EVyq//nncO9qmIuMwq/0C37rgxBF10vZ5q
	k807UWObsgo00rhBDfiZXtMA2I1QUrJpMbrjN8dP4JsGx7ZFGRJmYtgIwcKGqTLzFF771TfqiHX
	rVtmPBISH0Zv9lBt3zNH2HxhcFezpmK/kE5FpaYRwKF/3wqYljdecopt41Ms4FgeiX5ZxQPrtW4
	DQoYUdxmw/iW7ICfEFl5jaB5Gb/MbOmiL+Y3hcA3QlMyMifXahh3EWM+CJVy/aRPQKgCStQjznj
	IM+AezDuBxHvQgGeNY5cMi0Eo2P+ZBJxOWeKOl8+eLErI3DYsIX6jHTe9yucHomhU8BVDyXoayf
	FJxMsf1g3wuODMTuE9YAlk842mrfoXVliVk0xrJ8uiq+8pQQbLzWeyp++zTv1Emj9T+i6zGYF3G
	NRIabxE5YH86vdsJGnJ5f3tJy7+OYX9dD+xfB1m0ytr9duYKcPlw37h4scvRI1ZcbwJkezPwMtt
	apD3G2Hax0phxUlKt4rdjyp5/scXqocMv/Kb5Vw9g/mxWnzkLKJOaF7ZBbatfWal+ZsDwiVpGW6
	K+YzmHQBr11ueCPakZcUJUn5FtLeU9lS+jZB2mpzp7Ksaw==
X-Received: by 2002:a17:907:9411:b0:c41:64c1:cc2e with SMTP id a640c23a62f3a-c50963f37c0mr30784866b.46.1794515120585;
        Thu, 12 Nov 2026 12:25:20 -0800 (PST)
Received: from [192.168.101.179] ([2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c266cf12sm108474a12.37.2026.11.12.12.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:25:20 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 12 Nov 2026 21:24:55 +0100
Subject: [PATCH v2] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
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
Message-Id: <20261112-book2go-v2-1-12691134e34e@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NQQ6CMBBFr0JmbU2niiAr72FYtDDAaOyQFomGc
 HcBo8uXvP/+BJECU4QimSDQyJHFL2B2CVSd9S0prhcGo80JNaJyInfTinKazseU0kNTO1jsPlD
 Dr610Lb8cn+5G1bDOV6PjOEh4b1cjrt6vav7VEZVWGeY5ZWQzi+mlsRz6TjztK3lAOc/zBwM0i
 gK0AAAA
X-Change-ID: 20261011-book2go-b0e945e53fdb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jasper Korten <jja2000@gmail.com>, 
 Federico Amedeo Izzo <federico@izzo.pro>, Luca Weiss <luca@lucaweiss.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794515119; l=16429;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qhnGwsbAzWiy3FSkOh/v/CmCuUEnR7XUf/giyVKT+LI=;
 b=gZbuUQHRGhWbWQ3GPouOEZ7cF9SFngC+WIsUKkGyQRG453xraGEHTQnS5N7e7eZUPqZyAAMcF
 mjvuk646SC1BZYstZQw1fJjLq6Fd9jM0OWcLUJWzx/kp6Wx9A3msP4M
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
Changes in v2:
- Fix swapped vdda-pll-supply/vdda-phy-supply (Sashiko)
- Fix wrong pinctrl pin for touchpad (Sashiko)
- Drop output-low from pinctrl states (Konrad)
- Add space after /delete-property/ (Konrad)
- Wrap qup_uart7_sleep_* lines (Konrad)
- Drop applied patches
- Link to v1: https://patch.msgid.link/20261012-book2go-v1-0-7188e7ea7a15@fairphone.com
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../dts/qcom/sc7280-samsung-galaxy-book2-go.dts    | 644 +++++++++++++++++++++
 2 files changed, 645 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..8152089a1c8c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -354,6 +354,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-zombie-nvme-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-samsung-galaxy-book2-go.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-lenovo-flex-5g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc8180x-primus.dtb
 sc8280xp-crd-el2-dtbs	:= sc8280xp-crd.dtb sc8280xp-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts b/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts
new file mode 100644
index 000000000000..51f0a92d0026
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts
@@ -0,0 +1,644 @@
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
+		power-source = <0>;
+	};
+
+	pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
+		pins = "gpio8";
+		function = "func1";
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
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
+		pins = "gpio51";
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
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 = <&qup_uart7_sleep_cts>,
+		    <&qup_uart7_sleep_rts>,
+		    <&qup_uart7_sleep_tx>,
+		    <&qup_uart7_sleep_rx>;
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
+	vdda-phy-supply = <&vreg_l1b_0p8>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
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

---
base-commit: b915a556f84147d973ba794e7b80d6059cd5d0a0
change-id: 20261011-book2go-b0e945e53fdb

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

