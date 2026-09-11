Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC0D3624DE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136489; cv=none; b=CTowdK4IL4wvsu8SOFfaD/43t5+hlvrUPlMkhWpDApIY2ES4qiLl4YZJMnBvttVivwVaHvk9fyoeCikmwGJr38u6KlEabsN4Iqy5pU6UyxKrCRNX02FdTrtzs7NPdBws5zyrDbVwSc6BmNbcbzg0DaDFlsmaWEUW8TJt/EIK+Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136489; c=relaxed/simple;
	bh=j34HCvDnyV60TiOg8wnGal4xDBj77r6xWyiOkD1AIWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0TDD57xtHdFJWMzzpT1aNvRvV1/1C3xK3X4//gLHR4cX3zGpZmGkcSDTf5QgtK8n/LNHkDTQUl5FWX6nA3lOe/zmk9TUUj5yZkxWihSCexD3Nk+T05wLb2n7tE6+D73qOLe+tnmHFb07DiUp/3LNFUgYtZlq69383nXBWoP0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBOu8CSV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3kmQB4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBOu8CSV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3kmQB4K"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiXNM815374
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pyGC5OTLryM
	neYhveJCwVRDyw47FoxDcsZPQ6mUAYkQ=; b=ZBOu8CSVfqF7G1DrbKP1sZUYOSC
	7xn++Tu5DFcEWTJ9vVI8T/xKD222auGP5b+3vBEz516thaes4ZvHhdaXWYCPDGWK
	KYDra07pL57LKEymf5TN0CdcrSg1oRHAD/1hERw+ijKE5CPwJXOnlDKBCDVqv48J
	F3TPoCpR9EvCSkEwbgjXzKk0BXbpAfe1mc/KxNvEQSgW0X09eWxUKaHucAQV+blE
	E7grSO2LSTaL4UCaS4D4EvEUXUTi+Jq3/7qP6CYZ0EsCZo2EV+stUYb0tDT3xtb3
	Ln9bHCIpiQhcRHg8a0AU32U/J1/NqR0Q+kdB9tHRu0raqaADxbTTB8XmL9g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3a5d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:27 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-671205c2f1aso1344759d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136486; x=1789741286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pyGC5OTLryMneYhveJCwVRDyw47FoxDcsZPQ6mUAYkQ=;
        b=j3kmQB4Ku3pYz3rvRn6EnJsPE7cuotFEprkLDYslOzkRE6IaOlaHwrMNRTrpaA44XG
         Zc4BKqg7WZQ5LYFoR82G+yitAP+WFcOKLC/bDXOwlEOUnpy60qX2Iy7+TZTdRheysU4N
         9MSUxEHia6H0LtxBB5mk2aovVmXTk1lcWqF1hYz80I4H2WlAJZZzqt1RaP/JwK1BhEzL
         aiFq7Wwoa2GZZ7PID4UqDqD+eyouugzNSmVAecI+3aKn9NxeG8k2fWPtSJsAKcWuHmgn
         NRlBdXeen3DCFZ20+5K3JXCAITX4noX+mDykIkTqzk/Sb+apMrkAtoAWIZ0agKanSVSR
         j51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136486; x=1789741286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pyGC5OTLryMneYhveJCwVRDyw47FoxDcsZPQ6mUAYkQ=;
        b=VLzHCxEdLynCi4jEqH1SxmR4zgKiEcHrnMelP5GwhJC4klwRWLenxgptSEam3Yl/eZ
         GMI0JCvm6SIwQYgEGIHz6zZ0nhVnhMCYnwMhlR8lgB3CeXfJsROYHZjboOQZ7MxCoaoE
         75UuzTlVCWhhNU6k558qyP7f/wmZKPs8YJXIeGbJgO997De5fmFNnASDNLYiuSXBQEnX
         tQf8rPYzvB/AicmOYHAGKeIStAg9N/Vs5YhpW+6MWUGhL1W45K6pa1NS79aRZiEhSNm2
         Mh8mbetyP0nZApaODo4gMYZQjtAW+g/Fkq7qnZuodKyKv6rbCKKHHbvt9hX6wET9+Z4M
         oGuw==
X-Forwarded-Encrypted: i=1; AKwUvBxIwepfmwz+nLepy41KFFkhDeDgsefgIyF3ubb2gu34RyLveAqN9CbWHhE+sFeyT4Bl8OezVSJ3ezZdfRM=@vger.kernel.org
X-Gm-Message-State: AFuF++lCNthsIX/ycZuDENfufbXXoxIMQLlj4ILA7n1jrgQm9ESZFdJT
	UH96C7GOhoPs4bBQXvOeAR9B0mvXQt166paXaY6pWKJ0cPjGCa1i8VVRqH2LNtKgLj5QSdhr5vp
	udoR2cfeGawZH409U2EBbfkoUkZYV97uocjWXgncFJEBBBWhaoMLUtWqXWtkY/YnxTeg=
