Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623322;
	b=WWppNkyZYp8JP1uS/f69oOGKVcY5y1BjztAI5eh3CVq6EaRVjcyvBVeq8NYNeTGxfSE9
	 /cI2rME2Lu2IUqU387pD18UIqK7+ZQlievrnJNRhs/Nrrrz/Ar5NthJ3b95Eg58l49MWE
	 T83sRhMF6Hu9hQcA9McN5TMnAVLkKYhM/VYorO4Zy4zeBUiqdACB46TeVr/8SyCDZp13I
	 mAfcr3oQlk6M70LUepB5U7sOa6tZQS9kmNNCWyijJ0Brz+1BOgxlU+AgfDcHQEJyXPGiH
	 puZY/pcSq7Lxqo/JP9ru8NpMkcNhnD+Z7eVy39FaqdMvrs7ksn3ze/+eyQ4cJutnpUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s4TFursOBUs7to8y4FWwAK3ge25kSxsoywm4OhWQZu4=;
	b=48gT/gRlsphXxpZZi9WLuiZdCCWT0ymsuPIVX0TC73eU+PQITypcGblPOKgA/WIo6Cus
	 6/BJWZ54QcYihET5gBl/GiFwVTSvkBD3bz8Vu0g3mcWHNVKjDw36uSQqdFQgR+UD7ejiO
	 nSTKadv2dPPDUvWfL/FRBVa/JN61qktzQImA6yVecHMzWlm74kDXZojBT85Oz9gxiuel5
	 9lSvWlT7dslT6jlTbBahwpLYGwO1OisZxHd6QPQWuuTpBI3gQdvjzq7YWLhD++DZMfPB2
	 hvp+5qpM3wabiMAiurcm8aN3HbVSZI7DgWn4YGDycvA9wzYANtgeoCI1979B0JwId3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OQsFGci4;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BDC606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8BDC606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OQsFGci4
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0db268bd8so8267457b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792623321; x=1793228121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4TFursOBUs7to8y4FWwAK3ge25kSxsoywm4OhWQZu4=;
        b=OQsFGci4JQzdleT+CK2pb9OFZduPZ8oyAocxEqmKJe89UdqJqjV2ELGXjN7jdlIsdS
         VFdfnUD9QZ54lrjktduNzaqGIT/erSI5qf8UjbVE4slMBUg/R5G339zWWuntlOd6xROE
         jI39OFPYINDVusQazZBjsTlx60UVWSQijSPwy2mB1ooxScG+OnBUfI7gqLvExIjWm6Gq
         Ce+urXgQesPdij1AhzrRSDhKuiszsgjn9yz9x0uMzXLYDsxQDl0tZpjFBWHAqrZFoUGS
         B+vPhY4/lOC+EaCUevjm1WOVoZJDERKZryeFumm73A8dA4X773VPh9z1YFEb0jFx/74P
         vwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792623321; x=1793228121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4TFursOBUs7to8y4FWwAK3ge25kSxsoywm4OhWQZu4=;
        b=xxsxlOrOI8e0raCjaqNkM40PWiM1OO0DLZacC0lXlxvdJZHPSYBTKOk2WbkwT4wIRa
         jln1T/yRlm+c5a9MgQcE3J2I5x4tLPwlvTVDsuy7i1X4yQuCByTyGmQpHo8u+60xJgGF
         pwIv7ynCRp9FGXRnEQpP0gnmYE0aXF4H/5uJU/8YNpi46hPSomwn0yzTeehEhayYtpTr
         5gWMAoiJGbtjkx73Wnyu8ABpoN83R+g6btwVQZP57c/A5psJcVZ9lKnbF7n5O+qTizU+
         Zu1IcI6riOTve09dC0AlRTfnFUGaNTmUd6NxSItPqcjUmapQltaA2K0L/v/mlARMVyP3
         kIsw==
