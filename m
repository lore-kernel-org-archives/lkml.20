Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2E4A2A78
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194280; cv=none; b=liG/7TlKZ1wpbAjvVx/jCyyhE560FifIg4AEzlN0qPrLzasKLmjbjHwi7LdVmg7PIU1l6yRuSmwGF1M40S2vR3ekmWWbxoiGiFZ/wYWU3uGGwT0gvUrJedIsisyumVExVyJwJ2JyuT1wArEbyVUSSfihLMrGO17GYy8o3PWnrhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194280; c=relaxed/simple;
	bh=PKwARw2KbFSmGIOyQgOWgTdCsHCypuENVQPYBlHabig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLKXoTJ1LJXmfPCOjawfeYeEVWBA0BLMxnLACVtXvYHfRkYpVR/8DFsveBGG/sG4dHtk++D2Q1W6ouOfWYPWkaOZdaFIcDWI9dGwmX7fSecYhIsSl0kmkrT6VPUKvDoD4Jq+oGxOci5Lr8v/pZ6rg5evSB+H4JSo6n5lKVOERdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhMMScEC; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhMMScEC"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-44856d185bcso3328643fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788194277; x=1788799077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x77j6vdZ8LqsWXipiJe0J8DOL7X4B8I6QMSB+YfLeSc=;
        b=NhMMScEC4aVNhUD8AbEq8e717vgYClbGN/HCQ/5dnyw17zcWAAcx5ibhqJty84/41y
         Q7MI2/eiOxQ+R08yEncHkjW/W2x3pW0RGFy2WdmeD7ub+sNBa8WyKlj+F68Ry2hARN1u
         1/YwCOlg5wxKBkxudafrCXtegn6tOMV+e95BSdAvW4pm34AbmTUd70Cm9ONieOFmvxrq
         DbuZrhvUyQEzD+q4Gi0H0QhJEtqR9gRseLgjhCs8fFgDCFM/akiezrx5WC1ecYMcCXJg
         JS10T1pHOaGVXZU4N2rLC0rEr/W6Dz+3JNI45A008I03xl9sLU7mYgyxpqlEGxi2Ovne
         EGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194277; x=1788799077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x77j6vdZ8LqsWXipiJe0J8DOL7X4B8I6QMSB+YfLeSc=;
        b=bIgfwfl2m4YHTmScj5nULU5x9uQB5NkzPfrqLtbgZj/vd4skTA8CB4G7JI8NWFCawP
         RMH5oPjLlWL0LRcjMUCw6us0xAdOPnz7U7IRBQmxaJ+5e7LDWOKREyW4hDmwBADrEV7D
         LXXHZZw4bIdYQn9TV1+AOqMwUxlxdYgtq6ImD+2gBR39OlZq0B70vDxcQPggWI/8us4Y
         VPE+4gby+wP3GbC2TpA4NdyUp0WqGcymE9GVARbejnCE6I6hU/IphcqY26xznOdZEEPl
         hdy0e4zYmPQppX0BsSqacdMC4asr4qKNJAr6q44+5yvJKrGMB8lxlO6aNHYe9/CF7Wc6
         wPFw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2ALpnMjCxE25e8t7HRThuSgGZnNrTrffKHBq7CUvAf0yXsUpDVhwIMvgb2PVWHHXhtPRVpEp5vVes3aE=@vger.kernel.org
X-Gm-Message-State: AFuF++mqMKhpRBRuuLqXEuZjDj9h6ZKUbBOZg1KlZGbY1WkkZ6uqovl2
	gqMoQwAfTSmBwofFOODKkOBv/7Q0DWIkHy3I+dteqCMiyPzAxA91HMK2
