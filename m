Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911284;
	b=K0UOtbQLVawlqHEkkvxk0q0eYqSYDmmnYMsmUWKHpOHEFGLf7dUdpNu2v4z31kTd8kjP
	 i3GZm/ctE3A40fYR4iKZu23XPAPHegZPH+OpQsyHPOnXz0Hj7mV2Q1MA6JFzsGXLiTz6l
	 dKeDmG7T2tbXRTYMnqz9VELJki2/hAtX/uGAEWsptKg23EYP0nXeK9TTPzncoS3TFsCxz
	 nPsnowjui7PU5Qazf3Cx2FGo2XgT0cpjKJDpi1bH42phpkfGa5H69Wnz9F6a8/5MjrJNZ
	 FPtYrEAC2jcllWvRaoMdvXEAN8ECBHYlZBJF1RUvpx0oROoI3HPJo92q9K+VEknnO4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
	b=02JC31wMqiVUy8c63rhVWH55+AR0CmA/qEcW/gXyRfbEQFRVHc0keb185pRukwMn9l4L
	 XvXglor8hriC4Yj/BZyXP5s3L1orCEC7644PL4pnG6dC5M5I3kclw1SJHUoViZ2lwEBBW
	 Af6uZnExMdn56802E9YSDjeBOi2ZA+IY/TQtH70UJo3Ily5ViOUMgNAE13KM/HHMriIr9
	 3YdMVIgczRJHtpar90KLK9Qv0wu92jyUmrWZwZ2sdINCbmickMfc+2Ek1T5v5LjjLJgjr
	 rCT5MLcw4E0UZEYgSTqhA3G+ANTr9oJs6VlvuDA01Qjcyuk32MYE6YSOCJJ/X4euJIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeQAmDzh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HF3tFdSu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEBF606EE89
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEBF606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeQAmDzh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HF3tFdSu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeOfF924189
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mVy1ahp/P6z
	Kdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=; b=MeQAmDzhhiBpFrF1d3IIivIjGWM
	cbCswf0+ZEI/c5HNtNi4WfHcnzwLM0jTEF6sVs/qHsN1vaiFxlyh8w3YAfJurhnP
	eTGHvAkq4YmXS5xss+cik/MgjV6xYsLT7Sy6v+peEylSpc+FLkwVq8tWk2wl+FYx
	4PWJuUMVpxLaTAiRVx/tD60MopK+tQCzn540UvylY4GKN/SjFNoKYupZX6NwtFX7
	HBFkrAHn5Eo4pu4vcerP+Cn3asS7qUIFXIByHOfFhnDVhyzJnj4rpQPFgSKrSzVK
	SeBw4rmG0O0dCEbU1QkVTu2a0FqNR+iK1mbacsJTqbVt0Di85I/eqlxxOXA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhktsh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:41:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so2584086a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911282; x=1794516082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=HF3tFdSu1sFo3OmMzaEYdKV+BaRcmPe8/6tfKrgYIqYEcGsyjktWYJtZlO0gY/TUAb
         UZOvm0XBLWSzXzs4y/A7tfCQO1BAd4bMVA9RFrpcmqFwcpI6YDPJNNc1GoUW1uFgDm4b
         CfRgMDTgjlZNMCNDdgBjr3p4zjhoFJjcxRVUOadFTd3LJC3Af1No5ldDSEAyoQZFZi99
         K8aRtFRFqeMM7UbWnZzOK1V2kBrdtmwJLcwc2NJcLb5b+LNcYHMhNIKzRRtvU7BlpOmk
         1zwoSuGhkqETdeg9jomq7zP6YkAaqNUWmmftzCZ97lLJj7gCkzroO3qOkVgWHMjKAHLc
         dDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911282; x=1794516082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=PR4THK5Zj/juB2ZrVs4cZEx+LBK/dmODWBZi4qAe6sP4xbEMm2QogZBcCaeIzfspv4
         LQ8ZdTabe/9/LZAtAHMLrx1mqBT7XdFtN4rMyDvXh6tupVFK4YMDCWSAfDFZaHMuCqav
         BL5wQ1y4WQ7STr9ZHCxU34UM+5Ph8trQ4W5K8qGSdPxzxE+AcRtlFjRNigVhyn/SJf12
         MJ+x7wJwaJiNfHbmaNZU+AnHPK+GLNqxmZR7FTzO/gUowv0BOi/AmVe3I97NB3eFLM3I
         c0KSPmjR8FlkpKV1xDLrh9/+LgnnkYHCxrcTA9mbGNd01I3R/PfwQIEjDIn9ybzn48Bz
         joXA==
