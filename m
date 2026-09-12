Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4747D94F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217318; cv=none; b=I5j5zF+dQimaXxis69Qb5aFwRWNe2oNTSF9dvKJD4nirSUtpTh+iGd+3gwXdm7c//9X5ykFbjcNn3LJTK770aoAyRprx1/KdEXYB7GWhoKJksHxkTiuUqCNEbxRAgUxsCgR7akLtuCWdG5yiB0HO2qbbBdKmUZjJi91CLE6/xwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217318; c=relaxed/simple;
	bh=42MaHuKsi9wtmIKNRqT8ly0SxW0ZKEjpv2W8+Aag/4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptEViYlf/CXX54JaShbJX/K6qcjDiCPTGY8x3UpRyLxGCLKH2PCXUKLKKbzEHzinle2h3A1Gcwm00+8Y9IYFwXcHCFUJxhWxKJjaGSnEVqAJali5dHU51KxyhuNOhsrlth9zgYhR/UIKYuBxN63OlSKnLGK9GmlkvEFAkzG5vxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF3eXwSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkMIiWyr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF3eXwSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkMIiWyr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdYwG2238903
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=; b=HF3eXwSLNRwlfJAz
	fbY4/3ikrLE6/gmkZMGtiLcv46H9XsvE8/slsLAlFqw/nQvBPCp1ztBsg7gsSXRs
	Z1I93rQ+qQo+RfO3K2dqPeGnDOlzQXLBcbZVGeKz6Fg9aH2fK1qtEzh19AmurmKL
	COy8XceitD1QmLQLa47eKm1V+LvHZbyiuN+lzIWwEEsfEqPdMIlUFptu/m2QVwXS
	wz0o7xh2gAuJN/WYebtY/5ptoq6mxJXe2Qn9IbYQ7kLbZJcSD0V1fr0gVmjbPMFE
	7nioCxlYzxfSKanz+aI8AutktBqvo6BQy/VPJ9cSvENQyyOgyjYrQR3t3DgSdGgI
	jipN6w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8xag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97a4824dd83so1750596241.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217315; x=1789822115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=;
        b=TkMIiWyrCMrdDaW+nUUpdK3CQeWApcZ5/PwmPAZhEfJwrfTS4vyzCMt1cjGNJZ4rFa
         6/zKw6rzT/cGVHvzgUhZz/tH7bAc780DIAfGhD3zTa4M8xbG/BGeARlOgD4OnNayLH+t
         28IYPijtXtKwx0TTVMp9dWRxVqRNSh7alEjlrQvuBZq4ECfpGPSq4hUbfimj9paDILcH
         t0REt6mh0AvoB3GAOc8RL9QjPzLDqflHaHKjpHDWgWGQY6PViTceZvjxspLXE8r2iyHW
         OsL2J9WM0RNviUEyy2z8jViFBaiTXEbw+iIdOZMt+qfG5NKcq2v494qQ3rk847bWeuQQ
         qltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217315; x=1789822115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=;
        b=kms1NHv5QKXN/vpJoagkrp5//Pk2XrWFT+3jksKZNZ6us557kFrwtyYG6XzgFBaSmx
         pjPgiM0RWXXZYBsVe+3tcfxunSIKUWEJo2svXt39jkhj2DbUGBtPx9gwJAVBvrs19xbo
         +zCuA1duqhcPKpXm36Y1PyWQDLQeHpBDtKdeG9XL18JGX0VuuG9RWqQlmrgWsn8oxd0A
         4wOvt0CM/T41gqCoGjjGMdKkpYzwCfLlABnmFwDHpZMagv2GQJjxdzedtOzNeMc0Yn3x
         C7jGr0rJkKOnfpI1s5Q9H5R+rID1Pw6TonwmGwyp3FgWF0FIOJqCw7EmHtMpIMhdRp3O
         8ypQ==
X-Forwarded-Encrypted: i=1; AKwUvBynR5iy9rF1In+Ttv4kXCCwnxN9qchMgvfWfIVIRViQBYtHIvCIl/HsIivDANCBBjDugmg3aTmp+gv5Ayw=@vger.kernel.org
X-Gm-Message-State: AFuF++nfRAvNMnWUWrrRkVtpaJ3/qcp2zUnBiRLDgd6Db6xAqPRc58g3
	qEsVjYSngyCmQQQzy4/4rdA/ouGYOcY/NwELYNjrKjqhIyohzuMrbfOdwpvcWMfECnbWF+HY2as
	NjBBkUHnkTZwDCWEFwkBkTj0BYqXN0gLIuEvjLz14XFfYhqUdFfXujfkakxO9Fn8WmPM=
