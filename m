Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797945;
	b=aMh0eCgn1UYL8svIgUQjpWDjyEXQrzM5/STeGlrg0jFxCDP6dDtKbuM4kEJz3HrXskm/
	 ajMs7Iw3fwfG9t3G49tYV75HVlycKrNosmv3XMB0RdHzsf1+GJZxocFGUhvtC5AEoD6rA
	 gz758sKRR0SCpnx6GUarnqKOXh8htPbCMnFCZPQdebFDlMyGqx0XuYocDXG1dlpniBtTk
	 1frBQdaWpqe8a+U7ysyqAzTJ+sd1CogUCAUL2lOQ7FaiAQAvNpSDsJiADrwzGrepu+j6c
	 v5I8fKTaS4LwAJOYcbvmJL4VxfLz3mv4PjBEMDMb1DhiofRb6Rk/A4hLg6Di4p+OzJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
	b=stPReBTA+jYxdCi/qXjDKR8u5jEp/pHR2N+GVEd8t6uz9AHm8wzrj+YwDDzfe5mLPoN+
	 T1IXkXHSINq2dqAiYU3QakDbkbqqZw/R2Y8sa3LkJs+zfnWuoSpuTcIpXmOnhXWBiBdQd
	 9sI/0932xffzvBPP3R0DGHCyIRvAwgl7vUd81DjhEoEPAFnt0+u7fgSLCyxudZv3oGQ3h
	 DEowZwt1mgbD/Pclyk1wIsK+DoLp1CI6x16WVFMgqQguzg7NmgaFoN6tBbyQRFvkq/wJQ
	 vpbui7GkwB+0SolsHvfO36yUCwppEOW1EW4evhcu3UxMLoHeD0i8jkGqfD9/cahmP3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lv5xqKw3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDrgsMeH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78984606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78984606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lv5xqKw3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDrgsMeH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuuUx885823
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=; b=lv5xqKw35Ncp+fIs
	fV7M8GPHLSj6KdgNN2yAG6lFk6NEunQbnI36M8ixckXU4c2bvU2EiEk2FFQamyU2
	RPA7lNq6/BeiauXnlmmtghIDAF2K9jVgcb/umW5ySKWV/ZaBPXLP7mPD0nn2HEZ6
	SsQSe7CZU2lFMEKXrDV2U0UV6NnzL76yqDfLUt8t9+7ouc3dDyXoN/SwcnqgSGmi
	FJ5hWbkAnVq/SmL405kahlhUQyHaW8kdvSsBqqiw6EVmyRuOVRbGtQYQrLQkki7E
	ZVXBkF624Xl4QyrVvmyRSEFzOoLPxKKNl8bKEeZwpSeW1ozGVwsX6GjV7CQloWaa
	43BiOA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw28yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b861c0618so23102676d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797944; x=1793402744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
        b=TDrgsMeHZUp4d4J5s675EOSXnM/OW7ilj5aCup+Kqp269uxieb1aTEGu+7skqOWhOX
         YEUIYIa94aheWA67AqQ5iuf4tTPqbLYOt7W3F8/Z9PUsA9Lo3eeJKfr0nGc6aOJyxREC
         Lg4Z0OUtEsYm6oSDs2LRDBkf2lrW/gUGABEJVpSpwXw5y1ZSJNIgO8zcGGto6BXknjsh
         CHne/RefD3K8wLlpU9a4LdxmXuKXWWwfzSWkNHDGVwZT+WgOJSXq7FUKoWq0NsJ+hpV4
         1BcmLXv/fBJfNpCXiD1HCVoCPLS3sYxKFF3yNM1S29TLgFvb2ivJq6pCbOPUiXem3ApR
         YH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797944; x=1793402744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiQ/H+lk7/zKfY8sIc1ubl5QKrW3k0o+FiYvrYPjGHQ=;
        b=I2P3nP21tXZ4aMzDLdupiD6Tka/QE8JEftLS73x+EHKD8VlP1z4eSLy3SaSwc8aSqD
         8HhyXxL+k+tPtD4JuFUom8AZOvd3IP00KUFcurD1FrxkRg7lOSjxzMVcYtqOzo8coFBB
         b0q4UNT/oxzK1cHi34DUp7z0Bp2voklBLtV6heVAKgMur1qF2h97tCWFa6B8FmRUHF7I
         v2xU4ps2TUiDOK7nVbT8S0xUs/2PbwEZiM1Lhw5fnSPzRMbarw2p2Rg5/qM9g1KB1HC7
         yN4pH07HG/rNHwWyt/STJmJJcv7L8vSkbWu1HdwRiRfmMTAiVIIJRitDGIJ2LXuDM2ti
         /mYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxWtbQZNEH86hbMSDABJ8G6d82o8Gz5deitiRdC4QzKkMWkZklbu2+abJEI0ysGln8Izr7KUG2T+y9AAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwU0rio+jJEcjRPDfvUAV48uyY9M7loly7bh+Rkz7kF4JcoLYs
	R2OHPDeKqsWutgjKvv5do8Wm7aLe+TCHNOnKsHzoeX0HETlb4Dji8LYvZ7HTX45C8HhkgMOlOm6
	X9N4jz8Z3JZ/tFBDw/oPJ/9126vsnDN4RyvwrTgpvGpWJuE3TtOkaBspUzM3Vk6rIipY=