X-Forwarded-Encrypted: i=1; AKwUvBybDZUitzMDqq1BECahFWfvicEzXtGLzbPWvzzAlfrxxQeETdHm9AxOdLMkN9m+4yQScKnhVyRtZsxFvuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZnatqvTpjDQEy9t8qjxYufKbbGZs7gkspiI4pm+vTcrpCkYx7
	El/099rOfciZJcOeg9ZFOuktq9Lb0Dm7YW32U4h29lvkuysWN0SlvHOOelR+Wze0ssVCO+TdkM+
	myJGRIUHIG2S541e/OGi3ElJ9xBmHBwjJiM5QHAwcM1+dhf+O7pmhg/FJrfDEjOXuN+Y=
X-Gm-Gg: AYBFou09eJUg4oHp8QHiLD/jgLdoF8wtFCLpuaaY5i9Us+j6D/CLnjiMQhanw3Vs83U
	N8csEmuXXOPBnvn8NjM6QeIIuwLRN78bpD+4htXPXo6YtwenUQ+wJGlkHn/Bp9+oE9Aq+sr9By/
	6rQooso4ZEdt9SE8sy+aobXYOwogYAH3n4qgsr5CsEWyq7Pq0pMh0wMe2qil6WoCNCspCoNuaXV
	uXWtmQ35i1RrowZDhJF29DbrHGMn77v4RvxS0hUaSyWnsNUg84pdhqLnkqorfODQkH2Kqf9Ib8G
	gAaFF2QXKELCJocQbg0HMgFFtEr7xYXb6j3rXZmRaoco1E/QHbLEaeeMX4GAIqgBsxFKdqoBUrX
	fzIVVyElhQN7M0e3fxM55Lweu1iMqCsqBHy42hSXGBdfiJzdpL8cDOpujGKX2pwHNflVeY2+mwv
	YLQmQQ0nOy7uGIw8cZIF0vRuDuZLuryjo/A0VgQ/iJiTk3mGBFUWmCDjicqJK68A==
X-Received: by 2002:a17:90b:4b0b:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b0db6d7710mr164846a91.16.1793911282473;
        Thu, 05 Nov 2026 12:41:22 -0800 (PST)
X-Received: by 2002:a17:90b:4b0b:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3b0db6d7710mr164816a91.16.1793911281992;
        Thu, 05 Nov 2026 12:41:21 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944eb1d1sm5492749a91.0.2026.11.05.12.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:41:19 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 13/15] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Thu,  5 Nov 2026 12:29:39 -0800
Message-ID: <20261105203057.66520-14-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXwa9IBiIiU/Jk
 KeGUvYu04DUfm2p2G6fz6wn23WJNhINyUzsafsB8aou/J35i66ixuACQKbQne8a0oe9IqVJJUCV
 oL/Pc3/GKNMvfd9qbvD974OW8RDRZi7LwJIjc57gCLSk/vYdgOpm8jc1xdH/sj2v+rEeuVa+N5Z
 k2aD9lnFCffGmEndHDhQ2csZalpVNRg0McrwXjJ+yIk5emWI3FLA0Lh3yQGpDizw7Q1Yv6AqBLZ
 cN9fFe+R7WbpUHLgkuLiO0gi3pTO9zfZ9q5LYGqG9wd6emtIFX8qLQKzAevomC/ymYrpPQP0X3J
 +wPibK+OIu2q4Zs07nhMLLXa7bQcZzRkv+96Kzs79O5rpA4To2hFIbgMZCGxky7RakUjV+aO184
 ww9sKqkYJj6aW1uu7+sfd+Z/iyxfF7bJT4N9Ob5iEakL28VtEQLATqzh3B3hJ0yK6z4dcUlbUMp
 Y0rECjSyo2OZYS9PumA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX6oycFYBRhewx
 JgT1TANqURedcbDYmAoa73VoCZLtc/HzwH2PT67AC/MTK35ks6wB5jlOCiaj5u94AawLLfzPiTM
 /+FhDaR0VmkDgEATYJCPBbcfZKysyVI=
X-Proofpoint-ORIG-GUID: bxNEYoA78WDdfwX5HR0qW5JTfkdo2XXY
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aece9f3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UnxhJFuZtzOLgjs1IeAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bxNEYoA78WDdfwX5HR0qW5JTfkdo2XXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f65bf82e5c21..f6afa5b3b0bb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -261,12 +261,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
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

