Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768927;
	b=huQz6lLT1LZGKYcZB5B/QoeClQkCV+mLxJVr1HqWXW/hl1aC0TvDB5DiWk0guvD03Zjz
	 mXY3kUpOPi+41D54ehuTuoh/GatFzczbijl5IjQUFnuT5kF1RW2lhyYxKus7RWC1IUmgY
	 U9Gz4EiiFGXAjYcRhUtoQAVqOHsm/5q5W9iP2aiG/tDgmQJ/NYErGNvL1km1rtk5Swm4x
	 FErSwEoOV411Z3WI/yaOl6s1VpQcxngtIhT0x+Q3plAox1V0c5yL44ubSzonnvvnJ1K6q
	 Nin0OIwkmEh9onR6W6Ea8J/CGddqmic567XyO+PfHJZDqQUEE9am9rY1JCarQ7pMzXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mChJiALCphUbee10ss2HZPtfnDajwEqU6XVdq3o4+0Q=;
	b=JR4dN8C5EBETx+273C5JrsBGx6ycA86D/jkNz2dq/Dfq7MCiCKsA/Xgb3Kcfpow4JNdE
	 GUvYjkcPkL4alIQ1W46RzblzUG8xX1qy3rBo8/W2GOK5E4USZ11URa9sBvPJdUcEBYV49
	 XxVBAtZJprGNz4/axsLobjYnwqUDxNJk/vBfNx318zfvMgTJz3SLYI4ao8oRMRQ1k4LQJ
	 Rh734ip3VJ8dNTgLbSxPPcpRw/u86uoy8iLPGQOOc1mhPITDUk4eZyKFmf4JmqqvFHOW3
	 51Fs1ffo+tyWvzcQJRpOhjgZ71wsg7I+1Vx/SDDnXshVI1A25bgnImyulwhIhPHLquw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YogJ/ZgC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3pGRvHO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8217606D805
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8217606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YogJ/ZgC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3pGRvHO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQX0809413
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mChJiALCphUbee10ss2HZPtfnDajwEqU6XVdq3o4+0Q=; b=YogJ/ZgCjxXbFeRY
	zLLnTjoJHq/65aB7Fhd4hSdO/NyWhUXDP9kXa5zxs/GUybUxsLG96jD1+hK31tv2
	l6/Ly8y7m1pmRVSqDzmGVBD1o+58C3zA07IISbkInYMOHnst4yDiAPtG4fzr8s4L
	NMopLnFiv2jD8GD7ANgdKJlAfMZakUz9xhSNYlINpCcgFP2KbAE/r8Fn6i16ulXt
	nLFaSPqYU/K3sBgoULbZDBi952y1M9lyI9IzvS/TKDFUECYF9OLwXpYcYHWbcMrC
	rP79k0gphoUptdK04+jRdG2nx5GcRBYmkDNB8yaXzzJwUXoGdcMSp+p2YMSeQgek
	EObCeA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpansr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:08:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so411359a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768925; x=1794373725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mChJiALCphUbee10ss2HZPtfnDajwEqU6XVdq3o4+0Q=;
        b=M3pGRvHOUEsK3fgtWY/d1C6Mn3Ay115k5m3sgdSzaMqBrsXgBS7tqtI0Q+bYYSydrs
         ef9wGRTp3rNn/i+Rr0F3LiU8gMaMn7IzpxSUpKR/AJC23Qk/dAgxF2fBPrAiB2bOgxMI
         XjWMKdIptJ1IlkH6oePp6AAacTtqkRZZC96VfivAIEN5m9xhiV2/SIKP4nge8eZATibC
         EMKkBBy1EQ0SxeYVbkhQqHHqFvkXYiC5pVfs834UGRh2dul1axNdVbGQKLrP0bI7vjhY
         4XAhzl/OZ8YCzBrLYyPlAuLK/E8sWLDWM//Lq5cmevTETGZ6rIppKrpJ+VRX9dbrkTMh
         ipiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768925; x=1794373725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mChJiALCphUbee10ss2HZPtfnDajwEqU6XVdq3o4+0Q=;
        b=Nj1xma7F/+ZdO3e6mvAliWijG2QxmxXYtoX2sN5PEmpwQtjXLduYhuUMaakYSfrGqW
         VdghIBBcSyiFN0crbbiJjZ2dMXRnrjIC8tNfoNph2IUBxiSc9lUoEOJ+VJr/NUvtGpC3
         oiWXP50eBXRDFXW0Hf3WGHIWb7j7BeUK4jMZJeCv6LdON0LDixXf4T5JlmdRASp++U6u
         Yp725piSG0MA52IkfKkONEym3ccqlNRTgYulULmncN9FhQ68n5s64S7BGgDQI2eQQ7Hq
         nJypuTIyL4unGLjBGpEXJADuinnOVKx2TxQrkPwsmNJBvRHpPcuJCHrcV1izTBr9Flce
         vvEA==
X-Forwarded-Encrypted: i=1; AKwUvBzAaoht2DFMFulT1lt7tGOAf4Tkv0omDbYQfk46ipAX0hYiRL7+/Z2gqIwrPI0SI/MaVtcdHYfA5STOe4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z//GNZNGOk3VtF3L9AGuaAATeyIAOjtO00YWJ8t23OjQ4bgfwDK
	bHPshEnz1QIEXhE033SCDhe4Qhd/YSrP1o+3tNwGrfnq/tNoTVQ5iVv/rL0USOzeWACi1g+sJ2g
	howZvBesqAaL3Rqs0l0N52OERBtr38b/J478E7Hdyr5Wvm2Hf6BZU3zgaYFdfZ+ut4MQ=
