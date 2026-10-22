Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669694;
	b=MmqySHuQNYm78KKCuIyroSjZmo/y+DqZT9S+BS4NLsCgfnL4m3F9pXMalKxb/jlAqPcB
	 343wLcYaiJLOewBoH8xzc+JQAieCqGo0V/Co9FJWhlrWyti7Wv7MLFo/cwb59LARrPIUV
	 mQCUcip4tw2PevLFxVgNoy30/l1L33c6TFNPtklLEovs/aq6upqd7Cnabm5tE/rBJBmhu
	 84p8qkO3Ypa//Cbw0NvJy2NfYNFKoVUTCMJoJCClKqNHEJay39M4s//ptfNSX8ONTWMGt
	 4LR0NCstJGQXpD0nuxX7Yubl3E/vpz+KTMPf/c5BOQd6CNy/RoNiPuNoug1jjU+HZdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wazDlZjKfyP7wNB9LE8dQu7qNqOMALjuh7zvPs0dUkU=;
	b=yV0hE2P/jeP9T6XN1je4NywRfxvslxmyMhOE9WKoZgWCLp/8bdipnv34j6cWTe4nI8Yn
	 r2GQbeJyJGSVFq3uIf2sGjSWKU0cShXl9TGBmVJrgYlqufkNeq4bI/5flaAQ8KGK/Fm3r
	 Q1PtQewmr7ZJca4LhXCqy+dZlI+EPwganweugYUNtjt84hjy9YYoy+/jhDQCL2XFhZGIK
	 ryhIxXrQvvxEx7eWOm1s6dqI0ZlQdMjCf6DqkYtChKlOBd5BKcXJxV87Mz9ZC7AkyAcus
	 QqJKjYbc+cVwF4SG/xPGv5RV9Fn8ua33j8xiLk3R0RXb67tBKOLqiy1y658DKMYgEEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iiVuOzoy;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE45606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE45606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iiVuOzoy
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7a6e560f580so1150195137.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792669693; x=1793274493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wazDlZjKfyP7wNB9LE8dQu7qNqOMALjuh7zvPs0dUkU=;
        b=iiVuOzoy0fDRnKZTBKOOQ91z68UuiTi3r8XoZ8rOZCisn/agK6lFMYGI8LI/vGKIyh
         6RYZFXkYE8AZYheyAcnvkZ+DKNUoPdrVYiZjKWayWw4wL/0BJSM69Ia4RTlYYPt3dzuN
         fsfvUiKP5KdIYK+NtX0CDW/Qm297wWIlQyyGTOcBXzB3qAbpM5Tg7vYw5ApAdBamrG2r
         6E0vRy6Ht/vQGMOSlDPL6E/ZpyZxwG7EZwlV13bljLeDuTAx5rQF+WuFxGf+7nZqNi7N
         632qL2ZyAZm1+NCe1dkRULgeYEGQVaSVV623EjZfAIKlfAyRMx25eAKxjFxZBgmKDE5X
         4RzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792669693; x=1793274493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wazDlZjKfyP7wNB9LE8dQu7qNqOMALjuh7zvPs0dUkU=;
        b=O6hXKsDucdoE5R0gPaXfwUvyfx1eiuh0Sxytute82D/EjbX72j60bSIyvc8mqdV6si
         R+Wvg/TE6RUlBsfNlbDbW8WrNQz1ARFc2pK/z+mikELkM2z18wDHMY1Q+KCKIttk/Uyf
         NDO96bLkoBLIigO287WjpMNF6Y90se6UyZWGVzc6r6KSkToI7oTuzmGu5i060xskpO4x
         vJOzFZDfYWrGfo7sz7hF/1SPlOX+S+ympx1wXM8YR16KNuzxY41RQZ5vXf5BYrCH2tC5
         O2J1vGErBvZGSh8Y7gaaTwXAzV22sutF5oLb77QVKfEi8X4V4MvRLHbUDCQprWQEw5X8
         kMfg==
X-Forwarded-Encrypted: i=1; AKwUvBylNzkeO0PovhWU7z7DRRZ9/fSEMwtT9p8SvudGHYmLr477/yzIe04Y+oRxDRAyxcr3kdf+njTQJ7PLRyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmHz0gbn3HDY2M7bGYI6yeTqq3Bo/wA34rx8z+9zpypZ9Uamjc
	Hh0/1SVKutS9t3kyOLW8I0wCO/yR3d0o6A8Db8gyxcVcmX61ilPTDJBG
