Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A35346A04
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019162; cv=none; b=FsO+xasmcIvJzY4iJR9HGJdYx3xRMSf8jQ9xMc4kWcJcy8TZHu5CtNeYuKKszJqMT2YAuE5e4q+iJ8GDNdEYLFGFZi4wvYSbrOBqupCR31IRhuRDhIZu/rmGM4+S4DB9XY61cT51XMUopygHGlIITmfwj64XlfeMw48buw3b4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019162; c=relaxed/simple;
	bh=mmSkEJgkrGENsnkJ3eL4XiEccw7fmfe+amdZ8byqUFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVc65Ku1PGFmVEH/Q+dVUpPrlzxohAj3Bdd/+K4zZER94RVFSCpCFzQ1lIbneBg5BPVXPDLixpCqAbmKx7O64Jn8LcgAIQUs/UlhrRpq2MJy0OLFCrPb4LzwedkbenZiy55T7YjD4Cg1BmffMUTjCPhxsUaFYdZbWFxW8sK1A38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAULHlAZ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAULHlAZ"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so733622a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789019159; x=1789623959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkmKEwjSzJzm/ZcQfO9s4H31K3Ko5LXj6dOZ0ec6uns=;
        b=rAULHlAZ5RMqY9g911zb+Yw+ktC5tek8tQLB7p0bAKolCVcgbhG6X9i45zLGhxL7of
         OBnLmHaW/kFaw+mk4Ff6w5JA+o5DeG0qUPuhTXcKxMjCMiNFC0asIF/iBdDD0o90ayxB
         TomMdJTvP+w39oSZ7yYfVQ1jcOAgKvE1iyESbMfWSQI3b20HsRrpIkQMoI43yDl31aSY
         Q0Cxv2C/Lg1/AOL11gO0ddgGIkDdp41ITp3nj0pnmDd4hk1S2rGQKpfmaHSysckf9pET
         GuvlrgeyrvstbuQQzFTDr3yZ82hYx/kKe8RxTHiqOuhFk4oPB4Ug7cHy6R8rxBfCPDR0
         HHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019159; x=1789623959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkmKEwjSzJzm/ZcQfO9s4H31K3Ko5LXj6dOZ0ec6uns=;
        b=Hcm5HNtS/qa1jLyAKIRgxnPgBO9/aSfY0c8XGlynAiUN/HGHEGu8rE9TV3CxdireES
         9zX5KHgfOius7wHKud2HJQsb8WAVs2UHERv/xJO1ZKXPugnzCb1jxNB8t8Uq2MhU8+sN
         BhR/7p+//cckcq4Fn2vPoTH6C1c6yvsnPgIvw0nKghCKErIPIfypHnB0W976WABVhzML
         GcDW1/QAHXoEmcmVhSbXUXdEljYKmFMduzzCK+22xlmZfBXxALqjVdIFJKsDoP7c2fsc
         SawaH7spz+wEWotWXbH5esT29Rb5RbOBgkUBiXhLytQP/M77WETima3jdxInHmM1VCfy
         Z6Fg==
X-Forwarded-Encrypted: i=1; AKwUvByPvwOw2CqWDsZKHc6hnEB3f+IpEQMBJyGZBBWF6YxsBBn2UK7SfZHJm0gQOjkd0tRHS7X/75OdG+6w5og=@vger.kernel.org
X-Gm-Message-State: AFuF++mwxI6KyORv1ktMoon0X5hHvCTKmNqhFkKnhtnTKhFtI9ryvF02
	+/Ezjv6wIXIWejMFhqsE+VLcc/mh9sYPyde9Gc52W+0VpCvuJ1aab/0=
X-Gm-Gg: AYBFou2a69+t4FAuRlplk7SJdzt67TuzkFP3+/m5UN6L3fegvR/hP1DdDhrnDyG/GVm
	f5d0GqAqV0R7f6b0SWSzrVRENrbeAFF/2HiWxcqm0bB2i45RLZvJoBnjXTREha1S8GCYtOumv77
	7mLN8ybmRSBkHNU1ezCD0QDkzHzpmEp4DSIwNk7A/cJTwFhUKcJNdfjO2HEcmAuxo0TJrHazNXK
	czN24fxj3THKDOLT19GmLzz/fXpZPep36no5geSMqQpUZMH3iM5BGrxHzZuxE8ddMywfIJv47Jr
	EXBhnQgvTQYWFG4DstxMJCp/KUe+i53k1825t7bp3HBBSfKPs7QTbLcZCMNA5EPcV1vXqsOQ56K
	SExydxW3gYvK0b6X4j8hnElqzeq2N6UNfTzwB16LqG7I45FmqG64cdmKLG7QKl7TaPamjpreJhZ
	2DCHx6+1RgQf0eM09zoXhn8HmJCvhhC/9RXDVTWEF8+dCP1K19OF/kwVtWRKNdta99bGfRKb+xG
	HLYQm4enThOS7Dg85qRc3Q4hQ==
X-Received: by 2002:a17:90a:fc47:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39d7799fcc2mr2492773a91.3.1789019158573;
        Wed, 09 Sep 2026 22:45:58 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm2310421a91.5.2026.09.09.22.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:45:57 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] drm/amdgpu: don't release the fence reference consumed by the scheduler
