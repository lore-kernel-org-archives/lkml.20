Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F4556BB6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881067; cv=none; b=gSGUnGSCL8hIDxQXQPEBex/ykUIZrAxbaOSdbmsVmKUDP7NIzEfnnLXH0LDqUZDoNpd0d6QMtqw4R1YozuOGxs/wTV7bs+UAf5GtA1wUCFQbaWj9mCw8bOfb0eg18cNGqjf+IvUUSidqw8WnpgyaVaauVL8WOuCkMxpSg+RSBPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881067; c=relaxed/simple;
	bh=rvnAOg/zYGiII6SLbLFn05Y8Y0cbEo0D1VGSCTZYDa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFsTwtrZwXBlTXmd8qtErsFVevxeXcKBitaQDdHnE86fvfhhvKBbPttQx3m1qXrGSoU5xsBumqgzNaKLFw65EXQEIobKmG//hUvctIqc/TVy+OFZiEktf6EJmTy5FCagtqRUrvJNju+RB5N0StPKeK7OqTXCHeiVYTZZqomddNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GidDwibB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXDjRnG8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GidDwibB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXDjRnG8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688F1Lfs2684541
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 15:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7u35nzDdP94dCsNs9Tn0dCNHt60+fGcXSN0rDFrXnv0=; b=GidDwibBtWZJCxXf
	qIOv0n9Jc4+Asol05gQd4euONroAXVkmUBOx8jjilhdJFMyE6C0XmeBgq+j+7r0w
	3n76TtN6FS9/MRyG9El2TJmWTBvn3efbdxeCMLKEYLcBC88d3SidUXnqpMxI8i+6
	dNF6LuVsgKgC3aCSSqQTg//v8XgJhOMtHtsPhtIQGgaeJkkvFuPnuJ6vvyipW51G
	HEmF/8nCgJJ6CV0cfB9kvrOZ6Mj9Lv2zP4TmFxu2/AhBLsbc0EpEH086bfvLb9Yk
	CuCR4D0oSQE2byHHCMv50g3q9ufQ8XekHMMtS7vgVPcI1fOyU3E6bVvz6300KEXr
	p+l+JQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvugpx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:24:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97caca2faacso460064241.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881057; x=1789485857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7u35nzDdP94dCsNs9Tn0dCNHt60+fGcXSN0rDFrXnv0=;
        b=MXDjRnG8ei8MHi+C6V24lg66KZK4cSAYyH+8/gck+yHVH9hJNIKxyEjJuRy9D4pORk
         39YWEh5dcfcg3gNugARFnLFDR4SvLXe6l5K592z/4z/kCJegCVFgk9x2CcLUgiGnz7Kv
         nFnGwkKiaLfq+Ywuvuxw9tkdxatZOygOd7cvn02g0GGiMOmcMMHdleXXxXOD0cDt4GWY
         V0YtrLFre76qrnnKo2iKdI5pXUYNzVVaQlNWMFeICdbR1EGQH85qSz6MHgB/HslV4oPi
         OcyhP5ZRyyirIdBe5sSnVmw6mnIDtL+hUD5+1rhdn+ZmfqWo9VKu+O6/ZX8gr7a8PH/K
         k+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881057; x=1789485857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7u35nzDdP94dCsNs9Tn0dCNHt60+fGcXSN0rDFrXnv0=;
        b=YBUmWGnFJq/JNUn4ZLliJnC7m7ynX7aQ1TQ0IfWL56CrUofdYkX9lfrYkzqcZmxyMb
         /K0kV7o6juf5JF6qoWb91U2LJ0k2ByeNK26600EpvJOrXkbihhvlM5AVJzk7fRDH1jq8
         G9vQ1ipucWGfeLaKG7wYyHgoHdU8YuwGA3coAus9xA2NuRU/+mD/Nad/gFyUrNr7UhRm
         zdPMcKSSl0AA4mJi3lpwb40qwPsw8Q9U7ejAB0poaSB+rq/uCFu0RbDKojb4gA88qwNb
         Vd/6M6FUZV2WDuVD0fGrd+6xrC0OSL//JkhIX8bfHeemTQBONoazbGOjn6rE0rp40p7D
         UHfA==
X-Forwarded-Encrypted: i=1; AKwUvBxmpsfdz3b6fRJ2SiwgW/5YJAU1wCPmftqk0ZZVUIjsc8HWuyLKMNcG99cbvQllxWKHyPkMAE6xXZUuqjg=@vger.kernel.org
X-Gm-Message-State: AFuF++lYFaRpLl0U5wbWfgVfd05OCu6HtL6a9gyDa5rKYpT0tHJhQjiJ
	qspXl+wMGSFXypgLwCFmCzrNZugF4R1blC5/y0KTON6V21J6QAtC5vp1yLf2t43iJzW0rKh6TDX
	3mLmc6NyminiHELi5xPaPMwqP0TCbeVp58S4WkqrVuKrOezHp79uCfQeqjMpvM1vinBw=
