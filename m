Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007368;
	b=A6cM63lnm0xa1IluDiCQNpyYLvn6MVpk1gYVeP2lj8gDMvwyylnw8k9OgOyeU+81ZWj0
	 n8+3hebKl3qdjfK/BSprB+MDcOgWIbyD3SvTHeql9QRSUTXs7keCAyE9dHkHXfEGdkdWj
	 kw5xi0c9etpBca4QHP5m9QQK1E2SUjYCgKzAEDjExUTX70z0QaTxvL7Et4c1uRd1c46j2
	 Ck4112wzG2QPFox5MHCG8qFoTHDC1V8bGeIzRd/z1auwf1ceAgCagitgo/1jHxnuXFNd5
	 567k8Twu3Usxj3PA82cWExBaKeShoH7GbGqI//mp9HNbGU70vcIWKS5iY6OedoVWaWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
	b=R6UrOiDr+WHkpXCwmrFn0cWoO/OVDqWa4SD6LEZyurrGY6EJBgWK68bZP2sGytgyH29G
	 KnpMRrIpGIM5c/KPjuu9IzsVxXV9nMZvj40KBFWBUG0KgYWp7nI4JYJKrtitTkh4bczNG
	 crkgmZc3w3mWmmFAUVbEqPBTlgqT92MIBdeYv0IVJfLx69hc0vXwf0Uf9HELc4nuYJTpU
	 /+G97JHsIGefzqa2MMYEeC25OeLG5KgjLlwrYa3OeC5FGv7fDI0k6lbnvg1Fg3Ya9JQGH
	 iykDxacElzshlT3ZCKlwSR9g/23333HCBTk22OH//khmgIR1qDOORX1odzaD5Q27G3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Syf280aM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLhZ4Vfl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A3A606D807
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A3A606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Syf280aM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLhZ4Vfl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MnnmH1063669
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mInqVCgb/Jp
	cHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=; b=Syf280aMoO/xUrS4R7GcM0BxjJr
	J9yQtRcUX9vwJpHzLQQZm4b33yAxZ6mV5qaJfq60hFLkV5JqOzjves698X4pm74x
	V0VKg7dPpmD3JGIR2GXA1AWJB+rlqGjPCLTJ67xvZSRa8Vb8RKgaTEMCITSyV1ze
	1FADgBuhHA8+LI1+gavkNgVIjQeGPja2h1GBtoOtWjDq6QAOSzps09EsGI7sQwFb
	p6ha0vgRcd1W3etGV7ehbd5l9yYSNE+xTWWuToAdw8nMTkYE3GtA6fS4Qa5CM3pr
	94S05QCBLoVZ0duR5rquttwuGq7knNryMLlhNB7pwo+p6BKu3OOlV7VWOjw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv0ra0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso1046840a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007361; x=1794612161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
        b=jLhZ4Vfl7crAc2vw62wogDGnCHAG7TRgq6rQOtMtY3TOnKpDVWcWIoQS9sVbjt6TQ3
         imj09OVrgZJ28pq+4VPORaRnfHetcBx8jsoGeQSpX7BYBxz7gB4PO3RzT3RNS+nh71Lv
         hzFG2sm+G1S29kTEmAXWggVCEIfmXv9Z7SaJuDg9aqgKjmUNfmCTuDh9/8owLZzIfDk7
         Fs3EqJbxXcMRo6KUaQvaLpqqyfzWKp+vujIMpAUi/W31PYh79A5Y8d2QOgCpX/iF8Fte
         Gvtgi2UYSZXfO9iqbZ9EqxmjIfNI6CZAcDqiXP+Z8Pd3r8+9uGGP2Wg4m2diCrHOu+82
         NB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007361; x=1794612161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
        b=tuFicRkyRHGyejV7vn/IwYtGglRvDuiJW2/4uPNJGVKfqkukDYCCaxHOtFkJD0VILG
         7tEKBtjnD3MnJM3+cj8c9h5CBXAzcKFM4uv0HnHW/sv+1FRV1nhS0355ukfYweQaIzVb
         iv4lcTnxMeFWXqWBFVJojBKu/tFCpeGuJD9La2wkAG6gfxViZYVzKI5c7Z35KdWngGMe
         edRBJhHCqwJZv44dvM9+EiT1ytGccGsnda+YYr0l0SFSlRxq2hwgDFuRYkpts6kliNae
         tF3f3vMmhNnZfIvVqf9Q/AV5REDfLNiZ8GHFmfUH/PVUuokzdcjhMKINNGpy7GXePjDb
         om+A==
X-Forwarded-Encrypted: i=1; AL+hErEPEJpNJCXuIxxIV9QpQhVr8dLB2w8YOOxe8cCypQlaWBbhe/SBCJwjVGMhU2Vg6J3wu37d5VBHas4ePO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pkbjPoHjplmbAlsypQxUgyJZgPxCwkjp9qIhWv8AyjgAC7aN5
	/VS962dUShkf2hZEjWWCYvE6Tq+4uy7HKOyl1v51zIQglxSE3FQ+bxS6s+S07DtW+i295msACwO
	sSnpcgq+Sr1McZAxUo1ZzOg5nS05Qt7lZsnM6N5TbqfhSYfpH++Cu5zQ33SQXFQxRAdI=
