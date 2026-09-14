Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FFD48167E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401082; cv=none; b=XxN4cTyTQjKCW7Jp7oHieIb253cb1HGqYkP12/zgYP0l3aZowYOG7Yyj85/r1sM4t5oOPPdylUquVapQ+D4lqR0wot2c2p8M2uVgR8ChZ+EdPOp40zltevhyef6mGBMml8n+/k67WYXwZ3/+9RYak7pNPwBslZN87XcrgTAg4iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401082; c=relaxed/simple;
	bh=7ts6rmsKFRF/BDM3sQ/AwqSVWbdl6ZxDU7zNSDBdw/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRJA1HygM5LlV9NVrF17y+/mlaneiAsUbHoLXicA/KxmrdzRrHJAkN+wyBak3GhxLGigLQxxopR/9v1klm7rGYhDoiX9sVMUGbMVWeNKCd38bnTLSSc77JCa4XVSnggqplbey7sTGocX7zCeRRMY2P8aWoGK8Bcy8BgyaQ2ttgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LQvX3CUh; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LQvX3CUh"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067cso196295585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789401078; x=1790005878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eU9VXoF1KJeJ9qFFfIMdTfngvLjdefOLFWals6AtDzc=;
        b=LQvX3CUhY71b0n85KhNs20YTPoL2HOmSMG/mSoG2FUBP+q39aSD1tqhaKoRwm5DiFz
         yxNJve6KITm2eSAHQtFU02kSO+2XrvgFh5UzKlr2Ldm3H6RYUWo9yL5X5qpA6tqkZehC
         3a7E6dWY69DZORhCgWZq5ZIoIzkXhEX3Ct+H7ovXG/lLt29nWXkOq2+F5wO5pbsb096p
         8hQNrAzkI6IHDEhRbHlX5n1pUyZ82l/PG6gHveNe1UsaIWS793nj6YKXuJvHQhFlExuY
         g4J3+X2gKcNllbWbl343YwDPJ2clxTHWcNruAqzWhnSBvpH6AGP7vAY4d2OMtluBOUPn
         XXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401078; x=1790005878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eU9VXoF1KJeJ9qFFfIMdTfngvLjdefOLFWals6AtDzc=;
        b=Hhf2DVp7ec8PJUbqKFnIlODN17z2niWZ+SdE1BjMJZ+fVzHBYH4oSw/AfMS8R8bpWt
         jyQs6rV3c3U3JqJRrHnxb5Sr87+gYO1U+gVGgfuRMevkIWwktA7Mf/GiNLTfb0D5l5Tx
         XEn+JwoKdZtb2YJq5cGxz3Dwr8NIjpZb+1Pf6c3O6wERA8+pygA2RD7Zc2QS2LY5etB7
         spnAzGA32R/Aff/hd1ot/ng3rBlUukNVkUf6N1+ZaDf7o0/PleWU2Zf3DaaChb5GuEn6
         FC2/dOVZVnoRk3l1aQ7POT8cSggABqbvfU5apcoFPWprdWPGxpd4vWYLH4jXG7w+UeIQ
         Z8Og==
X-Gm-Message-State: AFuF++nauOCXY4CPJ/OEWWGwfUggiMLGnmO8N8hfzA/D1AwvCxun2eTD
	wKKXvu1mktFUVWXmUra7yo6Gn6odLtj65xKvgd63etNR6JeFq2S4PQHoHHfeoTQ2MbHixlGXOc9
	gbY7c
