Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F31429D288
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217310; cv=none; b=KV+WG3MsmJLoV7lQvVNSEojTSc+nR/NPOCvNcdJ0wJJl2aYBDBUISwboQl6F8fkVH8kiQW1Xd3qou99023DD5qsk7LoSPl4lC9b4zeJpOYb3D137da22CV5KKGA9+jegALspG1t5xlL+DGfrrcFNTxbEcbWbAPwz20lzxp2o7U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217310; c=relaxed/simple;
	bh=acXpo3fnBBm44TAaGvVzO4K2+eb1q1qZfnXA9/f95ts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EOXBfyn4Vju4+v+NGlGOjODYFpi3tcGraxh1WL/7dLrKW3RjMKxiUo7rPN4kzulALTpaw3LKDjDsIR350admOdQLc3XJE1PFhEzcmDRe+33EopHVR8k/u5iW4/7r1z0tL6pGOzP9cE6f205/3UmNCDmwoqxs+Z09AZf628zLS1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFKsH+4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yi3isKMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFKsH+4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yi3isKMv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBeiNJ2883527
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3fdU3zA0kEiuqx4voQsN2c
	ygEglGYO5We2HH28Bi7MQ=; b=DFKsH+4mdc8BSHs3A0Q3d/TAcoebngghKR3ZXP
	Czb6aG32Q1bXfkiAgU7PnK0KoCsO9TVFtFtC170rf57JVMtgTuWrRcjngn1WxNx7
	rgvTqNRHDwlJwfLC1eLZe5nEKIQty0ivNV8iVVGTkK8wNV1SB/pzCJWkLvfZK6jX
	ig6hiL8Of4UUuryCd/4J8DFtJSNMzkSnDXhvS1DE8+aJkBQKN9DNLYSQoQ/yg2rS
	nhEy3bTDG/9cNb4/5qdwMHRo8L8Nawzno00dzp/hmUayeQ3Sr06TFiTkKyXfyi+/
	JHIXkqlRt3AI9iVJKGvtb9Dwf/f2n7MAXsKfWBppEJRqRSfA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c0xmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-79014f0b44cso1556088137.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217306; x=1789822106; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fdU3zA0kEiuqx4voQsN2cygEglGYO5We2HH28Bi7MQ=;
        b=Yi3isKMvf8s3s3OIVm30CqAc8cEPyldoLffGyNYe8EI4y9hKzUQ7+a5KQqAhWOb9ob
         Y0DYwx7gK3eK80fYY1KlqSXSyvPfwel8wN8ySsmTEwMraTvfR5AHEvaTMaGntdhlNMgP
         K/awe52pNXa0EIEbUvY7xXsIenHW+LbaTo2fpw5KJ7vYoCQrXYvwbE6603nOg6rZXdTg
         cvIwTv81AtO/IITUiJqcWll07ak3XZU/XDr9Hr4z1meW5KZktRKQN/7BWQFy3sOPWvwf
         uBVWwqB2D5LrwXCUkhBiVcUfSZ+9BrDSRVYgeLE3uy+tXQAIXDhFF5MHeJQEuDGJts7B
         XsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217306; x=1789822106;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3fdU3zA0kEiuqx4voQsN2cygEglGYO5We2HH28Bi7MQ=;
        b=gDg5/L3M03PckQDix5NmEMn+KNAu0vybZ3Co5z9uTFdQiHhfiFQBCfww/Cl7hE6Gn2
         OLespXOeEBLaWCRG9QhPzSgoUhyfhR8feebI4xOVni6damlHSpxHNVZux4Eg+rWvzPdQ
         0HtXiFpov89SPtehsdXa2erMzx5L2zyKBUfprQGtNodj86LJhKo9VnGHK/DjEYU3V88Y
         aAt/e7e5boG4GrFyexlM2/U4DZgeKoE00IJcvfubn9Q9/6VftQtakBU868Idnjv/FMa8
         ubWWyyIv1g8EfYxaeayt0VpQm0fpuYheEpebtlIMB9dwHG1VQwGFh6AOn4YNzJwpvry3
         AhAg==
X-Forwarded-Encrypted: i=1; AKwUvByhytQBpa0TSR5vZ6WNDe3c7OxJUHhoNEWzTg1MXDNW0HcFyTtF2WDWes+MNf3ibT6RQsU+m0y/o1SYUD8=@vger.kernel.org
X-Gm-Message-State: AFuF++nVyxPHFiKD/vm557CpgwDFyDiRfxh8MZp8JtdqXEGKqRipQHkm
	ghpD9UJBqba3bLrbK8KBwBmd1CBlDJVjCWqU69bDnXD36H1ErP7jvO+FcGXsAjbXHcdzCkvtoCI
	/5WjHAUKAdbRvZrG6rZPCqUStnx7bBSWjQQCkvlOKHWDQ9CScF0i6SoVCvY8G1p6w7OY=
