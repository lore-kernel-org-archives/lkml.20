Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3811251A15A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073792; cv=none; b=HKQgdyCK5YpQW6g32GxTofXN4o7dXNxG1a6KuCyQeZ3GRx3u+DZgPmYGbfft8gMsICieB4fqIqb1S/IIYI1Ga5l1jNDNd+bYy6riKlpRX1o2IrnFG/mcb3eKR+f7JtqgZExIdxJR/9H6cT8jOhVXc8LnCAZRpr+Kq+/goHYi8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073792; c=relaxed/simple;
	bh=iguCScBr7c+PEbcCLD4EZyGD7fEzM3bqpPRXLUqwuds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRf6oqvPqhKhLRLWg3udyuihMyTyImEWZJLRGy3b7XhJDfFZAv1zW57s57VJNd7ibdykhd/QgUUnfpDsO9RQWCbzc9Tx4nx6z34NP03huZ9GRHBUpfKHWt9SBMy7+7Yz1Br7+Pl2o8KfOyxpb5WDLDFcb8YYDelPTTO/KIg5bLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUuR/lCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIC/hexV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUuR/lCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIC/hexV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7LBHD3186119
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=; b=fUuR/lCnx+66nAS8
	HpKQ/AtwzaFd3/LZXYC9kQhG8QJ9ChcMipO6RIdNtghPduivsV7tQb6e04C8SJke
	tP/D907fxvCa239LCdQqOXFkh5G94TdGhULAxqOt1LOvN5QTVfE/+5NcXFnvOzk2
	ZjOL0XSti2CogHfVKnIM/fwT2iftImZ9Flzy+FKcYR88zBNenJu9kmCDfZCn5XMR
	k5EDl0AvOjD7HCdDV3+rt7IoKpnbpP/kJ2JljgKJxGhFdCEErQuSg/eTVmD7BS/E
	iFzpwOrMNtOXUWPP/nZb3ZF1SVvTOpv+FSZW0diAic9HCpTcAB30OZ0qrsfTvLgp
	VrzhhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybj5hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:43:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5106787a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073789; x=1790678589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=;
        b=kIC/hexVs1hRYnJZl9HSEv9PVeTeKGoKZoh2Po0GAly9NLtEGHqN9gh+6LefC6uqeD
         AlrE4ok0wlFGgJforSSMHbjlxA+M6ojmssPOYcL+/1L4kxnZodKiQSYEM9iOvEVrNH49
         /OFecP/xY89nBc88hj7Gw3Ra1Rs/n5YP5QavlpZUMjE4FK6bbTGc2yDImnairOYpyBtX
         SD0t+uB7Gkca4r4NoVCrV5LFPjM+VWlJZC106StWIXLJ44RbbOPWX15PB+FIKZdSmiQn
         TBm5p2rHG/lvF49VG1MeH2xhPWPCNDROgbU506ZRMn+HkOjP9+vfG8T39lb9KIT0YqLj
         Uogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073789; x=1790678589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=;
        b=uN9vE2HRSSjSRbR43L82uTSpf7xNN+jiSpaJD26XcnHkEpfOK4AEtpS54+EiFHGzuJ
         0f3pYeBRIyBW0FvWIeib1TY42KAc9d97/U+dAU+S/EjtFz9tW8OfTCl7YyskgFbBmKvU
         0wcqzpuFXlK2jryyomYhmPo7iN9zs30w8gDf+lKHp7dA8ydelzXemONSqr2UW6AHjBSG
         lNkl7bgYUPvtIVOPtXfeiN4y7Gde/6DFl8wlBVSgl39iXOZbL5l6dlZxi8eghtMZjSbO
         emTdDVAy303LiItAchKOw3mzEZOcqbtEJ2y3GwjLtv9tE0zpXOAERi1F/URLiyWBaH0H
         oOqw==
X-Forwarded-Encrypted: i=1; AKwUvBwoYsl+TR6R7erKsieVc8dpj/LZpgOto7/eAfZu735Rqe5k8m9H429+l9nvLg0+ORayjiYmdBp+X7oYMbs=@vger.kernel.org
X-Gm-Message-State: AFuF++mgkJtDJxXCQuGRFJVyzZk+KzXKJi9x55jOKSgkx29gbSYparOP
	nzg+LGyZ0TUgoMMIYjJnuzNNcJ9oVDgr7OBNMm0OYM2QBU7aoBXNdpAHfmo2DA/skJpV65QYltd
	P3DFQEYO2n9pvEzioDaFuLhwcc8K3ZujX+arEqcVDV9QhL4/gfy1G7p/EFeIsxjCBG2o=
X-Gm-Gg: AYBFou166KP8uTa+HVWVWGrXLi6tBm5kLmMILy8kBaeXKd04KDQ8jdepekcAP4bFCb/
	SmgRI6tXRLrL9JAE7+KOL6CHSkxKeVfGTOQ9Qzj+wMe4uo6hdqNUJB0tPF0BKaochLIr28EA/Ty
	ia9ymAFcKeqhzhQRCH7cLqzbhvwmWfNmJdPHP+VJz3Xz7GYPdJk7oMb+t/nCmn1GqLOSt1PTitN
	CwArdRcQEuBDY2uAoDw6hq0UBBNWI7y91jWNrieLvIjZ7Rqdn9rVquqE6yGJFOEAR51oJ0YxNnB
	/SobJ2QlEhR/zypGFsbvcafE+vDEW0wag7It0RQoGBQCfUQisdHAFV/44p/eAOsvnNWNk16JLo8
	/S0ED2dQthaYcWWPJOgetuikMNHpvBk4=
