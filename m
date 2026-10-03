Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C3F29B781
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987443; cv=none; b=a51jWmgT6MTjM2SV7NYhDqUa71V6mDfcA6K1j2ocIbryNq7oOLeCQ8mb5kBNYy30SsnHAXZRT0lWaArCAgwwrY00VNtmSu4AcYKiMib63pR8UcQF+6lJj9LtP7Dfsm3ZHECO3MWDvNfaKNtoccpByc3z/S9bgpY5bzmCh51o4wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987443; c=relaxed/simple;
	bh=EVcI057PyB69oUMnfjI89yk1g+0OwHMMkZZ5kNYBDCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WzrB9iCQVCnruxeNBcztPZjyjDw5LRLI8k6Wdy4nSaRu7ZZA4pzHx5C0FjisI5tVvgUUmw2r3LdqRMqyN11wUqYcJZic/v/zPWYepdVSBTWisNLtpww+DL3JBpd22uAoAmp8rCCY2zmV4bsBJg6WyrcDzdBsGSBdL3gF95A2qi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iDNZjF2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgiiQfIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iDNZjF2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgiiQfIg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeJoI2309797
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aI45LyrzzzDk53JTH+dNaLaHu2bi2uW7rxVMRbRdyGE=; b=iDNZjF2V/8kmxLia
	4Tayc/lIzRq+cu88il84dj6UIaVw4Z31wEZfO1LWquzawfm7psuZxHHfRmm3RV59
	wgyVYzKSgcNnpgUaTqzRrl2T4EDfqfX9And0V369lrhB7Bd5VXlecjj7UVVFVyGz
	Go6JHoXACjFz1Uu3JHu2OWZMPas9f5BtjrB8ZOMIppJAyzNpM/IzzJOidW+eNdFK
	khIbK0N6bShy0Q/keSbd9qSgQUi2sQO9SnpfJLXJKIrRCAfUtKUKBzFz9RBXDmHT
	76T95jW0UUbXeVaTDDN41CjC7rd97+BIBbh4qebHWvYakBjwAdzDAqcHs7FKZWai
	GrHbqg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3da2m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so34607085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987434; x=1791592234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aI45LyrzzzDk53JTH+dNaLaHu2bi2uW7rxVMRbRdyGE=;
        b=GgiiQfIgaleTBFsx7wRO3K+/BfjHdGKHuTxckE3vW2ADx/TG4DkJ6S+km8m7Csp252
         wucoVMiB1dy0G0oBuuawGzDdpIbTdsAHkUGfR9aNQV1tgTcQBfnQUbf9YwbSDEDF/t83
         j7DI99Z8Dir9CJifBumKZRpPMxwJHwX6Aas38JTVwr02OP3NSnkIRx5LVGJrcFBagDx9
         pP5d61G9yRlROtGNJy/COlSJ0k6ZVIffPxdlXH6MOv+kOK5vKy60srrq/sN6WHz7HauG
         v1immX6ClvmxHv/fFvd0nxemTV0C0cCtN+z5FDFmMkMizl2emjrRMThc9kp+eLEVWUBX
         l7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987434; x=1791592234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aI45LyrzzzDk53JTH+dNaLaHu2bi2uW7rxVMRbRdyGE=;
        b=ksWuPh1QO+DFI4dm11zSZYPqi2u9qBltR2LbOj/o5rwMN2SSe6J0BrsVq4vEtJGOiN
         34gIpnAOUGRNMF9zOpizmo32CPKM8KovXJoJYUnENZqIPC8rW4uW2y7HoZHU8uUI/Rg+
         XA1P3k5JohjPMwS7Zbd+8fsmpPBq98ygZu6g4nkcKi4r0HRznB8Bxphahg7YlcfSXiea
         nkDq1ewHS1ggidD6N4L/b5IZ8E6+9QEPGAK1NFKXVyK7vDL3XIP/RGeZ7V8/iRKD7PmC
         a7lim8OUIYTcXaLrMu78JQ+H2MwnyJuNCDDzGeHwNAdhOUhpuXeuIV7TA8sa8ctrgsUY
         VpAw==
