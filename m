Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657066;
	b=rTJz51JcjlN/l6sPFEbzOOjKpKwQ7jMnMWl58yJsSs6Vp/9f0rxq0nW3K1jxP54NBw83
	 MkaYCOcZzb/8VIlDzMmnODJgsOIoD6wFkJR62hkHnz7A9n2T5T7owFacwJVzsSNk3UcWl
	 FeyHPp+ICbKk2Tug0Fu6YHwKKPxoZZQde1qK0y6esNJmh/1IWKdHig/BNFEQ39IYBcvIk
	 xR2r1TO0Di8lwWREAVDMqkhEj3/VdGlheikrSyv1tCsb+Hnlf/HhClwKFn25pPBFg0LZw
	 KMheZQC8VAhc0BxUQ6wHXBeZHKJArPDCQMZ2wEsaTuRbIk0arbP6zpDmgRQmDnfII5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LhftlRe/CSUkquCFXDIS3K2FDp/8Q4a7FKAFxyGfNM8=;
	b=NRQc3Nu0Mvfk21ppCgaG9EXHPxqy0AX8ZbwPShkGTGZSFFfB41MCU5dsomawgIkE8YLG
	 uRJkwBNrRBBSMeCrdRmaJihW/7POu+IbCZ4Sjg9wOZgsStr/5HjrmNuBu/oOO4aTCsE4j
	 QpNKGZIv3rv+K1y/7+SRFXrL2KNuqnKsDoPtujhBfEys5Ruc2qL04ooI3gRo4E59OSQeI
	 m6RfKHKDz+GBM1jEitiovRz8it25hxJe+gJL1GPZPL2UIp6BXePgew3L8nFPPAEHMn+0z
	 F6QwMrIz++FE1gyxhrZxyBWMB5HQeSV+GxOBKwEEry2LSVMGXKCm0xM+vZZmA4M7apw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tgc6s1DL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKlucL34;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8792606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8792606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tgc6s1DL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dKlucL34
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Cg31746253
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LhftlRe/CSU
	kquCFXDIS3K2FDp/8Q4a7FKAFxyGfNM8=; b=Tgc6s1DLZF1+E7qBWHc6/9jfRNr
	jljhhd4stOaEuwbamP0X9tI4+c5iszgkoRx5uYHx0+lHnb5mDZZvpMfpxaxDinVv
	yGbfCpHpY0a+VtcLXSVfamuZkw1dRnQXd2OPxeEneQ45DQnRil6BrRFiXRNavlVD
	YEgJjIu+NZsGENap8T+4DI2QV/QJjHFfH5JO9bvKQVRqCOpAkUs3BuosltzeB+o6
	BJnSK0JIlxgha0KXThLzPVNamHGvuExgx8tejw+/w6fIebJ3cdHKwn8VHU0mmhv1
	+Pg5ZfT73AgG5ceO3UDlM2kO/MF2vmWig8yserdTADb86iinLbAll0QDesw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvu3mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso4430562b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657064; x=1794261864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LhftlRe/CSUkquCFXDIS3K2FDp/8Q4a7FKAFxyGfNM8=;
        b=dKlucL34B6tC1rDI61fllwLVtgMT4A+HmbUyRdwzoKma9q+6CwJTXUtOYHzo+gTC4a
         HW+kGiHRiBjMGoHS+ZLJLCIcghgzHpDMdqaVFl94N4QhqrIz6Mg6lHyjOSJLOdp2K/3a
         8udRwafuzt24xMV7x8qOvt3WT5iSNeeuRIeo45daop/PvMWSlByUvWCt7iTIH6e6r2dk
         nlwv4NkZIa5naADUgd5a3HLh5yKwALoZTbSjrwniNvVQS092x2BVmUH8V8eDbm+dgCMt
         6GZnV5ivQksRoyqqSk6Oh1HjtKkffyyEkJdrpRczGHcdbG0sWm95GDxk6cSvTnkecAL8
         SJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657064; x=1794261864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LhftlRe/CSUkquCFXDIS3K2FDp/8Q4a7FKAFxyGfNM8=;
        b=QvDzmXCBAk0ajk2I2Ajrk+BkFrJyw8vQJ1BnP5EVRrR/rb4YeLsIE3/SYr0zEzbyG9
         CPxSlgY8b4D8jnSGaInG3yULEqWTw9COkYbNP9AslnYx1anZ+BrlLc0lGr8BJB9hR9qn
         eng2P3ZPBortGsePpwvZg5eFDnLm91qayB+kfNbbNxFDE3ilgIgr9jBaYJl7eHc91Jeb
         e1D4l/dtj1H5xsQuRmHe/04YWqAzz3alUvaBhQibkd1aKnLtXQARsZgCJDNHkMZEnwqy
         eKzW06kDTMhRpDh3ciaovQqdg4kMLJt3RvX6ICYlYCs55/EVN/Du9E6cARZFEGlqjM1R
         40Gg==
