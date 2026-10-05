Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2432F6577
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230340; cv=none; b=Xe0gCjTipRMX3T9J9wmEK24ygLEbpFaAnrl3Q1ag0h3vfizIoSD6jjfhObkpg/MqStgCOCdaO3SsyjrhsdnhtG4aXPa8yjMQXVwsHJV4OvfMJeuUDgTOkPeN2Osg89EjqRak+PKgnR+3Au+QVRbZm8QrqgH0n44jrYwp5PkH6bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230340; c=relaxed/simple;
	bh=cW+/tOV0i2+XyS8EFCN4YnFudTM884Jy3bZ7qYfOqrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LXjeYVfXizXVSy2yG3DG4e5H2yJHui659EQskCmskiEq3d7Z/NHuZzbZUhZdSQ80Ptfkr4WnewVxJRKyzfpGXBtzqxS0eSShxyv5zsTzIkw3HfJre4IBYJtxMkFPyPmzWBn16tkYr6ttFwgf3fzmiV1P51jhhFqPa7thdFAnfBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iUFtA1hJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iUFtA1hJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791230330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qkAznBj0YywD0+o+tAJxW26YenTQuqhgBWYuJ8S0ThE=;
	b=iUFtA1hJvos+9nUkr+IvSH8D/iIllCplL3gGbRlZFL59EFXwa/r21YLxJqhJXxum8mYFFP
	pU8lCzKogEQIpp/mSk/4t65EAkCW0ZCza5HGNCAy7IPHe5iEN0KeY4PgqhfR1EhnVZL9Ak
	CpwD+CXihCeeT3QEkyEUH4OeDHPT3sc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-hHboCxL-Oy-_cKgR77Oxig-1; Mon,
 05 Oct 2026 15:58:46 -0400
X-MC-Unique: hHboCxL-Oy-_cKgR77Oxig-1
X-Mimecast-MFC-AGG-ID: hHboCxL-Oy-_cKgR77Oxig_1791230325
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 900CF195395C;
	Mon,  5 Oct 2026 19:58:44 +0000 (UTC)
Received: from ashelat-thinkpadp1gen5.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 68EC73001D2F;
	Mon,  5 Oct 2026 19:58:42 +0000 (UTC)
From: Anubhav Shelat <ashelat@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Anubhav Shelat <ashelat@redhat.com>
Subject: [PATCH v2] drm/i915/pmu: convert i915_pmu->lock to raw_spinlock_t from spinlock_t
Date: Mon,  5 Oct 2026 15:56:58 -0400
Message-ID: <20261005195658.732657-2-ashelat@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

When perf runs event operations, it calls event_function() which takes a
raw_spinlock_t. This can eventually lead to i915_pmu_enable() taking a
spinlock_t, which causes lockdep to throw "Bug: Invalid wait context".
The call chain:

 event_function()
    __perf_ctx_lock()
      raw_spin_lock(&ctx->lock)
    __perf_event_enable()                     // efs->func()
      ctx_resched()
        perf_event_sched_in()
          ctx_sched_in()
            __pmu_ctx_sched_in()
              merge_sched_in()
                group_sched_in()
                  event_sched_in()
                    event->pmu->add()         // = i915_pmu_event_add()
                      i915_pmu_event_start()
                        i915_pmu_enable()
                          spin_lock_irqsave(&pmu->lock)

On systems running an RT kernel, spinlock_t can sleep which can cause a
sleep-in-atomic error.

Fix this by using raw_spinlock_t for i915_pmu->lock instead of
spinlock_t. As a result, in i915_pmu_gt_parked(), we need to call and
store the return value of get_rc6(), because its call chain will take
a spinlock_t. This requires modifying park_rc6() to include it as an
argument.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Anubhav Shelat <ashelat@redhat.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 31 +++++++++++++++++--------------
 drivers/gpu/drm/i915/i915_pmu.h |  2 +-
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 1c3bafda9c70..31630e8f80c7 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -232,7 +232,7 @@ static u64 get_rc6(struct intel_gt *gt)
 		intel_gt_pm_put_async(gt, wakeref);
 	}
 
-	spin_lock_irqsave(&pmu->lock, flags);
+	raw_spin_lock_irqsave(&pmu->lock, flags);
 
 	if (wakeref) {
 		store_sample(pmu, gt_id, __I915_SAMPLE_RC6, val);
@@ -253,7 +253,7 @@ static u64 get_rc6(struct intel_gt *gt)
 	else
 		store_sample(pmu, gt_id, __I915_SAMPLE_RC6_LAST_REPORTED, val);
 
-	spin_unlock_irqrestore(&pmu->lock, flags);
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 
 	return val;
 }
