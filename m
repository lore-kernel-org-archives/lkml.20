Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E634A3850
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194282; cv=none; b=IUVDKWjnGIxn3k6YF25WuJGXFogqU7OPwfgEy6xt6egedHEuJV9vZYZcqjVZw5KHyox7Jg+FeSUIvKsVcvn/zHVfbARN/xxEoa7mzJiF8qv8SVBc2GVN4DApxVbBSN+tgjjqvFr0y7OMfh3ZcjE1yadiFxOdnghRL+Y3CjtR2w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194282; c=relaxed/simple;
	bh=GGcdgcidJRK4f6nVOmkrYxscF0UoppYT966YKJwy27I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjqMvYRmXTH2Hyk192NKTFYu6mI9jCATTfPC4PNf8f8YcTYuuX+F+Sb3mSjVM5g4K2F2pO6AxV4F3SQ4t/8d32IaTWHNSSMKQ5S4HY33zfLSGsp+1F2s0zsdv4USwo0sriRkoBFkYpVsS1LbVtdBKt8StRdo+IKM1bcHMKmGg5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXxPixKM; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXxPixKM"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f4e729368fso3010946a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788194279; x=1788799079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZLPtkE4K+x7inkg5AOVUnb1Simer6GkDXLFxdMoHE0=;
        b=nXxPixKMBGtAS8SA87yCVSy8wlTGTGgLh3py9zTibbLgoySarv+kJOAdCWTx4Ow7UB
         zcBIi/6e7InTjykVKfp8k+oeooGm4iHaAxucVM5Z40vNnZrWimD+sDYdcFeoa1mBaBny
         RumlAz4lowAWmcHEHSOxySgN6cm6IlsdgfUK6w8YpeH/4vTSBvohATI+FtXJYioEh1e+
         iorkPyLZcMplD74VcGDyVJVdlnD6QCDX6t/h/Jfbe25kNTp0aYmnxOJ8tReUxsR/vAgM
         35ZPYGa+ppJ06hX0Tj4U6P2yPJlNTc8ltPc62dSW42RFYN50VhKH+ia/bSpP21PakcVs
         kC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194279; x=1788799079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZLPtkE4K+x7inkg5AOVUnb1Simer6GkDXLFxdMoHE0=;
        b=bxDjGMRfrrBkJQTyh95oc0b8FJW8Dbrdz/8xLIyr5pg3z3ou7ubPxRqbfB7zVO4q8K
         hF5YsI0ktGYNIYn/yKPfQUwnH0P/2OfuKMJwRbKBgOke6T1hy7WBiX1oG4o5WGS6FOE9
         PgxTiax1onrdG2YsQp2H92UwxUrOnM9Lya+Oa1t6rSo1sW7XV7tX6LqzlqjSe/OLxHec
         67Ca08vTtkU/a1UgytyS9/ysT5a5kJOy+GSxKsBGLqKFNheJsqESJcHPXhFIbrxWPdVh
         gFBPzh+odZPiswRSSYFeDqPkpRl8u3WAdRUCx1G24TiIDkH1TJYDSSTIsyskE3OuapxE
         HeBw==
X-Forwarded-Encrypted: i=1; AHgh+RpVk+83ZpjQqP0221+OlV552Utq3Rga+AWJisAJHMyfg/7QGtXFlv8XqxaZMkbb0AZdd/E9RimG+55I5tE=@vger.kernel.org
X-Gm-Message-State: AFuF++lOEqGwIg8FmAV837fFdgwabAKWXuzY2HV9KCkrcuUqGLu/+Wmr
	Y0i5FvUPW8f0pdN2LEHJH4++23blLYTktgC+GKRi41y3MvsyiNIsH4td