X-Gm-Gg: AYBFou3PkdEPOGcRvFypT5gpP881HwwS8ySohYIlb4e5xsQtGHFS0cNi5vMW9/BWHJz
	bGe5H201s0OjnIxXh2XoKAHnL7m//T9Gx4q4qbB9zQgZUhiRsEe8b3OESjl9V9YyGEsm2ZfUEIP
	9H4be5mK/AWX7X2gkpRR2DyJ44/yQMIGn0KfnLc2OtTvqCU5tPDUuA1UNY1v4oe/BOoIW1HppwU
	9RuEKJtbjVCWHaV47W9bBXJW3mtkR4yw1zy9MAkLAFb5KxQ18ByivQ1DEtfI0XByYOSj5uhSWCy
	YXzP5tFLb/0s5xuwbuwC8IBUUw4Xd7MxZ4+vHaFQYuoohpMbqOAQ+UUqEliZ+U+QnzLn68HoQiR
	WtFZWx2xCCuhfr3bQpT99gSADgxK7BVqw7CCf4470AGKRq8HRlKQpZtSdOs6m141GAz3en6SXtV
	Lv/+ODF0eloDzrhytJhCKuo2I1zGHkxEyIp7QX4At/4nZym040LXzJ4vBZ6WLDidsqEJUUGI02S
	f34i1EXBOPVxfShroyZ
X-Received: by 2002:a05:6870:3313:b0:448:3eb2:8c8c with SMTP id 586e51a60fabf-46835d7d79fmr26983191fac.6.1788194276047;
        Mon, 31 Aug 2026 09:37:56 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:2c::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-468a545dfe6sm11149786fac.14.2026.08.31.09.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:37:55 -0700 (PDT)
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
Subject: [PATCH v5 2/7] mm/page_counter: report the number of pages charged
Date: Mon, 31 Aug 2026 09:37:46 -0700
Message-ID: <20260831163752.2193337-3-joshua.hahnjy@gmail.com>
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

Add an optional @nr_charged parameter to page_counter_try_charge.
On success, it will be set to the number of pages actually charged to
the hierarchy. Today this number is always @nr_pages, so there is no
functional change.

Of the 6 callsites, only one user (try_charge_memcg) uses that
information. The number of charged pages is added to
current->memcg_nr_pages_over_high to indicate how many pages it charged
to the hierarchy while over high.

Today, try_charge_memcg requests "batch" from page_counter_try_charge
and adds that same amount to memcg_nr_pages_over_high on success, since
page_counter_try_charge's only source of charges is the hierarchy.
However, this invariant changes later in the series when stock is pushed
down from the memcg level to the page_counter level, and a page_counter
charge can be successful without growing the hierarchy size.

Plumb the new parameter to all callsites, passing NULL where the source
of charge does not matter to the caller, and passing &nr_charged in
try_charge_memcg to account the hierarchy size growth.

No functional change intended.

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 include/linux/page_counter.h |  4 ++--
 kernel/cgroup/dmem.c         |  2 +-
 mm/hugetlb_cgroup.c          |  2 +-
 mm/memcontrol-v1.c           |  2 +-
 mm/memcontrol.c              | 10 ++++++----
 mm/page_counter.c            | 10 ++++++++--
 6 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
index d649b6bbbc871..89a083f16fbf7 100644
--- a/include/linux/page_counter.h
+++ b/include/linux/page_counter.h
@@ -71,8 +71,8 @@ static inline unsigned long page_counter_read(struct page_counter *counter)
 void page_counter_cancel(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_charge(struct page_counter *counter, unsigned long nr_pages);
 bool page_counter_try_charge(struct page_counter *counter,
-			     unsigned long nr_pages,
-			     struct page_counter **fail);
+			     unsigned long nr_pages, struct page_counter **fail,
+			     unsigned long *nr_charged);
 void page_counter_uncharge(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_set_min(struct page_counter *counter, unsigned long nr_pages);
 void page_counter_set_low(struct page_counter *counter, unsigned long nr_pages);
diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 4683f3d680226..fbbbd0b09d290 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -736,7 +736,7 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
 		goto err;
 	}
 
