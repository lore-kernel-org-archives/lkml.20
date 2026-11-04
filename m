Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835039;
	b=Z+WZV21tZVsecagSwR7DZQh8c46gDwpTrG6djhwAnCmyGT7NcgVqczUPRJcAj1PWE0LX
	 ylMQdG2N0TYCTBqve7FieAd7zfgAHtMnxXvAufGXiaiIgo69iSpCaS7P6vUSFCoXy3e9G
	 ZH1VgP4bYHazNAHaASHWWZI73i9SeGZc6yBuNwfY3am2pTmtcJWAx87oci8LXGRw+WjK4
	 UMvpBHwkmH0LErlGvG8THxkQ8PU34X2/dU42gJMztlTxM045hIdZDVU+etX3U2UF/X8wT
	 zThXT0fYyNP8XJJud/M5vx+DYkxWTw1tYO1gnhDjwRQjG5OVqlhUajWjARxLTl/5DVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hn/N6JyJM+zFqKp8YocwwBTkzd8kLSS3qrHaopPl4Mo=;
	b=Sp+LDOH2tLRC53OhdJoVXDvaru/4NthpbKdy1yNOUNNpaN2wepLho5XfVOqvNMZzYxBA
	 jhBZ8UVONP2f9qCoia6HJeqJt47FCrIC26+zhVhB1eJc3rpkYwdU3ZtV00OUHVFu3asMV
	 XGJHYqs1MiMWB++BO1McQMFOLopAyOU5izvwr4j3Ax1JTkKiK1UstcVJhWLbp3o2zOStr
	 0kCDuCJRPDmokIG1o27Sy/XaaQ+pj7dI43Kx7XpShK9qZMQC8hSPocGoMqshYyUT9ceCU
	 jVvpe92/fDdARimAnPkWjpPLCNN6JJJuNoK830Aaridz5BZ6FWA29Fxupf/eGZGtnDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuzodLrx;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D9606EE8D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1D9606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuzodLrx
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b312be5de8so14770107b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835038; x=1794439838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hn/N6JyJM+zFqKp8YocwwBTkzd8kLSS3qrHaopPl4Mo=;
        b=DuzodLrxdMj+GfzWex6ritx8NxJzn0FR4MyaYCcMtLBdmngiL0QeVbe/Q89VB99WfL
         W6I1b7CBeZUK2I3HLMXTCKV7LFFOIBEd29X/K8FR0C9Zu/Dr4HceqcVdFORKoNgLaXwG
         XfvWjxJd9QURrf5faRB3OgJgXgL+ssqGEPd8vTXmkpTs8oZKrn1QUPzjtDYu8ONeWFE0
         EFl04lh24zxKu93Bq3x5C2FXViyNfXLUZZgaOALqxzB9SZFBQdF2FSYRZXBOCZsUgN9c
         YhCR1Sy0U28v8NzQH2Z+IOGzfPmOpbW8VZJ3aMtbiQjL6tdgLcSoookipuWHK3QebmIR
         BhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835038; x=1794439838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hn/N6JyJM+zFqKp8YocwwBTkzd8kLSS3qrHaopPl4Mo=;
        b=YEwy83teOPzV8jMywYaDuENRN59cpie92FzsFTqRqcWMnaJXuGgltrgJiZ/lR9rlXS
         iwuBKdbTyZnzPYlsqOeyYxf3JPVs/KqZXYcRhw6f1N3+tBqLwkyEAOISitC/wfOnpamB
         RmTQonVUs1XLr0r8UXPBH+n0XKH+WRHD1TzWsn2nyB/41li2M9kxYT4vTnOk3SVmLdBR
         civ781aP1wfTTLTJJk6r4GubPQax3i6GuPWim2EzcJ7fPD0okRSUI2qy/qZBAG+Ne4g3
         OR7pPFppRV+irvi+RwckAshEib1KhWIeqdmSHMAvZbk5TLFwVdfsu9I77+Efq2jBMQ1C
         kaBg==
X-Forwarded-Encrypted: i=1; AKwUvBw4uK3L1cgaIWXY9GRMhGKt4P9K3UHDj0kfuITMIvhIZORgUQ02/LpV6z35WLEgnHxvfuxUmN5bW9GCa7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ltGg6oXU/xKwfqCzE45nfgUrWcZtS+SLxiu4T8aVi5mGgNiVj
	fN1AgqX3e1n4kMzLi7bHPzDmbuJmIwnzQr9JSZn0gU6sbkFbPntvAG0N
