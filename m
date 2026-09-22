Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7983BCD28
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108752; cv=none; b=lf5gNYf4YpYetEbM2cO0D+netIP5BrYHz+fQz4Si0uZQBDxU5qYfOFSmUZKTGNRWw9ZBb0jtHiD91OZ9aUfplGyb9kxodemnV0NMs60A8+FMboFGTNHcKhSGomy8/IG5lrK5xRBvmlYUA+U97tA5+pGd0yqUWzro9QfLHXrlGdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108752; c=relaxed/simple;
	bh=N30ql1CGm+ccNkC77iZPDzsGhYzy47Anv6iw4X4OkKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9leJxBL2RuxCciM9Ec4aD+6M59GwGYD3br2lJ0IUWlFk8pTQ4x3onjGEFGBNuuUlVaH63r2k3qkZXkvuzR/K/mXDpENiZMAjjUwOIQhjXGsZeDs9RedfFxTb2jp3iT5WGKefBo976bdYTDsdEf4jIOt1LCjGAu5mUT15wsde4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coYq3TXj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZThXw+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coYq3TXj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZThXw+U"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7QIV900426
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=; b=coYq3TXjRQ9aK7F+
	wTRCrbpcZFvMr7L6vo0GHj4jMo6pZSIs9ZHWATLffDLV6YY5AntUz75hPs4qv1wT
	McNaaosNwsZAVYzHMXWmOv3NzSGzCcIRAoLhZwulO36/06yv7gQoByI47QfEawL4
	YRRq3nvJlRggs16udBzsiRmc4S1yoEV5JDIOiJmrU42k7sOYovWZ8yk1TZDwr6hh
	6eaLU5Y6GfE3oB2oXPmR95l0e02YwNQSgDic3GyULFrfMAbelkNFXNVkq8+O0Kbu
	v01+cKOni8WiKi0NPDdH8pGREBsf3eauEjhsu0Dy3Npvkjyb8W9eAuxkVCHhDJaW
	6apcCw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyukfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:25:38 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c307941971so490646b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108738; x=1790713538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=;
        b=QZThXw+U+6wF01rdoXkgNvw2SefWjNOUS98jsAH1di2zk+d5M4rSvLc3E1wYree7bE
         xm1ppX/buDGM/fustWMGakPKaLCyrg3RsuXR3nK3T/4GURNUlHTfaWzmNNgRErDvnWIC
         7NOXFRvaEpbKBL8RLVG5Zi/jx9hDAVx68UyuD6DMEkraLzKOM9Drflt9mqhvuz+UDQna
         PDOQuzxIryt3n4PNe9okCIWC2h9o9xh9SGv6fqQGgFmnm80JPubtSgF4Gzoq/j+7T0eK
         6+06Qmh3OsvZo6YSvgDLKtU4itlebwab/LQmg6EhT8kw24iIrluDEePnnljJGCLsAgOb
         srrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108738; x=1790713538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=;
        b=s8lcmAEi5zaBU1Jddz1oIXgnRzRhNYuReOSTzvqe33vcQHCA8aIWof93muER4tTex2
         I7KU7mOiyZscqz1qi/JomF4glQcWVOuXc/J0IZGH+bH6zZnLwHaPrNzdWMwRPMOjtTSP
         xG+TnwUufvzj5oQR0bwPVeRKuEgdPZCUqOWna5MhhPb546NJ2WGGBDsqa+rro2pdy4xG
         P3cVmHCXJDOoNvX1fy5ntCGqoyjm40yJpQ1AR45b+46yuG62hQiSwVt4uBVZuYBeqjYA
         FCmbZZJH2cVj/cb5/qCVafMpxwnajITRwAKQAldaMKFCFMorK4tt7pExJ4VbWNEYq+Fu
         7MPg==
X-Forwarded-Encrypted: i=1; AKwUvBwJdgvFZHSY9hQvLBuSScK6g1wDimjHV2SoGXKvjYqdWZrsGUfGllAam3bSVqrDECluAeSQFWXGF+7uSDs=@vger.kernel.org
X-Gm-Message-State: AFuF++njuOtXD2aTa+159uw9Y8feSDdnEADuuBLvADozzB7x7+NuszXO
	BUUs3OcDdM+d1Mc++mlcqkNcceEtf5YoUUjDcc6chUbTtAu0c3/8TMmTLlkoG2iaOmGjWboiIPJ
	oGjNjgO8N5y20cwurHYum6vce6G4FEiu+1EfBDG4WMaKAZ+Cq2fvGsGyTgjLEosSeoepm9uu779
	8=
X-Gm-Gg: AYBFou2iNKKn0lQh0UJqDwuBRcbpXGmi04ESR5+ViHNPzUEftMb0B5pTJ1cQ41SHtdC
	enkokuGcyrS16OkDj2e1f8c94jIF7eYLVCahFsLB1ZaUUuNfmRJD1SP3FrpJTYTqFFaRFqC/H+t
	OgMs/XLaGpEx5dSV7bS4/fnB5MzGVzN5ogLybRHKqZ3TiXXkrEzsoiVWzmn2QvJR6flYoU+EkB2
	VuYCdJqa04sx1R9yUVngmhWT9Wd+Xb5ULNIk3hJ9zkCQl8+c+j2ZyG4pdYGdFFRLqGtHQn0xhbx
	puiX/n/DJYX8ZUvWGsMAMOsAEcuH17tKpDdCNkEhxdEX3guRsMmCc1e9JSKmHMSn4yG0eBcI1HW
	c0IYPXZ3+7wtPs+5ZmmLpaJef3iFPXWqM/Kb4
