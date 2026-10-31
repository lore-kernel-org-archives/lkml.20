Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463133;
	b=f4bvD4dO0pcI3A5zVuKUT9EdD0J1pqC5ehPYn3wqzHwuixkd0z46nXH93EkRomdmz4SU
	 vgAHUbNjSpX8kkspLpYRh56Jr0gnVuEEHJC7IJcqEQYH6Pz46+Sgr8SyQCMsyuYa+IXg7
	 xQNJgCQB40wQpi86hqEiYpicGFSGedKj5rQcFCqvqePS6KGZiUeX/Q6YZSZVDt1ZyxHKy
	 XIIauo8+jUpHVUoslf+JpTpN2xjuhVCJijlG5QN1UHPQNYZGa7Y/GWpGBAwIscOzTt3xO
	 13RStZ1lLJgpihkXjmFqRBc4jNYEkSIMmCVlQH2kyOU9T98WHh15MP1fVKrMaOTPeFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YlNWAbWxc2wGAyprwee+/8Ir/9KyjTs260dvwuhzGw8=;
	b=F20kVxVf9JQ2+WISgm9VS+z34GGL8tn6g5paNlcwgNOerWh0mxZxMconMiFCTEGBYvNu
	 8RVyY5Llq893jxIu8KQCrjTSfr/IgMl0+JDRaXqdmSs+81NA3rowGZQhCXKxJz2EudW5h
	 ucIAQFrb3FLSY4d6pe/lYXJUS78E+vVpwuAICG0WmU2qsxgppGHck5HO2n8UwYEfW5dqt
	 20lDVtaZrE4nmXH82eWn7PV/vm4juvCcCoqEestNlE/3OlGYjF2pmGuHHtX3if3U3JASz
	 9xC15tpHpiXZmLulKn9l3jAysc81drc4wZ/agqZjS07iCjt6PWHIKp9Sed1jklMY4XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ul+qqobJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cu2qe4C2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1CF606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ul+qqobJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cu2qe4C2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxxM32787801
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlNWAbWxc2wGAyprwee+/8Ir/9KyjTs260dvwuhzGw8=; b=Ul+qqobJ51OrUyVV
	CjXjwQvobQ49QFcavLbVkrWBwooT77J2i/NX9YsVJueglIxSQIEaoct3kAQTUVEl
	4XFf2+vMX5I2adkRprrBqLk1TR1k2QREr7CQOOlJIxQmR3zIJITTXVvwUwFGgh/E
	cSiE9M5/WlAZh1WSrnLiULVx9PYbJgnyyi81Ab+TxUhnaVM1KD4cKl/Zsjcqo+iz
	2ydMYZC5ioj2ZsxMKhDnQ+AyhWI5lZYRdnROxTUPWapLm+08nvN4jq8RjtafHJgN
	4FhlMn608LbAlsUsfAB9aK4sRo6DziI/ubbpKfb6wL1tJp06vPZRlMBsyvfA/I6h
	TlkNTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxhhey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso243213185a.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463131; x=1794067931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlNWAbWxc2wGAyprwee+/8Ir/9KyjTs260dvwuhzGw8=;
        b=Cu2qe4C2J0Q1EtWZTDKxb9whGTsX6v/7biznMDWNwQCoRSl93pBfW8dxb05oBStbOM
         0gTDTpxfP67aLxcCMjzxOt0cxl1ltni1F1Y+xhLEnpu2+ZJe7nMfTnLrQM9dgYbOijzq
         wRszNZgvwG7pVuBkf12yOm7pZ6MDIfO8VIv6uqjM0BRThRciek7e+7gHNYzeZc3PeoB7
         LBL6S0Bgc8ErTO96lCLl6oCz6cwTZqBT7+OiuwO1nspzbCr0KgL5IRETFfvqUwopRSBw
         EzXKe2Do0k+/TPykJ/1YmXZuyYuwqXEjWmCf7i5UzkMgi9fAOxmXXjbR8oO26xSRrb3b
         yw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463131; x=1794067931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlNWAbWxc2wGAyprwee+/8Ir/9KyjTs260dvwuhzGw8=;
        b=Rs55H53fhoyEoRzU69K0wVNnMXioYqYvnYzDJnBaHmKqgW+s8jSxXVGVDdUQnIEkCP
         Cub8wZblKWQehU71eKjFn/7AI3tyFunJ6Es/s6Oz5mrX2Ni/PwkNM2y/O6aTDc974unP
         XpuWH63ZLBlucyRSMVnst5ZODRnKTnQDHEfpi5l1PzXDlgPf16BEL/hvf/aXEKBc+5Bw
         /RD1QY7YJQHO6qqIGESYkG6JhZYjd96HtQk6n1omQqYzZVr+osQxtsfFKBySvbFzOewX
         Mr611vLQLzJm0fvdxlszD2WECnNA/tZaVWXcSzhdZLNpXQhLk5EKWQ174smOZeSpjrgi
         i3jg==
