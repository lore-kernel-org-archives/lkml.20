Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD72518154
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061587; cv=none; b=Zcp2bJ7zb8+mvJwijYvUCqb5ZSedDGdk0IfT8QjURd9xW78RlytNguVBkO7At0kyuLmIkuq6C28pvVPWfd1i95ty9hH36+r55i9JjrqI3+h+vnsbJg2QkpMdvwkcUzDFRIUSUiO4oA3EVGCFq2YKPHMEZMe8/3EL4IVaav/Ej0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061587; c=relaxed/simple;
	bh=PRXZhZhetP11AR/VKn5pVd09u4QzQ1Ak9Le9/TdMQw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSLW6Zcl6tC+EeXqfzgwVVOjetJrtx25i+Wz82qD3bjX4PPPAxLsQTIRjXAwUNWkpxLMAD39gqt++C728AIfeY78jar9JXCu6REh7tbMPxr8K5A+hu+m8YM5rc2c3fI5i3w6l8bj3yYRCg3PoTzBxLpOXADloI/Rn1rJalTY7SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohYyVbJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nju4pEvU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohYyVbJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nju4pEvU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdpQ4100190
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=; b=ohYyVbJMmdJ1ND2B
	f5+K8ZnTqKDoJ1oEfvBQXCpDz2ZQk5+wLEAd2ya02S8E9Jt6d8rZ1+5KmE/A30Xo
	ALH/tyyh97U2ivrrxOh5xzakLObaAbiGTs8EppvWyT2zGvBnCajwrRJOMmA2qIuZ
	jXvTRg7qIaAK007qK5mpk1ACRrmsPZXaSBcyNXzO6H0JKG2QvWv/Y+77sXhKa5d1
	utU4jDt6i1pWInrBSrpO+G+BdOXvHsACbl9251UvC0g04L/GiDTOQWfC2dt/pUP/
	0JJy7hwPxgjohXyM568T37v17/8vVYWtbs17Ojro7ClEqeP5Rk/M+l4WGSR3adlp
	Vs+Fgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r8349-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e85f710dbeso23207145ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061580; x=1792666380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=;
        b=Nju4pEvUdk8uEEjwEJH/fucmvUN6WXrLHyWwJHcrPFXFaezhC8jZwnDc4YId1JbmeP
         tAv6KYA7tk9QrpIUj5zRtg1+14ZSWm1hEtj1ijwJPTwxSXxAua0qWhpopI0iK1JRzd/A
         34chl4/11Ui5GEtWL7s+qnRtdtO06LvmOVEIP5p88mGHTGJZVZxYEx+Btjn3K3uZOfQW
         XtqMouue+PQmA3/1Ih+Lt1cfqKaJyvr93kRJt0QE2vbulP4UictgkLbMAa9a5w4m/NbY
         Kdjqk1kwHjYJmXa5aF66zBxLPxZmNkgWZly77FDpPy/M064sWNpB5Oa7c1x699GkowBR
         Nidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061580; x=1792666380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=;
        b=eIfCVJR4lS57Ra5lEIsC/APuFsfUCTYC+rd6dp58pSl5TyoNGpiZcNEFxEH/DKLs/j
         eJUTxXQqCsrVp1T4/zi+gIWdQ/lgChgPGfqhHZKAJ+0C8WEq4Mrioraim00AWiDwOIlU
         Xs/QMd4YXxqADCyNGi+IP0mP1PDswTzOMJR6KRinWI3w5FLjtE+NMbrhUoPNJc5Oto1Q
         eksiDgA9ZGIz+eQqqEwY/nktPQawz4w+du0dOcH61toxPK1q4N89Q3XZnO+AJiJ2Z37a
         zdlqwp/Y81N+l0wvd2S26Ok8BpO6voE3pCsAx9mLJH6zci8VEG6gNtTCdiPduVH+5SpO
         4CHQ==
X-Forwarded-Encrypted: i=1; AKwUvByE4BMJ0yEla+yCKfGTG6uGFgiwFLWjJHSGH807j5NR4Xln63WrfyBu8IrdaJ0CTdIyCXWurRqtz5ESy2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFIfwUYqPHZgNaCkJvdQW8K4a2CJ3BrmYi9c+UsQnZtoaDtyfT
	zs0s1z9/okZGqO7fbd2jpUxBjWh2Fr/gcRHRs2I/iRTN2Lous7i3mkU4BF5DrrhIfxYPY2kK+pv
	2TjnScy/irewxATz0Y0Mf+YkNgFg9YGmG6+V/82poEWTi+FrT75NMC6KeDIY+CmVlkOM=
