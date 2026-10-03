Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E952BFC7B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987434; cv=none; b=fNBwrTLh42jq5sMY88yTsAaUBoDZFN+TlnnjeBhCa8KwM/5JNVSxjvaP3H9MAZnofthS6ee09naeB+qqI8fBCL8ix+9yDyE2JCZ5qEMr/BRXmQ1i0uMjARIBjmMU5wqZOeO/TmBliZEfIn1KGz/zPd5xbSUI2AZlpIlsG+LMP/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987434; c=relaxed/simple;
	bh=pamYy0cN7nsNt1AdJwY6+IG+Gt3DwvWS5HicK2xuXmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KjiffJyaZpQlYt88k46H4UrhktFLwrPGwePhV12J502q+VrVOof/SmnKwaAjXQ3Mrt8DCwRImxMdJeeT7fP6CCFLdoHGDkmkkkdZTESm9WjJPOrOUY8wWqR6VFUoojUP1LiS906x1Dm/J5Os8O7Apo4HKIFktgmWeniePprJLk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GN+OwRrX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6l/keXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GN+OwRrX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6l/keXe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nebcx2929073
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=; b=GN+OwRrXxk498Wnz
	gfcLrBnA92FPmIxgDDtVkweU4gCFp/+AxQFK78kI70x6MFqjlZkz/EjwciS/q4im
	otLorehqhxSE81pyWdv6QToWKkCuEzYMDqq5NuFpGx4yaPp5Nt7eIYceZvH0Z1tN
	5cHGdVYxHJzXRZmDY9HwAQ6w70IyNGuGjl9naNfjCnZySWi6RaZryIBgpOdyHuG3
	U0ydJN4JGqlp2MGKGxBBBJHE4HNAM946eRHb2c0xcDnqri7Qb9X065SBG3nXziec
	iDHjxmIpQuPBZwNunUtQaiwsfiXnLXeLJ893QzeDjDPLy1ZNAAMa2dKZ9IlBmMxA
	SNuc8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvurh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93be1861d2dso16335485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987427; x=1791592227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=;
        b=A6l/keXeiojmC0XEwN3sm6OcgvWSmaHVQNn0Tu+C2XzqX2peHygIV4dqjXi29JnEQV
         EclsNwM0KXbUt1IS2YnOCIDEBSLTKM10fKhQ3BR4NcIIkuTfQiIvpxpX0A4j5mF5iGgK
         /AjMrVlArKj7ePYSgY9qiR0h1jPPloNTF1WBmwVjYVV24VNhUyvN89I1h947THETR+t3
         OyZo+vuRpFlK27Nik6QATGMOSanYe44r504py/9KLaKlMdZlsDV+sYi1sZWrZUYeoo3B
         tbdW/H2c3CRQBijDudx1NYEZF/+lT35fE2SR9hw5dxC9GitYmVgQfEdsGkxmXCKRaAPv
         I1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987427; x=1791592227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=;
        b=vdfy3jZtPTP8oi+x3DdmE4MNcUvWCBqkk0MlYvHwz2/bWd2tqd2a86/gPOd4b40OLP
         TIWVDS5P4g70lYtRRFWgsasn87sAE/tSEpU2rXAqkoLv0J6IIVqsCbjSPkdAi3K1hhPh
         Gc5cM6qIk6/LbLU1jtCYqdxT8Xx5OPGbBzkOtCOUT40o8APpEGnqVJYopkYXVn3YqMFZ
         M6lqrkD2Szyd8QneSZBok0EyQ+9kz2vbW+7WUBfIWyFSrbH3giNxHekQP1fzMp18O+Gn
         BUxqEDxnP1QPze7uG2XzzIAa4FWCbRfHZZEWlU1pynNXdy7kS/NikquFDNzXD1tRuVHF
         QElg==
