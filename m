Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA164DA9AD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645299; cv=none; b=Hu3owp9ID61DZkk6dgOwhFttCKEcddPQ8VhUkAdZxgdhBZ06l9QDzlL0fH9ZEM5TqoRTxB/cYOLo5yoLqu8Xp8HSP3AtmIULKdQtr6Fesel1uNN0hN6pbGwrMxHZSF1vqAf/9YBvl0Xo/3//CTTDc0JnSHaigWxpHFHmSDnVW6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645299; c=relaxed/simple;
	bh=C29tX4FRzcgmif33GVTX6zsYFWffRjwZBgWZudoP01E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppBzyFib/gU/+HtrjvoMqpHwCsEDL83QJYNnHE1vk6hoKHp45IYzoEp57VebpWwhaHSFjXTAfWBnvyWahC0KsQWqHtCEZITAo4ig2G2AEQi/lha20XF/sqqcJsjOs+bYketTtK9Qv1JWyrBv7M2DY5Hksr5naWYJRKsMhfMiAT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSF2AOlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R87kXLtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSF2AOlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R87kXLtS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZrtU1698662
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=; b=oSF2AOlti7hnaEUl
	LJjZ64ooCgg7CcQyHp/1SHBViXqUX+LluPxpeO4mmUG8ERXc3Ip3Bp9ym8RsxXv5
	GOXXSLffY8WROWMpm/i+BiLsWbIeLXTJmVUm8TRZ+GUugDJuHrp1D526/GzxpLCQ
	TP0qNT6KB0fKIkAahjEhxF6AKfhRDN9IBbMa8SQZMBAvj2nKoWoLlpJR04vAkdB5
	nQCDZn1TL+XAGOeU3fkbbAskT700o/G84WwXlDG0DXAqkJfsoDYq8e+WyJBzckCl
	ZGL/p33x5byVp7kRf/Ezb3qgUbZUQ3BUd3EdincEYhOIQY81KmGaHh2eNCe+arMl
	EEmG5w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxaycb3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a43fc3527so1038317b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645295; x=1790250095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=;
        b=R87kXLtSttKhc1BCwpCnwVpP3b0rU8vcoL+LvJS66puyx8Qk8lavuRoTngcCWqZ/BX
         rSysZbHp6YZ9DhVT/izxdfbNpywPcUKes8gPWkueconV620wGEmJPBJtDbFvPDPxofuF
         iZy5iQE0rhwSqKToYXpd5evSuj4bNqEMx9O0iRPh8Bc3BRlTgbkZDxRUkVlE16ot2yrK
         QXc/KytGTl80TuzFvplCRB6WPBJoKYiLJVu9uXjkGFDrc/yYr3CEtBk7C1FsWsSzpELO
         gHMr2defHUGysOmEY2jGC0mNyoVEP4z9z42Jq+uKjOeuPVeC3eEo92NdT5VxFdzY4HgQ
         7x9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645295; x=1790250095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZecxAZHHCtR8vBT/I5lYYisvcmBfN43svb3hSSFCwGQ=;
        b=Kiql70ybYtgET1BasF8g6hrBaD7spWjeH4PqZAR5S/Bm2eFcrc9P76hH9vmM3g4pJZ
         VnY1QvXoLi7whBEykCy8l6KKc1ZzvsLU2UvYE3U17Y4WIUA0S2HfitQY/Lh/HM+J5Ybn
         vP2l+7FEVRCzBl+VxG4fWuWnHdNOD8L82n6murFkPqNZbbeHhck/iBHoMr5RJ407Z3Z3
         J7WOueuDq8/cdtUSg2TWIbW0YKKq7Epv75UFOz/73trRsi78mni0lNzylFUSr2WDl7Jb
         4fm84RYpp/5wcCNqGSVVhMsN325WMCTuE5FfrQRLTGne/QT3tIQ0XpW4nCcipzc/Grph
         TtdA==
