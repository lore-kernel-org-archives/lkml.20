Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96181326939
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929086; cv=none; b=VvhWOzvnGfMMn44KcSaLttO2KGLECCOMXQxl+sBZ0ee4NdFzH/EOHxZ455Ck+YpPNvrrSlrjI4xfq5hOqS7F06hR+1IKXhlYje/KcSGPaA1mQqj3THmC8x4daE1O56PJ/pE9YBNcoM7ljmE8tw4DLe2n8cFlmBobJZOwozqEzI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929086; c=relaxed/simple;
	bh=L3z6tKHykrnzghXBGsRJSXQq9p6efLJdpGWpsjLF+VA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrDjg9y+k/wXwylRK+aVbOlIBHqpfBTWSHkVO/Efr+AXEOQ47Ce5EMDjFGJMKqd8MMB5caNdabMD4LpQXE9nhmnKE7E866Wn8TOFRJKWdF9hnQSsmk2cBcW6c9GYCMeZa6ZspX58uRUF7+ML1/t79Sn9sqTgcQUB7lyWJCxtGvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGBuZjkw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGBuZjkw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ccf2360620so9850265ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929085; x=1788533885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VfMpdC9MNUgJGJ712gixEQAXWsGGubkbIBW/Kf06N0=;
        b=RGBuZjkwGdNV1JaE++VKf2Ou66kd+l/Q2hKAe7+CoYBnBzUdVu6hioxFLy6DguaUlK
         Do9PCXq6XrRZMHIoAN3SN0dA5swpcXloeleDbNRrywpho1Z+YcvSr56/Dij8jRTzmbjc
         ikcqlws+vKPCbYPu+AW/A2SyPiTRLQfXKTsHRSD/RUDz0dOo3CS0QWtTzo6Hr3Qp2XRi
         fZBJbSo5Qj9XHpbb1Z2Ix6D5+pTppSsIiUQu1KP7QOiI5tUCBvlg9Vnlh2ZU5jZa6Dqm
         s9yJKwPlYfxL9gmT/K+OffYOaz7Y+CZ/8vfMBaW5iF5Du+v4HtoOasKexk654oAT6Ax7
         ONhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929085; x=1788533885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VfMpdC9MNUgJGJ712gixEQAXWsGGubkbIBW/Kf06N0=;
        b=hGaod9cifxPQ2wjO6ZO9nF8GDq6E0duN/HOeM+f7Sq444GjnwOSCPw852dsXmZXW7Z
         34sGF2apqOOkse9m5ZCuVAla+IDm5CLe6w3Keq/hiRHIFktuwye6lQOxSv8fhYCozCWJ
         7w4RJ5Ci6F8D9lxqC7snETmuizAeW1IGCyRnsULjbHrRnw9ou9dBFX57laRkEhEqXVcX
         /J4AiYr8RVkYILWbA03aHWqWkP3XzO4hVha6Z76DRL9khntWc7wDjTZZuQsDXGv7Hj8B
         XKoS66RkACiqzjwe5ofsOsUzwLaslnlG4r9vA4a1nBx8Tj9hwuH1cTBkFVbyeDPqGJYC
         ajLw==
X-Forwarded-Encrypted: i=1; AHgh+Rrp4ipdJ23xTB8eRJZNMC/nfo3u2egbxWgTbbDZ7KFgL5SJ/dq5z8lotGy6JcuVOJy3IfbUzwLXARHoswU=@vger.kernel.org
X-Gm-Message-State: AFuF++nIWBUkpfyOFUhivdKMNki85CK3IOiDI3ohyWG2UItyzZM/9oX1
	IHR5u2kwkgkJecifwiIwt/xpCtZiLOtkZIIFt9o8GUyHT245eEXhoW4=