Date: Thu, 10 Sep 2026 14:45:51 +0900
Message-ID: <20260910054551.634054-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_job_add_dependency() consumes the fence reference in both the
success and the error case. The kernel-doc has said so since commit
ebd5f74255b9 ("drm/sched: Add dependency tracking") added the function,
and sched_main.c does the dma_fence_put() itself when its xa_alloc()
fails.

Three amdgpu callers take an extra reference for the callee and then put
it again when the callee returns an error, dropping a reference they no
longer own. The refcount ends up one short of the number of owners, so a
later put consumes someone else's reference and the fence is freed while
that owner still points at it.

In amdgpu_sync_push_to_job() the fence usually comes from
amdgpu_sync_resv(), which walks a BO's dma_resv and hands each fence to
amdgpu_sync_fence(), where the sync entry takes a reference of its own.
The fence stays installed in that dma_resv, so once the entry's reference
is gone amdgpu_sync_free() eats the reservation object's instead and the
fence is freed underneath a dma_resv that still lists it. The
use-after-free lands in an unrelated thread.

amdgpu_vm_sdma_update() is cross-thread by construction. It walks with
dma_resv_for_each_fence_unlocked(), whose cursor holds exactly one
reference, and the dma_resv_iter_end() on the same error path drops it a
second time.

amdgpu_cs_submit() stays local: the extra put takes the gang member's
scheduled fence to zero, handing the whole drm_sched_fence to call_rcu()
while its finished half is still live.

The extra get is correct at all three sites and stays. Only the put on
the error path is wrong.

Every other drm_sched_job_add_dependency() caller in the tree - etnaviv,
imagination, msm, nouveau, panthor, v3d, xe - hands the reference over
and returns the error untouched, as does
drm_sched_job_add_resv_dependencies() in the scheduler itself.

The trigger is xa_alloc() failing during command submission or a VM
update.

Measured on a Radeon 780M (GC 11.0.1) with a forced -ENOMEM return from
drm_sched_job_add_dependency(), printing the fence's reference count in
amdgpu_sync_push_to_job() on entry, after the failed call, and as the
error is returned:

  unpatched  entry=5 after_call=5 on_return=4
             entry=6 after_call=6 on_return=5
  patched    entry=5 after_call=5 on_return=5
             entry=6 after_call=6 on_return=6

after_call equals entry in both, which is the callee consuming the
reference the caller took for it. Unpatched, the dma_fence_put() that
follows takes it one below where it started, and that reference is the
sync entry's own; patched, there is no put left to make and the count
leaves the function as it arrived.

Fixes: 41cc108b2451 ("drm/amdgpu: fix missing dma_fence_put in error path")
Fixes: ed21f6c3fe42 ("drm/amdgpu: fix another missing fence reference in the CS code")
Fixes: c1c4a8b21721 ("drm/amdgpu: grab extra fence reference for drm_sched_job_add_dependency")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Resent: the original reached lkml but not dri-devel/amd-gfx - I was not
subscribed at the time. Apologies to those seeing it twice.

Tested on a Radeon 780M (GC 11.0.1) running 7.3-rc2 with KASAN, lockdep
and DEBUG_LIST on, driving compute submissions through radeonsi. The
-ENOMEM was forced by a temporary module parameter on gpu-sched that
makes drm_sched_job_add_dependency() fail after N calls, consuming the
fence on the way out exactly as the xa_alloc() failure does; the counts
above come from a probe printed in amdgpu_sync_push_to_job(), with the
unpatched and patched drivers run through the same harness. Neither
produced a KASAN report or a refcount warning: at the point of the extra
put the fence still had four or five other owners, so it is not freed
there. Observing the use-after-free itself needs the stolen reference to
be the last one, which this workload does not arrange.

Only the amdgpu_sync_push_to_job() site is reachable from a plain
compute workload. amdgpu_cs_submit() skips its loop body unless the
submission is a gang of more than one job, and amdgpu_vm_sdma_update()
was not reached; both are fixed here on the same reasoning.

No Cc: stable. I believe this qualifies under
Documentation/process/stable-kernel-rules.rst:19 - it is a use-after-free,
not the theoretical race condition line 27 excludes - but I have not
observed the failure itself, so I am leaving the tag off rather than
claiming more than I measured. No objection if you want to add it.

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c    | 4 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 1 -
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 03b41f803520..12ec031c0812 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1303,10 +1303,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		fence = &p->jobs[i]->base.s_fence->scheduled;
 		dma_fence_get(fence);
 		r = drm_sched_job_add_dependency(&leader->base, fence);
-		if (r) {
-			dma_fence_put(fence);
+		if (r)
 			return r;
-		}
 	}
 
 	if (p->gang_size > 1) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index d6ae9974c952..4f31021b2152 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -447,10 +447,8 @@ int amdgpu_sync_push_to_job(struct amdgpu_sync *sync, struct amdgpu_job *job)
 
 		dma_fence_get(f);
 		r = drm_sched_job_add_dependency(&job->base, f);
-		if (r) {
-			dma_fence_put(f);
+		if (r)
 			return r;
-		}
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 50cc0779c340..c070c4a032eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -234,7 +234,6 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 		dma_fence_get(fence);
 		r = drm_sched_job_add_dependency(&p->job->base, fence);
 		if (r) {
-			dma_fence_put(fence);
 			dma_resv_iter_end(&cursor);
 			return r;
 		}
-- 
2.53.0