X-Gm-Gg: AYBFou0Wyhy7C5nsYpuiibXdAQ6RoLGY89tClzYJtXDiN/4d2J40JOKMtQHNQgrk1SF
	ZYPvaDVLbxb87dpSnAyA+qAa37HISw5vEDavWOurExQD7p0m0k78RQ45hkmmcNK3ut3QwTaL5W2
	/f6NBKv1VO0ixTx5OYKu9e4u7QkZeqUasZrDi7LcQXZ/WwtRBzjLvPJ/Y1ekCyxhfGB2NzbHxq2
	645DjARapsRZfAL97ls1kAyMZV61tCKHwzTVQvfLDL1g4t+A+s8aV/W6FUvdPklWCbAjAc8gv8R
	msOI+3c3/zkhtY+xEkxMa8ucN68F+gGnc0kQ/uq33uiZrDkKo0uNTe68oltNKYlx/djjswcRboy
	VHAuFEqHiB7hqao7qngVqkUkSig+SOlIqhl1Ld9yk+R8jile6/Q4jnO143UGHXBoX+9ORcodAtG
	A1R7GtFDRlhx4cfC8M3cSeWXMAPdnKZb/1GgiUDIaKU95TDT5k7SvYiufIkOQwsvl25zTYBblkR
	Kk10pEYG9LFcyFZ4y2Mc+w7ph4700yel0i0j4HeqMr/QIrZEuepn6x5xOGMpdzc8dcFomPuw1G2
	seqJ/DY62nT5BFzd
X-Received: by 2002:a05:6102:6a83:b0:7c3:1395:a090 with SMTP id ada2fe7eead31-7cc925f94e2mr2135424137.6.1792669692664;
        Thu, 22 Oct 2026 04:48:12 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.104])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d117c005sm6177793241.9.2026.10.22.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:48:12 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	=?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/radeon: fix VCE1 encoding on SI by handling the VCE interrupt
Date: Thu, 22 Oct 2026 08:47:45 -0300
Message-ID: <20261022114754.865669-1-mptagliari@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardware H.264 encoding with the VCE block on SI GPUs (radeon driver)
hangs the GPU after a few dozen frames.  I hit it with the KDE Plasma
RDP server, which encodes through VAAPI, and reproduced it with a
plain "ffmpeg -vaapi_device ... -c:v h264_vaapi" test on a Radeon HD
8870M (Cape Verde).

The VCE1 code never enables the VCE trap interrupt and the SI (and
Trinity) interrupt handlers do not process it, unlike the CIK code and
amdgpu.  Patch 1 adds the handlers, patch 2 enables the interrupt.

Results on Debian 6.12.113 (see patch 2 for numbers): hang before,
none after, and 34 fps instead of ~4 fps for the workaround that avoids
the hang.  The KDE RDP server (KRDP) itself, driven by a local FreeRDP
client, now encodes on the VCE ring for several minutes (about 40
fences per second on ring 6 in the radeon_fence_emit tracepoint) with a
clean kernel log.

Two caveats:

 - I have not worked out why the missing interrupt turns into ring
   lockups instead of only added latency.  What I know is that the
   hang needs the VCE ring to wait on a hardware semaphore (disabling
   only the waiting side, or both sides, of radeon_vce_semaphore_emit()
   avoids it) and that handling the interrupt makes it go away with
   the semaphores left enabled.  If someone knows why, I would be glad
   to improve the commit message.
 - The Trinity/Richland change has not been tested on that hardware.

The series was developed and tested on Debian's 6.12.113 with the
radeon module built out of tree.  It applies cleanly on drm-next
(fad06cf), where drivers/gpu/drm/radeon builds without warnings (W=1,
allmodconfig) both after patch 1 and with the whole series.

v1: https://lore.kernel.org/r/20261021114122.94008-1-mptagliari@gmail.com

Changes in v2:
 - Patch 2: only enable VCE_SYS_INT_EN for VCE1 (family < CHIP_BONAIRE).
   vce_v1_0_start() is also reached on CIK (vce_v1_0_init() from cik.c,
   kv_dpm), where the register is at a different offset and is already
   enabled by vce_v2_0_resume(); v1 would have written the VCE1 offset
   there.  Thanks to the automated review of v1 for pointing this out.
 - Patch 1: unchanged.

Matheus Tagliari (2):
  drm/radeon: process the VCE interrupt on SI and Trinity
  drm/radeon/vce1: enable the VCE trap interrupt

 drivers/gpu/drm/radeon/evergreen.c | 14 ++++++++++++++
 drivers/gpu/drm/radeon/si.c        | 14 ++++++++++++++
 drivers/gpu/drm/radeon/sid.h       |  2 ++
 drivers/gpu/drm/radeon/vce_v1_0.c  |  9 +++++++++
 4 files changed, 39 insertions(+)


base-commit: fad06cfaf385787b9ffa2f73f049d42dbe1de57f
-- 
2.47.3

