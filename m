Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305112;
	b=ES6IQWGZchHXqmVXWkR4OKoIzRdPG6uhZjFjWHp7WAxmvQ910vxSE3Yo95oO64H6sff5
	 C6fv7JDNNkSgMDqijrDxFB6ND3lWWHUninFJFqrI3obmTmfNbZ0CHFqp+/UYCK0ffmaRy
	 ZgZ8r+QOCMSET61vn5ZQmOOXJDl5V1hbsUijzosNC7thZVIPigur0EJH5lHoafApHruzX
	 kSSDuDRyfIrV4H4fTjeWonO+SW448rqa31kskJuuaz3w7Y/DBqqfYj/7RKFyQDaalHOGG
	 LsnJz02V/U0nOmr/2WHAiCFdqgUiV4e63pkmYyGvrN/e/9lWJtfFGvZq1Ih7nAOI36A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305112;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8ezEVu/wf9LIg8Dnb2467LtGKEBxep11x0ghaaw5IxI=;
	b=Ly+UhjzyORd+I/OMmoKax2+iiE4bOWeyFrdCpANoEjrweXde45FFo07QKTwwfFcxgnW6
	 amgRQakZto6uXDFqO+dXC/+KUtfjSqX8IFwfZhpRpAzdxq14N6reYs7Rc0v7d2ah893RZ
	 8IK/rciR65KBVjZfSDQD1RZd+jISdpfvPyT07L/4dP35w8mKXMssyWxpnkxaTmSVcFpR7
	 gHvsFtXkKqByrIxF83NSbxIHFMiUnrdtyujvE3wU8MVJk15WgjFWXkPryKLG65U2EdBT5
	 homEREkNFygcNRwMJwdeHAnZh/ZW8UIBYQ8QByViWZKvl6cV6LEji5nbRtz1SBL5P5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EC7ofjzx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INAS2edq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BF9606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BF9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EC7ofjzx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INAS2edq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjj041122778
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8ezEVu/wf9L
	Ig8Dnb2467LtGKEBxep11x0ghaaw5IxI=; b=EC7ofjzxolr8nIxz3oLc7q8L5Hu
	FeKJc01cKQpzdfxSgPkfzno5pNxha/enC7hkjkhVqOghsoYPINxQwF7EZ61tZcJJ
	grUlU1LqLAaRI3XtdvqXqrXEyot69XH0zsdhijexNbss0imw2yov60NbGXGZiTvq
	5IMKqVJdWIxckG+7+sQ6hk4AVHLAgT64L1LSYB1QJH30IXNnJuanpebQpokiHtz3
	AWUAiEnqgJNz23l8iC7eVLl/CmfpNt6L4HldY7RoURnvnqWQynHAvcu6zFtjYvt3
	qsbw5Zv5ngO81pVdwO3vLukuuzTV/YI+/P03WTfR4oo12rMtNu9Dc7A1QJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm8k4k0rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e05d31e54so2039239b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305110; x=1793909910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ezEVu/wf9LIg8Dnb2467LtGKEBxep11x0ghaaw5IxI=;
        b=INAS2edqqGmxvCpEo5pRz6B7cJ8iG7XJygnl8XAFvQ1nnFVy/Sx2if/RP5rJ8FtS/C
         kB6RryV8N1gzLV6jZ5dRcC5CP55XapItr7q7Y5FveqnIHEyCqg1h5hBtTJ8EXSBJlfAI
         8e7CKKHXvPOpJIxVGcDLMosy8hbFvGdvoMRbWbtSAfTxTawPjbkiZZS6cnNcqvfqJlcR
         8tI/yz/odw+Jf79zjutufZB6qhm1uJfp0TrQrYoyf2PiRy5+Fx3otHlrrqdvWazabowy
         u+RcV1VOtdiOHJWTS2T7UTLMRrZtknLCHvHh8EihgF5NHRk0dt3I6XeiUmwqJqtNHp84
         HVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305110; x=1793909910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ezEVu/wf9LIg8Dnb2467LtGKEBxep11x0ghaaw5IxI=;
        b=SPLuvVRLzs7d2r01tmmn4aU/F6JBUHPYAmEjRiLkTkfqgUCQBzZY369UC8YWUQ0QDt
         suCXexs9dnaPFZxq/+i1FHtmhe1MVmlmkQfczWPpGO27NYWa8kE1pl2Ua8L29VI479YC
         6cRDDmfWcnsENDOjPA84/d51mD9LpQ1D4Fx47dgEHXo4pQoM7oW87AQUI6BBt3N54pyr
         VBDxiSEszoULHUA/03OKA0NZ1GDoKzTzR1jqE/E9gOVWOYc9Fd7DISLcOzHOyhOaWuam
         /Py+jD27xqG0AZO1m5SQUp2v+J8kNYORvlbkdwPV8RpWmNAj8aFroLxVeTZBnyyicu96
         svEw==