X-Gm-Gg: AYBFou2pppYgNoyb94JYswcoDWoPAHKWT7U9RztTqzQKpjp15Tl+c5MIkcqiwzihvDy
	hJIQZ8BjynUwcRHn7lZ/AWpTuoW5bLnQyIg8rfzTNtInUGYgm2NQnpI+1vusV+w59EuHFdd5PhP
	jVWxkA6DQjN4c5M90PxUfhAvYUGlZCn4ontjYtkDMw0LeA82rqDuAAxmUs4n61fE7L62rNK48Ja
	YKbpOLmjK1sSHkdNpP5Z3LSRUt6X8+wBcoqUnC+EAv9Pm3NUenfIpSSQ64cRuRXAvki+grdaI6o
	8IvA5ThUXWGqoZtS9JtRYqI6tvvApJoVkn8Wqj8Xny0vf8SEExHngJnox1HK7qYE0P2tyLPjP4Z
	ATM1/FFjgmd2gl8MtGMsTdiJDiWpowcT23E1e0kJdwASBvyyoL/vx2MxAirqpfi3I48KMrzXlng
	Fkjga7hWLa/YN5E7aWs0WVZAVop8V2IiDHs8OXGkQbCbXfac+sVVHZD8whkKldbrDjQHTBg/IeU
	8NrgR99P7+UX3Z6YwF+p1fZNxXAEG7SaeCVMfCLmHdyZMPG4SqxZBFe9WaWWyzyt1Z5Qs8=
X-Received: by 2002:a05:620a:4626:b0:939:e6a7:dc with SMTP id af79cd13be357-93a29bfd291mr439988785a.52.1789401078460;
        Mon, 14 Sep 2026 08:51:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a2d4514c7sm155963085a.28.2026.09.14.08.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:51:18 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com
Subject: [PATCH] mm/page_alloc: let the bulk and folio allocators carry alloc_flags
Date: Mon, 14 Sep 2026 11:51:14 -0400
Message-ID: <20260914155115.439742-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__alloc_pages_noprof() takes an explicit alloc_flags, but the bulk and
folio entry points do not, so callers cannot select allocator behaviour
(e.g. an alternate zonelist) through them.

Thread alloc_flags through both, matching __alloc_pages_noprof(), and
keep the flag-carrying primitives mm-internal (page_alloc.h) so the
public gfp.h wrappers stay flag-free:

 - add __alloc_pages_bulk_noprof(gfp, ..., alloc_flags) in page_alloc.h
   alloc_pages_bulk_noprof() becomes a wrapper passing ALLOC_DEFAULT

 - give __folio_alloc_noprof() an alloc_flags parameter and moves
   __folio_alloc_node_noprof() moves into page_alloc.h
   __folio_alloc_noprof() is no longer exported

No functional change: every caller passes ALLOC_DEFAULT.

Cc: Brendan Jackman <brendan.jackman@linux.dev>
Signed-off-by: Gregory Price <gourry@gourry.net>
---

Brendan this will conflict mildly with your ALLOC_UNMAPPED work,
because you add an init_alloc_flags call in alloc_pages_bulk_noprof :
https://lore.kernel.org/linux-mm/20260726-page_alloc-unmapped-v3-20-6f5729aa9832@google.com/

I wanted to pull this out ahead to try to deal with the conflict.

 include/linux/gfp.h | 13 +------------
 mm/khugepaged.c     |  2 +-
 mm/migrate.c        |  2 +-
 mm/page_alloc.c     | 46 ++++++++++++++++++++++++++++++---------------
 mm/page_alloc.h     |  8 ++++++++
 5 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 872bc53f32ec..a327e58c313f 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -204,10 +204,6 @@ static inline void arch_free_page(struct page *page, int order) { }
 static inline void arch_alloc_page(struct page *page, int order) { }
 #endif
 
-struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order, int preferred_nid,
-		nodemask_t *nodemask);
-#define __folio_alloc(...)			alloc_hooks(__folio_alloc_noprof(__VA_ARGS__))
-
 unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 				nodemask_t *nodemask, int nr_pages,
 				struct page **page_array);
@@ -252,14 +248,7 @@ static inline void warn_if_node_offline(int this_node, gfp_t gfp_mask)
 	dump_stack();
 }
 