X-Forwarded-Encrypted: i=1; AKwUvBzMQ/xjkXtiKZ1aE8fWN6zXJt9NiBKr69onG22ZnoKSrbuBUwmG6fraGFQXTigkqW4mLmu7f6fR1EfUerg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtQsRgO/TFG2WOOE47fWkapOGjVa27+mRhUSKcPy+EW5iUSYTT
	jxh8YNanHH4xFxa0gJULa1sMLviUXmkgk8cc39IbkCIe88Aw/KWpQO63
X-Gm-Gg: AYBFou0zRLXgUfWgjJVE3+5FNfpvJJ5kE7T1AtlsKC2mPa0UckITUuXEU9wCCBeqMFJ
	TIAYZik6Qdpl8uzDMKhEvDFSKU+YWn6dMkPOSR5ml47BcCcWM8V7F0BvW134RoA3124Q86N4PLc
	n0qstmbzildZkLTAFpvBZ9y78EKUwqv0wkd8ZUbpzd2/RV6pZI2ytGRL8qXYtR0yS6yv5rIwo88
	CBUoJW7zck8gNeT82ge+Ux1VhPL7yq99fqs474vZk175a9so+SU/TbycPf7ZMzI5OxGxV69wAcO
	JitNqPAZhsOX/vVAXGtLq6iGzmikOPpEVbSOlAdnKm01klvjBd9BH/167r4kmCUCx+COWnwjzjw
	o8ImkWDzWRcbZuD0J89e93nlX/se97+9GqLeUmDgAUDZhyNxihgHxTZr8xdzCJDQ97SF558664W
	b6P3tlDTxA5Pwv8PCoRYW52LEe4V9whQTdwD1Rxm4L4RgxIz1CWb0TilypoLngiHCb2yGiPdVhj
	anpQMkzs96gIiPSPG1EcAfIIYpdNZv/X3EQplIAR5kg1XIgFPZv5gdLNXm747HyR4p3f/SS/hsZ
	O5nT3svH1qk=
X-Received: by 2002:a05:690c:16:b0:8b1:447c:cf05 with SMTP id 00721157ae682-8b1447cd40cmr7951537b3.67.1792623320629;
        Wed, 21 Oct 2026 15:55:20 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:55::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b13012f929sm18363607b3.33.2026.10.21.15.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:55:20 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>
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
	Michal Koutny <mkoutny@suse.com>,
	Oscar Salvador <osalvador@suse.de>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v7 3/5] mm/page_counter: make page_counter_try_charge() stock-aware
Date: Wed, 21 Oct 2026 15:55:12 -0700
Message-ID: <20261021225516.1620680-4-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021225516.1620680-1-joshua.hahnjy@gmail.com>
References: <20261021225516.1620680-1-joshua.hahnjy@gmail.com>
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

Make page_counter_try_charge() consume stock transparently to callers
while preserving the same semantics as try_charge_memcg's greedy
charge attempt, refill, and !allow_spinning special case.

page_counter_try_charge gets two new parameters, may_batch and
nr_charged.

may_batch is intended to preserve the behavior of !allow_spinning
scenarios in try_charge_memcg, where the goal is to charge as quickly
as possible, without evicting other stock slots or making a greedy
charge to refill the stock.

nr_charged is used to reflect the size of the successful hierarchy
charge, preserving the existing batch-based memory.high accounting
for current->memcg_nr_pages_over_high. As with refill_stock() today,
the full charge is reported even if the excess is later uncharged
because the stock could not accept it. This only affects memory.high
throttling heuristics and never fails a charge. This behavior may be
fixed to properly account the net charge in a future follow-up.

As of this patch, no page_counter has stock yet, so there are no
functional changes intended.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 include/linux/page_counter.h |  4 +-
 kernel/cgroup/dmem.c         |  2 +-
 mm/hugetlb_cgroup.c          |  2 +-
 mm/memcontrol-v1.c           |  3 +-
 mm/memcontrol.c              |  8 ++--
 mm/page_counter.c            | 82 +++++++++++++++++++++++++++++++-----
 6 files changed, 83 insertions(+), 18 deletions(-)

diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index cf627c5090093..58532259e7f59 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -98,8 +98,8 @@ long page_counter_margin(const struct page_counter *counter);
 void page_counter_cancel(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_charge(struct page_counter *counter, unsigned long nr_pages);
 bool page_counter_try_charge(struct page_counter *counter,
-			     unsigned long nr_pages,
-			     struct page_counter **fail);
+			     unsigned long nr_pages, struct page_counter **fail,
+			     bool may_batch, unsigned long *nr_charged);
 void page_counter_refill_stock(struct page_counter *counter,
 			       unsigned long nr_pages);
 void page_counter_drain_stock_fully(struct page_counter_stock_pcp *stock);
diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 4683f3d680226..569307aa4bd62 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -736,7 +736,7 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
 		goto err;
 	}
 
-	if (!page_counter_try_charge(&pool->cnt, size, &fail)) {
+	if (!page_counter_try_charge(&pool->cnt, size, &fail, false, NULL)) {
 		if (ret_limit_pool) {
 			*ret_limit_pool = container_of(fail, struct dmem_cgroup_pool_state, cnt);
 			css_get(&(*ret_limit_pool)->cs->css);
diff --git a/mm/hugetlb_cgroup.c b/mm/hugetlb_cgroup.c
index 3fb41311e4c7d..bbc2dd3fa3c97 100644
--- a/mm/hugetlb_cgroup.c
+++ b/mm/hugetlb_cgroup.c
@@ -304,7 +304,7 @@ static int __hugetlb_cgroup_charge_cgroup(int idx, unsigned long nr_pages,
 
 	if (!page_counter_try_charge(
 		    __hugetlb_cgroup_counter_from_cgroup(h_cg, idx, rsvd),
-		    nr_pages, &counter)) {
+		    nr_pages, &counter, false, NULL)) {
 		ret = -ENOMEM;
 		hugetlb_event(h_cg, idx, HUGETLB_MAX);
 		css_put(&h_cg->css);
diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index b7f2868885071..a146e54c6f9f7 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -2193,7 +2193,8 @@ bool memcg1_charge_skmem(struct mem_cgroup *memcg, unsigned int nr_pages,
 {
 	struct page_counter *fail;
 
-	if (page_counter_try_charge(&memcg->tcpmem, nr_pages, &fail)) {
+	if (page_counter_try_charge(&memcg->tcpmem, nr_pages, &fail,
+				    false, NULL)) {
 		memcg->tcpmem_pressure = 0;
 		return true;
 	}
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index cdd6aba91e444..f232ccac69c36 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2722,13 +2722,14 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 
 	reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
 	if (do_memsw_account() &&
-	    !page_counter_try_charge(&memcg->memsw, batch, &counter)) {
+	    !page_counter_try_charge(&memcg->memsw, batch, &counter, false,
+				     NULL)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
 		goto reclaim;
 	}
 
-	if (page_counter_try_charge(&memcg->memory, batch, &counter))
+	if (page_counter_try_charge(&memcg->memory, batch, &counter, false, NULL))
 		goto done_restock;
 
 	if (do_memsw_account())
@@ -6028,7 +6029,8 @@ int __mem_cgroup_try_charge_swap(struct folio *folio)
 		private_id = mem_cgroup_private_id_get(memcg, nr_pages);
 
 		if (!mem_cgroup_private_id_is_root(private_id) &&
-		    !page_counter_try_charge(&memcg->swap, nr_pages, &counter)) {
+		    !page_counter_try_charge(&memcg->swap, nr_pages, &counter,
+					     false, NULL)) {
 			memcg_memory_event(memcg, MEMCG_SWAP_MAX);
 			memcg_memory_event(memcg, MEMCG_SWAP_FAIL);
 			mem_cgroup_private_id_put(private_id, nr_pages);
diff --git a/mm/page_counter.c b/mm/page_counter.c
index 71c7a89026cb9..4c30abf51e966 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -136,23 +136,76 @@ void page_counter_charge(struct page_counter *counter, unsigned long nr_pages)
 	}
 }
 
+/*
+ * Consume the cached charge if enough nr_pages are present, otherwise return
+ * failure. Also return failure for charge requests larger than
+ * PAGE_COUNTER_STOCK_BATCH or if the local lock is already taken.
+ */
+static bool page_counter_consume_stock(struct page_counter *counter,
+				       unsigned long nr_pages)
+{
+	struct page_counter_stock_pcp __percpu *stock = counter->stock;
+	struct page_counter_stock_pcp *pcp_stock;
+	u8 stock_pages;
+	bool ret = false;
+	int i;
+
+	if (nr_pages > PAGE_COUNTER_STOCK_BATCH ||
+	    !local_trylock(&stock->lock))
+		return false;
+
+	pcp_stock = this_cpu_ptr(stock);
+	for (i = 0; i < NR_PAGE_COUNTER_STOCK; i++) {
+		if (counter != READ_ONCE(pcp_stock->cached[i]))
+			continue;
+
+		stock_pages = READ_ONCE(pcp_stock->nr_pages[i]);
+		if (stock_pages >= nr_pages) {
+			stock_pages -= nr_pages;
+			WRITE_ONCE(pcp_stock->nr_pages[i], stock_pages);
+			if (!stock_pages) {
+				WRITE_ONCE(pcp_stock->cached[i], NULL);
+				css_put(counter->stock_css);
+			}
+			ret = true;
+		}
+		break;
+	}
+	local_unlock(&stock->lock);
+
+	return ret;
+}
+
 /**
- * page_counter_try_charge - try to hierarchically charge pages
+ * page_counter_try_charge - try to hierarchically charge pages using stock
  * @counter: counter
- * @nr_pages: number of pages to charge
- * @fail: points first counter to hit its limit, if any
+ * @nr_pages: number of pages requested
+ * @fail: points to the first counter to hit its limit, if any
+ * @may_batch: whether a stock miss may trigger a batch charge
+ * @nr_charged: optional; set to the hierarchy charge size on success
  *
- * Returns %true on success, or %false and @fail if the counter or one
- * of its ancestors has hit its configured limit.
+ * Return: %true if the request was satisfied. A failed batch charge may update
+ * @fail before an exact retry succeeds.
  */
 bool page_counter_try_charge(struct page_counter *counter,
-			     unsigned long nr_pages,
-			     struct page_counter **fail)
+			     unsigned long nr_pages, struct page_counter **fail,
+			     bool may_batch, unsigned long *nr_charged)
 {
+	unsigned long charge = nr_pages;
 	struct page_counter *c;
 	bool protection = track_protection(counter);
 	bool track_failcnt = counter->track_failcnt;
 
+	if (counter->stock && may_batch)
+		charge = max(nr_pages, PAGE_COUNTER_STOCK_BATCH);
+
+retry:
+	if (counter->stock && page_counter_consume_stock(counter, nr_pages)) {
+		if (nr_charged)
+			*nr_charged = 0;
+		return true;
+	}
+
 	for (c = counter; c; c = c->parent) {
 		long new;
 		/*
@@ -169,9 +222,9 @@ bool page_counter_try_charge(struct page_counter *counter,
 		 * we either see the new limit or the setter sees the
 		 * counter has changed and retries.
 		 */
-		new = atomic_long_add_return(nr_pages, &c->usage);
+		new = atomic_long_add_return(charge, &c->usage);
 		if (new > c->max) {
-			atomic_long_sub(nr_pages, &c->usage);
+			atomic_long_sub(charge, &c->usage);
 			/*
 			 * This is racy, but we can live with some
 			 * inaccuracy in the failcnt which is only used
@@ -192,11 +245,20 @@ bool page_counter_try_charge(struct page_counter *counter,
 				WRITE_ONCE(c->watermark, new);
 		}
 	}
+	if (charge > nr_pages)
+		page_counter_refill_stock(counter, charge - nr_pages);
+	if (nr_charged)
+		*nr_charged = charge;
 	return true;
 
 failed:
 	for (c = counter; c != *fail; c = c->parent)
-		page_counter_cancel(c, nr_pages);
+		page_counter_cancel(c, charge);
+
+	if (charge > nr_pages) {
+		charge = nr_pages;
+		goto retry;
+	}
 
 	return false;
 }
-- 
2.53.0-Meta