X-Forwarded-Encrypted: i=1; AKwUvBywLaAEF0wie/yswMT5i5plioA1DUOz9Oq7FWZGspoiq+xwDLNoWHAPXyaz1FHfQuDB3EGKPTe6PVi9U9M=@vger.kernel.org
X-Gm-Message-State: AFuF++l4FN3miouEJIfiRURgW2na1Y8emPeh+WV9QB5giBJVz633VZPB
	S4+jourZHQiQ2/DPpLpdf18Xrky3AAWEVZrwD6OxPQVfmustCF6Yp2F6xtspllfarlZAA6pVZi2
	bFEczptH5BIxjb1Okcq+VXlo31e58OD+o0gCa/1nSQG5Wb/MROnpqv6fRUSWwlwu6aGI=
X-Gm-Gg: AYBFou0ur6VFIjVEoc4q0XMqGqhZd6hwxcG/stQrWaNiFlZVECrVql/D28lmNU6L4B7
	LELGJ+NjNX/3+x599qd4mVFRvv9w7SG4BNLdr9Vdg5lrNuN7AoRrUMfFD+25twXhYYhA8mFWr/z
	3oXkhH1YUYwIV0vFpa5FCDJdJ+bqI6WTPZy9o7isAKjLKbRbdnHiL9aJAhPwft0uI+7bSW00r2D
	38rKChyJNMdA+bOmrh2h+oLteRcZL7rzETWlbPs562ACO2U7aPR0JwIObDtUT4O3pPfp35keQkN
	TuWjYHL2KOvNjOYsE3Y+29R+kn1LCIC5d+FtekBWyg0mEgcuJAK40Au323x/WAeZa9qQes82FzM
	xGEjnsoSgyj3bJEdo6FVdtpo1R3xSIb+whG8ZpZlVUZWQiCFxRDoE6J12TgNmtQX3DrnUfZXa6g
	==
X-Received: by 2002:a05:620a:17a6:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93e510cc967mr218482285a.62.1790987426492;
        Fri, 02 Oct 2026 17:30:26 -0700 (PDT)
X-Received: by 2002:a05:620a:17a6:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93e510cc967mr218475985a.62.1790987425946;
        Fri, 02 Oct 2026 17:30:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:16 +0300
Subject: [PATCH v4 01/10] drm/msm: serialise framebuffer pin state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-1-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3800;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pamYy0cN7nsNt1AdJwY6+IG+Gt3DwvWS5HicK2xuXmI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEydh38e1ya8IeVWBJAR7nUWee28PPvIEtLbt
 QRrLyI/U/yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMnQAKCRCLPIo+Aiko
 1V8/CACMXl/985QA0z9gjWaI2sG6kw28wSkEYyFAmM0lJyNOAgW3ykJJiD4ef1f0IjJJPnuZgrh
 EZh5YPwjJRvPbIwPlqsBS1VgboDv2y28VoXhPRu/HaNUGpVSH2uYFz45nUa+gcoRSne4XnLf75O
 6h5Uvrkol4OXns5rWF68Mfq1vQ4B/pRJaXmAkFTbz7+f5/Lus18eQ9bx9wUqPEFjyAC9PEhxbI3
 y8RAqgru8W+JId9bBh7flpDwTf/8ml+2+t6HL4fbYolIzZ+aAH410z74X7ZuAA9tJ1zpWCFtTc8
 Eis05fxkGAJAFQWnZrarKdEmkhWJjm07dV+DwKuToTAYUloX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5P_A8DMoQurpF-m2XTACUezbHbqmAgbz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX8QGLd//gGbiy
 JQunlL5NSe0bvbX7ypEpJcG7km0Q3jbuQmbWYLDwcifA6oGDxi6jf3gr+dP+1e8WZiSekUhdmka
 q5i7jp0EEgc4DaWPoJYXgVWaXUejPow=
