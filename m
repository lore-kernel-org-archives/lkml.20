Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B1649502D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377038; cv=none; b=EqOQsO0fdiXGL0s1DhUIUfFJP7yv9sYCC3wl3OkxRsVRWbbf2vIO1Mn6d0bBhnlWdoA5yf4syiFICMgAsUtaB7C9vf82RAN24c9PsrwxOADicFkR9CMVDQxIxKooZhuxdSHBYZxoWlx0qtq3FBS/COWEuVlFmrEXRsk20eiVxXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377038; c=relaxed/simple;
	bh=w8s2+jwZCldmMKf5kr4Gkug5jm4WLxr/4uF9DbQ5NDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhhacqE//FUpudwDImaqfkk35MnWRZ/8vBdGfk4VFLobX4c3ONXSD7BjJUtm+U+34V2wIVxz9O3U++6WFwasiUQdLwKSe/VIESaDUukP820mDFAMacCcajazC8mRuM9SRL3zoWT/7ileNA0Zz45ZvmgYLYQXk0Gv1Njz1+8guP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0kINeeu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yw+0Ss8H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0kINeeu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yw+0Ss8H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVKpv4178561
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 12:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=; b=h0kINeeu1qnyTev/
	y4/Xg4uXqitgJyBqDTLdO039nlx0hS2utJPtSRq8RUXHda8j3u3nQmycs7hwcH/K
	6mKlrAfqBZJuWRJqoMxEHgf2j8m4cszm0lcSp53wCV47cpWL2kTyYTpiVAAOnh0R
	R1r0KRQ8U5BZlSbPp2N9JhYWOEuOtcgNq2OzRzcBFeUcvNdwV0qNnhpMjd0p0XgV
	MebGZdS6QnGyepEvQxYZzcQSbJxUaUMDL1gKQpuZIZ9eSvPLQvK4JvSBRiBCzLFo
	80L7F0r0GoI2R8ULD6Cc8qVrWDoMcZXGTA3HL5LRaEI653I6uYaJBXp6vQND1R6t
	jRQNlw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c60a4ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:43:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8d1e91c9so71799325ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377028; x=1791981828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=;
        b=Yw+0Ss8H5A6rucr2TYtexMv0YalY19rbK/heGIURFwP1EdZHv2AWLAUzbyhY6tW6lW
         KOxKM5ix8dS/SIFsxFiaJZvpVt7AzSlOESKaOEYWb5KeLSQRj1u6COb9irNHVGPQ7Mlk
         7X710Katil1rCleDW/klZUIQTJApNVl/3jnYemJLm68zQD53FBwv1VBtsmJWxerQXdgO
         zfmDnbjn3INvof9zpgZi2YgRLMPEt7MJVh3zHI1rgsfhRjBRbhKHoZzoLwZxNAZqtzEW
         a/QTtI0cSZPYka0bTF3Xi88LwWvMD3guAR4+eVTJLdyGUbhptaIojoARBrq0TuWu9skb
         zXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377028; x=1791981828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=;
        b=DgmywdqRCFwhQSjjpf4+vtHOTu+qs88tuDnMeBVi63hCQ1vsXo+zfWUaaPMx7qzkPt
         ZAJ42SoSNG1vQWZYXAax4Hmjj0p3bT3kxNNC2e/QUW3+Tt2YiwtA8PrNV7bhV4lzWL60
         OJXbfTy/JOpCnpXPPzorxQIoQtmjQ++ZIWI1VHNqCAtZx0vmux0OU63TweznQEgCVM3T
         1QKkTK3m+YUcnzhF4AZoZO2WebUqq6BHty+zdDxK/0krAsYm61oEhk8EqW4ggQ2RX3Bm
         sm28CuDtayKZ/Y0MsqEA9GR/L6BGt0hW7PPIy8xoj9qIlgLeeUqOJGMaAGU1FfcRMKoi
         u7bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNKLT5ZKZnzYEzuakdV7MRPfV1MlEqwSpVHyVmY6rfASlhXz4ZJG7cPKtM9nes9MJX2xyCO16xpbysr7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHNbsBvgbwdPom5HvEoIqQQTEJJ4qIN9Vr37mxcYl/5SHrMlhp
	DLcOASlvF4YehteNCsoIk4Fp3mw/Vk0CSf5IaLUrds1M3IbU0oY5TN6XNkPW4kWR9MP47lZioXy
	cbN2zYMaBI721i58veMiSmrOeye/a52x02QsX2GBjTWmtm+TCxa9EDjYmqdSga/T6Tdo=
