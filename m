Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB594AF9F3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441844; cv=none; b=jPx7HZd7JP+5Sh3BsORAlLnUnP11Qs0sdanD9lTEI7OPFhjRaYrmOViBUmHymsb9CRh+FsuiGTOIW+2SGde2pIZD5d3VjTFFjp1mWkEvrywfsqNELCb+32IETvyht8kD5Ag99pskppBbtTpuOCioAT36chnxQsd2EP8jMyU+rMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441844; c=relaxed/simple;
	bh=nedhLPNAX4zaxCzJ0ErxJCYfQ9+VkBKgj+h/rOmABcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiN8xxVpwj3y4y2FaRqIZ5piAk6IINxVniHFRrUUBSN8QM49b53/Osxm7bOvK4dzhuMMfQ+8G2Y5/tDdE1U9oG9YmB0fure/DKqDc6Dy+6BXnre1aK9hyUOWQbKa0wXPZ43GLeeGqdYDtxjoa2RnhLA9V07S03Om8PNickQnw94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSeFF5xj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEvPgoXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSeFF5xj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEvPgoXe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAATi1704863
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ODQalE8aYnls1DBAwuyEuvsSahcbelFuNFDbTbCw2s=; b=DSeFF5xjVITpd6KR
	qGla/M/M3mqIvocaCUK5LwRnF2u6+K+9Xoz4DpJrp8oR8yER86u0mkkh5C3cTywO
	vHrnJUotcfJPyWuJNDINLVzzWf/IJr/OaNpTUw1lV12r5QIJuP2NvesEtVzXrHG8
	VkwGtVlJRfPX8E36/qdKOHNKWwTmWD271fuzUNz/ObRQd06MTIBCihv5hGgOrWy7
	1ddHknDTuj+EoJUIcPrzKIkVDO8vpEs79gS1AERTotcR5iiKGUP050vfGoEaeozy
	sToUYmTGpdWVrK979+VlEwmD4PV+/oE9xyKfPSa8OABVZgMOctB0QakEUYaxw+HY
	YSIvhg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b183xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:23:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97bf8f3a38bso174265241.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788441828; x=1789046628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ODQalE8aYnls1DBAwuyEuvsSahcbelFuNFDbTbCw2s=;
        b=HEvPgoXe9cv0eG1iyuOeJQsYKdXo6+b+lUJzGn2kO1Pbiyqu2OdSzouFJ8ImcDz038
         kGTjJJQV25+FnuWiT68brKKvqoNcCoIH1NZq0JeURNDMJPTlKrKEchuUGLrmAsLawq2M
         WADyNJr1a59ayJLLp+YR8XGCWCEqwA0TDTMwn7X/kqaFHLHF+clYYhjOUEKaUh34tufW
         7qo9Cab657qAeU47z0dp4C10BrtHSZgksbp4HkgR2fHa0pVGnw3dYAL1mnMZ45jmBmA4
         gaZ2BhV3sffcZ1+l94gJRcXRTWjA407FABn3nnQt9f6M4B8Ulv4t9rRmMC5b6O/hM6nV
         p1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441828; x=1789046628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ODQalE8aYnls1DBAwuyEuvsSahcbelFuNFDbTbCw2s=;
        b=SDDkUIpd4Nvg5aeCH2wd9KKMgsdB5PxGhQAL0JWDQUBTBqlfBviQ0lS9i3epF8dnbu
         Kgh4gv75a+bAuXX65+TVYtiI6VJO2oaO+dcetFyxeiWsfbW8bTI9yRjkX/zg+WJBErh2
         +pTOjNZ8CgQadJQAEZ7EuEiGkbeGVbZIOe4mSmjRN44r7OkIr8ynsovARYcCCCKAXaSH
         eB16Utv05d9TsLYULmbh/84loojonWid9jcA7nWIF4bm8zzDKQyk7KpBmvhgpIWLvojV
         /13cgK1m8kDzcSxgqciFNTcSx8vJrXGgqV8azsPyCMRSgm4g9yGi0tLnMpMZnhHCEMRg
         chBA==
X-Forwarded-Encrypted: i=1; AKwUvBxtXVaFiCAyMsbvvkB79ScNxxUB2F8G+m7RltjyJMm4l97lVUUXYSGbOWq7+pAUGVpCC7jgmCjkDeIYX+w=@vger.kernel.org
X-Gm-Message-State: AFuF++mT2BguRujxOzTP8blKyZc7jKyVipLviPS7ZG3stzPE4WZpakfl
	1g/ElePsAUSU8e0UhUfMlrd1uTk4WlTZ3dn4lcP6Yj5SjYQvCyG9JaFcruU4hzKyzmOogwHcSTp
	7OfWJAwIf16KjNErVI92MoLzqEMEfd19LfpZJezt15clsODPPjpB3X+h3yPlXpPhfe3o=
