Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768939;
	b=gZWISnrP/SHKcupJ5f7MGYDu7SWEabjP5dJZjox6Aokw8F23HkOYlj25RyOizUpwTlG0
	 ZledYPFbKTUF8TyMIKLHnjOV0JKZqS+kISjGeGK3nD7njl5gXjtQvqzPGWht2iR54/ZNI
	 E/MSjfssDdnq1ehDR7RUuGxfTcf29dMFFECc0GHM1+cmd4XDkqQCBzNKG58TymIV0Mekk
	 QYhsw8+YvRO1iBSa6nN90zjqzsV2OfvRCuq6FqNgdtS5v9WzU7dZ/Q8Qu+eBaGaDRFKM3
	 hKnVx24rgdFnTsxu61OUH9OFMc/MNQhubUMC1nRqamDAQioSiq7Q5m8UrtcCWDmhnFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
	b=J+oAiw88KhoTguCkzBQDaXkIPXY6rFjQdwx+hoC4KHokegDwz0JPLm+55CmRVIAnaH6m
	 vzNDg6p7EvUrMKd1n8PilPWbopN5DsJqqHYU754f5wg/wHKd9Hkl1qKgUQLoUGBW5rlkD
	 cwRZbmfYwPjuVEJ4f7fBy12h8w2RN30Ok5hbMLAgIAbB2Dbdw82gQURIHwlg7ya19UeSe
	 3S/yZvLKmP0y9pjPTSyonCgTMXESlKPc8vaUhT38eGWidedINnAGq1/LmO3NPD3WAIiDW
	 p+yDPA1xoGNpfHFXC8NefzwtgPKAdsMp3GZn5se8525O9OcpQtFsAAjM6cNpgbNf50Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RefKnmzN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjbueMa+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A616606A333
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A616606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RefKnmzN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EjbueMa+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RPMV230663
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=; b=RefKnmzNWvv4FqdS
	xjwAg+ah2JqQ5tnLdTw9NQ7kuRiVB6RqadPB6wdN2VBHIvYNaxALHBqHxC8t+jlc
	lzUldt5o8P2J+iDReMwSzR+ewNfMCxHZI6JBjChtJc27vswdp/PzTbL/ooQuFXwb
	wepIsbT1oyiC9rlkWbaC9qYbGcFArUYT/uIX0HetS44e9SOOn7ESosi2V/3nw3U/
	A5U1R24Onl4JKlEhn+PXLZCMK70GTS1agkpIQAV6xnM6W1mVfh5Z+FhMl2aIrWuw
	eF5pGsUhI3/2liur/kdUWs0XGAXOMQ4VTCJhe0j/KIszPqdNODpsPOIPTtB8ri0O
	yByH1g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypk7gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:08:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so622011a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768937; x=1794373737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
        b=EjbueMa+mQIxqpLaSDEecuN5Ny1MGeM+1+TZUaWFTXbsXvAmDII7cfDAij96Bfzr76
         PmPapXJlP0wKbY99PL4NLTLO2z6zOxWWN4RS0WWDSpAC3JU9v1HXwRYm7t9/O37AqC2R
         xMyvuFF4/p9fG7MLJ8mCTlSgpOuJhD6UjtXR0IlIZ4b+hyBrCiE1OxUMqb3fl7YQw1zF
         YwuFNELgOJlqr7zoP6WOLjoY8RjUwq3KEzuiUgAFuGkOGxPyi1HxhUJfEqf7v8vWjzNu
         jef5FY3JgNE1NJ9kSb6cbN/1r9aAGtRtJyyzpJT7PfVHpph4jdLuZQpk0cz5G1/IMhIj
         9MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768937; x=1794373737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irmzjxYkOrsMZlh8kIZsqYQaAXZ5oad3Rk45vGST3Dk=;
        b=OdWZd3/9it4t/T0v4K+b0voNvOktEjku+A4H+o7POz3QjKMvXD0Ka29aB8QDU1vzrP
         Lv7g9Z3ck06tnXAI27fPsZ3j9z5rpSQbG36bhDqHa5OniQsrM9EP7/1k33xgX3aNBm05
         gl19NmPdDDLn27mYBZXmvTcgG+8hxyIN+UYG9JXoqAUuDuAp9uvpfjgobdHXcXmb5uXZ
         GpnALe64yit0hQX15TJl6IpW/E9e+arFnPuzpyCzkP2kcm/jr6BSSwo4cBHn7kYwVOjS
         r5gFBJz31CanfPhegE0R51bGvKPkaKTmOYoX9eaLUyQkrtfO4FPMPqY6PJayjUHyA8lw
         i6qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWP4+QnvDeguPJRIjFcVF20uJSibuPheP0FelgrfblLFsUpVdVcCVvM5kME086k50kJLG2I6op2k1u1UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bxHmUYSH7vGrIvfLdtRQ3iUiOpO11/qS6jtBSpaYj0KmGxzOg
	SiLTMjDd0Bt1sqiOE+pYwtgEWOQxZMqKMjQB6GeUxaFOXZWgM5+X+opfiT2ty8qOBkijvQ1k8Hy
	q4s85ioB6nELfm4BxWTDwyVacJClrlelJXz6uvk+wmW7oVOF0Z47a2X6A+WuDuq6U/58=
