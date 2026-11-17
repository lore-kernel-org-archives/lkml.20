Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919193;
	b=IQ+God988kLeJrEK1fCDDFYgkc84c/Rl2a962R/mxvAy39+wOA9nJFPaQIgEkjvJLRlW
	 7csECU9DsXbDaT69oOfvvgkDKx3YrjvlSBbb/iJRcfpFnM4/dFNy6lgBtvVfwrRrwWxtw
	 8t7l4qSdiq4pPlz/rt3cjaxHNzCbo4ympYSsI04CzAOVlCIuxsCqDd/D0WnMsU5Ud3dky
	 du4oFI0uYvAe5JCQZ2yrHFYpYfx9HmY0WR7SqJslAk9lVuNGfDyVVPcLmm5alqu3tavjq
	 fwFOBtJ8OYYUtbJ9gE5iiovkTBCeH5pBDindK46FEae5xspXWQmYTj5PW9wREMKzCmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0qh6b8xWE5s4NSuahM9vcqi/jo2yZx4jTaD46fezOa4=;
	b=PcSLSEEs0EdgjBkCCRxlbxJqRBkOyloZ7sZLZCxYuSvZthseuTDCIEl4pRc7N5Fe6SYA
	 yj5ZYromThPAg59rrbibQU2Aaw9GyNKazaoe9dGV67GyeF5DVTyHEikiwzz+tNuye9cBj
	 JuV4whH8iJ0EYesJbz2SuNBKDQX6HYTPOPQM8tgdj6f0KLz/dLpIrqtmfKrI7jleWaN69
	 3/BzXOCQ7ZKzzhve3Zol0GEbYkkH+J3zdqIzhOuwiSs+iFXGu8D+6+rmq0ejRmzxUsylH
	 8NxrRzOKMwHE87aBovxol/wyn5NvPiKlfT67auFVYkxmvOa3ZBbrytiEDb0hKMvqGJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FubbEB8K;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21F606A8A3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F21F606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FubbEB8K
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so38102355e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919191; x=1795523991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qh6b8xWE5s4NSuahM9vcqi/jo2yZx4jTaD46fezOa4=;
        b=FubbEB8KhveNRXSUKS+TydgcxJ4O9z2y8c1djOEpZyW/Vvd0vula1p+m+4I9/QEJyA
         ry/hsDuQga1PcTNHfMgmzLz8TpuSRt7zcPAZiDvOuh64EFpW5zzrwR8Igv4iJ/R+OF+n
         xatx2pQf8XxtER0g5FQJppXpAtHiJNNOCWkXVRkxQHV/0SDEAdX5ju6OrMJQCavz/HnP
         EEYGVyApxe80/+MhNM+xbU5DoZDN5pLpmW5X+l+TFNfnXOHYBPZSzFV7zBOHpuizh30B
         dPHeMAu20Ke7Y9mBzP0aA3lSiD3wqQthTCHsQHfy5UOyR5LWPSfZiOUj5fvKRiZlc4gl
         WT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919191; x=1795523991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qh6b8xWE5s4NSuahM9vcqi/jo2yZx4jTaD46fezOa4=;
        b=ORxPiImOCQ+PW6KjxjG6dwOWXoHnIu07/eEc8LQibVScqozYmzgprTNWNQ3UJ96db8
         fDwgku35cRgVeeKd7sHqPPMaRWSEcBrl11E5G7CbEwLMPT4N+4BvgMu6pM4fCOcWpM/a
         zbO5LoMBN4TH0h4l9hdySji9cG1MONgFORx7x0Rgi9cMOsfRg6kwR0U7QRY+GvGgq71q
         wPeOkjTABlHV78XyuN8b0DxV8wJFSSap9B5xtv7pbrjOV31aRJw8GdlU6e4/y4FAx5lj
         u9wKrFfFaRS4Pigh94l5ALCTNfAc4f3sUP9hzTJGQWqcr4cJpISgFpkrq83xKggTHxgi
         N16A==
