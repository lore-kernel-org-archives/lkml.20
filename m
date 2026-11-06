Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007361;
	b=ejMez3poc9NkUflbM78Fh4xNqIePn603rcsntDSQlwifduiSCgjnEMQkFU53mLn35NQu
	 Rs9JDtAH8iWtgA+0qgLnRuK1HlwjzSWKFyCntgZYlcrHQ8+BgwN6UP1MdslxrasWOyoK+
	 euD4LRPHGfXlnzWBmxKVlCl4tEDk6vak+eknpvCcUx3jOkwl091ul7Cb0MvUQvkwRhzB2
	 6jOOKUnJiLHga6UtlElP2NSAurk1fZrQLg54cjqUNRRyOriRKUnbZnNLaTWwLXC6tqhfM
	 GKBnDAZ37T07kQpESYQuZyxKrtFZMi6uKXkIG5hi+9WrsvhQvqUJzUsGMAfvA1hJ4xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
	b=OyDlDrhXUVujnWVYQ4eJsIUpbc9Qf0tOTrCbyJ4IcoGc70fPGRRUa1Odo9YxWvGxlmI1
	 +Tby0+gKEk/8/Eo9Z8qrK51t4+lGNk0+adwdvuE6tkyn6MkZKlD9L+LYJ55Z5PNjlGR54
	 MDNuGJmQRCDjRlYGcqddHunPkgY6w50fEL5MVxkfUk67vUeizYB2zQmkWvuo91XoSSWJa
	 SvSmMhU1b00KCjXFs40mI/ElubnEKA95v8g0CdDWQfSezfkk40331ltwnSZwq6h6RSyOE
	 DU4B4Hm1vyaFp2FA3+CEDIPJbM8VDwW8I/DmGbOqW+Wd3wyeLT7okRN/jH77PMp3Mfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kn/P3fSp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSiDHMs4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF18F606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF18F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kn/P3fSp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XSiDHMs4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo1ne015676
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UkojfpaA9Zy
	AFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=; b=kn/P3fSp3Iamg4K3HyuXzextN8o
	/dJGS5T8/tpgcme6ips0zNLLqDVK7dj2f0CE7r3FFN2o3yHgbGjpfFp+k8fcpQe+
	Idj+xlUbxpHKN+EqZk29eu9ApHbhYU/K4pNGiIG6mdGLG0AJ3TKLlpxeVeC6Li/s
	f30iap4dZ1VkccIGL/jX8tl3r2OfkDyklBZym1qLS89m0iCMczJMxLFKqqaDVTYe
	n4dJ++NLX0kotFiDonZYv87EdGTXcfROdya8wmzrctW9lRb8dBpudG88Dgu+JNyj
	BNp/7GiiHvZwGEBmlh02Nr9JSGM60NnNWCCdzAy34xI6+5VBnUGGs2zZ4Mg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmeb0vhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso2161084a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007359; x=1794612159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
        b=XSiDHMs48d7KsMZ4g+gxX/Lzf/EZEoVzR+DRSEi1O6t6lJ9irl74jzICFbWru5isrt
         UnG+nAWmf1+YOBqM4lFCkZlZxn9eyjmdhI9f/Ai8i2ywhGDmAfuQ8rKKGYuHBf1O3zEw
         ezFwI4AQubWa8U2yyIamhJvGH7e44U8uF+DTMHL1bDn/+Utru6xXwz2W8jS1EhhiTqYv
         xB+1Mvb0f/f0rM6Kxx1ALSNfXOnR5KX0RR9d4UojCXb582uKCpYcOTRfOGLNBBta9g6n
         ozPMsJ9RToCa2neYvnhY3ocooVEpdXzABfO6b0wU0K9MFRs0TrlS4W7poPViyK/zdpT7
         VeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007359; x=1794612159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
        b=0v7OKZ9eL7P0ykZcqHBn09fJibAPrrRDFxZx0quxnpXpoqtDKE7sdKHpbymKGvBvBb
         8pYE4jaZlDozcYvKUu47S+EZJPJlceXJ2dKDC0iGtkzim09/x201y11HOmRIE0UjAjno
         2vxTYpwafpa0tnf77kUFExhoF2WKD24OJzgSDdnLI5bEsuAx702FFXwvplv8nPwytywT
         u7X09+V60lAl59j/WXa2Tgw3q0aEDvJ8v5rAztiIXTpmAjORDxrHNSj0gYJzdhA6LR9P
         +w8ioCSRVmZzwz4fG5xd4WmvMxEK91kr2w2l/thuNSvy2X1VEIE4sAeULQN+UFSZNm+B
         aDDg==
