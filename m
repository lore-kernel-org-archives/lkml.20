Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F59364042
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785920; cv=none; b=KTcLIvwm47NIrrq9at8hRQJlp4awo2vxp6e1Q6U0p3C0J/Vmg24hp7ZbULbtbwAGTra9BkS2lh0UxloDUTV8UkIiKWSKlJEL04UmiGbOvdTI3eLYdPXMNSEiORp9VJInRs40XpuM5YDSozwqFm1x7phlcs+w1qJB0chZlZ6ctOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785920; c=relaxed/simple;
	bh=VF1vrOXjDwUFWOcoVC41AZp8SxZqlzs7+l7buexvvxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJH1VtPHci/4wNjKjk0JDjS85uIXfKxYjRfz6SRm0iTWaZO212lnItH6p5aK+aSr4sHYmf5+FKop14xrPdkQ7Wx94+UZv6NwRNhJTdzdqwOSenfyrFzC1WTw087XvzvHdqXiupsStV14+UJyNCQCwD3eQAydHXcechUAwQkpZa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lM6errTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHhs4rPX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lM6errTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHhs4rPX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55uhO4068701
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpKGhxV2U6/k2hH55xfHmfB9z/ibmAvg9cQSC3I9wEU=; b=lM6errTR4LNMs0+Y
	SVRJTJg+XybfajaDLhtoFs6kswcLvPqbn6nukAFL9l1Y1sk7xbMM2cM0e8JsCoJz
	j4XCHexXW5bLmpdOOOeP2x71FIrIYYSbk4xReHTJhH3UlM4q9Yn/tkSRpGbg1CSB
	Xph32GFlZkSAeKtL7YZjSWca0y00oshh8XCliw+Aeng9pjO+VLFD2dne4xjJ7T66
	QEQFZ8IPv9UT879G7ZHf1dnxPQR3xrrhnHKhktDkLNNAlTNLAoWOQYafG53FhxqO
	w/DNc16lYSN9oYF+iz7ornM3g1Q8aKSi1WFYlFtx0HMH1TEUZUABCXtPeMgUxPcG
	Y5momw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjmwbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso880011a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785918; x=1792390718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpKGhxV2U6/k2hH55xfHmfB9z/ibmAvg9cQSC3I9wEU=;
        b=hHhs4rPX+V+W3haNm6nYI2h6aTAd8ZyVIX3fwDqu8ZTIpAhLhStmw+xsoXXMXkYET9
         q/04po6X+WnCG4SaVWl/4kSjsjiM7EnzTJBWSzElJueecECLdC7ATB5NLzWQhbsjDbgO
         lg7GTHs0DDgtynzjqLBfrEh5uGR3OV782dMuiEugDsgt7N9uFQ2vfUolUswRlmHca2Lj
         rHqdMvDlXAssL8HkBKmkbmQPi7DfxHJDoP4lJ3mH7t7LKbNVF3FohKeWtzeDee9MkLce
         IQtKSa3fiQaiQXOpkH2vF+KJZXC2U48XkO9DGxWkpyDm9mai5FcDKeYoHPIZ3v4aBNJA
         nRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785918; x=1792390718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpKGhxV2U6/k2hH55xfHmfB9z/ibmAvg9cQSC3I9wEU=;
        b=FxDUSaVuyCmZSoKyok/wCCqzwRN4F1ReaxoR9RD7On21xQN7M2/5RB4d3l11z68/9W
         7F8sBW9VZdPDdD7D/Dn17vUqusOWdYBJOQ5bIzSpUTGhcu9DIh9ZOxbaQgNQ6ApuR+Xe
         WhiiQoY1iIKqL0BDYNV5xwjZ1gXcG006hdMuu9LYHW6hcOn4iVIYhurIbIHbC6jVRWhX
         EDpHDhpVB9ZJzgAdHBE+Flm6/oHccSvpm+KtXrikCpewBBbeNpaxsTD1FanCk5RmBAsZ
         NdT2sz1LxRI3B/Z/V4F8olZNxOPM/h17dqZYlx52bJdVGDanc+gSsreqv9qtodWDkGCd
         Abdw==
