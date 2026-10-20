Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529272;
	b=SjogeZER3RDFUhyosKNV4v5wW5TmKqeok0m0npjoQbCwPOxFt9lbo8D2MNmfq7BgmpAY
	 i1Ag87B6wsjtRBgJY+6mhyY+/DhorjmAjP4IVG8kF39+jkh8cSIbKfFC28pCIAxBf25c6
	 QQgQW6mWSUyJkdF/1cXkb11upuj/sROwMwG83NaLWfTaXtfRW7u2RS6TAXBn7zpe3+Sg2
	 TxHRktutV2Y+Ai4319Kr8NVeQ/JdNGFOtAMDWMB3IKJ4uKyXaDif5RLjvXIGuOBSDQp6B
	 TF0OK86kuVap6OAbfhg1vWdyBkyTJt5vJAL5FGoe4QVMGW0pb6EtrfVTviKVJQGHx+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tTj9FU2l6DkQ6RJx5hLFoO5Te3fK+1vgHq98PZkcDoM=;
	b=nsSY/srOEXjZv9ilvfINSmehfaHTI1MU+KRUw8cXobIqJQplY/fJV8vU+vIGQQSx7chy
	 AgP3hFD0NhbaTJbR0MhgvYOCT8qAiwLqdSF7QzEzUKoKU0MV1kbyv3JBuouTd2W6Ey+xS
	 02AxNB5SfDYU5TX4yho3WA8g7tZBWg4LzcpOs3fLsu/6hPdhAsV8S3BxTL7cY6DD2If/O
	 6AOuasN8fwUeFtpZ/W/bX8LRVqBSwby1clhuv3gNurUv4cHvFryalI+U7+HE0Fp+R53ud
	 8jSKbZsOtt14t9Bi6rzOicLFeEWgno8j1DIKOh7kTSAyTwSds421KF4dfgc6tZWwUhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCUOI9Zn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=he2XVJyP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8939606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8939606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCUOI9Zn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=he2XVJyP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtm4I2278796
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tTj9FU2l6Dk
	Q6RJx5hLFoO5Te3fK+1vgHq98PZkcDoM=; b=BCUOI9ZnP5ckR1npZRB3XXA7bpY
	5Kkn7cRr9dheeVMmDXZ4E4N4f7u/Ok2EcjFrRaLQwpM7SEvcMRuWEU30C3opqECI
	UNBcFRnY4D1y8wwJ08X+TOtHi2Ta3CvQBsYnMdcuw9AjuEoy4osasfm4i5kYFzGX
	IPzjVv5ulQHrx2iKdWOcVLYPgGVNIfyAfUVYcNjBMBmV/0pXhlKmzAf34w72tgzq
	Yhm3KVGMgl3NO8CMBOGTMtnf4qRzlKECSGSHyZzxsxry2Is2crzvUVEovFCBtDla
	Lcvej1P3CUv88jddrGop1j3v2dxGIL+FzQzhTkDwCzuQkzjU4JP356Q2HDw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2a3sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad436a9d00so87512a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529270; x=1793134070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTj9FU2l6DkQ6RJx5hLFoO5Te3fK+1vgHq98PZkcDoM=;
        b=he2XVJyP2F1WvqlhjTY0WWlXeYIFi4n+xOwNyJkwSdRy8xxAuq9rq2xp3plqwc5X7j
         ii/kQ644Fx1xu/wmJyY1DIRQrSPOq3vrydPCJCZrHhuthh0ltAbenwR4AiJJ9lqF0NIp
         xkHGpEQyxDs+boaPw1KAwmNv7H86EIvSfxaUznYPaaNRxG9SsbgaOEp+kls88vID6W94
         w1RoBuELLgh4rM4GJWi6NwDSsC1EQeLAxGvz11kY3HB0vhzegg+qMl6btC/6dBbRu2nI
         Nw92S/5xEn8LNgpKrCWkVdAvj8jM/A5LrobOas6+QIsO9jEWOC3L0R7XQLzjWS3Fv4i+
         kWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529270; x=1793134070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTj9FU2l6DkQ6RJx5hLFoO5Te3fK+1vgHq98PZkcDoM=;
        b=EnSO0xGOregRaACbIS/P+H20qr/Jbu9yj/JtH7GArgZCvlR6tJxnW4SYybsgMbTP6M
         jUj8eW9aUZmgqp2aO1wSHuXeyibzkRrPEczsYqdkW/2atZELD4VSKHDlXnb1SeDmDdjR
         8CrfdiAQ3a0QJbov3mhhHKG9eTbwR3BxAMMbc5otdhfiN1uVhwELeXiefoGkf2wTwRTo
         vTQNtJpKsQ+c2GCJxPTc9MC6A3nVvDKmF2Av2cZ6a2EZeu+kJX1F/9HPpsI1BLkvpjXf
         sz1nPHNA4YpUpIyiK2jEDmYf0XdQroC0196LwTKAbLMSDbUeov4o3WcBpZjwAkx3fJU5
         7RnA==
