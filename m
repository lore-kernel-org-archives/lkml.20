Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF04B0C93
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441831; cv=none; b=J7sfLrgdGdhUlRal3PdVz1FNhcHfnBLnEv/k62RfPmntDxkSdplt4Dox3jwHBNKsPkNymcOyVofl4f3XIyQglzbr3P3KhP6aNfuFDElSasJroj9CInk3DqRUX2lLcll6v3biTNdqHWhUmTTHI4IzGPjkoMKml8V2wXWi+xShXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441831; c=relaxed/simple;
	bh=NrFw7BXZVFZ9tRlXdJwvxA4tQOn9tdfDrYwT+OYyZR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqFCzdrMXbqWAu8qsp4hnspCtCQpPixudC4SyJ3sZZL+56MCFzHjSf+uHO4pHFA3amfMg7olwxMhN6v1IMNGzDscygTclOefZZhTL96rUws6+WF9tUDGI9FEKHrB3jRo2jjz+SZchxbpDrbEdJ7Q+IkW6InAm49mVdfAycwjf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOrC4MfC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbijJysA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOrC4MfC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbijJysA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAh6w589130
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+mI3GEI2CDfK3ssOBCMKAt4S/5fYocofrXGK1kFQNw=; b=KOrC4MfCUaYdZFPC
	Y9tDwRDQARL4Aiw24OjmAR+qlMYqhehogHwbkp6F+MlAhll0I9J7GtBSkajUVirq
	EvnJAbUV8wJny7+KTX5wJXr9xPQ2C1ZHy1zczyaZeUQyM1vC0dH3Yug8gWgqrNsk
	oypxpgX0BMp10ZcyeLJenIFm2cDX+5ojNp4rTNPH1bYV+yuwtv/CAey6QYU6sMol
	9UIKPC/kbU4TMhHcdR3t0vKhK6q4fWAOESOOXU1GMx2LzcsBxu4NcCujc5P+XvGc
	RfcGHj1f28vKKQgYq800WKMGxUCF6y4cWOF2PWm1t9F0wkIGlEWsKyUJJowyiTFQ
	z9NUGA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyj37x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:23:46 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c176d45a2so139685241.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441826; x=1789046626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+mI3GEI2CDfK3ssOBCMKAt4S/5fYocofrXGK1kFQNw=;
        b=YbijJysABmFFtgeHW8wLpsVgoXWRyfMbrnF3Rxks+DTkOSUbjj6POUAgS4ehLnSJ59
         VC4MuUtHJoJrYdC7I1LsEtj6FkW7MLOkP5C/s4+w28fm3znf+QsKMpzQO9qLo850rSz0
         hLFoQku1cbDRH9ilg09/cUt9tRezcbLIHc23wtF71bJrQ9usSYieDVL6js2yWG/LDsEg
         jUXtr9KVM+ekwUjVboJUUsZucnMwcKqacExiXFfRS1ySAwQNX5jGZyKdteVDrccYDp21
         XvFJH0ILtSSeVR9QfJQvogIefeNUmkf7Q2qfXPRqNVEVwfQ/9X8hOVbOmZWhhWTVWsr/
         37YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441826; x=1789046626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+mI3GEI2CDfK3ssOBCMKAt4S/5fYocofrXGK1kFQNw=;
        b=Wxf62pHxYfXAa5QwiacbskV8ab9x5dyb8IsKpx3XKx15J/lxIxYGWO3ZgkORTiRAWN
         +qaeZhwKi5RmSnIrCcFFaJQEVO5SxWU0G9M9RXOKDpnhqRHmY5zIJcgAf1nP3bUQHFJh
         IAs/q/DYPEGHZqR+nmDz8fShXPE/hF3e/4ivIT5I4qqv7Xo7CNhsxX1A4vo8+J7H1f3N
         pdXHPdpdckvQ+/r8w0bJM27a485Wejrvtn9B7rsj1oUgcMAxTXGd/jG8jzvVS2fEU2UX
         GUFUc6K8K6IsW3Oy1edDk144Kt06WxA4cICaO0jPokDhqy1coEEGYEy9D1yy5tSJmSFW
         7jdA==
X-Forwarded-Encrypted: i=1; AKwUvBwzEKACc1//eNaRsNWVThRulzlHSulcIFxcm0ddPSo051YtNCCw4sFQJ9YQbiDT3h2XHF6B2nfz995f0+8=@vger.kernel.org
X-Gm-Message-State: AFuF++nhZqwFjCA9tTwayNC9eEYipG5cQke05inPWR9FEy3uaBbrUOl7
	Wt74GDlNuOXSWW1ZOFtiiIfqVsOf9eM2jwW5xEQUbxRb73N05r0/nwT72qFPoKN2MS/kaTszLCk
	+il0ZmX/ZoE32cZ4WUTbdvR7KX7seD7ikJsMQKAs2F56D/yOTq3fij/4b6Lpm6NfZBOLp7Uaw3B
	k=
