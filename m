Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CEB474247
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346701; cv=none; b=TW68e708QSpd979MMkSc8ZqnpApEC8/T5ieNZNzHrOwx5ZDtQ3TffSJgiBYu+V640JPx65amth2dZ+VGcuqBHS4Okccy1RjfutvqYzITopcZVWah4dirgY/n0pCsDiKQjqvU8aqlcLmXfgYgjKeZsuA+FiJgPwrpRY9V90eMWlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346701; c=relaxed/simple;
	bh=x7o79AvVWCeq0EQbu96gTjgDogKxKZ9kvlnJFJDcFFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1v1m0rM1D4XEiPL0JEjLchQ68T1l9vNWZ9xuFyA5os8ON6X3HYGYgbAVHQmlmpxrOrD2HJn0kG0CE88n26YXLJhRoUfp2Pe3PWCL97GUZ3AHjVVvOlvnayZt0biy8XiGmLFhONLyhu0/AThyYBoGQLe4vg2DkE/uSgjzy7FFQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZAHOWp9; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZAHOWp9"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so1004654a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788346699; x=1788951499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKOzquW3shhpHe9E1Zxbxrv1dgTm0ijUX8KBrUVXtfI=;
        b=pZAHOWp9zYWnaUCv00XthNTQplf2AmBj/6hR9IH5F5wmF0dfneBKcOcn+gHZ810XZv
         D9qaJxemS10i7TbQLj5/QEh/3t03TX7xEwcmy6cJYNa7VEw4P+/hGfA4Xs28I+8i1DGc
         Ydd2V2aSQDIFBqORj71K8tawQlV7hUMp2ZIfqz2Qm8NAi+4febrTY7jXkJJiXZypZxov
         GIgD3Baa5Da540Ogs5VStjoe+fOy29Qf4eDEbgBMfPqeqpn7naSKsFG2fJWTH+vFD3Fl
         Q+TkSFEcCt/ef39mPR2U9rLQXyu0Ep0x2uqv2dzcFJ6w1WvpOy0cFoINPkb4cH26E1li
         7urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346699; x=1788951499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cKOzquW3shhpHe9E1Zxbxrv1dgTm0ijUX8KBrUVXtfI=;
        b=c4/7Pkap7bfX48L/rig//f3gO82yFZcYD9fxd11EG52tIpP6V1rLOFdz6Owe+4f8SC
         J/YZ5MYh7fcAtaFAEdvgpjCJJieT94Xq8o+Oq3UWz1FkZsFI9R1B83r/If4hL3HLJuil
         xAI50DbnNSPmxiqCGyfwxdBOjWYD9VjePNHDf/JHfi7sYkeCzo4hi0D7cHmKGBM/Y0pb
         89h0Uy8BTx1sKRfiAIaQ38vM3CrrCMWxCQ9lRLM7m8Pkw2SwMhDiKzLUKOJ9vChystDd
         7/iT3NSkPdUMjb0QF83f9kCGio7COtVPOxCc6tk+5KUeq3bXk878FYiHf6UOezrj8HeY
         LezQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxYDmINbvIYXkiEan2slx1C5ly0BG971keDp5O6erOHV3/0wMO5gJep2kLcwHfRM22Oh71s2kfMqrxDR0=@vger.kernel.org
X-Gm-Message-State: AFuF++lcGEcJLPWUSYNOCWvJOmcpj3ACmEzt/zuhvXTCLo+2tu+5pr2u
	YWFE9y2MZ0+Mn05wILOCJfiRPhfuPAL8QxmzPWzAly6rMhSycY9I+F0=
X-Gm-Gg: AYBFou1naw2c6SqRNAjOVRGqDmi8LuTYftSPMDdlazQV2ST76kXhcq1Zn1vbPc4jThR
	vJthBx6I44xlAPaXhf4XfUfuBTNlhPqQHwZ7xsPyh+0OKPFzxc1Qdq+y2AcOhgl+XKzMnQTaQXW
	oM6Tzl7Mt4VwI4ndQlLV9XL1PpvnHvOyioLBAXLzFHXe+XP9SFstOnrdUotq7kltpwd7fDO1dNS
	z7hjLLK28uNiC9ThAVLL8GUfY+eaYzEKEuUCLrtO0Mtw1nwbhYRnVAeHbF8yJOgjH6T4GtFwJH4
	kZzOtzprkjPFRp705ko40tBp10T8x/Vu0pWR3ETD+2JeQcrR6iZUsZKRZidw8UyoiSyYoP+mPwI
	Q5yct3PxVubYkQ0J+zCgvBhI2U4m2RzhNijvTHSSa9pY/uLhKxHSzJC2eudVGJMwcXUaJq+BeP6
	9AOGMspX5Gu0GjvlW27xEy8HcPUx6Ev3Bcp8Uoi2yIeXHvvbhIi8170pVY2y/ghnAx20/jnANAK
	sqJ//1i0GxeL6BTnJvHsg5FIUk=
