Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10BC526AA8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687190; cv=none; b=tNoLx/5aTQetpi23Vr8cJWW3rk52CGRX5EoCRmDaXhPGRAqeAPVPrtnZRNSYYaWQdT5gHus6ZGcM5m4A3+mxOUpj9RvAkj4TmLQ+8r2nNx6MvCJIcvtYuLPVmquok1k5PK7ZHUcTHFti0XTuuyxlYmeaJo/V8dqgU0dMn3R229M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687190; c=relaxed/simple;
	bh=v/r/9WpqeziGia67i7jHFrfYe6j8QVnAAEzTUyaYUzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bE89RX9AR44n4lQN52/lzet5IhUslVRGooFxO0O9joUNjpfUvZ5kdKFhnTrarkrkoQn+RNrtqiuCea1rCP/RWIfHHlHA8QuBDb2Yixyz3sbvj0nFo4MAeTRMvBC8Mkzfy/GY6TGLlDMBKserTY+X70su+SzalbSUFa0fzYsjIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nD3y1Rn3; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nD3y1Rn3"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso1323325a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687185; x=1791291985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jE/aJ2E98iI2S/CWQodcOrB8SsgSTcF+14ugT3aOH8=;
        b=nD3y1Rn3Gbmj5a0MY6ZSHrTnorLshm+tql1EbWEDRPVFQdVy0WUbcI69RJRKsCbtlx
         DImlNRjcu77QiP5bCFDLFn61L81RfRF77GQlxCsOfCISLRSQxH4BWUXPUXLo+CLfdRJS
         oGtR4u8xZYb13HWK2lxGKHVFiC5OfiuJ0sLlSQYBnmBKXpNF2ccRtQrPqpTDQdfenmre
         BZ3LKTvZK+YIBJ1OApDgCII4nGqKDWGzC3cohZIkK8d5SnJZ12Ll+pVQI3r6I6tCY7lL
         ZYvVQK42EvrHYzXufzJ+gGmDxqLhOiAeiPF6H1oqBN2pcv7eoQmGjdRpS8K3Ypjfef9X
         +nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687185; x=1791291985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jE/aJ2E98iI2S/CWQodcOrB8SsgSTcF+14ugT3aOH8=;
        b=OzIjGoGEVRZnNkrBYyvgAqFhz/Cmel2BpCZudhdLq4UczHlyIDSkVSy0bsWzOvmh3W
         vm7/6xoPi9zNY5OmmWv88aqhqKizkXggTPKNWBOux/KbQ+X9s2dzdcEeXDOdkSah0TGo
         dMMSePpv8Lk1q7N8kKQY8lEtP9cbQZICdyfCnWdJ3eIWPcOZC5o7K5O9yh/mhgiIS7iX
         gQkkiJLPVCFZ+DfIbz2T7MzegpchpY6a5EKfftSS8HR6jKSunN2gLq+3cyZhEs/jqHkc
         PUsPlnWm0bSYmAHfmlzfYrQuBiW4NcBdcsC26kuxcodG52BkoQCtXV/ilyTrFaGbxREu
         hhdQ==
X-Forwarded-Encrypted: i=1; AKwUvBymhXy9WR2ftVP8kEiVwht78Hbr5YemPzv4h5zy5tNrqbZhM+CBo7b9YSZQJyMhOeMxg3ptYbnsGxmUhok=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJLUu9ZjyUzV6ebjL3tIx+0KAe3trSLh1zIKL7WUZtFIe0AowS
	ePMlUi4F1D9S8RsAmyMywQoe/3U7Aif5YbeSZqtXrSRZHTY1YUh6BtIZ
X-Gm-Gg: AYBFou1nUlO0NtYN8D3zSw6V7Z+tjraEIog4IlhynSOw7axgzDhDZ4uYb3ZfVKVM8DL
	BnKvq5D35iKe9JESyltjCPzrs6lrBvIQjebnIlwm5K16mRMGqeqzPcv3KIve/Bxd/jkdpr6ZDKP
	2Zd1jB2QlWBeXHN3tIlz4co7txBdPcuXoK53eI+f90ZCmQoVAQl2om374lwoRicIBYn2DA2e4o9
	uUssRVUrefcg2okXdrZxa43En1ko61RmiNGQIYgVaDJeHi19RxbTq5fjmd+e1OnxbXYjtKK+uMx
	o4ylYi2kErAyz0n6Kphb6FoO586S7/l06oEebxhHeV9eXXFTqkJ+bNXd/+icFTK6HbiflxOLF8S
	tbw0jqL2OeNwewE0XdT0qS1BWgFwc0co+kvykdcNNClWd3lXZRVJlFDP11M64cIRn0VHoirNOhp
	iwU186sRGPIYA8vLlTRY3iit2KSQzOkm4J/b2B+F/McDSb3ED7EviqxpCag8u1/qNFMNbFjCQuo
	NidUFjHwO6OMWs=
