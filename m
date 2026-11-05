Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911227;
	b=QhZDKpRnzIxbhiiJurogYApj3caayEKZX3f4hdlvmyltJcWzn1Offaxh4SaI6u11e3xW
	 LCi1mpDvGbvn2YTwuzjKi+QgqiqX8rlzZ4GShzoebepD7bhqP3l5z7fHs3ri9xkQPI18Y
	 Uc+yPNzGS0YCvtn/1o3/uo4XfXK2PRicwyK7MslA7DSRwxE47M3oNH3zSWbhXiWQxc4UA
	 pFrO59xl8TsK+n2ooOemKgrKNcaia2xi4OCjW0YWDZ0baPWnzcLuxrlm1MS78X6dfcJ05
	 4BkKDTbOHs9zr+k4g8UJm+Ivq9CIJTf3/ZIfjDgAK0m1OWa9l+HXTsYA4oLFtYw+yfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SInwIZPjnz2EQrGq1a3K4NBPEM71JGzMblrmJNAiG0w=;
	b=gPR+2Bp9FTUtP57n45aGS4oh1SR9QDCQKKUs0tsl2h5y9O+1iREDlL/t95nJlEYZD00y
	 PG+nvYzkUXApjQ6BsMySolYcNUyvNxZ+S6d/7Vq7xLc4u38ruIg1gtWeJAs+JWVidtlOi
	 3XTufzephw3Xda+vd9SivQqZJ49VjN4L/0QqydqaQ6ppMEaGM3LDuADhLyXUGAqC3ExoP
	 oXS3+/Vgnoz8yP27K1ElPHCIgjO2TID8snkbEoSyAnpWXDd6s05KfqNfRIfqCGqgkm4vM
	 e/SeOaA3QCpyt3SNOvh1doDn19SJjbbUidLhJOd3wq/kf5hULZ77fZB+KjJdf2YqcRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjKrIxMh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gg1PcH7a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D3606D826
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1D3606D826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjKrIxMh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gg1PcH7a
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeNaD1485140
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SInwIZPjnz2
	EQrGq1a3K4NBPEM71JGzMblrmJNAiG0w=; b=ZjKrIxMh8NmIgAVRrdPwBfpV7+T
	cljSi4TeukyrqlLkcN6TZM9fFizYIbBPvIiuezs9jIUNnsUksA3g4N9SD0KlGhAa
	xifIUscSFakMjlEPkFRBN9v+7x5FzQZ5lQaJkDxRQhgjNL8/BTsNmdsMXL2mPSgY
	ChWaJLSSNoErO+GuAuGjWsTP9MWYi2Ax+1iFgQpAAb7RRCWU1ZjJA1k547irPsPI
	Uk3wMcGlsHOJ7GDUUDsdT6qj51UKY6+/Wp/HoZSs+R4W4wn2zAu8ebMZ+rXM/RQK
	YRC7g0ShvdbHCkvkfp1ytmgr6NylrgQeKmZf6Z+VtTttOCvfTydpVd3CHdQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaak7a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a519048eso1813058a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911224; x=1794516024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SInwIZPjnz2EQrGq1a3K4NBPEM71JGzMblrmJNAiG0w=;
        b=Gg1PcH7aGxQBLHE5rDCihsyzpN8krkexi6MzkvrDuMf2R9hT9SHhHZh98Iu5W1Aahw
         thyHAOty4cViUcd0IBl621BRGVa0d7BNLbzA82fhzzmxQPIjN3ssXct3HIIDcCyxCOpC
         O1gIXBF+WP+wc5WS5YovdtyEyAMC4a5XKgBa2fia2Vh4WzgUAkkZxeqiD6FVbpVkyyT9
         WL/Yn2syuhWBhLR236gZqzospsnwNWrMSoZeDO13rnvlQKEskQlGwdz1pJG9pzIFUi3R
         HAVecSKpOgQbhomTfk+FxDbIS1v9iHe7KjLD8rPPLkTnvymclDawHWSfmhJj9CcyY7tB
         GbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911224; x=1794516024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SInwIZPjnz2EQrGq1a3K4NBPEM71JGzMblrmJNAiG0w=;
        b=JtrTFrqMLB2mDtFPvQpc+GNL80ZO202JeDOWlubi+ZEditr6xfCjOs1hmRu+deYz35
         sihbngMIgZHeYULznPIrqBJkJlhRmBXav8hJ95biY40M9eYiMLWRXOBt2rSZiRieZnCU
         x4a+nu9tm9G59vTOcEtE2SCcpopg7reEBVLTUNpkpirL1xC/EMIntkxTGjLlU0aUkYn2
         b5m620tntcep3c+gP8vWSB6xRUZK9ZjqOUhWOHBZ08cJap21GUpecp8lzy9zvPMG5Yul
         DZSFPE0eA5cBnmn8EehSRzO9Kt9vXHIH1yS718w5kucoNNVzomuwjlDbu2Q+3QyzXQll
         U7Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxSwtX0YdYfFrfzAKyPGZ+q3NZT5/QhFDeqw0WgePPuvd4C7YChjlyG+cOCoP0g1Pbl+tHZijrOPSk+ROo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mz1oR6vKeQoQZfkTjdp+FheKsnlaAHt2GKznNSwrTIoQHgt7b
	JT7CSn38PG1pLB1lgOrlRKI2LMoLo9mQ8xVUCyzECWVMH/HT7Pv0jZYStT0EEJ//ORlWCeQ1qXY
	58ZeV85IfRUE5oOlPNqpUdiNECqqSwPFR8SrfNzET9QChBIHwPWhzyiVAwX4QnyZD/KQ=
