Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418188;
	b=1WQmV2wjBPQJ950BT/4IRUjQcbvLN12aCYLBAmd49Z0uewPY7xBba4cqTCCV3iuaxQih
	 Hc/sE7zhJjTB1QajRSugEBHHnQpWHTvwSXGe9PayXa+OTPAW1BGvLlGNQho3+LE6jkSJE
	 HWpL4p/TF37CPPLz0VSijkDm65RLCF9IurBsAIKc7qBBPWsCBhBads6E1EO03C1AAYaUw
	 k2bMSvKYUJtKpa4YgOvmT4riGN2JFBOSm+w9Z3iycCNklTbhgtpkQJBUn5X4p4Z3uvn0F
	 8tG1MpMxVREw89CQvbj76kp9KBgStMEg97A3zb5nsrncPLbsLmXu0Wl8r6oqydsQiLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=kJ2oBVbBFglV7fHHXzLu0NU7kruSxBj7KzNiA0QCJGw=;
	b=Udybdt7PaqySvIyk2AJ48MVKeCiPo20Vb/89fX+OJbizlfSoOu07oQkkTxZIgI9v6Ylj
	 Z4i6qlRNlRWpxCSmC0EEPTwrZ6tG2DPIsLuXBe+RQf5E8r538zci9gQ5D5C5K6ZgXLNi6
	 saSFEVM2omeCEEG2i9eIBOyYFvvbUJmBj/GrONjEUJrCoz8ZmS8iongQzBx+0HTRBHjRB
	 6E/E/iGg4ugKJjajVY35CglB/85O0VK1fm63yOnd66/VDACxUsDWZgQ99yWiiNIONFxc3
	 TTZzXzbUpyO7KoVo3soJnOOLZygMYJaL0gmxFiHKqzBocA6ZrAxcMppn4RhmLrwu9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ftPKIWAd;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2953606A31E;
	Sat, 31 Oct 2026 03:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2953606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ftPKIWAd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=kJ2oBVbBFglV7fHHXzLu0NU7kruSxBj7Kz
	NiA0QCJGw=; b=ftPKIWAdGvG131g5EyKtXJwvWmn9uL/2ciIyU9/7Tlry/ZD4Oy
	UcvjVGK5H5pT6+nj/OttKFL86wuOOTLo3R8zqnsu+8MyRhY2nX1RZDFwrkuiruZ/
	aJoXElpG9qKDKFLj1Lb8MgdyEV6Cu9do6u44oQfCPItgz85Qq02bLWrLA=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXjjLEY+VqGO1sAA--.76S5;
	Sat, 31 Oct 2026 11:43:03 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators
Date: Sat, 31 Oct 2026 11:43:00 +0800
Message-ID: <20261031034300.272730-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028120442.99375-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031034300.272730-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAXjjLEY+VqGO1sAA--.76S5
X-Coremail-Antispam: 1UD129KBjvJXoWfJw1DGw1UGrW8GFyDWFWruFg_yoWDArWxpa
	nrZrs5Crn29r1Fgws0qa4IvF13Ww4kCayvkryqgryUCrWF9a4DKa1IvryrWF15Jr48Jw4Y
	vFsxZr9FyFnFkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v3
	85UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwAfsd

The Lenovo Legion Tab (TB322FC) is an SM8750 tablet. Its camera
devices are powered by a WL2868C camera PMIC on i2c10: LDO1 feeds the
rear sensor DVDD, LDO2 the front sensor DVDD, LDO3 the front sensor
AVDD, LDO4 the rear sensor AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of
both sensors and the VCM VDDIO, all at fixed voltages including the
offsets programmed by the stock firmware. LDO6 is not wired out on
this board.

The camera devices hang off the two CCI I2C controllers, which the
SM8750 dtsi does not describe yet, so add them alongside. The sensors
are described with their supplies only for now; the CSI endpoints
will be added together with the camera subsystem.

The board clocks (XO, sleep clock and the two divided CXO derivatives)
that the SM8750 dtsi consumes are described here, as done on the other
SM8750 boards, and the board compatible is added to qcom.yaml.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 202 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 112 ++++++++++
 4 files changed, 316 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df78..41d5e65c4e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,7 @@ properties:
 
       - items:
           - enum:
+              - lenovo,elden
               - qcom,sm8750-mtp
               - qcom,sm8750-qrd
           - const: qcom,sm8750
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f..a18fea7beb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -406,6 +406,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-lenovo-elden.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
new file mode 100644
index 0000000000..7bbc1986a8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "sm8750.dtsi"
+
+/ {
+	model = "Lenovo Legion Y700 Gen4";
+	compatible = "lenovo,elden", "qcom,sm8750";
+	chassis-type = "tablet";
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	clock-frequency = <400000>;
+
+	rear_lens: lens@c {
+		compatible = "giantec,gt9764";
+		reg = <0x0c>;
+		vddio-supply = <&camera_ldo7>;
+		vdd-supply = <&camera_ldo5>;
+		giantec,aac-mode = <0x40>;
+		giantec,aac-timing = <0x7c>;
+		settling-time-us = <7000>;
+	};
+
+	rear_camera: camera@56 {
+		compatible = "samsung,s5kjns";
+		reg = <0x56>;
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK3_CLK>;
+		assigned-clock-rates = <19200000>;
+		power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+		reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rear_camera_default>;
+		dovdd-supply = <&camera_ldo7>;
+		dvdd-supply = <&camera_ldo1>;
+		avdd-supply = <&camera_ldo4>;
+		lens-focus = <&rear_lens>;
+		orientation = <1>;
+		rotation = <90>;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	clock-frequency = <400000>;
+
+	front_camera: camera@31 {
+		compatible = "galaxycore,gc08a8";
+		reg = <0x31>;
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK4_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+		power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&front_camera_default>;
+		dovdd-supply = <&camera_ldo7>;
+		dvdd-supply = <&camera_ldo2>;
+		avdd-supply = <&camera_ldo3>;
+		orientation = <0>;
+		rotation = <270>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	pmic@2f {
+		compatible = "willsemi,wl2868c";
+		reg = <0x2f>;
+		reset-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_pmic_default>;
+
+		regulators {
+			/* Voltages include the offsets programmed by stock firmware. */
+			camera_ldo1: ldo1 {
+				regulator-name = "camera_ldo1";
+				regulator-min-microvolt = <1128000>;
+				regulator-max-microvolt = <1128000>;
+			};
+
+			camera_ldo2: ldo2 {
+				regulator-name = "camera_ldo2";
+				regulator-min-microvolt = <1288000>;
+				regulator-max-microvolt = <1288000>;
+			};
+
+			camera_ldo3: ldo3 {
+				regulator-name = "camera_ldo3";
+				regulator-min-microvolt = <2816000>;
+				regulator-max-microvolt = <2816000>;
+			};
+
+			camera_ldo4: ldo4 {
+				regulator-name = "camera_ldo4";
+				regulator-min-microvolt = <2824000>;
+				regulator-max-microvolt = <2824000>;
+			};
+
+			camera_ldo5: ldo5 {
+				regulator-name = "camera_ldo5";
+				regulator-min-microvolt = <2808000>;
+				regulator-max-microvolt = <2808000>;
+			};
+
+			/* LDO6 is not wired out on this board. */
+			camera_ldo7: ldo7 {
+				regulator-name = "camera_ldo7";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <39 1>, <74 1>;
+
+	camera_pmic_default: camera-pmic-default-state {
+		pins = "gpio126";
+		function = "gpio";
+		bias-disable;
+	};
+
+	rear_camera_default: rear-camera-default-state {
+		mclk-pins {
+			pins = "gpio92";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		reset-pins {
+			pins = "gpio11";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	front_camera_default: front-camera-default-state {
+		mclk-pins {
+			pins = "gpio93";
+			function = "cam_aon_mclk4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		reset-pins {
+			pins = "gpio7";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df..60b8f2fb5a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3512,6 +3512,72 @@ camcc: clock-controller@ade0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_0_CLK>;
+			assigned-clock-rates = <37500000>;
+			pinctrl-0 = <&cci0_0_default>;
+			pinctrl-1 = <&cci0_0_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				status = "disabled";
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac7c000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_1_CLK>;
+			assigned-clock-rates = <37500000>;
+			pinctrl-0 = <&cci1_0_default>;
+			pinctrl-1 = <&cci1_0_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				status = "disabled";
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
@@ -4090,6 +4156,52 @@ qup_uart15_default: qup-uart15-default-state {
 				bias-pull-up;
 			};
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				pins = "gpio113", "gpio114";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				pins = "gpio117", "gpio118";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc2_sleep: sdc2-sleep-state {
 				clk-pins {
 					pins = "sdc2_clk";
-- 
2.53.0