X-Forwarded-Encrypted: i=1; AKwUvBxfutsNgkCOfASSk9yR+kFCmiuHt6MUA0ueoVnGpjAPBBRxdZoS8fSrzJqflQ+hhEEyKpIg62gZtvtE/jM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1sh2A79/1mgl/wcy5rTvb1DjnhknwOsxI9YRQjDsdfIYexQK+
	2Fm35ZvA8bZQIidziO5GAp/d0UQdhrHe1oOMJvAjr3bzSv1mQpxnluz62nPYHDqJItYtSWoMiO6
	W6G/9BQDbcDgzY98jMrdlK0NlXumKSrYmuLel2MTzX72mKTZpOW8VCIufH5HrOOrXXls=
X-Gm-Gg: AYBFou3/OweRiK0s8apI36ygO8MNtP8S1m6to+XGlYrRxLMccRa/9X3Xr86oLneKTPW
	PganJCBZrLUrNAVXhiAmw0TzWLwmXTVsKQSIAX/hdmQ9EXcwU/sfhGkAxbnzxuJLtjGgMSJ12n2
	IeY/m4OZtyVPliAAe22PeVtnPIxGEPSnS21NB972OaizL0ge90PEuz/47E9pPWGAgE+XkL8zwgo
	/QBSLPHE/1XpBafXVMoJDajjLp0EGgcbBGNTY+uKI0ZNp5K3Vqz1wu3nf3gGrq+w5wpO/azDYQ9
	6WTRjfo9EAK7Un95IpFCVaR28BCG4QpFUgibk4xJLecT3qkNW7lKQRiKDzfTwCucRSCsX9UB2gJ
	X8OwBh9/zvcTI1pWWAPFlPkjGt6eb6HfewVYR1yuJtiJJQvlmqHiqG+l158XhJyEa0F/VDW61s8
	npHtMi86ve0iskk+ImJxl4Fg==
X-Received: by 2002:a05:6a00:1393:b0:899:27b5:214e with SMTP id d2e1a72fcca58-8a9bed5ba40mr156467b3a.30.1793305109785;
        Thu, 29 Oct 2026 13:18:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1393:b0:899:27b5:214e with SMTP id d2e1a72fcca58-8a9bed5ba40mr156437b3a.30.1793305109321;
        Thu, 29 Oct 2026 13:18:29 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98a2b049csm254918b3a.56.2026.10.29.13.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:28 -0700 (PDT)
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
Subject: [PATCH v3 14/16] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Thu, 29 Oct 2026 13:16:24 -0700
Message-ID: <20261029201730.151754-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX6jOBzs0NVRaR
 kbNBvAsxVqgWyyOPxJCbJ+ukHuBwJVge5LMkip0KFDAzwBA/cLXYKdf9f8V2OY8AMDbXXZUPF2h
 PQ/wfhf2et8SZgs4Yh/nKXBM8ErO1mV26s7pe0PmdFrBmZkhSZfHoJGbO00/Do2cIeZA6OqUuP1
 xuhMvaqDpvbk19tviGzVBgaCoZTTIDKqviSm9dWfmK6zgp9mVo+DiCB48h4xQSH3l+vejVzcXVb
 /1sSBmLpSMO1s9tItEFOGNQUFiGj8IRyywbRYYa51zryWX5dZjcPQJFZGAR2J78uU550Fa8Y5rC
 3wgNYwHKv1QAZi1osypDBrKA2xMMMCkDmIIAxbsQ0kgcFuH+mnRZWRKZrXBDapJ/Ir1wsDkGLcS
 hkzz0CI0jblXF1ktFW4i6TKKkuzDsMOfYEIH4sIZEYyMJG3vyafFVRePCRyOh5kvcw295BcnNs7
 xVYu2U8e516YENhx7Sg==
X-Authority-Analysis: v=2.4 cv=LuAHWXdc c=1 sm=1 tr=0 ts=6ae3aa16 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Dhg23qV5XRRJQlZlKu4A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 9KF_l6pDf9M77-89ZxP6ujjRLspLSdM6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfXwF+hFytMdqi9
 02MnmsZDyt7xybtoTe0svUza7tcRfMnRrm566zLteYgjUpNa8ELTfWO1nKnTd7MIHxSq3oLK64/
 Yrx6zuPo3siObAQ40l0X/s3uuXkdFFc=
X-Proofpoint-ORIG-GUID: 9KF_l6pDf9M77-89ZxP6ujjRLspLSdM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a6146372cf7e..1f8dd688b967 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -258,12 +258,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
 	a8xx_aperture_clear(gpu);
 
-	for (i = 0; i < protect->count; i++) {
+	for (i = 0; i < min(64, protect->count); i++) {
 		/* Intentionally skip writing to some registers */
-		if (protect->regs[i]) {
-			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
-			final_cfg = protect->regs[i];
-		}
+		if (!protect->regs[i])
+			continue;
+		gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+		final_cfg = protect->regs[i];
+	}
+
+	for (; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (!protect->regs[i])
+			continue;
+		a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		final_cfg = protect->regs[i];
 	}
 
 	/*
-- 
2.56.0

