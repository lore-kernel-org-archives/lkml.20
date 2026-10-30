Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395182;
	b=RXd22sis3yIff+v1xY1Fh5ToVvHZFl9Z+iJ+QXr6MpIUckj9Ky9rzbnU5KvrXnCBZe0q
	 eeBcpkEU4DMReMupflFk2YBfGsIZNlz/mHVCwKZTWb7VVjDZBDvAvAnCzmikfYMeuQl0b
	 necmnVh1mdR0DgDjdCFPG8/jDVuv7szVsGXxlMWIvBQrcZB+/4yx6ZAm5WdNXNUVj7ox0
	 Q6UNLjJbNdb5wt5pLgz5pTWEJFFd+i9dJWIxKRremCWU8vk8FoF9lUMyGiu9ZaFYviedY
	 3KAK8EXBS9m91+HNyZ9IfvGKlVkJbrW/SgReXnBP9dXk++RLfoXLgnoGJYx5/wfP17g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B6OmBv37eHboEi7BArbQsLv/q5WNK4DK8SqPKmeY4Mg=;
	b=N8nCsbNHcCW+duyFU5rcNWF7CmMh8H/UJzV86JIrJNrXMx8TANeYzOW6chtwncDiuH8F
	 DrNY2Oq+fw+U1b4Pxtk5wTLY6mM9ZNubLyweP62aofKpZzF5yn4DjpQypdMD+YpbP9Gxl
	 2TazRN8eEdn1DYnN1XSgm3RoAWu7JHEmjrcccs86BGpp4Qu1eWmH4pKCS2R7FSgcFybOw
	 C3pKX78Ul9fAHNZJVdEeRU5DZ90I5E7Z1YGG5PqlOtlVNjlL48fBiZe4xwtlAjBYIbWuC
	 9wC5Z/SgP4LzchluC4/wgAK1J+sFyz2B/tN0vLsvhzcr4M5pB4UiSCAGGS+YI1zJdiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HahJ10wK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LcqaqH+l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D556A606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D556A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HahJ10wK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LcqaqH+l
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAfFB235923
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B6OmBv37eHb
	oEi7BArbQsLv/q5WNK4DK8SqPKmeY4Mg=; b=HahJ10wKlItNwwuJIt5NekUdnHN
	uj+XDyqH9QgYUL8A3feLWL/Ne3O7n8XNhuvfSy0bJrYh98gQZ38AnNQh+Y7MUVKr
	wd91fTETjHWu0J53Q9EV+6Ib+4od6p6AfwUCMJUZJoD/XDfG7fXN5hELfNIwNP9n
	egzMbRneqD3+A++AwJiiOqItrD5qHRckcgFz6IdK1BsbMSRgJqHVh4nlz3TtCtb8
	tVitXvvP0i6lWHsOIZProSj99iV89WJeITMe0cjbo+hKyH/kUV0J+b1fB5ZO9jrX
	Ffdm9Y00EbLDaNgevhIQIFdHvCgBVf566bPA1+BNUE6iP2bkufvPkSmFgvA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x001a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2a74482so626073a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395180; x=1793999980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6OmBv37eHboEi7BArbQsLv/q5WNK4DK8SqPKmeY4Mg=;
        b=LcqaqH+lxPYZQQp60qJ7Drik4tGUqPAYNJSCw1/50lvaZ54azlFDqrZZZsqD/qQ3x/
         z3sPqTHfQEH1R8jhh/LbNaJqc9zO1JLs9ZgrFBsMvKzu7PklPo9VQ/N3awG+K9MPDmhM
         4J1rSFrBNYZ1Pce4qf+4bvZ+GNlM58QsCnDEvUnHMgcG9jr03UtMwQSjBzTkmvfxePsA
         yVELKPKVo56WbnALa+dCuysTbOqPzDqCmw6WoTH6lGVAfx3SOw6YzwzLgipBl3FP5gPg
         ShI2ICH5/uc+RKhSKnGBlZ/18ki4bkTWGxr4i7bigEYkHsTEV3KwT1ZkZi2a+5idRUHC
         ndiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395180; x=1793999980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6OmBv37eHboEi7BArbQsLv/q5WNK4DK8SqPKmeY4Mg=;
        b=0yaSKdI1Y1I45V7sUUNe26HVSLSymr63HGZJCqsIWO9xHov/S5z+KPfJIpcwdKEiFf
         a5YmUHrqN4vYgpYbCV/wZqp88bpdOzn+LcmWcnKCE42rFdM2yRpckymAZ2uPMzXHZPla
         mDAATDIP7uVWKF0wqO6zRQ35gsdw5jgOzjzahsSTjiCPK35SD19q3/PHwaGYPrBoDvf1
         af77xBWu23yslWJPyz3WpL0HfkRb4OF+valyi3cfhur1tM6FQVKEJOpIf6D4STNAag+o
         l7STDrFqRiTBZXdSqcRpGRApjXmKWQzDxpB3shBRn1LwunwS2of1zThwdB3IwacXeFJz
         y7VA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Cb5PiEQMtt+cReF77PH8XItIE/slohaDv1TEQaMUlOvRAtdL2UB7KNvzu7RBOfpV6G/M5evrp1ke/kk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqEShMAk23e+d8Ph67u66fq5xyGZT5bD57HdIdowfccyFOHctv
	LwUOnJre9KpLdLGVIJkaWme2OhN69/qBlXXU/iLR++QG+5i3M/AjNtUlFfIrmcZZIdPNzo2INAz
	3sycqiC1p5ls61g53xTbXB6cJEugNF9eiHu86v+OzJhoV+5DoigE58RdUq5vjYeSJUKDFSq31eu
	I=