X-Gm-Gg: AYBFou02A2duW8WtEz1AZA55KK8BcKSo3cVbPQDjplFAAaQe0OsjaZ1H92UqhbiKM+L
	7J9VOt4XlBDsXUBFCJFWglMtzlqlsZMrxDmt7+XSmsWrHm2Kd34MrD8b/K5yxdLFECjdSLgORlh
	LjK89jnOjcZoEl1CEjBvLkBtlptHCjodTl1d/+Fp995olU+pvIRBj+yCiJHwjvM8wmphz1ZpLEl
	gAAFqJP5diAvpiQ6S3MXbhTbHB+mf+sc3wjX44AMKZdY72P3jgsazDPGqyXnTyjUBy0ghMpIxAW
	b4As6fGgCaCM90tV7wF6XOUayBTP90AegIRKfYQFB47tDdapYIUtqVPG+MUg7hKLLXb7M+Oo4ra
	KzaxeYEnLRu/znCMK4boryDjLj+D/Rbee3sJHffOt4Wfv6fEJNDbfabtis7GtppGsr+3RRhixi5
	ogpafLPGgnFGiU
X-Received: by 2002:a05:620a:4628:b0:93e:c12c:9dc9 with SMTP id af79cd13be357-940ef9d651bmr88681085a.73.1792797943676;
        Fri, 23 Oct 2026 16:25:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4628:b0:93e:c12c:9dc9 with SMTP id af79cd13be357-940ef9d651bmr88678985a.73.1792797943201;
        Fri, 23 Oct 2026 16:25:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:23 +0300