X-Received: by 2002:a17:90a:d883:b0:3a0:4146:295b with SMTP id 98e67ed59e1d1-3a0987255a0mr10559170a91.17.1790687185233;
        Tue, 29 Sep 2026 06:06:25 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858555csm6107928a91.5.2026.09.29.06.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:06:24 -0700 (PDT)
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
	Joonhoe Kim <26rote@gmail.com>
Subject: [PATCH] drm/msm/dpu: stop all video interfaces before cleaning up a split encoder
Date: Tue, 29 Sep 2026 22:06:21 +0900
Message-ID: <20260929130621.943-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dpu_encoder_virt_atomic_disable() disables the physical encoders one by
one. For a video-mode master, dpu_encoder_phys_vid_disable() stops its
timing engine, waits for the frame to finish and then runs
dpu_encoder_helper_phys_cleanup(), which resets the CTL. With a split
display (two interfaces driven from one CTL, e.g. bonded DSI) that CTL
is shared with the slave, whose timing engine is still running at that
point: the source pipe starts fetching the slave's next frame and is
left stalled half-way through it (on SM8850, SSPP_CMN_STATUS 0x10030
with the fetch and unpack counters frozen, where an idle pipe shows
0x10003).

The stall is cleared by a power collapse of the MDSS core GDSC, which
normally happens between a disable and the next enable, so it goes
unnoticed. When MDSS stays powered across the disable -- a full modeset
within one commit, or another runtime-active user of MDSS such as the
DP controller -- the next enable of the bonded DSI panel scans out
nothing: the DPU keeps committing frames, the layer mixers produce no
output (CRC 0), and the panel shows black with the backlight on. A CTL
reset at enable does not clear it.

Stop the timing engine of every video interface of the encoder before
any of them is cleaned up. The master's existing wait for the frame to
complete then covers both halves.

Seen on a Lenovo Legion Tab Y700 gen 5 (TB323FU, SM8850) with a bonded
DSI video-mode panel (CSOT PP8807HB1-1). It reproduces without any
external display by keeping MDSS runtime-active:

  echo on > /sys/bus/platform/devices/9800000.display-subsystem/power/control

then DPMS off and on from the compositor: black 3/3 before this change.
Every full modeset (e.g. a refresh rate change) went black the same way.
With this change: DPMS off/on 13/13 and full modesets 4/4 show the
picture, and an attached DP display is unaffected. Only tested on this
device.

Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Saim Shujah's "drm/msm/dpu: clear pending flush state before physical cleanup"
(https://lore.kernel.org/all/20260826182459.1506522-1-saimzst@gmail.com/)
alone does not help here: still black 3/3 with only that change.

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..a14156408126 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1380,6 +1380,35 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
+/*
+ * Stop the timing engine of every video-mode interface of the encoder before
+ * any of them is cleaned up. With a split display (two interfaces on one CTL,
+ * e.g. bonded DSI) the master's cleanup resets the shared CTL while the
+ * slave's timing engine would still be running; the source pipes then start
+ * fetching the slave's next frame and stall half-way through it. The stall
+ * survives until the MDSS core GDSC is power-collapsed, so when something else
+ * keeps MDSS powered (an active DP controller) the next enable scans out
+ * nothing.
+ */
+static void dpu_encoder_stop_video_timing(struct dpu_encoder_virt *dpu_enc)
+{
+	unsigned long lock_flags;
+	int i;
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		if (phys->intf_mode != INTF_MODE_VIDEO || !phys->hw_intf ||
+		    !phys->hw_intf->ops.enable_timing ||
+		    phys->enable_state == DPU_ENC_DISABLED)
+			continue;
+
+		spin_lock_irqsave(phys->enc_spinlock, lock_flags);
+		phys->hw_intf->ops.enable_timing(phys->hw_intf, 0);
+		spin_unlock_irqrestore(phys->enc_spinlock, lock_flags);
+	}
+}
+
 static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 					struct drm_atomic_commit *state)
 {
@@ -1412,6 +1441,9 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
+	if (dpu_enc->num_phys_encs > 1)
+		dpu_encoder_stop_video_timing(dpu_enc);
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