X-Forwarded-Encrypted: i=1; AKwUvByq9D/LRAZqCltRtZU4C/TIg+d4640EoPUJgno/vbpZobHhtch5r9W13gLzLMsKqnYTwftDNQ6j4/QZraM=@vger.kernel.org
X-Gm-Message-State: AFuF++lKdXlAfNN7KUqiDQxir/fcoHp0l/YCWPFwYdhVR+m2xOrmykeW
	/erc6Xq5+HXSSkgqcAANzXS/F8q5rmMBTL0pM1hvZ/wZ4l0lEX4L7xO1o12oJ+sQc4U7+AYYq2V
	8WpEdwu+g78TIiUMJPfVpJMbiKB9nMyQVk4JZM+Yxv3+hjnAIMZkuvL3MrLgkV0FQuYs=
X-Gm-Gg: AYBFou1rRiTgMATmjxjeJzXdG5lBGrGMeOXsPlEcr1Q/7uJoLGqB+Gl9wKCpaX+9AuQ
	ldnz3FHissNlef9lJZyA6w2BiZ+kWiROTehQUM5kmPpJjpb4UtkjleiWo+0f3AFsD/xroDgYhaM
	3l3390Pu6rQzx+CCuT31GM9GAWfmOpp84fyLnr4AqK4ZrqGsOnabvVxNUQZvzrUBJsDZAf3+J6i
	MluMw6JK0n8+9ABBuGFskc2XUqpV1JNIkG3JXwwQ7QmUXJaMgGPi2e2y5eg3vjh5Cj+gZ5vexLW
	pX9ZbZlMpS1K5GioQX0qgjopCGjgTwGlXu7jFwlcL+q4N3RnZgz2waSHgr/MvPeundM3Q5VmlHR
	qEGARDCThd78eE9hrUoGyfRE0RsU9ZJBQTM2R+49cRa+AO6AwTr7HHa0qz9aC1TOyqXoc/3Ranq
	HfMjQ6eAG+kefu
X-Received: by 2002:a05:620a:2319:20b0:93a:14c3:72c2 with SMTP id af79cd13be357-93cf16e82f1mr595524285a.29.1790987433924;
        Fri, 02 Oct 2026 17:30:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2319:20b0:93a:14c3:72c2 with SMTP id af79cd13be357-93cf16e82f1mr595518885a.29.1790987433132;
        Fri, 02 Oct 2026 17:30:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:18 +0300
Subject: [PATCH v4 03/10] drm/msm: release scanout framebuffers only after
 a vblank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-3-2a44d4d8ac77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15578;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVcI057PyB69oUMnfjI89yk1g+0OwHMMkZZ5kNYBDCc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEydPM741s52GQrQAnuY6lvYTNPUuel39Ph8Z
 JedbyDQdhOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMnQAKCRCLPIo+Aiko
 1a2NB/9p5mwD4kS5CfNOdbNEeh4bu7kTVkxBw6D2cyX1FqHNL43BLTfdsjH1XB3Oxm3KxxnOGL7
 et4AQg5zgeXHBHsXla623wFeFVHZJ9S6TVtv/PH2Mg8lZiSCM08ewNrZaw/dQjST1w7uOyP2qDp
 OiPCpomdDb05DG0h3Rgtv5MdFB7/eli36hG2x5c3t4U31Nlcvs6oN5QxPueP1zNq0JUJcgzfP1e
 kNTnHgbBA022ofNIm7EX1cUGx6bAO5MRryk28VcI7QqesRvDGdGEPsmjXoaZzZSWmQ93qFLTj9D
 V4CoFk7cfWUodB+wAj2UbvDg7Q1LBBujrrRS/oftReKbgTmD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: EWCL2_Bc7fStSsJFDV8Pjr6L3dNCrMz7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX0YS/5w4R/fvF
 yzpyd2+x+oryWdffGglOZ+cH361M82KC5F5ijiEub2Us4wl9KyOat5jOlrkumrvvFIor+WSUt4+
 CWj4RuwVFtddD/wEbwV9+WgpH+L/Bxs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXykjNzowr4Pys
 YgeBqos46MkrDpbvANrSDUP4hgLaXcLOd6VminHG7GkEpUsdAmV+m5gHVJaSpX0xbAmlrk7Sbjq
 c2qrh/LHnw9lPHWda8wRS03BF/7E397OSjjeltw09TdGeJUdE8V4mhsIMOBBi7ACKo5eVYy+vbk
 TZtm/+P503miCahiYBaDKcCqg48oN6ArgtSRa7cSEyNpEToJdo4dcT5siIAo8mi3MA19zpCO1pD
 4w5/bGiRbZuHOp6unq4WRahQzZmQk40zD057uT9gYiyjo5VZsIk8u9tXafQtc8beXQh3J3UsV2f
 hAe1KrNTZPBHhVAZHIbDGehyzSwZSgv9z2+2rFNdHneCxGLGZH1DovRLEFqIaHxt26tbL0XzLEg
 D9w+Kv/n7JuXdGFpueknMjAUEsi2Wx2qwgHC+CTZie6OQaGEHWXUu46CvadIl5pyYXCl+19PDGJ
 ZSiWQaRB0UWtS7G/zVg==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac04cab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RRHiXG5J_6CujISSfyUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EWCL2_Bc7fStSsJFDV8Pjr6L3dNCrMz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

