Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911239;
	b=SXXW93RonuAc0XXqx9cKKGLiA67VKrCmwejilq0kHDiHkqGl1yUlaGk0MII8LlOBV9iW
	 /q1AQBGi8Hc6j0gyc9KLmtN+JaSOY3Mvwa+/4ipSTaB5zXLdQo6HQDtOP2wY7x4UnLWI9
	 GOEV4YpE0WKtxGn6nvBkhJkm7b3Hisen6oJWtxKAg00QcezGfuws7SYMvDv8CFR0ESUqI
	 Q6+F6bAwWGisW+RhfcvjbErRlFV466AAOr0qLtcXT1RmON0XuPrKWAGaRlMBfuxyx5aUc
	 qWrjwmqBMBJEDD5D6/oIKsleDwEtg3ppmUVS8wySS3+wDqGXiEcqdSEHqHhZ6gTKh7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xNuC3YcpYbL/ohhfiu1MVmrTM22nlt5dJLHlvnKVZIQ=;
	b=1KTmz+86B/9nJv1vPjrz36YBRzeW6MJenExSz8aKneaqrltHIPC90dnzxgsl9Ym9AIid
	 T17Vv13abXf5Fb4cv86eDPB3mHd6RfXqcujITHDS85mshOjprOogkBrIA498bixSZUfJH
	 Amay9rOVqNRJx9HStPkSfRIkLkY/jVlhevnm3gjvVsM0Jrs0KfLtbROpWAQL3BiRRELu5
	 ljmsqfS+zua+I6Nc37wJZxw4LRGWgreNanMy4zVbTGjxI3h5hDx8+3mCAy3qZHeD8qaue
	 Bbz80k2v7hJoAL9wXtQzwt+U7Br/TJ/XVhRBirA/C9vvnWj1xsnturDd5XXfYGEit9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="arzO3/aQ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KRF5Nhfq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8046082BCE
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8046082BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=arzO3/aQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KRF5Nhfq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeNaH1485140
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xNuC3YcpYbL
	/ohhfiu1MVmrTM22nlt5dJLHlvnKVZIQ=; b=arzO3/aQwiqxI9F289NpTGta5bv
	yf83BvPoxMTP5wHgz3evmRjxUXD3uaTCaD4qsVUh2ZseT6Hyg2xvqsb5lS3mg+et
	yNG0dy97Dr5LKVW8JDuVrff7ZcP+I1ZZzAJ7oMEhmzj9ddNYYBNAKSJyumJKekP4
	ugFJCd/5ly8VhJbvQP/p0zUmisxVyyuW+ctpltqQP1XEUftQLDyyxSBxWLRDLkBT
	niK2t+QHbfLvnT2rw4ik5xGXhMKobExSasBWNd22linsyTqDZCrdKa07wH1TWQ/x
	scVAQvEyc3Ep4kpOojB71lMQ281naDtJ72g+0CeTLAIlsCpIasIRojtXbGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaak7au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so1807989a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911236; x=1794516036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNuC3YcpYbL/ohhfiu1MVmrTM22nlt5dJLHlvnKVZIQ=;
        b=KRF5Nhfqlq/JTWU3PAunAKx2kLJB6bBwP1US6emUtAw2psHQNBmOz5dKxZF2qvXRkw
         +Vnmxhm0Cp0oVMR3KoQg36pgJjCwOixBR97M3Yko/zuu/uaT2gL0L9DCPxzLdzHBB0Im
         kTHiXkOBFEtMaqx3qzTTmo67HfasULAAPEcf/7113xUFyOePEyhnRqubsORx943/yFjC
         2mdpcPTVUNOi2QqgnGkmdBF9UXDfz//VSjqQfzyefo1PYndUOXS2jni0335YZMj7yNew
         fZMDU1oIIj+9XTmw9H+MInyzBZdhAtYIAkGa9cF4o1PqtDhfqKYysm7GYULwXUxbBBmc
         LX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911236; x=1794516036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNuC3YcpYbL/ohhfiu1MVmrTM22nlt5dJLHlvnKVZIQ=;
        b=tUNpw+pLERXGutfJk1rD46AQVrLn+glQ4EzAEHCeJuWDK0Jy8MIDC8LVaOsdgUR+81
         hI3EasbJeNJmAK7+nvT51MxFQhwAF8TG+PoY/RK5e0ieDnSFyeZmdGtGVgIoZoIHQwEM
         1Yv9jPiIcF+OGhkwWn6/PCYyn4/aodQYskTQTZKAyKAwUiBN+mmwAL2vJGFeBT/1vPut
         NpfJ4yZpBdl6mkr/WAMBpgtE2RCAOktHJtOnwexkz6QlwtYo1NDq4hXqA7BKgakfwvXh
         tFl+ZK29pSKR/cQcaKTsazBFTFSYEVBhcjRCGSRXZsfLHsssIjEgBLwOr2h41Cvv9FRk
         VpHw==