X-Forwarded-Encrypted: i=1; AKwUvBz/942jOwed3dFjwr/gi9le/UdeF1WSBxgSFFkiTik0JGoQrRvpB2gQA712/nTO5CNC1jGaqE6TfnDM5xY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3oCAlKcdrsGyVORTgrkRICI9iaMYOZqdZYbC1iFpW4dTEktkL
	RO3rRqiGLorDsMeke0Sw5xjN22acVdxm+TsnUq+/1QnjYQQlxc7H7tf3k5xcA//gwZ6Rmf+RbdQ
	87ttTvSk0Q8cXDKoBFVpI5SIzlZIfyDDMNB68uRZPPH9HuANFJQxEsthjby3J29OpOto=
X-Gm-Gg: AYBFou2BIi307ywh4WwBDsTnPsOAQNM0sWzQ8OA17NtOXHeXDdWIP7P6OFSOzoozWiz
	uLUXxS/aHEZZTTZgr0HUsk8c5DkkivL4Fbyd1YoAX7iL5m6EUMYY9ISq46OFgQ8W7wBeYN5Wi81
	c594WPgAdmL8npxAujnNWL0+GDD+6QbosMzCxZcCH7Kp7uTN1cvYOQ3kbOeAtBxjcJ2BwCMSZUt
	omsDSeKhWrCuEUSDCbPRJCJX8iAPK4obGSxcPQoPGWxOJG/wUxLXf+iAhPceKDdCBoxMs2XAFKe
	IuiEg4xfm3lirsTtG967IYaL00jFs2+S0loNF5fU+1Eauin+3FGRy71D8hFSHdJpHPofBv0YE5M
	bNChD1zrvrRikfLnVGl4A
X-Received: by 2002:a05:6a20:6a0b:b0:3e1:348d:b477 with SMTP id adf61e73a8af0-3e16bf7e317mr7850145637.20.1791785918180;
        Sun, 11 Oct 2026 23:18:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0b:b0:3e1:348d:b477 with SMTP id adf61e73a8af0-3e16bf7e317mr7850131637.20.1791785917711;
        Sun, 11 Oct 2026 23:18:37 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:37 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:46:28 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX5WWaC/nexivT
 +R8GKbNCKep71lc5BEiDtwwFOvs41kCt28Wr/wN45GOwj/uJ+KsBRngzvunnxARJ594KyP1FoU7
 rilxnrgOFHb2dANl2fl3W/Z1oVQbg15A6FdURa+G3i56rsh0HoF2EtqCbfh8PJMDwvc9FEtriRv
 UIL+m+AmxgBzbqWBc8OAL7w96IjQvBKuoKaKJN08M8EeNp62zoX8PUf2id+8qkNXrcJOpSE8CUW
 n3FCui4nqEnnzv48PpTU1g14i5PuBOeNFlt/bx77NGYTOq17EUOBMjwKkyto9Hpa08Ei1nGEu6m
 c5YEjxTlh1cFHnfag67EnImEEgChM58MfuiM35mr8BaIgfalr7jK3KICbZsGqQG9PvZjrECGRzq
 GrlzLparTDq+896SdGBcOGqWNzg40AHDtZKhEn4g/1KUwo9r8JOTvp5enGHHpDvis/kdtl8sG3Z
 HHgGX81o6QMahO4VDtA==
X-Proofpoint-ORIG-GUID: HipKt1KTxl8mcGVZGkGBmB1jr3tvIGCJ
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc7bbe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dSjqtUHhm-0m3M1yROkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: HipKt1KTxl8mcGVZGkGBmB1jr3tvIGCJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX5y5lOylSD4Kw
 YYllr4GjEzbg/hryLQbbfn/3WjfC9/nhIFvWaG1sanAFw9iqrZgYYRl4gmaJPtU3yn83vL0s0jl
 dXGHN14UYR0GWqmQP/depU4338Q/OQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120024

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the device tree for the Talos Lyra EVK platform which combines
the Talos Lyra EVK SoM and Lyra carrier board.

This device tree adds board-specific peripheral configuration on top
of the SoM, including:

- Native DisplayPort output
- GPIO expanders on i2c5
- SPI-attached TPM (ST33)
- USB host and peripheral controllers
- Power and reset keys

Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..2f25575e6efe 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -456,6 +456,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
 
 talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
new file mode 100644
index 000000000000..cfb563658fe0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-lyra-evk-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS615 Talos lyra EVK";
+	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&spi6 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_2 {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};

-- 
2.43.0

