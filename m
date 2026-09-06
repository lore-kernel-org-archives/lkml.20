Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D93D890D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704297; cv=none; b=XNl7uFvIy4P7x5EqySXIfq+OT8kR65d6QqBi0QsCYMJcUPL4r8hk34d60+6z1fUxYuq16tf5PRO9E+VEquS5RLyEDIp62aBZH2glAtaknz0ofbw4J7HTpfrU2ZX+IxR86A1pOhKqDPysjR3LjE7nwPgN5gGiNGZvBBGHFUfXY3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704297; c=relaxed/simple;
	bh=h9dNcrncu0/NjEPhCrtIOiIL0rUfOuMr6vWCW96P5f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2EVeV7cODtgZvDJ6yZvuZMT8ycMt+QWlNk+rZ2rEdyioL0gBDUeIvkf8vQ+WOwhjyQgegwhUUN1hZKdG1jrSb6zuKmCrLub2llMHGsN5Mv6gHkbnN7U9+4qd/jgGQiyQiAhBKD+fwXW2oLySiqqlwNX6BDzdPcPfAyv2L3hACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8Tc2ZwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlrLco2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8Tc2ZwM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlrLco2U"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685NxL0X3935966
	for <linux-kernel@vger.kernel.org>; Sun, 6 Sep 2026 14:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=; b=p8Tc2ZwMKY3K9CPA
	ytswY4/fR15ypy5JIpwIemd+adDLBuo1xo/D1duNKm51syK3W43mioWOSgockrQo
	OA1kPVICBhti0yVxpnZDKpTlADzpF8SwCd3sK3VedyPm2oifWTIyJyY4bEoQF2TV
	pPQoMj9zNyAwWoR4hchK+cZemaeYBoQhCPXO++5VxgBYh5JAGtmafJgja+ulvxSs
	tsma8u5ezGojyALnBhEevxfdE/MCf9M5mWt9Cg6G+LpCipHGkYRqG+qrdHC29xSQ
	ypxgaYOVhq95XPwX2Tz7WSIiVVsU8dfGmqg3F6aZ7tAz8Fnd1KpvUdOhRzO8zkVr
	F1f8fA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vbea4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 14:18:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so45048395ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704293; x=1789309093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=;
        b=SlrLco2UUOobt3ombyTOWg3cjHU57Nkzftgs+ggWtrzOXGOmd4HUylIVOdaQYYB6pO
         ZzPmFclGVCUqOHKGHdESa8eivXNZwUfxeK5H7tFcjbAq7MaYTbNrC4q+UDOV6FN95xNm
         i1c7B6I4xV4IIBEjS3GIWSUsBVSaCSHzaagkRPupMTTdAeXB/d5M9ZzlSNhHXkbubD8x
         CfuHCqr89cL+8OOwxwxLLnqzlzSnWji1rz3M+CRQjj9lBuOGPmuTJxQFcTFgp/jcZe2x
         hqhbQll8A7BSbVLOVIiop/v37MiPWDg16G4ndFgXTlURVR1xKusattxAVqVwYjjG539V
         tx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704293; x=1789309093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=;
        b=UePA6Tnl1A3lDXRgmCpJU8RzF5LPpzIy4r+oVLBCpF1eUOOqlrogVvqUQq9/EfSIUa
         pFLjN0f5EEtXXWSVq1W5l4X2iKaY+0u3TiFnJssoDVGQBkM4KqsxqQiS02lqDENFDAHY
         W8NlKHolMMz4gXDv4zX5F19u1ySYHWWPGGa8rJQq6Er9Dh2hBKJsiO/Z4yvpKNTqoVBA
         neCRdEr8TbKeYLtvBY/EvI6cltiATjxbBvIpxy7An5+BdQRkGWawVl2xhvtWPp5Fud0S
         DuT7zVrM5yV6t57LqTu7KjtwL+VLOSinrvnAIBH8fRvM11S5tMfg6a/szAX1IqaegPJv
         Ce6g==
X-Forwarded-Encrypted: i=1; AKwUvBwqyEAeBaOp8fRMDmGrO0fjarZKs2T9nthNvRGEtBuEzBELyJ1/EiKqGJqvanWzxtOBDxkSfsap8/p5OBE=@vger.kernel.org
X-Gm-Message-State: AFuF++nJWz/LTbLWjylMdEoQIT0d5jILpp5u5wECOYObeCVHlZ7TkG5H
	3jr+syycMLe7ByPx77Nbv3qggKh1uaRKMr9VCl3N7zsukxexkaexa2UJ/tjknh/rJmpnT47JjIw
	8oubTLvq+WFhKMa/UFy/xXJl/WaYt9zMeU3VchJEF+CC34nroSLDK97nCr1TPvyqvwfU=
