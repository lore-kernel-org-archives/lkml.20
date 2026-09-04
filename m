Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3CF3CF212
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509185; cv=none; b=eQb5y0TgnsKJ+e0FCAOCNUgE5v91S1X4BNgghPZ84gYt6xrDw+9XPIpnpXiY7cUiJiqQs0u7JrFBXwExcejWIpfpAX8dBkUzq7SkB6WU4hmeiNu0lQ/WqKFNl3yPa4Z7XHP9WXuof/EqhXMCN2mPuuW8uPdHu3bnWuWxG1eofKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509185; c=relaxed/simple;
	bh=E4VO9N7Z2bwf8/j2sBtJ951y3XLN+Ou+PXkX4zCtGIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRo2Ln90Q0hgyru3ot4lWnxqAJspnG/DIve7xOsNJTBHPu0Ejd8bF8FzgUbWD5BPt7AePhUowZPX5cITllsEn26WjFu1DoY52mb3btlP3V7slsYcYKCHncfdBFaPXMfvLtykQ2NTqOLw7TLLYzHZQxyqa9jQgg6CXKs+IjiooK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izTBAEgh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izTBAEgh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso8351615ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788509184; x=1789113984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvzKUaxKqDduKUy6EaV8rSY/p2Qwfvb5qYVmt7Thsg8=;
        b=izTBAEghFRgX9ORJBe2LsCoC67fk+Z6TFfsD8DHWjtex5ZVPvc4rZt4plaVMaaOsvk
         L8bW+dbmFi5KK4TsjfR2KPgeO0c4o+zdB3+ezhE3uuBv2WXn8Lkbi79DVKofKUdJqK9X
         0xTIOHzFtHkv6m0oV25QFscBs9hVF4eOpY8YRc4xEV3/2tgmoOYT09YeIQ+e5TWod+rG
         tzhzFCX8R3f1QJAKxAmHvpZEYR/WwSX9bw10UqJIyG2pqcG4xaZHQRfTPgWUWutoypgL
         9eOx0XuRU9b8jFzol11D8UPTUIRlDS7KXm7/dXy9DCB5KgMI7QjTJHSRHDQWqtoSh/F5
         q/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509184; x=1789113984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvzKUaxKqDduKUy6EaV8rSY/p2Qwfvb5qYVmt7Thsg8=;
        b=dvlURHatClo56Qv846XQnVN4EYffOasZh4nuKYpkPlCdDAeL0kBI0tsOpjXFc0GpMY
         0iCVps0j9plFAhcyiraMzfEbGqnMyCe3nuDysQX+zTKCGaDi/CCjZdqjWrB0ytdCdqC9
         /BNR8mxwvSTm3I+OFIipjiGRxn4/afJdKzjm3f+wOib8Bdk1kP7HERbugHHy3iRR0Asv
         hrQpYdcRFZGkVy3/dyJtRESn9cJMS+Jd5rWGHKriUFw3igcMKuuZ6EuR4qDfw+DuQrbr
         21yZps9j2Ul+iz9ryUn2etzA7D1tXcjkAsNv4y10/h/qORFefqFmC7jk7NnQS7dBhi5J
         YPUw==
X-Forwarded-Encrypted: i=1; AKwUvBwFUY9LAJnavSsL9HPseltKhYQRLFH89k1ktI8j+2x/g+P2ocWoDtjs9x9xd1NO4qMm8G6uBCOewbNACF8=@vger.kernel.org
X-Gm-Message-State: AFuF++kaxeX1N5mjae8gl+f+FA8orCw0yljoxdt3kHvXDxYGB9zU8cLq
	3hJd9WA92b+BQiED8W+CZRhkCrX5IMpdIaEsyVv4QG1vHblb5S99/yk=
X-Gm-Gg: AYBFou16ah8VTAmHIPoSzLpsozIrRkS0y4g6q9sX36Y25Vt+PV6FFcQhZARlH/DFsA+
	NmgeZTZFbrl2sUXCYTV4+Zd2evmhg1jQdH4maLhpV7botzbfdsO8zvNiSpLXDXbnx9omwefkczO
	OErtp9WY6nGblA5QijvUTCnj+2/OnvZVMbhnOBbdt71SETrMZ5u6FGhsY4qjTKrZBGk7PdGOAw3
	/L8oWTF9ZTGFcdlEDq7p0IHczEaIpru7ZAzfPT2ajgknfCJaduAS6wgArT6gpyUPhA1/qvnNHCL
	XnGBdugqNur2VspSwBQp6Ec7M9V3ZD96h/huF+D78t/xYeYd8VgZAciBcuKxagTN6L0ZxsI0qMc
	sRIThHAh5ZF79KWpaWW9SrelSUSuoI9mi7lKnrydjwxvQhwNEkOVmFhKRtrtJ+D96c8ukY9nYKO
	fNuAdyfqaQMZmE6N2DLBj/w9LcEsyQqhuFhGYsD5cF4uWg8p8FM4z5g6L7F/7azTMkrXAsa6f9o
	o7DouYjJDQO4tQSoU5obl1n2z8=