X-Gm-Gg: AR+sD138n+OD3wyyweQAb1AvQAKsTCs8lBmE2n0aItIJG5lZCz1n0oxXEs9ol/VwqjD
	pTv+9X/QkkBtNtnaNwCybO00+LzPwXHiSD8ci715tGfzH9LfH1sZ9AZngyv2IiU53vUdcWlezEF
	dUoZYPPkXxmyYIPg/IQiPaEtslqwYtO3j2BAoJNbqM3owQjPAw+CUCeEEbObNn6kQXQWRce3kHE
	dJIXFX/m9+H7XyGJHdRP8DJMP4xM0Qh4tFGB/K+Xoy216MZVItF1lKCUhdOdX2OaAyAZAl/Bj+a
	lJviQMPaljHoSM6Aq/UmgIZHfVl9u/yIid137dVSeTGEEzdCTJQaAKnbWpPGAqcNAjaikqzC7jF
	E3d1UU9mxMVyAuypSXFZvHa+Jx252QtQBxzQXwagECNJQGoSOmH0z8mRg2lpi5cO9irDa+6F7Uc
	rq21SBwh80yu+AzYT1sEr1frc1hbc/FLSHoPVY4LvWvkVzru69W9ToZWzYjGWXieLPijYyWuTh1
	ry2L/hBbskY9eShw8X7
X-Received: by 2002:a05:6820:4d02:b0:6b1:afc8:3162 with SMTP id 006d021491bc7-6b1c6642c52mr23408705eaf.7.1788194279553;
        Mon, 31 Aug 2026 09:37:59 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:2b::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-468a2fedbcasm10399867fac.2.2026.08.31.09.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:37:59 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org
Cc: roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	dev@lankhorst.se,
	mripard@kernel.org,
	nat@pixelcluster.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	osalvador@suse.de,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel-team@meta.com
Subject: [PATCH v5 5/7] mm/page_counter: introduce an asynchronous drainer
Date: Mon, 31 Aug 2026 09:37:49 -0700
Message-ID: <20260831163752.2193337-6-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831163752.2193337-1-joshua.hahnjy@gmail.com>
References: <20260831163752.2193337-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing percpu memcg stock drainer schedules a stock drain worker
per-cpu, one for every CPU containing the target memcg's stock.

One issue with this design is the coarseness of the drain; when a worker
runs on a CPU, it drains not only the target memcg's stock, but all
other (up to 6) memcgs who are stocked on that CPU.

Instead, use a per-page_counter drainer that iterates through each CPU
and flushes any existing charges, leaving other unrelated memcgs' stock
alone. Since that walks every possible CPU, the per-cpu helper now skips
the remote lock when a stock looks empty.

One benefit of having one worker flush through all CPUs is that
duplicate drain requests when a worker is already queued are coalesced,
since the asynchronous drainer takes no arguments and flushes all CPUs.

We use the system_dfl_wq for this asynchronous drain worker, since
memcg_wq is a percpu workqueue. Note that neither workqueue has
WQ_MEM_RECLAIM.

Previously the local CPU was drained inline because local_lock made it
the only reachable stock. The lock is now a per-cpu raw_spinlock_t that
any CPU can take, so drain any CPU's stock to return pages immediately.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 include/linux/page_counter.h |  1 +
 mm/page_counter.c            | 55 ++++++++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index 428ca8e7b2da5..b10ef785f06de 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -114,6 +114,7 @@ static inline void page_counter_reset_watermark(struct page_counter *counter)
 }
 
 void page_counter_drain_cpu_stock(struct page_counter *counter, int cpu);
+void page_counter_drain_stock_async(struct page_counter *counter);
 void page_counter_alloc_stock(struct page_counter *counter, unsigned long batch);
 void page_counter_free_stock(struct page_counter *counter);
 
diff --git a/mm/page_counter.c b/mm/page_counter.c
index a76949abf04e7..e6cfb5865ba75 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -12,6 +12,7 @@
 #include <linux/string.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
+#include <linux/workqueue.h>
 #include <linux/bug.h>
 #include <asm/page.h>
 
