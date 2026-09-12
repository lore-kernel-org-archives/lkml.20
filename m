Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ACE42885F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217311; cv=none; b=amwP0L3R0A0rnMQiQsEBhZ5MzJm5plBgciChjESnNo+CI68WFokbn/SZLNaDMKo1I4hsuyQMO95gi6wN28aNDM5cgfpP2mSNxZNGQfI+1IO9ZC+49bFnukGr0qbZsofOiBEqVNbKP1Fm80G0EV/0d3QmBiUBfYCmCgxeTT9FgbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217311; c=relaxed/simple;
	bh=4uipgtNRIs5qYNUtyZUsdJb0hErPAZce83PVI4j94so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AoVX5el8dWZGaPaH3s/MHPjF0WKVLdnaDcgia883XWV2Oupq/dcwAnikXnLN3bLiUtgM3nwwXkAcL8RnSIHbXnBq9Bu4E/DbJFm3WpzVXwOVzlWVGW5dbXOBMgjktNde3VDYHgM+9WDUcNke1M1xcWxGvJtDZdF3EXLUfIV2oFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfMEWa69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEOyk6Yk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfMEWa69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEOyk6Yk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdaU12239148
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8zAn/guR7xH19vvVnJFNiMrsIee98EJBNEAzw4/qBE=; b=hfMEWa697HLp2ZKw
	aA+Nz3thc1sl8jU4pjn2fuM5N9p4zMWU0EVC9bHm7gv0guz0JI4VdMEJPfmpWrSZ
	I0X8rBEiQRBSIwstA7WskrWKk/FssntFjpQNQqiIBZGkkap4BDCRgf86xdeCD2Ey
	kV1pdjjlIxQVYb/xpvKZfzyHBYV23hCqe8lC4ZgS953MAM53AX9fzWFLGNSmTibW
	xuCEa04FGXRWRGVMU0AN48/UGCfT0fV9ieY7ixRwQT3TJXfHeubHxhFP57ZPicqA
	tzARAfUOaC3ONKbaPTIuZ37pJc0FuDnD9ZkT2pFfkA1cBMDEQ7EMSDPs11CqX94H
	oWabyQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8xa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98055f91346so1323804241.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217308; x=1789822108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8zAn/guR7xH19vvVnJFNiMrsIee98EJBNEAzw4/qBE=;
        b=XEOyk6Ykk1gF+lElPCr7L3FXUXaUvFpNvuNKVWhtfZmvWsMsKNvb5YYU2w1Fn04ssw
         vtuMeGu+qcn3Ws1M/MgfKHVB2k9bkPo6taIOL0HsMwVQmbtrwHFbqIXY3VvemOeohkj/
         g849YZVgBkeY6w4hQOfs8oiz68duww7is637XK8Kc1dPSE/g2XrLnjsD0knjRngATJ4W
         gyr7MVhuCnLhsZ38IiFErdZvPoHuhynnXHMNZVKhF3D8EszpNIymCZQMqLVGv+i7qUfV
         sL09k7IUTQucUgjdK7R2x4ZWfFLUCDdNtBYREoDh8iQfX+hLws3a6HT0m0QtK6i2gEcP
         zMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217308; x=1789822108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8zAn/guR7xH19vvVnJFNiMrsIee98EJBNEAzw4/qBE=;
        b=WEMOai26GvlXlr9WPWtpO7wtgGqYbanbU4LuqFdgFd6ooLNTUbtCQIYU2+vAWJJoN/
         DYfeLWPG/bXLDrZbYUK/vMLAmGBr9Oonam3BIfEJzdD4s48OvbiXVJGrB3nicEjqTeWi
         QhAAEj1oioz4eUlQXexR2ShEg0IfHRspzhJd28HtcJBcocO04o+E+e0xaU9VjUH0SFkP
         hVD2TGwja23las0EFuMGcFhisQII4g/Ocz2un90aopfCu3cYI1oLTuo4r/VhE9ho4z1M
         GugGku64ScxbXCVPDPlgdCh8tDFTWdYTReKxlQhLYILMs5am1LCr3kDpQ/eZwOGes8rr
         VRWw==
X-Forwarded-Encrypted: i=1; AKwUvBwr9clXaU9I2+0XZtbgj/ONKJkN5nStMvp45whCdvJZ0QJ5tgdprmwY81k3p8igB2nqe1vel5ItlQsd55I=@vger.kernel.org
X-Gm-Message-State: AFuF++nK/iYQFMtUAmpkKwSL0IN6lv03pOs8Gt1QWFMdFqtr1rirzFvR
	TxyI//AsMa++4OWe8YGaV91ZDmkv7IfMV8pZ5dGQea14BR/QgM5ghGHmjepKzBz0ufec2jYphx+
	FV4jTYAEJp4srVzcv2cz4GF/Sd9I1x6yYi41hxBKO64vdes/4siOlZhudAujW/zJQkHIOUXKL2x
	k=
