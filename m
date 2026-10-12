Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92935472536
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798527; cv=none; b=sGfNs5sjKNbptygtbryBGOmFw6ry1kKkLoK3mfEViD05dyEDCy7HZ+UHwEbR+nJVwzIL2T3p2qSTZtk2FpsxXPrki70scXBH4LrUTg7X189MzIEV/n3jgrgu9RXt/+S84Zri3n9pVXO5/2q8jswAt1NIEx8m9d6/5bWLZtRMrJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798527; c=relaxed/simple;
	bh=4BbMmfzMF5lvVMk7GGQMOWA3sAGRqyPhsZM4uh38LGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btasbPceTvo5eDx2+AG+TaUe0c68Y3Lx9YOsFz93mMm9pBTu3Iye+9/0nNQQi3qEhRYtW+yTNZYRsYtLS1+6wdVcOSICSSyKD4z/DvnZD5SvIUodvDZxjPANe53ljGhvTJ4g6yxRgaofsmog4nTtgSvEH9hVvmhpB4xgzjhcAvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhrToNRo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KlwoNERF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhrToNRo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KlwoNERF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KdDw1592800
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0l/sfOavHqjSmoYSJ+2Y03gzAvSOn7dx3/F
	A1a4dFX0=; b=lhrToNRoF8mTAQ7OYp1iwu2KQB7yvvDwK++iJDWgTmR8HIZt7Y/
	vUWPCispdOmiefkbx5NuRsDJLZ41IksnLhDh2yx7iW1K7F6OxVYd9cO+eAgsPWVb
	CWqY32QTGEnrt46XkwwnKYBg75vk7ioubo31c9awIcP5UikEXZobmAwh6fs2Btj3
	XTRNA93b8C6FZ7z/Wan3QTJKBz7rfFPlWyCKJL/fDfnDSTuadzQ1DuFKDbn2r2Xj
	8pHwZm/5yh/IJ3AkAnvmYNgbTlQ/P94svT+tqyZirOzwd+PdBaKeqUwJUd+WO6iI
	fFi56ndxFADvlz4r8NedvY013MZ9qRRK1OA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu13g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:48:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so4856138eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798523; x=1792403323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0l/sfOavHqjSmoYSJ+2Y03gzAvSOn7dx3/FA1a4dFX0=;
        b=KlwoNERFgiOcPotjWI7reB5pvFeMwlmV01HF4EPxrh6SZsg/kxIRCcaUymWKqACF1Y
         97LusDgLKq9zvpv8TU6PVCfb+FShVpdfJVjc4Mx2URPBIltN9yf6l9T8pHyfphJWG7xr
         jKkCf1iZTNukvJHSLGTvcA1qDjRatcUzf7fQFav7+d8k0YC8xcKl2o/omLJj2FrlVY5Q
         2KTEBnEehvi2Zalpzg0t0tnNsb8ke/+7KQQ1yQSdDBlrYmSIxy33Zvvj/p1oeP2CWt18
         LGMR7VJ7BsmoL+WI8nC7ilUUgZvkjOUJMzKG05Ykzbm69fZ2//lN5Bj/dbbZGGvFMIyD
         p1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798523; x=1792403323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0l/sfOavHqjSmoYSJ+2Y03gzAvSOn7dx3/FA1a4dFX0=;
        b=IpPipMFEe7fi/OwnxbtbBBQu0Qu66VsZCvU6hAcBXZfGXGa/pUxV5/AZ9+/xOsqppS
         FyU6eFtp08SA9QKHUgiNR8Fg+1IFMl3297m8NSVw25geizODimFkrU2fcdYSHMbrOPLz
         trlqB09+AKMxHj9aALtCd3U/8PX/ElNiZRdgg/LefYgty2Gs1pGitcswFTc73BtyI7mw
         M4h/3uyNGWLB/adpIBVJwmQ1sRwbtIISnOJzzwMJTy8n6uQx9nqG01rAq+JWOeKJgceK
         tqmt8MdoPyOiBgBe/xQ5VjufyXgXoKSpFWpIfMcZd1b5inS/HCH8Cqru1q6c1k1Cwc9z
         Medw==
X-Forwarded-Encrypted: i=1; AKwUvBzgBASbOC5UlfBJREscbYdqm+/Ce+IshhPyjo3NMVC6BvPFkItweooGX+CV7GVeAYfcCOXFRgf5i0DKiRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEbk2awDXujrSzlncS7zuzZtJWGeLohEkbVQz8OyFve9CsqSht
	8Yi0IXwnIXAPPiQmcv6ECXebE48lfl5PmxlWcXAzfcMJpB78ierH0R9PuoZdmquJ5CgPO3oDedE
	0PTbki4VG3hERxIRENYoQamA84ATi9evFxZd8zZbF7aelKbY/T/8j6pYu5uWw6zemCkg=
X-Gm-Gg: AYBFou1sg9GNursht986UpmumRwjsDpcwln/V6kiBxPyBZJB+cydHGJvap0yZnzI6Jn
	OdRhmV6/fHm8EHpqmxXxrvWKudo2IbIArVRFJ1Hbr4A6cugfhqdKhO4eI4l9qf7xx8Gt+Rtu0qi
	/sxzSYIREBHoQVx+2xClAht6abyPPxVcto692qN44ubDyg28HC72KxU3xXVT3S/rFYNoKnI2HgB
	TGOYDIIk0+BHxIpUUkPP8cSBgv7epfOPABCnXOdPh9qeXWRBjAIAFxoWael0gWfsMETv2bWV0jF
	VlHdKsRH1LcG6o/N+zOvK7z6AvAmiIHJBddyHz+MmnZAMFFnwqx6TWncXFcknPMOCL1sA+z13c7
	oCpzVWY+W/6e9ckbF+dz0vPy7QZA=