X-Gm-Gg: AYBFou1UoD12NQwJrBkFM7aT5940lxibKd3bbrSST5b5Oj6nF4eWZsAoltCY1xDbZWa
	5XxnfbV2BuyZt5wzuSpw9ll3drgwooWtUo1AByAHxMC9aY3lTdbAC/VRbvvtB+e6psr6nxBh9wp
	RRBdv2bol/aU4zRf9qfQtzdi+jCUrxY1rcGAzGh5dNwBKp7TNb4hm/VR4+TjUbDChvfrzKz7bMc
	vt+swRUXc7C2Cq16fJiWO+FDBeD0NEwQpsDLwR+BtRH1YogjMTj3L3eGZu2LBlUp0EECnc/Wmlb
	eg+X6X7okJudSXp812fqnzlt0Y7vF8UQDQaXZY/u4ENA+vZjZMHnujnrEs12wCNb0JUYomv1LiS
	0SiGR+PQZ3KTtAy1by7r+SWsC85GF09o9Wnu+WcAeOW/tI0JShE08d5gv0OuqgIYP7hlvLBo4Qo
	QO1VQCp+kjYRvm9kgZv2o8iQ/qbmOg7iQNJ2xITfPOTWjztH8My/oGS0BD/FXiNgLDA6Enqo3RJ
	0bJ1+jOLCgpymun7aHXaLbZGIPlnebT9sa3cGEmuhzfmDjnavOOMzSTAVnFtfd+OmKX7lER7j/5
	ng7QxuvF821vuys6bZLcJg9QX751TibXST5OS5x/cd7OWwu8ris6yKq22143
X-Received: by 2002:a05:690c:ee:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b2b66eccf9mr87622347b3.20.1793835038019;
        Wed, 04 Nov 2026 15:30:38 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:72::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bd35c7sm29090667b3.44.2026.11.04.15.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:30:37 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Harry Yoo <harry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Maarten Lankhorst <dev@lankhorst.se>,
	Maxime Ripard <mripard@kernel.org>,
	Natalie Vock <nat@pixelcluster.dev>,
	Tejun Heo <tj@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v8 6/7] mm/memcontrol: add stock to the memsw page counter
Date: Wed,  4 Nov 2026 15:30:27 -0800
Message-ID: <20261104233029.3282438-7-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104233029.3282438-1-joshua.hahnjy@gmail.com>
References: <20261104233029.3282438-1-joshua.hahnjy@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attach legacy memsw page counters to their own seven-slot per-CPU
stock. Charge, refill, drain, and hotplug handling now operate on the
memory and memsw banks independently.

Factor the common drain scheduling into schedule_stock_drain() now
that both stocks use it.

If the memory charge fails, roll back only nr_pages from memsw. Any
batch surplus the memsw charge already placed in the memsw stock
stays cached, like any other stock slot.

The separate banks can hit, contend, evict, and drain independently,
so their raw counters can temporarily drift by their cached amounts.
The previous patch preserves the user-visible cgroup-v1
memory <= memory + swap invariant by reporting memory.usage_in_bytes
as the smaller raw value.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/memcontrol.c | 64 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index d03d64969548d..aac987ebaab6f 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2057,6 +2057,13 @@ static DEFINE_PER_CPU_ALIGNED(struct page_counter_stock_pcp, memory_stock) = {
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
@@ -2161,12 +2168,30 @@ static bool schedule_drain_work(int cpu, struct work_struct *work)
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
@@ -2181,21 +2206,13 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
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
@@ -2221,6 +2238,9 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
 	/* no need for the local lock */
 	drain_obj_stock(obj_st);
 	page_counter_drain_stock_fully(memory_st);
+#ifdef CONFIG_MEMCG_V1
+	page_counter_drain_stock_fully(per_cpu_ptr(&memsw_stock, cpu));
+#endif
 
 	/*
 	 * A drain work queued before the CPU went away is executed by an
@@ -2229,6 +2249,10 @@ static int memcg_hotplug_cpu_dead(unsigned int cpu)
 	 * the CPU comes back online.
 	 */
 	clear_bit(FLUSHING_CACHED_CHARGE, &memory_st->flags);
+#ifdef CONFIG_MEMCG_V1
+	clear_bit(FLUSHING_CACHED_CHARGE,
+		  &per_cpu_ptr(&memsw_stock, cpu)->flags);
+#endif
 	clear_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags);
 
 	return 0;
@@ -2614,8 +2638,8 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 
 retry:
 	if (do_memsw_account() &&
-	    !page_counter_try_charge(&memcg->memsw, nr_pages, &counter, false,
-				     NULL)) {
+	    !page_counter_try_charge(&memcg->memsw, nr_pages, &counter,
+				     may_batch, NULL)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		goto reclaim;
 	}
@@ -3046,7 +3070,7 @@ static void obj_cgroup_uncharge_pages(struct obj_cgroup *objcg,
 	if (!mem_cgroup_is_root(memcg)) {
 		page_counter_refill_stock(&memcg->memory, nr_pages);
 		if (do_memsw_account())
-			page_counter_uncharge(&memcg->memsw, nr_pages);
+			page_counter_refill_stock(&memcg->memsw, nr_pages);
 	}
 
 	css_put(&memcg->css);
@@ -4198,6 +4222,10 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
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
@@ -5823,6 +5851,10 @@ int __init mem_cgroup_init(void)
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

