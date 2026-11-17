Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892838;
	b=pn91iwQgOXcOvNBd417wIKGMLwWXbyx6AxGzeKKjD6KGwYrEQPUppmJ3zAx3Z0RCFGH1
	 LriFS/sw42MDKxv6u82p61V6c5soXoiBbDe9W7ROok9arIJT+nWwoyw6cbn4/DbqE+FWc
	 u8IOOa0k62sdsE/d1YLdET0TS+/S6MIF2wd/cqoXTRUCJrS+HRxGX32fCXmiuCPHRjApR
	 /P8IIqDr8AjNOolzoykeEdOP20oB2+EgpQNh/3ASxH9faa6A4yMt+k9viqZvi+7lbVe0v
	 81fT+QusEYasNrzfeCbxp9nNaim2EN3P12BJ6ZFG8HgrXVCsnZcnAzwQv0b2049jEtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892838;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=MeX2wCG25+ulppvKacVi2s6680KmILyRd3QMQUPZHL8=;
	b=USPPHVE9hmllSlf5sX7JASkT9XfpfGeIFq1nDmUtcxo+ACwc9BiZowLx1vZ1rcLYIjmN
	 A5HjG4S7xdAUHcrQ9tdoTxkfNDvqooiZ8xLP6VuTRtw/WU64Ys9wgZZrZa+mSVXqgoiCo
	 wGqhOL46Q2QR//UuqnX8alb1QRdj1btI/mx60Qzs6JJ05P87Ss/B8hsVshzafG9vD63GA
	 fM23L8Wn2BA2wgU3m//p75Tgak0avHxuLgnx/Q/wEvFl+dX6SwCFKPSr1w9aTbbe7rmVE
	 yDmrtJQIF2AsPR2aQEycE+l4r+TtOXjUsji+yvhfCqGphkIdwfzJSnzCdGLEXhOpR+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=FsmQ+aK1;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A32C606A31C;
	Tue, 17 Nov 2026 05:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A32C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=FsmQ+aK1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=MeX2wCG25+
	ulppvKacVi2s6680KmILyRd3QMQUPZHL8=; b=FsmQ+aK155KNZ2pHQGugblgDBh
	nPK6R0QoRcMUb5ZO/0Gp6/VjPMgV1AgiMfAYzTdidSVp45XFYo4YNOEJecWLefQ4
	kxNh+ePOLVy6/j2CamctNBtzkSks9i+/vwiFhW+9Gu7pTvd5b9j3mMnsPzZyw2q0
	RZWg2MZplSfH0qOs8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.190.181])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3rTEd5PtqzEHLAA--.1648S2;
	Tue, 17 Nov 2026 13:20:29 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7] arm64: dts: qcom: sm8750-lenovo-elden: add Lenovo Legion Y700 Gen4, a Qualcomm SM8750-based tablet
Date: Tue, 17 Nov 2026 13:20:28 +0800
Message-ID: <20261117052029.31900-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:3pYKCgA3rTEd5PtqzEHLAA--.1648S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw45Kr47AryrAF4kAr4fZrb_yoW7Ar17pF
	srZrs3Gr95uF1rtws8W3yIva95Wan5Gayvkr1qkFWrC3yYkFykGFsFyF1rAF18Jr4kZw4S
	yFZxZr92yFn2v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCY
	02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUg73vDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2r7WdojVwAKs1

The Lenovo Legion Y700 Gen4 (TB322FC) is an SM8750 tablet.  Add its
devicetree with the board compatible, the chassis type, the GPIOs the boot
firmware reserves and the board clocks, which the SM8750 dtsi consumes: the
XO and sleep clocks and the two divided CXO derivatives, as on the other
SM8750 boards.

The camera devices are powered by a WL2868C camera PMIC on i2c10: LDO1
feeds the rear sensor DVDD, LDO2 the front sensor DVDD, LDO3 the front
sensor AVDD, LDO4 the rear sensor AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of
both sensors and the VCM VDDIO, all at fixed voltages including the offsets
programmed by the stock firmware.  LDO6 is not wired out on this board.

This is one logical action - "add this new hardware" - so the board and the
regulators it carries are described in a single commit.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
Changes in v7:
- Fold the two devicetree patches of v6 (4/5 "add the Lenovo Legion Y700
  Gen4" and 5/5 "describe the WL2868C regulators") into a single commit, as
  asked in <20261104-elfish-booby-of-awe-27d2b6@quoll>: this is one logical
  action, adding this new hardware, so it is one commit.  The resulting tree
  is identical to applying both v6 patches in order; nothing was dropped.
- No other change.  The compatible, the reserved GPIO ranges, the board
  clocks and the WL2868C regulator voltages are exactly as in v6.

Still open from the v6 thread (unchanged here, no way to validate them):
SPMI PMIC, RPMh regulators and console are not described, so this is still
the boot-infrastructure-less skeleton the v6 review commented on.

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00..e0b65a36c5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -453,6 +453,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-lenovo-elden.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
new file mode 100644
index 0000000000..73f4452f46
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
@@ -0,0 +1,129 @@
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
+
+	/*
+	 * VSYS of the camera PMIC is the always-on system rail of the tablet.
+	 * The SPMI PMICs that generate it are not described yet, so it is
+	 * modelled as a fixed regulator without a voltage constraint.
+	 */
+	wl2868c_vsys: regulator-vsys {
+		compatible = "regulator-fixed";
+		regulator-name = "wl2868c_vsys";
+		regulator-always-on;
+	};
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
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
+		vsys-supply = <&wl2868c_vsys>;
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
+};

