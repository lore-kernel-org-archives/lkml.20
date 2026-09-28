Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF74EF12A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623439; cv=none; b=a08LUt62XjTxmTEk7qc9Pm5XJD6Ocyb4RaKX3q6+8xJ3d5hJSG5L4QH/JqWVAZIOFSmv3mACVuyDXGgsIVz5/4fWAtW+dorCkzZ4bwxISD1jwiGEy0UeLr4woz5qxYYO+zL7sj/X773hSDK7UDHQ5xi133+wJJ+ijZ4zZpbzwUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623439; c=relaxed/simple;
	bh=v0aFgccNjOyOr3qsZwzEbQcaCjEUqedeztC73k9zKic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WbIcOjibwSEd0vK4lA9t+QjY3mShpk9lKPzS5LJXJiPbCaKQ2DhEdCoIObnsNAQ7JLctrv9D7q/VMhTy6nQDSgAscN2E7ddn468PxUu0q4oDLI6hZ31lIqQkDiejuOINnWVfWh7GdVifVqCS7JUsocfhABWym1zADeKMP8ZZqWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdA9P78Q; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdA9P78Q"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-494ab4d6128so1369897fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790623436; x=1791228236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90m4D/TpGSCtcBQnKW4O2iMu0JtOyx2FA0RhV3nyqiY=;
        b=cdA9P78QSbT6/z/KBNgfp4kenI9GgCsOUyZGWsE09gsxBsKqtWa7hPVrWvloGMwICz
         /hnUij1qmhSZjw13L6SJvgE+c3Vb7Of7snAl/2Ntb2ZIzCcmsOvx5Vm3lLQRWoU43Rxf
         7xs9SafO3bPbcAM1mDJnYVZ532sZ8ZOzh76d4rdmIjwAOhyJndmxaCWAjeMcWgiHEpTI
         YE5Fzu35Iw33DKQL82/iaClo9H/69GsWAk/c8HzafY0DnFwatmBZHXA/1a27qY8U2p3B
         sfLnTagW2SkXBLr4PdLkeR133pnXrHYCm7qF6IuW00/F9sSXCCrGVV85ieX4d2CX2/qe
         y8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623436; x=1791228236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=90m4D/TpGSCtcBQnKW4O2iMu0JtOyx2FA0RhV3nyqiY=;
        b=LJBgunRkAT9G7AwJnqj+mB128io6VG5UQqmdwnuORWSrMygXGIRlzduI28WqemvT3X
         MNJkgBmEG3/7eyPdeE6jY2x05vfZrlDDCEWFnYbdQ2O+2kymOR6I/UxIKLcOaq4PVYnZ
         ItzjZNM1bK4Rv61vQGSrpcU0cOaFUj92XjnD+4mbJg1hq3si9GWK0t7VJvXnEXME61XB
         X71DNfbbUEBXdYFX25ln1/FKeixlLbobBk0HAvgzYTmjKwFeN+x6UWuknxeWIiS3qKZ0
         WMndRvGxkhM8xE3HZLRLmoYPIHl39uKXOTTMltf4gYQf2qxh/By1E+pMXfrbWt77sfYv
         Z7WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqB0N8Q101KvX6uvEokZKAZ5F73CnrQxfwP5mj+fue+BLSA7svqmZ2aiprWUb9Wm0TfFb/MKl9LSqxGdw=@vger.kernel.org
X-Gm-Message-State: AFuF++n86MOz9VvojeGvnUlzo0I/7qMDQv7hVSjOFGBSGxL1EyMwy/VX
	wmJ0tjC1KJ7aGZB2YDBZGBprQbr5/0xfXhrKsoDbCJWY6vK+ocOTpWtD