X-Gm-Gg: AYBFou0M8qQoGZQBzy9Ag9lMWXfyyi5expyPeY4eJcgaVKqwD/5HmKZ8eQ0IO1ECHQS
	HblgspzhQe7UV7HduwwYb5LMVKRZ10O6AUwSLcUWfIO6i0vI3/R38Fms9v5O5I2dckE52nnmBiP
	UeT1dQWG6YOTqKy39WrGCL76JvG8BFUBZgCy+dyWyxgzlQA9gcZyU+c/FwW46GO7Xql1JNbXHmA
	EWe1vq5ESSdhfCGNcpuow14yiJnCVA67p731g5n9uNBj+yRA9MAd6QmiRdzvOpn69LuuYZKs9Eh
	jNcAMSkkqZmOVlUl/dxYouh6EG9x9jIMmbYJ1ALC9mx9vAmtvM7fsExXXmnluwPCY7MkJ6TELJb
	SCH0j3zrPWOsmrpQTyiA7mf9Y
X-Received: by 2002:a17:902:d4d0:b0:2e6:dbf:c4bf with SMTP id d9443c01a7336-2e60dbfc8d3mr12530955ad.15.1791377028086;
        Wed, 07 Oct 2026 05:43:48 -0700 (PDT)
X-Received: by 2002:a17:902:d4d0:b0:2e6:dbf:c4bf with SMTP id d9443c01a7336-2e60dbfc8d3mr12530705ad.15.1791377027565;
        Wed, 07 Oct 2026 05:43:47 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604437bb7sm9680245ad.1.2026.10.07.05.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:43:46 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 18:13:26 +0530
Subject: [PATCH v4 v4 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-master_lt9611uxd-v4-1-5eac97965ff8@oss.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-5eac97965ff8@oss.qualcomm.com>
In-Reply-To: <20261007-master_lt9611uxd-v4-0-5eac97965ff8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791377016; l=3599;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=w8s2+jwZCldmMKf5kr4Gkug5jm4WLxr/4uF9DbQ5NDo=;
 b=UMPPjF4ued/WTu/Fx+O6DyPKzY0uli1fPnKRGuj1z8VWeUnRdeFUktYDFyVxgJBy9Ga5w4Jcz
 Cu7JPYkuWZsC4FmHHBrIoe3+IOCYA3LNPz48lE8TIzGKx3tQ0jn6Zx1
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: 7W8-Av5gtlHLRME1ngiXaCBY3M_5pA0K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfX+PKSAN/WTZzh
 WKAlDRDQ6Kib/DPniPAau8zqV9DDhEwGaNNJFyzBck50mfiLl8u2ZrDzscYTbryRXB6SkHNseJO
 VZcdRGl3Fev+E22zuNcIfaDfKWIK6sY=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac63e85 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Dh2IlRrSrxxA8ivr3KQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7W8-Av5gtlHLRME1ngiXaCBY3M_5pA0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MCBTYWx0ZWRfX/xGGNPaz+jUv
 Q1EaVXfOL/dNcSoSKFqtykMilb/uapYVHx9TWEpG0OfzD4q1EoKGx4ZNfYJgvoTDt2aMPaLdz4Z
 c5HlgqsHnfX8RmksK9L8L5ATeBHLQM9JWzZ6G3SLbsRktgDeumY7hM8HtWYOPMoRSO/SfAIWgKT
 UD8909V96LTbLW3122D1ZwGVuQCXFb7TmF6VDOA9tMjWE6fjrnP4DGOssSYV6ReOyhH7NVK5uh/
 qfmGpz2aoDJ2WrvEY4V0NOKoZSyq6/HL7lR2g2BEVic9kRLcSv9KjqEcx43tkfYENbVm1M91BKG
 sLZLjhXzdRRAXZ8fGfMbrDfw6zICJ7DrwnO6N3MREYsmrJFEAvBCebbIdenjgNJ/IdmF0hpNgbu
 hFOySRdGBSkeJHW5gIb8ZVt519E3bv0/+TeBpyfMhwBRm+DDPqN/ALUMl1+mt7KRbzq4Po80pnp
 FeapwGQPpQk0yUBtm1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070050

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
rail. Reset is on GPIO76 and interrupt on GPIO85.

The bridge receives DSI output from MDSS and drives an HDMI-A
connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.

Regulator and pinctrl labels use generic board-level names
(vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
from the bridge chip.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..fee93410b2e4 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -8,6 +8,7 @@
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -23,6 +24,98 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	lt9611uxd: lt9611uxd@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&pm8150_s4>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -67,6 +160,22 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;

-- 
2.34.1

