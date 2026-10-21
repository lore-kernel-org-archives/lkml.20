Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595864;
	b=05AW/k0/7hZOjq5LcstaxT5BYm7pUNaKJfleMmW92URsj4elwwRWXRy1CDPObOeylXXg
	 2sa2xY4FpIjy0FDX4/w2X53AWQIZHyL46yFtBXp74vHqy87zwgvVT1NwSwEueLyV25QqR
	 +DlTYDF3TED3yrYZtgpadzgLOvFQz1wtFJQ4GlR94yhUNGlKeYzCBmVzcTQcRHpTDuwsC
	 V7swjWoeygNH6hXiL6cBMWJ73+5IrDaYoWddgTunPMMLA3F7/NXwCV8/dBTZpXD7BJOv5
	 k027hsNX5mkWvRsOXJhqDwOzNFZAqmy5CsFB2sNL/6qze1tvSt8SVCnO8/kgEeAi56w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
	b=rjR7bZv7etFfU4rZuHKL/jlyFV0aJkwP00u8qB2MnRYNw4iZBjI/1upLk+IPOipD0bbT
	 ZzLOEkZ/Tg8mbi7+0o+Tr3b5jfEdp4Mjyk3/ku6uZjnjDNpL1pjYVt8WiOfvui+yPMdhv
	 IiaSoC812lwlbEGSv4JdMcSGTdHM45I9xedgVJpFWIe/GBNLFJ5wxAsFKJiI3+rFe1qmz
	 cuy55kvb4TehJlfbhWkKzmCI5KwMa44W5VQy75xromkQc2FtJ8skmw/kouQq2ze6eW22D
	 l/WAUscaUiGqVYRRLiCnttfbzJsHOBKPs3dmN0/mLG3hoZxXHp3lR5cbHwM6+8MDyxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6T02ydL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWXfZlxQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F8606A328
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 085F8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6T02ydL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWXfZlxQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEEmdP4161285
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=; b=j6T02ydL//Q8S078
	kUngjU4oZAzoRfXAYuzFVRh1i5xj5apfsUtC8t9nwK4JaQhhV3wbegcpR9jvUFDP
	2ZKXfh1HFjTdxw1LHmH3B2EGDfIAyAFs/MCdFvm/+/iPoTENLAOxJEbxXBRsrc+z
	3PcSSv5C4Gxxeu60p3Z0h33znQfhtXqrzH/gEb6m7hwYzxXKoPxOJQU96z/wAlTo
	v4muCzfWi+AlIbawFD9tX3Co6Z7P07aXx0ofnPO88TsyfCm3SrrZ/N94aJ7hjLKW
	9InweytC+M7Cxs7jL+MkDrJkEcYFDcmPg/G4VUplOvtGFOh6jIiwKJRBzBsFdUw5
	HspCwA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex588htn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2160977eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595863; x=1793200663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
        b=eWXfZlxQo4huYfxW5pBHaS/k99APy1qacrOdtRCtnM3mRt9NPt27S00+rvuSbOnhLw
         kCmLLPcUw/s7qD4F2IlCteg0Njj8y3fA7G/685yxTpnUmAQdHNO4KfSV6VKSmQvq9NKW
         759Tv7oSnJJo1um6f2FfjoIIcGVzPZPTq+9MworbIifa9I3d3IrbQQ2pE9tRlBwdPpFY
         iYkKLZw9ABgr0WzJcwOLzYyPi0Tjo6HXGMmxLXxFOKwcOwX7Ivu2DyR83DMMs4LxlhKA
         MtUqW0pMxy9sBnwDJA1nBSXnotveSbobQOQfqt2/784wgZNwqoHY9d0E9aTDwzBHr59Q
         obog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595863; x=1793200663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
        b=GTJi93/FDfQziizGO6jYzBCttSZ7EmvHxra/aiGQyAlW7STH47i5w54VXyjN/jL2JM
         RFIgNCpFtdF4VZBG23xEyddDY64U60lmvdwHwoRbFFKGEttpxgrxoylF4r7jtjkm8HTT
         +Q3+NzEiksgq9YQPCSQeE7tYRAgeCNM01C14y1O9/3GeRa5ggnDJirh9s6WJqv94qkdO
         pMFKA1mbeYdXL1lAVfBcYoGzf3njG9vNIRm2qBP5reOfhlt+wN75tUXhUdO7Su7qbrGN
         IaPjDoPllALZJh3CJfEcYZEXFH9FfuGrn6gdvXSnKYTB8IE9VdWyexoBahvx1sopX1cl
         rtRQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8yd7YLhA4t+dXO4wddbJfwzpbVl7E/W3ZGD06DB9uhef8WnAPyWpu6NXRhNIwGkzb3PtOanjujCCeETA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuFu0cMhp6lB2MxeCLGxHuiPyJf4fxFfinX9bx8X+EzRT8kuw1
	NIEGITI04AdU7M4S/J1Me4gRzvFwooml0uv9yc/RyTDqPeL3MAJXDucjzv9f83CEy0Cz6Y8sKKv
	3qGmOdoSk2UvVxA+dLZP44mfidnIhlx1dSvYG6RyyPXQzQZdhr2S4Q80vVeDhVLEf176CvY/Ie4
	g=