msm_framebuffer_cleanup() releases a framebuffer as soon as
drm_atomic_helper_cleanup_planes() runs.  msm_atomic_commit_tail() waits
only for ->wait_flush() before that, which for video mode waits for
CTL_FLUSH to read back zero, ie. for the new configuration to be latched;
the frame in flight with the old one is still being fetched.  Since
commit 111fdd2198e6 ("drm/msm: drm_gpuvm conversion") the unpin also
detaches the vma, so the display is left reading unmapped memory:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x007eb100, fsynr=0x3f0023, cbfrsynra=0xc20, cb=27

Hand the retired framebuffer to the crtc instead and drop the pin and the
vma reference from a drm_vblank_work, as i915 does for its cursor
framebuffers.  The work holds a reference on the framebuffer, and
drm_vblank_work_schedule() holds a vblank reference until it runs.

The pin count is dropped by the deferred work rather than by
->cleanup_fb(), so a framebuffer scanned out by several crtcs stays pinned
until the last of them has passed a vblank, not until the last one has
retired it.  Deferring here also covers the async plane update path, which
has no commit tail at all: drm_atomic_helper_async_commit() programs the
hardware and drm_atomic_helper_unprepare_planes() releases the old
framebuffer straight away.

A crtc which is being switched off stops fetching, and its interface has
already been disabled by the time the helpers get to its planes, so no
further vblank arrives to run the pending works: keep them on a list per
crtc and release them by hand from msm_crtc_vblank_off().  A framebuffer
retired once that has happened is released directly.  Whether the vblank
is off is tracked next to the list rather than read from crtc->state,
which a following commit may already have swapped in, and a work is added
to the list and scheduled under the same lock, so that
msm_crtc_vblank_off() cannot free it in between.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  19 ++-
 drivers/gpu/drm/msm/msm_kms.c                      | 142 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      |  19 +++
 11 files changed, 190 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 42d0a529b4d5..1f8fce366a1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1213,7 +1213,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	}
 
 	/* Disable/save vblank irq handling */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev,
 				  old_crtc_state->encoder_mask) {
@@ -1301,7 +1301,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	}
 
 	/* Enable/restore vblank irq handling */
-	drm_crtc_vblank_on(crtc);
+	msm_crtc_vblank_on(crtc);
 }
 
 static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
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
index 57dfce58450b..2d73ac3d85f2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -267,7 +267,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
 		return;
 
 	/* Disable/save vblank irq handling before power is disabled */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
 	mdp4_disable(mdp4_kms);
@@ -297,7 +297,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc *crtc,
 	mdp4_enable(mdp4_kms);
 
 	/* Restore vblank irq handling after power is enabled */
-	drm_crtc_vblank_on(crtc);
+	msm_crtc_vblank_on(crtc);
 
 	mdp_irq_register(&mdp4_kms->base, &mdp4_crtc->err);
 
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
index 4c4a897fc1ee..e9e55927655e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -499,7 +499,7 @@ static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
 		return;
 
 	/* Disable/save vblank irq handling before power is disabled */
