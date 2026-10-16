Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C607033508E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188152; cv=pass; b=ASvOcarusacyEy2XtvcWnEZ5b5FvldUEQ+Gi5webJWi/w/bquvHJMTBupbfp3TbRkC4tSNe2gKt0f90pmIhIca/X9T38wC9sNMrdcH8+LZMg9V5wNOitxTvmVLk1aMIVmc49WDeWebi4i2DIPrsRLQf5AFUHBLxO8pO1wGgSYtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188152; c=relaxed/simple;
	bh=D5ghLKeqKizVH7ciKDue8XuoUI1I424tGQIEHxlBXkE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=f7tcQGsl9Huvdj+kgpzNPSWGiDipCsYb3LbFIEsm0kT9pufNvyC46dpKcUKlWEN0fXrTmFpjneVGsEJln8qd9UxkwI3do7ExFJZNPHvsFBXmkGcR6stiMEqPgtma+etm1uHhhmCK40/5oO/BZveCxHLaA+Iz6G10tzXvo9PE3aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCb7f8TZ; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCb7f8TZ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f269e335eso44925185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792188150; cv=none;
        d=google.com; s=arc-20260327;
        b=HXJjnDtj+uXryecjzgGcDMzBFuOWQpT0lL44dhLCDaushMBzboVs0W+AaE3hm4Dn1c
         j2Wd/dMYbPvmcbSUKa2iUyDncxCjorsQvbvsUgIcolQE+fUXmIUEw/MA8CyhXIjP9X/Z
         9FyeHSKHLRN6ZRz3FCUVooeHd8OF52V0ETT/TJm5Ry9dfxtlBGcLqIauFu1d8Vt9o+XY
         gE7lS1sRoTBDUqv5T5q4Vnvy0sLOLo1IW1gmmYpx6NFGIqaSHy9RrqfUjG4rPc6WiZF2
         pyD3RwxFLjXfNFFAbLbUkwdMRsIGWRpYLSCGsfyrGJXz/PlRpY/OOihlDXmoF+q91D8X
         MAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=ne8c5V/AfxPlCOWHa/ykZPcK1xAAPofEMVR3nTOUv1A=;
        fh=q/ADuPoI0WWsdKgCtO9CC+aqrhdSArft4SsMqneeN1c=;
        b=DE9m1thbWTln9QD4I1X2KLbvwE0JJXxexvp3ukAzHsaK7PFpfSdaLNkbwXd2ZXrCPZ
         e3L7fNSz9YFbtOxdeCjqGK5+jtSDKGXZSZHRhLNs2iZUkbsz6ZAOeF+hnUUBWF0Sg+lX
         TuiqqpOkpaffSjbgJlPC9VQ2G11rXcYDTgxZA6KplB0m8gpbhv8VoXZVfYhq+rxE64cP
         k/OKbCRFt/RrMujE1uJIaHyUzZjUtzRZtiLlvoiNg0jSmcEP9bL4JeQWyfS0O+MHnG46
         uWw0/hfMQAbC31lBL+BaKZKSZGw8LwrorQ2anqK/vHOyPEXk9lMZ59tYGg9FlOcPV88z
         xP6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188150; x=1792792950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ne8c5V/AfxPlCOWHa/ykZPcK1xAAPofEMVR3nTOUv1A=;
        b=nCb7f8TZXsY5HCUsd3/QlmB4hybQg/FDvPdWxqmDsvYqScRLn3CYfZQJ7CLuPcalZE
         fSb+FvNS0cQOwaaCxbbPZOHSgQyO+XxhA2L5RLeJXuE3gVM3F8VM44fECOdh+yCtcieA
         /d/nLByM9TbltqEN2C6mHkbboLxLIeThkPIeV0TaKAb/J3Th6JWfv6s5wqcgk3MoVo6u
         o99m8xRMxxpPWD0nuyGFxAiQJBJsPRRME0cb/e00xnGqcUqPTy/2ydqohU9Imfmoq6eV
         ++2c20dz4kNIYrIxe7aMfRcjXM9ktk9x1hoCxgDCM6kawsRJXNtuawsT/l4SX8Vm9WTq
         Bw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188150; x=1792792950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ne8c5V/AfxPlCOWHa/ykZPcK1xAAPofEMVR3nTOUv1A=;
        b=G8hNhOJFRVrwdPW9wy+REOAuRIHr2oVIZliXaQqG1wtuAEp5ZqEswWmA2CVR5thlMT
         F8BNQzEj7j78V6FGz9VvhTVMgB+8r2bJbe743VxEKTpKl73kUW7x5udKP7BBCqS27kss
         diKLKQ1zcYwV8Hpo4NsZ0/shkYpv9lFVVYIeKF9vyxxKn3+/I4L0pKhm3WD3ahi84xBg
         ZNlgsN+eT01VcGi+RYlXr6HAWpaNWKTqLE8fOjlYVZjeXQAV51MVMTc+ur2DTyuZr4e8
         v2fiXE7XSCTuSokR3mHXzrmRD1+8z1X39DbVjBzcWLjyY/48U4VRkcyzN6tpkv1f1Zzc
         G8NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYSbkgQO0SYZ4MekNAnKeWck7kooPOIfnOZnsyb0mMjPEqdx77gWewEoReiNCtX2yS5VrrRf6gvidPGTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKImqq5T2j8jPtdOUj7Hqz6zK4Jl0q1yH6All8h9IzVZCqIp9E
	nQUgtqGFONXvE05NePO9kJbWo89H2Hp8BuaTF52R9BTYExYbVs3iOPjjMBjrLf85Yyk9MIFJV1K
	KssJ44kK9USrUxQxzR9glpVeNlskhU7ea6Q76qao=
