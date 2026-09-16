Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9681B4E1C7E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592778; cv=none; b=IM40ajRhLKmj2yAYJmgEdT33tOolvADye46U5QvVfjmzaSRnwWE+mx0vLBdxeoi5Rsqx0hJ1rB2Noibwy4A0cBWdjUUIyKPUOQfInILBIag5j5PYvv2NPvHBLU1N2fJufJlmve6O/aboTuSMaT9mmtciSoOkEl7suNVA0a4lNGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592778; c=relaxed/simple;
	bh=jQYqPGmyomyUKJxHMNQLhim9L5ANd3ptwKSMbWAB9iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cbi9l51S3Hsy6NRpOxT/34ZuYXvk+iOynWPylo+FU6jImuagAJR3xx3IfwSSufzELLy51579/zzlZYi43BIJViV6PdZUUPBnKcf54E5CejbMq69TngZVNFbFlTdNpbp4vmIBhhx3ATZ3XVYEVmNs3GfNpTwsAPwwLAP14WXBeiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoi27KPc; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoi27KPc"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccdd77e2so22599fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592759; x=1790197559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqYH4Dmno3zIyHsVcbhXkDT5EaBSu0ei+LzQmvQECZs=;
        b=qoi27KPcYeOFVh9tA71saQUBlGtZR3QraQBJHp2NRMKWORhnMvCP7pRJmYkZvM8isT
         uDofQO5iFeWmoY241BJbkc5vcQIk41nWOF1ID+DjcItlgaYsjDL851QizSogkQSlqrOs
         V+FJ7g+tJAVit48N7F0QAs56Gu+EbbDhRfzw5jtjpvk3nklPhEnmyQAvhVt5UNaGQQCg
         YlJYrVoKjqq3169HSB8QdEhgNtVDcDtLxep+oLXDw7d0baROZDjqIzn9sowd0UaLJK3P
         SlW+8WMJD3OD+2t3i5OvbdUZMelwxQaMHfUkSgxznKn3h6SrBWl8U5gSHsU6JZ9103JJ
         MqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592759; x=1790197559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iqYH4Dmno3zIyHsVcbhXkDT5EaBSu0ei+LzQmvQECZs=;
        b=IeSOqF5dlqiWDO3NQn2BB2ikiIftSViR+yYvuKtZJjI1FMC0UL8rXaz9nmMHDQfknw
         4qw5QmN7HZji0ghtte81DtaD6qSVakZnUOeiJSOD9BkFAtyWvx/+g0E1fEURS+Bze+hl
         lEcWsx2jzjBGCcWzFWQlsXvRkRrW2MUTJrXhxXuqqBD11ILPYREJEYhxGjS9ILjmyYeJ
         6hlS/v6UI39goDUgvr7iA5G2MBvfhoITcDW6sVMqmdQCjSI2huGoij56bTs3Hk9JKxSn
         le/PddvJY2NaO/EiktQqbu2zlETZQ1K2PySv5ueysEq9QqodN2UpmQiU3NmRK8J5nGl8
         mwaA==
X-Forwarded-Encrypted: i=1; AKwUvBwn+AM8UZuhrZVlrOODWbUdgwialFAuWFex6zLYrViKkRcd3ntqNOokb/EO9ejuuduVJ9zmP/Sv9OMdVOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lSmP4pqIIgJ/un6sZlUDSKthD3jzIjCNEjVTZeEOMSehHmIs3J
	MMd86iTBA53u5ruYvVihN3Zpf76UY8mILhWMWH11Bo8cEMyEgBiPWoQM
