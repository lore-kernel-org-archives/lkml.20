Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530783B2FDF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145328; cv=none; b=qnhEPBCHMFIDlQD8IG5/DK3rsCz4Zc/Y2JgfSOK7bWy5MLQytweEXQZpoiul9uqTd4YVKzrmVNbBU3PeFdWIxdIl76fS5Je5Jk2+4lL3MU4IxEJ29gt9WuiPBSsxcuD5MOcHilN3dM0zkoAd3z5dmOoEoITDT/HwvTEKYnoc/oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145328; c=relaxed/simple;
	bh=xG76HuP7tzhD8LeKXLwS4A2xWTUE4msRqgi9yo1dq6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O0VXgNNBR+A0EguATBRgRUvAzX+lJxBIdvaqMZ5KcKvELIPuedHac/Ce+VUDQoHPterkvwM85IqF8zf7n9rJlgM2gY11iG5/KnUIytQsOKjDXC31FvG59y0fvEun3CbTQ1rlwzc6tH7YNxvUxyy4DVk/axUvR9Q7tBT4eK8Bjq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfGnKw3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0ri874g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfGnKw3f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0ri874g"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bQLk2819890
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3Y3x7GkERcn
	jU8Lmk2bouk97IELQPDZ/jAQTBQzkuWI=; b=EfGnKw3fg5nD+LI8qXcUzuHYKM1
	yfq+Z/kwC30qbwVSRvaqsBJK2XM11qtY9jnP4VRTjaqPejvh/jr//u2nsZMP8XDd
	Cbbk9P2w1NTOR8ysYNLjn8mA5ThYEEM1O6zAy1Ly2Sdsee+nTWPuLjMTCmBunsH7
	K7rKiENT0MytNQZjejD7PFt5tyz7+GaiCZhkCdnb1SRg5I2rDhMRnbsCrVUuVzfU
	GTA1eObQFawEhRT+33XOuKQZ0ATms1dEVRppRg3vaM20/en9kHUo/T++Ji6IG2ee
	LpyECLiBNPu1mOON+7b+jNbcL4oU1/i5Cp8Un9VN00UxeHqtr0KYI6kDM+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfma4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so35168595ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145319; x=1788750119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Y3x7GkERcnjU8Lmk2bouk97IELQPDZ/jAQTBQzkuWI=;
        b=U0ri874gge6DOdxyY3p2zvxiZSI/yjoHK5JGbWFKMpfRHL4P4YPNLqFSiK6dHFlVrg
         N2IVsAl3FH8coKXVwYPc67PW75l4gJoVQX2iWND+JC9haZL1cHrhETKQCPzr40V2wrlQ
         z83NuOWlU4AzuCrJcir+SLFgHRfMYH8t92NAAZao3qhryuGDHnqhJO1xHp59AGizgorK
         e75BfBT3nY1RqgXU4s24biPEJHnqZrsjJEoi6+HWOYUR2AKUlqeawJFPEUY89bjCsxa4
         tuRDBMZi+iopUyguwsEzZA2mXueI1A6QqjtiTGefsuuTgtapyBBcV1ZLgtD5B7BYco9w
         JZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145319; x=1788750119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Y3x7GkERcnjU8Lmk2bouk97IELQPDZ/jAQTBQzkuWI=;
        b=fTtlwRG4XZ6rUnmj2dK5beENO/y9n8PkC+NwcwMqcQfJiXXbzfEbhxysRxjKrhQD4C
         OQF7jDObcH+1WbPo2FVvGlHSUaZrpHndCRJPebIXu/nfLQeRbLu08rrcJyGw9vFQX9bc
         USXNSsJ6epbsAreh3pOvSJS2+6TBPgT4qfiY/TSYNTtl1cMa3BoqWfK3bpg3vOd6+VbP
         HbSqd6ENGNj2SRrVySZZUHup6/Ie2Ha/RgQVd9p9jT2Ph7jeD/hTi7kL/91b7vCNCqIb
         8VUJIkIaY8RTdxo8uKoophXOenpxJlO0pFjyUPwb26KfBtF2HSBlKT9UxKUmaq+uxOiG
         W3/g==
X-Forwarded-Encrypted: i=1; AKwUvBz3SMZC9oIZyviOhv6m/T4sk1mjktGcVc/Grjr63z1XITITyuKc0fIeupQiFtlhyMbnqk0NL+obRG4NM0w=@vger.kernel.org
X-Gm-Message-State: AFuF++nqIyOI1o212ClzCM+EleVoUotVgyuYLKMguUlYKPpou5BLAVig
	IG/PPW3Dv9war66KKyNj8vBDUJSfBRYl8FD4uKwFKzgxulb5F+2bdLXHW1pLp2PGtrhEeSl21MT
	5irws4i4Iilwfw5giZIwn5f2wL6RAgvu9RM9yFyBDz2DlvxYfb0c8duc+nXL1QiF+18fqUUp1Xo
	g=
X-Gm-Gg: AYBFou1yQNBZxy2T9BaXO9dIHi9zrNuGAt496pkuoC7tI/Jehh5Cqs/Fxtm1uaEg8ge
	Du4tU3a7uZ0yHgIH/QVYjSmJH94pehAp+2/pErfq01cFUaGYnM9cjlXdpBxg3V+whupr4D12mPt
	MonVY8OZv2hca8L0jfQUl6hw8sbFnFynjQBl1lUHWu04UA9OgPr1LMrYGaKX7d/P7c7wKUyibN0
	XvPucxwHeu9LPaqa/3FvQFpZ49hXufA5+4qIhdEBg5seBZBpibV7FVg1XTxRuggNmi2SXLL9hJ9
	bRHeuuY5bjhEsPENn2L+QikGWSaM12FMsljRrYSKEWZdkD9gYlYEU27pzcNL+2FgWcsIYCSNJ1j
	VW4WBEuE0OGtJ2hZLMxACgHpKNLnA88PtAalGdd4u03KmOLPwx9xBeA==