-static inline
-struct folio *__folio_alloc_node_noprof(gfp_t gfp, unsigned int order, int nid)
-{
-	warn_if_node_offline(nid, gfp);
-
-	return __folio_alloc_noprof(gfp, order, nid, NULL);
-}
-
+struct folio *__folio_alloc_node_noprof(gfp_t gfp, unsigned int order, int nid);
 #define  __folio_alloc_node(...)		alloc_hooks(__folio_alloc_node_noprof(__VA_ARGS__))
 
 /*
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 0d8cd44b14c5..431c2e610b39 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1193,7 +1193,7 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
 	int node = collapse_find_target_node(cc);
 	struct folio *folio;
 
-	folio = __folio_alloc(gfp, order, node, &cc->alloc_nmask);
+	folio = __folio_alloc(gfp, order, node, &cc->alloc_nmask, ALLOC_DEFAULT);
 	if (!folio) {
 		*foliop = NULL;
 		count_collapse_event(order, THP_COLLAPSE_ALLOC_FAILED,
diff --git a/mm/migrate.c b/mm/migrate.c
index 7e3a81f06974..8e1c25a6f750 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2229,7 +2229,7 @@ struct folio *alloc_migration_target(struct folio *src, unsigned long private)
 	if (is_highmem_idx(zidx) || zidx == ZONE_MOVABLE)
 		gfp_mask |= __GFP_HIGHMEM;
 
-	return __folio_alloc(gfp_mask, order, nid, mtc->nmask);
+	return __folio_alloc(gfp_mask, order, nid, mtc->nmask, ALLOC_DEFAULT);
 }
 
 #ifdef CONFIG_NUMA_MIGRATION
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index d977b8bf7245..f4ceec8cf77e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5151,8 +5151,8 @@ static inline bool prepare_alloc_pages(gfp_t gfp_mask, unsigned int order,
  * @page_array were set to %NULL on entry, the slots from 0 to the return value
  * - 1 will be filled.
  */
-unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
-			nodemask_t *nodemask, int nr_pages,
+unsigned long __alloc_pages_bulk_noprof(gfp_t gfp, unsigned int alloc_flags,
+			int preferred_nid, nodemask_t *nodemask, int nr_pages,
 			struct page **page_array)
 {
 	struct page *page;
@@ -5160,8 +5160,8 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	struct zoneref *z;
 	struct per_cpu_pages *pcp;
 	struct list_head *pcp_list;
-	struct alloc_context ac;
-	unsigned int alloc_flags = ALLOC_WMARK_LOW;
+	struct alloc_context ac = { .alloc_flags = alloc_flags };
+	unsigned int fastpath_alloc_flags = alloc_flags | ALLOC_WMARK_LOW;
 	int nr_populated = 0, nr_account = 0;
 
 	/*
@@ -5202,7 +5202,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	/* May set ALLOC_NOFRAGMENT, fragmentation will return 1 page. */
 	gfp &= gfp_allowed_mask;
 	gfp = current_gfp_context(gfp);
-	if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &gfp, &alloc_flags))
+	if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &gfp, &fastpath_alloc_flags))
 		goto out;
 
 	/* Find an allowed local zone that meets the low watermark. */
@@ -5210,7 +5210,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	for_next_zone_zonelist_nodemask(zone, z, ac.highest_zoneidx, ac.nodemask) {
 		unsigned long mark;
 
-		if (cpusets_enabled() && (alloc_flags & ALLOC_CPUSET) &&
+		if (cpusets_enabled() && (fastpath_alloc_flags & ALLOC_CPUSET) &&
 		    !__cpuset_zone_allowed(zone, gfp)) {
 			continue;
 		}
@@ -5220,16 +5220,17 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			goto failed;
 		}
 
-		cond_accept_memory(zone, 0, alloc_flags);
+		cond_accept_memory(zone, 0, fastpath_alloc_flags);
 retry_this_zone:
-		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages - nr_populated;
+		mark = wmark_pages(zone, fastpath_alloc_flags & ALLOC_WMARK_MASK) +
+		       nr_pages - nr_populated;
 		if (zone_watermark_fast(zone, 0,  mark,
 				zonelist_zone_idx(ac.preferred_zoneref),
-				alloc_flags, gfp)) {
+				fastpath_alloc_flags, gfp)) {
 			break;
 		}
 