X-Gm-Gg: AR+sD12SN4sDgYbYe05VtISj+Xoga/r/OkRBfZX7pumF37JiSYgJLWkCM5O+r2G9OTr
	EncAI2JSdgay/0P5+ZIJarMaDC8vdNcsoe3l65lpvWiQjRJcTOsxXzlN7QDqFGQ/8Ld1iGwFWkm
	yl7dL+tw5mVjEnhIRNjycaH81c/fQw2q9LmGGjG6gfg7PFER3Uq5tEYXxu/+5wSEfFQ3l1WSQK/
	UNM1cJC2FXaq96LoJwGwjLea3TyxLIO0wgWPvB24FdyY0qlocLF3NYbhhG3GoTLhYTLDIuOaShB
	bzabsU+XinrAdBDxAlui1zHuI4Mj/F3FqUvBnlbdTEOiOBDMZPgc+WErJ5gPCfkIzxNx54Y/TqN
	IW3A+FstMgz9A4uTM3IycUZ6722EG1T3rEol+7clq9VcyXd0dzXRV2KK26x0QEkrExXIy5Pdz84
	Uh/CJlbVKj4EV4Jr/15MS7Fiy/fwJd1R9z3V7MJ4hOIRYC/5IZe6LUk8AkStWvwAVpmrSrv1NpB
	yX35RGiqIPuTT6afl9kKartjYFTe4Pu1OB3Dg==
X-Received: by 2002:a17:903:3d06:b0:2d8:d4ce:9f34 with SMTP id d9443c01a7336-2d8d4cea3e9mr8380325ad.18.1787929084834;
        Fri, 28 Aug 2026 07:58:04 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b6fcsm6159625ad.56.2026.08.28.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:58:04 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
Subject: [PATCH v1 0/2] drm/sched: fix a use-after-free in get_timeline_name()
Date: Fri, 28 Aug 2026 23:57:55 +0900
Message-ID: <cover.1787928528.git.malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes an unprivileged use-after-free (read) in the DRM GPU scheduler
core, present in current mainline (v7.2-rc5) and reachable through at least
three in-tree drivers: amdxdna, nouveau and msm (VM_BIND).

drm_sched_fence_get_timeline_name() dereferences fence->sched->name, and
the fence is not ops-detached on signalling (the ops carry a .release
callback), so a userspace-held finished fence can outlive a per-context
drm_gpu_scheduler that a driver frees on context/fd teardown.
get_timeline_name() is reachable unprivileged via SYNC_IOC_FILE_INFO on an
exported sync_file, so this is a deterministic UAF read of the freed
scheduler - a bounded arbitrary kernel read once the slab is reclaimed
(there is no write primitive on this path).

It's the same bug class as CVE-2025-38703 (drm/xe) and CVE-2025-71302
(drm/panthor), which were fixed per-driver; the drivers above never got
the equivalent fix. Patch 1 fixes it in the core (cache the persistent
timeline-name pointer at fence init) so any per-context-scheduler driver is
covered. Patch 2 adds a KUnit regression test on the existing drm_sched
mock harness that catches the UAF under KASAN with no hardware.

Since the bug class is already public (the xe/panthor CVEs), I'm sending
this to the list directly rather than through the security process. It
looks like a candidate for stable backport.

The KUnit test was run with:

    ./tools/testing/kunit/kunit.py run --arch=x86_64 \
        --kunitconfig=<KUNIT + KASAN + DRM_SCHED_KUNIT_TEST> \
        'drm_sched_fence_uaf_tests*'

- without patch 1: KASAN slab-use-after-free in
  drm_sched_fence_get_timeline_name
- with patch 1: test passes, no KASAN report

Jonghyuk Kim(MalHyuk) (2):
  drm/sched: cache the timeline name to fix a use-after-free
  drm/sched/tests: add a UAF regression test for get_timeline_name()

 drivers/gpu/drm/scheduler/sched_fence.c       | 16 ++++-
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 65 ++++++++++++++++++-
 include/drm/gpu_scheduler.h                   | 11 ++++
 3 files changed, 90 insertions(+), 2 deletions(-)

-- 
2.43.0