X-Forwarded-Encrypted: i=1; AKwUvBwO3P8iYSxY2pkYdPM4FgdSZJDhBqV5gDKZrnFH4K5uGHIfpUn1rNFFQXpbBmcvCxNi7FaO5H6nfraMZKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAokNc0S8RtwrFeBKAGP91IwlvVyxYmhBAWS2CGEfBdsUPtUd+
	pHq+27yb7dpnEHH3IfgN53IGz+GfVt6JARStMmRK3AUPtx3ggahbw1oeTP75zW3HbjmIaMGKGXv
	9r8RRYgAs/0g8bcY34RwBGQ/TPfyojwAUblxgocwO/b7h5rkzNzN6/rVvqz0D9uRse64=
X-Gm-Gg: AYBFou11K9ywTBwy3vbhHpu9HZRHhGWmvk89oVDupwQ82tkhV08/m/A5sjyubfhUasL
	uNtUODLP+iQM4UmGkMdn+DDH2Zyd4PVKmM/YXpcjgZdHaKF4OsEJhe3aGIkDho/VPwCY1MKczjx
	C7vng5sPQTgE3mRLlijwY3m9KWOSr/h0EL8geH3E7r8eL3IjDK4BQvCyEdSjMT/Axl2ubyh9+sW
	JEFgXZOEEmoo6jb6kNsse2HGQVhl6TYy7flVH7p1H/tdwPQVpXQlirGGLIYawqH6wjhgvNPTpUU
	Ngec0z4S+bBvYVgT9VWDBSybCh9RHqPkPVa22Jqomu6yVxETrgzAkKycJwZprf6mFJeV+aok+7J
	QtEK7a/FZVYLrEBbHDVmEhNZi9bpQ1TycePoEdaaOfH1DadjrDw==
X-Received: by 2002:a17:90b:1d45:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3ad86f01861mr74551a91.46.1792529270567;
        Tue, 20 Oct 2026 13:47:50 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3ad86f01861mr74519a91.46.1792529270081;
        Tue, 20 Oct 2026 13:47:50 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80cbe295sm906521a91.5.2026.10.20.13.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:49 -0700 (PDT)
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
Subject: [PATCH 03/12] drm/msm/a8xx: Add a8xx_aperture_acquire_slice()
Date: Tue, 20 Oct 2026 13:46:17 -0700
Message-ID: <20261020204728.28844-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: JkNSW1vXbnr82EvImSBH0vh6O6xXbufe
X-Proofpoint-ORIG-GUID: JkNSW1vXbnr82EvImSBH0vh6O6xXbufe
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7d377 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PjapJS5JrKSUkyaTbiQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX5H5PeWmuDOrs
 2Ct+Pt7RMvBvsGvefoqB9mzwMLQrnCs41zaO9EXIoo8zJ0adzEIYyikHE+WvDVL68lH8Saf3Asf
 84YRPrutMhlK9LWf4ebsjnWVVpSKCuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXz00XEDeaGQa1
 6w512D8qGAS4+CkumkIRl7o6LLoAc9WTPIcEBX+96uNsAAgoi4FReH/KIVAJZvdRinQwQy0PS+E
 bYn3HAO27Ve68fA3pc+sOAZISi+dI6ja1gMYdrF/6UHKS/Go6hwb9PVT6m4GpjI6SL6Zx8Z5Owy
 jBP938iIwmKC3O/oZTOBlILJ7RgdgT4GXrEqR4Mo6Piu0yjeFQUV8xXuQeFekXGZuH1X5nZq+RT
 chts2wcodyIGvYMb7aAU6chHY6Q9LPHy/fwaX6GpGKysfErU6US8Whu9IS3wrfPw8uhyysMaMFC
 2+OmD9POODpCA8JAEnPS+oBx28gtQzGTUcY3gqNRHxlWkdfaxzwnT01E+V485fpjLcWE1Xl6kIG
 nIbZmkQK9L6TO00ZQJBx6k93RDtbxr2r2DWwnVkfBv3IvJCO3I5JJ0DVF+I7C5xAC+AvxL4E34/
 9mfIQ0E8zZFsbD535kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

The gen8 snapshot code will need a bit more control.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 +++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index fb000b79fe2f..d60cbfaa0d8e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_slice(struct msm_gpu *gpu, enum adreno_pipe pipe,
+				 u32 slice, bool use_slice,
+				 unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a14379e26fbe..72c84f73157a 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -16,7 +16,8 @@
 
 #define GPU_PAS_ID 13
 
-static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
+static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
+				    u32 slice, bool use_slice)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -24,6 +25,9 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 
 	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
 
+	if (use_slice)
+		val |= A8XX_CP_APERTURE_CNTL_HOST_USESLICEID;
+
 	if (a6xx_gpu->cached_aperture == val)
 		return;
 
@@ -32,14 +36,21 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire_slice(struct msm_gpu *gpu, enum adreno_pipe pipe,
+				 u32 slice, bool use_slice,
+				 unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
 
-	a8xx_aperture_slice_set(gpu, pipe, 0);
+	a8xx_aperture_slice_set(gpu, pipe, slice, use_slice);
+}
+
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	a8xx_aperture_acquire_slice(gpu, pipe, 0, false, flags);
 }
 
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
@@ -75,7 +86,7 @@ static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32
 	u32 val;
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
-	a8xx_aperture_slice_set(gpu, pipe, slice);
+	a8xx_aperture_slice_set(gpu, pipe, slice, false);
 	val = gpu_read(gpu, offset);
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 
-- 
2.56.0