X-Gm-Gg: AYBFou0Xdw+igjmsR2h7Ai0hFM3c4woxJYtUnFnuyDeT51AXaV3nnHIBXojgDQHEr10
	Qpy5NAY7XOJrm4fWkaAB7i30mDEXmvmz07uihZdyHExEq08Y1CygoTQVRJ1h6lqJjDtsKSqGz6Y
	3MmT/7LsbSe11cV1bDlgdfseAerATMpn7RWDcQOVa6l/fx8NgpbN0HJWRHPoRs9jjwaJaIt/s0Z
	fySrYJAoMSsnaAUMnt6mtOBO02dLVAgiW8S0JnAtNZiIXJp/sVtd7HUnhMaRwfssrAwG9VkdC9K
	2lInU5Fmj5FJFJ0fk1Hotu6IMB8YGtW7iCvwS/S+expqhed70fTLLVdrE/SH4L8mt3Pp9MW92ss
	2vvPJrhdwYl/MZEUGPMB70dugXY6LgpfT
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr3403387eec.27.1792595862158;
        Wed, 21 Oct 2026 08:17:42 -0700 (PDT)
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr3403342eec.27.1792595861379;
        Wed, 21 Oct 2026 08:17:41 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:41 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:25 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3427;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ZxgrAd6nafolyG+/7GE/vBa/duxEvCqREClsUHxUoec=;
 b=kKaVoiWy9u76Iu3oh5yB6hy5Toxfkqe7KfqzADnMEQkwgLwX8J/n75fSu8ezTkeNBsWxBQ4sz
 kfD8BvytvZCDQMg9niDMfamu6MRqNExRW0hGmaK3Zbvjf18292hO2+O
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX00e4/TKI5blD
 0PnyUFC3iTgIHUuI2e90ojehu/LNHTxRnhan1opiO0POkO7vxEUght/Do1X2I7b5oALSUQe4xuB
 yvZ1mW5X0Fqmiah/QR4GTD4VuJpddLE=
X-Proofpoint-GUID: TLsvsxK1-9Lwj5JxVB3MrHtzo59aIvo-
X-Proofpoint-ORIG-GUID: TLsvsxK1-9Lwj5JxVB3MrHtzo59aIvo-
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8d797 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ggSE_kt-BB5Ld93xFnEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX4Uxd01fQ6TyC
 LEBv9jXdJVERmwrvN83rNYyFnX4IWiCtYAesNYhwn0UuI5gFWHeQhTD7S9HlIhZB1nzEyrzZy2s
 mHDvbaaWWEJ74G4Xf2zXFbkzZQXfsg2e07E9lgXQPIGxSoixuOb55bXsDfMC6VzbhVbgYEFizXW
 JEKF1qmUtq0PnouRd7gkg7GLCjQ6z9NU/XdzBp8nsTTL8p+bxewqWWLj47bYbbvcXxMVyK7J2g9
 i8QZ0xh0pKqSNgeMkDG+6Jen04p1nkKPQF1jjjZ5uMzD2GBtJp7faefMnMR8BpI3p9vtlCJacHx
 tReFqtcomDiQvDmkX3FtiKyq5J8ulBUnpWIfdRwP59yf3vQS+YcKCTvjG5lNIiJhhfR+Gv078fA
 rHlGySE1+XcSwaL6ancJzucek/hgieCUkF6Se5fvckYUWEp8v5qfnWXB6I1CmMELcGToq3MI4No
 TOQnnxXZRZGPTfW1ncw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index cfb563658fe0..ec5c10a40521 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -11,6 +13,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c2 = &i2c2;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -25,6 +31,65 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+			remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+};
+
+&i2c2 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_s4a>;
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
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -74,6 +139,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -135,3 +217,26 @@ &usb_qmpphy_2 {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio60";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};

-- 
2.55.0

