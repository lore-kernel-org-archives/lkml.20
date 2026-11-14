Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686955;
	b=FsPT8uMoH2BpRMU6ST3BdHKJ8Wc8uBex+i3z7yioFs49/sFs2lgd1Ar8qPBH6MDxCCGY
	 3TvRR97Q+Qibu4exFyo8WeKKexwp50l2uE5bt6Bad2yWy+1lXKvJadVcqa4q0+Dvb++UK
	 prr68ekM25W2ve8rZJ/jOhJOKjoDbHb4DH1d30iMaGNfREttYcJzYdkqZr486SqvUIrUH
	 qLkOv1v6P0yX66goqoCo8tm+jN1POHbhqiiR6qWLbmvu0E3VaAAWZpV48c8mIt1VYlz2+
	 kVWwxvyx4w62/x1ksfBNn6iDCkZ6B1Ejx6Ur9piip+b7qYRybEZn4ipHG4X6I3EVtSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686955;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uIRwXEY8t6lxZie5eRJ2gJ12wOqgQ5rH5E9FXBP912I=;
	b=VMo0sAdBOdPRZhJyQ646/oJhn0fIMw7TM/X6/38diWPZkkWZBW7ypBndJido5+fOKaoi
	 wSJk289vmkfJzdsJvZ4AQNzIw0ehzDszVEiMnox+KK+xwk06npYLaGmMU8dKmyzxqwJdz
	 wV23V7xMSQg4uLkICxIHPlMcBmJLfNL6zdKZEZvJ+MREzH6gWr8G0dBYzAZqOjlEHMveT
	 b9EI+0llRxGUjbeORcQDlDz0IEZXXAgEiHc3FrgAkqeJ8Oxl/wfZA8FbqYTkJZN1LPoas
	 VKkMmAbze2UruLPVDWl62N/BJxxxQ9znGoEK/LUBgrMtpWDrlx4xKMYIwz81kqb7aVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEMY2NSM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D1606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEMY2NSM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769201F000C9;
	Sat, 14 Nov 2026 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686955;
	bh=uIRwXEY8t6lxZie5eRJ2gJ12wOqgQ5rH5E9FXBP912I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jEMY2NSMQuKsUV0FCMZPZQChvPBUaiY29GE2Gvoyn3ga9XETKYhFFTXzmGmVg3RQ1
	 /w/24t9blmKo2IURjQJhXNkJ2A5jwyWcbXZtlGM6mqkddGchzavRXCW15jJvfitnMO
	 UPqVPPaFPDh+3qH8csqVHQCT4zLhqCv+WhkhXih1lAGnfXu9g2VQI5SO/vE78k3/sV
	 Jfv3RRsWSnOltMRlPGsZX5KvspN01ilxlGqEI95wDgS+9W2ifMxSO2E8My8p4rf/0k
	 /dbKJLP74qtzIQrG1lUcneeKkaZ9CAfXOjuutRbdBf22sm9LKMVl21wyWSU5xzwOAF
	 +mO86AUdWYd7w==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-kernel@vger.kernel.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn,
	sidchintamaneni@gmail.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [PATCH v9 12/16] mm/mglru: Restrict eviction accounting to eligible zones
Date: Sun, 15 Nov 2026 04:07:59 +0800
Message-Id: <20261114200803.23129-13-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261114200803.23129-1-baohua@kernel.org>
References: <20261114200803.23129-1-baohua@kernel.org>
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

For both lruvec_evictable_size() and lru_gen_imbalanced(),
only count eligible zones up to sc->reclaim_idx. This avoids
overestimating the number of pages available for scanning and
allows aging to proceed more promptly when eligible zones
contain few folios.

lru_gen_age_node() uses lruvec_is_reclaimable() to determine
whether any memcg has generations old enough to reclaim under
min_ttl. If none are reclaimable, it may trigger OOM. However,
lruvec_is_reclaimable() also uses lruvec_is_sizable() to
estimate the LRU size.

Previously, lruvec_is_sizable() counted folios across all zones.
With accounting now restricted to zones up to sc->reclaim_idx,
the estimated size may be significantly smaller, potentially
leading to premature OOM.

To avoid this and simplify the implementation, allow
lru_gen_age_node() to count folios from all zones.

Note that min_ttl currently has several issues and does not
work as expected.

First, reclaim does not enforce min_ttl on a per-memcg basis,
so folios from memcgs whose generations are all younger than
min_ttl can still be reclaimed.

Second, the LRU size check is coupled with the min_ttl check,
which can lead to premature OOM. For example, consider a system
with 100 memcgs, each containing fewer than 16 MB of evictable
folios. At priority 12, shifting each memcg's LRU size by
sc->priority can yield zero, causing all memcgs to be considered
unreclaimable even if their generations are older than min_ttl.

These issues should be addressed in a separate patch series
rather than as part of this eviction accounting change.

Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/trace_vmscan.h |  4 ++--
 mm/vmscan.c       | 27 +++++++++++++++------------
 mm/vmscan.h       |  7 ++++---
 3 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/mm/trace_vmscan.h b/mm/trace_vmscan.h
