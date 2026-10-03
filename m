Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299329E11A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987431; cv=none; b=cR1pS8Gfr13BPH+60LXMlsNI+CjDITVKXVna3jZIIQhas2PkfpPuffdJUJkntgEhNl/k07WQHOPMJOmGCwdRXGMIioqctqog2VbEXMosqHisHWW62tnaRqW+nFlFLQJNXuIo4sfKXB+Pj7s8DAPcc8xXWzCOOlTnEWm6+u0Nv/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987431; c=relaxed/simple;
	bh=cMN16U7SznlJjoAgsnRNq7Q7EqhdgohODEvwHj9Ai6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fFNMs5bPhkjwPMvnHkgcrNbm/tZi2BKpamPXM2+h9h4Eyetinax2TwG4aeLFqOSPwgx1uUlusCf4As+WQKwv0FpHqjfV4QK/6Z+Kw2luimvpjZYJDqbxLe1P+Cpt4m6naAAJL2iKgb1eRqLUQVFbO/ELuwA1wQYaJ7AfWMS1P7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csbJrZS0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAFvMQzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="csbJrZS0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAFvMQzZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NfbNL3188218
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SpgXp2JKlU4Qn4voExCirU
	Ei8LPVYYwXD78MA7iOrB8=; b=csbJrZS0oS6LjVraCzzQvj4eWKUNA/O4rV0pWb
	yiZq8TasRkKNmYIFeeGDn3Mu1yPgWpQK41SHEuVy/+No4BwluJq0YV2SDt8qRyc6
	Jds2TWwBdG900CJYaEdoW1KeY36ov0VSpWKdUe2xF6G9y6UUVyi9Eqdd5AjG7diC
	jtoqmnv8ZYQ+pHWogKBL1HZug6m+oJy5jlqjHTiw4sRGgItnuunWZKZblRkkyxHM
	MUIySvMaMcponX5w0DkmvWCzcBmC0i0UV/pfUHrdhINJFWjmQ8mFC0eJuRTkIK/y
	+KcDCZ/Y2RF1WNahjnYkWOFhOnBRGGXrpApM4i7sOq3892MQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh4v1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:30:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca4a2b9c4so27012785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987425; x=1791592225; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SpgXp2JKlU4Qn4voExCirUEi8LPVYYwXD78MA7iOrB8=;
        b=WAFvMQzZ/r/M+uIFxbFZX0/TUMsB4QCS2Htr3UZsmL/ZvmeGiJKDOldrbMl5fW/H30
         GtTH9aDDKDi8/Kme8OTBc1DBxved11CUiTpeHTjme6ENGe1hDL+SvkpEHPAmRCtUzGtl
         Dj4mkiXAzPGpoC84RLTG+8cnnadHtxmYeHn9ZlTAc3cCTgRvAmitQuEjlq+ddyxLlfJK
         zl9c45HOwt3HiJ5zDBm6JSE+mzKIAxbWXP8iT+C8a2sknTsJKXxL7ujkO6BbsFzWSWHH
         KAgMkeprSwk4TKVS/SAW0BHUrTX3J3zilEQu/LmJxqA08mjUBc+LxZaHGu97zJ2gGIcL
         4npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987425; x=1791592225;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SpgXp2JKlU4Qn4voExCirUEi8LPVYYwXD78MA7iOrB8=;
        b=CdDIOGCSu918cyrF95apL3G8qAq53kEF9MO0iqL5ArDaiWcvr1Rritu0J65wIhjgPF
         rUmpWBx/oD9FpKvw+SwmvX9JOjoj9ygL2TOw6hMXgOZOA1XYF0TwiaKkjLlAAs9J5070
         AIEPPcL4bU795PVdQnMGhrJ50Paug5Bd2cggQZcRvsd/WShhsRrlWCjDBuFMDyqxHk+u
         JZMlkSMaX4OLHXHZexRFVHQvaVIEbod8WvUbgE4FivcVJVru7lbbzsytRbuBbV+zZc7E
         6WvNXLmnQM/RE+R1waRzbB0BAFdUAf4mIvZ2gridXdpt89r9bkkuCoEoDTUva5bhvNk6
         ouiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4DJ6iSxAsmlqtHsedDKReA47xjS/k0ZtO8GRUK8pd7Fud6X/JxXzIYWfFiG3yQS2nHd1obkec+Eflc5o=@vger.kernel.org
X-Gm-Message-State: AFuF++neidkQjDORqqMUWmwiIZ6kiWsU8X1rfEvr+5SEemyyl56EYCjn
	5Jgjcd+DBWMztxkXcpeV1DVFe8U1xp/iD+Hu68mxuod6oeZEbmTbZyOV9L7z6yfEDLTaxv9rWnh
	Eji5N7srXWHNg9VPsnZKmvYcpgZUAw1A1nIhESLuM55BhI3xO0inT+JGEZiR3mwlMI9I=