X-Forwarded-Encrypted: i=1; AKwUvBzMobbpm7Msh29JR1uuujz7qgVU4uLjL6+rTA9Bah8xkRn8HTTN8Di99gkyQy2GAntCfNZAntcB2e+fU1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxbH8ZRFzjltASskFmBOvV2E3tZASfcxZwXwlP1oEJ/FZb8geI
	KfGkTHEDJJrhNjfEynTCuAKAQmg/vmCO+PAL/SijZXEhHbtttuGs1B3mxBTMXPSJ6WAMZ4Y4Dkq
	N/1X6nzeCdmhjFSsS9/HDlgEPRKKpoNNfCxvQKWCKin3HMPuAmt9w/9mnVmQMmmUcP00=
X-Gm-Gg: AYBFou1dcIsb2WOJSm/piGFYUJCph/dyMJXciPVG/t0LsBBR+pTQ5zsjZ4vrov7KPjs
	eJ1Uz+AuNMfxFnr+rFX97p614gfEZgzjR+7jm1j/Oh70fCLjia3u45jT5lICtn05tEC9646/QcS
	hjxpymlfgu+X/Zt9E9EkekyJ8KUBOG3OJScH0fEOyWbCmSD7Vf+/qIRQzG1uc0flKZ3EUoiHiqw
	o3vf1kKoqKyYZsZqr5ma6WTboGRKNq9Fh4clBa9JH5qShpIRcxAFrIY2sD713clVNM2//UyFl5H
	P/zSdpH+dZX8+jvZA4MqlcBD3FzBJyON/pd2WplZazjpC4rzgPUlnojftP8+v6eiRiqZfZwk0al
	MQ/4T2gFFClkJ+3uYggKKAa52HmMemsi+E2eSJGkqJRlKFZx7SQMDStCe/xwC6faGzu+VB3RnJo
	hYKR6tuY1/X5aqMNZK2grI2gsuZ3XQrBGRCIuFnkKMSEJYqgDHKEWR14MFbI03og==
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr964914885a.71.1793463130915;
        Sat, 31 Oct 2026 09:12:10 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr964909385a.71.1793463130295;
        Sat, 31 Oct 2026 09:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:11:51 +0200
Subject: [PATCH v2 1/4] drm/msm: share a page of kernel state with the GPU
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-b4-adreno-timestamp-v2-1-0836856b228f@oss.qualcomm.com>
References: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
In-Reply-To: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4278;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=devFZRDNTr6q6aJyRKFG/wEH3BHC9t43r+Sc04fgzcg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5hNOz9wL/xUO+pSkXEeVhIU4b1JPmDaik6zm/
 nGpO7t6ediJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauYTTgAKCRCLPIo+Aiko
 1aDPCACV4otGXIUcaP/Cai51XWlkQ5I0qL+MXwcLy+AmXSLy4auKgXOOnts7LrrT3b/yExLBlUp
 uRnSjveAEV375p3PLLyZM5PqMoYxu23WDyL4NC1j86/6YpXZhgeXu3WzKdIEPtBMHy19lWgDHV8
 GRiKalOFFV4zlNJmrDn4uo+J6VRR2Q48pZMf+lW1j0NOXJDCZnRnRm5W2DqGZiUxtQl+Ws07Rgv
 Q77V41YdSomCvmkIfmRHWTZwggFqByCieRAS4rghDV7CKlc+h3Oom9X91HpfMWYFRqNIZDVxpZB
 LbuNi+8GbeoZn/BPiEosWV6R/BEp6k7WKeVHs8c9iKV9hg5U
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ptLPzYuwqFSN_-OAASZ78wBB_rd8DIgj
X-Proofpoint-ORIG-GUID: ptLPzYuwqFSN_-OAASZ78wBB_rd8DIgj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX7G72ylb5DFO5
 LzxEka6uTnyKbdIBFwIvN4wCiqY6EYn7WqY6csP3AuviuKRSgZR1KuiFOynSHnvHw7r1dhQX1kN
 +ArSbT3Z9ARHSVegLbXT429KL1zN9VQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX8IUby+gCkTAX
 I9/iRpVY8gBAAiktBYYyysNYsHL2Oye8KWstr+iN0h/cCwBPEqXv/uc6w16m+W4p+3AKq9Po3FO
 miJPYGUyn37x0yAouf0qd3SkNtlxcUtATZzsmZG3s0akA04pKbVYewkIX0CJ2fXT1AFOgtCQKzY
 kQt+2syh1c9nsF3WbBG+e0uNfrvr6xm7A23owJnxMnDVeMUeoErZvK7tvtGye9hwJ1rzHMrQ5Di
 R+DgAtH/H8QhPBtXO5yx+DDNgHOccmmqOZgrzrqOreY0P3GjBi/zdESatEhTKFoih65NNWhTZCX
 KYdIpv2hlH1+YiAJsS7pbaYdz0R28PA9QHuqTR2/6HezjPjKEdIYLPggKmAehftvfaSYlHZrHk5
 sXOBjCyqiVKh4vy49AQ/x5yXxGIJhFcuPum5Nhy/c1L6narsrqF18pU944yLIyxH8QJAGOW8fgq
 jIE1vBaHzoYzRVv8FvA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae6135b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Sjt1sVUzr0hdpTIL:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=h5xwza0VLmx2EBWN6JMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

