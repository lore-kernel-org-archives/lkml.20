Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C05834752D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789019147; cv=none; b=u7tK4f3xxz1VFAKCVXGdoqu8wwUmcAz3td/Vm1d482yY2SW1iLQBpyfdz+gwTRXlZ6++Z+6yQPrDAx+KzwJqmhaDbNM3ED5rWlHBaJnuu7nyWVfPNyH3D9KoBKuX0QNkHrDoXwZUocd/ro5vdRvuSQ9+B5qrXv4+mpt4r5MrCuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789019147; c=relaxed/simple;
	bh=GJTTzzjEY1AzRghI9Vjte79kZ9SO11+Ku75jPrFzl28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rkjafv2qAcTzqjAAut9b7pZ14NX0j5YTAAcmF+GWGeLJNrqjbnfdWUFOAl4DvWiz3gYRRvTJxbveoCXLG/4eToTC2+Sp627jAs5EkERrTKqxOBp3oJTbqQsEhhub+5GiUGx/yWN2LRmELGyncVynd58dJMqSXUg1AG5hlJVnjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjSImmhR; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjSImmhR"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398b3d66515so6853636a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789019145; x=1789623945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TorC7V36k30jSb5TWYgDiKQ9Uk9U0ujF5LpdwA3W0Vc=;
        b=rjSImmhRDfxOCr8SsZR/2H9OVdgXafyc2t4U7OTrzJH8Uo6oRSaLtPVHx+3nw4URDx
         cq/ATEiff9pxgJl2egFb5aC1zpt7ag34h8Qj6cSAKgCk3Y0MR1IZTxQ9HFyhJXKl8N6r
         6sCRa9Lc7KQBwhLWWr3gN08DUSuvUm8jNFgI+4qbWpRpKi6SuPKcS53wZnobLiDG+4l8
         IvJmqD9IfaNfxGUqKo1njQema6u4KonK1oG2BeBWsGX7qFDmEK1xKQu7dtyEu9o/DG7X
         Ga4Y+tZQUXC8Oo/vPS2Ir5jWqxVT/QroLZk0g20MTFiLNYS5u7kXG8eRumQxgSCTI64r
         A+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789019145; x=1789623945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TorC7V36k30jSb5TWYgDiKQ9Uk9U0ujF5LpdwA3W0Vc=;
        b=oTb375FsMzwH4j6rbAVn/8Wi95S9LYtj8TQb/tFqP0hHK24yzpIkFxhsJflzHFrF0o
         iHtqXyJt9VvIPKripOat2Z+HTkqLrKLQ48MWaDbsGXhByX46jCXpQCkioE3RyFAQlUqM
         YLnyKxdfrCW40jFyO6ms2qvjGuccoymIUKejpXotwKFqd1+YhV3RS0kLYvBf3dTpikyM
         4FoWBYsz+slhsV0z/hqG9MU5AvfTCMH9G/Gi8PR9n4jDP1w6ule0rOHqIaRqfB701ynR
         WoDSaedqTn7lholnXwrld16Ks6dQMHG654xZHKY8v53VqLZ4J9iMyxcrPPrrRDvPup4Z
         Iygg==
X-Forwarded-Encrypted: i=1; AKwUvBxac52owdX3pF3h/sw5s47wbh7s0AaxNLzdid8ciQK8FCH1CiB06Z7dAa353FN5dzmqWD+SQlbobyqNUqw=@vger.kernel.org
X-Gm-Message-State: AFuF++lk1ZssY70K1ICrwU+F2mX3kCGjs/G9PECGl9aHOFIhl5nVxkxV
	eTolgSzW0M7ZW0Yxm7l4CL3WBS1vihj6yBaIZR6nEUhqjJY2fJn9qmM=