X-Gm-Gg: AYBFou3sjQfFR9ATkERBvuxUn5jGJML9XtHds3lRxbB6aBCXQD+zGzqdu6Ipc6W8g8n
	hoNRRUgJtzO56QZwTvxsabtSCKYSvzF5vLV074PTh63TRVAU1WUqiZDh0NTGrjUfSxOSFmSI42R
	m332A/geKWQzwMJHEV7mAw3yBhN9IwuQNB1sm1Xb8eiTfdBAuhLB1AfzDJzn/9Q/r6AwBxXtzu5
	Qed824hF4T5Joq/VD663+iH4DLhZdIEt4VUbz7k65g2gk1ZP3Rudcn4qMGf5uHip3i4VFEgQlFP
	atLcUyIFkSZ3hqXXuqwpKEjrON8bMpEz7sV4fMb7v7w8AqNNt0hyACWG1XNQauzl+5b5t9iwx3u
	BBIpd2hIcr87G3r5qS+eZFjck9we5XPyk+O48HD68vWPhrJiFV+vS45C5EbQhEjG67xyswaNJkg
	SvfPIrlCsqtL2pJ4R5qLlNWDbJgwY2+oHfrPQg60PHSIXI9mKFax59Fr45VxtM
X-Received: by 2002:a17:90b:4cd0:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b0db6cd200mr176252a91.37.1793911224075;
        Thu, 05 Nov 2026 12:40:24 -0800 (PST)
X-Received: by 2002:a17:90b:4cd0:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b0db6cd200mr176224a91.37.1793911223576;
        Thu, 05 Nov 2026 12:40:23 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ff96sm598625a91.13.2026.11.05.12.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:22 -0800 (PST)
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
Subject: [PATCH v6 02/15] drm/msm/a8xx: Export aperture helpers
Date: Thu,  5 Nov 2026 12:29:28 -0800
Message-ID: <20261105203057.66520-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXzRLnRaAvaFh6
 45/bWSg5Oy6kb8ZG5DvKmKrUpy+ZGYLNd75RZJ+Q7v0fupYPLUjgdOTF6iMXz9N+mYbNWPizeAO
 Ho8pqSDMu+QAow/GZ7ABuJqshwLbHYf/xhyAXVlhqsWBlcqWpI2ljQhobi4TW4aGAc4fRQfVTef
 4ycYl219KLI44btuw6lSLYGyqptLfn/d/H0R6j/ZccTECMVa2EmKGijLimUk9zqaPBo5b3pA4kZ
 1XdSSBJNZTW0gfd00y/6E6wzySODYUjrJBJltVPdqmS0j68Z6Au7P2Q6VENeetc4w5kLdnca+vp
 BDnwIXHAhB+LpUQIWQ3KZPnM8OAkglvE4iG3k2zRb6cI9XDPwd4Qnu3y82rUrHLnTjzfJftwUUR
 5u+cLbs1WSQT8HC7S/sihhoWZV7E3CL2eq+SBW7NnQEmEfMsddB6r7ZZg2WhTiP8lpJTdh65LoX
 Q/AgPmNb7pcLRKkH5RA==
X-Proofpoint-GUID: 2oyvMdtnN9A7wtSpE98CvfabjVZDjR5q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX6xhp3oJKGeRu
 GJHw/4Zy6qpU5hwoF2QbO/ZY5ru9EpUE55tHieV7QRxVgwIZNZtUHrc3g/Gz66qwJwjORLC87gY
 ZdFvJotvrrKZFAstZit1xQkspFYfE74=
X-Proofpoint-ORIG-GUID: 2oyvMdtnN9A7wtSpE98CvfabjVZDjR5q
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aece9b9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
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

