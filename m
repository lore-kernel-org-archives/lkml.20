Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305073;
	b=jgEKKioxXOrRqT4fR8C+MlK3nQRbMVln25HtE+qTaFbT8vLhTUcxEA6lDB1uV9LSQNQA
	 ZqBYzK9d20SQylwBOZbb/Fk9auB/a7KPZEobql1ClA0KcuoemkvQpmI27W2bnch9Hu2DA
	 rT9DQj7bKn3jSRRihL5bTQgx33R6teFPgGqWawC0gLQ6+zHsKEkit2p7cKKhK5lU3wDNE
	 HNQi6KsbfGhT6MTGfEw1JFcPgPzXlid1I7+I4KtTRcyC3Jz8klNYajqoU+q69ZZumm0cF
	 u7igJgoewUtspqXSYo1EhBxoteGzQ39dMNkgzmGAYCgxclw5IB/5RWX7gsSSGH1XbDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
	b=imSx4T3Rd4++qG4MyjqSEZBdMoF1vBx/uxZ51Spt478DOvLZJKa9Qs+Av8SzON9p6CV+
	 6bKrLwm/ms6QShTSoZVNCohYVsWwSG/bHUClpxXXTJxm5RvVd1kN7Z3kGEOGs7WGDC46p
	 6EObAXxXOm0kLP55HdCnyNxk1ghD9tsx200fQwcu7udFFIVGF+8f2sidlGqoihzoeWltH
	 +9vad+WA8pxSgSnUeHo7lNiEUAPyM+25TRZc5lVn6Z9YdefqKAIRY/0qEO22IPU2zFNkM
	 S3XWvodcbP1p1P2tjdgm5LvheNjCd75Nt7OQlIUUn1oDq4mengusqslf57W/Xi3dzAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Br0V/KZx";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DYHmfuht;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB01606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB01606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Br0V/KZx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DYHmfuht
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJkHjN775566
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bFtglml+hC8
	hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=; b=Br0V/KZxbEONAsZDMOiWmikSrXC
	yOqLDitz0U60eSP45JuAnmwzEBTGSYuyoDkF4WGnZyIoL+XNO0RMA/RSCQ2Y6Xuo
	zaAPFS1laavSZjLn8UJVpkEorNkPZ8L82oAaLNkW7sC9DP/IchhNUYpGGM1go+lv
	bEiuE0/2u+T1Wptp/Cd87vud3SL4JBcs7uiLf0Kq+nlyGM3aUs88FLDOxKzFMruf
	tt5WZZ3o1jviDGtOg8bRXo+TLjlp9JewOE/Aj32+WyVDmPnBu10cR43mdp7F90oW
	JcOnlo6F7NxSD0/88nYTae/nkhjbiINIKjjZiX6wpHPjXSbE7lanbdlOqUw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmchhr44k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso1805198b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305071; x=1793909871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=DYHmfuhtcezaWTZHSKf/X6DHLaTXZx/88rYaYN3cs69FLUQfYAeguINVLTGOGywdPc
         mXa7TmagwNKgo0npGB/Mb6lkmHbu2yuUVGLPKU+yzYCg0hG8rb5sq4rRIWgQ8Jy40cgb
         /5fWcU4fBCfpEVHC6FClwxgsj+kGvTWI5dJyzkjBS8JSFW8t4ewTv/ljcGEAizu6287x
         8nkPcWAeAHQd82pmm8MIRV7lwsWvSH5LWihqXSFr68QSp4NFih4fTTdIKdadULOfOWJD
         fpAEkg+qGCYZR8JnecHuVelMdoWHoCQhDtxZ6KGWDkoyAFK0DITJ/AlOLmgB5QniwI1R
         kNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305071; x=1793909871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=gsvAKDtmCBxrGbGW8D0q0TEeSxsNIy+xaFLdDhcxQQL9csmpFwl/rFykRSe+iCREcv
         EwQ5CHm4wejOk+jpwhsSVIFNGQxJ11np3RxhinEX9yQL3YyWmf5PeFAN2OBnKYMGTGps
         oECm770FRxKSHg92NUQI3ktIG5v5+saDg+U1yjKj0iyT7JX5uexXDljAvguqkuQVgkOy
         CFhzB9sik/ppD4KUMk29EW+ePQbTi0GPcqsNWDJjGJzDNbqdcjEVd3zPVYZ4w+xyuoCc
         x48aAXjamWbBkik2XUzF83mMGTARf5j1Xc8XnSg9ZgAxqu8bN9/sOhjC4ydlIZqbjsG/
         pWpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx3uUX27ezzJvze9SQ9oWVUJeSCGTIA6QWWDa6Mqh4ylNb5LuJbkW+oRl8e8NV4fbPoh+3lj5aRVp2G+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBJFXvJWwbS1igByuyAMnGyAQJ0bFDA1xDhScQf7BJFCghAphr
	FmbQe/R0agzPMGJE1nZcudE6oF1+zZgNg0i99TPs/6+WStgYLItYT3VZmgDMXpPlj12TWtbPGsn
	lzvDl3pH+fVc1zhIrfzzXy1JQ8ic08WyQbI2FC0qqE7tUJq7wUDAel/JrXO3i0LAwYHM=
