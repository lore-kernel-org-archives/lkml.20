Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CDA31A807
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790989924; cv=none; b=VTYzsHZLfAa/cXoz5hbrarOynfq/YpH6u+l4hvaSf14RyAzcImwZzygzg9S1RvCPvl3qcdE3sqHx/Cl/gMFktu2G2p6N8TOPdCuKnNa3kQ9QN0Cd8jpueNk8GAWbTFPd6czj9iTjZX7tmiAYvfhVLzkgo8MLepivczKd16N26vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790989924; c=relaxed/simple;
	bh=H/kxfuZYo3F3EB/2s7exEyWzDhZo3+ebQXbFQZzLBKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ocXAvl73hGPX/mgx6oqGSZzspwprqvlUe8g1/8DcC8+qYsEcT3rya0qzVOSIVt5tNgIYGhHlet4tORWjemzgu7torz6cvLbuz02VdEen0dm9xe6ngGMZ2/ySffFS4CRI38BR75Zd1hvufhBQmb3vQNU2SGrmF7yDjN2qahoplZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id d479558952a2d234;
	Sat, 03 Oct 2026 01:11:45 +0000
X-Mizu-Trace-ID: d479558952a2d234
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	tj@kernel.org,
	mkoutny@suse.com,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 4/6] mm, swap: don't gate xswap on the physical swap free count
Date: Sat,  3 Oct 2026 09:11:09 +0800
Message-ID: <20261003011111.1003090-5-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
References: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Nhat Pham <nphamcs@gmail.com>

An xswap entry is charged only when it gets physical backing, so a
zswap-capable memcg can keep swapping out through xswap even when its
physical swap margin is zero.  mem_cgroup_get_nr_swap_pages() would
otherwise starve anon reclaim with memory.swap.max set to 0.

Return PAGE_COUNTER_MAX when an xswap device is active, zswap is on,
and the memcg allows zswap.  Track active xswap devices in nr_xswap_files,
mirroring nr_real_swapfiles.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/memcontrol.h |  4 ++--
 include/linux/swap.h       |  6 ++++++
 mm/memcontrol.c            | 31 ++++++++++++++++++++++++-------
 mm/swapfile.c              |  2 +-
 4 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index b9072a3c9a2a..be335128806f 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1944,7 +1944,7 @@ static inline void mem_cgroup_calculate_protection_path(struct mem_cgroup *root,
 
 #if defined(CONFIG_MEMCG) && defined(CONFIG_ZSWAP)
 bool obj_cgroup_may_zswap(struct obj_cgroup *objcg);
-bool mem_cgroup_may_zswap(struct mem_cgroup *memcg, bool may_flush);
+bool mem_cgroup_may_zswap(const struct mem_cgroup *memcg, bool may_flush);
 void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size);
 void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size);
 bool mem_cgroup_zswap_writeback_enabled(const struct mem_cgroup *memcg);
@@ -1954,7 +1954,7 @@ static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
 	return true;
 }
 
-static inline bool mem_cgroup_may_zswap(struct mem_cgroup *memcg, bool may_flush)
+static inline bool mem_cgroup_may_zswap(const struct mem_cgroup *memcg, bool may_flush)
 {
 	return true;
 }
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 745606f23e62..ebcbb92849b7 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -390,6 +390,12 @@ void free_pages_and_swap_cache(struct encoded_page **, int);
 /* linux/mm/swapfile.c */
 extern atomic_long_t nr_swap_pages;
 extern atomic_t nr_real_swapfiles;
+extern atomic_t nr_xswap_files;
+
+static inline bool xswap_enabled(void)
+{
+	return atomic_read(&nr_xswap_files) > 0;
+}
 extern long total_swap_pages;
 extern atomic_t nr_rotate_swap;
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index ba13d2a1ead5..2ca39f64c4db 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6126,8 +6126,20 @@ void __mem_cgroup_swap_put(unsigned short id, unsigned int nr_pages)
 
 long mem_cgroup_get_nr_swap_pages(const struct mem_cgroup *memcg)
 {
-	long nr_swap_pages = get_nr_swap_pages();
+	long nr_swap_pages;
 
+	/*
+	 * xswap charges physical backing, not allocation, so virtual swap is
+	 * unbounded for a zswap-capable memcg and the swap.max walk below
+	 * would starve anon reclaim.  swap.max is still enforced when the
+	 * backing is charged.
+	 */
+	if (xswap_enabled() && zswap_is_enabled() &&
+	    (mem_cgroup_disabled() || do_memsw_account() ||
+	     mem_cgroup_may_zswap(memcg, false)))
+		return PAGE_COUNTER_MAX;
+
+	nr_swap_pages = get_nr_swap_pages();
 	if (!mem_cgroup_disabled() && !do_memsw_account())
 		nr_swap_pages = min(nr_swap_pages, page_counter_margin(&memcg->swap));
 
@@ -6333,13 +6345,15 @@ static struct cftype swap_files[] = {
  * spending cycles on compression when there is already no room left
  * or zswap is disabled altogether somewhere in the hierarchy.
  */
-bool mem_cgroup_may_zswap(struct mem_cgroup *memcg, bool may_flush)
+bool mem_cgroup_may_zswap(const struct mem_cgroup *memcg, bool may_flush)
 {
+	const struct mem_cgroup *pos;
+
 	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
 		return true;
 
-	for (; !mem_cgroup_is_root(memcg); memcg = parent_mem_cgroup(memcg)) {
-		unsigned long max = READ_ONCE(memcg->zswap_max);
+	for (pos = memcg; !mem_cgroup_is_root(pos); pos = parent_mem_cgroup(pos)) {
+		unsigned long max = READ_ONCE(pos->zswap_max);
 		unsigned long pages;
 
 		if (max == PAGE_COUNTER_MAX)
@@ -6347,10 +6361,13 @@ bool mem_cgroup_may_zswap(struct mem_cgroup *memcg, bool may_flush)
 		if (max == 0)
 			return false;
 
-		/* Force flush to get accurate stats for charging */
+		/*
+		 * Force flush to get accurate stats for charging. The flush
+		 * only reads the counters, but takes the memcg mutable.
+		 */
 		if (may_flush)
-			__mem_cgroup_flush_stats(memcg, true);
-		pages = memcg_page_state(memcg, MEMCG_ZSWAP_B) / PAGE_SIZE;
+			__mem_cgroup_flush_stats((struct mem_cgroup *)pos, true);
+		pages = memcg_page_state(pos, MEMCG_ZSWAP_B) / PAGE_SIZE;
 		if (pages >= max)
 			return false;
 	}
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 86ab4a86857a..a3d4561566eb 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -284,7 +284,7 @@ static unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
 atomic_t nr_real_swapfiles;
 /* Active xswap devices, as in nr_real_swapfiles. */
-static atomic_t nr_xswap_files;
+atomic_t nr_xswap_files;
 /*
  * Some modules use swappable objects and may try to swap them out under
  * memory pressure (via the shrinker). Before doing so, they may wish to
-- 
2.54.0

