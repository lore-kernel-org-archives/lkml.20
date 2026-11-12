Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469935;
	b=ySCdpHDDOG7pjUdNJ8x5BAcvNtkfnjnuw11iYa6I17gkiwzIp9dPWqsswggHAqKFkeko
	 Lv2WROe/snJVc5Soy7BXmynrhIxEjvDRyznojosIYqfhIcAF0hRUJChWkq1x6cI7fzptI
	 EfoKYWHBrgFn2VWDce7j7vyKG/08JNTBjkVoXYhgE/bfsJnVzPlT2XMU5F/2wA5T1tfQr
	 wAGKgbmrnknMd5Sz1g8tIe1xB2tN6leZtXJWqHzPcPv2LWdrsjTfHKibtInSzWjTZyW/m
	 KRpbGzFmcT2vS7aDgCji8d4EwwtaneV6dw63kGTmw6c1WtaPEdNPsNRj/ktzEDFau1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+PFwRraLiMRDLMfi3y8YngO/QGo0JYSFg4Ky5k3Gocg=;
	b=Yh7MNLuxowBbVP52pzmJUBxGfBbgfE4DS9g4mUC0cu6iXRuuZByK+BFhI4S56w46Zd8f
	 ApbSJ/MeU9IPhgpGkqhXw7o2k7Ajlp3k1o564QZ0RPnDBJuTQfJrPzl0wUUAhBl1lfd5a
	 10RJIc2ajpg7SP7P1DKR78HVBD9GgmGb1r7ruqOO9aLv8ANzYWo4Wg8io0rj3O4JdH1D7
	 Qa0/qXJ196fs8/7o4UmD98vxfl70lFcluSKM3DbnyqPPW86Q9YPtCKrl4a6bn4UKoU6X0
	 ZPrO8VdT1faFHksywXoVkebrAOjFnQWMtnvYWG4IU59kKPoC05+HXXpwOV2DRYGtLEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wdftOyOk;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61E606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C61E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wdftOyOk
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06e79e152so2226592b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794469935; x=1795074735; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+PFwRraLiMRDLMfi3y8YngO/QGo0JYSFg4Ky5k3Gocg=;
        b=wdftOyOkY1sLWQXJYAbmkMy32upEoG2NnGnzvQiWCFJxautu9P8QgBgYvtNMgxk1L1
         HIlr5HHJzgZKwR+aMvNpZVjkjux4lRncx5nfOmStLriSBRYuXR5VrNPdeq8RMA0nV6oU
         H57gRJWccE/DApwzPytzzyaAuPDqPdHHwGpNZtX+YW4n55eNVl3UQw59lcEgB8IM6M9q
         GExqB9B8xXqGcK4yOJwXs1pUwEblXeiIlRdKeYYd13ny8M3hl9Ni4eZyzxozRwQuuL/m
         xcgViAERvVk61Sesoi0y9cGUUw0feH0IvdWFG2RP6Ls6MwpuKKJxSwgRbNZG02/rbOZg
         qetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469935; x=1795074735;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+PFwRraLiMRDLMfi3y8YngO/QGo0JYSFg4Ky5k3Gocg=;
        b=ZGZ1diEAq6HRMhTDyutWndTRbsIY/CAcYEbrS4gpB/hlfkP20eXVgQoyXdjxrNXQmV
         FKnw+HGA3UM74jiDJy6q4D8psacFKw7I6fIgJRtHYnkWLBu/uhWP6b33anawvAcsqH84
         cn15KxRao6hfjE6iQop742RVrNVi7TzE9pq71Nso4D/IvvtKSSN4pT6QSRyMGS6qQI33
         j9RtUpTS4PHZgQ3UGwRlcgJLD7Zpe8JdacCbj5raAZaTZGRFxZwLXskM88kkquuahnyZ
         0FGpGVw9N4TnhfkcM024fiqC+BtqFoiVB3pHmNX0ciSdNpMHeKjmXNhxbFnCHPmDVS5J
         LWZQ==
X-Forwarded-Encrypted: i=1; AL+hErEeMaPs5KrGDpT2Ihepea0G6Xy8Qf4J/4o8+Npwv+vmNP+5Y3E9vjikGGQ1sL5VM8T7iuGbZBngVkRFaHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BkEAGctOkv7LGHWw2da1JAenMoDznYHLz7HVrKNtU3qCTgn/p
	2UqVxNBBeBk4o/q1aC24hvktfDxyHgKMVHf7+qhuTDUMN7u7H54sXgdg0vVdKyfWCkM=