X-Gm-Gg: AYBFou3cVk/66FEq5+UeA6AeGbywFaDDSFgviubbQFU+3KByJpY+zDk2I6bq9IRP6uS
	OEVbtynvSM8dL+V1YKy4AguR/zgRj/8EWP//D1kuDrOOob669nCasa7WFLRclShYC2lswDXEppF
	FPn/WLLllOcU8AV/0OTYiIjhAvs+VEDBvETrVm3KNoIFC0qGsHNQZsXOWsRntUt2wB7neFzTNsx
	6V/TosrlovisF0ty2Si0s2HUwWViZL5IujaJV4xedKHDNYwTzHm0JqaifG97EfOfPkgRtBZ7zKZ
	Jkf062rtdpifqGHlDiF6Elc38ok+UPsl69YzYcfvHdfp/P2FzyKu3CViV/IomJrMaw5ssddpWiA
	gDZUWA9ijjWOJZFM4JXkYVltexgs3dWS9lPmInamLNzhIC7dydsH9sOB/sVWw3G03wWVQXV+dXQ
	n2PqAf0/MiBRbi
X-Received: by 2002:a05:6102:32c6:b0:790:9e43:1236 with SMTP id ada2fe7eead31-792aad5521cmr9876551137.9.1789217306129;
        Sat, 12 Sep 2026 05:48:26 -0700 (PDT)
X-Received: by 2002:a05:6102:32c6:b0:790:9e43:1236 with SMTP id ada2fe7eead31-792aad5521cmr9876534137.9.1789217305617;
        Sat, 12 Sep 2026 05:48:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm: fix SMMU fault dumps
Date: Sat, 12 Sep 2026 15:48:20 +0300
Message-Id: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABRKpWoC/22OwQ6CMBBEf8X0bElbam09+R/GQ6FFqhakC0RD+
 HcLajTByyazO/tmBgQ2OAtotxpQsL0DV1dRpOsVyktdnSx2JmrECBNEEYYLgy8ecOHuGLzvMDM
 807rggmQExa9bsPE2Ew/Hl4YuO9u8nTBvR7BNF6Par6100NbhMffo6bT9RKaLyJ5iggWRhjCuq
 BBiXwMkTaevee19EgeakD37xcglhkWMShWVdLPlTMs/mHEcn3pbbbUjAQAA
X-Change-ID: 20260902-fd-kms-fix-smmu-2d4baaf460b0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4924;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=acXpo3fnBBm44TAaGvVzO4K2+eb1q1qZfnXA9/f95ts=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoWM5RjmZcTLZVo531LPjHKZK6O2gy6icUYD
 w6ifwDOn2mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFgAKCRCLPIo+Aiko
 1T3oB/97ujHCP024sgmssO5D99l7RPN0tf56l9TAcYMPtkxRfoK7obZMI2SdLdzeB1R/5/Vm6xW
 jPAtK966iQJT6B9E37k4Wr1xFHkarjT+03irz+ICbjCyngiEMtPE+Q0b4krKmawobdPkVcWK2Qc
 BRwx5UjhrTYshdWPUxlKdvMIkJK1VxLOTGoKNLBZWesUtG/OxLnQhaeeTkrGSwrotTq4pYXauwr
 A4aqz/yZ8RL/UknvcsxwDHBnpgEzu7TFnBOOl5bAj70rsSdDe1/TC5GTnoBDnUyovRo8Y57u+D9
 2ACKou4tFkRE9EV9NY+qyPN/maw8LuufJr67JOu8DXqNZVZD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nLZ813oHMjDsZBi2CIvD5TSS30JngINT