@@ -278,11 +278,11 @@ static void init_rc6(struct i915_pmu *pmu)
 	}
 }
 
-static void park_rc6(struct intel_gt *gt)
+static void park_rc6(struct intel_gt *gt, u64 val)
 {
 	struct i915_pmu *pmu = &gt->i915->pmu;
 
-	store_sample(pmu, gt->info.id, __I915_SAMPLE_RC6, __get_rc6(gt));
+	store_sample(pmu, gt->info.id, __I915_SAMPLE_RC6, val);
 	pmu->sleep_last[gt->info.id] = ktime_get_raw();
 }
 
@@ -300,13 +300,16 @@ static void __i915_pmu_maybe_start_timer(struct i915_pmu *pmu)
 void i915_pmu_gt_parked(struct intel_gt *gt)
 {
 	struct i915_pmu *pmu = &gt->i915->pmu;
+	u64 val;
 
 	if (!pmu->registered)
 		return;
 
-	spin_lock_irq(&pmu->lock);
+	val = __get_rc6(gt);
+
+	raw_spin_lock_irq(&pmu->lock);
 
-	park_rc6(gt);
+	park_rc6(gt, val);
 
 	/*
 	 * Signal sampling timer to stop if only engine events are enabled and
@@ -316,7 +319,7 @@ void i915_pmu_gt_parked(struct intel_gt *gt)
 	if (pmu->unparked == 0)
 		pmu->timer_enabled = false;
 
-	spin_unlock_irq(&pmu->lock);
+	raw_spin_unlock_irq(&pmu->lock);
 }
 
 void i915_pmu_gt_unparked(struct intel_gt *gt)
@@ -326,7 +329,7 @@ void i915_pmu_gt_unparked(struct intel_gt *gt)
 	if (!pmu->registered)
 		return;
 
-	spin_lock_irq(&pmu->lock);
+	raw_spin_lock_irq(&pmu->lock);
 
 	/*
 	 * Re-enable sampling timer when GPU goes active.
@@ -336,7 +339,7 @@ void i915_pmu_gt_unparked(struct intel_gt *gt)
 
 	pmu->unparked |= BIT(gt->info.id);
 
-	spin_unlock_irq(&pmu->lock);
+	raw_spin_unlock_irq(&pmu->lock);
 }
 
 static void
@@ -742,7 +745,7 @@ static void i915_pmu_enable(struct perf_event *event)
 	if (bit == -1)
 		goto update;
 
-	spin_lock_irqsave(&pmu->lock, flags);
+	raw_spin_lock_irqsave(&pmu->lock, flags);
 
 	/*
 	 * Update the bitmask of enabled events and increment
@@ -784,7 +787,7 @@ static void i915_pmu_enable(struct perf_event *event)
 		engine->pmu.enable_count[sample]++;
 	}
 
-	spin_unlock_irqrestore(&pmu->lock, flags);
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 
 update:
 	/*
@@ -805,7 +808,7 @@ static void i915_pmu_disable(struct perf_event *event)
 	if (bit == -1)
 		return;
 
-	spin_lock_irqsave(&pmu->lock, flags);
+	raw_spin_lock_irqsave(&pmu->lock, flags);
 
 	if (is_engine_event(event)) {
 		u8 sample = engine_event_sample(event);
@@ -838,7 +841,7 @@ static void i915_pmu_disable(struct perf_event *event)
 		pmu->timer_enabled &= pmu_needs_timer(pmu);
 	}
 
-	spin_unlock_irqrestore(&pmu->lock, flags);
+	raw_spin_unlock_irqrestore(&pmu->lock, flags);
 }
 
 static void i915_pmu_event_start(struct perf_event *event, int flags)
@@ -1156,7 +1159,7 @@ void i915_pmu_register(struct drm_i915_private *i915)
 	};
 	int ret = -ENOMEM;
 
-	spin_lock_init(&pmu->lock);
+	raw_spin_lock_init(&pmu->lock);
 	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	init_rc6(pmu);
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
index 5826cc81858c..52d4b602310a 100644
--- a/drivers/gpu/drm/i915/i915_pmu.h
+++ b/drivers/gpu/drm/i915/i915_pmu.h
@@ -71,7 +71,7 @@ struct i915_pmu {
 	/**
 	 * @lock: Lock protecting enable mask and ref count handling.
 	 */
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	/**
 	 * @unparked: GT unparked mask.
 	 */
-- 
2.55.0