X-Forwarded-Encrypted: i=1; AL+hErEdQv6KRkm0i9V4YSdY13g8cIGT9LYFHavYmznmTjDV0KDCSLJPT0mj/dYTmBYRtUngRxYa4ZzmTYZgATQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vPHwePqIjGB9BCQCenS+RyeLqTE85U7JsbsXGrt32pFinjSDl
	A5VHZNRfuPahimL8Z+2Usu7ddZQbaYMfokM4SL/T7g/wVRUOYPyxQNLn5ZgoIAN1WNrXfxS0TZE
	3iOMibqTLDKxrZJMxj6cncogWhZM4KxqQdapmW9JaoJehrmg6va+QGtptPAGn/UCpSwE=
X-Gm-Gg: AYBFou2gu8xV3SV3/97SjTHT5iZuAJuvN5zwtLybTRlt0qfln3egpO0uETqBplO3P8S
	60CC6mhANHOIqA/KfTZtZeM9L87jXuewCkofuQhd2TSvv4qN/N0PISqP3r3WMju7JFrrLA8/LCg
	rdX5vg5xZpiPQerHVA4wSqcbQvT06pW5g+gGrO7NX7yjOquf/rfJ0WLGBn3Hd3gZsWBkK+RWZZk
	H4uF6d8P4aqUKLrqOHG18winbrZbGaBrWUweUjjC71NRHVNhs/zYntHoamcYDujQRUwloSX2Qiw
	XAsiNLu/FMvHs1REVpZmRONNtpEpSE593nXyWe9K8Oq6gX8uOkO6QnPTM9Q2S8qe9hLnRJIlKXb
	uZzJsks6hhnmMHoaHrpOreHkFSUEsMFfq+8K/cklSCZ9apbAKJcaQ/tla30iIfWbgE8gTEHFMqu
	JQgbwAmuVkwHuekPL3vdQJ0QHQp4bd18FvNba49nTChNsJYM+zsrNOZv2vi38Shg==
X-Received: by 2002:a17:90b:33d2:b0:3ab:884b:65a9 with SMTP id 98e67ed59e1d1-3b0db6c0f4bmr4053117a91.25.1794007358808;
        Fri, 06 Nov 2026 15:22:38 -0800 (PST)
X-Received: by 2002:a17:90b:33d2:b0:3ab:884b:65a9 with SMTP id 98e67ed59e1d1-3b0db6c0f4bmr4053083a91.25.1794007358330;
        Fri, 06 Nov 2026 15:22:38 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a7e3dsm715121a91.11.2026.11.06.15.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:37 -0800 (PST)
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
Subject: [PATCH v7 02/15] drm/msm/a8xx: Export aperture helpers
Date: Fri,  6 Nov 2026 15:20:54 -0800
Message-ID: <20261106232220.47602-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: wzV53xmhxUwniYxct__IvHqAP9xDA89c
X-Authority-Analysis: v=2.4 cv=DOAacCNb c=1 sm=1 tr=0 ts=6aee613f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX160yMZG6760T
 f/8lh8oWnk3Zw84RmE6q/wYbG7BtiQxHAiD0ycAofA3EO440UHOWdLEdRHICWJebeKnJVWIASSV
 1M2EFcplCMoJ+SyQlLLBr5Qg609Tkcw=
X-Proofpoint-ORIG-GUID: wzV53xmhxUwniYxct__IvHqAP9xDA89c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX0HSHk86200qy
 Ctmlv1F3d+CdKuIdA9QKBKIiqvrDKbivCe5I933ZeaxnI2C2WeXjIAGzZ0CV4VTCZiD65T0OzsE
 09fFuOf7zNodcU1CLMs9Kg5sp4vv6L+lLx8lv1BmVMIX/3M+YQXPfZ1rg3i2CDXEI3G28z8V5lh
 +Lokc0GBR7/44hm+QR86gGW28NL8sYXwqFOwh/b/w1ryPszI3lXI65C9pKaJ+wz0m/jo/O7tExc
 mExwLSMFfiQmDgBf1abmEvfcpn0g41svckKPsLUuTKCYIxhG9HSrRuwzLYfqo2jCr27DWL7KXfa
 gqVz0qYYKb9SwNYg7NKcB7y2nDOQxrx+d0DVpKCwI5514nzXUCcBfThbzkwF6FFoljwCifEhAwi
 YZB9Yd76+lh79+wNmQ5K8Gg01D5HDrvvP+vvTEfMGQoSMvaCodgrsQi+fgusLLJ2UXa1eeaQ41N
 yt3wM85mtWJbVIecQHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ab4cb43e4a54..c58a2665e9ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -346,6 +346,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 25ee3ac16ed6..82cddaa7278f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -32,7 +32,7 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -42,7 +42,7 @@ static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, un
 	a8xx_aperture_slice_set(gpu, pipe, 0);
 }
 
-static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -50,7 +50,7 @@ static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 }
 
-static void a8xx_aperture_clear(struct msm_gpu *gpu)
+void a8xx_aperture_clear(struct msm_gpu *gpu)
 {
 	unsigned long flags;
 
-- 
2.56.0

