Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A505C344DAD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547865; cv=none; b=pxnpm77Z+8m7dObsHCQZ/PCDyMDqZxPZGilwFLd08so7nQMd4wWkscFCFQOAD1hYkkIRqyC5+tg8GI+I/qa0K5BlYI/h+/Yhmcwq90X98MmeQ1zXLTUXJUlDD44FTSGY/Z0YHbeTyhtV3/WjOY6z13gs+Cs7kmz5YIHUWw8Pa6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547865; c=relaxed/simple;
	bh=30e2YbKW2IQajGBFGXMD8HknPCEruSPRc6XeOZuDW3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKOwEJoCvRmM864WVvPPcRVnreaHyqGwiDgiYD8zwbcI8XKZYJLqWbrPg1ezV2SLoYJhXVLcle2H9t+JjffjDXYaNeQD4Xc4iSRJh2UyJahbyyeF2WQiRPAkajKn/JgOWJkJKjUw1NHJVhIIxIaJYUS9+HauMhEKy6f7+ppfpzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YneRItfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqR2aaDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YneRItfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqR2aaDS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHs4P806662
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 18:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=; b=YneRItfxRbb6Or7c
	S6V6E3PeDzKSliTXRXMOgHpdn1qjGyT3vGwciC3OiJgdCy79rKKulLxaTSaxyARX
	G2QcmSuvwQlsDijp/lIYUwF4m0OA1e1uEDhIH/61mNduvQxyjLMPzz8hSWua2M78
	80Iwe7G2nO/pp2r9L4SETD2hojlZrarS7rkoUEoyUWJpXNVo+HfPddFAX7r2EvqE
	eFv9bvW9kNL8FqtB9U1tKrj26u1rienzaB5/6Bxpu9gPuxNFrCMqyF7kI9Dq6ZGq
	3Apyo7Y7D0eMMZwsDVL9vb7oZKyVtFBIOpThhBld+I+y1wxH04o6DWvcAu74el4Z
	QYziTw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg01097e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:51:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2705032a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547862; x=1789152662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=;
        b=kqR2aaDSwHcAvFEe3wcX/iF5tY2gtUV0gPvSVgzOZrdxP1UvyC7rQrwAeZ8vPy2C0y
         mfGsbDw6JMYXRRA0NpK3pOpEOpsyBYJoq5OzjrW0DFFn0Xty/em6RRHBC6BfOXJTP8Jj
         CLsCdxt+9oa8e668NNu6pP+0X4BUrlnmIcQsXKTbB0bFd91EKqsFJrvBdbg+PlGNNEWf
         FKrEfzF/JfZpZCR3I1yrkk+rh5x7wrYChojNdlVNsem+VkFycNOPUm8l7O71e5RchYwg
         SRIyMTFNJJDE6DBvbbvCg4USXq4+OiFQeazUq5zeEOaGcGcvzz7rW3ttejsLo/vkv6LD
         KEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547862; x=1789152662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vP45VXrs0CiMYOIlCFKwXFygyz7JDRV/Nax9tHjmzJo=;
        b=KlKvj1v6OV/ND6mcvYK2I19tPU1LDDxwXqxXq0ka3H6H8KCHWtdEcg6GyKMUINQFOt
         EfUC+yVA2ZtOp1p47PtsCAh5d5kBvjBK7dZclDZBCpq5SroQWe72WFGbC3NTU1jFdI1y
         at2FG2Q+JyN05h5RPZIK34TYHUzaTa+6oD30mKTUyMvEIxl7kNTcLFaOuEjoIbH8zhs6
         ATw6umkhhEfGeFIDj42bdgWiLcx0KCNw2GqvR1dZZHCazEYcDmBM6WZ5VEMFAyvrrrQy
         yyu4xV0c7Ukxci92VEIm5Ir02TqOT0Bl3O48qICO8eQIbDMWE9PDQdnL9wqNeWbeboT0
         i4lw==