X-Gm-Gg: AYBFou3qFcGa4M6n7lRaQW9O5EsVmjmCCLoHhHUYuBjPBj7Q7RajiTUQ8aE7AG+53xO
	XcGTPZmsWH7GRO5BWAQY/OP9bxoyXaQaXTXVuSvj5NtHTrQcuOhzaIQU1Sf/4gWV5gHxStIaXDc
	jCqHteCgszeme19xuBLPMIqrP/7Vczy5kniNKBYqN1baqsIPQV+Gm24WgW5HXIMwZyc/xBVGRez
	0asZnxiOsAQsCUFVmqljneQ7cUFIg6goXjsuMqcP5LpTtov8CdHTwuYMhQqI+ramjlkLcpyULfS
	J8fJ/5d8x6pptWsrmHFimEMKvmz+whjbXgLEbfb14fan4pg7LNqg99eTzEutM5o+UqzfL+zHYsn
	0e+WWRgM6Dk8aqeqlMLTEI2wBP9JNXskBwcvew8R5po2Cv+RIx4s8ZAXhaDztx+vyfsq4waVOHO
	QpFGmcMgvm1uU74NF2Rwh9XOtX+u5Hon5cjJV2XQU9YU7ylr8aJnC8asvMTc5izw+vY0RYErJ9P
	1Daa/NlzBSktvMoKy5OAMgVf98FmsIAhv03
X-Received: by 2002:a17:90b:2781:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39b26289136mr62814945a91.22.1789019145273;
        Wed, 09 Sep 2026 22:45:45 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7740383asm3531936a91.7.2026.09.09.22.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:45:44 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v2] drm/sched: Drop the unused entity argument from drm_sched_fence_alloc()
Date: Thu, 10 Sep 2026 14:45:37 +0900
Message-ID: <20260910054537.633952-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit dbe48d030b28 ("drm/sched: Split drm_sched_job_init") the only
use of the entity argument of drm_sched_fence_alloc(), fence->sched =
entity->rq->sched, moved into drm_sched_fence_init(), and the now unused
argument was left behind.

Drop the argument. The sole caller still passes the entity to
drm_sched_fence_init() at arm time, so behavior is unchanged. This also
removes the parameter-name mismatch between the declaration (s_entity)
and the definition (entity).

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Assisted-by: Claude:claude-fable-5
---
Resent: the original reached lkml but not dri-devel/amd-gfx - I was not
subscribed at the time. Apologies to those seeing it twice.

Targets drm-misc-next. No functional change; compile-tested with W=1.

v2: trim the first paragraph, which read as if the patch addressed a bug
    when it only removes an unused argument (Philipp Stanner). Capitalize
    the subject to match the subtree.
Link to v1: https://lore.kernel.org/dri-devel/20260909005112.278538-1-donggeunyoo.kernel@gmail.com/

 drivers/gpu/drm/scheduler/sched_fence.c    | 3 +--
 drivers/gpu/drm/scheduler/sched_internal.h | 3 +--
 drivers/gpu/drm/scheduler/sched_main.c     | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 096fe28aa9c9..b7a4cb921234 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -205,8 +205,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 }
 EXPORT_SYMBOL(to_drm_sched_fence);
 
-struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
-					      void *owner,
+struct drm_sched_fence *drm_sched_fence_alloc(void *owner,
 					      u64 drm_client_id)
 {
 	struct drm_sched_fence *fence = NULL;
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index a901801fce85..32d3ddb820be 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -58,8 +58,7 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
 void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
 
-struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *s_entity,
-					      void *owner, u64 drm_client_id);
+struct drm_sched_fence *drm_sched_fence_alloc(void *owner, u64 drm_client_id);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity);
 void drm_sched_fence_free(struct drm_sched_fence *fence);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6cb6f9546493..e4835b99ca60 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -612,7 +612,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	job->entity = entity;
 	job->credits = credits;
-	job->s_fence = drm_sched_fence_alloc(entity, owner, drm_client_id);
+	job->s_fence = drm_sched_fence_alloc(owner, drm_client_id);
 	if (!job->s_fence)
 		return -ENOMEM;
 
-- 
2.53.0