index 565c56428364..9dafdb5bd3ce 100644
--- a/mm/trace_vmscan.h
+++ b/mm/trace_vmscan.h
@@ -488,9 +488,9 @@ TRACE_EVENT(mm_mglru_aging,
 			unsigned long seq = max_seq - MAX_NR_GENS + 1 + i;
 
 			__entry->nr_anon[i] =
-				lruvec_gen_size(lrugen, LRU_GEN_ANON, seq);
+				lruvec_gen_size(lrugen, LRU_GEN_ANON, seq, MAX_NR_ZONES);
 			__entry->nr_file[i] =
-				lruvec_gen_size(lrugen, LRU_GEN_FILE, seq);
+				lruvec_gen_size(lrugen, LRU_GEN_FILE, seq, MAX_NR_ZONES);
 		}
 		__entry->nid = lruvec_pgdat(lruvec)->node_id;
 		__entry->priority = sc->priority;
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6d942f192e63..c9e22a5cbb51 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4207,8 +4207,9 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
 	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
 }
 
-static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
-				  unsigned long nr[])
+static void lruvec_evictable_size(struct lruvec *lruvec, struct scan_control *sc,
+				  int swappiness, unsigned long nr[],
+				  int max_zone)
 {
 	int type;
 	unsigned long seq;
@@ -4221,16 +4222,17 @@ static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
 
 	for_each_evictable_type(type, swappiness) {
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
-			nr[type] += lruvec_gen_size(lrugen, type, seq);
+			nr[type] += lruvec_gen_size(lrugen, type, seq, max_zone);
 	}
 }
 
-static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
+static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc,
+		int max_zone)
 {
 	unsigned long total, sizes[ANON_AND_FILE];
 	int swappiness = get_swappiness(lruvec, sc);
 
-	lruvec_evictable_size(lruvec, swappiness, sizes);
+	lruvec_evictable_size(lruvec, sc, swappiness, sizes, max_zone);
 	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	/* whether the size is big enough to be helpful */
@@ -4249,7 +4251,8 @@ static bool lruvec_is_reclaimable(struct lruvec *lruvec, struct scan_control *sc
 	if (mem_cgroup_below_min(NULL, memcg))
 		return false;
 
-	if (!lruvec_is_sizable(lruvec, sc))
+	/* counting all zones to avoid premature OOM */
+	if (!lruvec_is_sizable(lruvec, sc, MAX_NR_ZONES))
 		return false;
 
 	gen = lru_gen_from_seq(evictable_min_seq(min_seq, swappiness));
@@ -5099,9 +5102,9 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 	for_each_evictable_type(type, swappiness) {
 		unsigned long seq;
 
-		youngest[type] = lruvec_gen_size(lrugen, type, max_seq);
+		youngest[type] = lruvec_gen_size(lrugen, type, max_seq, sc->reclaim_idx + 1);
 		for (seq = min_seq[type]; seq < max_seq; seq++)
-			old[type] += lruvec_gen_size(lrugen, type, seq);
+			old[type] += lruvec_gen_size(lrugen, type, seq, sc->reclaim_idx + 1);
 	}
 
 	/* the vast majority of pages sit in the youngest gen */
@@ -5136,7 +5139,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 {
 	unsigned long total;
 
-	lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
+	lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan, sc->reclaim_idx + 1);
 	total = nr_to_scan[LRU_GEN_ANON] + nr_to_scan[LRU_GEN_FILE];
 
 	total = apply_proportional_protection(memcg, sc, total);
@@ -5323,7 +5326,7 @@ static int shrink_one(struct lruvec *lruvec, struct scan_control *sc)
 	if (need_rotate)
 		return MEMCG_LRU_YOUNG;
 
-	if (lruvec_is_sizable(lruvec, sc))
+	if (lruvec_is_sizable(lruvec, sc, sc->reclaim_idx + 1))
 		return 0;
 
 	/* one retry if too small */
@@ -5853,7 +5856,7 @@ static int lru_gen_seq_show(struct seq_file *m, void *v)
 			char mark = full && seq < min_seq[type] ? 'x' : ' ';
 
 			seq_printf(m, " %10lu%c",
-				   lruvec_gen_size(lrugen, type, seq), mark);
+				   lruvec_gen_size(lrugen, type, seq, MAX_NR_ZONES), mark);
 		}
 
 		seq_putc(m, '\n');
@@ -5906,7 +5909,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 		if (sc->nr_reclaimed >= nr_to_reclaim)
 			return 0;
 
-		lruvec_evictable_size(lruvec, swappiness, nr_to_scan);
+		lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan, sc->reclaim_idx + 1);
 		lru_gen_balance_scan(lruvec, swappiness,
 				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
 
diff --git a/mm/vmscan.h b/mm/vmscan.h
index c6b583fc7493..c2cea36289f3 100644
--- a/mm/vmscan.h
+++ b/mm/vmscan.h
@@ -117,14 +117,15 @@ struct scan_control {
 };
 
 #ifdef CONFIG_LRU_GEN
-/* The number of pages of @type in the generation @seq, summed over all zones */
+/* Number of pages of @type in generation @seq below @max_zone */
 static inline unsigned long lruvec_gen_size(struct lru_gen_folio *lrugen,
-					    int type, unsigned long seq)
+					    int type, unsigned long seq,
+					    int max_zone)
 {
 	int gen = lru_gen_from_seq(seq);
 	unsigned long size = 0;
 
-	for (int zone = 0; zone < MAX_NR_ZONES; zone++)
+	for (int zone = 0; zone < max_zone; zone++)
 		size += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
 
 	return size;
-- 
2.39.3 (Apple Git-146)