-	drm_crtc_vblank_off(crtc);
+	msm_crtc_vblank_off(crtc);
 
 	if (mdp5_cstate->cmd_mode)
 		mdp_irq_unregister(&mdp5_kms->base, &mdp5_crtc->pp_done);
@@ -527,7 +527,7 @@ static void mdp5_crtc_vblank_on(struct drm_crtc *crtc)
 	count = intf->mode == MDP5_INTF_DSI_MODE_COMMAND ? 0 : 0xffffffff;
 	drm_crtc_set_max_vblank_count(crtc, count);
 
-	drm_crtc_vblank_on(crtc);
+	msm_crtc_vblank_on(crtc);
 }
 
 static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
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
index eb4bbae8557b..dc279a99e257 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -254,7 +254,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
 int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb);
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, struct drm_crtc *crtc,
+			     bool needed_dirtyfb);
+void msm_framebuffer_unpin(struct drm_framebuffer *fb);
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 792d47b4acc4..cc71c42d4e12 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -130,13 +130,10 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	return 0;
 }
 
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
+void msm_framebuffer_unpin(struct drm_framebuffer *fb)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 
-	if (needed_dirtyfb)
-		refcount_dec(&msm_fb->dirtyfb);
-
 	guard(mutex)(&msm_fb->lock);
 
 	if (--msm_fb->prepare_count)
@@ -146,6 +143,20 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	msm_framebuffer_unpin_planes(fb, fb->format->num_planes);
 }
 
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, struct drm_crtc *crtc,
+			     bool needed_dirtyfb)
+{
+	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
+
+	if (needed_dirtyfb)
+		refcount_dec(&msm_fb->dirtyfb);
+
+	if (crtc && msm_crtc_queue_fb_unpin(crtc, fb))
+		return;
+
+	msm_framebuffer_unpin(fb);
+}
+
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 7e1df472592d..cb497d419ab8 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -11,8 +11,10 @@
 #include <uapi/linux/sched/types.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_vblank_work.h>
 #include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