X-Received: by 2002:a17:90b:4d82:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39aee1ab4c4mr5010188a91.18.1788346698548;
        Wed, 02 Sep 2026 03:58:18 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfcd65sm4963143a91.3.2026.09.02.03.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:58:17 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: tursulin@ursulin.net,
	phasta@kernel.org,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] drm/sched: cache the timeline name to fix a use-after-free
Date: Wed,  2 Sep 2026 19:58:07 +0900
Message-ID: <20260902105808.1541063-2-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902105808.1541063-1-malhyuk97@gmail.com>
References: <20260902105808.1541063-1-malhyuk97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fence_get_timeline_name() returns fence->sched->name, and the
drm_sched_fence ops keep a .release callback, so the fence is not
ops-detached on signalling (dma_fence_signal_timestamp_locked() only clears
->ops for fences without .release/.wait). The callback therefore stays
reachable on a long-signalled, userspace-held finished fence and
unconditionally dereferences fence->sched.

A driver that allocates a drm_gpu_scheduler at per-context/per-queue/per-VM
granularity and frees it on an unprivileged context/fd close, while
exporting the resulting finished fence to userspace (drm_syncobj /
sync_file / dma_resv), leaves fence->sched dangling after the free. A
subsequent SYNC_IOC_FILE_INFO ioctl (which calls get_timeline_name()) then
reads the freed scheduler:

  BUG: KASAN: slab-use-after-free in drm_sched_fence_get_timeline_name

This is the same class as CVE-2025-38703 (drm/xe) and CVE-2025-71302
(drm/panthor), which were fixed per-driver. amdxdna, nouveau and msm
(VM_BIND) are still affected in mainline, so fix it in the core to cover any
per-context-scheduler driver at once.

Cache the scheduler's name pointer in the fence at init time, while the
scheduler is guaranteed alive, and return the cached value from
get_timeline_name() without dereferencing fence->sched. The timeline name is
not guaranteed by the contract to outlive the scheduler, so document in
struct drm_sched_init_args that the @name passed to drm_sched_init() must
follow the dma-fence safe access rules and outlive any exported fence. Every
in-tree driver passes a string literal, which satisfies this; drm/xe's
299bc6d50b1b keeps its dynamically-allocated name alive across the RCU grace
and can be simplified on top of this.

Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
Cc: stable@vger.kernel.org
Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 16 +++++++++++++++-
 include/drm/gpu_scheduler.h             | 18 +++++++++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 096fe28aa9c9..a944eeeb25bd 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -92,7 +92,13 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
 static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
 {
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
-	return (const char *)fence->sched->name;
+
+	/*
+	 * Do not dereference fence->sched here: a userspace-held finished
+	 * fence can outlive a per-context scheduler. Return the name cached
+	 * in drm_sched_fence_init() instead.
+	 */
+	return fence->sched_name;
 }
 
 static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
@@ -228,6 +234,14 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	unsigned seq;
 
 	fence->sched = entity->rq->sched;
+	/*
+	 * Cache the scheduler's timeline name. The finished fence may be
+	 * exported to userspace and outlive @sched (per-context schedulers are
+	 * freed on context teardown), so get_timeline_name() must not
+	 * dereference @sched. The name is required to outlive any exported
+	 * fence (see @name in struct drm_sched_init_args).
+	 */
+	fence->sched_name = fence->sched->name;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7a64cc11de08..412b8c4643f1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -322,6 +322,17 @@ struct drm_sched_fence {
          * belongs to.
          */
 	struct drm_gpu_scheduler	*sched;
+	/**
+	 * @sched_name: the timeline name of @sched, cached at init time.
+	 *
+	 * &drm_sched_fence.finished may be exported to userspace (via a
+	 * sync_file or drm_syncobj) and can outlive @sched: a driver using a
+	 * per-context scheduler frees it on context teardown while a
+	 * userspace-held finished fence still references it. The
+	 * get_timeline_name() callback must therefore not dereference @sched;
+	 * it returns this cached name instead.
+	 */
+	const char			*sched_name;
         /**
          * @lock: the lock used by the scheduled and the finished fences.
          */
@@ -646,7 +657,12 @@ struct drm_gpu_scheduler {
  * @timeout: timeout value in jiffies for submitted jobs.
  * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is used.
  * @score: score atomic shared with other schedulers. May be NULL.
- * @name: name (typically the driver's name). Used for debugging
+ * @name: name (typically the driver's name). Used for debugging, and as the
+ *	dma-fence timeline name of the scheduler's fences. It must follow the
+ *	dma-fence safe access rules: a &drm_sched_fence.finished exported to
+ *	userspace can outlive the scheduler, so @name has to outlive any such
+ *	fence - use a string literal, or free it only after an RCU grace period
+ *	past the last exported fence. See drm_sched_fence_get_timeline_name().
  * @dev: associated device. Used for debugging
  */
 struct drm_sched_init_args {
-- 
2.43.0

