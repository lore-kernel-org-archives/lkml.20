Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234126;
	b=Y2t3kC+b8ZZnvu8HFTvS0A2+UsCYfxJFAEbwvwm4Psu922eNjriJKnOCP2ZUWPVKkiIS
	 gbiFO00jnR/wXPWiyETYfc08klDHFILOLWofpA7iJQqq6j36IlfRDUhq5LVAac7FqD5T7
	 pLI9BIrbaIKIh6UegltXAA4dNIjGsil8HtcSFJKlId3V/dW4vVOsfFUb7Jm5FdE3qmNtS
	 LdWdghtiegMC7DqUZxJajceWYkCStfYJgIqHB+f4uNpWDikKpI/b//PGKc96dFUgQrr74
	 IpV6cdNK3t1yyuVVKSwPJ0wBi1MrB1R9kWraOHttCtA4uEullM1wHv/FknI7ius84Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
	b=UWGOggU1lxBGrwuY1LOHzEQ3NIuRgczUdLsn5zKWTq7PAkOJZqLdeCCCK4cuFBsODnpc
	 ss7u8GdMWCLFahN7b2r208hK8vsORtWbQe1nymokpVAGOU0ESLBhAQ2aucmonqKcvijWy
	 6rYeChXiATB34Rbe0/WEYjriqnR/EcCXIqnvnON1TQRbVucgduuSpHtS3cbboadEgqP0r
	 rCpFGYMVojx3N7EQHetCuG+xJyTsSzDgcMnfRDtwAdI6gG89AP30t0+w1U8/lPr3W7/wL
	 00bb35ja4GvUJaNk0r7XR3dsPEkO5MHWWFeEx3jSK2w1xWqKJd5M2ki3Qll09W9SJuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oqN/YOYs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzqINdgm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC00E608360F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC00E608360F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqN/YOYs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzqINdgm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEwHv309705
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MLNc8w9O9Js
	SERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=; b=oqN/YOYsINLFFogdzhegMUXq6ZE
	inCPTkSWDc4mUKH7WcBXVeyHLUoxu+3UV1WV1YP1ncUMU2rXxjIyAAd0Q0O/TVVJ
	qp4lRnk9UXjHFsn6HhAcQ2v+Y5nOwiyvAMLue6TUjIQFd15/h+rGmZKgc6al6WPk
	lraD99FMRe6mavi/Qgx2idCYdY/X1WKvmcnOZuFFYMt1hBGNLWSMAlGLsbcuRwep
	0aV/VsHoLHrVS/7R6utrbsPoIkkk/5S6JvgcHsAmU4Yr60hFyQt8p0A+7tQ008DC
	AMxoLXUjWrNiE169E0tj4/vv+YirzVijIUAzF1Ko84CDNN515Gn/4v8M41g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8s8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:22:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed276af91dso16644495ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234124; x=1794838924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=jzqINdgmKD2+jv1ux+0+KCW9i8nvBaQZ7rd4WAkfSVUVuilEcWjxKGkrChxtASus0w
         xpWpXDrOGvecq/C2ehtNCdMsCp/Cnen7Lev3zcqnjzC0brbmRuznFH0HOcrYhRpywYQr
         93rmPSp0IjSE90HQHylH/OKbc+a0Jk4hWTnEJqFa011LjM9ztiBMVejOViOriN9mEj8Y
         bnNTCRljXmAWY36hjUIhATWhpf4Z5F6IaKOB/AMEoDV+fpk8VEHwhjzBuuyBg95re+pk
         srjRjL++WiPwDqphAsXR8ibf9dz0ylzyzMOHOzj+r+wKq8mr9lxYve3jfoLJeZhWdfyQ
         hjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234124; x=1794838924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=y5bTKchs85HyOew4VN6Pl3oyiBdLvMP78lTE6omDcLNRUsfrXhpZC8v7iR1D9Iq3gG
         6GOhskftspyrb2Rs40iEBy4etCfkjPzDy+aeMF1FP+g/JXLFAJobveHYbN6k3CUyj9rT
         4OSN5/Guj+3jYK324I1sPDDnLVRfLmj4SMQF27Z9qQMN1lwA/x5OA8aGLv5dnkxC/R9s
         apcOD/PO0kXUi1yLOze74ZpJQeuG8w3sQxPilof0ge+dwX4oxRCBBkAr/FYQfccbrFAu
         f9GKBhvAeQVeuO9k6VAcBTnOSjaQ9nQ/YKRVXsasU4eeesmbCv2DqEQQm25Ol2B3piSC
         e9oQ==
