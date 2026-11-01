Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556020;
	b=b1DG9/e624T5L2GM4hNXfsxrFW2S+Qffi7vEnWTZZF2ySoKB8ZOoWc1NSQveqQxGewl/
	 j1QH29oT/MTO4TtuoZKdK5WoIn33+d8DCIV+zV5FJsT2E418UFfBZdfUrB6/xd1WKmJMP
	 Y68k5T4oYVa4kEoBm742wam5j71nnkJDCaOlzrr2JDbY4nfwX1qG8UvOeoZ/GtK7JnM7Z
	 5HMPCfnnovQ2Q9vvf9BsXRPuevWaL1f+qVViUNIoOPiw+tQVABatiWvVjucwk+pAsvWii
	 OtHAc7GVssquWHQrfze8K/7/8m8Rm19q+vGop8kWMNa5CjU19xT2vs11d0dnWdPyXnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GKME2n5l9JpnC5UjER0UuCGrO/DweG8b5PbwFPOpgjA=;
	b=oBxeS5RrMsPgGCsNIo9+IHrBt1b91LSUueSGpNmfKvCDEqNKeSpEhLV5MndhxICvLl/X
	 Z4QsGAS/7Z7SijPvQI2nXn9dkAeYbrdlkUdEy5vn1wzgYeUnXbBUwBYd//xoRX8YHAmC+
	 HFryB1XK2C2usvDtX0qmBboj4qxoEXF2kprL83SJi1nIw1Mu0P/6/LSCAV7bDbntRKQLt
	 abXtKaKbuLyj5VNYqUlAa6IIwniRm2AGDVbqAPa1qLktGotfYCRCliqAKK2I4IlSPELYD
	 CHM60i8rIln4hqL486FnumBGphJW1WqzTkQygpV0syBm0dhXHnJ3sFq8MNq4XK3745w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJaZYiC0;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B69B606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B69B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJaZYiC0
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e831e86ebfso12929725ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793556020; x=1794160820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKME2n5l9JpnC5UjER0UuCGrO/DweG8b5PbwFPOpgjA=;
        b=yJaZYiC0Vsfx2ERFj9pV6vZyJ7bGdGf55j/WEpTd9+QBUIoS5pSWRXvbtgeQeAV9M9
         rMT7MbyXQ50xXulNXBeowo+f8myApFglo+uQ2EX3oEqXiBHtE/MXjUegIireTMD5583K
         80VCgtk0GeXue4eJD2+cIuEUUH3KSXUFNcvQ3zBNe8tKmT0BdgebD4b2WUDNGcC59HPP
         3z2vefF+t842JVps2tpXh5jPvQLPibZ/gkAXZWEMEiREv4zxwj4WBcOGtF3auudPW0Ta
         ICXEieDOc0qJ9VvvYaLgZY+n50nr1yqHfjjBRZAJbr9SysML78YlG8TGJZ+J6XHgvSP7
         eHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793556020; x=1794160820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKME2n5l9JpnC5UjER0UuCGrO/DweG8b5PbwFPOpgjA=;
        b=qBnpy80her+33i78I9L+pCpfRfDZw6S/d0gyPX+dV0kkijytsSoKF+lUy+32Ghv2kU
         uM2G6q6Y9sqQ+VqFtSFC2+FQKgRuJPZj91lwE/DdWfiex6gx0gm2wLKxuoRyEwfV24fe
         q6ejnJ1Q6mL5jo75WknZFFszp5s7XwymCj6+Gl9mZJ+Xf3FIRKuBi10+bmG22TpSzDBq
         7BWZnlx2Mgld6W7LRso1AEdwciJL+zO0VLmSYWE9i1ZfOKrazN9OiulL8jZwOY5QDsHF
         nnYyC+eAzSu94E5GWc4qldjEk6B1i1wIzFCGYep7fatE2BWZAIM/c5x4ZOM6CCF2TMos
         +d0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzOJZymkANCpfzXeGfmKNAcuKB8cp63Yz4uEUkVr6DkB03nc1CVmju7jn7B6cRuHfqLm3bNK6fvWQ8TmtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95wn66kUy3OQwOu+kJuwrRvfzhy0IHH9IdetRgtpPSQQ7HcU5f
	jA5Uo4ubn5akCy8lDCcL2MM4IgfJDUt6n6lkiVTgY8glvg0Dihhml8NskQqNj3I81ME=