X-Gm-Gg: AYBFou2yUV7JrjWjNq/Af1GxqR7pRi7etEBkx61FfXthwrIqRmUJQUfaH7NHlM//vC3
	z+7NOU+CB4K2/Ve4fKnfZnEnvaL7vLXyOmvZlU8yleuq0ixdF/PAcEnv271HYRoOdBYJD74t4yC
	rOPu+owl4gEUOC2WGNEIMf6l6Qs0Czv+uG4ytDOekyPJdRyBhGaMSp8Gufv6T9dwr+CdFCvZ8Gj
	8s+0Kwmj5qfy34XBMyjFCB0sLuRKyiNTGsp2xvFLZlMx7jzE++w4UV8GIOj7L2v+mFTc3VyGIdH
	hNKW1Sl1yN9ZVJTRpLr8FNLFK7Y4PSNIYSBtqDNzL+Tmrd+Z6qdUe0nV4uxAI918Rlw8W9HEqAV
	1VSSwndNVz0FlYspkOVe06cCjztTPKcUut09nfTccf1We8ud5OeD7eB8smKnAwTIg2h+EAEsQLD
	XKCLC5yv2WLqQ/YeaOvw5T2gRCcXjGiFZWtKJRinbi2Vb8vTABYJPt/u/PPG5H3dzo70+HPP2Nn
	Jx6YEYEyIcLINujLIaJeqyNhSNwxw==
X-Received: by 2002:a05:6808:aaa:b0:4e6:1356:c72e with SMTP id 5614622812f47-4e61356ccc2mr4802789b6e.51.1790623436516;
        Mon, 28 Sep 2026 12:23:56 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:45::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbd25cf71sm2396331b6e.16.2026.09.28.12.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:23:56 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v6 RESEND 5/5] mm/memcontrol: add stock to the memsw page counter
Date: Mon, 28 Sep 2026 12:23:48 -0700
Message-ID: <20260928192349.3432886-6-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928192349.3432886-1-joshua.hahnjy@gmail.com>
References: <20260928192349.3432886-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attach legacy memsw page counters to their own seven-slot per-CPU
stock. Charge, refill, drain, and hotplug handling now operate on the
memory and memsw banks independently.

Factor the common drain scheduling into schedule_stock_drain() now
that both stocks use it.

Keep the existing direct memsw rollback when the memory charge fails,
ensuring that failed allocations do not replenish the newly
attached memsw stock.

The separate banks can hit, contend, evict, and drain independently,
so their raw counters can temporarily drift by their cached amounts.
The previous patch preserves the user-visible cgroup-v1 invariant by
reporting memory.memsw.usage_in_bytes as the larger raw value.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 62 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index e666572a7c7cb..6cae2d84f37c0 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2070,6 +2070,13 @@ static DEFINE_PER_CPU_ALIGNED(struct page_counter_stock_pcp, memory_stock) = {
 	.base = &memory_stock,
 };
 