X-Gm-Gg: AYBFou0lScpnBcQS1Y0SyOD6SQYI0keosf4naqHp3e3TuJrKKVh6NQvypRMRA9CZdl/
	dZA7YhN2c0JIzzHj5KX13ZcBi0Ybr9A5hGQnLXbQI6d2ftQMbV5Ud+ZRT+dAhgczwB9k0+HVTMk
	1kMndWsogRIkdlTwToS96/dlWAxrOscK1ZC6Y56zt3cXofFr1rcne4lBZnjJCkp0dwnhH1HyoT0
	tJNdNtl5spK9FlM66ofdf+eep/Ou9I2R/xU1ullsjRTYcCsVEnSohH9q43WAkGMtkew4fSB1cJr
	RBHbIiE0MXW9CYZw1X34mSIpzmLXtyvcJGzbWSddu1Iv/Sq0cdCET+ex1rkq6fXjInNGnRzEM5j
	0bGREuYsKy2rHmOEyyzetXPMwwi/T9zleAjmrs6jdXxBfTHBDEnEyfRTla8j+ich1blT19pYpRX
	y7qHg=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13545616a91.45.1793768937104;
        Tue, 03 Nov 2026 21:08:57 -0800 (PST)
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3ae8982c1ffmr13545593a91.45.1793768936590;
        Tue, 03 Nov 2026 21:08:56 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:56 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:36 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur: Add support for AV1E
 clock controller
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
Message-Id: <20261104-glymur-av1ecc-v2-4-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX28l8V42sNEZX
 4xeviVGSnAyWvV3O+9HE+TOM5EVDsDnXIr4AGrJGdlY+8sCDchYwtUkwsVB6VxklI4Ro3IFYXAd
 OLX7Ue66pfj9btGkdwr7c5zOf0DdNhI=
X-Proofpoint-ORIG-GUID: 91kIIYHOsbpDMJJFlHty_JvlUc-8XNF4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX2VQ+w3MKObge
 WFOkYK2LDQPHXzIDN/TAgO6B34f9lqTiS5+UEo9IuC8GWjn8yQbjttuJ0klJerLc8oeEJxxIyTA
 imVdi1xN3PZDrOrA7weucB9bBTDIZZIvP4Ae7Piej0nLnNmHW96JOLzaAvw5ROGXTc4K06ar9gZ
 KB/uIlcpxzUCa0MUmHZ/AjD3ojUj977HkPZ6gxRP4CHu64dbODYuVVCa3WNm0XuDvUxfBnJf7Y7
 BSKqvjNLLRRcxSgR0SI3dYFWuwqPxcSwM9APduiviqWPIZb6qszYjltreLTAZpTvULvWDev/3Lx
 LSVOYrtxGZQ+zPv1HPq9dsNQmHkzU+Cj6A/lzz3XqntziESNPLuZx4UT/8wrCIZ8fp6zMaxua0G
 6HxFPp5xMClTTTdzKnFME3lNnnjcLn81vmnr4lnsTGlhPwyULiYuumvdypYCuA6oV4wLi+nO+60
 fNNke6ZU86tgemEjMKw==
X-Proofpoint-GUID: 91kIIYHOsbpDMJJFlHty_JvlUc-8XNF4
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeabdea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2qHST6af7bV6ZHC55aQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

Add support for AV1 encoder clock controller (AV1ECC) node on
Qualcomm Glymur platform.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a99208584797eaca8196348c617619af..da7548e6f1c555a01513c964dd974d45f07f7266 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8146,6 +8146,22 @@ apps_smmu: iommu@15000000 {
 			dma-coherent;
 		};
 
+		av1ecc: clock-controller@15220000 {
+			compatible = "qcom,glymur-av1ecc";
+			reg = <0x0 0x15220000 0x0 0x14000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_AV1E_AHB_CLK>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pcie_smmu: iommu@15480000 {
 			compatible = "arm,smmu-v3";
 			reg = <0x0 0x15480000 0x0 0x20000>;

-- 
2.56.0

