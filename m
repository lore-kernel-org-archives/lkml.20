Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E294F3928
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623437; cv=none; b=nknmMHDQuLKDzvIEpxQGtmOQ8GQzY0LrWYOeIE2RbcAKOpOT9Kd9ROA4wBqZVEmgbytXHAsfErGzuwLDZ+7wzSC+xABP/vRfO/eXRwOjBBzXYS1G3BajRNOZmBSVR/2qudAicNWKkoqQIYLc9NSJHyF07v2yTJov9aAKPSsqW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623437; c=relaxed/simple;
	bh=VJPlW50i1qlN1M4RQ2otOZrS+A+mCMpiPsD8LK9Ybdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbGPAmG4+sANS4QUkB7RRSxo0TuFfol/P9hoJPo2uR16vrn6zbKWFo9U/CHj6ABRfChQiiqfBa4YQbR7UflRRwmCEME3yMgyHn3xrE4EP5UhUhJGrJJH+a/l3GiCmG4ZaU6tk9+KXvlF3XdcpSwLrftl96SObcrizG9xaVN+7Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM7pdwyx; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM7pdwyx"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81be5042c56so1269206a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790623434; x=1791228234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK8/WIiTpcUHPrQYJYKTFLDFb/7dqUCiogR273O7EAg=;
        b=mM7pdwyx3K9OzkqHI4b2h59qPh28E521lFz0yKMMqYxqeIn/Yo7o8/KqF/6BsJ+J2a
         g6g87rMlI5AGFnowH9k/qVdEocWPDYIeXNRzQWJu2l/fliwzjPlKIy74iSh9CJx3m3He
         tRff6h7NRuPNXj7sNkmFqiBF6foTnGbEMIGpjtAYNqIZ2D+ZLC70wHZEjGhppJz478sd
         /iI5dGtxpem3X+nwOwKLHTcdVfDwk/KtvtNIpcxOVDyCy484MIJaD2GqpGi9b8B2p9/4
         H7wS7kr4H9kK4XtzUjXulhDHuqEv7Ml3n3ouzSW4PT3AQH+9uYzICy5msMksUtPbyf1m
         k0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623434; x=1791228234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK8/WIiTpcUHPrQYJYKTFLDFb/7dqUCiogR273O7EAg=;
        b=YnXwqRh80D5B6CaU8B2qlwImLfTfEcGGp4GYnaCsA3eC0w8/xBvLQnaSIoUluyEM71
         0R8WKX6PEvIvixTUoMm+rSNrtZRqE1ILYf8g/w2ePe/hwA5Fzbj+XJWripEF5sHZ7Txv
         RPA1VqDAQK2QwsHDn1eWaFl72T6hKB21gR8dqX1EbSLFQ4QhR/nv/pcuLV86pue7ghTU
         n8MS7A5z9W6iB198lUq1NFAsae+yUFcIfw5wAFHIE9dZ7lct5tQZGu7GkmxhbTnt3PF6
         +FAx8E7DzHxN3trEeyRawCM1bLESAijXcvoVfjdP3Oe2MIDL4aZMeejRT/7DwAGzF6/R
         CcQw==
X-Forwarded-Encrypted: i=1; AKwUvBw+FRXnujVkQKhP36r/izkY+pJ9hC6Aeu5jIKjbtOxoHC4cJPWapVRgZWouU4xuW/H1TxfAV6IMVzjoDtg=@vger.kernel.org
X-Gm-Message-State: AFuF++ltepXPIETjpQo6La/yIrqIOQD/me4haBPtv78zV0pMX3NWXhAr
	OrydMey68Jq0w9gBm1ZqPet9nK+jl5OoOONO/YSXe/34ZWTAhz6HcPlH
X-Gm-Gg: AYBFou0gnqxLb6LCB4fExDR1rlKifjjcAg6E8/UoJYQR6uho7t1ekb3h96u2n4Xg8hR
	Z+4qGHn+4d9nlgpyOVV+y7KFRtgI9FE0vpNVfXGZ1PvdPmhlmqd7yZXWGkioPaIIfHjk/aL6vYj
	idUsMSRKPmycdHfMRbUTEeu+WrBjIVleEfNhK8UhrPBAfpIx79VRjqwrriYJSOQhHafAZUSiGqU
	iIrn6mAknPpx90ThZN1YjEAUzFXYGTTVWcL5qavzepbOJuogRd3zWLrrHK8Y00SX/LjjwiPTDFp
	q0HwVryAP71Hanlp203RPKhdPWmVZ1CDqqIXxkhj07Uro7eTz/keb0ikD1bL1pV/oje4fiIG6g+
	z66CXsxIWbR4itiqFFpcoYCCmvEIXawtP411Zaz/K2eChgaJix4QhSeY3OdZtq8GlJXm4o429WN
	PdDSVKZ1fKXGGLkphXbm+JFFA/onF52R2jXjsXj28CRaPldSOoU4VtKumRb1Umm2BGly/bXhfkp
	/f1f2h6RiIYqF0Co3w4UVqki21q8w==
X-Received: by 2002:a05:6830:2406:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-81917a258demr11321224a34.25.1790623433738;
        Mon, 28 Sep 2026 12:23:53 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4b::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81d5901ac3esm2430499a34.26.2026.09.28.12.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:23:53 -0700 (PDT)
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
Subject: [PATCH v6 RESEND 3/5] mm/page_counter: make page_counter_try_charge() stock-aware
Date: Mon, 28 Sep 2026 12:23:46 -0700
Message-ID: <20260928192349.3432886-4-joshua.hahnjy@gmail.com>
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
index edb2da5a326c5..53be4365e2c9e 100644
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
@@ -6026,7 +6027,8 @@ int __mem_cgroup_try_charge_swap(struct folio *folio)
 		private_id = mem_cgroup_private_id_get(memcg, nr_pages);
 
 		if (!mem_cgroup_private_id_is_root(private_id) &&
-		    !page_counter_try_charge(&memcg->swap, nr_pages, &counter)) {
+		    !page_counter_try_charge(&memcg->swap, nr_pages, &counter,
+					     false, NULL)) {
 			memcg_memory_event(memcg, MEMCG_SWAP_MAX);
 			memcg_memory_event(memcg, MEMCG_SWAP_FAIL);
 			mem_cgroup_private_id_put(private_id, nr_pages);
diff --git a/mm/page_counter.c b/mm/page_counter.c
index 77624b00b5f94..e48ef37016c50 100644
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
+				css_put(counter->stock_css);
+				WRITE_ONCE(pcp_stock->cached[i], NULL);
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

