Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875524501D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012540; cv=none; b=I6H6ILfwf8SvSp+4yKpdoZePm3Ad8tPCgYvJLbQtzkxgQO1ayNIgm7FJ3oH4OgkSoBjEQ6xkFwvCX3M8u9c7bLvSftVTPWnZjMdXXKrlR4b/e5vWkVUrYuRCkwurj1rUuGX9Bw8p9iG0QqQtCmW4hLT4U7Gb5JuWLpiTTcb5ilQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012540; c=relaxed/simple;
	bh=A6GsKKkJXl5L7YzCiIgYbfCfujBGyy0zfAO6BJd6n40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BO64yeJ3AW5/ZbciIiV7362trD7ru8wjMc/5MpnUeiPGDAdHwD4kJfTHoyKeof8nQRWsbbYY6IiNjp5/fmaOwe5rNDf0ThK2BWPn5zJMLRq04XLoCCi7naHG9gsRVo4h0aCJ5mD7N5jN4qVINa3oJVqBP/oxIZHUyrhqTqXdB5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tN/rGOHg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tN/rGOHg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dcff8f44f2so19152795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789012538; x=1789617338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPM4fbgv5y4YMJuB77L7DZFml4GSDExAAI3kJwNhoig=;
        b=tN/rGOHgdluQkpOtTdWXSHx+GoCZTJb26miRT8N6IpdVvUPoVKYhCN+NMGtFx8Xmub
         RBEBszeiwUoImClaupAbbR7/ImMfEcVmTIG4oPFszDeZUlK8t3VeQEBPAx3/+xO+oBhj
         xj0VQERlJUK1JgEDbB4MLg/9ktkHcDDkt8SAN8fUkxyQpbUEJhG5OVpwVCON7Ak9Rv8X
         BrviFPlNbAdKRde+3P5F9kY3Kd/VXV+6d1a3KbC8MKXgMGvHctW3mOCi7x6uCNji3HEb
         NpGXKqyR2wM6JPD89e8pxe80ys48V0WhiNLHRmGfYw1q3/WJT2e8KYnwzVsXak5fCbt8
         EGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789012538; x=1789617338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPM4fbgv5y4YMJuB77L7DZFml4GSDExAAI3kJwNhoig=;
        b=Vuf1jUR2Ts56iCCYxrUrZg0FXgfYCn1Yyxm6AWy+C7+f1Ui12NElgv3rhzjAvM1unF
         f7o2wg1KZsXHuYCKCg9Kgi1hAUbooltLsUiULz4lCC2JvMrAlejR7tQ6GMZ/WT0y4sgN
         hDqs9rd107boIGyljLkghwWNGbrGAaSX1sl0WIdRPJnZUEeZ/BHEEAnBJ64tZs6vw0Z4
         hIonoRNbobk+2xWR+/5jzT52co4ktSawQ2m+QXzWxKeUbCsRagCT72MChLazU6KyM0Ot
         gDIEy3jb1SR4XyMcRaw5csXbFzFQ6cozfry9NAhMISQ5uK5wABTTwq/IFGULDmzsmve+
         Q5Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwfbDGKy8zNzum4Fd2T93Gg0kX1FjnwGRsJeKdN5Hg5n9UCZC6LjODAj3VE39fM4dyO9urLI27hXQXvDnc=@vger.kernel.org
X-Gm-Message-State: AFuF++m1ILFYGdzsC0YmbWhqvH30K8k4ijRsR2E49Z6A+VCWgaU/EGh6
	VshxL/iKaodQq6MxzJ+uSJ5CuJlIYqNED3sd3AKZ4sL6k/njwyOlo6c=
X-Gm-Gg: AYBFou3KkBBXY0Br1lKe3AOY7sXvnTmqlsC2vzXE37cqslzBzCgopT+xrgpGrtELilg
	x6SYGiXuSYGZXpg2XyOQM1rsbjirctAouPY9yNkphvKtKWpr7Jy6kZwhX1RqSqHvwm5srWc59Qr
	jfslPaTliq8+eRCEM88uDz+bHAxBMr3HVlwGsaVzuXaInfxUScBgGVtDTRhRppUiKgOv1Y5pXWC
	QLmYDfzgNLO+tysAj7QtdmXDAz5zlg1JGVmsHdX25Dv9bcegdlOeDylR7KvUeKeXSN2EbJqOcVB
	KytgoJj8pYGCBh+fvxpEPApalgub/9bie/2wv0V+Q/ugOJkN4FUmVU4mImycei9Hbjpz6WcwM+P
	0KoRldBHpJs9mE2Z5utM/rRZWHdCM7Nr75Z3Cq+0yNBZAix/YN2lP13C7S37yr2c/UZ4G/2y0qI
	qnirSjIQg4zpUNRJWE0Swivkfq7BwqiXPnRPEhyMOgtfxSHhgxm/WZ5m/SzgK1zzl1NJ8rQZT+a
	SZ5ANceMSFourfc+dXLuPEp9w==
X-Received: by 2002:a17:902:e94f:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2dd060d8e01mr79963885ad.13.1789012538296;
        Wed, 09 Sep 2026 20:55:38 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b57fsm81545805ad.24.2026.09.09.20.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:55:37 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH] drm/amdgpu: don't release the fence reference consumed by the scheduler
Date: Thu, 10 Sep 2026 12:55:31 +0900
Message-ID: <20260910035531.559908-1-donggeunyoo.kernel@gmail.com>
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