X-Gm-Gg: AYBFou3ZXjeCXT/sNjLFqbzP3Q86J7nuio7PLSDQOPfBZPywQZtvxZVmqHUyrp8+DsD
	e/SPdhp8GWQXQ5i7OSvaKXXHyH5Fp37SD4UMR/1PkOb1BJ+JW5CD53Xs1Kq8XT+p9t+Ll1QYpLU
	DwMbDqJnprhds5Cm5m2CVdfb/nEGBzz+zp5bDdcBEjklFJ+SfyTztnatfxieU+LnSH7wm0ruIAO
	p/tqn4yFaSuBwvhEeiCYBTOeabJ2KKQpwdjugjdBBOjJ3i7q8tWWbGhEIQhBZMgUnbGeoji81A0
	+dfo4Ql6AVSSaT/Ygu1aiJQuSQsIKzed9JUKSJ7WfpuQdXPvnP9qG+pag55TT3QdtSC+lpSOy+y
	NR4JxfHL8yWRVtA6UW9YLq4eYpC+NsQ==
X-Received: by 2002:a17:903:234c:b0:2e9:3f6b:346 with SMTP id d9443c01a7336-2e93f6b06femr35907295ad.41.1792061580426;
        Thu, 15 Oct 2026 03:53:00 -0700 (PDT)
X-Received: by 2002:a17:903:234c:b0:2e9:3f6b:346 with SMTP id d9443c01a7336-2e93f6b06femr35906765ad.41.1792061578744;
        Thu, 15 Oct 2026 03:52:58 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:58 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:29 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061551; l=2747;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=SCwcqJ++OalJ7mck/seksWRQmzlUuQbt81toEFYLzQ0=;
 b=VtEo7dDNimRS4Im3wrw/lKJ4xYDiSnlGr6RdJ/s83yrgXlphCYjWpCY4wbznDb0PmmZNPKm/8
 P7JGyuvNuHzDPMwIh7T13GaEr+ZfIWyNIzxc6yrx8Kj8pmOLCzzJOAY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX8mnEbhGlDgag
 hMCBLjryh1tz9zWAtTHhPmwQyXB7x0FjBnKcXmCHQHaKP4Lk3LJ7A3st3v1XChG/wIDphoSuPaP
 LoZYYWanANnFTtl1Hr9klH9YxV46ltI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX0olIcBm3y4dE
 60YNtMVGtOK5qM3aXElfFTPNX3WEILhh0L1BC7FIfjH82fxPXGtRSSxRPrms63mzLAqq8Lv0jFr
 TOvzo55MgrCB5OIIjMQQjdAFR0IvWR189UtLiWe37tw+MgY7dlRB0pWYv7iDZvbiL6yHNf8CBio
 /oHHIYLGgD01ch1HeCTTnUdKtUjhPWzeiIAUmjhDW+6OQ1X7TFyf++JQKF5gNaACSO0G/IqCIJ9
 72NdxEXaGhzTmsG22ngAbKFiTjes9tkjHYtQgZf8uHp1fLgDU0tURhfiK8Dzx3suNtYQvkg8J22
 ASmG2CkZttRYC1ta+Unpg2JSKx7kyzcTvlRWUvtW206pZK6I9pTnIqzZz3nyxdABFYaMLos24fB
 IsX1kBLFIyiAVHFJ8OlUWirw3/r2f6IX9GsLjyJeiHCZnZiEcGUR0PIt6wMhU5g0GUo/OWmJiak
 +tJ7Js1w4Ts7LY3yyNw==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0b08d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R0PpLEuAhYnv2Y3507gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: FP7AHgqOv93WuuhERorv8X5Fwz_w37nS
X-Proofpoint-ORIG-GUID: FP7AHgqOv93WuuhERorv8X5Fwz_w37nS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add the PM8010 PMIC node with seven LDO regulators and pinctrl
configuration for reset pin. The LDOs are needed to power the
camera sensors and associated hardware.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 75 ++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe295fd111f3a3d7778ca531467e900a..ebc8da58a79ed6a77916c70c7fd93ab06e185644 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -671,6 +671,72 @@ ptn3222_1: redriver@47 {
 
 		#phy-cells = <0>;
 	};
+
+	pm8010: pmic@8 {
+		compatible = "qcom,pm8010-i2c";
+		reg = <0x8>;
+
+		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_l6p>;
+		vdd-l3-l4-supply = <&vreg_bob1_e0>;
+		vdd-l5-supply = <&vreg_bob1_e0>;
+		vdd-l6-supply = <&vreg_bob1_e0>;
+		vdd-l7-supply = <&vreg_bob1_e0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8010_default>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8010 0 0 2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
 };
 
 &i2c8 {
@@ -1106,6 +1172,15 @@ wake-n-pins {
 		};
 	};
 
+	pm8010_default: pm8010-default-state {
+		reset-n-pins {
+			pins = "gpio106";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio221";
 		function = "gpio";

-- 
2.34.1