X-Received: by 2002:a17:902:ef45:b0:2d9:1c02:5a19 with SMTP id d9443c01a7336-2d93fa54fa8mr5047645ad.22.1788145318095;
        Sun, 30 Aug 2026 20:01:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef45:b0:2d9:1c02:5a19 with SMTP id d9443c01a7336-2d93fa54fa8mr5046285ad.22.1788145317367;
        Sun, 30 Aug 2026 20:01:57 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:56 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing and connector mapping
Date: Sun, 30 Aug 2026 20:01:47 -0700
Message-Id: <20260831030147.1500616-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX3dOyyB94MXCZ
 9FAgqCaPWr617eGwQezDYQyVG0tdW1tG2ybXx1h0r4eIPEXLMs/2EBL/x1d+KcAH/8sIQgFDUfI
 COpYPxT1YSLskhI6BYPswS1UzOIXlR5yJzzNUmfEbhfSpJIa98tVtQp+WUm0xRJJnqE4JA5cBjP
 ZRBhFE+6lxyDGz557zX/fhfvx1mn6iwttEoPk46954LJRragF1k2xgSzwuF0V8tCLb+/fte43jw
 4dOxH3fPMJOshd8nVapXiluO4F9xi8gHr+7Al4rnR7oc1o9ukMHSt93HFPay4jU8tW4JuDP69rf
 zfkVg4v1BaKbxhVE9iSHvB932+ecuc2P8P2QfVhCM1N0huO4gdWkdelkH+G/mFxMvdlVicFeIOt
 lH0n8z0B/g7VwhQ3iUNl3MTkBcPLY7ihhfJl6GUwVP5+w/43AqFugNFbLn2byT8/tQ9crhuPqQR
 hzSMXd78MS7vJonXxvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfXwu9ENTe/j6gN
 SqrLvB0GUO9MhQJQFihDG8XRi8qVxesdUo9Y9PX6WydZ6YpGmO12inDRY99UtM1L8GC1q1D9suP
 PiJAVbRIJcU7j7f4QLVYMZ8YZ+LejwU=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a94eea7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EqwfFjFrxzYmPp_XjFsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: WMPehxTo2d5XsGPnL3OMkUcCaD8UBz9I
X-Proofpoint-ORIG-GUID: WMPehxTo2d5XsGPnL3OMkUcCaD8UBz9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

The existing EUD description uses a legacy single-path representation
that assumes uniform UTMI routing. This was sufficient for minimal
configurations where the USB port operated only in device mode and role
switching was not considered.

Update the description to explicitly model the topology using eud path
child node and add a role-switch declaration to reflect role-dependent
UTMI routing. Also on this SoC, the EUD hardware intercepts only the
primary UTMI path. So remove the USB endpoint mapping to the secondary
controller and associate it with the primary controller.

With the intermediate EUD node now in place, update the Kodiak board
descriptions to map the USB connector endpoint to the EUD instead of
directly to the USB controller, reflecting the intended hardware
topology. Enable the EUD by default now that the complete topology is
described.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi          | 37 ++++++++++++-------
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   | 10 ++---
 .../dts/qcom/qcm6490-particle-tachyon.dts     | 10 ++---
 .../boot/dts/qcom/qcm6490-shift-otter.dts     | 10 ++---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 10 ++---
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |  4 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 10 ++---
 .../qcom/sm7325-motorola-dubai-common.dtsi    |  4 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |  4 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 10 ++---
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  4 +-
 11 files changed, 61 insertions(+), 52 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..6c64dc9902e4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4421,12 +4421,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4753,16 +4747,30 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				usb-role-switch;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						eud_usb: endpoint {
+							remote-endpoint = <&usb_1_dwc3_hs>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						eud_con: endpoint {
+						};
 					};
 				};
 			};
@@ -4989,6 +4997,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e..b1f1ff6b99e6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1530,10 +1530,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1573,3 +1569,7 @@ &wifi {
 	qcom,calibration-variant = "Fairphone_5";
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 5bb33a8a9830..41836afd3acd 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -74,7 +74,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -828,10 +828,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -864,3 +860,7 @@ &usb_2_hsphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index cf74b3664cf5..45b9318ab54e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -84,7 +84,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -951,10 +951,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -985,6 +981,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..6520e920a844 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -211,7 +211,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1402,14 +1402,14 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51d..4c4afe691d64 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -77,7 +77,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1052,7 +1052,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..b9f92bcf84ab 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -93,7 +93,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1098,10 +1098,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -1135,6 +1131,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l7b_2p952>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
index 3860ab8508a0..2a90de989dad 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
@@ -96,7 +96,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1429,7 +1429,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index d94571c05a59..7a97a3eedd5f 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1428,7 +1428,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 7db9ae1c3cef..4729779d50a0 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -99,7 +99,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1438,10 +1438,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
@@ -1457,3 +1453,7 @@ &venus {
 &wifi {
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 87f267aaeec0..b0bdbcd47503 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -94,7 +94,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -882,7 +882,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
-- 
2.34.1