X-Received: by 2002:a05:7022:5f0b:b0:167:4198:2cb3 with SMTP id a92af1059eb24-16a5f5de930mr12895122c88.18.1791798523236;
        Mon, 12 Oct 2026 02:48:43 -0700 (PDT)
X-Received: by 2002:a05:7022:5f0b:b0:167:4198:2cb3 with SMTP id a92af1059eb24-16a5f5de930mr12895076c88.18.1791798522473;
        Mon, 12 Oct 2026 02:48:42 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a5866477sm27603289c88.22.2026.10.12.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:48:41 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Mon, 12 Oct 2026 15:15:00 +0530
Message-ID: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accacfc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ma0iw96SZgBQPb5D2AYA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX6dgnfc69QPux
 bbQOdv5J0IJJRVwOLKtC/aVgRXYpmSvCqjyBqYEn5zEtWPOYZLEYLEHc2apA2SiDoOvP79YD+CT
 wGwcD2YDieyWegqvw/nGgZc5m5H2XF9Od9ocpy720QrmLcfblcFJN1O0tR31+RDVCPGJhsb3NGY
 jxGY6tlQB2NS3dAKEHY+RVXEw8iRwrZThFt50wntYAzhR0hEnXd8cS76VXRIZHbUB5Z8mpByrHx
 g2mnoM7fP5kXmTbnMEtGc9cUqmX2kw7grdiwrFQNIwJdHHg79l0mRDe61TVOyIPW6ZJvuXQoGMA
 O7ey0QuYgYsTw2DZRXwt/hrTZZRe2/OMIy61VVclDvUhU5lGiPQgfQdHb9opzCfNyzBb2IkkUmE
 89sjiRMSAaoRzKGVQQhAzZjSJLyORClkS7GOhXNfq5jwyP80BkQavWZnIsuQViqlAsT+X6aOGrI
 j6ifXW+lQG3g1pTAoEg==
X-Proofpoint-ORIG-GUID: JcjBQ-EP8M_h9vTVgJUelr-Q6L0GWT_k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX+MRIQu5UNcr2
 ZU8dQfPWetccus+dNReRnv+U/b0cQB6QJK9hUc1T0cJgNFmOgn8RRKvIYlKnODmHLNghk6jg1l4
 cwCSl4TE03bbAHdFT5qJT0WeRLRqaOE=
X-Proofpoint-GUID: JcjBQ-EP8M_h9vTVgJUelr-Q6L0GWT_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120038

This series adds support for the Cypress cypd6129/cypd6229 dual
Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
handle usb-role-switch, and wires up the corresponding DT nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
Patch v3 adds the Shikra board-specific Device Tree changes required to
connect the CYPD6129/CYPD6229 Type-C PD controllers to the USB controllers.

On the CQM and CQS platforms, enable the CYPD6129 controller on I2C3,
configure its GPIO136 interrupt, and connect its Type-C connector to USB2.
Both USB controllers are configured in OTG mode to allow role switching.

On the IQS platform, enable the CYPD6229 controller with the CYPD6129
fallback compatible, configure its GPIO50 interrupt, and describe both
Type-C connectors. The first connector is connected to USB2, while the
second connector is connected to USB1, including its SuperSpeed path.

The changes also add the required pinctrl configuration, wakeup-source
property, I2C alias, VBUS boost GPIO hog, and USB endpoint
remote-endpoint connections.

Link to v2: Link: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Link to Driver and DT-binding change:
https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/

base commit Link: https://lore.kernel.org/all/20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com/
commit e77b5e2b5816bfb8fab930156a320550ee5a0ffe

---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  57 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  57 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++
 3 files changed, 223 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 2d26435b257a..508c24a2ce99 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -14,6 +14,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
 	};
@@ -23,6 +24,43 @@ chosen {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -66,6 +104,15 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
@@ -82,6 +129,16 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2 {
+	dr_mode = "otg";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port>;
+		};
+	};
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index fcafd8aa6384..eaa79b2960a9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -14,6 +14,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
 	};
@@ -23,6 +24,43 @@ chosen {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -66,6 +104,15 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &usb_1 {
 	dr_mode = "otg";
 };
@@ -82,6 +129,16 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2 {
+	dr_mode = "otg";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port>;
+		};
+	};
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 779b9582c011..f7dc3026d028 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -14,6 +14,7 @@ / {
 	chassis-type = "embedded";
 
 	aliases {
+		i2c3 = &i2c3;
 		mmc0 = &sdhc_1;
 		serial0 = &uart0;
 	};
@@ -23,6 +24,72 @@ chosen {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6229", "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB2-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		ccg_typec_con1: connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB3-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_port_1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -58,6 +125,32 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	vbus_boost_5v: vbus-boost-5v-hog {
+		gpio-hog;
+		gpios = <79 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "vbus-boost-5v";
+	};
+
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio50";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	dr_mode = "otg";
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -66,6 +159,18 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2 {
+	dr_mode = "otg";
+
+	status = "okay";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port0_hs>;
+		};
+	};
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -80,3 +185,7 @@ &usb_qmpphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ucsi_ccg_port_1_ss>;
+};
-- 
2.43.0

