Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529275;
	b=pEM8nbQUrETaG6wEvWPCUXFjDeYZbJO03zqDlKCXSAuSJjqHgUvLjVHcT+NklC+UHtCa
	 aJmLYcSuLO15rzeIVydHVOIEQo879H6MwPfviUewkIXlrTznwbctixrarkEPDNXTtx+tH
	 4Ea9a0wk6nPg755yltEuSm0UGkcdeM44mUVP3DbqkPujyDekq/w0EvpHV5MNdh/yZg/5t
	 YsG0snNcU29w1VyBQYmDVTAiuX6iUp4KxHIvDm3QdPiGXpLeeIEiaAgc3qVOD4gk+6cC7
	 19LkOZI7jRGywE5nWd9kdr5lPiBDWGJizPaoK7eTMT7nYwhNvxTWQO7DczbjJ4BgS3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EkKOk7oGiQqyMwGz5IkcO9uuHyQkVlpszxGw/CqPXwg=;
	b=gXdLgTkytA2wugX2CaTjOlu7yLcw4sbKDreg3UsnyBhWgR4IiYIquJJoP+rgalxKnMQG
	 Ne9Fsyuooqy9FF5o+fp3wGrsBACvatwzlLVdgJvhFr85yuRwrbPAJQX4S4TJJYjrcOyFm
	 xmpaLQ26jKN5gL45qyrzcPympl7PHhRm8aye6WhJPosvJ0TWXDn49w4Oogj54ywCYZREE
	 wk9sSViX/MdedQcftmp+rj009sv+ckg6Q65x/PpsvBKWpeTfgPX43ThI0fzkPr1yP8eYg
	 KRJc6uSvF1dcQzgyT+4hwEVvNBioWrI7DdpaaGpIdkIzXnwSMmDCGTHmqXPpE5Y0ocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GQTy9lFX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKDFsICd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB960A2613
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BB960A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GQTy9lFX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKDFsICd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtknO764285
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EkKOk7oGiQq
	yMwGz5IkcO9uuHyQkVlpszxGw/CqPXwg=; b=GQTy9lFX6oVhwkkX1aWGq+wyn63
	5myIWkcOcHwY0H9q9NizzdNMzmHXTQWNF6Q5DBCAmkTGsdjo5+YPF0HAzQJw9CVT
	QlqisxZE1x7nIjJ3OZ/9U6OVZZ0+UrEOYRUC7j56lYg+6xx0y6hkNauQOXkdiSvA
	Jn97NeYceq3HBo6Q6b3sH+xRuKaXTvJ9MMXelX+8HF871dZm2+ptCPefG5Tu4k1m
	nQav7qLnOVA/eZGz1OG+M1BkZ3cGVvoCamtw3Exw9XBGKIr8upgZdgvRCZJXQpLs
	/n+F5eU6wR3s2NAOfuuwAlFlo5nfAef5WSFndyQl+nGCwnVcRvEWBniI1eg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hva1ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so112720a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529274; x=1793134074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkKOk7oGiQqyMwGz5IkcO9uuHyQkVlpszxGw/CqPXwg=;
        b=IKDFsICds/Nvg9cMgzLQJ05Nv+7YA95Fxaq6MPfX3/fT/FL60LZjsaHrBY05JFZ5Wb
         qKrMD7k1fdxGPTvcYRA7xt5P7hzWbZUS7en8vpaCmRYbRojgXQpUdSLcrqZfEYxPQZkq
         E4wnQPNtZmIwAzmL6PIVzD12NhYBBhL528GXp99xgAYLMy1zN3z+pK3io0Mknb3LHml4
         A5EZL3fXy2e7BndAv6Y6OecVGrxB5J3DSd+ghXzw852AoMpv6rJEUcfNpmrOaXa8RyXk
         etvOtEt2wDF7IoZwGQVor8FWAza/VR3wabv6+sEShHwmtG4Yh6z18/H78hV9sREKiLOw
         ww+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529274; x=1793134074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EkKOk7oGiQqyMwGz5IkcO9uuHyQkVlpszxGw/CqPXwg=;
        b=EFxiYw+9jV4flgU79JWmBW1bu1efTnL2r4c9OXp8o88twHsflxHO9fNIXnarbk+PzH
         7L1nOTc72QtJr8wHiwuNPt09uqrb9EXv7Mh50PKg+AxQZmorWiHLMRHlauoDPoc2DyC+
         kOb7NTRJHmSs3znB4FBZGI0HR4MkWYaWED/vWByCt77fgk+wxKsvQCIaFSEdjLXGqN+7
         v4tzk5iP9gfYMu1t6/Bvy4Y6JF9zAerLq5DgVGxNz55XGWdb2mt62Vxy5pP+6BMl/Cjv
         jXzw0XBBaONN62vNmB8ivlHFhJoA2QM6K/9yO/BdHMYUA+aWHH5qW6CmetZAmx5Sp7xq
         /b3Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0enIliO+u4HQ8WzXvtePAvyKAoVdw5gr2BfJoulo2vpvyM3nxZauTrQItjWpiLiO/6/cLCEQwudmaz6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyGPugC8W5RGXO+GHgOM5tDi/meSOUe6L8hHDDpwHCEx2I2uFw
	QaxiriATH/DA1OC/dC0NWg9Bar0GQg6SWyK3D2/lwPDNfR5uvuFAD0LBWGnQG6X68eQKGFsIirZ
	dsTXGS4ePycb6HaeOJzwvi+/ua96IC7xh9sYwLB5DwMljCUKTjfyv/qTXsps5Q0sCZBk=