X-Gm-Gg: AYBFou0cmiUGufaM+phjTc7kBWwxPd5tGU/gPpknD5mX6p8Q1Sh2gZ0nlumpX6t7fx1
	xgH3gI+OhLq68iOIwBgl8Th/BenJzCbi1Ph5F0NT0SPDU8aIYf/9TUdE/C2PGW6P6GSthWnhBIg
	mfilxmIvyp6Nh/EqHeDP6NxDtU5qI0vvBdqcgUYGNnMWLdN2ryxhrXEE7pA5eO1IoRpxRCvBT+Z
	qCohGTPl3lpi64T2HmGr/fEq//gJarDF0mBmpB5CU8vhJ9C6RWSvtLsp6No+5Ogy6WekvjDVd39
	7HBYuMa60oRc20f3DXcx+P/kNBVVWbbwxv0aSPoxvlu7FaWHpgZQ7o6nK97kdzbMxgvEgtKvGqJ
	uYZZAnnGTl9kE2zT/bWIWTo/Ke6eFEULmp40lA1GOJ2BMhBGgCFDXLqWFARiNGDgAOv5IVxsN7q
	RLwtIVGPNcuvtN
X-Received: by 2002:a05:6102:32cd:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a1eed1c93mr3585900137.0.1788441825645;
        Thu, 03 Sep 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a1eed1c93mr3585885137.0.1788441825273;
        Thu, 03 Sep 2026 06:23:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606da57e9sm1296480e87.83.2026.09.03.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:23:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 16:23:40 +0300
Subject: [PATCH 1/2] drm/msm: fix framebuffer pin refcount leak on prepare
 failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-fd-kms-fix-smmu-v1-1-608d02491666@oss.qualcomm.com>
References: <20260903-fd-kms-fix-smmu-v1-0-608d02491666@oss.qualcomm.com>
In-Reply-To: <20260903-fd-kms-fix-smmu-v1-0-608d02491666@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NrFw7BXZVFZ9tRlXdJwvxA4tQOn9tdfDrYwT+OYyZR0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqmXTebiKydvKEhAHkK7W6WCJ5/HHQYgcyZIGg/
 LynZnPECGuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCapl03gAKCRCLPIo+Aiko
 1cgDB/9xO0XIZbbgdMWUPUY7xeo5AOfwIYi9GYgdd5Y/bmqF2smB915SaGJONfU9yvFHkpi0BHA
 /nSHNJF/3RWzF1LoPj5L0w/dvmxDkGYkTgIGdcJUF3/VMmFfmDQ9JNUU8h4/mFN+J4roGhHu6bA
 rf8eiv0liGzuBoxvgQK4yo9ddA0GtzctLM4C9FEJsIJryBx7r8/J3tcKsgFz7fobE3jg0C7VRvI
 ThPxJj5UPlSZljaLGPAYzmw9aLxf62lK+uy54CMohjqVdxYpZa1b9vxR0H29LTbwLIbxKK9J0WV
 My9HNDsc/AdAeXv5xvXYzX2QoPn5zUqST4CtENNEHHnvG0ov
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX9EDw26FoGW6i
 4dEpoZ4aCTRWC48EFeLalzaJJZpSU7YBT3ly5OLz6cH/rmiBfxADy8lxmzo3+pmwBWtVRHB4IW4
 YMXXykqVvXMjOJOYyWrUg5cD3Cmmw8WAdewLUb9Q8tA5ZYFt6bUt0dwoJNJ5XFro+5jnG68avFc
 wpB1DGqC9FohvLswJ0+64zcistFFBzaO9R4hu9JpSPy2UunxLXwBVSe25vtu6IEjEABSnIcbIh0
 wGfIvQwJ98RFrTsdpya4pAenvErnc/cPY8ZKE05zolip/lw/45dOruy0LkErCoGPF1XqN6AWuKQ
 OHWjiEXr7/n1LMF26hrDeOO4MkkZQ0syxs1p+Tv4D/EtTLBkTtpzKCgPm/nKXz6IUO1bsxFyNg2
 holvucZBmvxQkY5E8T5GYCch0ORZnszuuPZWFhsCcIORHe72wnG38wictDHfKOpVcs7eHk5sWW5
 avvDGUlcVgi+YeTFoAQ==
X-Proofpoint-ORIG-GUID: INp4ETzOs1l5jYsvMEubO64kDAM9NB1i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX9+39fr1kQ1l0
 DOuw/2OBfKyCGHn9oxZPAg8YOfTAOcRNeF/aMApQtcwDZ08A82f1Qid0blVRWfSfvbeI0mr2+uE
 c2yqja7m3hTENQrHkw75OLpRoZVaorQ=
X-Proofpoint-GUID: INp4ETzOs1l5jYsvMEubO64kDAM9NB1i
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a9974e2 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=bAolQom50hykzV7YMrMA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030116

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
 drivers/gpu/drm/msm/msm_fb.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 60c108d35d2a..934337202afd 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,11 +89,27 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
 		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
-		if (ret)
-			return ret;
+		if (ret) {
+			msm_gem_vma_put(fb->obj[i]);
+			goto unwind;
+		}
 	}
 
 	return 0;
+
+unwind:
+	while (i--) {
+		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
+	atomic_dec(&msm_fb->prepare_count);
+	if (needs_dirtyfb)
+		refcount_dec(&msm_fb->dirtyfb);
+
+	return ret;
 }
 
 void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)

-- 
2.47.3

