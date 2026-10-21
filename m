Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615960;
	b=pQFSTvi/2Qtzc9v2MDGXwLi5PlyySIJLUrEcSAJhm6zGn/51gq9K0bUJSXRm+OMhK2HS
	 hy8R5+F6znaWqCELBxytjac4pjYOZFSZCRDu9Wiw/wJI9P6S1pHTZHifsiw4YAINxEwq3
	 E0/n15pKsUEYID/N0/x7Tljzah0dHzIqFhTEffRygCQys3wlMdhD1dTqFGPk1FWWqSOEI
	 nJz2+kJtxFdKT9JkRkiJ0b4YpbaqgYJPCKMfh+09w4aTGFxEjSUeup7Cz33iPX9O0ngxY
	 aMCJKcgunu0AfDHA8G3un4duACnvpZWHAVPbDz4ZsPOTJxdfJaEA+zYPOo1BNn2SPMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
	b=kAzvm3Sb721uUhJBiTnQCevIPGeMpqPlkzK7W2oaHF9j17Qqm1e3IRwHI9Fu3zviGG5s
	 25bZwIQnbLHRTMquJyFdBLG4cvR9ZIawmTlX2PnO4r7lphTVHOE2gjxIGYPosRP+U7dd3
	 mSUfYLVY43r8BIGGsPxTvnOB3KHc/3HdpW2cOMZqAm/qzN5S5rqUVbFZckmoZFrVVP1HM
	 Or9RSu3vjVtUZb+unJGiOSI6CziF0s4OrcpfYIcdSXSWrVZ3ahURn+BoAjK3Jm0Bavekn
	 NaNd24omBVXwTleJMSYaGLfhFDC+GfSQITG3MF6FNVW8x4b3/dPVGjzjkLfaZhCQu1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGz5YOPy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcJnwUWC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69629606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69629606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGz5YOPy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcJnwUWC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKe3302748241
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bFtglml+hC8
	hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=; b=hGz5YOPy/udZJmTKSCE8pXcNhZj
	a9HiWPaY1U0PLtrD8THEtWGaMdT9vWSTvnJ5W062YUSCY7CFL+poiS1dp1hmipM4
	FeS9M1Xuzq+MnlZ2H81qsaLQJN2xvifl2MbCOt0p6nFGM2GdZZd3Xaa8J6+DCv7H
	NxbD+S2CieiD1eqp4ooJgBt4lkcsasdqMn2eEliNw41o44kYapFu7ka+dco9HzAe
	aLvUK/bXQ7IlfyayOCQclrKajfr97/EXlgX2X9zGiYnSafeIv1pMAkvdLV4ZN+uK
	aomgTC91HDQsRCFet0jfToCSdHZ0QduBMGO4LjPMuhMf5CBRcg+UwI7heug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0ke1459-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e941532594so11051955ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615959; x=1793220759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=dcJnwUWCx57lTf7tJ4tuU8rlwlSxq/+GiIWakYndzDJirf6e+febQhl/2QxTjU9Mw1
         KEb2UVNyBTMvacihW0P5JXH44N+3AwkUtr38OLpYmfBZjfUR2VyQMTqH7IwL0qKrt2Wo
         KiKt2ZbgJQIThi++9obMco5HKq34/pmd8lvCO/OaUG99GFciMqKzw/+2IfxQh5OT1fvY
         0YbauZJOG8yPptAiq2yEXGrQmx5TrSveVOrjTZqKwDcyK4kVI02Z4OeoM/0Zsx5K2bl7
         TqmUIoKNK6E+WcHCoElKb2zOT4XHj0Ii1dkl6aJ3mIIECpH1eiKIad61aRKRwk9dHybn
         2SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615959; x=1793220759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=XZzfsEOrVEgTSq+nVO3u+Ym12hRYp6uGdoT2IvnBMo4WhTO8rilJ6CRadHMfHYytKo
         tsDGUybBs0k4uEY5UPt+6eGhpuObhSCyCkqxGxdDIZ8D1SRUW6NtmyZb0N8Cif2zbPKw
         lpC64cPPfYG2cX9W3AMu5Luepi5/LU4Lmy3u+KNBpa8+1VlhheLcujtWbqj3nlYK9XDZ
         wkfmxLW2rFqo7h/TapsTFN+E7B9359Zswbt+l6KlTp+ktMD971YiR7WE4L/m/GddzZ2R
         Sv7xI5R7qkBwi2Y74Oj6vpKoCAPJ2BrukoxffxmupD419hVCAc7/4i4eOv/SfRAObxdW
         4Mgw==