@@ -135,7 +136,7 @@ static bool page_counter_consume_stock(struct page_counter *counter,
 		return false;
 
 	if (pcp_stock->nr_pages >= nr_pages) {
-		pcp_stock->nr_pages -= nr_pages;
+		WRITE_ONCE(pcp_stock->nr_pages, pcp_stock->nr_pages - nr_pages);
 		charged = true;
 	}
 
@@ -183,10 +184,10 @@ unsigned long page_counter_refill_stock(struct page_counter *counter,
 	 */
 	stocked = pcp_stock->nr_pages + overage;
 	if (stocked > high) {
-		pcp_stock->nr_pages = low;
+		WRITE_ONCE(pcp_stock->nr_pages, low);
 		to_flush = stocked - low;
 	} else {
-		pcp_stock->nr_pages = stocked;
+		WRITE_ONCE(pcp_stock->nr_pages, stocked);
 		to_flush = 0;
 	}
 	raw_spin_unlock_irqrestore(&pcp_stock->lock, flags);
@@ -429,15 +430,53 @@ void page_counter_drain_cpu_stock(struct page_counter *counter, int cpu)
 		return;
 
 	pcp_stock = per_cpu_ptr(stock, cpu);
+
+	/*
+	 * Skip the remote lock when empty. Racing with the charge path is why
+	 * nr_pages uses WRITE_ONCE(); a stale read defers to the next drain.
+	 */
+	if (!READ_ONCE(pcp_stock->nr_pages))
+		return;
+
 	raw_spin_lock_irqsave(&pcp_stock->lock, flags);
 	nr_pages = pcp_stock->nr_pages;
-	pcp_stock->nr_pages = 0;
+	WRITE_ONCE(pcp_stock->nr_pages, 0);
 	raw_spin_unlock_irqrestore(&pcp_stock->lock, flags);
 
 	if (nr_pages)
 		page_counter_uncharge(counter, nr_pages);
 }
 
+static void page_counter_drain_work_fn(struct work_struct *work)
+{
+	struct page_counter *counter = container_of(work, struct page_counter,
+						    drain_work);
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		page_counter_drain_cpu_stock(counter, cpu);
+}
+
+/**
+ * page_counter_drain_stock_async - schedule a page_counter stock drain
+ * @counter: page_counter to drain
+ *
+ * Drains any CPU's stock inline, then schedules a drain over every CPU and
+ * returns. Concurrent requests coalesce onto the same queued work. @counter
+ * must outlive that work, which page_counter_free_stock() cancels.
+ * Must not be called from NMI context.
+ */
+void page_counter_drain_stock_async(struct page_counter *counter)
+{
+	/* Pairs with the smp_store_release() in page_counter_alloc_stock() */
+	if (!smp_load_acquire(&counter->stock))
+		return;
+
+	/* Drain any CPU's stock to immediately return pages; migrating is OK */
+	page_counter_drain_cpu_stock(counter, raw_smp_processor_id());
+	queue_work(system_dfl_wq, &counter->drain_work);
+}
+
 /**
  * page_counter_alloc_stock - allocate the percpu stock for a page_counter
  * @counter: counter to allocate percpu stock for
@@ -469,6 +508,7 @@ void page_counter_alloc_stock(struct page_counter *counter, unsigned long batch)
 	}
 
 	counter->batch = batch;
+	INIT_WORK(&counter->drain_work, page_counter_drain_work_fn);
 	/* Publish stock only after percpu allocs / inits are finished */
 	smp_store_release(&counter->stock, stock);
 }
@@ -477,8 +517,9 @@ void page_counter_alloc_stock(struct page_counter *counter, unsigned long batch)
  * page_counter_free_stock - free @counter's percpu cached charge
  * @counter: page_counter whose stock to free
  *
- * Caller must guarantee no (un)charge or drain of @counter is in flight or can
- * start. memcg only calls this once the cgroup is dead and unreachable.
+ * Caller must guarantee no (un)charge or drain of @counter can start, and must
+ * be ordered against the last CPU to touch the stock, since the drain peeks at
+ * nr_pages unlocked. memcg's RCU grace period before css_free provides both.
  */
 void page_counter_free_stock(struct page_counter *counter)
 {
@@ -490,6 +531,8 @@ void page_counter_free_stock(struct page_counter *counter)
 
 	/* Stop greedy over-charging before the stock goes away */
 	counter->batch = 0;
+	/* Make sure pending drainers don't run on freed page_counters */
+	cancel_work_sync(&counter->drain_work);
 	for_each_possible_cpu(cpu)
 		page_counter_drain_cpu_stock(counter, cpu);
 
-- 
2.53.0-Meta

