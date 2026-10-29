Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305074;
	b=PI79bVXwcKg7mQNwAp0S/M25sp6iP43iFWdfYlPeuW7j/Lkvl3SFYdVm6nLvIf9e5LTk
	 S0h7vrVe1SgU1NmiItzuvCQ90CTA6yMDxGH5aLCZWDjxSqmS26uYo63tjsS37F4OG5pB0
	 WpwsQiyOj0dD4oPyA96BjnPfusfBtWmAKHSJfq1dINnbPqHuw6OmMQzg9/ooHlklg8QEF
	 CQgVZFxapyiHN+erztdVNjL1DATgLDs2m8LveDoD9jJHkX1C74Tf+Qq3I80GXEyDWS8uH
	 laKXLWxiHppUAVOgJ/iIuFRv626II+9492qbfEISXhopzLaFkuOCPboNgaLp2ReBMCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
	b=I3JBiYVw4VpEVErGNGHJmtIEw6sQ3aGcD79bEUodqFr11B9ZjNuIMKJBHphgbS7vJ2If
	 4a2mRB26Rpe/FaXYxmR2nwL6JSHYB7HaatI2xOmeYkXTFKuxn47DpYQzGM0S1R+kL+VYT
	 SH3L4uBRteIkvxeWk6PairN2mz6k+u5YWiryayzaiv4Tb0H7Z6giATcFS9I+feJEYt5Sx
	 2DYVyRLwsZBtc9IuJhmaV+utiT6mDZkv+fRt0+8kvbHJz91Kgu1bAhFzjbO0ymmvPmlLF
	 dRSRzj4jesoMzB4fCpWQ8GcEO+INN4U9Karh0KHA1vB53wb+0eHXWp9PKX0xEimCo5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G8iivUkC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeFH6+oK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE5D60A2605
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE5D60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G8iivUkC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeFH6+oK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjaFi2138841
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4iyKi3o3dnw
	WyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=; b=G8iivUkCx6xckf4Xyk60u1iWitL
	ekjcCtUppagzPwHjVNmGFOB0uIrPGNy0yp4Yho3qhfmtKULr/DS2eE91q7dHR3EY
	554Sx3lQCS8CmjIm7BNEhtiBtnwh/DouP0u8trhbIfHB2qpp2pjPnu8vMTt8GuyN
	DiVGJmBK7PcmRMbGaVPc0BIwyH9euYLpNEySmGZn0hss2UJX4qnmbJXYlDQEgsD7
	oG7tZ4z6dGbfLTJwxY4rB6mu9PP23Khdgc0fVqNdvwAWKrdu1YluxhcPfPl+u8FK
	4ziTvtR8zbUNkhXiVU1JvHAhpey9Qzm+za4wsMak32npKcSUYAyeAmyCOTw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a22kwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89f71ac2e2fso2151517b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305073; x=1793909873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
        b=LeFH6+oKmAi8qzq4I+zgo0Zbf0F1WSxv57VNl7NnJzxenB29k7MVyV5e41OgNbzSJG
         bN84z+k3f6vz/O1FHTGNK1uJCBAMX1FhgvSJTWUSosuPo5/7JELPwtUVVpR/hygvrg4p
         fgx8W3lwxIWHJNLglqr4/LAvNzm7tTM7sCR2IStSSdBNwiDTb6R/hoY2B5RpAtsEFii6
         ZN6CDn78dUzHF6yWCHAlVcT6sgaLZ1lS75d9i2/A6ZmbZDMncyGJNriAOURtV7GjdTDW
         yZ0zU4+MXg0KRC4syosQkG7n+AyVrLc3QNh99yaGbeVbJjvQslqeznAL8uvNOtfZHA55
         uWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305073; x=1793909873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
        b=0cYw998jzXk/KN/nHOr3/hmlJfp0W8Dch9hQcmJlVV8aYiDH/igjRaYYlV4TNtopxb
         et+pTbls8jsodrQHM1cj5Md9mUfG/4O0Mr843VpGFBQBh8bJtqaOjQPaz/AJtfdY8p7Y
         5sF68j2k6H7ZMf/9vjX1z/hc/QQ9X9gOThh4x5g73QILeLsvgT01nYtdwI9Y5eI5YqAz
         1jM4qR8hZkbYuQIecI1vt5cwaICDk3m5oP/SMuiO/RbFG9eJS/UVjjLWGKb0C/gybcWk
         YcELlgchmpSyh+CMyuQOF3S5nBQo5SPKx2ydMt6A9MAwzu1sQbhc4UB9ayru7PXF/7td
         IYyA==