X-Gm-Gg: AYBFou1dqdeNHIEhjNh80+SWFrDIBH9Rkg5TuCotANU5aa1ea89x5KdAW+2N3OSUOB+
	fwZNfliG8cY6jzWQD5R/IgMJuBeFWhM6y+nmL1xcAC4uv0qPJnikOGJflUGVbGcxf8KEeSMaqsX
	jNdXWRiTvk2EfuFrFzCVBre84rtsturfheIPvoD2ywiChjlEyZ3OMpNXKrB/O/ikd9Snf4T0PV3
	yAX5ownI5fRHVc+aJKUOFncldW2qP/jQwnoacjrfWFcPje2tix8XIL7vK/S7YuBJ21aYsYOASPM
	y89PsMTXzA9HJDj7fV80y4f+TCz8zovnddYAH4UEIEzpXX/wWox2BDjK265yyqkLk8KS60rjGmf
	qHA+cbNuv8lhrTSk5A7A6hEoqWLqhJ06wQ+U6++jxOT7R/WsTmw==
X-Received: by 2002:a17:90b:4fc2:b0:3ad:183f:5e3a with SMTP id 98e67ed59e1d1-3ad86e5b150mr93719a91.4.1792529274029;
        Tue, 20 Oct 2026 13:47:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc2:b0:3ad:183f:5e3a with SMTP id 98e67ed59e1d1-3ad86e5b150mr93710a91.4.1792529273640;
        Tue, 20 Oct 2026 13:47:53 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8030226csm1079181a91.12.2026.10.20.13.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/12] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Tue, 20 Oct 2026 13:46:19 -0700
Message-ID: <20261020204728.28844-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX2Y211m6dKyiw
 RdgU7PMv7ah3YjSa7vZG72ehdUX5WANM5Fn+6U1ATx7Xhs0FejOsVy/WyfNuNOPPHpvHywcn9tG
 mLUnneAy6Jpb/J0whRnJsFWJjwaZmMV9zOzyLn3hTgoaQ/3OFf2wzWMmUTFPw+6AriAAEag0Dg/
 AdQgzwYXM7g1PjJQc6E2a9C3ZNHhxXXJZ0CrJ3i58BNPDh06z/nMEKKiogIuxwLpYyS7oANsoZP
 4o0ySFdO5V1kAHr4FbjLOw+3KaEGW5ww1L0x+bSxPXNTBsPu64pQJvB9Kh3ABzI6VxiZDgXmSfO
 yS0yjHNMB7a/BIb4a2Yq6tQ4JKi2QlVjuiBp/FleJDfKeSDLKqq/WFC4VdxYcc2xKXkCrnyCx0N
 +ui0ocWvWjerQaTzAipGeIfWE5xKgjWZvP180XGve6tEw7XjHuz1ogHZMqUaFJF3zbJxBmf68+F
 iBO4ZHkMGbBncssXlzw==
X-Proofpoint-ORIG-GUID: zG3irG0ud5KO0YbPcI5mLYdeZHUXYVlu
X-Proofpoint-GUID: zG3irG0ud5KO0YbPcI5mLYdeZHUXYVlu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX9gZ1I3lRTcEW
 ccH4aqbRZACPUqCP/X4clvAbuJb9n4naD6B+kQk99Z/4QDdgtpNO06PSsf4vo8S7XKvSZxgANr3
 6dg/Fs6P6NQGtY42Ur12LrmbEL5WSwo=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad7d37a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=b4MSL0WmfgirtTH71F4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 3e22ef788f2d..6d7982a117f7 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -373,7 +373,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -393,9 +393,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -641,7 +638,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -722,7 +718,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -841,8 +837,8 @@ static int hw_init(struct msm_gpu *gpu)
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