-		if (cond_accept_memory(zone, 0, alloc_flags))
+		if (cond_accept_memory(zone, 0, fastpath_alloc_flags))
 			goto retry_this_zone;
 
 		/* Try again if zone has deferred pages */
@@ -5261,7 +5262,7 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 			continue;
 		}
 
-		page = __rmqueue_pcplist(zone, 0, ac.migratetype, alloc_flags,
+		page = __rmqueue_pcplist(zone, 0, ac.migratetype, fastpath_alloc_flags,
 								pcp, pcp_list);
 		if (unlikely(!page)) {
 			/* Try and allocate at least one page */
@@ -5289,11 +5290,19 @@ unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
 	return nr_populated;
 
 failed:
-	page = __alloc_pages_noprof(gfp, 0, preferred_nid, nodemask, ALLOC_DEFAULT);
+	page = __alloc_pages_noprof(gfp, 0, preferred_nid, nodemask, alloc_flags);
 	if (page)
 		page_array[nr_populated++] = page;
 	goto out;
 }
+
+unsigned long alloc_pages_bulk_noprof(gfp_t gfp, int preferred_nid,
+			nodemask_t *nodemask, int nr_pages,
+			struct page **page_array)
+{
+	return __alloc_pages_bulk_noprof(gfp, ALLOC_DEFAULT, preferred_nid,
+					 nodemask, nr_pages, page_array);
+}
 EXPORT_SYMBOL_GPL(alloc_pages_bulk_noprof);
 
 /*
@@ -5484,13 +5493,20 @@ struct page *alloc_pages_node_noprof(int nid, gfp_t gfp_mask, unsigned int order
 EXPORT_SYMBOL(alloc_pages_node_noprof);
 
 struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order, int preferred_nid,
-		nodemask_t *nodemask)
+		nodemask_t *nodemask, unsigned int alloc_flags)
 {
 	struct page *page = __alloc_pages_noprof(gfp | __GFP_COMP, order,
-					preferred_nid, nodemask, ALLOC_DEFAULT);
+					preferred_nid, nodemask, alloc_flags);
 	return page_rmappable_folio(page);
 }
-EXPORT_SYMBOL(__folio_alloc_noprof);
+
+struct folio *__folio_alloc_node_noprof(gfp_t gfp, unsigned int order, int nid)
+{
+	warn_if_node_offline(nid, gfp);
+
+	return __folio_alloc_noprof(gfp, order, nid, NULL, ALLOC_DEFAULT);
+}
+EXPORT_SYMBOL(__folio_alloc_node_noprof);
 
 /*
  * Common helper functions. Never use with __GFP_HIGHMEM because the returned
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index b9259deddb59..23fc79ce97b6 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -258,6 +258,14 @@ struct page *__alloc_pages_noprof(gfp_t gfp, unsigned int order, int preferred_n
 		nodemask_t *nodemask, unsigned int alloc_flags);
 #define __alloc_pages(...)			alloc_hooks(__alloc_pages_noprof(__VA_ARGS__))
 
+struct folio *__folio_alloc_noprof(gfp_t gfp, unsigned int order, int preferred_nid,
+		nodemask_t *nodemask, unsigned int alloc_flags);
+#define __folio_alloc(...)			alloc_hooks(__folio_alloc_noprof(__VA_ARGS__))
+
+unsigned long __alloc_pages_bulk_noprof(gfp_t gfp, unsigned int alloc_flags,
+		int preferred_nid, nodemask_t *nodemask, int nr_pages,
+		struct page **page_array);
+
 extern void zone_pcp_reset(struct zone *zone);
 extern void zone_pcp_disable(struct zone *zone);
 extern void zone_pcp_enable(struct zone *zone);
-- 
2.55.0