X-Forwarded-Encrypted: i=1; AKwUvBy8otWpqZsWMsw1Weo7Y3SvyeeW5KDJ4i/a12EJ4dS5QqDmtmU3/cLpjL+VTzm/mVq5nDUj5XcM1+g/lp0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xO8HRu3P+yT+7edrsxL9W6xu63/FU08wCK+BTDurnFJRMtzSK
	DHzaZIP21Koz6o7pnjqyBahJEPKqUEaQhZEB8zI0zGFLhu3hkAeGH1y8fKFwbOZAlU0bW1QoSTn
	1oTiE4kbDU97JiOp0gWyAUBvwNryBJZ9CAF7DP3rMGUD3wcKzo9s8palSftMVeOhGnmM=
X-Gm-Gg: AYBFou1YhZgm7CC6lAMPUu0z6KXsJy4bQFvhDkgXizRB2+IzFpWDzRfSQGoNrIJmq7l
	R9UFTmgqvR3D63SabZBJNWCEH1v6yRA2WFYRwKCdRc7TtdubHKTI90I0JrG2rTJZC0lM3whr9wL
	FVzCItS7xmt13m5BfoxPyNqKWqKKPEAYaPOlZ+fgeLECnkt/htvpUL++g9Jg9MWFg1y6OXkPCVr
	ZnWHkFjuaTe98HJurmrhabOJOgPpWH601d/j4kFzQ4WrTFEVK/itlnCcbqOo6Vm0cfr4wRq/5ya
	djLrum1bWg4lD+lseXw2Dj4h8g1crvdt77+tG4KE40fZASlw7P+cpJqQArS8UoUIKIW5XK0hfK+
	6lVg5aFWYxWPSz2i8AztcR4qoRCT86PTdVPmG7IEsMC4Q7a9JCjjMbS5svBjZRTvaX/g5RcZ5Fd
	dCK/RswFbVqSS/U7At27vuAKgXFFCVWNS81vOnsjv+edsPoPtjq3DxkmAkQIUw
X-Received: by 2002:a17:90a:e7d1:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3b0db705990mr179864a91.60.1793911236082;
        Thu, 05 Nov 2026 12:40:36 -0800 (PST)
X-Received: by 2002:a17:90a:e7d1:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3b0db705990mr179842a91.60.1793911235583;
        Thu, 05 Nov 2026 12:40:35 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d78b0a8bsm656840a91.2.2026.11.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:33 -0800 (PST)
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
Subject: [PATCH v6 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Thu,  5 Nov 2026 12:29:33 -0800
Message-ID: <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX4CKKWlc6sdTi
 OOt67+HVIzMRxzWlsdGUXd1/aG8G4CjOzM+SNQiY07MREU0ja/3SDmyLpb/+rKfJ87yHsEO+CsW
 lsZDb7HRUgr2YjbIfGbI7canyK/vRvfE/Dio1EoqsARlSJT/2uAUeNjK9DvF/ytaBWO5E+7xZ2t
 jwzxBl+075d4xwshJjG6lgcs1pUohTZqKt4UvX0fAugmIaJaxdswNs+3b6pRu7MUbQA5U/Gxd/7
 UhV9g1m7/xkvwvYQEumdRnA1tZlL3JRsrvee1mnZ4L9NXUEvpwHYGLG/UoIwUlMigCpDIwVZxXy
 6k/L6j3yuG83dmQhibePs5Km9mU396W44YmIVGYqsoEBjThPSRkUC8ihMX1NJR4GueJh+JQCFcz
 B6sXAlD5nR6xYCP3jmzsHHcXYHNOuI3OKvng3DBuXb2ohYnwua3X51JMMAJmEs9whjaOTTinDnt
 w2abA/NCLkGo5woHR+Q==
X-Proofpoint-GUID: bBFrdDFtUuM_ojDrzf-Bbo-xYIkDrNpo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX3NOeqBN89sLG
 0OZA6D0KJam7s8R0QZ65xu4qvbxBEuy6e6CsFsBP7DYFqC+3fmYgE3/aOUqAMjaYEADjrJ5ZOqZ
 fDZH5SwhvYLjWzxB7kFlRbNpbXHYWNU=
X-Proofpoint-ORIG-GUID: bBFrdDFtUuM_ojDrzf-Bbo-xYIkDrNpo
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aece9c5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QhgCzLM3CkghMFFZ4C8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c |  6 ------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++++--------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index dd1a5ca91812..6c5ee227243a 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -27,7 +27,6 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
 	/* Configure number of outstanding transactions to 32 */
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	/* Configure UCHE request time out to 16 cycles for CCU/UCHE arbitration */
@@ -309,7 +308,6 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -483,7 +481,6 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
 	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
 	{ },
 };
 
@@ -709,7 +706,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -1102,7 +1098,6 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
@@ -1161,7 +1156,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 59898b49a201..f65bf82e5c21 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,7 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -390,9 +390,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -638,7 +635,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -719,7 +715,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -838,8 +834,8 @@ static int hw_init(struct msm_gpu *gpu)
 	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
 	 * non-secure mode
 	 */
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
-	WARN_ON(!gmem_protect);
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT,
+		        (adreno_gpu->info->gmem / SZ_4K) << 16);
 	a8xx_aperture_clear(gpu);
 
 	if (!a6xx_gpu->pwrup_reglist_emitted) {
-- 
2.56.0