X-Gm-Gg: AYBFou0bFfkLQDKzajWk6u187T+Y4c1Y99EmsYBHTqCWQqZbl/N8S/V07tnmQeBKwJy
	/9xJxz2ag9QQB/n3/csH8gumcOhrI3OP0oHvVD0RgXxA5sEEXPYBCyjlxVZHD/3CC+4mXKacwa3
	EhCehT4PUzmwf/V+rT6wAtXfZZbNMPv/D6qwBRB+avBAIKPSRPfRbPwTDh0Xj0ym7poTxFWfMgB
	l7yx52XaUScSr9UWQ2xaJ1V4+AtOK4W+WezD0HtYllMOVJs3Gngwkbo/jIKFAiYkpy7mv8F6DPD
	pEdCJuFE7sE/Oj2G8pibtjlGEdGLSCQWCWMVKiiiJiTvlYYb18U/St62Q3WGBSsjBVlnZjngHSn
	mBtYTjAFMoLJyefb7rGx26RQR3VjemidkM4kr2RXvkUKmAMbn0FyuSZeW2aGPlSlTOkjrSC6GoZ
	BP5tIjRiy8cd5Z
X-Received: by 2002:a05:6102:50ac:b0:785:c643:a415 with SMTP id ada2fe7eead31-78a1f3c8040mr3997208137.12.1788441827477;
        Thu, 03 Sep 2026 06:23:47 -0700 (PDT)
X-Received: by 2002:a05:6102:50ac:b0:785:c643:a415 with SMTP id ada2fe7eead31-78a1f3c8040mr3997188137.12.1788441826959;
        Thu, 03 Sep 2026 06:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606da57e9sm1296480e87.83.2026.09.03.06.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:23:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 16:23:41 +0300
Subject: [PATCH 2/2] drm/msm: release scanout framebuffers only after a
 vblank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-fd-kms-fix-smmu-v1-2-608d02491666@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13031;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nedhLPNAX4zaxCzJ0ErxJCYfQ9+VkBKgj+h/rOmABcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqmXTeI5I0tevhDqkaESaRxGEHzA2ppgupgBujd
 pPN7LWZ5pqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCapl03gAKCRCLPIo+Aiko
 1UGFB/9wse2uxkXco0AbEL0MaeYKRjevzAxkQw05LGfcQyhXbd/PJqlLikti/ZuqI3b3pNQIhgG
 A1WRs9akt6pniotgje/gav1J4DgbYCfPWblxh2WzrnhchNd8LOftYfpRGgDI9TDb95GlMomtV2n
 bO7sPuA7sk2VlNVJZYbiw4KxJ1h/+tG8/lA7MqTw9HmIcjcqjzkYkFOdSyZ2Owrv4pJ4VpLB/JL
 CXkwjk32Mkghy6BPsgqSKIKxmeirshaIkETiv59m69FHG75nMt1Xm2bvROQoiK4oUPi6kScqNjE
 kio+7fsfZA2+pWYID4OC+1lFiUY5Q9S7/td6YGvsZotjUFBT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -Z5QbjRjXGHbFlPcWsLOJavvVziMbm8v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfX+eeHTVgl1IEk
 EIjRx4BJjag/ep7uLnK35ZcQLaG3ElUKkqBCtjtl6A+Xq6vmPXTKK0lcRw+wfKRxxHcVyaT4nBD
 sJ16+7qurCYyVq3nciZNz/hWSGxSUJI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNiBTYWx0ZWRfXzPGwxv4tWSgS
 iNM1hEobstMCmY2JVw2l8qPGLRelrquDVzP3RHmh570W65sNgxkhIk8/M1HuJiY/7eYP3tKnMRw
 f+/HJsR3HLKIz57uY6n19qTelmR6wNjIVzHZW+pD250UtAvzrc/KCzqohmKEwq2kCcY3rpPcyV9
 FslTAzHkgB0H2FE8r6efwAqa8SekJYCbdtlcvyU3GtOMMPM3NiVmdOc+5CC4RNg69eeiblriaO4
 8WcQgy/3IorXk1il25PjJukcVxL6YFLMqxRfih1aw5G/GHjybUSxlA8af/3/AMPSTzBxzXHjv/5
 3qFyo/uVoLqwpRTkH2yCge64fFWVN9KGYEEQE9opF7yB0nW8cwebfPM/e3LKHfe1h7J+w8hk6lw
 lzqNTXmxohPea91BC4OWIt1AJ9v/qicoUF5OG0rIVMtHQEZNQJuoEIDc+aOeLJRtbfK5qucgRV3
 r2mof0yVL2irxd1gmzw==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9974e4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wGqaUCltirg6dY4VYU0A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: -Z5QbjRjXGHbFlPcWsLOJavvVziMbm8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030116

