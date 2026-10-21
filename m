Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615964;
	b=vC+b66T76EOZ5DVQDC2iSgZIh0VilSYZXq9lICTkW8LlVrP46/BLi8Abg4Ct7QvRxpnZ
	 XEfl2u+Qs059bU+yXVRXUO4zLLWfl2wa2skvd2CSyRapgIWgP6urB2se/V28BvNPhbjqr
	 2RQ8yHMXPowS/shBI4ebXqeVkuun9omAh8CCxKczFFQ4tCzKQ1iLIfCaVHBdF8fVk3PDs
	 MU+CI1katvd/oZlEuffq60tdBJHRkuAzPuW1J5f5s/cl8yd/nO6t94CtxGdKci1RZsJZn
	 8XTnNlmrE7u9851uSKbDkU58Fb9oUsfnBk1Oxtw7+pcbBl1oWE7wkgnWJ0qmMjF4NvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
	b=4GRxbJ92Z11JynvYgtlG5dZ8Bl98K8ZCtx6EY3035MK033L3XCKroeLh3XQMaH2PfhWw
	 Z6mCA8GMwgPb09BaLf3biTZE3x6W6/5ZJRV4dRCj4H2ErbmmNF4IXK0cy0C702lZsIpEj
	 wZbm/Meo1/OpUA+rn17tOt7Sy02u1L/dv1otSeQDyrx4XUeG+j7Da7peT+Dxpzo+xZ4db
	 IL+ZKHXhU+ycU1hZDnqHWtBSa17X/+cEdNWzZP0hZLZKQPSPSeWEglB4eqRl8SZRjGK0E
	 Ma3yosf8MKiHiYqATHpXf13vYXWmeRy3lfRWy8AP5ecmqWAfI3Q0uBq2SgTcF+oOcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ly0FNyEx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgHe3jj9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEAB606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EEAB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ly0FNyEx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dgHe3jj9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKe1UI1669514
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4iyKi3o3dnw
	WyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=; b=ly0FNyExJuhZdTIu082wFsqv+n+
	WqfHM31IhO5V97IzDMFzKjGtNnV3vrRKAVnx1n7inyfSynwK7uNqrSNdo/TpFzha
	A+3jB0IEFtID5ISzIwB7G0LGoiUMTByyJ0Y9nZUm/T+KpP0ijh2L0yVBgTIOCzS/
	jJHB1XhwMgHP9uXuVaSXBrPJstNOL+MtCVDW4ar2+nV+x6In+5iFwskdKT+Y15Q0
	9tqy1BaseywKJbUZDuqRbhKdBasC/OZ52OMCpShWSLXq1XEei0GN+xVirjqAl4QK
	tNabLC9Sbg0peBuC49BygLf8rmQ9sT0SJ/j3XWKj8sV1hMCFkDpCmrIbNNg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf2cq0jb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1118147a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615961; x=1793220761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
        b=dgHe3jj99DSsi4+5Cu30mS9b0jLm/qTXuCrCSgFex2g2M/KM2Pre+UdcrVV+ll0sEz
         CppxS8oX5kVOc7RMxdiMfNUviBV3AJLpb5XHAWh+RzyziK1Iclgh4G+OtPTS/NSu0bvv
         PNvK6gPktC2sLkRYJgJtd2WXisbTx48oWQqFL/JR3JyTry8KBsujSWwia9RbOYH/egMv
         0p/GSjY7Nnsz6YNLe9f5lRpcNIPc7b1v5RHUTOPxaf/YDL6WOoH/FMdnTC5oafbAO8R+
         DjXKhjWzAb6gAU9ctBkzZCPPGYkKkAp57HfTbxPmpKoxYaLfi6VND3tQVAPXyMfVP2ls
         5HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615961; x=1793220761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iyKi3o3dnwWyP2nsGvDx0M5Mc69Qkq1oajv+rbaqtQ=;
        b=Zqj+gPXtt8FHllS8SE8jz9vR2sfsmLVTmcV1auRLOHP1twqWLOhJwNV6/FzXInxia/
         oPQQUjL0gRzq2+bSNN7V34VE7qkTdrDBTuAfAjNsBxTApHoVPNQUtH94A4FYo84Q5z+A
         +4f186fRIE6fsuFdMq8Tij+4HmA0nxmzHavVx/0t3kn5V4e75VrmELzSrXt5XzfNEejq
         cDOkovYRuY4ftf18X2ZkU+GNcjllLVQDdrqfoW7+rZCSO+UiRptYsqgqPPYycUjPNxT9
         NNCJCC1Te9qJv75+vfd66xYKOk1r7Xh+dBaP1SfSKZ8fPBb+S4irirbg3zeOO3PyE7KX
         IzIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmqXqEjiASxy4esoSg1oUOBqrNZLpKgw2yX7pPp0nAd/PZCoNiemMBvTx1DV5mI/rzXyAeQZjvNhwQUvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDcDK2S6xXkMEs3hp6R/hFAOAMYqh6VxNLLQ4eyrjnbxFvcNU4
	b4NtgW5QuDJuG81XOeXEXp+XZB8c/XxzZaz1cc+oPdkrDA5CWLOag9vh6YM+uvDm3qNOxk5h+Wk
	ctyis4QbXke9CtPDVZAfYjKw9QrFuqdsMOYZJZjwgRS1gfGK8LLuEtcUNfPp7Lp5thQg=