X-Gm-Gg: AYBFou0JFlhRE54HrkJIkOmk6lv4OCGuzIORUYwMEVX1TcfO1/fRLnxyJZ/55GeXnMq
	gLlbGfxMbMZrxs9Do3u+9tuhfVepfNaSuFCEzu74e9i9zx1o9jOp4i9FpF9o4OSyMiDa9HM14J0
	+PZOV4NcbPwf4twVMQBpHpestvwHsurS7IZEW/HUrfKYcBZctPvYc7ZTGtjgnMZplp/9c4pgReU
	C30Nwf3n7v9Mq0lKJB2v+UM8YxdpMRSv7ffQtT+pers3h8vsjG4ubZiSGS28bqpX1kaw033rfbO
	WnlKOc/ZYsadBT2xtWvhyShk8lXvOk+VIS2xg8k7/SUcxBboxh4C7VT8P5saVcu4iUiwlDJ2HwM
	D1jtIdt9LMf5U4SF1HAhmNEPviP3Wltn54Zo//NkV7ueQWgaET9zKowtcqLBaHcllcY3vvG45ww
	cnQ1lGia+dpDkKtYYBR0UoHePZfcu8xrk7qQbdna0fJ7fiyP0oXMcrTuJ4t5wC7g==
X-Received: by 2002:a17:90b:268a:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b0db7107cfmr3369794a91.43.1794007361452;
        Fri, 06 Nov 2026 15:22:41 -0800 (PST)
X-Received: by 2002:a17:90b:268a:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b0db7107cfmr3369767a91.43.1794007360977;
        Fri, 06 Nov 2026 15:22:40 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105831cf6sm653999a91.11.2026.11.06.15.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:40 -0800 (PST)
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
Subject: [PATCH v7 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Fri,  6 Nov 2026 15:20:55 -0800
Message-ID: <20261106232220.47602-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qxarKYI4NMQoKH9tpxfDyMXs9hjX9B6h
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee6142 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX0bh5jSX9N0G9
 Bu/MuzQvq9TtKoi8nJf8bxqqGKD4g3wWrWH/VLDbGHaP8wTiyuzgsAuXG/VBZMkEGhtfSf41ybw
 0LNAFXmGtpVxi4GqYdMqaxUonUnHgok=
X-Proofpoint-GUID: qxarKYI4NMQoKH9tpxfDyMXs9hjX9B6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX0x6AH1pQSB9Y
 rFmkC+AMj3FWAYaGphx/obLcWv1Up+PXlhmG5sMX4IqKVBEEv20LL9hlwhHYakO+lniwMKKt9AX
 DQ1e1fPTKx6dxfpCXUE6lkHUiJ11YBewvKHHbLGXMuDxtuH414N8XAcVOxnE+nIBgv/ko3puUwL
 cg/6QUTZWI4E0nWsXjUHSvo/TZXKQny+VojrvmLV6br+OXZYaMQILmbcw6MIO805gfBGLIrbBpr
 nK3mYubJZrbhjlTvzfCEpV0Pql8MhQt2roFDQHOxWtQCHaaX9ItWNaBfhOaJw+X4U+r/m46Jtg5
 BtJkb9d4ZHUp0FhPXN/eOBOYiruagsgZnlRP2htaFXZm3KkZXKa6woaNK5iP8dhzCLv3qiNr5LR
 //G/XD+kk7XkHJDWzwvbqbYd1iEr47TJE0b4H8Xp5jPMSlMFb/UOr+EQmGUuX0lnOu92ml88krt
 8Oaf/HSSOTUOCHwOojA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index c58a2665e9ab..e6ec85b20fb7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -346,6 +346,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 82cddaa7278f..be81f141300f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -16,13 +16,10 @@
 
 #define GPU_PAS_ID 13
 
-static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
+static void a8xx_aperture_slice_set(struct msm_gpu *gpu, u32 val)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u32 val;
-
-	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
 
 	if (a6xx_gpu->cached_aperture == val)
 		return;
@@ -32,14 +29,20 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
 
-	a8xx_aperture_slice_set(gpu, pipe, 0);
+	a8xx_aperture_slice_set(gpu, val);
+
+}
+
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	a8xx_aperture_acquire_raw(gpu, A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe), flags);
 }
 
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
@@ -74,8 +77,10 @@ static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32
 	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
-	a8xx_aperture_slice_set(gpu, pipe, slice);
+	a8xx_aperture_acquire_raw(gpu,
+		A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) |
+		A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice),
+		&flags);
 	val = gpu_read(gpu, offset);
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 
-- 
2.56.0