msm_framebuffer_cleanup() releases a framebuffer as soon as
drm_atomic_helper_cleanup_planes() runs.  msm_atomic_commit_tail() waits
only for ->wait_flush() before that, which for video mode waits for
CTL_FLUSH to read back zero, ie. for the new configuration to be latched;
the frame in flight with the old one is still being fetched.  Since
commit 111fdd2198e6 ("drm/msm: drm_gpuvm conversion") the unpin also
detaches the vma, so the display is left reading unmapped memory:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x007eb100, fsynr=0x3f0023, cbfrsynra=0xc20, cb=27

Defer the release: hand the retired framebuffer to the crtc and drop the
pin and the vma reference from a drm_flip_work committed from the vblank
irq, as mdp4 and mdp5 already do for their LM cursor buffers.  A vblank
reference is held while work is outstanding; a crtc with no vblank is not
fetching, so it releases immediately.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  3 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  6 +-
 drivers/gpu/drm/msm/msm_kms.c                      | 88 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      | 29 +++++++
 11 files changed, 132 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 42d0a529b4d5..bf593020e8e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1213,7 +1213,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	}
 
 	/* Disable/save vblank irq handling */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev,
 				  old_crtc_state->encoder_mask) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 22433bfbea1e..5db33e49c345 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -615,7 +615,7 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 	if (!job->fb)
 		return;
 
-	msm_framebuffer_cleanup(job->fb, false);
+	msm_framebuffer_cleanup(job->fb, NULL, false);
 	wb_enc->wb_job = NULL;
 	wb_enc->wb_conn = NULL;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7b92082d35a6..0e986b533bf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -684,7 +684,8 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", old_state->fb->base.id);
 
-	msm_framebuffer_cleanup(old_state->fb, old_pstate->needs_dirtyfb);
+	msm_framebuffer_cleanup(old_state->fb, old_state->crtc,
+				old_pstate->needs_dirtyfb);
 }
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 57dfce58450b..195ee6b4a0c6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -267,7 +267,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
 		return;
 
 	/* Disable/save vblank irq handling before power is disabled */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
 	mdp4_disable(mdp4_kms);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 9459f70ce0ba..5f669a02d798 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -97,7 +97,7 @@ static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", mdp4_plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, false);
+	msm_framebuffer_cleanup(fb, old_state->crtc, false);
 }
 
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 4c4a897fc1ee..547f6fdb83d5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -499,7 +499,7 @@ static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
 		return;
 
 	/* Disable/save vblank irq handling before power is disabled */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	if (mdp5_cstate->cmd_mode)
 		mdp_irq_unregister(&mdp5_kms->base, &mdp5_crtc->pp_done);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 841f444a8d68..dacb387d9bb6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -155,7 +155,7 @@ static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, needed_dirtyfb);