X-Gm-Gg: AYBFou3XwWKtT1Vo6z8zGPEn5nKQPAYRfi1w8YRvMpTq2X6pWPS9oxOzzRF3L4s4fqh
	wS82oQC1ivrBYvD20JRFfN1IVItprqBNlJ9QrFekEV16LOzmhobXQkQMC/ATwipzs2CwYZ2HhPn
	PlojMsLyPLXaTg0CKvCEb96lWkmdXIczU2uJ3CLGGdetqcDAuPUaTfPffXVv2SiuPtKsoZ/toJG
	u7Z4n8/BZ/CnffpJD2bd45PmNPHuWVXXAok+dMCn/X8NSRiAt/tiNGODewkuia26QUWc39jY8dq
	XLCHZ7MPjQfUZKrpo0tvJx6kbzkagbmk7EGQqE24EvGLdoQmfDGdAoPG284gfXjTcVPLDTBJ0ss
	grZdgtX2rMtCivU8qG2yHQWNOLzM6X3uo5Zp6d2jzON51xSxQ2PNmVtwB62Q360V5C7oA+zhZBn
	adMrUy1rD+zRUi
X-Received: by 2002:a05:620a:4385:b0:939:9f51:29a0 with SMTP id af79cd13be357-93e510819e4mr206415885a.50.1790987424941;
        Fri, 02 Oct 2026 17:30:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:939:9f51:29a0 with SMTP id af79cd13be357-93e510819e4mr206409785a.50.1790987424390;
        Fri, 02 Oct 2026 17:30:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/10] drm/msm: fix SMMU fault dumps
Date: Sat, 03 Oct 2026 03:30:15 +0300
Message-Id: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhMwGoC/3XQzW7DIAwH8FeJOI/OfIwmOe09ph0gkJWtJCsmU
 asq7z5IKq1StwuShf37y74SdNE7JG11JdHNHv045EI+VaQ76OHDUW9zTThwBQ1w2lv6FZD2/kw
 xhIlyK43WvVRggOSp7+jy3yq+vW81TubTdakwt47oTlOOSlvbb1JbbTkCaMCwBlmHKY4XuqIUe
 pCGWdGYWrQzK5zR6Gg3huBTW+Wp5zI5uHMiJf7gMY3xsu6X+0vabRXxsMrMKFAFtQUuG6aUeh0
 Rd6dJHwu/y89KzvyeqR8ZnplGNKxmL3vJdf0PI+4Y9njYWWRG763tVO84CP4HsyzLDw+yspPCA
 QAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6804;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cMN16U7SznlJjoAgsnRNq7Q7EqhdgohODEvwHj9Ai6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEydELt9W1KZWb5N4SxhgX8cKatEzXA0F3TOU
 WAchP5celaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMnQAKCRCLPIo+Aiko
 1aiUB/9t5BUdVbeXJv1x8aYQaxBGPsFdXeOpUlWJPsyJHqrZBqRju7MP3FLhpu4yQccebbMeXxQ
 7uip2bYAQGaQfegZL0WiuGdn1Gf+pgv/83pnAzzJZirWWv83Y+AXyGt2JsVo+100Jl9WSPX30xS
 sFepFBKQsgs9fCgLONNUcTVw8IDZoW9OEft/oIq5I9iLJkojkIAFSL2Y2S7zLbV5gK7T8RwqF57
 Oa7UpTYy0htw+AOY8EdZG94x03Q7Rje29GoUersdI4j2f9wPYGfxlyEsu4+XAaRJWNvo9sNc+Vh
 udOErtzlYEFjX10HZwdcNOIPrW1Tt8uwWMz5TfVSgLsipeSj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX7zx2TsbaaZDa
 EP2QVo0hHi7rfv23v097TOL4aH8Y2bGNrmv8KohU8zArApiRWb8Zj/AVeGDEOFtuUpQVZVXGwDT
 ZBtYBOaT8Sefwq64RC4yELQkVgC9v+0=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6ac04ca1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=COk6AnOGAAAA:8 a=QX4gbG5DAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=4sOadE_VeMAIZtfLjVIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX/UcJDGF8Uooh
 j5GgJXe4Lat/LryzLkIUqXrQ3WYfhVwlDqsRvCJpVps2hyTLfKnLqzk3fHpGj9J07OMUvzvGx6R
 bnY8uRnn+H3th+KxIYeBkT/suQxxzrOkJzQYNv2MaEGAnIaJCoWhPtZAtn11OQUSHVg7wjymwwa
 I2y3MAaCWJWlleDXLKyEGP7bhkjnLbt27n6kli+QNqAqd3eOSfWrknjVnbWlEssRV02M3gXxLe4
 Us9tqI9qDbjbK8L37dDcB0lrPrVdGe8/cVY4PLozRJtAi0TmLC2p9B+B8VDYCZ0/1EhWFTaW7Lx
 vJvqZiE4iyEboUljSqJMDO1kC55fHB4OLhZDkPG9wAdkYaLsxTEuXoNJbzYT3yHJEBUHMlOYHK+
 4PjMKFvfeLEyzS4tJ3ekQc5crQTbnW9LjMeJtBZz3HURMd89DWTbUAvH6tEb12mFcR4dFl2ZOKz
 MOQMzW4G2yY5HJAFSew==