X-Forwarded-Encrypted: i=1; AKwUvBxQhbzTpnghc+qt+RA9Zo9Td3HRryw+zmHynd+RKCOJXFBlZlI+Ipfxw196eNUbZ+6mx9L4Z/kWJhPOVik=@vger.kernel.org
X-Gm-Message-State: AFuF++mMcktSW568k3SMrtJCv6iCXA8KtdH482WyvaSz83dEiRsLq1EN
	qPtxexoyNbVvqQFwaPkucX5p9a/Y02MoKb/H1R5BctmgYSReBcctz1GRlMizu04GBxwUTlw8ubo
	L7BdyoBq2C3/Aj/6uYHZmSR/eyaDowLppIRnXKLdipuPuxy2gLCioEkuz8Hv66CthLc8=
X-Gm-Gg: AYBFou3YJmxNXYN9x4FGvLsa4C0L6A1d3ZedaDIpza2mtmNyjdYsSobcqNbwJtSjT9R
	mPVImKvjiYNdXQ871t2znYLm0c2bXLPeClAY/vFnslPhZWM3Z/QJmevIs9EJ9AC/F2lRslYojiO
	ileuTW7YcVNqD32oR8bG4Yd5Sbn05unfsgQ0JpSL+SwG5AJf19m3YfvR4GoHf6eK6E0lHD5O0ay
	YgAunTJFB11R3x9XyX+THp2PBxaRexPmpGJbw3NHOOfhv4szcMU1xg+yXYuFKpFEucIsyOS+O/M
	6naE9IedE3v1l6xWBfeLTrVDc0jEl5+tES/7aQzzyTYIjRGTzEZS1t9bkrxvztJ7Oea5dN8qNsk
	RhGN7AO0UFfF6238704L3O7gPH+Q1ITk=
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr17687588a91.16.1788547862107;
        Fri, 04 Sep 2026 11:51:02 -0700 (PDT)
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr17687529a91.16.1788547861586;
        Fri, 04 Sep 2026 11:51:01 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:01 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:42 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ejLO0TZHhQt5kaR5RgF7ZANiKnlOYc_y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX5LPV+DY0cF7g
 Qg5JQLPefByO1HM1R9apCQ9LlsA8YUD3OkeS3AZAGNqcClN8fAvjHo+pDORWQksFhpdkUb6+N93
 O/zNTZ6GVk9K3m3saLizi2/LswY4Frc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfXw+X3Zbkjon2O
 TaAG+BOO3o8AhsXLLgkVkcKG0xb1YynnSmDrsQLa2xd9SMu7AMn3hic9vUbnRpwrpfdKg2Eikku
 +HhYhhsUGcHZ1Gt6fuSqMpopQ2HK56OzfqP4s0kOfcZjvwMgqWQegSXo3aMriJ35jfFmZqxelMn
 1btNx3D82ms3bb9kCrl20aaemid1+G8ujA4Abo8Chkwjn+qqxY3tcJjIbAduYqWgRHft/u6Dicd
 jyB/bSlqxhxab6mz/IwhSvVyFlRPuabJseidu1lcXdOiLEdpMk1vTrdMIod6oVTEjK13Ef1sI6O
 0H0uJtgcljuPU7VKokDFiMgYYNNe5pS8KjpdOSwbG1L9N3n5/MsqcAJ9Gy4Ujz08U7k0jf2lJi2
 Sw45DKE++EScz9pZjYSAGdnPdGxVhsbBGHhNRUSo/7oZf1t0xiPuhP9Jcz36N0hkz/llpK2AKXZ
 EpAm8Q2R6zvNoILpA9Q==
X-Authority-Analysis: v=2.4 cv=Zp7d7d7G c=1 sm=1 tr=0 ts=6a9b1316 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=afu-3B1tbf9Pr7ydrUYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ejLO0TZHhQt5kaR5RgF7ZANiKnlOYc_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
to reference the shared clkref on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
--- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
+++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
@@ -20,5 +20,6 @@
 #define TCSR_USB3_1_CLKREF_EN					10
 #define TCSR_USB4_1_CLKREF_EN					11
 #define TCSR_USB4_2_CLKREF_EN					12
+#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN
 
 #endif

-- 
2.34.1