X-Gm-Gg: AYBFou3v7VCaAlLkNd6vRwC7dwCDNQQAqdAz9LYXZXccWMq6C8ZmqA/L2lN4tPW4YCZ
	9YrFQzJGbhEkGpwCv6xxhXSBJtcattDdcguCr1O9UZBCxTCvUr1kdUbYBmV/FdglPtg8OzNgxnQ
	JOZLrth6Ntp/4XUlW5skSbNGgm2Qw5TIDz5oBoLdSh/guPS+pIQ5rRfYhP8YPwM+4cr+Jlglgxy
	f8gPy2Z9iJYPVNfpkjMpSQOcooBEcdaSWhfSFSkL1c4NdW1HcAKVF9zp9SEtESGZvaAp1J8eMoQ
	OlF36X+3g/l3PekZPelOxWIE1q/Z9S/iI3ODeX2AxH2P6lMlNhcxthy/Hk9DMWi315dtd684REP
	eOSLNYGLhmRDoXDBAgiTYj7069WJMuuKFsmzcqnHfcraLekqfK2tJ1znv5JgKoB+/G/k0vt1mb6
	/UV1/Wma5mto2a
X-Received: by 2002:a05:6102:8607:20b0:783:79ac:9db2 with SMTP id ada2fe7eead31-792a47f5970mr4006981137.3.1789217307734;
        Sat, 12 Sep 2026 05:48:27 -0700 (PDT)
X-Received: by 2002:a05:6102:8607:20b0:783:79ac:9db2 with SMTP id ada2fe7eead31-792a47f5970mr4006948137.3.1789217307256;
        Sat, 12 Sep 2026 05:48:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:21 +0300
Subject: [PATCH v3 1/8] drm/msm: serialise framebuffer pin state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-1-a7ddc6fe2032@oss.qualcomm.com>
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4844;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4uipgtNRIs5qYNUtyZUsdJb0hErPAZce83PVI4j94so=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoWhRUgj92XA1t8cgUikty59wtzwlwc/cc+g
 LvGItd1o8yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFgAKCRCLPIo+Aiko
 1SVBB/wIDj2hNjtFS94Dq2NKOqOACF7g4dlURrxlnTY7k/i770eR0iBP1RzHD2/nzFAvRvR2TEL
 NzrHxZi9Delu7Dkie+3Rw/EOmBjD4QKi/6ZUOJ5BnKuGwV4to8DwMyTl/xBRwFHbcobHO7cJngj
 qRRah3PqgGm0KiKbMGa1OO64bVfGEMH7fZRY4UI65B7mCHv6GGlHcY+gBu+bKIPv6wuOpur/hov
 x7G3mDN3MdAn/eaj/VCQdaTsF7671HLgQJvjW3i8r6RncMxqBGoQDu+11fJlIxjeE8mTGEpc8HW
 1YMcQQeI4lQmBAYmten0N/y63HDQBuzc5zyz4BIyKyESYWy9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _xGtziMC0RE4fEWod_1jHgWAoYZ7nV41
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa54a1c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-SLBVWGn-DbGgWclMpAA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX2leAs9oYCKmJ
 wZc89udv17YF6FdEiPTJNDiBpmyr/dk4iJ2MGg1v2ABLqh25oI2dWY56huIDV5P32OfiS6vsNIP
 xIp++7JMNsxnfwzald+7ld9OMNsMFpU=
X-Proofpoint-ORIG-GUID: _xGtziMC0RE4fEWod_1jHgWAoYZ7nV41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX/hpyw/uXeRXf
 ULhb52HW2BxzY4SyjmibFToSvCAl5uDcJw+v4zImnMnF8abLcSgV4wUownGdmOxk0KbWkA/zvbE
 65Zs4KjTmRsz6dMHpQBQo5yZoStUNWuU748csgOudMITYxVHe7UVkZVhx9Px9ZjUlbXsHcKtBP1
 2WX8ODw7/Ja+kVtkxKeBhKsuuuFJjdfw/cbCI19rF50dWq0q7ac78b7SQfzafVSp9GrcEiHMJY6
 C7k/mo6rf7vYXdwEuLwa+nKRYC/Z+9aEWaK3X7ijftEU+/retcbpkN1b/Oxn6r7kdyNlg4S6IPm
 C+s+0YtNy5lXtmSokTm0ok+xIEWK48vXv2BSa0JvC9nXXEL/mJBoawTqG9yp8SG+aOWY4T3rgLD
 tkcVN6RjMOycCGbcAAukCEGZbYl3BkYO6uIFeMD3IypgYDHO8Prutd2JHBrUzxNEUfxCfwBPJ09
 yhLyZZB8XR3OVyMY6yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120184

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
 drivers/gpu/drm/msm/msm_fb.c | 44 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 60c108d35d2a..77415302e6d8 100644
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
 
@@ -76,13 +87,15 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	struct msm_drm_private *priv = fb->dev->dev_private;
 	struct drm_gpuvm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
-	int ret, i, n = fb->format->num_planes;
+	int ret = 0, i, n = fb->format->num_planes;
 
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
-		return 0;
+	mutex_lock(&msm_fb->lock);
+
+	if (msm_fb->prepare_count++)
+		goto out;
 
 	for (i = 0; i < n; i++) {
 		msm_gem_vma_get(fb->obj[i]);
@@ -90,10 +103,13 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
-			return ret;
+			break;
 	}
 
-	return 0;
+out:
+	mutex_unlock(&msm_fb->lock);
+
+	return ret;
 }
 
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
@@ -106,8 +122,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
-	if (atomic_dec_return(&msm_fb->prepare_count))
-		return;
+	mutex_lock(&msm_fb->lock);
+
+	if (--msm_fb->prepare_count)
+		goto out;
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 
@@ -115,6 +133,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 		msm_gem_unpin_iova(fb->obj[i], vm);
 		msm_gem_vma_put(fb->obj[i]);
 	}
+
+out:
+	mutex_unlock(&msm_fb->lock);
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
@@ -199,14 +220,15 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 
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

