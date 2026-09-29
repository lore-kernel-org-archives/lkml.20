Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A43D50B8CB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717732; cv=none; b=qhND7OvjT3u9r+56TBKmQYnxWVGEyZCuRpYHcvO+n7ypgxmxu3FMHA/WsF/KBZCy/zB+RxL2d2PlqZKBXwfdl6i3jDAtCo/BoqcHsAi0MdgTCebDkBeO1cCSN2bJjzR9Jv0OXRrjcAy2aSIjfyl8RQfFSF3dommaq0X8WfVvj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717732; c=relaxed/simple;
	bh=1A45iJPgG2eaWICbOuNDPsZQBzJQom/ntLAZN1oPI8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=puXZTOBqrWhyHxB6Vu+dlpcZy3JwmuAysStJ1jolBVjPYeQZO/d9GcLZ0ArsH6we+3LExQBrH6b4hX+cFUaNmQV1Qiad8L+ZPFibx0/1NDcGNecPi9C1X8K73AsSBHpscd/6AJEcFyppH/ejODexalb9eqsNFnzLLh1zxRQ3bqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ls58p89K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmcfqrX0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ls58p89K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmcfqrX0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TKqvC5941992
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fHQUIw80EnV
	NRqNf+hbqAdsF4+pOqAxWgT6plbf8HG4=; b=ls58p89K2/xvo+sZUz8aYupK9Ti
	UM1Lmqq+bEo3yUMgs+AVI3LNE4lDBJOkNFkGwEQ0leVDr0kI0S+llmEa1Tr5jBhA
	T3AKB7iSH+hCEjBjV/5nsfhBs6FOXzJ2UMMEg8WwHaS6QlDDYgZegUPfNV/Vlm43
	WNbiPOsZ3xnBgdOtEIAUl+p7kBuq+YuGSQeS1Cqg2vNSnuxn5ykjd+UPWUDvTKCP
	8/0+9FH5HFcZskEoEh1XqnZaDFbVdigfvs+/S9nXtVTj/J+MWRPFnPsl7CBwRmRf
	l7pHz5env+A65Qbj6OQHaFiQastlkyr5PsvIqcnQNd0sVoe55KA1OmV3/Rw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0ftuhkur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso6908020eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717727; x=1791322527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHQUIw80EnVNRqNf+hbqAdsF4+pOqAxWgT6plbf8HG4=;
        b=SmcfqrX0yN949N4FZdS81qdFtqkoUiHAXLi1FObdTxHqem90xHfxciRywlZKk9tDuG
         q+/VjNxtbE183s12GV8vG1n3SnkpSJc1rd4YBWTPh3GH5oGmCki3Vm6L89qZ5lienfnI
         JL8hmuWBxGT6DuWttGUiBzctDe/EGAUli46YE7G8d1KW9frL4YAyHX6PciMkMvt9AZMQ
         I2bEyoNSa+A5j5xr1W9mdaitdfvWrJo+QG1PUzPQiY0Z1yuxuBywtH3mVv0D1TDJyPc4
         0e7bpDC8/v49zB+0qhe4y8sUaUTALpnPGWiREMPPlLWlTo4cSMBTC1lF3bF8mAbHLZor
         KMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717727; x=1791322527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHQUIw80EnVNRqNf+hbqAdsF4+pOqAxWgT6plbf8HG4=;
        b=c89HsALMC9q0akGeXPK3ZzxTL1qdtBxYytn1rV9zXA8Plomw3lWEceorrANkqVXT6a
         kminCbpygDktk7JGSq+Tane8w1SwwXm3nsuCBqu9GwjnkCH0igwQ5Ah19tOyxPTh4L1H
         /NFJ6WvVmFwcyRFhe702T1rdSc2XxGwYI/ny2hD8lQQSlrkpJstzt0BtldQHBSqSHE7y
         xkiywyblMZxvtuJ0/adKorL5O22SNpmcw7K8D74pxv+xxueaKMGNzrLxLU/1iXq4AjiK
         k0S7AHuxfLmOS3XTVExmc+ymwtOIMKW8onRJz90dzupgVEpzH9mOy5nQiiVslckC1YL+
         v+QA==
X-Forwarded-Encrypted: i=1; AKwUvBwqbvtcclINIG2ilahsXBmtZcq41Yq53otOQMIEkpdjlbwase4cLx/+ZYk/Z1/jLte7cUidt/xyan8h324=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzUqfqtoO+5dOSFHq3y4564ldQkS7o3rPy1EfxvuZKvOGXHM/l
	jNO2roB8Iu7lkOQhUxQBmpOsLtFFmbqHXUps6zR9onHm4V5FgOjfMpe9Jj9J4rHJAI/PftWWNZy
	mZ9aI/Hgj95zjNy8qbF2fDRh1ErARyMNqOayy+s/nCv0hgY3WurjpOaizX38A3LoFVDi2ANPrGj
	Q=
X-Gm-Gg: AYBFou3g+C98olcVCp1H4+IImoOddwnPygGAPYgEmLLy9Mfr47q1Hp1F+OwssksvCYK
	RohRghP8e7jzK3AJlc5jJlU/L1ommfa2ArbQusSoSdzmDBLIxXC2vXWSQKSzlmVH+0Qfbph1Ew/
	HHxkPEzdKtE+Js4+L4aV3UnAXfLe1yLdxut78bAyTQL5vaJb12yNNX5qyzU7UddHSkNXXPNsbr+
	i506bqz7zv8sgqw6zeUScktikmlbKH6nts2LEGX+AGzfKSbKN2Do7+yD7vAjc6MU//VnY6877hy
	4ZLSifV8hs+2Hk4P7lOhG3mGTK2uw+Mjit96rhEgJRPoxjLp6NSjraEF25cANOTINl74kZSB9ic
	JUByloih7m7lCDIfKo0tHMdl3K0CVrvCeqT+RTqK2Ef7WPKBTuWtC