@@ -165,6 +167,146 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
+struct msm_fb_unpin_work {
+	struct drm_vblank_work base;
+	struct list_head node;
+	struct msm_kms_fb_unpin *pending;
+	struct drm_framebuffer *fb;
+};
+
+static void msm_kms_fb_unpin_release(struct msm_fb_unpin_work *unpin)
+{
+	msm_framebuffer_unpin(unpin->fb);
+	drm_framebuffer_put(unpin->fb);
+	kfree(unpin);
+}
+
+static void msm_kms_fb_unpin_work(struct kthread_work *work)
+{
+	struct msm_fb_unpin_work *unpin =
+		container_of(to_drm_vblank_work(work), struct msm_fb_unpin_work,
+			     base);
+	struct msm_kms_fb_unpin *pending = unpin->pending;
+
+	scoped_guard(spinlock, &pending->lock) {
+		if (list_empty(&unpin->node))
+			return;
+		list_del_init(&unpin->node);
+	}
+
+	msm_kms_fb_unpin_release(unpin);
+}
+
+void msm_crtc_vblank_on(struct drm_crtc *crtc)
+{
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int idx = drm_crtc_index(crtc);
+
+	drm_crtc_vblank_on(crtc);
+
+	if (!kms || idx >= ARRAY_SIZE(kms->fb_unpin))
+		return;
+
+	scoped_guard(spinlock, &kms->fb_unpin[idx].lock)
+		kms->fb_unpin[idx].vblank_off = false;
+}
+
+/*
+ * The crtc stops fetching here, and with it the vblanks the pending works are
+ * waiting for, so release the framebuffers directly.
+ */
+static void msm_kms_fb_unpin_release_all(struct msm_kms_fb_unpin *pending)
+{
+	struct msm_fb_unpin_work *unpin;
+
+	scoped_guard(spinlock, &pending->lock)
+		pending->vblank_off = true;
+
+	for (;;) {
+		scoped_guard(spinlock, &pending->lock) {
+			unpin = list_first_entry_or_null(&pending->fbs,
+							 typeof(*unpin), node);
+			if (unpin)
+				list_del_init(&unpin->node);
+		}
+
+		if (!unpin)
+			break;
+
+		drm_vblank_work_cancel_sync(&unpin->base);
+		msm_kms_fb_unpin_release(unpin);
+	}
+}
+
+void msm_crtc_vblank_off(struct drm_crtc *crtc)
+{
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int idx = drm_crtc_index(crtc);
+
+	if (kms && idx < ARRAY_SIZE(kms->fb_unpin))
+		msm_kms_fb_unpin_release_all(&kms->fb_unpin[idx]);
+
+	drm_crtc_vblank_off(crtc);
+}
+
+/*
+ * Publish and schedule the work in one go under the lock, as
+ * msm_crtc_vblank_off() frees whatever it finds on the list.
+ */
+static bool msm_kms_fb_unpin_schedule(struct msm_kms_fb_unpin *pending,
+				      struct msm_fb_unpin_work *unpin,
+				      struct drm_crtc *crtc)
+{
+	guard(spinlock)(&pending->lock);
+
+	if (pending->vblank_off)
+		return false;
+
+	list_add_tail(&unpin->node, &pending->fbs);
+
+	if (drm_vblank_work_schedule(&unpin->base,
+				     drm_crtc_vblank_count(crtc) + 1, true) == 1)
+		return true;
+
+	list_del_init(&unpin->node);
+
+	return false;
+}
+
+bool msm_crtc_queue_fb_unpin(struct drm_crtc *crtc, struct drm_framebuffer *fb)
+{
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	unsigned int idx = drm_crtc_index(crtc);
+	struct msm_kms_fb_unpin *pending;
+	struct msm_fb_unpin_work *unpin;
+
+	if (!kms || idx >= ARRAY_SIZE(kms->fb_unpin))
+		return false;
+
+	pending = &kms->fb_unpin[idx];
+
+	unpin = kzalloc_obj(*unpin);
+	if (!unpin)
+		return false;
+
+	unpin->fb = fb;
+	unpin->pending = pending;
+	drm_framebuffer_get(fb);
+
+	drm_vblank_work_init(&unpin->base, crtc, msm_kms_fb_unpin_work);
+
+	if (msm_kms_fb_unpin_schedule(pending, unpin, crtc))
+		return true;
+
+	drm_framebuffer_put(fb);
+	kfree(unpin);
+
+	return false;
+}
+
 static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_kms *kms = arg;
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 517622367cc0..1764a1849f4e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -133,6 +133,13 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
+struct msm_kms_fb_unpin {
+	/* protects the list of framebuffers waiting for a vblank: */
+	spinlock_t lock;
+	struct list_head fbs;
+	bool vblank_off;
+};
+
 struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
@@ -168,8 +175,14 @@ struct msm_kms {
 
 	struct workqueue_struct *wq;
 	struct msm_drm_thread event_thread[MAX_CRTCS];
+
+	struct msm_kms_fb_unpin fb_unpin[MAX_CRTCS];
 };
 
+bool msm_crtc_queue_fb_unpin(struct drm_crtc *crtc, struct drm_framebuffer *fb);
+void msm_crtc_vblank_on(struct drm_crtc *crtc);
+void msm_crtc_vblank_off(struct drm_crtc *crtc);
+
 static inline int msm_kms_init(struct msm_kms *kms,
 		const struct msm_kms_funcs *funcs)
 {
@@ -179,6 +192,12 @@ static inline int msm_kms_init(struct msm_kms *kms,
 	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
 		mutex_init(&kms->commit_lock[i]);
 
+	for (i = 0; i < ARRAY_SIZE(kms->fb_unpin); i++) {
+		spin_lock_init(&kms->fb_unpin[i].lock);
+		INIT_LIST_HEAD(&kms->fb_unpin[i].fbs);
+		kms->fb_unpin[i].vblank_off = true;
+	}
+
 	kms->funcs = funcs;
 
 	kms->wq = alloc_ordered_workqueue("msm", 0);

-- 
2.47.3