X-Gm-Gg: AYBFou14Y/01vtVIjMkDIo9ItJsrmDPNZvbxtdcsp1SV6oxV7tfD/YZm+n2vor8SnaX
	S2zJJBRU1yzJDMkmPZxIBnh8B1tu4M+JiRQGxyAM3v8t1vSZ83QOFDpL9HmUB5yEVmAOZ2KxphB
	rOC5FKJcYai2cjIK4EH/ZqMae48D1FXThu6iJN8+SRAcWXd6/AFMLDM7Aezei3rO2V+676bKlWn
	zXqIhf/8+6fICCZKy663KncYwiK6P3WeWQMyTk2JlX5GVAfM+3ML52dzSmkuTG6sNGS2heeUc+W
	xAHnzGpNlWimiFx5lgtDFGo3HzFbTmN0pAZyGja5sZICAaGWq1mv8Kf4NyJXUL6PrFEJxKg4qjE
	luud4Man5xwSXvDEO3sukl8qWUhcwWzmfIXDsB0W1
X-Received: by 2002:a05:620a:2609:b0:93e:7dfa:2f3f with SMTP id
 af79cd13be357-93f29d9614cmr215421485a.62.1792188149594; Fri, 16 Oct 2026
 15:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 17 Oct 2026 08:02:17 +1000
X-Gm-Features: AclHuK9FrmJmWHNbTalVbIQ6Jj0K1MjeWwWf28VCCnLfBjAm_jRBOTkZeqjz3gQ
Message-ID: <CAPM=9tz6wzOBn8o_xgpKkstWwUem0tGzau544TETtuiNthN1KQ@mail.gmail.com>
Subject: [git pull] drm fixes for 7.3 final
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Last set of fixes, mostly amdgpu, some i915 and xe, I think the
dma-buf revert is probably the most important, while technically
correct the fallout from it, means we shouldn't do it now and fix the
fallout first.

Dave.

drm-fixes-2026-10-17:
drm fixes for 7.3 final

MAINTAINERS update

dma-buf:
- revert dma-debug y on debug kernel due to msm interaction

core:
- fix drm_exec prelocked object interaction

i915:
- Fix ARL-S host bridge detection
- Add sanity checks for malformed DMC firmware

xe:
- OA uAPI fix
- shrinker fix
- fix eviction of object with no bo resource
- fix LRU for external objects

amdgpu:
- UVD fix
- TTM sched entity fixes
- SMU 14 fix
- Userptr leak fixes
- Runpm ref count fix
- CRIU fix
- UserQ fixes
- USB4 fix
- SDMA 3 fix

virtio-gpu:
- revert double setting blend property
- reset device before deleting vqs on freeze

vc4:
- fix hdmi audio runtime_pm interaction

amdxdna:
- fix Kconfig invalid configuration

rocket:
- fix error path for failed init
- fix core unbinding and scheduler lookup paths