X-Forwarded-Encrypted: i=1; AKwUvBxIptXnoD2Y7BnQE4/AnHxgEO31bwHilnpWiaZCsJnjNH4xIsQ4S5Tfk2rSzgQSMCRMCmvqHHxBKKYR3qA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjACzGjIWopvrq7JH0+3236tohpBgwMp2KFXVhL6HDE/lEntbY
	DSZXCsNJ9sysbRiWuh/+FF3ZulXKpq7UC3C8+OYPcmY5LwvBEzvab2dSzgdUX5c7Ar8qr3HPQjy
	x4npKpf1MSVF0YqUI0gK5hpHlWKxmtsbHDZMJJgwo2lm9L7i9XQ7qd2yfHH2Hwlaq71k=
X-Gm-Gg: AYBFou01UNr1cOzN/BvhuIQsY82I+o8rwZQdvtIlqhJcBpl2cFsFd/uRZjoFqqMpU/h
	/izQUrqOt4KU9mI9G/4Gs8bIJad5m+Tto1j8AkqPT/Hcc6E6EeqEFuBPzrr+POfAkqPOV5xEiZK
	MxQPE3xKRci6lnWGop34q5AI1GaBf2lSl2BnizZoCu00PmTV7j/cN0AcwYiHG72R0eTPZJpRLoq
	VJuPi/6tNbEuoxb6FDEJiBiocezQQAf11YROyjvsWVyfjlrNZnp9TfxAa2a5xlt0yu0J4LyYJ0O
	26yv94ALzVM5H7aM9NrFd+QFKPhF5pdb7XGLTIB7dng2rDuemFNfl/Ty989LpNYappXl4FF58Tx
	piMuLsQLUr6SMwLZpAboGvI+U2cayZQ4HEhzZ2CVmmp6KAyR/VQ==
X-Received: by 2002:a17:902:c948:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2ea439fbce1mr26166865ad.16.1792615958839;
        Wed, 21 Oct 2026 13:52:38 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2e5:d33a:88da with SMTP id d9443c01a7336-2ea439fbce1mr26166755ad.16.1792615958413;
        Wed, 21 Oct 2026 13:52:38 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b3082basm15852275ad.3.2026.10.21.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:37 -0700 (PDT)
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
Subject: [PATCH v2 02/14] drm/msm/a8xx: Export aperture helpers
Date: Wed, 21 Oct 2026 13:41:27 -0700
Message-ID: <20261021204244.67160-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: gLsmZWmkHsNTWmhNdxDQ6Xiphr926wUU
X-Proofpoint-ORIG-GUID: gLsmZWmkHsNTWmhNdxDQ6Xiphr926wUU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXwt/85lYXLncL
 EH6NzBjAmgMEIrqUeg/pWrBaD9kXddyja7rlI3adqE6QbUl1lsc1mvvP3i3U5gfJJy1bjEk8L1o
 4rAjX64UfGM/nlZLRmbopaWMaNxjdyo=
X-Authority-Analysis: v=2.4 cv=KOzPn1Fo c=1 sm=1 tr=0 ts=6ad92617 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX1JPMDie2t91S
 KR8cr/Y0NA7rI5ISz/UYGA4sFGBqZUC1W5J1SYVzREeVvTpn0q0sTRgzzuLgfsUY76QSrJg7KUO
 cnMU1pYebb9/IPuj4wJPdx4SPAXXv/kHn2OROQnId0jrPk8qgZ1Wger5WUzwRWfbwunDSYKJWWf
 +ZaMpi8jDHKSGeXU0xMCtEryiTtGWgmlFTeKOis1V+WVCu9JkuGPpOHKeaVIh80K2uZOT8hNwqL
 wH8F9rPjS6bohzqDaJM2RJgYHmBokARU0Juj57R3kmA2GVPnNwbEx3BUcCFq9wj6ibnl25wEZw6
 XZA4OKZKN1M7U84xBXZKG+TfOGRPoPGUo3j+824+RWt1X8VxkcHpeeIuB5lnWydJEZrc8kSvOvn
 lnBD9t+Xgqa/APmIj88s6RVny2+8WJTdM3xZsSppJwLFZXD+D3gxYP69zDycnitUS00CNSsi9BA
 pX5s6Txtfnf6GOgkCSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

We'll need these from gen8 gpu state snapshot code as well.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 81d21acccea1..fb000b79fe2f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e7d04c865968..a14379e26fbe 100644
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

