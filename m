Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98364471423
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929089; cv=none; b=OT0oEa5Lui1387RyVINt0WXJENdcQ0lYnNnojarXTK/lV1tg3qq3iAzrLtITeMcVxALRnSbJmHCb265rfLChH/USU8qkLh10L/2D6DBJE3JqqqhCtgDEhlF8SHo/frI6+b+Vy8aUeLC5+YKOSZL8lEOld8sOzf8wcb+OLwRLEFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929089; c=relaxed/simple;
	bh=j/QF+SsgVpc9T/mOKas0bFiVgpszPB5eEvQ5VAl/WMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cppkihlyOXMrm9AhIhNbi1SaQt3Uzz+Zj3KTHUsDAOLrg8a01I7SxFh9L8sJlknZeZGrkRkZ8x9pRPr1NfBqYlMRmV0Zo6ndygOQiwsAlSRefAWYAdn5+21BxjQY9NNRWmNvvwiYDzLc5yjj+gmc9OL0+z7WdildWJ++J8O3jzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT2/iMRA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT2/iMRA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce7d2adef4so16214095ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929087; x=1788533887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+G8BuKyr4mNyS/k4RzS4KN1oeGSViDq6yduxoa5BN8=;
        b=DT2/iMRAQ+SFZOzFESlYiwhbpGZKISIweua3srNYeAHOcPA8v1rGa/IzAEqURwgW5S
         4aRdDUEf5+P0xhZnRm4AM6kAhF8sVNG8uOqzc/CP9OS6KtpgWgaqlFlB+zf3SiqIZuMu
         xDDtZjWVnbiY7m2V9c57BSpuxOH9RRnO+Swl3dZ/f39AL34L0sLDdPREL0UgNvwcwQsX
         kqD1aweZ5xgZ/EW5lVbXq3bpVCCSbMVb2uUvxUUaeMU1EuyNklFa6JRUfVWxVXFt7w67
         5mLDBDVUspOFyQDMcArNfBC/568nUWicok+mI4yJjfnrjeuQczzHbx+XKmQN7fU9C80J
         cueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929087; x=1788533887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+G8BuKyr4mNyS/k4RzS4KN1oeGSViDq6yduxoa5BN8=;
        b=Me7eqaiY6yYdn6W4epDZc/IiV/8fX3I/m9LuC6BMGpixj4TvF0qLKWiqFG9l504HKb
         lfZMqIc0PiR1zau2usSNywDH6zoJiby2AP+LngL8PnDZmMAI8qBi+jPVddUKQriZ1xG0
         fedma0fvbYVWTFo3eSSlGE1tXsXAErbIZR8OQmIsteL/AspbufQ1lMsTvV2eJpe+mqqq
         CGi5mpQqRBsD+0cQxot2UhLb3WPYqeWqdbi5KLvegorhOhGGtcU2B8AAbUzxaCo7ha1E
         /BmaIG7l2AoX7sY0HfF8ZSNxnANfpgsCWtQguJJxoUWOJgrDmndsBXSkZCPZGxfAY5Sa
         9DYA==
X-Forwarded-Encrypted: i=1; AHgh+Rqw4RCIoqolrgKRnJAf4308XqfUkxaExq8Ka16YqmzWMPzF+TzOqtBYzjkYMl5pfMeiAfOp6LYn/6ytiP4=@vger.kernel.org
X-Gm-Message-State: AFuF++kS3N48YvTIV36TLnX1/MpgzdnqY6QuN19jQZNmT3+LH0PvCoMo
	XTA7Xhwot8jYQH4snHX4D6mC8eRIEc4neI+9NvhPGOEV7FdMVWuCT0A=
