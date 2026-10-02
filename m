Received: from mail-pj2-f35.google.com (mail-pj2-f35.google.com [74.125.227.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE149483E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946447; cv=none; b=mmqL2jSGNgATSJYZ3bjUJcJjIn/EpR/aP9EonpsNEc4lQAe6mG6Ia1QoLR910R2dFIu0UGBHwdtZ/uRyOIyUk23LcuBnOt2uj//CHTYjwrje61RSWg7m6ZHxDmMa1Mn7glvH7iN68QRnxNfgB2J3I4Ij07UbGrIxOyl98uQ1tyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946447; c=relaxed/simple;
	bh=SpKFHk+D0BgRJfODuxvSj94MeZt7ZsF6tl3nf4TKAmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bph8sjBKcuEiGw28FaHK4GR9GKTsFga+0QipsvFlKzpGW5dkWbM7xJAy/UECR3AJxR+jO/1iJEhnItHpb2Jb00AwyLOogaG5BLc66zfOA9UyUzyD0uGVB55oSD4HNiW8vgQiHhGzRdCph5n/gHidM4tI8YZlU2hZshBkJQ75xLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXgMb8hl; arc=none smtp.client-ip=74.125.227.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXgMb8hl"
Received: by mail-pj2-f35.google.com with SMTP id d9443c01a7336-2dd77300825so40935625ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946437; x=1791551237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZx5nLRdpWK5z7yKqeHvCYGSh31itlWKNzYPXNN5hIA=;
        b=iXgMb8hlWJ62vMzAo4a5ZlrQ/CYLnp+/LSFqaYapswzmVfe1pKZVaJTTMJEE/THb+w
         w4nFNuOa0fWHtuNbGehGxjW7ci53lgpOD8kbSKWaIRP1Gof0etHPklPTyiSX7Q25av26
         3SuV1ZdS1+QysMxvOhLhM86oYsjrBeOCgJefm5y5LHYQscO0v0MeDWNPqTw6IAO9VrnZ
         /3RUkL38uLgvOX0s/LHdeWbsKG/mv4nCYbUX/loHDODSP3Z47f8jzJJRNYd4dYlNQTvi
         Nhe4/M4XlRjMUaLVnObt3HPPO9JqGFACeUWbnxQYcTz6/oeIqfsPML0s0W/GYAlpw9gr
         /D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946437; x=1791551237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZx5nLRdpWK5z7yKqeHvCYGSh31itlWKNzYPXNN5hIA=;
        b=Xk09s945MGM6p5yr8iYRMl9/Mon2KCvVUnQDvIHHH/XJN+gSV8KyEZIjQ2z8cZp0wi
         Zc1nqfyn5LZycgNZhUrc7fBFnw83ZuDiR6U7BLAdXYgGoj4oegCUZkNUR56JdQcThLiv
         gEUdKdN5rXYSgkA0M63FbtotMbxmhQ8xlzT18JbiwC9H1p76N7YmcJRcqCtU9v+qENTS
         j9QdasMX4PZOUc5LdGj1eBSqvihMyj4sEUZakwcOVWl+xHDEkBAjh7+Kx33Bp215XxWk
         mWY355ubwhjxkRYLvZTzmZJszDzjhkK85Q6Ayw+yY+0Dl9Z7bipJUStJsra+PP1KX0Oq
         2ASQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2DOL6kJcnwqu8if3tSgbDeQ4PILyogFgJZ+8JB8YaM5Eq01pQzayyb0KVl8xX2t7uJZUkb4JbAui8xQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+V9p7bTVrumdJwp9ZTiAbLrNZF7PuqN8GW37hkWVKMcs6+F49
	5GBqF/OWe9FfAsMy9lD8YfUzsxJuZ7GPV8oTjLBJdeJ0fUXrTpCmbZXF
X-Gm-Gg: AYBFou0cXl2fhebzl42EI+2leiAmrvZfDQV09Fk5DngmFJMH/1Ve2FoPQRqXTIji+be
	sBUJswun3nS6GnQUiNRKQLBVFcrfh+nKf28VLquUCbYSDfOmEXai4h+Ll8HuJHPCxpqcCa2rS0V
	X/Kf/FytnYf8SwlijKvWUKKYWdl6al7eAu5kfFNUAwYA3bMe9GFWZJ7OpZKtlH2rb6B/E3c3y4n
	Qv9tF6NRP39ikFhZFzBg203PkdFUm1osNFsK6NwHZjOB+TCFMpZyXxK8Zaklzhhi6rrN4g7lbjG
	Q098tFz/z2teJB1IYOM2L0Ahy8WHcogDfLMa/n+IGaK1tBTzX/LuqI3TkcFuflH6X4YXE0yatqv
	IoxGbhDWeCrrmp+r6IioxPKuXjgd9qhTcH9mVgD8GCDeTBD7VIsmCpklop8FTcaPeWUCcV30VXO
	IhZJbAvfOxfnnFoX9i0/BLg3lkgw722mObQMcV30frC+M7csg0+UJRH9zv1cFmwPDUqP1v6nRnP
	FAX19k94xVyMQ==
X-Received: by 2002:a17:903:230a:b0:2dd:c100:a5d7 with SMTP id d9443c01a7336-2e49b655fdemr22787685ad.43.1790946436498;
        Fri, 02 Oct 2026 06:07:16 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6f650fsm7481065ad.58.2026.10.02.06.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:07:15 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Joonhoe Kim <26rote@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3] drm/msm/dpu: disable the slave encoder before the master
Date: Fri,  2 Oct 2026 22:07:12 +0900
Message-ID: <20261002130712.50612-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpu_encoder_virt_atomic_disable() disables the physical encoders in
phys_encs[] order, i.e. the master first. With a split display (two
interfaces on one CTL, e.g. bonded DSI) the master's
dpu_encoder_helper_phys_cleanup() then resets the shared CTL while the
slave's timing engine is still running, and the source pipe is left
stalled half-way through the slave's next frame.

A power collapse of the MDSS core GDSC clears the stall, so it normally
goes unnoticed. When MDSS stays powered across the disable (a full
modeset, or an active DP controller), the next enable scans out
nothing: black screen with the backlight on.

Disable the slave before the master, as atomic_enable() enables them in
that order. The slave's cleanup still resets the CTL while the master is
running, but the last reset, from the master's cleanup, now happens with
both timing engines stopped.

Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850, bonded DSI video-mode
panel) with MDSS kept active:

  echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control

DPMS off/on: black 10/10 before, picture 10/10 after. Full modesets were
not retested with this version. Only tested on this device.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v3:
- Disable the slave before the master instead of stopping the slave
  timing engines in a helper; drop the comment. Subject updated. [Dmitry]
- Link to v2: https://lore.kernel.org/all/20260929174819.3855-1-26rote@gmail.com/

Changes in v2:
- Stop only the slave interfaces up front. Subject updated. [sashiko-bot]
- Link to v1: https://lore.kernel.org/all/20260929130621.943-1-26rote@gmail.com/

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..0a6be69a3e83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1386,7 +1386,6 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_state = NULL;
-	int i = 0;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
@@ -1412,12 +1411,11 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+	if (dpu_enc->cur_slave && dpu_enc->cur_slave->ops.disable)
+		dpu_enc->cur_slave->ops.disable(dpu_enc->cur_slave);
 
-		if (phys->ops.disable)
-			phys->ops.disable(phys);
-	}
+	if (dpu_enc->cur_master && dpu_enc->cur_master->ops.disable)
+		dpu_enc->cur_master->ops.disable(dpu_enc->cur_master);
 
 
 	/* after phys waits for frame-done, should be no more frames pending */

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