X-Received: by 2002:a17:90b:2f87:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39b260fe42amr7289642a91.5.1788509183617;
        Fri, 04 Sep 2026 01:06:23 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b261549f3sm3181153a91.16.2026.09.04.01.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:06:22 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: phasta@kernel.org,
	christian.koenig@amd.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	"Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
Subject: [PATCH v4 0/3] drm/sched: fix use-after-free of the fence timeline name
Date: Fri,  4 Sep 2026 17:06:15 +0900
Message-ID: <20260904080618.2098450-1-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fence_get_timeline_name() dereferences fence->sched->name. A driver
that allocates a drm_gpu_scheduler per context, queue or VM frees that scheduler
on context teardown, but the finished fence can outlive it: unprivileged
userspace holds the exported fence via a sync_file or drm_syncobj and later
queries its timeline name (e.g. SYNC_IOC_FILE_INFO), reading the freed
scheduler. Same class as CVE-2025-38703 (drm/xe) and CVE-2025-71302
(drm/panthor); amdxdna, nouveau and msm (VM_BIND) are still affected in
mainline, so this fixes it in the core.

v3 tried to drop the finished fence's ->release so that dma_fence detaches the
ops on signalling. That turned out not to be viable:

 - amdgpu dereferences to_drm_sched_fence() unconditionally
   (amdgpu_cs_p2_dependencies(), amdgpu_ctx_fence_time()), and ops-detach makes
   the helper return NULL for a signalled fence - a deterministic NULL deref
   reachable by an unprivileged process;
 - drm/imagination uses the ops pointer as an identity test in
   pvr_queue_fence_is_native(), which Philipp showed would then race; and
 - Christian pointed out that the reference must go from the finished to the
   scheduled fence, not the other way around, so v3's refcount rework was wrong.

So v4 goes back to the minimal caching fix: get_timeline_name() returns a name
cached at fence init and never dereferences ->sched. Both .release callbacks,
the shared allocation, the call_rcu() free and to_drm_sched_fence() all stay
exactly as they are today, so there is no amdgpu/pvr regression and nothing new
for the backend to reason about.

Detaching the ops is still the better fix in the long run - it is what the
dma-fence rules ask for, and it would also cover get_driver_name(), which can
return a string literal from a module that has since been unloaded. Patch 2
records that as a TODO entry (and a comment next to the fence ops) with the
three blockers that have to be solved first, so the cleanup is not lost.

There is no unrelated formatting churn in this version; the kerneldoc reflow
that was mixed into v3 is gone.

Tested with KUnit under KASAN and kmemleak (kunit.py --arch=x86_64), matched
pair:

  - unfixed (get_timeline_name() dereferencing ->sched):
      [FAILED] drm_sched_dma_fence_uaf
      BUG: KASAN: slab-use-after-free in
          drm_sched_fence_get_timeline_name+0x9c/0xb0
  - fixed (this series):
      [PASSED] drm_sched_dma_fence_uaf
      Testing complete. Ran 43 tests: passed: 43

No kmemleak reports, and the whole drm_sched suite passes with no regressions.

Link to v3 (ops-detach):
https://lore.kernel.org/lkml/20260902144204.1843670-1-malhyuk97@gmail.com/
Link to v2 (caching):
https://lore.kernel.org/lkml/20260902105808.1541063-1-malhyuk97@gmail.com/

v4:
 - Drop the ops-detach/refcount rework; return to caching the timeline name
   (per the amdgpu/pvr regression above and Christian's reference-direction
   point).
 - Add a TODO comment and a Documentation/gpu/todo.rst entry for the
   ops-detach cleanup (per Philipp).
 - Keep Cc: stable with "we don't know since when" (per Philipp).
 - No formatting-only hunks in the fix patch.
 - Test suite renamed to drm_sched_dma_fence_uaf_tests for consistency with the
   sibling suites; re-verified under kmemleak as well as KASAN.

Jonghyuk Kim(MalHyuk) (3):
  drm/sched: cache the timeline name to fix a use-after-free
  drm/sched: add the fence ops-detach cleanup to the TODO list
  drm/sched/tests: add a UAF regression test for the timeline name

 Documentation/gpu/todo.rst                    | 39 ++++++++
 drivers/gpu/drm/scheduler/sched_fence.c       | 24 ++++-
 drivers/gpu/drm/scheduler/tests/Makefile      |  1 +
 .../drm/scheduler/tests/tests_integration.c   | 88 +++++++++++++++++++
 include/drm/gpu_scheduler.h                   | 18 +++-
 5 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_integration.c

-- 
2.43.0