X-Proofpoint-GUID: nLZ813oHMjDsZBi2CIvD5TSS30JngINT
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa54a1a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=COk6AnOGAAAA:8 a=QX4gbG5DAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=hPlEVOE2XIimEfz4Pi4A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfXxKwHg/ltns9q
 D/ILetdLI0sr3eqANZKqbB8hzZ2UtSaeYoBz0r6XrihhTYqgj2K/sGjykd7SMn0Jz30a29Sl/KP
 m9+vwTbmVNL5gkTmqcoC+FYDEI1Max5oM+F7/of5l5Ek92lBuzxmNzgk79+7tFQBMasP7ONapZa
 UHo3ae/ypUb/OcArPkY5cI20uz/L75/cACvmqzcNhsa46sjmtL1X4uaE1NLp40gwEN77nYHAbfJ
 TZ8JXRJV5+gA0ql0cPtoVwzLWkO227PdgDrViEVRNbNNN1DfjzcO7EXs5y/VhV7ICgmxVXD04ho
 VaX179+crZtsPg2aHo2NJrYJAKAK42pD9SzsUZZXdSM0DE6eTQlJLV1VXMLu9D77c+2emWxbR2x
 rljvRnQmiGK04NnBRUpV8+fP3iI4ZB5lDX9TOR0EtCscfwkrvHSPO9HOjxpxymZ6EyQzrp6Aik1
 QbWmoh3ZpbbTQTuSLIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX4EY5V4keXtvH
 Agc2sviWbJ8oJNbj0qL6NNnUMa06BsnOQ/3gqvym8n/deSSkf/ppqGXMgbWVm/3cUAwSGzvZF2F
 T4w/8EsmPL0aUci6QtqgHZ0LSlBFZ1c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120184

In several cases the drm/msm can cause an SMMU fault on modesetting (due
to the display controller still scanning the BO which is being
unmapped). Fix the cases which I stumbled upon, together with the issues
found while chasing them: hardware block pointers surviving the
reservation which handed them out, and the teardown of a KMS which was
never fully set up.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Initialise the framebuffer's lock and dirtyfb count before
  drm_framebuffer_init() publishes the framebuffer (Sashiko)
- New patch: unwind msm_drm_kms_init() on failure rather than handing a
  half-initialised kms to msm_drm_kms_uninit() (prompted by Sashiko)
- Drop the pin count from the deferred unpin work rather than from
  ->cleanup_fb(), so a framebuffer scanned out by several crtcs stays
  pinned until the last of them has passed a vblank (Sashiko)
- Defer each retired framebuffer with its own drm_vblank_work, as i915
  does for cursor framebuffers, instead of a per-crtc drm_flip_work: the
  release no longer takes a detour through kms->wq, and nothing needs
  setting up or tearing down in the kms init path
- Release the framebuffers still pending on a crtc by hand when its vblank
  is switched off; its interface is already disabled by then, so no
  further vblank arrives to run the work
- New patch: clear the DSC blocks left by a previous reservation, the same
  bug as the DSPP one (Sashiko)
- Link to v2: https://patch.msgid.link/20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com

Changes in v2:
- New patch: lock the framebuffer pin state, it was updated locklessly
  (Sashiko)
- Do not defer the release on an inactive crtc, it was leaked there
  (Sashiko)
- Flush retired framebuffers from msm_drm_kms_uninit(), before kms->vm is
  dropped, and only for crtcs which have a vblank work (Sashiko)
- Clean the flip works up after destroy_workqueue() (Sashiko)
- Fixed the long-standing issue of the msm driver roguely setting
  allow_modeset, which started to manifest in timeouts and SMMU errors.
- Link to v1: https://patch.msgid.link/20260903-fd-kms-fix-smmu-v1-0-608d02491666@oss.qualcomm.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Antonino Maniscalco <antomani103@gmail.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>
To: Federico Amedeo Izzo <federico@izzo.pro>
To: Helen Koike <helen.fornazier@gmail.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---
Dmitry Baryshkov (8):
      drm/msm: serialise framebuffer pin state
      drm/msm: fix framebuffer pin refcount leak on prepare failure
      drm/msm: unwind msm_drm_kms_init() on failure
      drm/msm: release scanout framebuffers only after a vblank
      drm/msm/dpu: clear the DSPP pointer when no DSPP is assigned
      drm/msm/dpu: clear the DSC blocks left by a previous reservation
      drm/msm/dpu: only reassign resources when the encoder is reprogrammed
      drm/ci: mark pixel-format tests as passing on SC7180

 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   2 -
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  34 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |  17 +--
 drivers/gpu/drm/msm/msm_drv.c                      |  27 +++-
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  78 +++++++++--
 drivers/gpu/drm/msm/msm_kms.c                      | 151 +++++++++++++++++++--
 drivers/gpu/drm/msm/msm_kms.h                      |  16 +++
 16 files changed, 283 insertions(+), 68 deletions(-)
---
base-commit: 140b13475302601368c0cf4e193e66126a49feb3
change-id: 20260902-fd-kms-fix-smmu-2d4baaf460b0

Best regards,
--  
With best wishes
Dmitry