X-Gm-Gg: AYBFou2ChUFXzbNzLn/NbD8OAIo3A41RHpaTYy+FZB3JPMnkgq5U3EXT9ikKq7XwzUu
	iBO3jNVsOKlI32W/zGkxBpF4HLem65I64c4TZkDQqjB9kLR/VjWudgR+n3pkKKlz2mdkq2Jj9+H
	HHhCcvucH1G4vFY4SlNeKBQUAdAMzhyLcUGOKFyLD6vPbIe5smHRwFFHaaY43rnU6GFrTMy8i0s
	IkpgB5UKXmYL1f10kNb8U9L/6t58U38ctvMHtElkKnTC1cBl/piHtOBLiEAOYEGOd0R8vTIvH5W
	TZ3AgnDm7YXzvzFqcY/A/Q7N6X2O3nsywf5gd2wYl+zWnuio6ZA7Tv0RpgxRQqxYix+iSgzfQrX
	KU1S2oPeVR2jsw7TJR4l52jxiQUoygw0SwAWk/2ik0vjV/EvN7qMkfrjyK2dDhAWI8WX7DlHN8l
	2/8J9W+eoKzrm7tAp+yH5pREc=
X-Received: by 2002:a05:6a00:6c83:b0:888:4f06:903f with SMTP id d2e1a72fcca58-8a9bf524c81mr153629b3a.38.1793305071466;
        Thu, 29 Oct 2026 13:17:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c83:b0:888:4f06:903f with SMTP id d2e1a72fcca58-8a9bf524c81mr153608b3a.38.1793305071001;
        Thu, 29 Oct 2026 13:17:51 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98893c464sm252559b3a.19.2026.10.29.13.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:50 -0700 (PDT)
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
Subject: [PATCH v3 02/16] drm/msm/a8xx: Export aperture helpers
Date: Thu, 29 Oct 2026 13:16:12 -0700
Message-ID: <20261029201730.151754-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX+pDS21jvZJJq
 vNA/FU7sGMTdkR+AMMSFYdBKSGlBjo7tCWhuBbFHH3ARW3WwAnk46Uae0ZdZFWkITfqJxNXIbuf
 ZYbjnQ1k3du8UyDD5bzRX6yNb/HJa44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX6lOs4TeTDB6s
 /wIy8bnbVRr1QMM+Y1TLhhKQVLBxTwmtUwpV8xrBn77auIwQ48LNAetdEHEQ518ypk97762UYly
 YSO1pxk7hs/hhp/+YV1YigkgvA3+m+rE7LvlxzjsRn/rbiQtGm9OqPZ5obwQDHMRvBkQyI8gAuv
 N5fuNdFO9fO32/6VIaYtAiRCtncoFnAAAbVTOQLcaq6xEjwY5W6lVrd6ldEeBY5/l6yUyndRqJd
 ApqqrN/r90pFnK6dkfaSH8E7z/vz4GLTO6qgiDXkHHWPUi4u9BgeLoUVMvx+QixuLO8aVwQ02/H
 VYzjlWVULceLKvD6egZkpx3loNhZabrAIwNBbrED+/R9jLw9QwmzhpqUxrHbPgKzzbmugYIG+sk
 42DgC5K2zPTD9ykjlVHibW3wB77rhAyoDJxbf2tn/Ca/ANPIgU6hZn+0mcXd+xlLDKwgpGn2ycT
 QkHOnKn6XtIkwG4Dq8A==
X-Proofpoint-ORIG-GUID: 7Q6loUQzoJ5IpL2ym_a4sK2mt23ERpRs
X-Authority-Analysis: v=2.4 cv=ffc4WEQF c=1 sm=1 tr=0 ts=6ae3a9f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 7Q6loUQzoJ5IpL2ym_a4sK2mt23ERpRs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

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