X-Gm-Gg: AYBFou2FkVtDBseAuVYAvDH5ui5q6k9fD5H+SsOwiS7V7px2BlzuwSaTzfUC97p176N
	8GU9K9N6qgQ1jkC1kfwrt6+G5iK4Nq4o3hyBdCA5YfO7/jsJlva/5F+LYuux/tnfN/LbUKX1xpt
	Y+Dg9NFEN4i9MduG6zAYNu8OhO62aKYK1J971tcjyOK5GsO+OWdA/zk+Q+vngHLOs47ZAYnrmXc
	bTw839xdqHVb7rUa7EZGcQBXH9XU3ZGol2BmgmL8AQuUn2dRA4N8Ngn5I3RoaKeLAh8LXMLRzwT
	rHJrUrW69vB6PXaq5W/XP0haQdjF5wg2V1+nHEit4SLa2tV106xNNykifoWJoAvVSvLeV5OGE5u
	As0kjDLQmv7ixdjnzPH4K7qYMPat9h/yPHD2+iyW5nac=
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr27094814a91.11.1788704293201;
        Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr27094753a91.11.1788704292675;
        Sun, 06 Sep 2026 07:18:12 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:12 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:08 -0700
Subject: [PATCH v4 02/12] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5210 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-2-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=2363;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=h9dNcrncu0/NjEPhCrtIOiIL0rUfOuMr6vWCW96P5f0=;
 b=ciRFfTEAht2dzjibKDQf3BKd+zbTktbQOERpH+JzzvCspUsJao1b3oTqyPEZum8/pLG1JcauK
 AJDymo2vvNJA9KxTdWNyOJhHXLTM6k1HxvnSIAS7Jhmi0shYNBQMN9b
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: byAXRaQ2Yi9edtilMfz1tJs1dYC7vIHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXzgWVMk4BAub3
 30mlKStfyWBJ5OH/9UImetMKZC8vr6cIrTg2W4ft8zDG55iEb6Ax/+l3vYv5z8uOsUKGEUEpvjr
 08qsSsagDjtiKU3EeQiz6Rt1vfpQx42nEVlstcV/wAGKKE/u/KXMCCsfkW3gH2mfdYawgQmDWLZ
 xVJi9JXUXQwKDvde0pZI3F/p3ywMpzd92cqjxLcKLM0HVBu3K0zLjEWHcjqPhv//TrXOuYgQ+4f
 lpxudQx7Gqlp3YNABuK5IUPPNzbfUbqs9OZtbB3Xk40F+SybLNrG1ezecLBZ3YuzEmjCPHrbWKy
 CimRu6gv1ux2YdIWE1c0rlGPPNwgxt/Ft4j8sBCGopD08RhL7ygYlXssYX+bxzIn/oBr7zlTy9+
 M8WtKMzz4pz/08OZBRJ8jEQPrfKkI1nJGCLrbWFo1nPsqQMMyNLOltOgczDUI8MUb67sp29Xlzt
 UIm/ju/6k/LgZW9/N7w==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9d7626 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JRX5g_4sfBZTL3UlNIAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: byAXRaQ2Yi9edtilMfz1tJs1dYC7vIHO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXwdvMIJGFyRe+
 Gpo49K1uiJ+A9cgfCEqv/cT8+sKJuVKWCqiFfrTBELQDLZ/y/ugh29+7QqE2XTnAymVugsEXUDI
 l4vlBpSuEz+GAy8A+cEXL/R1e5OF7+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060159

Add the compatible string for the IPQ5210 CMN PLL clock controller and
the dt-bindings clock ID header for IPQ5210.

The IPQ5210 CMN PLL supplies configurable clocks to the NSS (network
subsystem), PPE (packet process engine), and PON (passive optical
network) hardware blocks. It also supplies a raw EPHY output clock for
the integrated Ethernet PHY and several gated fixed-rate outputs to
Ethernet PHY and switch devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index a4f9af8fa187..91e17f126a9b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-cmn-pll
+      - qcom,ipq5210-cmn-pll
       - qcom,ipq5332-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq6018-cmn-pll
diff --git a/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
new file mode 100644
index 000000000000..9201d1e1062c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5210_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5210_CMN_PLL_H
+
+/* Parent clock */
+#define IPQ5210_CMN_PLL_CLK		0
+
+/* Fixed-rate clocks */
+#define IPQ5210_XO_24MHZ_CLK		1
+#define IPQ5210_SLEEP_32KHZ_CLK		2
+
+/* Configurable divider clocks */
+#define IPQ5210_NSS_CLK			3
+#define IPQ5210_PPE_CLK			4
+#define IPQ5210_PON_CLK			5
+#define IPQ5210_EPHY_RAW_CLK		6
+
+/* Gate clocks */
+#define IPQ5210_PCS_31P25MHZ_CLK	7
+#define IPQ5210_ETH0_50MHZ_CLK		8
+#define IPQ5210_ETH1_50MHZ_CLK		9
+#define IPQ5210_ETH2_50MHZ_CLK		10
+#define IPQ5210_EPHY_50MHZ_CLK		11
+#define IPQ5210_ETH_25MHZ_CLK		12
+
+#endif

-- 
2.43.0