X-Gm-Gg: AR+sD10LI6gWi/GnxEqhjuuYzAIPbX97NH+WTrcNfUs3hwie3jaIEDEFiAyLd+poeyk
	bCx0jkpCTgO+QoJMNU10iUAqQxT/i5idekNr8Hckp3TJLfPuyy/hmWL6MLj8/xzwaJ4iGIEXNks
	wP/qnB4xRnByS7egJpV9qJEnuUFccfIqlXIwT6gXMgsYvkbx3ej/pp11IoXM0nC33tU82x2cTIJ
	mEOv0b2FVY43J3OZaIdBUYN04iwlU0ZhO22JbxuUFVr/H+eqCqQLUp8CQoYeoiK+O5rGgnYtWts
	OsOeAqQNt+zp1HG1qvCOi8IrRfmGAX83jTTFzxM3UepCNSQJ62ongnBeNlIZZQPwG3A3ZsE6IjN
	JIlkJFP1h17kW8kL4FG0usKC9wMVtOiRRHTJ30jddj1qFDz/KDQbYiVFqLBgqYq8MPJqyY6o7Cf
	Wyjc5xrRNAtfhpV++RcjnPkCy8HafHvrDBuWxb7XMLrioUERgsDaQ2NfJN3CxtVGOhmPH2nU72X
	K2h/MRbNM/EFoW4vwXAcnZ50ny2ew2SF7EP/g==
X-Received: by 2002:a17:903:3d06:b0:2d8:d4cc:5baf with SMTP id d9443c01a7336-2d8d4cc5dcemr8450155ad.15.1787929087521;
        Fri, 28 Aug 2026 07:58:07 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b6fcsm6159625ad.56.2026.08.28.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:58:06 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
Subject: [PATCH v1 1/2] drm/sched: cache the timeline name to fix a use-after-free
Date: Fri, 28 Aug 2026 23:57:56 +0900
Message-ID: <b191f55e53492f95d965407f891fd93b0e74958d.1787928528.git.malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787928528.git.malhyuk97@gmail.com>
References: <cover.1787928528.git.malhyuk97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fence_get_timeline_name() returns fence->sched->name, and the
drm_sched_fence ops keep a .release callback, so the fence is not
ops-detached on signalling (dma_fence_signal_timestamp_locked() only
clears ->ops for fences without .release/.wait). The callback therefore
stays reachable on a long-signalled, userspace-held finished fence and
unconditionally dereferences fence->sched.

A driver that allocates a drm_gpu_scheduler at per-context/per-queue/
per-VM granularity and frees it on an unprivileged context/fd close, while
exporting the resulting finished fence to userspace (drm_syncobj /
sync_file / dma_resv), leaves fence->sched dangling after the free. A
subsequent SYNC_IOC_FILE_INFO ioctl (which calls get_timeline_name())
then reads the freed scheduler:

  BUG: KASAN: slab-use-after-free in drm_sched_fence_get_timeline_name

This is the same class as CVE-2025-38703 (drm/xe) and CVE-2025-71302
(drm/panthor), which were fixed per-driver. amdxdna, nouveau and msm
(VM_BIND) are still affected in mainline, so fix it in the core to cover
any per-context-scheduler driver at once.

Scheduler names are persistent strings (string literals passed to
drm_sched_init()), so cache the name pointer in the fence at init time,
while the scheduler is guaranteed alive, and return the cached value from
get_timeline_name() without dereferencing fence->sched.

Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 16 +++++++++++++++-
 include/drm/gpu_scheduler.h             | 11 +++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 85ee3d694dc9..280a2d036ffd 100644
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
 
 	fence->sched = container_of(entity->rq, typeof(*fence->sched), rq);
+	/*
+	 * Cache the scheduler's timeline name: the finished fence may be
+	 * exported to userspace and outlive @sched (per-context schedulers
+	 * are freed on context teardown), so get_timeline_name() must not
+	 * dereference @sched. Scheduler names are persistent (string
+	 * literals passed to drm_sched_init()).
+	 */
+	fence->sched_name = fence->sched->name;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d61c19e78182..4f780d70acb6 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -305,6 +305,17 @@ struct drm_sched_fence {
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
-- 
2.43.0