X-Received: by 2002:a05:6820:f02a:b0:6b7:46fc:1da with SMTP id 006d021491bc7-6d2d251b0c6mr529340eaf.57.1790108738013;
        Tue, 22 Sep 2026 13:25:38 -0700 (PDT)
X-Received: by 2002:a05:7022:1a86:b0:143:26eb:18e9 with SMTP id a92af1059eb24-144f915483emr769997c88.28.1790108345626;
        Tue, 22 Sep 2026 13:19:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1101142c88.6.2026.09.22.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:19:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 01:48:36 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: hawi: Add header file for IPCC
 physical client IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-dt-post-v1-2-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790108331; l=2279;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=N30ql1CGm+ccNkC77iZPDzsGhYzy47Anv6iw4X4OkKY=;
 b=rPcymbyMOz/UdGH07hqFHovIn2jIq2rE961+D20tyWyoG2atc806D+jtUcTsJoULZ5xYg/14d
 TMZMwCRS2+CD3tjLC99XUGvqtMIm9p+YyynluN6mt/MZz5hSmODj8Ua
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: lH_FO4kl8l887Ng_QT9w8MrPOWm3oUw_
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2e442 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Fdsq5qC3Yt23JGXt4TsA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX86io6HGUJiZT
 DtqMQY/twBd/+8WwUZxlB0s+u6qQwYQ7ZddxzUZTccZAX41Lc+fjMd//PR47IGPCFbmu56Vls8m
 kmC4W4w6/ztYTLUriBr75uqOlRIlFKKTpD5VgDFGTp5joG6/EHPXSlShA3T5PizbNdwYat4i9Rj
 dSU874wW4A6xX9OzDwen8iuX0F+KtChFbjeslujUK0nu8z/LvVrNNSE0WYtQNyOnuOGlf/FoTIy
 hhn2I0ajLdNEIPvqZzISs9MdkpujL+KlfBEy2Jjj+jbiT7x9/sEsT4ZoEViTwf9HFdpvvN8Z5gM
 uiPl7q1cC0dctDLQYKA7ntOEU5DlNwkPr0Vw1haJnIy03wQTZbB97w65LN9Tgzj7Nhy9QLL1sDY
 uQ3HP8GWckKmRZnuE0P8K4ttNWud6rHXwmiw84a2aVek3/VCH0N0QphuMmkeSdu4Bb2N4gwHOWI
 tQxrJM1q7Ep1snS4Gqw==
X-Proofpoint-ORIG-GUID: lH_FO4kl8l887Ng_QT9w8MrPOWm3oUw_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX/1Ki6Fvi2OcE
 QSYtmuvFQnqvkUwPkON17laDv2UShnVxHdsNFsRioCfpzCsJZinbvHxc4gnOkho7d7n+kjOJB2O
 hJyM37JaMCVNQL0TUIRvyWZRVP1qMNk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

Physical client IDs are used on Hawi Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-ipcc.h | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-ipcc.h b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
new file mode 100644
index 000000000000..67f228e1aa0e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_HAWI_MAILBOX_IPCC_H
+#define __DTS_HAWI_MAILBOX_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SDC			4
+#define IPCC_MPROC_CDSP			5
+#define IPCC_MPROC_APSS			6
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
+#define IPCC_MPROC_SOCCP		12
+#define IPCC_MPROC_DCP			13
+#define IPCC_MPROC_QECP			14
+
+#define IPCC_COMPUTE_L0_LPASS		1
+#define IPCC_COMPUTE_L0_CDSP		2
+#define IPCC_COMPUTE_L0_APSS		3
+#define IPCC_COMPUTE_L0_GPU		4
+#define IPCC_COMPUTE_L0_CVP		8
+#define IPCC_COMPUTE_L0_CAM		9
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
+#define IPCC_COMPUTE_L0_CAM1		10
+#define IPCC_COMPUTE_L0_DCP		11
+
+#define IPCC_COMPUTE_L1_LPASS		1
+#define IPCC_COMPUTE_L1_CDSP		2
+#define IPCC_COMPUTE_L1_APSS		3
+#define IPCC_COMPUTE_L1_GPU		4
+#define IPCC_COMPUTE_L1_CVP		8
+#define IPCC_COMPUTE_L1_CAM		9
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
+#define IPCC_COMPUTE_L1_CAM1		10
+#define IPCC_COMPUTE_L1_DCP		11
+
+#define IPCC_PERIPH_CDSP		2
+#define IPCC_PERIPH_APSS		3
+#define IPCC_PERIPH_PCIE0		4
+#define IPCC_PERIPH_PCIE1		15
+
+#define IPCC_FENCE_LPASS		1
+#define IPCC_FENCE_CDSP			2
+#define IPCC_FENCE_APSS			3
+#define IPCC_FENCE_GPU			4
+#define IPCC_FENCE_CVP			8
+#define IPCC_FENCE_CAM			9
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
+#define IPCC_FENCE_CAM1			10
+#define IPCC_FENCE_DCP			11
+
+#endif

-- 
2.55.0