X-Gm-Gg: AYBFou0Mg4SvPeJaM1APM8XxZTcuLXOx0fHpsB1NLjrj5+awdo+c2UQbIUC6629ih5P
	y1Vha1bXfsRqxlz8/whW8Aoj8t0T+nyb8S/M1fgVzo/EvDfzpk55Imnmy6bIluA0rP6HBuVNnn6
	AHH6IYHosMADnOZHoh7spH5TvcZH3juAm1xek16qJCqPuegKXmmcMjipim0LerMizBKFa497w/L
	NVWbJquBMZC8DSxe0+m9gSiKIwTwWbAzDDuF6L0nG8YAOB4QRXmfl2U36SCeIt6HNVGK3e/gayw
	rBdKwUoVtLUUkaaxO46BuZDNlJM0lCAs3Wx5751HLuPk7czTvD6seYSMMKwDWQgkzEfsp54zrvo
	RlkupNdBOKvz6/lyTZ5VcKa2ORuEOgHvdKB+lY1rBGnyP8ErohXeaSdOrXr/zRzo1PPvQny7MO6
	tvUVpKZJbGOe4h
X-Received: by 2002:a05:6102:808d:b0:781:210d:2897 with SMTP id ada2fe7eead31-78a4aa07b1dmr10166217137.9.1788881056834;
        Tue, 08 Sep 2026 08:24:16 -0700 (PDT)
X-Received: by 2002:a05:6102:808d:b0:781:210d:2897 with SMTP id ada2fe7eead31-78a4aa07b1dmr10166164137.9.1788881056246;
        Tue, 08 Sep 2026 08:24:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe10asm3103722e87.47.2026.09.08.08.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:24:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 18:24:09 +0300
Subject: [PATCH v2 1/6] drm/msm: serialise framebuffer pin state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-fd-kms-fix-smmu-v2-1-9391815742a8@oss.qualcomm.com>
References: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
In-Reply-To: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4350;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rvnAOg/zYGiII6SLbLFn05Y8Y0cbEo0D1VGSCTZYDa4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9YCjVmMqW1mq7+cNEpusGd0Dq7t5pqxcJVqruvhp/Z8H
 AyM0UadjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhInTL7/5qooJMlxmXd6yRn
 7+uMjqrL32nskvE3QeLU7rOJMVO5v/FVNHrr2ibFJnFYP/DkP9Fv9lCnfuMGy/Yleaumx+v98n6
 59Fo/k04Zu35npzaznvv35ezhy42ENgh5unk+M7Vtuc0oXffAduVujw6x7kOp8nkmO9/kZx1Kfa
 jxNbxxu+JE5ZTs4tmqG+TYdppdtLjdXh/47dNO79rIda8LU//NUvVb6rd8fnV/1VLHLKZJItE6S
 eXXqnkMHnecS9Izr+b+8mXvYb8cr0drl0hduyq19MKfBvGWpp7ChzYl+dz2NrXz9q9R0hN6u01P
 7cfsnGXXzmT3hPIEt8zwUz6ZKVfvn+d85OYSoRKmAAA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GPjOqPmnzuJIQhOnK4oyezqA7H7_4mfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX6mw4rgbVeeH7
 H65ZsNBuLslR448yXv2947a9jycKxk7Q8S2ccODmZgbZOKrY/H31RK4bv4y3QOoTzcwjTnjny4U
 rlVo5om00AvrkjPgEXdTRmlt9VTH/umRkbJK9xDB66MZ9SPP5va5S9SCXhNWmMwcSbyGcKlVGd5
 nKFKCsm7IpJMBMbHm3XAm76VwiKG5qVX8Xgs3awQYZBhjmXI4wwv67iKGVPlS7omqqJUraFyu9n
 FRharRNEbEQPe4ZuYSGbeKKPEYTImJttM03R2tw7F16Ug1IgxZXxdxQYG2l7v2Je/SOqitOYYPf
 l0hfczj9+5ooviE5YqhEihgUYHexLthF9Kzu3VC3yEmc14C6KUMPUheR7ENa/Y3Mlac/m6DoXE9
 1/c8SkXiXYVl64UI3Afx0ohZPCMqB0uvIf56Vyazo+H41TBn3GC7qsxunHDZtIP90ZZ7l1TnUcN
 U/DioUX5IsKd3eEkCCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX9dfzGPXXig4Y
 anaByVsMrrDLCk94r8yTpm40VnCwOVCu+gtS7K0Nk/fZz8kx0XR/x0ljmyV+tmpnvjJPNdTu5uH
 TluYxuYhRQ4jT5Kwiv9kRHCCj64md8I=
X-Proofpoint-ORIG-GUID: GPjOqPmnzuJIQhOnK4oyezqA7H7_4mfV
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa028a1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-SLBVWGn-DbGgWclMpAA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080166

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

Both callbacks may sleep, so a mutex will do.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 60c108d35d2a..d69591245231 100644
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
@@ -206,6 +227,7 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 	}
 
 	refcount_set(&msm_fb->dirtyfb, 1);
+	mutex_init(&msm_fb->lock);
 
 	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 

-- 
2.47.3