-	if (!page_counter_try_charge(&pool->cnt, size, &fail)) {
+	if (!page_counter_try_charge(&pool->cnt, size, &fail, NULL)) {
 		if (ret_limit_pool) {
 			*ret_limit_pool = container_of(fail, struct dmem_cgroup_pool_state, cnt);
 			css_get(&(*ret_limit_pool)->cs->css);
diff --git a/mm/hugetlb_cgroup.c b/mm/hugetlb_cgroup.c
index ecb6e0b7819a0..6df4a69b0d529 100644
--- a/mm/hugetlb_cgroup.c
+++ b/mm/hugetlb_cgroup.c
@@ -274,7 +274,7 @@ static int __hugetlb_cgroup_charge_cgroup(int idx, unsigned long nr_pages,
 
 	if (!page_counter_try_charge(
 		    __hugetlb_cgroup_counter_from_cgroup(h_cg, idx, rsvd),
-		    nr_pages, &counter)) {
+		    nr_pages, &counter, NULL)) {
 		ret = -ENOMEM;
 		hugetlb_event(h_cg, idx, HUGETLB_MAX);
 		css_put(&h_cg->css);
diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index bf2c7d53b01b1..cf514d1bd7c38 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -2194,7 +2194,7 @@ bool memcg1_charge_skmem(struct mem_cgroup *memcg, unsigned int nr_pages,
 {
 	struct page_counter *fail;
 
-	if (page_counter_try_charge(&memcg->tcpmem, nr_pages, &fail)) {
+	if (page_counter_try_charge(&memcg->tcpmem, nr_pages, &fail, NULL)) {
 		memcg->tcpmem_pressure = 0;
 		return true;
 	}
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 93c2fa04da4fd..71410084fa7fc 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2663,6 +2663,7 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 	struct mem_cgroup *mem_over_limit;
 	struct page_counter *counter;
 	unsigned long nr_reclaimed;
+	unsigned long nr_charged = 0;
 	bool passed_oom = false;
 	unsigned int reclaim_options;
 	bool drained = false;
@@ -2680,13 +2681,14 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 
 	reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
 	if (do_memsw_account() &&
-	    !page_counter_try_charge(&memcg->memsw, batch, &counter)) {
+	    !page_counter_try_charge(&memcg->memsw, batch, &counter, NULL)) {
 		mem_over_limit = mem_cgroup_from_counter(counter, memsw);
 		reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
 		goto reclaim;
 	}
 
-	if (page_counter_try_charge(&memcg->memory, batch, &counter))
+	if (page_counter_try_charge(&memcg->memory, batch, &counter,
+				    &nr_charged))
 		goto done_restock;
 
 	if (do_memsw_account())
@@ -2847,7 +2849,7 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
 			 * and distribute reclaim work and delay penalties
 			 * based on how much each task is actually allocating.
 			 */
-			current->memcg_nr_pages_over_high += batch;
+			current->memcg_nr_pages_over_high += nr_charged;
 			set_notify_resume(current);
 			break;
 		}
@@ -5771,7 +5773,7 @@ int __mem_cgroup_try_charge_swap(struct folio *folio)
 	rcu_read_unlock();
 
 	if (!mem_cgroup_is_root(memcg) &&
-	    !page_counter_try_charge(&memcg->swap, nr_pages, &counter)) {
+	    !page_counter_try_charge(&memcg->swap, nr_pages, &counter, NULL)) {
 		memcg_memory_event(memcg, MEMCG_SWAP_MAX);
 		memcg_memory_event(memcg, MEMCG_SWAP_FAIL);
 		mem_cgroup_private_id_put(memcg, nr_pages);
diff --git a/mm/page_counter.c b/mm/page_counter.c
index 661e0f2a5127a..a934619cc7bf7 100644
--- a/mm/page_counter.c
+++ b/mm/page_counter.c
@@ -111,13 +111,15 @@ void page_counter_charge(struct page_counter *counter, unsigned long nr_pages)
  * @counter: counter
  * @nr_pages: number of pages to charge
  * @fail: points first counter to hit its limit, if any
+ * @nr_charged: optional; on success, set to the number of pages actually
+ *		charged to the hierarchy
  *
  * Returns %true on success, or %false and @fail if the counter or one
  * of its ancestors has hit its configured limit.
  */
 bool page_counter_try_charge(struct page_counter *counter,
-			     unsigned long nr_pages,
-			     struct page_counter **fail)
+			     unsigned long nr_pages, struct page_counter **fail,
+			     unsigned long *nr_charged)
 {
 	struct page_counter *c;
 	bool protection = track_protection(counter);
@@ -162,6 +164,10 @@ bool page_counter_try_charge(struct page_counter *counter,
 				WRITE_ONCE(c->watermark, new);
 		}
 	}
+
+	if (nr_charged)
+		*nr_charged = nr_pages;
+
 	return true;
 
 failed:
-- 
2.53.0-Meta