X-Gm-Gg: AYBFou04D8fR+KiBUFEp9gChxem9nll0vZ/yePh3HjlQ4yD4aJiWczqixsGhD8xPxUo
	KyrCcBXzF8wb7lT/w82LLn4Uh3w6gHaLKhE8e9AMmwC9F1yE09WGvUjeCacZlDiOqRJ574xoMFH
	Vc+NLVCEDHhQNPjfGIqbEgSqO+tWv1EhCudPI5z1UTIXZYDyiPHpHXExbdr+5Dx6JZjcOl0TZMh
	o4N98XDjPejAwQtf0ZPCTltOXmD0Q5o2wlsEFYWLZqu3R60AfvIdi2Z1c0NhokKrqc1njDi/hSc
	SrXtKHLWOnISHYOYnadQI7Y18moa+9OMU3LykAEtCeG0mBYXBEQtYHXXovnwKfIFu/htC6XL6gY
	hv65Y1kj03JQzcSGQf5uDBe4ZcnydhB1DG7m09YhXnKekauIDwXdF9RGudf+o5GzDgykxx2exNR
	TZOw2YJf16IhCD
X-Received: by 2002:a05:6102:2592:20b0:786:dfa:c5ea with SMTP id ada2fe7eead31-792a5b8ec7fmr4320408137.5.1789217314819;
        Sat, 12 Sep 2026 05:48:34 -0700 (PDT)
X-Received: by 2002:a05:6102:2592:20b0:786:dfa:c5ea with SMTP id ada2fe7eead31-792a5b8ec7fmr4320392137.5.1789217314461;
        Sat, 12 Sep 2026 05:48:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:25 +0300
Subject: [PATCH v3 5/8] drm/msm/dpu: clear the DSPP pointer when no DSPP is
 assigned
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-5-a7ddc6fe2032@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=42MaHuKsi9wtmIKNRqT8ly0SxW0ZKEjpv2W8+Aag/4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoXJtkp6xzhmqkONLh41KlY4RqHvvU3nyLSz
 yg6Ldhr4ICJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFwAKCRCLPIo+Aiko
 1Vw9CACWmy7M/jD5kaRVjaa/LjM93maKtO6/NwlYADO+O4on8dxA8tmlBt9L6s6LHatDjap7D/1
 spoGOXEdS7eZIbybnBNuJEz/INBcSm7hUAz4DWNiLe4rwrCZo7bWdUcawl9cV0UmyTK34k8uBnd
 5qT0uxHad1kYx/vRmw2SIyRZpb0JRiFfgLaEoo535kxuoFrYSHi9eG/fMiKN9VxO0yl1xpnu9ov
 FtLLPcoXAgsmM/aPs0F7AcElqrJ75rFL7qnA0Acq9OHl3g0wDJjNU4dXotQhGlMg7gTnR9sPuzP
 96PVsx/yodrA6p88BXpK93mtklYxAzhJDg+UeL3aO4o8JlFn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BEFtz843CG1aR4EShwm0qXJA_KG0TdMW
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa54a23 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jpbDcG_WXHA3xrgMYRUA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX4Z6bHW0L6ndQ
 /yz6qtffLHoyjVKkltNu5Iot8R7iAILuRGI2USsGZIhKC7QYUHu5fr11RAm+Jo2abWNLsyy2oeR
 ONgSM3apz3aSI68QBFH0GhLWpxZwI9s=
X-Proofpoint-ORIG-GUID: BEFtz843CG1aR4EShwm0qXJA_KG0TdMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX3HkG8w/Cm1gs
 EEMOYQgsMVm9SIU/Jn1XnpJRYXYqAr2iDC/+7+McRXsJkXRHk6YfTsjbKh8hyqkK8ZXOP44dr8B
 12qCqIA8atky7WvDM95gwpY4bJsAU4sGEd3mp42KU/k907VwTe3cYeP9TMwrnLI5HSxAzzBGxh4
 UUU7gw7YMJFBi0wJ9qVv8cpLek/2y2uwnZMq9etVaBgB1HFkZtREheoDM9/U8LErJCXiA8xgUO/
 RdC5ECRqaxOt/JkAY8jPyDEfg7aBkk8+UrhYdCDSPbRNMs9j1iDsXvMO8mElTNXt0up/bSORjPQ
 DFpaK2ktyvKk9F4fTQE7/XkTMDxP+DAPUZCymjZkiCyVd1pMqitttft3oAm/WCxEdH15BVG0s2M
 Yjan8yVQh1b/8TfDTU+UEMQArHei2w3gLHd1Au+h+SNZ4ojch50YZaHbw5M1L3NhIfFpduEZThL
 ObC6UNZdP05PEE51Ghw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120184

dpu_crtc_assign_resources() only stores mixers[i].hw_dspp when the new
topology has a DSPP for that mixer, and dpu_crtc_duplicate_state() copies
the state with kmemdup(), so a crtc which once used a DSPP keeps a pointer
to it for the rest of its life -- across reservations which no longer own
that block.

Assign NULL when there is no DSPP for the mixer.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index bf593020e8e4..5dc0c9aeaa5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1480,8 +1480,8 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		if (i < num_dspp)
-			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+		cstate->mixers[i].hw_dspp = i < num_dspp ?
+			to_dpu_hw_dspp(hw_dspp[i]) : NULL;
 	}
 
 	cstate->num_mixers = num_lm;

-- 
2.47.3