X-Received: by 2002:a05:7301:4294:b0:34b:c0ff:7662 with SMTP id 5a478bee46e88-34c606a7d7amr802335eec.3.1790717726269;
        Tue, 29 Sep 2026 14:35:26 -0700 (PDT)
X-Received: by 2002:a05:7301:4294:b0:34b:c0ff:7662 with SMTP id 5a478bee46e88-34c606a7d7amr802290eec.3.1790717725549;
        Tue, 29 Sep 2026 14:35:25 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing and connector mapping
Date: Tue, 29 Sep 2026 14:35:13 -0700
Message-Id: <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXxZZhSHZ9pM5v
 Zrg7PSPxF16oO6McXR+EUL1JCDvubLfXI/djOH0zlSvvG3jzN6yeODxPSd3X+aahTUmmaA4AdfD
 H/6BkpE3rIR4zfMn9Yfc8HgcXWTkuV6JKRoACoJn+WA2y63zLOj0c/ORd73+HnThLdj/HzOyAT1
 cGtxtH+9FTwo+fCWptXyvMV2BGGaZRvmdMf9I8/3KFU2QGmG6tqtSgPsIxCIMGZdGMYG3Lwx+RU
 DtGCmWitNenccwUZ7RYmsO0DA3GETYsngyXD2mQ5DwUNccqBHsx1CC0S2Gh2LavpgZGkKp16bGA
 8GuY9jWXXYNXGma6ic6cmOQzSqQi3n4pY2QeNDHuJq5ra6q5nhRhudaO8ZNWcO2Om8lJtybIHWm
 16iAzVVsNdNO97ctKgg+T2+Pd3nvX44T8AapWF26yet7WWtCef6cjYkbs0nx51s6MzV5vTNWqMY
 THGl/uwXXKf++K6O0vA==
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6abc2f1f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IlniPGdpC8QbyWtZVrEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXyvQl+TngTZJu
 QweFUf7OpziwQOe3KJEpmxJ8cuJ1AhejlsVroZsN50e3gK/O6z1Cl5PcC+5rvDtMFWdEYmfAYlZ
 iOuSHJqfTDEghypdMn+1DhQ9RuXHzEI=
X-Proofpoint-GUID: NfmMeh65hfzNVai3oYslelYKK8ieYLs5
X-Proofpoint-ORIG-GUID: NfmMeh65hfzNVai3oYslelYKK8ieYLs5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290086

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
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts | 10 ++---
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 10 ++---
 .../qcom/sm7325-motorola-dubai-common.dtsi    | 10 ++---
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   | 10 ++---
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 10 ++---
 .../boot/dts/qcom/sm7325-xiaomi-lisa.dts      | 10 ++---
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 10 ++---
 12 files changed, 78 insertions(+), 69 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..c9c527a6b9b1 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4434,12 +4434,6 @@ usb_2: usb@8c00000 {
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
@@ -4766,16 +4760,30 @@ eud: eud@88e0000 {
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
@@ -5002,6 +5010,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 2758f1f57ac0..f28b2b4b5d57 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -99,7 +99,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -776,6 +776,10 @@ eeprom@51 {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_EDP_CLKREF_EN>,
@@ -1585,10 +1589,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 509fc4941a02..d802c04e734e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -74,7 +74,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -493,6 +493,10 @@ vreg_bob_3p296: bob {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &i2c1 {
 	clock-frequency = <100000>;
 
@@ -829,10 +833,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index cf74b3664cf5..e4be197b482a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -84,7 +84,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -476,6 +476,10 @@ vreg_bob: bob {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_EDP_CLKREF_EN>,
@@ -951,10 +955,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index ed9ba2e5550e..d80198af4889 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -211,7 +211,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -671,6 +671,10 @@ vreg_bob_3p296: bob {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -1409,10 +1413,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index cfcb22bfb298..af73d0a7c62a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -77,7 +77,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -533,6 +533,10 @@ vreg_bob_3p296: bob {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -1044,10 +1048,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 4ab7771fce1b..4740fd276436 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -93,7 +93,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -710,6 +710,10 @@ vreg_bob_3p296: bob {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -1114,10 +1118,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
index 3860ab8508a0..8d52fde4124f 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
@@ -96,7 +96,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -667,6 +667,10 @@ vreg_bob: bob {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -1429,10 +1433,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index d94571c05a59..7e00842da36b 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -669,6 +669,10 @@ vreg_bob: bob {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -1428,10 +1432,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 8d8fef940264..ce346320331f 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -99,7 +99,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -884,6 +884,10 @@ camw_gt24p128e: eeprom@50 {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -1438,10 +1442,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts
index 28a19c96c8c9..ac628425331f 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -538,6 +538,10 @@ vreg_bob: bob {
 	};
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -1085,10 +1089,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 87f267aaeec0..a8b65c308e94 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -94,7 +94,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -584,6 +584,10 @@ &dispcc {
 	status = "disabled";
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &gcc {
 	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
 			   <GCC_MSS_CFG_AHB_CLK>,
@@ -882,10 +886,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda18-supply = <&vreg_l1c_1p8>;
-- 
2.34.1