X-Forwarded-Encrypted: i=1; AKwUvBwRvKfHazDM9HjuMy3rHtgV96BjKOGe/iJuFcLQThIicWYZkQFxuBS/pIAY6bEcYI/S9zCD5hrd4LG2Gfc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo1AoLuwcXPZPYozTSINKGUOGLOP7KsjnzBvzi9/VXD+rkH2IC
	kVItLxn1Jbwvcc3LjirJqctJM7mkTv2cmvmHQr5jrgN+Jx/kVOy1ia41j3mR3iprdMA+Xy2IEuK
	RLQaLIpUKU3xUO+asc/YqDUWCHQ3ciOfqG8tAlxlqwZ7NWulD+dqI7mUF7iR8bw9NORM=
X-Gm-Gg: AYBFou1n4uwWrePI11Vu9EFoinbHa557puNgE1feC/mhKflJ5/gVchWP0FARjEpAhE3
	ULiDzJRVuY+lNszo3vPqsh/bWQkBdo/kFRzBTPX3Sp9/OO4vuUdGKDWSstuW1yfG0+VgeTMLc9C
	9tprpvHCYcwzKdLLc5oLvn/xP4EQen6e1J5CSOUsboPrrq29VI0N1el/hSlY5puRVatiIoo5B8n
	gXWwySvbX1DKFys60cVIW6qMX2RrMxc0LvbA7nJYxmZYohsdQsL66hpTlypwQRjEgO1RUWao79M
	HxCpyz2KLeZ7TZqpMgsoucu/vAvk/tnml2Vy9qDAk18pGyoGgY2Ev2+y70STi+C9k0pnkH6HgD2
	Rw0J2OstMO5mpVkQ4/hGr0xT17e188g9KZbOpR/oihljmqTZSKM4Dh3ATmxU9ir5vBjVZjhWvJs
	MxWZo6Nl7czdDh0kie03FfBg==
X-Received: by 2002:a05:6a00:988:b0:882:bba:8791 with SMTP id d2e1a72fcca58-8a9bf71bbd3mr188263b3a.34.1793305072787;
        Thu, 29 Oct 2026 13:17:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:988:b0:882:bba:8791 with SMTP id d2e1a72fcca58-8a9bf71bbd3mr188235b3a.34.1793305072335;
        Thu, 29 Oct 2026 13:17:52 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a989cd5250sm257570b3a.49.2026.10.29.13.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:51 -0700 (PDT)
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
Subject: [PATCH v3 03/16] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Thu, 29 Oct 2026 13:16:13 -0700
Message-ID: <20261029201730.151754-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX89O1L58uUFtc
 O0PloTJOnHBqKK0eVMeRHXvuGfIkYCpO5P+ksZmwEfCK4lQriisS2kU4JbRIjTmLOs9E51RwRg/
 bnvT1WSJFfLFxlRlwwCqNLGDSeichKBlHJmF7Bdf8knHh+e31lJzhI7Q+7tOteDcQUhF88EbwOM
 X36Ds+oLPKLIpobxf6yuteCHveYpREqXJV6qa2zrDu9jFC5qJqaYIclDAjFxJBvUkGGOA0IAS4g
 ekqhAMv1ZHozsbqUxmUJqWtLoJ+ecx3N2Tj+mmj+joYuDhVs0Z3hNJANF20BYBAxJ7vgDUeOZGF
 kHoX+2evKssm2EyHMgt2hADM5dkIQl81niTWYhT+XuPtAdqKyvjY8JXBXHefBCJDHEW0YVH8H07
 cPHrYVVWYxE7l2/1Rj02UE/+PSeEmPmtfpFdY5XaW8xRbvPtU0wV7SfJT6ASv0Xk5XeMHjbyM4/
 DeBOuicxakip6sDYT/Q==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae3a9f1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX9vfcZYkUTDC9
 fEV1DLRgF+LsrX20NYmoMVCnpk7M83QYI212FsLDO7ePnjHgJjXSXJVzPn5oRIqZ3jKNHIE4bRZ
 0AhVJ9VlqzD5/7OpxFaTptl2/2HyvJ4=
X-Proofpoint-ORIG-GUID: 9ZhEOuqPUCWXsa4sdOJ8Unuj09YfeGFE
X-Proofpoint-GUID: 9ZhEOuqPUCWXsa4sdOJ8Unuj09YfeGFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290079

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index fb000b79fe2f..2a2ddba6761f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a14379e26fbe..a0983e2ee641 100644
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

