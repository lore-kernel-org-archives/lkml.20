Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007365;
	b=GbuK5x3gJ4how44z9y2aCbc/jTAaGOTtwXxQciYbPRS60WVKgBCEG7z9XduitxZ+wGCr
	 R8gS1MmffOBa7yNg8PrrGXo0SP9lZ4fqgfrxW6E2V61NdRGeScjT09Nab7QLI/o8Yx0z/
	 0pXMUjCbUsSBwWZfw/dSKTYG4GLlu3Eq/qLfEQ7amzWqkDuUkFBdqDHcCAWJU3AXZVmnI
	 iO7zCdNUctUmCYQ4H9eNy6AXo/2n6NB2dkzTNoLOXUKnzdvZT2QNk4qF4btx6RcO3PdAe
	 DDObge+kq2I2rEXNJuY8APrB8z2Nw7MWwVGJKEdvYSgcB1lmwWPmxdnMi24aycEBE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
	b=SYdnGrE/x1L+yoFtSObwmQdRmAaMndkSEPB5tv6oCQkfThRkU0+hwQ4kooO074uHXSDB
	 Vap8kmzP0YI2+blWrlniLvZ2kBJa82rwKMIdpGVjRoXp56+cLcBvz/p+VeEnqbzCw2fPq
	 umqaSZTvJtiQBwlxhAZbGycaWT1j+fAXvusV1k43okIpXoTeKcs5ApU5Yb+oa9rrw8XnA
	 0mOpUeLOb2pP5yJcdWfERUk37TEev5zZ7S8P3uvPp6/6B1ZcbsBKWR9bTBU8JCJb+LuEP
	 6M/4RVeYtb+6hnK3OExSAPBG6jzDq491uK444QnxSIONIy0IA+M7Zq9kTPKWUVBgm9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu0kvYhj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FxvHMXx0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70728606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70728606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu0kvYhj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FxvHMXx0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo5W21714203
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VPp9DF6FAAA
	hRErFGqfT9QbAEpklRskknKR5KtgUiPY=; b=Cu0kvYhj7tB/OM2arS2p0wF6Udc
	mb1okHrMocb9MdEpYHZwewF9r5wORFgPUoKobjmf9UxKYlUzZ46d6N1NWYrmGxcv
	r0uIl+cRyBZeDhj7dW60k3RidEahbdnZ5gvvoSQ7+gAsBOjAEiGZXvnOPEJit3Zo
	QAuysBh9dBtuOv3maF1VVuwLMnfKzboBIuoTpoW17AI5/024s2xYeDCfaMapTEnb
	p4uivgN8lujzzG83laf4ckmybzlKhVvzHRol3vfhily1FzWBh+OskkmEQdTSMdfK
	JF3YxIIou66UjfOTA5MpBXy+7At+bycshZxUqXSt14jAe0IW7rpvVj2udiQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmywrqq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a073778890so980414b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007363; x=1794612163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
        b=FxvHMXx0acELgYWJwgt8iplZMkcjy0ATUfmJOlCV+GYcx/gzKmigGYwQkIDKOY19yt
         BmG/883Vmus+LdUDeQZoOBH9+W8HeXgyQ/0/wsMIgbTyOBC7egHtZgzLTorS92Vck8G+
         GgQOjmBIWtiLOfU4sZSa4lRW6DO7xG3KkPWHcxNQfyYDucliRVQ8yaZWNEV/9qZ59/im
         6wDlmB0wxTOvsmJEvEZkbtdSsxmvIwrN0jKsH9MlNnz+Qr8KOq8xtW+MxyiN/8KU90E4
         0q4wuU8Qv0SBUugSILqV55oy8EFZzWdnWq2/G+Eff0f+j9A3EvD/vLCcqA8a714PFKK/
         UKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007363; x=1794612163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
        b=YWG6DWZPmEdK2P4CgCA3vg+bho17WzCCgQGaFnmxQCLqyM2cfp9L8FHWSiIWvfwI/i
         HBuY4mnd78b2FxFH9x0pMCQ38Nt3OLb6gkQsBkahiMFSX6+rlLCOGdYZGtcahqyQCals
         ms7DRK+Hp9rx4kICJg3NZmew6LPdEVXpsPOJLODNscwtBfuJugbbD3/qDZideBzPZJ8o
         94LKcwwW+2Y2Srld/ahG/YMkBjimsNs80tux1ZBid7Wp/p4VhqNOyEpQasJURChv6Nmt
         kETMZZGIaIsLLztbgLl3xB1taUDrgotb9A0Bn2rLMZloGCAMgGBG8CxTXuQXKw0Boorx
         QYog==