+	msm_framebuffer_cleanup(fb, old_state->crtc, needed_dirtyfb);
 }
 
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index eb4bbae8557b..18a9728838fd 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -254,7 +254,8 @@ int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
 int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb);
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, struct drm_crtc *crtc,
+			     bool needed_dirtyfb);
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 934337202afd..0865ecce77de 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -112,7 +112,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	return ret;
 }
 
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, struct drm_crtc *crtc,
+			     bool needed_dirtyfb)
 {
 	struct msm_drm_private *priv = fb->dev->dev_private;
 	struct drm_gpuvm *vm = priv->kms->vm;
@@ -127,6 +128,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 
+	if (crtc && msm_crtc_queue_fb_unpin(crtc, fb))
+		return;
+
 	for (i = 0; i < n; i++) {
 		msm_gem_unpin_iova(fb->obj[i], vm);
 		msm_gem_vma_put(fb->obj[i]);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..bf56fbe99a34 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -11,6 +11,7 @@
 #include <uapi/linux/sched/types.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
 #include <drm/clients/drm_client_setup.h>
@@ -165,6 +166,89 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
+void msm_kms_fb_unpin_worker(struct drm_flip_work *work, void *val)
+{
+	struct drm_framebuffer *fb = val;
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct drm_gpuvm *vm = priv->kms->vm;
+	int i, n = fb->format->num_planes;
+
+	for (i = 0; i < n; i++) {
+		msm_gem_unpin_iova(fb->obj[i], vm);
+		msm_gem_vma_put(fb->obj[i]);
+	}
+
+	drm_framebuffer_put(fb);
+}
+
+static void msm_kms_fb_unpin_vblank(struct kthread_work *work)
+{
+	struct msm_kms_fb_unpin *fb_unpin =
+		container_of(to_drm_vblank_work(work), struct msm_kms_fb_unpin,
+			     vblank_work);
+
+	drm_flip_work_commit(&fb_unpin->work, fb_unpin->kms->wq);
+}
+
+int msm_kms_init_fb_unpin(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, dev) {
+		unsigned int idx = drm_crtc_index(crtc);
+
+		if (idx >= ARRAY_SIZE(kms->fb_unpin))
+			return -EINVAL;
+
+		drm_vblank_work_init(&kms->fb_unpin[idx].vblank_work, crtc,
+				     msm_kms_fb_unpin_vblank);
+	}
+
+	return 0;
+}
+
+/*
+ * drm_crtc_vblank_off() drops pending vblank works without running them, so
+ * flush the retired framebuffers first.  The encoder is disabled before the
+ * crtc, so the hardware has already stopped fetching by this point.
+ */
+void msm_crtc_vblank_off(struct drm_crtc *crtc)
+{
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int idx = drm_crtc_index(crtc);
+
+	if (kms && idx < ARRAY_SIZE(kms->fb_unpin)) {
+		drm_vblank_work_cancel_sync(&kms->fb_unpin[idx].vblank_work);
+		drm_flip_work_commit(&kms->fb_unpin[idx].work, kms->wq);
+	}
+
+	drm_crtc_vblank_off(crtc);
+}
+
+/* Returns false if the caller should release @fb itself */
+bool msm_crtc_queue_fb_unpin(struct drm_crtc *crtc, struct drm_framebuffer *fb)
+{
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int idx = drm_crtc_index(crtc);
+
+	if (!kms || idx >= ARRAY_SIZE(kms->fb_unpin))
+		return false;
+
+	drm_framebuffer_get(fb);
+	drm_flip_work_queue(&kms->fb_unpin[idx].work, fb);
+
+	/* no vblank to wait for: the crtc is off, so it is not fetching */
+	if (drm_vblank_work_schedule(&kms->fb_unpin[idx].vblank_work,
+				     drm_crtc_vblank_count(crtc) + 1, true) < 0)
+		drm_flip_work_commit(&kms->fb_unpin[idx].work, kms->wq);
+
+	return true;
+}
+
 static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_kms *kms = arg;
@@ -323,6 +407,10 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		goto err_msm_uninit;
 	}
 
+	ret = msm_kms_init_fb_unpin(ddev);
+	if (ret)
+		goto err_msm_uninit;
+
 	pm_runtime_get_sync(dev);
 	ret = msm_irq_install(ddev, kms->irq);
 	pm_runtime_put_sync(dev);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f25b31e502d2..4b73132b5f6e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -11,6 +11,9 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_flip_work.h>
+#include <drm/drm_vblank_work.h>
+
 #include "msm_drv.h"
 
 #ifdef CONFIG_DRM_MSM_KMS
@@ -135,6 +138,16 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
+/* Retired scanout framebuffers, released after the crtc's next vblank */
+struct msm_kms_fb_unpin {
+	struct drm_flip_work work;
+	struct drm_vblank_work vblank_work;
+	struct msm_kms *kms;
+};
+
+void msm_kms_fb_unpin_worker(struct drm_flip_work *work, void *val);
+int msm_kms_init_fb_unpin(struct drm_device *dev);
+
 struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
@@ -170,8 +183,13 @@ struct msm_kms {
 
 	struct workqueue_struct *wq;
 	struct msm_drm_thread event_thread[MAX_CRTCS];
+
+	struct msm_kms_fb_unpin fb_unpin[MAX_CRTCS];
 };
 
+bool msm_crtc_queue_fb_unpin(struct drm_crtc *crtc, struct drm_framebuffer *fb);
+void msm_crtc_vblank_off(struct drm_crtc *crtc);
+
 static inline int msm_kms_init(struct msm_kms *kms,
 		const struct msm_kms_funcs *funcs)
 {
@@ -193,6 +211,12 @@ static inline int msm_kms_init(struct msm_kms *kms,
 		}
 	}
 
+	for (i = 0; i < ARRAY_SIZE(kms->fb_unpin); i++) {
+		kms->fb_unpin[i].kms = kms;
+		drm_flip_work_init(&kms->fb_unpin[i].work, "fb unpin",
+				   msm_kms_fb_unpin_worker);
+	}
+
 	return 0;
 }
 
@@ -203,6 +227,11 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 
+	for (i = 0; i < ARRAY_SIZE(kms->fb_unpin); i++) {
+		drm_vblank_work_cancel_sync(&kms->fb_unpin[i].vblank_work);
+		drm_flip_work_cleanup(&kms->fb_unpin[i].work);
+	}
+
 	destroy_workqueue(kms->wq);
 }
 

-- 
2.47.3