X-Gm-Gg: AYBFou2tqIqptjLDa7uSnUxb0E6lPIK7xSve66YkeP0iqrWvlRwEoNZJ+1b+oxKpXyK
	mCV6qABuY0dYc0RdWOau0ZfVugsg4IUlCUS7zixzT4zQ0egeoXBvyJKT8mySPph7xjCSelc1GJO
	ba/CJ5Cv931wWU3Iddrn4CqRifJfOz/sPQh5WYWM+b2uXsTZvy60sHmNYsHVQ8kP7eOD/Rzxd23
	oMbwUjWMp1JC15vFwmIEaII6y7BPKv2kBWL0yx4jRfFzlUSC89thGcG/s7mmswZnmGQ7ygw+hrp
	zs5FfGFUy8v/8N1N/pEIfHF7BUYX7mNnM2oxVQ4fY5Gjey0HWnOfqgSdlwAgol1+TnO9pHgnHA+
	p5Gd9OubKz+Qwlhp2f+Lv+FsCqEf9Dm5nHCW3daa4YZlzUlykAaJrmHjYIK4dB6qsp8CMwHQJXh
	kncuA=
X-Received: by 2002:a17:90b:3807:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3ae89573cbcmr11594031a91.7.1793768924688;
        Tue, 03 Nov 2026 21:08:44 -0800 (PST)
X-Received: by 2002:a17:90b:3807:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3ae89573cbcmr11594017a91.7.1793768924198;
        Tue, 03 Nov 2026 21:08:44 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:43 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:34 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom: Add AV1E clock controller
 on Glymur SoC
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
Message-Id: <20261104-glymur-av1ecc-v2-2-7c25a73fe811@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX+0t8k8vUhMzj
 UsqbHaUtusvnbX5L57g9UCsbsmMHMiq65GeRsg5K9zbxiuMFWoXK0n+vy2L2fdqSGZpToUk79ib
 fIeH7IBG/drCvi3qwCfJ2W+BnRgaaHe+EGUflJ2mc9+APDS47/aGxVqWlGP3zZg/QmT/9DfEhQc
 zcNBDZ/ce+6doYmI4R0DjMWk/kupr9K/s/2bWSqPOmogWyoU8JGVZ39+gVueBt8zfjGJiigk43l
 0cZ1O2Dit9vZ4kZTdVJPdSe7Mma/+LevsgaapHWOfCazVMLn99SFpMpFcWPbqvlwRfRwoeLirnq
 4ubFb43DpLMb9PzD6oshtqp6QgWC2hleSQh4nllE3P3w3qhxJYoGV+VvuQVrYN5F8ZhTFg26w6f
 Bv0nHH0lFPMS7N76QIF6GQA1BXgEu05KCm3ZWH94DbegimbTsEemDdCgC/FYLbbuNRH0icNSMEC
 wDprCjeiXQLEL21Fo+g==
X-Proofpoint-GUID: sUhvc0tCWd4XmqJiwsYdgMeAm9yxgp7g
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeabddd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7l5iJHG2dVGL7M6DokUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX8Rp94gd19USq
 5qwvuotAYGJdRkIWtfVxU/j3Z/sXGFrsE3pPSDKKrAH0Glg2quqWPD+7oPG0IeixA9e7aqT4b4z
 mJzI1tu7mtV2RygfNXUcaSlPSCkz494=
X-Proofpoint-ORIG-GUID: sUhvc0tCWd4XmqJiwsYdgMeAm9yxgp7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040020

Add compatible string for video AV1 encoder clock controller (AV1ECC)
and the corresponding bindings for Qualcomm Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 ++
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     | 35 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index e985a450451d5e3429cf4630fb59268d9d894eb1..9f460fc4d10eb9245b6b9e55d0099bb1df2045ad 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-av1ecc.h
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
@@ -28,6 +29,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-av1ecc
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
diff --git a/include/dt-bindings/clock/qcom,glymur-av1ecc.h b/include/dt-bindings/clock/qcom,glymur-av1ecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..02b5f3d91a63432bc74996153ef1e2f6b7c786fb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-av1ecc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_AV1E_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_AV1E_CC_GLYMUR_H
+
+/* AV1E_CC clocks */
+#define AV1E_CC_AHB_CLK						0
+#define AV1E_CC_AV1E_CORE_APB_CLK				1
+#define AV1E_CC_AV1E_CORE_AXI_CLK				2
+#define AV1E_CC_AV1E_CORE_CLK					3
+#define AV1E_CC_AV1E_CORE_CLK_SRC				4
+#define AV1E_CC_AV1E_GDSC_NOC_AHB_CLK				5
+#define AV1E_CC_AV1E_NOC_AHB_CLK				6
+#define AV1E_CC_AV1E_NOC_AHB_DIV_CLK_SRC			7
+#define AV1E_CC_AV1E_NOC_CORE_AXI_CLK				8
+#define AV1E_CC_AV1E_NOC_XO_CLK					9
+#define AV1E_CC_AV1E_XO_CLK_SRC					10
+#define AV1E_CC_PLL0						11
+
+/* AV1E_CC power domains */
+#define AV1E_CC_CORE_GDSC					0
+
+/* AV1E_CC resets */
+#define AV1E_CC_AV1E_CORE_AXI_CLK_ARES				0
+#define AV1E_CC_AV1E_CORE_CLK_ARES				1
+#define AV1E_CC_AV1E_GDSC_NOC_AHB_CLK_ARES			2
+#define AV1E_CC_AV1E_NOC_CORE_AXI_CLK_ARES			3
+#define AV1E_CC_AV1E_NOC_XO_CLK_ARES				4
+#define AV1E_CC_CORE_BCR					5
+#define AV1E_CC_NOC_BCR						6
+
+#endif

-- 
2.56.0