panthor:
- fix immortalis configuration
The following changes since commit 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907=
:

  Linux 7.3-rc7 (2026-10-11 20:04:55 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-17

for you to fetch changes up to f91a4ac69629e1479745e82100863157e6967ec0:

  Merge tag 'amd-drm-fixes-7.3-2026-10-15' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes
(2026-10-16 18:37:24 +1000)

----------------------------------------------------------------
drm fixes for 7.3 final

MAINTAINERS update

dma-buf:
- revert dma-debug y on debug kernel due to msm interaction

core:
- fix drm_exec prelocked object interaction

i915:
- Fix ARL-S host bridge detection
- Add sanity checks for malformed DMC firmware

xe:
- OA uAPI fix
- shrinker fix
- fix eviction of object with no bo resource
- fix LRU for external objects

amdgpu:
- UVD fix
- TTM sched entity fixes
- SMU 14 fix
- Userptr leak fixes
- Runpm ref count fix
- CRIU fix
- UserQ fixes
- USB4 fix
- SDMA 3 fix

virtio-gpu:
- revert double setting blend property
- reset device before deleting vqs on freeze

vc4:
- fix hdmi audio runtime_pm interaction

amdxdna:
- fix Kconfig invalid configuration

rocket:
- fix error path for failed init
- fix core unbinding and scheduler lookup paths

panthor:
- fix immortalis configuration

----------------------------------------------------------------
Andy Yan (1):
      MAINTAINERS: update my email address

Benjamin Cheng (1):
      drm/amdgpu/userq: actually validate userq BOs

Bommu Krishnaiah (1):
      drm/xe/oa: Zero OA buffer at allocation

Christian K=C3=B6nig (1):
      drm/exec: don't immediately add prelocked obj to array of locked objs

Dave Airlie (4):
      Merge tag 'drm-intel-fixes-2026-10-15' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2026-10-15' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-10-15' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-7.3-2026-10-15' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes

Dave Stevenson (1):
      drm/vc4: hdmi: Move packet RAM enable to PM runtime

Dibin Moolakadan Subrahmanian (2):
      drm/i915/dmc: Harden DMC firmware payload parsing
      drm/i915/dmc: Add sanity check for DMC load address

Dmitry Osipenko (1):
      Revert "drm/virtio: Add pixel blend mode property to cursor plane"

Dnyaneshwar Bhadane (1):
      drm/i915/cx0_phy: Fix ARL-S host bridge detection

Erik Faye-Lund (1):
      drm/panthor: fix immortalis condition

Guangshuo Li (1):
      accel/rocket: clear rdev on device init failure

Heiko Stuebner (1):
      MAINTAINERS: Add myself as reviewer for the Rocket NPU driver

Igor Paunovic (2):
      accel/rocket: search every core slot when a core is removed
      accel/rocket: search every core slot when looking up a scheduler

Jesse Zhang (4):
      drm/amdgpu: don't drop the runtime PM reference twice in amdgpu_gpr
      drm/amdgpu: free the userptr ranges when a CS fails after parser_bos
      drm/amdgpu: report the BO alignment in bytes in GEM_LIST_HANDLES
      drm/amdgpu: keep the eviction fence until the last handle is closed

Jianfeng Liu (1):
      Revert "dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kerne=
ls"

Kenneth Feng (1):
      drm/amd/pm: add zero fan stop temperature support on smu 14.0.2

Liam R. Howlett (1):
      accel/amdxdna: Fix Kconfig invalid configuration

Niranjana Vishwanathapura (1):
      drm/xe: skip eviction of a BO with no resource

Perry Yuan (3):
      drm/amdgpu: fix sched entity leak in ttm buffer entity init
      drm/amdgpu: destroy mutex when tearing down ttm buffer entity
      drm/amdgpu: fix GEM object leak on ENOMEM in userptr ioctl

Srinivasan Shanmugam (1):
      drm/amd/display: Fix NULL sink dereference in USB4 bandwidth function=
s

Thomas Hellstr=C3=B6m (2):
      drm/xe: Don't transfer shrinker pages for pinned bos on
purgeable state change
      drm/xe: Bump LRU for external objects on exec and rebind

Timur Krist=C3=B3f (2):
      drm/amdgpu/uvd3.1: Fix checking whether UVD firmware keyselect
was already set
      drm/amdgpu/sdma3: Work around POLL_REGMEM / FENCE hang

Yuho Choi (1):
      drm/virtio: Reset device before deleting virtqueues on freeze

 MAINTAINERS                                        |  7 +-
 drivers/accel/amdxdna/Kconfig                      |  1 +
 drivers/accel/rocket/rocket_device.c               |  2 +
 drivers/accel/rocket/rocket_device.h               |  1 +
 drivers/accel/rocket/rocket_drv.c                  |  7 +-
 drivers/accel/rocket/rocket_job.c                  |  2 +-
 drivers/dma-buf/Kconfig                            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 15 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        | 23 ++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            | 17 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 10 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             | 25 +++++--
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c              |  2 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    | 18 +++--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 55 +++++++++++++++-
 drivers/gpu/drm/drm_exec.c                         | 77 +++++++++++++-----=
----
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 12 ++--
 drivers/gpu/drm/i915/display/intel_dmc.c           | 76 ++++++++++++++++++=
+--
 drivers/gpu/drm/i915/display/intel_dmc_regs.h      | 12 ++++
 drivers/gpu/drm/panthor/panthor_hw.c               |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 20 +++---
 drivers/gpu/drm/virtio/virtgpu_drv.c               |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             | 13 ----
 drivers/gpu/drm/xe/xe_bo.c                         | 11 +++-
 drivers/gpu/drm/xe/xe_exec.c                       |  7 +-
 drivers/gpu/drm/xe/xe_oa.c                         |  7 ++
 drivers/gpu/drm/xe/xe_vm.c                         | 31 ++++++++-
 drivers/gpu/drm/xe/xe_vm.h                         |  2 +
 include/drm/drm_exec.h                             | 15 +++--
 30 files changed, 348 insertions(+), 132 deletions(-)