X-Gm-Gg: AYBFou3SqkTApPPUfmYW9+wuroErmLjQ1F5knX5WEYMIxZN3fYD9LQK/W87+QjhJFR9
	p6Y44kX3n2uOPOaLlE+pj0FzQosND2hKDP0r6mM7SFCYcZrqqljwC9Y6C7P3KoAKbzAPK87ksUw
	OpKgkRxEjmZBaVCMat9oLAzK7bRic7K9rG1UvP3DYTFmCDVePTHx5X4v/7HT/3m8arcp+ASwt3V
	28TiLiJRxFnWNzFCsXFmM7tBQIbXrvu3qBgnMLtYtJhAsDf3J4eiYlTZxYPnsZFGI6z1Ny6QSxm
	FzB8oLMCp7O6etVksmCvVhkUbuLrFLXp4tBy270Ip7FJVNNzazN8T5Jx/CKBu/6ky7Xs+sZypq7
	K1gZFjAWqrYIwxYp4fG5vp1Rm9DL6T7ZAduV4Imreb+0MNpgM/Kb4xB8ZBcc+w0qTB9AKtdK7pL
	o6ApxRTUJmTidv3KsCaa3BjkcQ7w5cT8p6F7PQkBBSdqmSaiWWx+s1NwvZ9Md+wuZBVXz3QBYxu
	XnPbo7p0mm0rCLiYSrXoDnOAas61sYyQqeFC0Y=
X-Received: by 2002:a05:6820:4c17:b0:6b7:46e9:9706 with SMTP id 006d021491bc7-6c7d45e67c4mr3656381eaf.54.1789592759507;
        Wed, 16 Sep 2026 14:05:59 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:7::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80c43e5385csm1117267a34.1.2026.09.16.14.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:05:59 -0700 (PDT)
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
Subject: [PATCH v6 3/5] mm/page_counter: make page_counter_try_charge() stock-aware
Date: Wed, 16 Sep 2026 14:05:49 -0700
Message-ID: <20260916210552.891730-4-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916210552.891730-1-joshua.hahnjy@gmail.com>
References: <20260916210552.891730-1-joshua.hahnjy@gmail.com>
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
for current->memcg_nr_pages_over_high.

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
index 9cb5612fe190f..a5a5a789d002c 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -98,8 +98,8 @@ long page_counter_margin(struct page_counter *counter);
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
index ecb6e0b7819a0..5b8d9f0e25535 100644
--- a/mm/hugetlb_cgroup.c
+++ b/mm/hugetlb_cgroup.c
@@ -274,7 +274,7 @@ static int __hugetlb_cgroup_charge_cgroup(int idx, unsigned long nr_pages,
 
 	if (!page_counter_try_charge(
 		    __hugetlb_cgroup_counter_from_cgroup(h_cg, idx, rsvd),
-		    nr_pages, &counter)) {
+		    nr_pages, &counter, false, NULL)) {
 		ret = -ENOMEM;
 		hugetlb_event(h_cg, idx, HUGETLB_MAX);
 		css_put(&h_cg->css);
diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index bf2c7d53b01b1..aba9e3b851235 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -2194,7 +2194,8 @@ bool memcg1_charge_skmem(struct mem_cgroup *memcg, unsigned int nr_pages,
 {
 	struct page_counter *fail;
 
-	if (page_counter_try_charge(&memcg->tcpmem, nr_pages, &fail)) {
+	if (page_counter_try_charge(&memcg->tcpmem, nr_pages, &fail,
+				    false, NULL)) {
 		memcg->tcpmem_pressure = 0;
 		return true;
 	}
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 48c475909e6bb..04ab7355c6d2d 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2708,13 +2708,14 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 
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
@@ -5965,7 +5966,8 @@ int __mem_cgroup_try_charge_swap(struct folio *folio)
 	rcu_read_unlock();
 
 	if (!mem_cgroup_is_root(memcg) &&
-	    !page_counter_try_charge(&memcg->swap, nr_pages, &counter)) {
+	    !page_counter_try_charge(&memcg->swap, nr_pages, &counter, false,
+				     NULL)) {
 		memcg_memory_event(memcg, MEMCG_SWAP_MAX);
 		memcg_memory_event(memcg, MEMCG_SWAP_FAIL);
 		mem_cgroup_private_id_put(memcg, nr_pages);
diff --git a/mm/page_counter.c b/mm/page_counter.c
index 480a447bd7265..3cd8601961673 100644
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

