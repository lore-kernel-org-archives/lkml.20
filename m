Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762822;
	b=i/hwdzO39R+oqdRGhxZ16b9H45VLMqI8XTa3xUezn3eF57zzwGeaDHEsukQFmNjjgo4/
	 qd37GrAlCqXo6fDUCCQJ019v2JYRnrl8F+m1SvnUAwPFqyDvYxEt2kHM9TPiQyAGX8JW5
	 cc8563I/mGKKySZKhXhr5wDpJQOVcKG/8tT4HI/AS18H6UFNpr0DYhX8KZciwKcCAruqz
	 u1C1z+YjRCSE12yHc+QQNWiFG3FNCsJgnH6UyGUCO396tzMXUJqxShRbVvxStOw0C8wHA
	 jULxc46fBJNoFbLbxM4a8yBHrCUkzsw0/GffL5G7LD8f8qcXDbn35oiBsVNvWw9QdCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762822;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=vXEAxwgR53qCsC6oUjGL6Q/d6yVjQd9BSwRrQQPdXgs=;
	b=1po0C1uRjXMrEkaHqygIrWiTb96l2Zp2nphIDFC+GjsNR22+KG9dXRSvIRmyDTUvT+Vl
	 vQ3ARdbFz++zE8Z6CM/XxIG9x/e1rPO/xjFjXzeMKBYrmOIsi0RB5cXuXcinRmqYYSA/w
	 0Ql2rdKeN5aB3Q1waRUCKgRXRN7BJ3DSEOlzhIAXZrSKF1IDDpeR/wyRyJZhXoLAbTYDx
	 Wj5ajrUr+zIHHcGsf6B3/Oae9JAn1dv6po92faTYheG43bY14FOcNec4s5XKN7vpolggF
	 mA8Zw7czqnIdr5XCtJWU0JwYqqyaYBHa3YmJkx0ur3gaCb0+EatW1N9iyoDfWyXzabA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=EG28WIK7;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20D2606A329;
	Wed,  4 Nov 2026 03:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20D2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=EG28WIK7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=vXEAxwgR53qCsC6oUjGL6Q/d6yVjQd9BSw
	RrQQPdXgs=; b=EG28WIK7jUaNTF0bbljaHMnujXmwktyDzVhwlvpHeqBBq80/8E
	bQVJYvkbHxZ7SibduewZ8rs3nTBJbXZzxnpw4qvvg/8qUlI988wx31b8Irj7pNu8
	F3EsonawUuZv3K5uYnU0zVKoNjkeFDPn3lOVemnDwoTEHSy7xjRC2j4q4=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.194.56])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXnUH4pepqKzSAAA--.3770S7;
	Wed, 04 Nov 2026 11:26:57 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 5/5] arm64: dts: qcom: sm8750-lenovo-elden: describe the WL2868C regulators
Date: Wed,  4 Nov 2026 11:26:48 +0800
Message-ID: <20261104032648.209747-6-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAXnUH4pepqKzSAAA--.3770S7
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyfCw1rXry3tF45CrW3Wrg_yoW5Kw1DpF
	ZrXFsxCr4kCF1fJw45Wr1293WrWrs5GayDCryvkrWrA3y5AF1DGr9ayF1rAF18Jws7Cw1F
	yrW3Zry7AFn7Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmCb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzyIUUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2rqNlcjBwAhsy

The camera devices of the Lenovo Legion Y700 Gen4 are powered by a
WL2868C camera PMIC on i2c10: LDO1 feeds the rear sensor DVDD, LDO2 the
front sensor DVDD, LDO3 the front sensor AVDD, LDO4 the rear sensor
AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of both sensors and the VCM
VDDIO, all at fixed voltages including the offsets programmed by the
stock firmware. LDO6 is not wired out on this board.

i2c10 is a GENI I2C controller inside the qupv3_2 wrapper, so both
qupv3_2 and its gpi_dma2 parent are enabled alongside, otherwise i2c10
never populates and the regulators would never register.

The VSYS input of the PMIC is the always-on system rail of the tablet
and is described as a fixed regulator. The VIN12, VIN34, VIN5 and VIN7
inputs are fed by SPMI PMIC rails that are not described yet, so they
are left out and follow with the board series that adds the PMICs.

The consumers of these regulators (the rear sensor and its VCM on
cci0) are not described here: the CCI controllers are being added by
Hangxiang Ma's SM8750 series, and the sensor nodes follow with the
camera series that depends on it.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
index 821950715c..73f4452f46 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "sm8750.dtsi"
 
 / {
@@ -43,8 +44,86 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
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
 };
 
 &tlmm {
 	gpio-reserved-ranges = <39 1>, <74 1>;
+
+	camera_pmic_default: camera-pmic-default-state {
+		pins = "gpio126";
+		function = "gpio";
+		bias-disable;
+	};
 };
-- 
2.53.0