X-Forwarded-Encrypted: i=1; AKwUvBwEDYyJnwuTaBLZwjtxtPB2DsN0/luyDI50r4x+d91vlTnkpcDU2Ya3xgpj+gf4J3FNTEsiGVS6S0Cla4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EU0viIkibpLc/EoguX4w+6lWmRTTkW/MDdhM+BVw2Uotng+9+
	LYFwYykXc0FTqqqjXiMycfa5eK1AMMrK8wACM7uguSpePio1v1FeT68H95sTqERLaHZ0UPeqUc5
	pS6PQ+FypQUKJ9whWNGaPOM/0mqkK/p3HCaJQ1koDgnzqh8CTCZBmT+ryXFqY/C7oFNA=
X-Gm-Gg: AYBFou0i3oLhMzuIbIwL54Nzt4+1qLLgtQaSN5eBrLZq1POwJB5M+zTTU70+wxVmAhW
	QOfpciwb5T2L1H8uEfhKdr9m5qbEl4rh8FiN10P/Tr9FnqaYyTB5/b6Ut8ahPbeqk5cpxtMFNnE
	ZE0KfoErHIIGPw9xTcjafrmddBX0m/7nBJloE1ryR0VZZe/o9p8jLhuvjs9U9paYHO609eSSJzg
	y40YsCSWKFe7y2Bp6Pv9IUlqZMYYxGOXPbGcxbb4ch9dt+f1FQzoaRcAtuU+LizZ0JXT6q4c1Vj
	1T0Emj2cCn7hZ6m1uxmj4lK/SpE2DqwNj1ppfbZlN0h4jzKLnaLw2mQpAqULg+I/hOHB2eV9Gy1
	lHg2L9JHXDLrfSSrn7ii554bpXv9k8V03KQzsApsZFcCug5TuVhjFTqE5dqaRHdcrO2TiVExHrQ
	ElhMV8xKqruh0p9I+IbMlfYQ==
X-Received: by 2002:a05:6a00:1bc6:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8a9be1a0cf8mr10090903b3a.16.1793657064269;
        Mon, 02 Nov 2026 14:04:24 -0800 (PST)
X-Received: by 2002:a05:6a00:1bc6:b0:882:8aea:fbc with SMTP id d2e1a72fcca58-8a9be1a0cf8mr10090880b3a.16.1793657063749;
        Mon, 02 Nov 2026 14:04:23 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8abab0c6c6esm2037507b3a.48.2026.11.02.14.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:21 -0800 (PST)
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
Subject: [PATCH v5 02/15] drm/msm/a8xx: Export aperture helpers
Date: Mon,  2 Nov 2026 14:02:46 -0800
Message-ID: <20261102220405.30730-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae908e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: XuLSn9W4sXfSRVCvGsc1P30wo9Kd12a0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX9aJH6HQ3mjq7
 kJu6meoiBnfk0NfbpHwgfMI25q4t9/9H8vs/OtxISOX77y5/XUcxYmlg80a42KIjxB2s1HhTuqU
 BHU2L1ydOUourLxhqt2hod/x11ViYq8=
X-Proofpoint-ORIG-GUID: XuLSn9W4sXfSRVCvGsc1P30wo9Kd12a0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX79A4K31ghthp
 JOmJGikFP7IxMFfpWOQNpFErlzpIC+GAAvKup+gxJEmeXWPwnIiIoY6uLPcl444yvU83cTMl7mh
 9RhY10gXghClP26d2aTfKQKu3+ZkBlSnEayYaQeNgwZ9Thk691jhhxTlzJWl/SVMZj0YlGezfks
 t6si9vZJ/KFucxkc6KOeWx3GGyU0ei17PosalnhbL9T4mYdjt+moyvzJ34P3fozhCimvfwdxfrJ
 GErjG8IMryX/BC7V8PUIncUMe7197TOM2bRn/klj25749lKCVZ7ZmK9BAPQ5nOhY/7E9WJR3Lcn
 aCRsU9FlEA8V5BO18llhGOhCDQ2YSMyO4wlxYuoxxpVOH9+RZLXSMwKgFm4ctyoMxIJK7+4zKqn
 uI2wYBQHOqgLU39TAKdFNbGf3sbWoT0DjR1hvO0cH7P6ucTuCsKxWsb53DvIcONDgImDuZmiG2E
 V5wQtDx0Q9HfmBE+nhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index cb0ac27dacba..46e2b921f4ff 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -349,6 +349,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ecf15a8f68de..afb115c3d7eb 100644
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