X-Proofpoint-ORIG-GUID: 5P_A8DMoQurpF-m2XTACUezbHbqmAgbz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXxlDQTt/dGyMp
 IgDl1wnsUxrzkGxHseQjW4Fd4p+3m61/MeBmbh7I6g7DAkBPTkuYuM91UBSOqxRKSIoAhz8h0xG
 sh4CPi0d4ohkfSwDzvZN/eUuT5mK4IgKbR79OKLfU9iFoaOkle7/H+wI+SWtG2qSixFmBWjhxPX
 Xswq+jBGMUMCVnEleZoAXgym7yRhACvZ/daTWD1YxP2UsE8bTCMofpip4We7vcq++b55kMPGePS
 61UvwcSjbJjxKDmZFSMMkInqVeIOkde8iDAw0URXblSUM1ZVRzXMupidPCAP0BjDPkUxAsPWQ+c
 VkE3Gmtbkn6J2rmoM4gz2eFlSUlSc1+vfSLPMn/drRRAFPBX7KFaFwmP+bvNSH5SwWshF2ycpGh
 bmxvPLEIflvG/S1oBZFuUODvq5v78XCKW6lMMFKuaW67nl8bUiSIGbsdbvwShXhKKkuCI+9Dq/s
 2xHS6u41Y8TrTfVHfUg==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac04ca3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=xgb_odkXjkZCwJ4aViYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

prepare_count, iova[] and the pins they describe are updated locklessly,
but drm_atomic_helper_commit() prepares a new state in parallel with the
completion of the previous one -- stall_checks() only stalls on the second
previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N is
in ->cleanup_fb(), and for a double-buffered flip that is the same
framebuffer:

  cleanup: prepare_count 1 -> 0
  prepare: prepare_count 0 -> 1, pins, stores iova[]
  cleanup: memset(iova, 0)

leaving the plane programmed with a NULL base address:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11

The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
Refcount framebuffer pins"): a prepare which finds the count non-zero
returns at once, assuming iova[] is populated.

Both callbacks may sleep, so a mutex will do.  drm_framebuffer_init()
adds the framebuffer to the object idr, from where userspace can reach it
before msm_framebuffer_init() returns, so take the private state out of
its way and initialise it first.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 60c108d35d2a..a38e5b3a1d1e 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -22,9 +22,12 @@ struct msm_framebuffer {
 	/* Count of # of attached planes which need dirtyfb: */
 	refcount_t dirtyfb;
 
+	/* Protects the pin state below: */
+	struct mutex lock;
+
 	/* Framebuffer per-plane address, if pinned, else zero: */
 	uint64_t iova[DRM_FORMAT_MAX_PLANES];
-	atomic_t prepare_count;
+	unsigned int prepare_count;
 };
 #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
 
@@ -45,9 +48,17 @@ static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
 					 clips, num_clips);
 }
 
+static void msm_framebuffer_destroy(struct drm_framebuffer *fb)
+{
+	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
+
+	mutex_destroy(&msm_fb->lock);
+	drm_gem_fb_destroy(fb);
+}
+
 static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
-	.destroy = drm_gem_fb_destroy,
+	.destroy = msm_framebuffer_destroy,
 	.dirty = msm_framebuffer_dirtyfb,
 };
 
@@ -81,7 +92,9 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+	guard(mutex)(&msm_fb->lock);
+
+	if (msm_fb->prepare_count++)
 		return 0;
 
 	for (i = 0; i < n; i++) {
@@ -106,7 +119,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
-	if (atomic_dec_return(&msm_fb->prepare_count))
+	guard(mutex)(&msm_fb->lock);
+
+	if (--msm_fb->prepare_count)
 		return;
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
@@ -199,14 +214,15 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 
 	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
+	refcount_set(&msm_fb->dirtyfb, 1);
+	mutex_init(&msm_fb->lock);
+
 	ret = drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "framebuffer init failed: %d\n", ret);
 		goto fail;
 	}
 
-	refcount_set(&msm_fb->dirtyfb, 1);
-
 	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 
 	return fb;

-- 
2.47.3

