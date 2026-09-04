Received: from mail-m15574.qiye.163.com (mail-m15574.qiye.163.com [101.71.155.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85ED3CCFBD;
	Fri,  4 Sep 2026 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517115; cv=none; b=dABgMBGI2EyaPHKZXkA0T46pgY4zAXXcXwPSTZ1ps1uoSO7y4RCVVO6hdmUmWQKysdXPSYCVeSePh4TbVgEMQiRodPzQ2aG5lZIpFP5hlVZ8xi4AsiVh58/EIfS1g6wTBVIV0YtLn0Kpm/yJjJv3LWBmGa1GV0ap67rjC6d70MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517115; c=relaxed/simple;
	bh=51aJ1JblvEYM3O+oFR62vf+HfYNykqMpE6H+TgBBpb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qk/dvNriYcesD5OblsZbuCB0SUMevHOG03JZvFSjcLgrA973uUgSih+X9XWTr4aDH/+Bf1IIBHlaPfMkMqitN1pjA9FdhF387CbrCjQA2mr/aWdAAYQl8yBhlewIvmRjS4g8ApyyIyH669D3xoSUY3i5f4zcR8Fdjmo6aNXPgf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=L97Ae4nz; arc=none smtp.client-ip=101.71.155.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="L97Ae4nz"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4c8f646f0;
	Fri, 4 Sep 2026 18:03:03 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Fri, 04 Sep 2026 18:02:30 +0800
Subject: [PATCH v3 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-rubikpi-next-20260605-v3-6-f49146d85af3@thundersoft.com>
References: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
In-Reply-To: <20260904-rubikpi-next-20260605-v3-0-f49146d85af3@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788516170; l=6027;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=51aJ1JblvEYM3O+oFR62vf+HfYNykqMpE6H+TgBBpb4=;
 b=A/BF92uO0JERtcGEOwQvREJTdbHcB1MxdO867Ucm+Yu7ht2quZnM66HG/1pv5BIxVWfy1J8Kj
 JyZ2fqt6jLjC5+mt069L3ftfjzonKw5FmCc31wdOzVjyEnVP5ZK3uls
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0aa06bdf2bee09d5kunm6f63729aafba4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0lCVkpOS0kYS0IfH0JLGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=L97Ae4nzBcalR/YT6lqW556dqyid17l+02j0S2wO9m+BrWBbfsHyWNnuO0jek598hUbIGL4yFy+47/cn7Qi5w5hOYTpWiSfANipd1rm6XHot/nFYe4dyHmKl2BqpMiBC09CuAg+wos1W6GCotAVXBe7SMTSYATZUgF2a46HrGYw=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=GJBUxSd6wE6o/DKf4dE/o3ZZ+oVtDtob6mF1TrwlVMY=;
	h=date:mime-version:subject:message-id:from;

RubikPi 3 uses the AudioReach firmware path for its external audio
interfaces. Primary MI2S connects to an ES8316 codec for headset playback
and capture, while quaternary MI2S feeds the LT9611 HDMI bridge.

Describe the ES8316 supplies, MCLK, jack detection and audio routing, and
add the primary and quaternary MI2S links. The 1.8 V and 3.3 V codec
supplies are both controlled by GPIO117.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 0f21777c480b..10277bee86b3 100644
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
 
@@ -743,6 +771,30 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs6490/a660_zap.mbn";
 };
 
+&i2c0 {
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
@@ -756,6 +808,7 @@ &i2c9 {
 	lt9611_codec: hdmi-bridge@39 {
 		compatible = "lontium,lt9611";
 		reg = <0x39>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 20 IRQ_TYPE_EDGE_FALLING>;
 		reset-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
@@ -994,6 +1047,23 @@ &pon_resin {
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
 
@@ -1030,6 +1100,69 @@ &sdhc_2 {
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
@@ -1244,6 +1377,29 @@ &sdc2_data {
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
@@ -1389,6 +1545,12 @@ m2_vcc_pin: m2-vcc-state {
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
@@ -1418,6 +1580,13 @@ pcie0_wake_n: pcie0-wake-n-state {
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

-- 
2.43.0