X-Forwarded-Encrypted: i=1; AKwUvBzR+JO4VC2A2thsT79idFk7tVpcD+Ji/u2biHOuP43hZBFmaW93TJdkGhdvLta0xWzhiRKCcAs7yyv3OYU=@vger.kernel.org
X-Gm-Message-State: AFuF++n4BN81EM32TSp6/e2ycqTJApuzeVYYnx99xTCHhF8KWH5U3iB1
	aNhBa9DqGNOCzOiTxemQDBwNpaHyRiQIaYaVRar8dwqp+3zw6wJ2oG5bZQjQo6JDCCX8aR4/t2O
	ZS2PwCJdo1LR6Ri0wf+9s/VewcTCR4SVAYSDqGC/ptf1K4sfaKwRqpvpRAezHIYpYs+k=
X-Gm-Gg: AYBFou2IMiM0lWpTzg9Pdp0ov2/udR3+Vx2oquSUF1W6IZNRK68fT6STInCxkWZ6Y6B
	Tg5ljWiHLa+yJQE/c4SkoUC1ourcj2J1gD7hr4I85ipEy/EIx2UKEZ7wSOUqrnPU8hRhiNq5uOe
	zxfvCKm+/JpCsbkWFiyrz4RSzTDzQbtnOwsBnJw4gNSRXf4DQmDVRUOh1SvoP9VMJISWh/scVjk
	VTuur/gFAE8RKtCFyuhh0SkBCLO+3ljs3W4FLGNXkXx3Il0FRAUubSsjo39A1FQfYCZaHe4tWWD
	L48qMLt3mBAzkgr2biZ4SDe2poZAEpkBE5hAFRFqPLSnJi5VRg0GEHRdnHxmLt0JsAMJWX3pu14
	Vf6p9FwNPlth/ZR1nnWtFr8O9BY1b4A==
X-Received: by 2002:a05:6a20:d528:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3dd72665d28mr5070590637.14.1789645295173;
        Thu, 17 Sep 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:d528:b0:3db:131b:8d8 with SMTP id adf61e73a8af0-3dd72665d28mr5070531637.14.1789645294657;
        Thu, 17 Sep 2026 04:41:34 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:34 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:02 +0530
Subject: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=C29tX4FRzcgmif33GVTX6zsYFWffRjwZBgWZudoP01E=;
 b=+ThXIethSpr4dc1t7AXKnXGlk8O7tt/aAN7e5eHJMwBsFjAbYHKM0hdc9zbVJy/q9yDhXgnYz
 NN02I8qmQYJBSrtIlA6mpaV2cl2V2LH1in1X7AwS42iGACGyt9ozb2L
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX6X2S91LBU2WS
 mLx17sc4AkoWGdsV7cfeagZsnN0Lcbe6axMx88lLFTQsyZ9UMj3BG3uXBHZi94DQ4RRqrCmhBGg
 SvqyoYQM89uSGlMm8jr7/2Vc2gjikzUkuH53p2w5vRMdztdd4SGcwUU82Htgtm9gw6weMzn/Duw
 uqy+UDbwOf2hME97ult9Nzc70DWITEEoel8IS441410kjDmsxQMgtBjJixAECWiL/eD27kRfdC1
 yy1nP56tVmtpRNr9Adp10Em1twg6Zm0IY1FbJPwtiHsGPSNk+vajGWYKkq+lQMHOXv0GUbpZJvT
 KDiLE9hNWB9sFBp3iuX8xnE88/lPaRBm3YbX5uodbvFoH58FnXKv+ugmEpODu8x+VMuBQ/RXT5t
 s5xxHphiJHctqdFw/KowtztcVx1xmMdNR+0DTqc4osGqAgQ2uuDmwNMlKJ3rq5iaytCyVSyhSBC
 opRxaqYW1Q/IsvKbM2g==
X-Proofpoint-GUID: 3QENPJjW8vLflYy3Uv9S9w2O-4URiLRE
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aabd1f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3QENPJjW8vLflYy3Uv9S9w2O-4URiLRE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXz+zLu9fJ6rtP
 Vycs8eIslX5wUVrersiHTFqENqUn2qANcpQrDNnhtxZdcArUtizlg3HEGPU4AMPv4fX6Hg8NaSo
 pK/aGlzVWyHEFXKSm5KHrT1j0Be0X3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170162

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 5f64b4e50967d61846b7b0c565380a58e4ba3210..682f2c933c3ae76282cc399f8bcaeac3a3cdd654 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -924,6 +924,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