X-Gm-Gg: AYBFou1nzDs2XsgHj40vhZjtW8quYlnpzYdfHz1A8w9EwrQZoVgsqaA6bXBPaBhyumC
	Nw5p4tql4nZFwcHKm8VG/CkzCFLaaHtjRi7LGj6V6YUDkOgcLzcD5en2pe9CIwdYKR5dpc+RS0x
	yIAe008yZZ3/3HMx/cN+bGYZqeNWwKtLlJecquQLVU+w0ScjFOC9bITReBnSaOV0Xk7wxl8oHoi
	7R3TPnny8cyaFN3Qt33LMVP3pSyP9C/OA/r9quF1fEkhdilJt8jwYq0p0LxC9XD3i5aOiItbsXH
	Rb7l9OdxPFYr7naE+go17atIIkgk34gjYgs7nJEYGlvCcLkU6EtXcneMhWoLejckXKpbbgQo6/z
	wYfLzrlGWHQ3MZNXoDshtBak/yZd4rbG7OXX4+uSt8JG++W9AZA==
X-Received: by 2002:a17:90b:4ecd:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ad86cd5f8bmr2490091a91.14.1792615960843;
        Wed, 21 Oct 2026 13:52:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4ecd:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ad86cd5f8bmr2490063a91.14.1792615960340;
        Wed, 21 Oct 2026 13:52:40 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm1025666a91.6.2026.10.21.13.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:39 -0700 (PDT)
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
Subject: [PATCH v2 03/14] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Wed, 21 Oct 2026 13:41:28 -0700
Message-ID: <20261021204244.67160-4-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HLhWhYtv c=1 sm=1 tr=0 ts=6ad92619 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Nk04i-AZO5zCS72CTv02cmw16MLzYsvo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX0d6jvJOHzMOc
 hhz7jvHoF5/0Gm7SA38zAxi3CpGuRckLEN5n+B1nPaHPIfp8Q5LEurLusXepSXXa1YFsbKCv93n
 NrpWT+QNNzA5WVmtFD5ylxgPRT43VNk=
X-Proofpoint-ORIG-GUID: Nk04i-AZO5zCS72CTv02cmw16MLzYsvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX+x5y28W1W9YA
 HTKzOG7x6pqdW+GKrkVEFPcnx+hzixM0cyGL1Eayi6GM3cC5R9EVwRn9o2m0T4SgwoLS9503GOz
 X5N4c11g3lDsFYow45XAoByAwCTmXmDgW/iseLfPQ+nqpyasPrFIBezrUILUGzq2X5WNXB6QEqR
 fy4NQ0BwnKRVy0sCltaJwivAUosDbQ93FIXvI1SzkwAdmM5YMbQtb81+Diq3GUqc5PDnk/2sEOV
 QFjYUbFAjPFZVu0HdFXooZBclrWlBRm/LOun5BCnZjKPSb2XTuKl/s1iIihwm996FlDkQLAOAwx
 sw1/oQjMHckQA1q9MSN4wl1YG0A4QJ0iSbz1z/kaMwBoIjs2t+xofMcAcenNj4ORZRkTcukPYU3
 B47eDPx/TFtkBPCQfZA4kXNxLNArVS+2sjTPd+xWn9YJZVIvu0KG9Lv8LAb4fSv2zpYV6i41pW4
 tICfsnFWAzE7O5m3Y3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

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