X-Forwarded-Encrypted: i=1; AL+hErFwNYFqeKUYwL5zI/eu78YXrEpK68BslGuAZnlzOxVMjbpf8gAwsQ8mCyPUeD4iY0QmaZSIbhVQmU4juXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HpxhgdgTFroiI2S4xRvSyP8CPAr4+Y53j9HvQAME9H131JAY8
	jdJnSnaXd0SNm1SSzEs4IJGpzPoAlLfCTNMjfyiSHzp77s8PaZ5Ms6AiXCAJLz/Xq2njD9QXlg7
	5GIbUzKEIIZn+d8SLToHhFULOvaUyz46mtVwI3Xg+M5KmQc9F4lkU57POd8pZFlZIZ04=
X-Gm-Gg: AYBFou2nyFgFCdXWY1WbkrjsqZcJZhxiYaaLPxLm3H+pTGw3KJE5Gmx6fnnEvcHjSjS
	lj3yQ+ReiXbYFQd5mc3dR9gFPCF2Jue7tm4jPwjNHFU7ls/Op2EumialObkwz/qR2VvMV7PBfwA
	lB0UoyfMAmEVxp60Pf81cXvzjDNx+FUxBGo71CNbTUAr18OZ+bdob2GONWcENEObfpndp5f83k7
	msA9P58qdQb6Hjv971/WAEseKAJ0l9oOYNP9MI31awz9+cZgvNrJ60fMjY0UgoxZtcDdSPbuziM
	XxV0XcS7C62A1WZfjIC6z48p1UfLVJYN8faa63AU/FLjRZWy60Vf0O7riSj/xz4fbL4AN7PZBQr
	8xywNPoDklxIGgsFJm1uTz2ukzREiar9vEAlRl/xZJIDMit4NW5RBa1+ILQFbSTj0N6Qpot6WPJ
	5brsB/0If77dfb3XUcg57U0atcnzHmiB06IjMv513qSBtL5e5iTNEj6RazxYZaXg==
X-Received: by 2002:a17:902:cecd:b0:2ed:118e:7fa3 with SMTP id d9443c01a7336-2ed83ff0b55mr47297715ad.39.1794234124312;
        Mon, 09 Nov 2026 06:22:04 -0800 (PST)
X-Received: by 2002:a17:902:cecd:b0:2ed:118e:7fa3 with SMTP id d9443c01a7336-2ed83ff0b55mr47297225ad.39.1794234123803;
        Mon, 09 Nov 2026 06:22:03 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81728a9dsm12045375ad.60.2026.11.09.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:22:03 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 15/15] drm/msm/adreno: Remove temporary __maybe_unused
Date: Mon,  9 Nov 2026 06:20:01 -0800
Message-ID: <20261109142111.256630-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX5rBcMHfavyKl
 aKJFnddJ1a5h/VNcX2YsYZLqhWeIIXkVclrtY/znYA45RAGUrbj8gRpq9nzfQIypOTXt1SdCKCN
 RAe5WiO5c6Pv0oOi0qd+92EEE7SIbKUdakieo6tV8sTgG75zF+R+R2pzQp4YXS3M+EzZdN2fU/5
 SZ09l8rfOt4ReQTdtoxe8z+jDYDw3NXFLr+BfkT3zdABaOII5wZffNgtVB7uFytwJ2aU9rWXqTC
 qrtsja3Sk0mK4yYLIfHMleL8y+TPAfFi7YSx6nn2g+PIMQEccxsVvQyqt/x3FJlMQCXcNa/uyO/
 Zm3H7wdkGPYu/tUApnQ7FGScxC7/Xch2xvD9oIYf5pj5vy4kdYpJjkH9YUOo5qaybS+zsOJeDa+
 2jOnGynPaABtx7dhz+Y3q8SNL7zhBhaWlkEhy58dRg65qj0vSyDuD29XyEn52MyR3tt5cMJbx1N
 XVQTXAN5Sb/8srXrBUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX9HWybwZDen41
 YmZEwwBjtJFl8ysmUumz0zXzkZ5V/Dw/9al6FqwmmZy+bbvvnaVjA6Vrb6+Nsjf96vVmrq0J4mh
 tdNU24lSJHKVP06E8IRfFGYlb01ky+M=
X-Proofpoint-ORIG-GUID: ETlPLO80zIfL4J1GKC0xSgtJ-euxmVuc
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1d70c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ETlPLO80zIfL4J1GKC0xSgtJ-euxmVuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4c4b904a8657..c5c928c1b084 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

