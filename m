Received: from mail-m32113.qiye.163.com (mail-m32113.qiye.163.com [220.197.32.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB34B53ED;
	Mon, 28 Sep 2026 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596507; cv=none; b=Jgz8QKVx3hzL1Q60SvYbWA6Ydd9QykwOwSZ0SGI2blWqaTybJOQ8l7iLhEtkbWRuRKa/q3+70phJJvmRI/bEty1D+IulRz+Pz1TVUfXDQT2i8C/+ox0xsnBX52aqasYQxJNoA+YSCT4ItUk8ldd8dDgs/8SwGdCi00z9YtIPq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596507; c=relaxed/simple;
	bh=uIUFM6sD6dQr2mDmLTHvvREcRmoIOEcrCNusNEMyhJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LOgJLdP010mE783+yNryMJ7G95qSHeLjhPSfhBCzQ14FyFxmEjFYL8HPbQluvBwaqmBk68QmYgSQWIm8BUqB84TkHexdwEkH/2iF7V7uExCDnVtvDqVtlDjleNLSAb0qVF8/wU9pjt/ujmbrOCemnx7GYu0kLo8V0fIJY9aySd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=K9gKAnrq; arc=none smtp.client-ip=220.197.32.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="K9gKAnrq"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5b33f58;
	Mon, 28 Sep 2026 19:49:41 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Mon, 28 Sep 2026 19:49:16 +0800
Subject: [PATCH v4] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rubikpi-next-20260605-v4-1-56ac4da896fd@thundersoft.com>
X-B4-Tracking: v=1; b=H4sIADtUumoC/3XN0Q6CIBiG4VtxHEcDRMCOuo/WAQkka4EDZDbnv
 Ye21UHz8P22//lnEHWwOoJTNYOgs43WuxL0UIGul+6uoVWlAUGEIYYaGMabfQwWOj0l+F2NUhJ
 jKghVHJTbIWhjp829XEv3NiYfXtubTNb1I3K8J2YCEWScIay4FI3A59SPTukQvUnHzj/B6ub6Z
 7WI7ll1sQxtMWVKNNLU/9ayLG9LUpiEDAEAAA==
X-Change-ID: 20260605-rubikpi-next-20260605-fdda114824d7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790596181; l=6970;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=uIUFM6sD6dQr2mDmLTHvvREcRmoIOEcrCNusNEMyhJM=;
 b=dYoKiThLwQkehT1fg1icElz5b+xEk0oNPL2GF+J/Ewq1kI95IrMyvwPfuPh+dJitIyc7TgFIY
 ucLse/Tu6YRAYhlX5LpN5oaDj0V89vjHOJHsOvuiK7VdmO+1EuU47ur
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0aa0e7d96c0009d5kunm7599b9d8470ca8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkgZVkNKTEhJSR8dQ0NPS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=K9gKAnrqGygN4pQUBPnBWw5q7ycNBAFWBog86kHNGvQc3Yuhap64Ia6+mrshnpRhcTIMhUBhXREDvuoJAbPX9M5WoU5BHVFYRiOJCulWig1jGdyqKu9UcNXIoNzQWjGW+wFdNtBaF0T9U/BT738zJkZybOLRDZG2Uw1YLiCjk9c=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=gJTZhoNmZEvie520qbaHv+dSvK0//N9JErmbNt9XBwE=;
	h=date:mime-version:subject:message-id:from;

RubikPi 3 uses the AudioReach firmware path for its external audio
interfaces. Primary MI2S connects to an ES8316 codec for headset playback
and capture, while quaternary MI2S feeds the LT9611 HDMI bridge.

Describe the ES8316 supplies, MCLK, jack detection and audio routing, and
add the primary and quaternary MI2S links. The 1.8 V and 3.3 V codec
supplies are both controlled by GPIO117.

Link: https://lore.kernel.org/r/b4e0dbd4-f50b-4366-add5-e99cd4432aa8@oss.qualcomm.com
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
This revision contains only the Rubik Pi 3 device-tree patch. The five
ASoC patches from v3 have been applied to sound.git and are already in
next-20260925. The AudioReach topology and ALSA UCM updates will be
submitted separately.

Changes in v4:

- Set I2C0 clock-frequency to 100 kHz explicitly, preserving the rate
  used by the GENI I2C driver's default.
- Rebase the device-tree patch onto next-20260925 and omit the five
  ASoC patches already applied to sound.git.

Link: https://lore.kernel.org/r/20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com
---
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 171 +++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 0f21777c480b..702faf78ef03 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -19,6 +19,7 @@
 #include "pm7325.dtsi"
 #include "pm8350c.dtsi" /* PM7350C */
 #include "pmk8350.dtsi" /* PMK7325 */
+#include "qcs6490-audioreach.dtsi"
 
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
@@ -128,6 +129,33 @@ fan0: pwm-fan {
 		pinctrl-names = "default";
 	};
 
+	vreg_es8316_1v8: regulator-es8316-1v8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_es8316_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&es8316_power_on>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_l18b_1p8>;
+	};
+
+	vreg_es8316_3v3: regulator-es8316-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_es8316_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vreg_eth_1v8: regulator-eth-1v8 {
 		compatible = "regulator-fixed";
 
@@ -743,6 +771,32 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs6490/a660_zap.mbn";
 };
 
+&i2c0 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	es8316: audio-codec@11 {
+		compatible = "everest,es8316";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_LEVEL_HIGH>;
+		avdd-supply = <&vreg_es8316_3v3>;
+		cpvdd-supply = <&vreg_es8316_1v8>;
+		dvdd-supply = <&vreg_es8316_1v8>;
+		pvdd-supply = <&vreg_es8316_1v8>;
+
+		pinctrl-0 = <&es8316_jack_detect>;
+		pinctrl-names = "default";
+
+		everest,jack-detect-inverted;
+	};
+};
+
 /* Pin 3, 5 in 40-pin connector */
 &i2c1 {
 	status = "okay";
@@ -756,6 +810,7 @@ &i2c9 {
 	lt9611_codec: hdmi-bridge@39 {
 		compatible = "lontium,lt9611";
 		reg = <0x39>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 20 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
@@ -994,6 +1049,23 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@10 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@11 {
+		reg = <PRIMARY_MI2S_TX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcm6490/qupv3fw.elf";
 
@@ -1030,6 +1102,69 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "thundercomm,qcs6490-rubikpi3-sndcard";
+	model = "QCS6490-Thundercomm-RubikPi3";
+
+	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>,
+		    <&mi2s0_sclk>, <&mi2s0_ws>,
+		    <&lpass_qua_mi2s_sclk>, <&lpass_qua_mi2s_ws>,
+		    <&lpass_qua_mi2s_data>;
+	pinctrl-names = "default";
+
+	audio-routing = "Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR",
+			"MIC2", "Mic Jack";
+
+	mi2s-capture-dai-link {
+		link-name = "Primary MI2S Capture";
+
+		codec {
+			sound-dai = <&es8316>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	mi2s-playback-dai-link {
+		link-name = "Primary MI2S Playback";
+
+		codec {
+			sound-dai = <&es8316>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+
+	quaternary-mi2s-playback-dai-link {
+		link-name = "HDMI Playback";
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai QUATERNARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
+};
+
 /* Pin 19, 21, 23, 24 in 40-pin connector */
 &spi12 {
 	status = "okay";
@@ -1244,6 +1379,29 @@ &sdc2_data {
 	drive-strength = <10>;
 };
 
+&lpass_tlmm {
+	lpass_qua_mi2s_sclk: qua-mi2s-sclk-state {
+		pins = "gpio0";
+		function = "qua_mi2s_sclk";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	lpass_qua_mi2s_ws: qua-mi2s-ws-state {
+		pins = "gpio1";
+		function = "qua_mi2s_ws";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	lpass_qua_mi2s_data: qua-mi2s-data-state {
+		pins = "gpio2", "gpio3", "gpio4";
+		function = "qua_mi2s_data";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};
+
 &tlmm {
 	pcie1_reset_n: pcie1-reset-n-state {
 		pins = "gpio2";
@@ -1389,6 +1547,12 @@ m2_vcc_pin: m2-vcc-state {
 		input-disable;
 	};
 
+	es8316_jack_detect: es8316-jack-detect-state {
+		pins = "gpio63";
+		function = "gpio";
+		bias-disable;
+	};
+
 	lt9611_vcc_pin: lt9611-vcc-pin-state {
 		pins = "gpio83";
 		function = "gpio";
@@ -1418,6 +1582,13 @@ pcie0_wake_n: pcie0-wake-n-state {
 		bias-pull-up;
 	};
 
+	es8316_power_on: es8316-power-on-state {
+		pins = "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wifi_power_on: wifi-power-on-state {
 		pins = "gpio125";
 		function = "gpio";

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260605-rubikpi-next-20260605-fdda114824d7

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>