X-Forwarded-Encrypted: i=1; AL+hErGbhSz8/mKyOKvWRkIVfQVCIms1RDBxp65sdtEL9ULCsnXfj553bQjoPkhSmmX7BYxgm5ZyO9JrrxVKjZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Lifb3agSlxPZStMGJjaowqB8MjNM72/bJqfgYx/wRQxzJhV8i
	sGDSkf9UwxXILSdffgAoTzD0PwwfgHhrF8LAIMSlMS97g4+VZ819Vmr3
X-Gm-Gg: AYBFou1zyA14dGEaMVnIuW+06oLnPB1+E/RMQEwIYezyg6xuvfVWGyjN+3WJ6hNC5rZ
	EW5102lXQ4p/ZdD48BuzGKzJImvL24r3gk4okVU2D60npQJlDucqts/lylIbop433aqYwaUB0yS
	s7+DaqihIVPeSSEuvIgj6ciKw/S8EnWTDcHBOmTLqQe/9JlrXvQg6zOvnPEGTgd7aXQr98Kc2Oe
	eB+drfEsFrGo63YsVO9H5C4WJEn35vMqxywpGAqchKli4o7RPyOpJxlFY41XXlxo68o+TFWaxh9
	dPLUOtsOmPQEgr6zPex7ist1/xw7NQo4CXYgIhmc/QZ/DG0DFOylq3pYGWTrGA1xzXYm1Ki7fPh
	85JbgBCtkevs3DTdu1CThanmwlqtYC6ekV2cMg3ba2sg2mJEI+PbP58+cAHZ2bCDp6JPRPeKcPG
	reCB088Hkes718VgtPQbOEwN2YMAOOk6084C2nrSmVphIGCneWY+ZOo64IdjjJVz6u27Nc8EKam
	EOyrjSeBWUVcdS8sS+7QhQiM/0bZzchqo6HM3A4l9QSd2Qwm9yD8RFVM909iG0scvZDA2wEShOG
	OeeoRW9OAOgetl2wmFb0j6rI92aSHqNruq1k24Jy4EbRszPGwqlfdc2ZGwnwIzNlUVkQDw==
X-Received: by 2002:a05:600c:4752:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb55ab2b89mr286218165e9.22.1794919190906;
        Tue, 17 Nov 2026 04:39:50 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:50 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 02/11] arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
Date: Tue, 17 Nov 2026 13:39:37 +0100
Message-Id: <20261117123946.668557-3-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the LG V60 ThinQ 5G (timelm), based on the
Qualcomm SM8250 SoC.

Describe the memory layout, PMIC regulators, buttons, serial console,
UFS, SD card, and USB.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 MAINTAINERS                                   |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 543 ++++++++++++++++++
 3 files changed, 550 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9f..315a4a000b405 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15231,6 +15231,12 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/dvb-frontends/lgdt3305.*
 