+#ifdef CONFIG_MEMCG_V1
+static DEFINE_PER_CPU_ALIGNED(struct page_counter_stock_pcp, memsw_stock) = {
+	.lock = INIT_LOCAL_TRYLOCK(lock),
+	.base = &memsw_stock,
+};
+#endif
+
 /*
  * NR_OBJ_STOCK is sized so the entire hot path of obj_stock_pcp
  * (lock, accounting metadata, nr_bytes[] and cached[]) fits within a
@@ -2174,12 +2181,30 @@ static bool schedule_drain_work(int cpu, struct work_struct *work)
 	return true;
 }
 
+static void schedule_stock_drain(struct page_counter_stock_pcp __percpu *stock,
+				 struct cgroup_subsys_state *root_css,
+				 int cpu, int curcpu)
+{
+	struct page_counter_stock_pcp *pcp_stock = per_cpu_ptr(stock, cpu);
+
+	if (test_bit(FLUSHING_CACHED_CHARGE, &pcp_stock->flags) ||
+	    !page_counter_stock_flush_required(pcp_stock, root_css) ||
+	    test_and_set_bit(FLUSHING_CACHED_CHARGE, &pcp_stock->flags))
+		return;
+
+	if (cpu == curcpu)
+		drain_local_stock(&pcp_stock->work);
+	else if (!schedule_drain_work(cpu, &pcp_stock->work))
+		clear_bit(FLUSHING_CACHED_CHARGE, &pcp_stock->flags);
+}
+
 /*
  * Drains all per-CPU charge caches for given root_memcg resp. subtree
  * of the hierarchy under it.
  */
 void drain_all_stock(struct mem_cgroup *root_memcg)
 {
+	struct cgroup_subsys_state *root_css = &root_memcg->css;
 	int cpu, curcpu;
 
 	/* If someone's already draining, avoid adding running more workers. */
@@ -2194,21 +2219,13 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 	migrate_disable();
 	curcpu = smp_processor_id();
 	for_each_online_cpu(cpu) {
-		struct page_counter_stock_pcp *memory_st =
-			per_cpu_ptr(&memory_stock, cpu);
 		struct obj_stock_pcp *obj_st = &per_cpu(obj_stock, cpu);
 
-		if (!test_bit(FLUSHING_CACHED_CHARGE, &memory_st->flags) &&
-		    page_counter_stock_flush_required(memory_st,
-						      &root_memcg->css) &&
-		    !test_and_set_bit(FLUSHING_CACHED_CHARGE,
-				      &memory_st->flags)) {
-			if (cpu == curcpu)
-				drain_local_stock(&memory_st->work);
-			else if (!schedule_drain_work(cpu, &memory_st->work))
-				clear_bit(FLUSHING_CACHED_CHARGE,
-					  &memory_st->flags);
-		}
+		schedule_stock_drain(&memory_stock, root_css, cpu, curcpu);
+#ifdef CONFIG_MEMCG_V1
+		if (do_memsw_account())
+			schedule_stock_drain(&memsw_stock, root_css, cpu, curcpu);
+#endif
 
 		if (!test_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags) &&
 		    obj_stock_flush_required(obj_st, root_memcg) &&
@@ -2235,6 +2252,11 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
 	stock = per_cpu_ptr(&memory_stock, cpu);
 	page_counter_drain_stock_fully(stock);
 	clear_bit(FLUSHING_CACHED_CHARGE, &stock->flags);
+#ifdef CONFIG_MEMCG_V1
+	stock = per_cpu_ptr(&memsw_stock, cpu);
+	page_counter_drain_stock_fully(stock);
+	clear_bit(FLUSHING_CACHED_CHARGE, &stock->flags);
+#endif
 
 	/*
 	 * A drain work queued before the CPU went away is executed by an
@@ -2538,8 +2560,8 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 retry:
 	reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
 	if (do_memsw_account() &&
-	    !page_counter_try_charge(&memcg->memsw, nr_pages, &counter, false,
-				     NULL)) {
+	    !page_counter_try_charge(&memcg->memsw, nr_pages, &counter,
+				     may_batch, NULL)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
 		goto reclaim;
@@ -3018,7 +3040,7 @@ static void obj_cgroup_uncharge_pages(struct obj_cgroup *objcg,
 	if (!mem_cgroup_is_root(memcg)) {
 		page_counter_refill_stock(&memcg->memory, nr_pages);
 		if (do_memsw_account())
-			page_counter_uncharge(&memcg->memsw, nr_pages);
+			page_counter_refill_stock(&memcg->memsw, nr_pages);
 	}
 
 	css_put(&memcg->css);
@@ -4170,6 +4192,10 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
 		memcg->memory.stock_css = &memcg->css;
 		page_counter_init(&memcg->swap, &parent->swap, false);
 #ifdef CONFIG_MEMCG_V1
+		if (!memcg_on_dfl) {
+			memcg->memsw.stock = &memsw_stock;
+			memcg->memsw.stock_css = &memcg->css;
+		}
 		WRITE_ONCE(memcg->swappiness, mem_cgroup_swappiness(parent));
 		memcg->memory.track_failcnt = !memcg_on_dfl;
 		memcg->memsw.track_failcnt = !memcg_on_dfl;
@@ -5798,6 +5824,10 @@ int __init mem_cgroup_init(void)
 	for_each_possible_cpu(cpu) {
 		INIT_WORK(&per_cpu_ptr(&memory_stock, cpu)->work,
 			  drain_local_stock);
+#ifdef CONFIG_MEMCG_V1
+		INIT_WORK(&per_cpu_ptr(&memsw_stock, cpu)->work,
+			  drain_local_stock);
+#endif
 		INIT_WORK(&per_cpu_ptr(&obj_stock, cpu)->work,
 			  drain_local_obj_stock);
 	}
-- 
2.53.0-Meta