X-Received: by 2002:a17:90b:2e8f:b0:39e:6c6a:4b6b with SMTP id 98e67ed59e1d1-3a07324b45fmr783776a91.53.1790073788844;
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8f:b0:39e:6c6a:4b6b with SMTP id 98e67ed59e1d1-3a07324b45fmr783752a91.53.1790073788382;
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d8762sm4404015c88.5.2026.09.22.03.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:12:52 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073776; l=7732;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=iguCScBr7c+PEbcCLD4EZyGD7fEzM3bqpPRXLUqwuds=;
 b=IIIccaIswBwkQ2N3BQfJDM3EDzOK6wun5TyUAnVAKdoRnEr4Ia2fkfITfDa7vh5jfod6EPdCa
 L/rzxxatuq8AhoqubfZr6sXrUlQYH18fAj4m8/9KEvLMWJxyo7qN28w
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab25bbd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fX3ZoPcK7U9-Bz4LDg8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Sxs3tvbqfE5Qgqi0-42bWDEqNGRK2Jus
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX+DRbwbPEkO/L
 4DZJCkzo7M6FVVwSgKHZhmVO2ecBYkhMFB9mzPYeKGALyjs0c/eTTb2ca2BHfKZeP2vLszX7+lZ
 ftaTkO80l7+VtIXdvDqsN8QzQAhTuicebGM5epTS7PTXBIBqA1AnsOFPjL1xu7nBQQ/Z7DZLTF5
 ARkVcOOHcDW5X6D5RmpZfvjQfAYYq61RC2icqQvEa88rsCrOT4s1DJr5Mbzv+hmKuxHsjeL/jT5
 KKkoxo50VTZYSty3YFBPoq75apRqhxQRc8PTH3q/8DDP6Rt6eqn8U6xsBR+kCq8WutbZ/6G/loJ
 PwGouIteExfwzno0+F8HHIFX4N8FH+f4b1e1AZKLxvZ834+GJ3ijXep70oZftRXmUwTwyW0p/aj
 aOpOjSDjiyL6i3zKUx5TZbGTu+RSHc3k9m7TJVnnieR2RL9QOduUzDY8M1OVcvzOHEbgXoac0R1
 eeqWSE9MegCldhTmRHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX835zn2G7h+4M
 DRPIGKOOXR/NCG0znZcbeb5HeWkwoLvuHsymciEM+TrNo4v1jXT9pZJYBzhcFnAeQj8mOydqjZK
 xRgwuXkZ6D6jkCyKIW72OEoJpgVo+zw=
X-Proofpoint-GUID: Sxs3tvbqfE5Qgqi0-42bWDEqNGRK2Jus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

Purwa IoT EVK variants are available with and without an eDP panel.
When the panel is not connected, DP3 is unused, but the base
DTS still describes the eDP panel and display path.

This causes the eDP-panel driver to probe an unavailable panel, resulting
in AUX probe timeouts and missing display modes. Userspace then attempts
display commits through the eDP connector, causing repeated DPU vblank,
frame-done, and IRQ timeout errors.

Move the DP3 and eDP panel specific nodes into an overlay so the base
DTB describes the configuration without the panel, while the overlay
enables eDP panel for boards with the panel connected.

DT overlays cannot remove properties from a node defined in the base
DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
where it takes effect.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 3 files changed, 127 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 78518156bc28..00837e145732 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -174,6 +174,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
+purwa-iot-evk-edp-dtbs	:= purwa-iot-evk.dtb purwa-iot-evk-edp.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-edp.dtb
+
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
new file mode 100644
index 000000000000..0929fc0358eb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
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
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&mdss_dp3 {
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&tlmm {
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 6fc6fe7c0899..92aaec4ddd3e 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -19,16 +19,6 @@ aliases {
 		serial1 = &uart14;
 	};
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-		power-supply = <&vreg_edp_bl>;
-
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
-	};
-
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -205,38 +195,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
 		};
 	};
 
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_edp_bl: regulator-edp-bl {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VBL9";
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_bl_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -917,40 +875,6 @@ &mdss_dp2_out {
 
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
-
-	pinctrl-0 = <&edp0_hpd_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-
-			backlight = <&backlight>;
-			power-supply = <&vreg_edp_3p3>;
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
 };
 
 &pcie3_port0 {
@@ -1070,19 +994,6 @@ led@2 {
 };
 
 &pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>;
-		input-disable;
-		output-enable;
-	};
-
-	edp_bl_reg_en: edp-bl-reg-en-state {
-		pins = "gpio10";
-		function = "normal";
-	};
-
 	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -1111,17 +1022,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
 
@@ -1268,13 +1168,6 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.55.0