X-Gm-Gg: AYBFou0AXZBviEoJIU9qt1gDphSsnNXnRhdfmhRZJelp+p9lrWjuQ0qZEpAhoBh6vHH
	haBvrgFLvJpbJ3P03yI6YIomxZOHuXqBfZGW1juDMX5wizDq7oyKp1+ykvNkFYMgdvHDPgcrOO5
	7RymNtDFUPnTD6LJtf+M9lqfHISHVPmzZ/uy+/uItR2H3tFlY2hiJ+ZcYHqh6fY88VWsrRRmZha
	c1u0lJw16xryUKWMyRPT72BV/+V8xG+xv/QkDd5uVflN3QzdCEfNm1c+DM30XebWNY3uweR3DBl
	elFHuISuMe+pKQEah9vGKTBwlhuXdOLyqwQnhQtSZqswq9SLthNgM+/TbLrziDc9ghcxk5IyfpA
	/vN5hY1G8TtDqL1LsQN9WaIJKHQx/4A68RVomwi81PvM6anL5y0pC4/2paYlWW0nDqTrx1RFW6v
	P5DbA0gFWXZIWnmwP6LekPTH0Tl74I0Kj2btp8X5mEQ7GB8gK8GPglNFlpbrkZnleSaQH2XrP1r
	6PDyDJvpOzmDojMCyC3EHM1Bw630iyUQ8h+G8pvP+LSirBGkmZ65rgNRkN5jXEIJTB0sIaQy/MF
	zLoRzRV5HT+IUcTNC0/Iyw==
X-Received: by 2002:a17:90b:52c6:b0:3ab:be66:ddc7 with SMTP id 98e67ed59e1d1-3ae897ccab8mr7985472a91.10.1793556019773;
        Sun, 01 Nov 2026 10:00:19 -0800 (PST)
Received: from tabby-boi ([2a09:bac5:4fad:e6::17:370])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm15194159a91.9.2026.11.01.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:00:18 -0800 (PST)
From: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Connor Abbott <cwabbott0@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
Subject: [PATCH 0/4] drm/msm: fix GPU recovery deadlocks, add a8xx crash dumps
Date: Mon,  2 Nov 2026 01:55:49 +0800
Message-ID: <20261101175553.53746-1-nicoangelodelacruz@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On an Adreno 830 (SM8750, OnePlus Pad 3), GMU wedges sometimes left the
screen frozen until a reboot. The wedge itself is a separate, still open
issue; this series fixes the recovery side, which should clear a wedge
but could deadlock instead, and adds the crash dumps a8xx was missing.

Patch 1: if a CP page fault arrives while recover_worker() holds
gpu->lock, the fault handler reinitializes fault_coredump_done and then
waits for gpu->lock, while recovery's GMU waits (HFI and OOB) wait on
that completion forever. Recovery now skips the wait, and the fault
handler skips the capture, while recovery is running. On the A830,
3 of 3 recoveries that took such a fault hung before this; with it,
3 natural ones all completed.

Patch 2: when devcoredump is disabled or can't allocate,
dev_coredumpm() frees the dump synchronously, and msm's free callback
takes gpu->lock, which the capture path already holds. The put now runs
from a work item.

Patch 3: a8xx had no gpu_state_get, so it never produced a
devcoredump. It now takes a memory-only one (rings, GMU log/HFI/debug,
HFI history), without reading any register, since the GMU may be wedged
and GX off. The GMU part is a pure move shared with a6xx/a7xx.

Patch 4: adreno_show_object() ascii85-encodes buffers in place on first
show, without a lock, so two readers of one devcoredump can double-free
a buffer (free_large_kmalloc "Not a kmalloc allocation" warnings).
Rendering is now serialized.

Patches 1, 2 and 4 carry Fixes: tags and Cc: stable.

Testing, all on the A830 with the series on a 7.3-rc5 based tree. It
is based on msm-next, where drivers/gpu/drm/msm builds W=1-clean:
 - IGT msm_recovery gpu-fault: 6/6 recover, each with a complete
   devcoredump; with /sys/class/devcoredump/disabled set, it recovers
   instead of hanging.
 - Natural GMU wedges during Bluetooth audio playback: 8 in about
   47 minutes, 3 with a CP page fault during recovery, all recovered in
   about 0.15 s, no hung tasks, dumps saved.
 - Two concurrent devcoredump readers: 16 kvfree warnings in one boot
   before patch 4, none after.

a6xx/a7xx: build and pure-move review only for patch 3, I have no such
hardware. Tested-by welcome.

Not addressed here: msm never calls dev_coredump_put() on unbind, so a
devcoredump still registered then can call the free callback after the
GPU is gone. That predates this series.

The fault_coredump_done wait was introduced in the review at:
Link: https://lore.kernel.org/all/CACu1E7EApr6Ne3XxFv4cUa2JuwNW2kfo1c5wSsAUN78iWyQ2sg@mail.gmail.com/

Nico Angelo Dela Cruz (4):
  drm/msm: don't wait for a fault devcoredump during GPU recovery
  drm/msm: free the crash state asynchronously
  drm/msm/a8xx: add a memory-only GPU crash state
  drm/msm: serialize devcoredump reads of the crash state

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  7 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  7 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 47 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c       |  7 ++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  3 +-
 drivers/gpu/drm/msm/msm_gpu.c               | 33 ++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h               | 23 ++++++++++
 8 files changed, 112 insertions(+), 16 deletions(-)


base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
-- 
2.53.0