Some state the kernel keeps has to be applied to values the GPU produces
by itself, the first case being the always-on counter that restarts
across a GPU power collapse. A GET_PARAM can't carry it, as command
streams need the value at the time they execute.

Allocate one page in the global GPU address space, read-only to the GPU
and not privileged, so the command streams of every context can read
it, and report its address. Start it with a flags word so that fields
appended later can be announced.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c           | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  5 +++++
 include/uapi/drm/msm_drm.h              |  9 +++++++++
 4 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index dadfe4c69438..0adf56fb9563 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -404,6 +404,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 			return 0;
 		}
 		return -EINVAL;
+	case MSM_PARAM_VDSO_IOVA:
+		*value = gpu->vdso_iova;
+		return 0;
 	case MSM_PARAM_PRIORITIES:
 		*value = gpu->nr_rings * NR_SCHED_PRIORITIES;
 		return 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0c2c35636251..747cd90e329a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -989,6 +989,19 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	msm_gem_object_set_name(gpu->memptrs_bo, "memptrs");
 
+	gpu->vdso = msm_gem_kernel_new(drm, PAGE_SIZE,
+		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->vm, &gpu->vdso_bo,
+		&gpu->vdso_iova);
+
+	if (IS_ERR(gpu->vdso)) {
+		ret = PTR_ERR(gpu->vdso);
+		gpu->vdso = NULL;
+		DRM_DEV_ERROR(drm->dev, "could not allocate vdso: %d\n", ret);
+		goto fail;
+	}
+
+	msm_gem_object_set_name(gpu->vdso_bo, "vdso");
+
 	if (nr_rings > ARRAY_SIZE(gpu->rb)) {
 		DRM_DEV_INFO_ONCE(drm->dev, "Only creating %zu ringbuffers\n",
 			ARRAY_SIZE(gpu->rb));
@@ -1033,6 +1046,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		gpu->rb[i] = NULL;
 	}
 
+	msm_gem_kernel_put(gpu->vdso_bo, gpu->vm);
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	platform_set_drvdata(pdev, NULL);
@@ -1050,6 +1064,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		gpu->rb[i] = NULL;
 	}
 
+	msm_gem_kernel_put(gpu->vdso_bo, gpu->vm);
 	msm_gem_kernel_put(gpu->memptrs_bo, gpu->vm);
 
 	if (!IS_ERR_OR_NULL(gpu->vm)) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..f78f3bc62977 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -252,6 +252,11 @@ struct msm_gpu {
 
 	struct drm_gem_object *memptrs_bo;
 
+	/* page of kernel state shared read-only with the GPU: */
+	struct drm_gem_object *vdso_bo;
+	struct drm_msm_vdso *vdso;
+	uint64_t vdso_iova;
+
 	struct msm_gpu_devfreq devfreq;
 
 	uint32_t suspend_count;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3d363f12f66a..f8bf48fdc339 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -118,6 +118,7 @@ struct drm_msm_timespec {
  */
 #define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
 #define MSM_PARAM_AQE	     0x17  /* RO */
+#define MSM_PARAM_VDSO_IOVA  0x18  /* RO: GPU address of struct drm_msm_vdso */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
@@ -127,6 +128,14 @@ struct drm_msm_timespec {
  */
 #define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
 
+/* A page of kernel state that the GPU can read, at MSM_PARAM_VDSO_IOVA, for
+ * command streams to use.  New fields are only ever appended, and the kernel
+ * sets a bit in @flags for each one that needs announcing.
+ */
+struct drm_msm_vdso {
+	__u64 flags;
+};
+
 struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
 	__u32 param;          /* in, MSM_PARAM_x */

-- 
2.47.3