X-Gm-Gg: AYBFou2wymMVqiM77MyQ8to+6H5/QwMl0BZwWOsejgbZ7J7doXVorG7H9wnHSevYe49
	lu9+0rG3SbgCHXyW38I15OpkzuHx+RGhOT3aeynPSaFvT+bGydsDeW8wW05LVyVCCHyicquAM7K
	KDYzOYrxi4LjoARF6sEqAIHfaByWS6VbEpgVBRH2FAeAylKNqL5oLzpCNWO5yRsjvGv/rSonVjG
	UzId+eljHI0IdIUH/xEkExACrSlKrroB+xraWRLCA+nyPoCEaY3pnWo1ArQ+MSEoxOxLtGCKu8n
	1sr4Iy4EhCuTtVItwqVvzy5CR8EgbDP8aiDR7LGAqqAQMv4Z8iQWcZMVfZAaud22uZgBXRth+d9
	YSLXWWc7+KFc44OaqRGjT89lSY0pSStoS4QGiydO8cbUCiu42ymx4YTNEJPlMAW+UTu5QsMd/fF
	Vu6zPUMA5i69sB8xo4hgbB6nQvnXtwVbl9mCpZwMP60WftglahX2+taceokVPAq7b/Qus9MiLy6
	KDPXQ06MhUtJUUvZaqqpgcbrQeHUlbT7uKZnIiTHkqz5ua+Xs/bcDEroXq45MCADt6HMKLLt2Ic
	miB/nXfJ9vInIYHRpZACYFUqNq0gEg==
X-Received: by 2002:a05:6a21:a46:b0:3dd:85a8:cad7 with SMTP id adf61e73a8af0-3f2fda8ea2bmr4128953637.46.1794469934715;
        Wed, 11 Nov 2026 23:52:14 -0800 (PST)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab5f3f99sm3131256b3a.51.2026.11.11.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:52:14 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 0/8] drm/msm/dpu: Support dual writeback for quad-pipe case
Date: Thu, 12 Nov 2026 15:52:01 +0800
Message-Id: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3eTyJN3SguKSotTEXF1Dc4tEQzPTNAtDs1QloJaCotS0zAqwcdG
 xtbUAWXjweF4AAAA=
X-Change-ID: 20261112-cwb-upstream-178a165f816e
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469928; l=1932;
 i=jun.nie@linaro.org; h=from:subject:message-id;
 bh=LDQHNEWwvGp+XPmG1v3NAcjKHwFdOCIS9tVrnzczdd8=;
 b=ARmFWeiLPQROkAvRDrimtqZhEByB9Xs2LRthGXKNk7FplqMa8aDEP9C/QIRIxm74yD7K7XOcc
 nFMA2ISHiQ5DlK87dmHxhJ1Z8mjAS7C5MWbwV3RpCP1oli47mkQXsx4
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=O9aRQ3+xXWihQiRRgStCET+eFXx1EZs43Fh0Xh+8Bu4=

Only single writeback interface is supported even some hardwares provide
two, such as SM8650. dual writeback and 4 CWB are required in quad-pipe
topology. This patch set expand CWB to quad-pipe and make writeback
interface allocatable. So that 4 CWB and 2 writeback interfaces can be
utilized in quad-pipe topology case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (8):
      drm/msm/dpu: support allocating multiple CWB pairs for quad-pipe
      drm/msm/dpu: do not use DSC merge_3d for writeback
      drm/msm/dpu: support mapping framebuffer to 2 physical WB
      drm/msm/dpu: expand CWB to 4 pipes
      drm/msm/dpu1: Support wider writeback width in dual-WB case
      drm/msm/dpu: Make writeback interface reallocatable
      drm/msm/dpu: ignore merge_3d flush bit for non-CWB INTF
      drm/msm/dpu: Add the all WB interfaces for sm8650

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  10 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 157 ++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   4 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  17 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  37 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  11 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  45 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  81 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  25 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  12 +-
 13 files changed, 358 insertions(+), 47 deletions(-)
---
base-commit: 0da2f36712caabba57bd8384fe6ecb066d251860
change-id: 20261112-cwb-upstream-178a165f816e

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