X-Forwarded-Encrypted: i=1; AKwUvBxGbsg3at7GE+RCcCfSverTUGweWuKqy1rduBfhoh1/ll0dV061/Ve5M6hAr7QPO69KZtbMGpKVaw/HeKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OoxoatSWkU1K5wpXXVoKHYZ63X2ve6pPn9r1wPuJqXfXtSlLB
	WVuvfKGDqBNW88XtEBBVWY4475S6lMKUkJCLCuLX8FLV/x+PrhN0wY5viqxaqVfLbc7DgkdFIvh
	NRHISvZIq5hdZ+ZA9rm3TXkQw1XDmyDSMRFpdmNJ/8Gl17zjeTFc1FJYcHdUs/mm3Y54=
X-Gm-Gg: AYBFou24tE2JrLD5lFCvOGoAvCmr5xSxZwH/x8fM2lftBz2FMqX5xuftdj/WBAQm7fP
	dMRDzXGL6PlU229lQuIQV6nH8LkCc8KWKEHKIZ6zjSD0ehHVBT+/6QrCyQYyp1cwF5wjDj634Yk
	gnvhQRf0E3XUMpLCytCb5rUhIjezEos7N4r/t4LcZvrwkMnKev4orV1DhKyfRbvGPocFPq/YuTf
	2qMsdg/EDz/ULSAsOK7Aw4Sd8G4oRPMfNzhH8CHOjU6Oqn3gdFLWQRo7XoPeL7Cj1FJpom4Xr+m
	0lAbp7bmMLmPVCkftQ4jBt6IqMMm/0Xgsqh9iPPSrAhLBUKP7uNmnPLKwJfbR2Y2ckrzVfBeLk9
	8NBykV/xNHGG2qduGZqUQig3rTOW2qtELcW3de6abgbczCcEh78jIH1oBHCv6lZ0IjrIZdNtxOB
	ioQGl/25sAijY9lquID9X3DkZkgYTEIV0Hj2yoHA01PrB5OQp1FpiPC103J38k
X-Received: by 2002:a05:6a21:880e:b0:3e0:b1b2:2af9 with SMTP id adf61e73a8af0-3ebb2aa0e0bmr3888484637.60.1794007363490;
        Fri, 06 Nov 2026 15:22:43 -0800 (PST)
X-Received: by 2002:a05:6a21:880e:b0:3e0:b1b2:2af9 with SMTP id adf61e73a8af0-3ebb2aa0e0bmr3888460637.60.1794007363006;
        Fri, 06 Nov 2026 15:22:43 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35a3b3a1asm971793b3a.43.2026.11.06.15.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:42 -0800 (PST)
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
Subject: [PATCH v7 04/15] drm/msm/a8xx: Export slice helper
Date: Fri,  6 Nov 2026 15:20:56 -0800
Message-ID: <20261106232220.47602-5-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=A6j5rKWG c=1 sm=1 tr=0 ts=6aee6144 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX23/ACmVzzMdM
 BGsDjFEx1Pl5BXCeSEHy9XAp663ko01XUpSoCqv6ZbVJtJgY6PK7Rv7uvEVnYAAzxtUkwJgg0/R
 Sep98gFr9s3wMemyXY3R1SKCxBFq/5W5l86RIqim+6Vlf9Z9tTaDvTs0/X/zf7eHEtRn5xiRzPM
 iYpGZ0NGircqgjVNrsRIOUQ8A9+S2/XiJafNQTK0EheiIUnVz3VxOUI0XT+GSDzweUqOspDCWdX
 MV4Mixm9bLT+WO4aLPj8cdiqOQjAR6GTGIFwMC8N6zYuNt4c9V7vsE8SR8gpAx8MzpfljdM+sKM
 aPPAlKw/3XXxtL0rWIE5Soj+l5APkPpTeQ/wqOJXsKVRsQOeB66B3tWz7/mEQMFO2bB22+2Idv6
 VtOQYwU4SgYFR4eItg2bkR3Ck+T1UH4z9dqLZ2nH2Jqf+YtzGo+moHC40iGMxGOcuj/ZtDeBiW4
 i7YGUownpmAR5serfnA==
X-Proofpoint-GUID: j0aSGMkOOr-8FK67qHFm6oslU0nN_Cr9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX8OupiWkcNgqF
 wDT94f01X5gDmvQOhS3VYU5toKsS5Xdm6HavwMG0oSufv3ND9SBBWM03iUl0ySVdKn3FHTOpQlX
 W4hfnvI+WeJ/ZToPFKELXu67Z/SAW1g=
X-Proofpoint-ORIG-GUID: j0aSGMkOOr-8FK67qHFm6oslU0nN_Cr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e6ec85b20fb7..4a3898e58aee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -357,6 +357,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index be81f141300f..a29f8149493c 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -130,7 +130,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