X-Gm-Gg: AYBFou0S//1aL1HPCKWqm/d5FBpuevdvtE26oLlQKtZPOMIXneg0UOdqXBpaUGLmBVn
	Te3KQ3KXV4UeDFwf5be6HvUHdkZi3+M+PFkJmBKIv9olilbk/wRtwJ1skTx2usu9840l8TtPvrV
	kdKXUi6gHNqZ9LCkihZQ4Vk4TBG9ntYnlYcrPQx/7gvLkAdpC9LpX1owfHsKYi/w17McIQPy8/B
	Qhh6Y5XNRZCtVcLS4eZgZca+A+kdMZ+76ROTh4VF5JEWbuiiUVdtQIfVKIC26u4bu6wB744c3Fp
	dvE5YWxc0hEmzbuJrEoO3fQFfCbSiWFwW+qaYStaUy6Tcess3ffuPX/UYY1bzpE1xTvjR4rqOyP
	hgQem4+9dFigt3k4VJSOogOFlAtx6awP+ctS4y9+wBcwLjaLea6MxeTl8z0P+
X-Received: by 2002:a05:690e:4194:b0:66c:4163:c4e6 with SMTP id 956f58d0204a3-67124675c25mr1851155d50.26.1789136485952;
        Fri, 11 Sep 2026 07:21:25 -0700 (PDT)
X-Received: by 2002:a05:690e:4194:b0:66c:4163:c4e6 with SMTP id 956f58d0204a3-67124675c25mr1851123d50.26.1789136485343;
        Fri, 11 Sep 2026 07:21:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 5/5] arm64: dts: qcom: nord-ride-embedded: Enable USB ports
Date: Fri, 11 Sep 2026 22:20:40 +0800
Message-ID: <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa40e67 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=4Y2rR0LANONTutHxYfcA:9 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: s61OGswOdVWLQcIchelq5bRnAy8SCTVB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX2AKSmt39eodt
 bvH5zBl/So+BBs2I4YbA8HpxZnq+3tcPuBt7kFj5piFSjniPx6JSw7Iz62mTYgj7RNGr+6riRKI
 vjhoQJxZ1AQScGg9sUXZ2aUKZT4cBM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfXxsovBk+EBdeL
 /X9leqNzFASOW6T6TWT/GOL8fGfhaEryCIFGvG5ntuWS88v/uw7Q7YPoyp6glpOHdcqzBEzdApA
 Rsfo3IsOLe2s9qyGevqDMmCyTdNTQPD5CVOrtR/1GJibsw5yJ9ecUgam71igFmCnR/rzE6KZztJ
 kHt61TgXK3ICDKJL5E5yxOnm1/AsouiuMbungdvFLcNLsMKqAAJNWetbicWo/K4tYcqJnyKVyps
 6okVCHWt81ldGOLZbmJZKTVvhivl+bZZD4iTaCb0p8cT3E8eu2m0OxgUkb9wyKaWxlvccQ1BL2K
 c7TL+VC05nfJH8iMU771TfCwsZ3hf2H2jmSwNOi0o6esz1nPbD5rsgThNFTwGtjRmxMcNRK5Nwd
 ej9DNvV6WVyJzgdfXDfoFexpxl1ppT2vYhS6f0Vv7baWvsREZ/HrY94iz+Npf96qM0A1m46WCXG
 +dhtl9f3VHD4l4ScuOQ==
X-Proofpoint-ORIG-GUID: s61OGswOdVWLQcIchelq5bRnAy8SCTVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201

Wire up the board specific pieces for USB ports. Enable i2c9 and add the
three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
supply and reset GPIOs on the PMIC GPIO expanders.

Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
ports are wired on this board, so describe two usb-c-connector
children and cross-link their HS and SS endpoints to the dwc3 HS
endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
controllers therefore run in OTG mode with usb-role-switch.

USB_2 has no Type-C connector, so it is configured as a fixed host
port. Its VBUS is supplied by a fixed regulator gated by
pmau0102_h gpio3, kept always-on since nothing switches it at
runtime.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 211 ++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 09ee525764ef..f225c6d39b0a 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "nord-embedded.dtsi"
@@ -53,6 +54,24 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pmau0102_h_gpios 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -366,6 +385,121 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	usb0_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 9 GPIO_ACTIVE_LOW>;
+	};
+
+	usb2_repeater: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_l_gpios 3 GPIO_ACTIVE_LOW>;
+	};
+
+	usb1_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 10 GPIO_ACTIVE_LOW>;
+	};
+
+	typec@50 {
+		compatible = "onnn,fusb15201";
+		reg = <0x50>;
+		interrupts-extended = <&pmau0102_i_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&usb_pd_int_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C0";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_con_hs: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_con_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB-C1";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_con_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_con_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pmau0102_i_gpios {
+	usb_pd_int_default: usb-pd-int-state {
+		pins = "gpio8";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -440,3 +574,80 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb_0 {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&usb_0_con_hs>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb0_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_0_con_ss>;
+};
+
+&usb_1 {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&usb_1_con_hs>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb1_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_1_con_ss>;
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb2_repeater>;
+
+	status = "okay";
+};
-- 
2.43.0

