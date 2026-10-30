Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395184;
	b=RD8MNq10igvYZtxCLaGDE+30hcjGhYeD18TTKOtUEUTpzD3ZwHSKdOn6a5ckvX3y7BQo
	 lBwGmMEQ5JCY6Aef6M4BmBiTDvUvVU8N0FhA+8VsNJVKxLdCbIVQVSS2uXvYsgyZlQg2q
	 2kjmU7xFPgqQdQhPbkuflv7W553brklEp5YRd8ldxCeMYTMYTE7XRX/LVIHWc7nzpCHhY
	 sA27ZoCYsVJdk9ZA03ihqQbYhrH9KouDlhVkY6AEud+cdbMmoD9kRz/xHXPIhKnstswmo
	 GFhr6w35SDvFHcPnYRJXKv0MLxH2ePxwg4e0hkVllBxOUElWfwFy+VhuAEGFk1CIuJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OuQj5LyMq+haJbOeBteBY2/+x1n4Q2GfvkKjP9s1CHM=;
	b=bfO/9beTkSPiYVCbnfatYERX4NDvvgG47okDGZZ3EXX0JVCJv5HJvvVTdO4loLM8bM1u
	 TR3MKLJG/wrrtR/ml2ydbUaQsccXHkOXY0e/RWhNe0WTZEXrUO/PNhnBvIYdnEd0FbViU
	 QpRn3NyaV2bywzlCw1sgejyY3Rx2QwQF5afjUkiQu7gdL56qZ3yFaxXwfY38FtFUaZfer
	 zFr0gY/crK0mzLlVq4WA4G4QfZvBsLQANbmjjmBhN55ZIQRdn5yVT80QY40a5hP7TU9Qp
	 2A6KRDMw9u1tXxnLUhWjwt671ULyyEph2jI1kSL7YNpMlJR3aa/sCcBISaHbit2g9Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XtP2/e36";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V8Tm6uFp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA660A260C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCA660A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XtP2/e36;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V8Tm6uFp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAfFC235923
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OuQj5LyMq+h
	aJbOeBteBY2/+x1n4Q2GfvkKjP9s1CHM=; b=XtP2/e36zDkpHSCmxSv9Y6XXd5t
	ajarRKs2oQS/OOKfJ9a+JYfnh6ver5NQBNqyCkAH68ZQ/82Je5bGYN5H62CShupV
	Z3R63SzNyD5n7w58gO2k8DVcBAqbaFRW6H8skf5tGJu1GmnS5rdIUGRdXVbdhrVZ
	RokiqNQ0FB2HE5TC/uGdGHku5+e6j57nrGxjFvtb4Djgf/GQgwahG3FTbuT0/tf4
	6YGwdM+qgEEjywplrhAx0D9HaTXVSXM1Uw3//9tQFY+09Ciz1rQCQhIut4SEjgn6
	2iPGuiCPFgTi/u5VMdF2YXGFSbUnC1cuz9GLX7MOZPyMmhZIjtqVBjXC3zw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x001aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eac6e96bd4so18036385ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395182; x=1793999982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuQj5LyMq+haJbOeBteBY2/+x1n4Q2GfvkKjP9s1CHM=;
        b=V8Tm6uFpe5orhhtaTc+gewJ1b//vvmq8OFgAcgSf7h6uke8KkZ2r4rOB2R1FKSHgHC
         ddilZ2EAsQ77SrVTh+bmKmVPUOlhSjTIkdTnODReF3s62xIaGN/ZYjNPOdIg6t/3li4h
         x/MEhiiE4TiXVHpLXgiuj6bE15zUTOHtIuQ5kdF/joEBzcaukXyzWDkPP3MB2k413+yR
         n/+tNKLlLrq/RA89SewXSAvEb5RvKxghCITo3vWtueKYEKoWBNCwOlIOyUScCBvx5+ce
         KyrvXR1ph//4Rt2Mr65ZHFOefra8k5MFox226fSULP+MdA0FznS4QeqBn3Zz4snTobo0
         Z8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395182; x=1793999982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuQj5LyMq+haJbOeBteBY2/+x1n4Q2GfvkKjP9s1CHM=;
        b=WEVeIQOsnYQrGO0krWqznB9JgB0lkg6jEZEfAAMp7J+F1kXhlEadzdFXuotap9W/+u
         wwjzwb1wg1j59gYO2sounnRJ4YqD7Vr3MBSblnsC+jXmVjRGAZv/lNkyTBEAH3wv3ZvA
         HttITH8dz4B4W21XlNduSzWwWGmQrW6m6ahL9h++ztcilO6b5bMg8QdWzL+cUxhlikPh
         VGFlFeKQoZUAqgYkEnSY3RlmvAt5RUqI/jReY7bggJeCzuysBngNbQb4pdoq8w343TIf
         fcYmxqIsACftLDDAWMHEejHkPvb00KlORlmW+CSoefGYONZ7Y133rgM6VRdekRTmWFC/
         dEQg==