Subject: [PATCH v5 02/10] drm/msm: fix framebuffer pin refcount leak on
 prepare failure
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-2-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/Y4+Ew8bQbr3xd07TJNsXmM99kEeC3E5cOSJ3Rcs2qc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zmi8IM34DRGqWrJCYA9m0kbGboYUYA4FsqH
 KrgN2N/QGqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs5gAKCRCLPIo+Aiko
 1YniB/94HAdz8UhJFMKIN988mHG26Nn0vnk9L/t9IBX8IZ5deCt2VIY8H/3PYSyeTjTt9MHH7kG
 cKTbC8OZtoaeEqx4L6wpF3/qVZ1Il6AtDeY74Zcx6FY6Sq+C5bNaTbVl5hfyGgFKMSiSd6nxcIn
 6zjkMjNdOo2SwIaoxxgYO+/SaaKy8aktz+C3ABuqMd9j6mqTUMANVhepHxekCtdQZeVEn1Oc9MS
 nJM4hcJ8xunBCSXc0NCRM6j69gLW2HSf/Qo8PYg0AFUQw3n06Okfs0foka1ieXaZ/TpXUF0g5Yb
 HNlDNj6sCtusVaWoi16BVv2Hu60WuOA+oBSB+BKhzBFwY4Lf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -SKHpzJQOxIOlLS2Ztgkr_kBM-_Ltg86
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX89rOf4SbrspG
 p63WNIaovHvjTzt6wSf0yPHhd7buozYdWmaEQpjJl7y1anwPTVTGs5Xhwkf4NNCP22s48z3YBz2
 L/4KSHRIuMmKS83V6ypathsyQ7MR5Y8=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adbecf8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oM4tAuVuu9RyGq0-O0gA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: -SKHpzJQOxIOlLS2Ztgkr_kBM-_Ltg86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX2B7YNrrwp3BR
 tI4MCatV/xIXePb0h0VqOLcXg38JXmI9macTBlRJ5UG5qcMm7dvP/wI4bm5xESvPN7PDomEVazo
 f0rZIJEPNJNkUPbaqq/cKDjLv+swnUyb5l3rPz4mSyzi96nD6qBhqazQQHaFgTOsdY+mcA75Rev
 29JOcp9EQmIkAkVl664Qu/BnzGdbS2pg0Z/7AwU7dnMBPgdGZooWf8KUfE4U1PmMn6hEhtM5BWW
 eLLP1MU6VvA/IWhcjqLrPAXiN9zoROnOtlaL0iXT0+Gn1qAYEJ1yLOdHVqC20NqlS/nYljn0cc2
 G4jwEaCapQarSMjnI2QiRnGHjRleM3SdO2Iu4R6+cHF7v1WCaXebLOADQA3yLaEkw+sGlWmvjHx
 uGE4N+YeAPBhuSxtYBpi9NxP8+nhzffT7xc//OlCuV7dYfpYuZ8iTy21lPyj27E1zIYs1RCjRgK
 PpVskWH+tpx3OVWXbPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

msm_framebuffer_prepare() bumps prepare_count before pinning, but returns
straight out of the pin loop on error, leaking the count, the
msm_gem_vma_get() reference and any planes already pinned.
drm_atomic_helper_prepare_planes() does not call cleanup_fb() for the
plane whose prepare_fb() failed, so nothing ever drops it.

Since commit 8ac37c88f991 ("drm/msm: Refcount framebuffer pins") a
prepare which finds the count already non-zero returns early, assuming
iova[] is populated.  With the count stuck, every later prepare of that
framebuffer reports success while iova[] is still zero, and DPU scans out
from a NULL base address:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11

Unwind properly on failure instead.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index a38e5b3a1d1e..792d47b4acc4 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -80,6 +80,18 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 }
 #endif
 
+static void msm_framebuffer_unpin_planes(struct drm_framebuffer *fb, int n)
+{
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct drm_gpuvm *vm = priv->kms->vm;
+	int i;
+
+	for (i = 0; i < n; i++) {
+		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
+}
+
 /* prepare/pin all the fb's bo's for scanout.
  */
 int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
@@ -102,8 +114,17 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
-		if (ret)
+		if (ret) {
+			msm_gem_vma_put(fb->obj[i]);
+			msm_framebuffer_unpin_planes(fb, i);
+			memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+			msm_fb->prepare_count--;
+
+			if (needs_dirtyfb)
+				refcount_dec(&msm_fb->dirtyfb);
+
 			return ret;
+		}
 	}
 
 	return 0;
@@ -111,10 +132,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 {
-	struct msm_drm_private *priv = fb->dev->dev_private;
-	struct drm_gpuvm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
-	int i, n = fb->format->num_planes;
 
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
@@ -125,11 +143,7 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 		return;
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
-
-	for (i = 0; i < n; i++) {
-		msm_gem_unpin_iova(fb->obj[i], vm);
-		msm_gem_vma_put(fb->obj[i]);
-	}
+	msm_framebuffer_unpin_planes(fb, fb->format->num_planes);
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)

-- 
2.47.3

