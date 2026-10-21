Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582913;
	b=vful4Q0LWYOjGsEk+6LsGYkcMd3P7daMsxS4RRBgyEFgpSpT+fSx5R0jac1iPINu3GDR
	 nYfvSFwI/ohMJ23r+w56AaVsZzKm2THiTT6d4pLTWR0UtZi4lpgPNaEVF9ldzHFV9o8Iy
	 1/EwGJnPF7YFpeYRkj6B5ORW92U3CPtme/ds2DoEUE301W1+FzvltMv3EYib+WyL9FwTz
	 6Ub9cW7Y7efP6UcsaSyKeVbuJnQBiQsGfifL6RY2CRb2FWmsEVqEHh7AzZKSDpIja4Rig
	 lryeevK/1LRCKND7kswkwK3KLFBZA9cx0t3iRZbzVRldrM5IhDGecVkHHiXkoFrIkHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fx75j4SxhSfx9/iSOVIDoOGsjmIu6P89n8oQ2wrar1Q=;
	b=S9dgDxWFAWgqujwWA5O456SV+aFwdrTwbV/kn++r5iTyRy9iLUXV2kcTPBSFiv20VBsw
	 2I3r2y+WDK27nD64bEbe39zTqNBeyEvl295IKqVAZVnAL6OF/8NGDyS+ADGnTHLVBKl2C
	 1S+sciuOCRT+EfPpJLrCDd/3lxYtyG5ysH2GXiqn2qLOtOWSmk3RX821WTYmiTxoTjLCz
	 fHXJnl4PzjMMyKCiNjW+u4XxnJ+1fNFmkxBDCo/eXKns8zirptvgul4oC8ktA4HfvnD8x
	 v6NPlsQnAKV0eLH8zDc/87ebRFKUqYTDajz5TmY7HVrZW8UdxExPe54tF1IT+vccuJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kG+vUzdR;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397C0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397C0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kG+vUzdR
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-745497ac8fcso350503137.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582912; x=1793187712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fx75j4SxhSfx9/iSOVIDoOGsjmIu6P89n8oQ2wrar1Q=;
        b=kG+vUzdRpgAqwi6lgkDiAgx0j8sbXAMYVHplMdxX8v7CcvBF0PIVDLL8r6eGnLI+zt
         4S3kJp0XCNhZn+cG2viuhcjHlsKQEwNb4Oa0CJfQnTh1SwO+3cnCb9OshmJwInIoW/t+
         Y/tyBtUddbu2/FPoDwCRiFPKGD6p8bRN/eN/pNak2Z4ISYFUXFLF+26QGJaL4771B6lW
         y2TjBxVnm5Xi/3iLAhLIRYo2xpP+4hYOlOoFI9zxgfZusI/zviJpuiZXvqqNqxmoh7jj
         Wa8fE6yU3oK9ds0AaPupUEs59Wj3jUGjug9AfoePj7sBJCF2XumVRheGx8unzJ6Zymis
         uggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582912; x=1793187712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx75j4SxhSfx9/iSOVIDoOGsjmIu6P89n8oQ2wrar1Q=;
        b=SauYCqEHe1aFmcmURaXZNW5fM8yLmwGedqlkWuysGzzYIxEzt6+2eCXugnK5vQEqF7
         3yc53SpVZhlo65c3YlrJlY2VrI9iVSk8Zm7N7sWOMydYAP6JVJgXWrj9aQQ8ImwZvWBD
         o5SkqOoLQFGRAcomPzRZvv0VS+13CIJHzNPcozmBzMH/6FkYalUHV/AM+94wJ+VWd2H3
         cBRlfB33wg/oMB7LTxuIXqx9wDTlz/bLOnssb8KcIdPt1cuX7/OtT0mBX4AQ0vpQHihg
         d6nmJIhJlFZj9E8XEUbu+JfjFT7Mk7lCbG1jgcncJQcybMJUkX8a4tL45+6j7UkgaAV0
         G80g==
X-Forwarded-Encrypted: i=1; AKwUvBxlF+/EILnCCGHKP/kHl7/N+GDBO+eC5hNj3Pr2zYN7E23eeyIV37sOdbB7t+1fRC0AVVXcAhSuEhD4JBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuQAC8HS18dAFw+TQ8zwh4k796MDfDN1pHtbm+UKBoXKL/z4Kk
	/osI+2iCteP/OBpWi14g1kglNcHzj/tR5lWOfU7hcH044lasH3mowEvD
X-Gm-Gg: AYBFou2eCpPo+ZHRB9QY+9jLJNTy78vaEar+EXvBTy7QHx0qmfVdjN2Almjucz4xCou
	V2cjjbj7O7zQFqxkMmY/D+nBm6ie5Rs940XvQLXeg7vH6GXFR5JKoHi9ou4lX9cm/srKAd6ws8c
	fJSaL8Wz77qVxB3PPvBuIPaiaLLdXZVD7uaj+9ZuXm2LLCUHWTGDbp48NHS2I1BIozIxbQS8mJm
	ZT6xI0RIJKT0TIZr+6wixmr0xXQMlBpPvQaur5qMma2oSQfFNnkPyvgSkmNrvA5uE7nQ+zuCqU9
	JVakQcNTe1+VgNO/xyYuTDjH+l1XJjo2jkHc6niCSUcCVw9w3yTkD2jF/BmXFrEXsH+WJHEqBZN
	uCm5jhJ+yrbjYDZ3bYFvMw8Wm5RlhT8eJF2Evhigqjg2RSi27yig1XwtMnPJinOwXJDLQXghY8c
	pE6x3UskzlnpIkV8G8lvlRL7BdF6XxicuTPJ3HfvoDOie5LnMqRdymc/x528VyQXJWRFRqBh1W/
	bHuNepoMmVUOv1cO1ZbbLrBPwgNR+flSptstm8v8Pzx7exlvhbqiSAD3RD7PO7sGw/xZ/k=
X-Received: by 2002:a05:6102:5346:b0:7c0:9788:b46e with SMTP id ada2fe7eead31-7cc926f8856mr513003137.32.1792582912106;
        Wed, 21 Oct 2026 04:41:52 -0700 (PDT)
Received: from localhost.localdomain ([177.155.254.119])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc91f9c7f1sm2365006137.0.2026.10.21.04.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:41:51 -0700 (PDT)
From: Matheus Tagliari <mptagliari@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matheus Tagliari <mptagliari@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/radeon: fix VCE1 encoding on SI by handling the VCE interrupt
Date: Wed, 21 Oct 2026 08:41:16 -0300
Message-ID: <20261021114122.94008-1-mptagliari@gmail.com>
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
 - The Trinity/Richland change is compile tested only.

The series was developed and tested on Debian's 6.12.113 with the
radeon module built out of tree.  It applies cleanly on drm-next
(fad06cf), where drivers/gpu/drm/radeon builds without warnings (W=1,
allmodconfig) both after patch 1 and with the whole series.

Matheus Tagliari (2):
  drm/radeon: process the VCE interrupt on SI and Trinity
  drm/radeon/vce1: enable the VCE trap interrupt

 drivers/gpu/drm/radeon/evergreen.c | 14 ++++++++++++++
 drivers/gpu/drm/radeon/si.c        | 14 ++++++++++++++
 drivers/gpu/drm/radeon/sid.h       |  2 ++
 drivers/gpu/drm/radeon/vce_v1_0.c  |  4 ++++
 4 files changed, 34 insertions(+)


base-commit: fad06cfaf385787b9ffa2f73f049d42dbe1de57f
-- 
2.47.3