X-Forwarded-Encrypted: i=1; AKwUvBwM9737wrwPoCWuEOEk+lVar9r0dVE0N9CW6GGRvOMKLIqGXuBVU4Bn4wPkGjcjzsf8cOUGKqVzpn+0o+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhoYkQyVL+5xvQLW6+gyPOQ3F8LciTB49CuXwNA9/h4Uz7wNe4
	eRPjNuzIVNB2a76qH5D8vXEEuSBL1J3EfpPb4Nsxpmz7HYqyaA+7Chs8JbWztSPeJEwIjpJxXTf
	4GY92XG1vnN1wHHTbl7BGT6FmrHV1gxmiqpUt+OhRnZLR4XmGkjpdZ4hyu7K8z/gmZbA=
X-Gm-Gg: AYBFou1hW9WgZiZUXMjbflh4tLAdbuW2bXwAZINur9V8pJ8rmsQbtIrrj7T6ydJ+Z3Z
	fuldsp4JbvhU3AAEpCqSKnxA9azp4tP3hKNq6GZn+wgDNHQjh1gpZqs/XxzBHrdJ3jPQeI84mLH
	sxvLmO5QytwJOw2vhjhgTzad3S7Jsj3qpgDsKU2HruTrgIIDCz86f9uNPNV+nvwLQTxOq++9Q/a
	uU1YlGUyThKeElD96GG5U5f8rp84VrdivJ2oea8eCU/7fvnlhmhZ3C9/eDrK5MvcLH+FGoayMfC
	3tlgDLAZN4dxVHrFrMmDEQpci40HeJDn2n5wzgOO2tN8PHEIrV/AOu2ggKdP0JDoIQitEPK1LsP
	KbZEBq1QtQIx22kRAf3OIfsCDJDVu9zIMnRq0X3aus8DU5pICbmKIoVn8Yh2ZvAB1dGbLKtHtmT
	QqiPUhlPyBYz9Gq/o8HvZr6Q==
X-Received: by 2002:a17:902:f70c:b0:2eb:a1b:e9fd with SMTP id d9443c01a7336-2eb364de4efmr34482165ad.41.1793395182094;
        Fri, 30 Oct 2026 14:19:42 -0700 (PDT)
X-Received: by 2002:a17:902:f70c:b0:2eb:a1b:e9fd with SMTP id d9443c01a7336-2eb364de4efmr34481965ad.41.1793395181706;
        Fri, 30 Oct 2026 14:19:41 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392aa7absm11605155ad.65.2026.10.30.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:40 -0700 (PDT)
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
Subject: [PATCH v4 03/19] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Fri, 30 Oct 2026 14:18:05 -0700
Message-ID: <20261030211928.45761-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX5DGcUxqbg1Va
 Cq6YMPHEj/qnSyre714kftUE9ByCYmeAq04gz8GRPNdoqABfpZQvdDllCvlXte9qscfgq0DieqX
 NMHGErZt8l8C7lAlFbaklicdG5kE9tE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX5gxC94nV4Td4
 NI1Xsfsoz1ZZOcJa9CPKtXjkpKQcxhO3GmR/WBekE7U5QP8WC7LIqP6G4kcchiv6voZJAKrcy4f
 A6DdiSjwz9yqSBBhZmW3zTA5pmy9rBxym6KHmDXXdvWO9+E9FXQym14bspDv9V4zCZHVYaIPJWm
 fcwyGcXDpDcbG+1vipa/MIcXK89m2KG+/JiSqWewP7/OD/VKmH1+84L3xbRnTQWJ6lYP7aTp6ms
 GzDaYqmqwba+2bID1byHeYVTWQaxx4jkoSHOkLbf/3daonMwE7FyzjMikv84fIOlNSpsuz9eXK2
 PwMbD5iPsXa18dMzxOkP9YdIyQcQNNt3zGWup8VPbHgmmT1c/FlQ5E3nYswa8Q3+PVVU8yQ2bsE
 c8qxp25H06Rgoo2DcWgVoHp7Ksf4Sw==
X-Proofpoint-GUID: UQVPv-z6B-lS_LQZQmMIE6_-E3JQgwfT
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae509ee cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UQVPv-z6B-lS_LQZQmMIE6_-E3JQgwfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
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