X-Gm-Gg: AYBFou0+IaamCPMF1RFucM4GeseKul/cHXkUj1H9lHOXSfuebGA5xhGBrpr12kCGUWa
	WeBJIiPQDdKq4Rz66DtlyfixhHqmAAFtHaec6oi+Iwhml4Y8FhKACYMuoaSI22CNGtx8M42MQQM
	ZAHI2qfgTepIMgCLUs2O1NexCA5l1uigYW3zebRmXyjednIoH844L0qzPHt2R/xc9K3fBsenMPG
	mHgvwoOgfUyXVQ/oSlSVjUiPyMR8NOf6ntIj3Fbd6Fnv3XFVQKVw6jZorjnaCA+tDttQ1B268h8
	0OUjrianv0XHmE0+6l55J4ZvWiH5t8xZd7ERQ96cXQDotPIk23iNZiVivYaY1T2iPjUrUKXwEFs
	hINhqHi37KPM+p1+jUWQrBnAEQ6irtJCw3c1aEsqpkdBFQjJQbb44/MZxGG3ZjuxeEggg2Bpi1D
	lWYTuu95stJqUcR8agdE7Ej2E=
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr2762598a91.44.1793395179986;
        Fri, 30 Oct 2026 14:19:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr2762574a91.44.1793395179529;
        Fri, 30 Oct 2026 14:19:39 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ecaf5sm5291016a91.16.2026.10.30.14.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:39 -0700 (PDT)
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
Subject: [PATCH v4 02/19] drm/msm/a8xx: Export aperture helpers
Date: Fri, 30 Oct 2026 14:18:04 -0700
Message-ID: <20261030211928.45761-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX8uaEGEZv8/UR
 V6E56lDG+WMtDSMSiLjIVM6vbODA/J4bCVHEe8M7vtemovvKp8zpKWtkMFoFRcSPrFggLj/t4xu
 BiFpCe6S0Jpsk1PTTLI7Adxr66IekqU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX3844jJGXJQwF
 E6r2tscGj2Iogy5c1MVTzXoJpElOd5f2M+HidFFRqTluIeZh2C7tz5YdNPMoMvJ/jmp4h5FlW+1
 N1Ac4Bbx+OZUrNix9xsw9vh4NbmSukCWTcOkO8pZxiEa/1UjRAmeeRz8XOeUzM7xSm0+4TU77rB
 Fmv0In9LHEF2SuWTYRxH23lV90ZOIgwTMgh+chgx53ZpInhlVDcu5b43KK4muKF+3krIjwad/zt
 yQ7FsEisqruYAQAwq6StaD3y1ec+KkAIXD/GJ2nKeFjZmqsnboTouaCz/0LQ2/RPHC3oFYBlLqC
 TjVs1kwq9y0UTWKOK/O/VxnGBh3hWZMFDNqzbHWoU1iQGZichqp2pSNQGBsVhlar5TJiCX2I5Pg
 dWk0TuJcpzrwvX+CbE+j+FN5tZzrlQ==
X-Proofpoint-GUID: 0DzwDBo8VmTUw5KBNt4rA389D5EQIKNW
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae509ed cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 0DzwDBo8VmTUw5KBNt4rA389D5EQIKNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
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