X-Proofpoint-GUID: nWrzIcZjVqCjB8j_LtHrVPF8VsHrH3AO
X-Proofpoint-ORIG-GUID: nWrzIcZjVqCjB8j_LtHrVPF8VsHrH3AO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

In several cases the drm/msm can cause an SMMU fault on modesetting (due
to the display controller still scanning the BO which is being
unmapped). Fix the cases which I stumbled upon, together with the issues
found while chasing them: hardware block pointers surviving the
reservation which handed them out.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Take the framebuffer pin lock with guard() instead of unwinding through
  labels (Rob)
- Move the fixes of the KMS init error handling, including the unwind of
  msm_drm_kms_init() from v3, to a separate series, which this one now
  depends on
- Add a retired framebuffer to the pending list and schedule its release
  under the same lock, so that msm_crtc_vblank_off() cannot free it in
  between, and track whether the vblank is off next to the list rather
  than reading crtc->state, which a later commit may have swapped (Sashiko)
- New patches, ahead of the DSPP and DSC ones: clear the CWB and CDM
  pointers left by a previous reservation (Sashiko)
- New patch: flush the MDP5 interface before starting the timing engine,
  otherwise the first frame after a re-enable is fetched from the
  framebuffer scanned out before the disable (db820c)
- Link to v3: https://patch.msgid.link/20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com

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
Dmitry Baryshkov (10):
      drm/msm: serialise framebuffer pin state
      drm/msm: fix framebuffer pin refcount leak on prepare failure
      drm/msm: release scanout framebuffers only after a vblank
      drm/msm/mdp5: flush the interface before starting the timing engine
      drm/msm/dpu: clear the CWB blocks left by a previous reservation
      drm/msm/dpu: clear the CDM block left by a previous reservation
      drm/msm/dpu: clear the DSPP pointer when no DSPP is assigned
      drm/msm/dpu: clear the DSC blocks left by a previous reservation
      drm/msm/dpu: only reassign resources when the encoder is reprogrammed
      drm/ci: mark pixel-format tests as passing on SC7180

 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |   2 -
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  36 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  23 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |  17 +--
 drivers/gpu/drm/msm/msm_drv.h                      |   4 +-
 drivers/gpu/drm/msm/msm_fb.c                       |  75 ++++++++---
 drivers/gpu/drm/msm/msm_kms.c                      | 142 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      |  19 +++
 16 files changed, 276 insertions(+), 64 deletions(-)
---
base-commit: 5e4a3f7b262060d70cfdc7889cfe0f4aba9ea3fc
change-id: 20260902-fd-kms-fix-smmu-2d4baaf460b0
prerequisite-change-id: 20260930-msm-kms-destroy-fixes-0f04b1d39b83:v1
prerequisite-patch-id: d7439e7df4daac116217eb0fbbc277974d8dc1c9
prerequisite-patch-id: 6944647055d76b00b161e6a5a30a7f31a80c7256
prerequisite-patch-id: 5519e2e012b2065c08849502118233ccfd61e9d3
prerequisite-patch-id: 09f7ca53872a2ab17488f2bb94a1c2cd4c396781
prerequisite-patch-id: 4872ed1786ce7088e399b89fc8c5ac660dd20426
prerequisite-patch-id: ddd786dced962858ee89ce947eee4cbdbd88fe2e
prerequisite-patch-id: 11dc97f7f4980bdad49123271651749d0a8f8d23
prerequisite-patch-id: 427335a4d98e23f6df1c6d1109c6315a44bf1bc4
prerequisite-patch-id: d994bb94c13b7c8d5da5872844c5a79fa9988de4
prerequisite-patch-id: aa59ee029b6f5b24d6870208ebe8a5464204cad1
prerequisite-patch-id: 259f1da5d7d3146592277db856c44d863d7be84b

Best regards,
--  
With best wishes
Dmitry