+LG V60 THINQ 5G (TIMELM) SUPPORT
+M:	rofikkerneldev <rofikcoga@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/qcom/sm8250-lge-timelm*
+
 LIBATA PATA ARASAN COMPACT FLASH CONTROLLER
 M:	Viresh Kumar <vireshk@kernel.org>
 L:	linux-ide@vger.kernel.org
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea9..91c9d95696f2a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -409,6 +409,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-lge-timelm.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-r8q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-x1q.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
new file mode 100644
index 0000000000000..74b673ebbeb9d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 rofikkerneldev <rofikcoga@gmail.com>
+ * Device Tree for LG V60 ThinQ 5G (timelm / LM-V600)
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/usb/pd.h>
+#include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+#include "pm8009.dtsi"
+
+/*
+ * Delete upstream reserved-memory nodes that differ on LG V60.
+ */
+/delete-node/ &adsp_mem;
+/delete-node/ &spss_mem;
+/delete-node/ &cdsp_secure_heap;
+
+/ {
+	model = "LG V60 ThinQ 5G";
+	compatible = "lge,timelm", "qcom,sm8250";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart12;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@9c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x9c000000 0 0x1200000>;
+			width = <1080>;
+			height = <2460>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&gcc GCC_DISP_SF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+				 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+				 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+				 <&dispcc DISP_CC_MDSS_ESC0_CLK>;
+			power-domains = <&dispcc MDSS_GDSC>;
+		};
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <4900000>;
+		energy-full-design-microwatt-hours = <18800000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4450000>;
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&vol_up_n &hot1_key_n>;
+		pinctrl-names = "default";
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-assistant {
+			label = "Google Assistant";
+			gpios = <&pm8150_gpios 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_ASSISTANT>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	reserved-memory {
+		ramoops: ramoops@b0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xb0000000 0x0 0x280000>;
+			record-size = <0x1000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x40000>;
+			pmsg-size = <0x200000>;
+		};
+
+		adsp_mem: memory@8a100000 {
+			reg = <0x0 0x8a100000 0x0 0x2500000>;
+			no-map;
+		};
+
+		spss_mem: memory@8c600000 {
+			reg = <0x0 0x8c600000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_secure_heap: memory@8c700000 {
+			reg = <0x0 0x8c700000 0x0 0x4600000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	/* S6c is really ebi.lvl but it's there for supply map completeness sake. */
+	vreg_s6c_0p88: smpc6-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s6c_0p88";
+		regulator-min-microvolt = <880000>;
+		regulator-max-microvolt = <880000>;
+		regulator-always-on;
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l1-l8-l11-supply = <&vreg_s6c_0p88>;
+		vdd-l2-l10-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p6>;
+		vdd-l6-l9-supply = <&vreg_s8c_1p2>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p9>;
+		vdd-l13-l16-l17-supply = <&vreg_bob>;
+
+		vreg_s4a_1p8: smps4 {
+			regulator-name = "vreg_s4a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a_1p9: smps5 {
+			regulator-name = "vreg_s5a_1p9";
+			regulator-min-microvolt = <1824000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6a_0p6: smps6 {
+			regulator-name = "vreg_s6a_0p6";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <1128000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_3p1: ldo2 {
+			regulator-name = "vreg_l2a_3p1";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_0p9: ldo3 {
+			regulator-name = "vreg_l3a_0p9";
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <932000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_0p88: ldo5 {
+			regulator-name = "vreg_l5a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a_1p2: ldo9 {
+			regulator-name = "vreg_l9a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-name = "vreg_l14a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-name = "vreg_l17a_3p0";
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_0p9: ldo18 {
+			regulator-name = "vreg_l18a_0p9";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
+		vdd-l2-l3-supply = <&vreg_s8c_1p2>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3350000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_s7c_0p35: smps7 {
+			regulator-name = "vreg_s7c_0p35";
+			regulator-min-microvolt = <348000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8c_1p2: smps8 {
+			regulator-name = "vreg_s8c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-name = "vreg_l3c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-name = "vreg_l5c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_2p9: ldo6 {
+			regulator-name = "vreg_l6c_2p9";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_2p85: ldo7 {
+			regulator-name = "vreg_l7c_2p85";
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-name = "vreg_l9c_2p9";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-name = "vreg_l10c_3p3";
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3296000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p0: ldo11 {
+			regulator-name = "vreg_l11c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8009-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vreg_bob>;
+		vdd-l2-supply = <&vreg_s8c_1p2>;
+		vdd-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_s4a_1p8>;
+
+		vreg_s1f_1p2: smps1 {
+			regulator-name = "vreg_s1f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2f_0p5: smps2 {
+			regulator-name = "vreg_s2f_0p5";
+			regulator-min-microvolt = <512000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_1p3: ldo2 {
+			regulator-name = "vreg_l2f_1p3";
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_1p05: ldo4 {
+			regulator-name = "vreg_l4f_1p05";
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5f_2p8: ldo5 {
+			regulator-name = "vreg_l5f_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6f_2p8: ldo6 {
+			regulator-name = "vreg_l6f_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7f_1p8: ldo7 {
+			regulator-name = "vreg_l7f_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&cdsp {
+	status = "okay";
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sm8250/a650_zap.mbn";
+	};
+};
+
+&pm8150_gpios {
+	hot1_key_n: hot1-key-n-state {
+		pins = "gpio1";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <0>;
+	};
+
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		power-source = <0>;
+	};
+};
+
+&pon {
+	mode-bootloader = <0x2>;
+	mode-recovery = <0x1>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
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
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&uart12 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l17a_3p0>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l6a_1p2>;
+	vccq-max-microamp = <800000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <800000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l9a_1p2>;
+	vdda-pll-supply = <&vreg_l18a_0p9>;
+};
-- 
2.39.5

