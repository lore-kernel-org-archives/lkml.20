Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706586;
	b=rIBTX0cycTFiwFObQ/fraXmcGybQzTAkQqio54xVoC8ScL0Bwwdxc5BGIN91sFgpsvOj
	 CleZF+MwvrfRyEGiFzDr/kWUvuFdfWJ36Q4H37XW4Ctmarn8Gsgjg59cQ0cz7BgA51vaw
	 7jCyrI7EudNBlvfId+/DDGkgmPOeaNAn63TpPtvx1eR8e8oNUvreDXF9UkN/hh5vvE9Qo
	 gWWYCAsNTUrP2QIBU0wMBVI3jV0HJ4RnuPM6m0ppagmc0YJBaE8CjC+KmmOm7r9SR1X7+
	 VNDv8vU8+3IASAk7fYTRfyr2Zd5JV5GCkoAIM5J/UbASa/m+xVVRLNByVS+W1xeh65A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706586;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gLvjEAADfv0lMkt/oWv0SBDRFtk+jw8902krm/ExS1g=;
	b=kFAWRzX7JolyhNpWCwzsLG6f4QoU/zZHyke066x1L5S5wcHX6OG2LBW5j1nCuczWZYuV
	 lljNeL9Qi/ADr7UGiGnwTyv2GGo6Q0wYFvIOrKz7EPSxxBXzptGeBbs15GFuI3adHiFY1
	 DtTBB5crqQdAu7J4n58gPfaOkKu22UnqWS5bB6Ekwp28SAQqFCMhrhwZJ6Hm03gqehUAn
	 wHcxhiAnSCohBCENPynfa6SCL9rfmf+vwHadzWkU4wVsEXp4F0P6Z2cHFYdwHqDxVLzLk
	 q98R1Np95AVh0WoAW6XDbYkYTDs1EOuhkmTS0wC4tFaRL1blFzB4lf3kPfHUJtvne1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AZU/Dwpe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AZU/Dwpe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628851F031E0;
	Thu, 22 Oct 2026 22:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706585;
	bh=gLvjEAADfv0lMkt/oWv0SBDRFtk+jw8902krm/ExS1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AZU/Dwpep72q0zWTolU+Us8yktbHXnNC/l4mmgiJHwyOoJs02uHtVBOQiL5SDMcco
	 S2BL1DNNRaDtpBxvuORjS+WaSfv1DKqsF7RsMPwawI1g5h0ZPdDrC0KJit1TeuAcuY
	 f+uhjAXuyZIm8faeD2aokYfcQiyZ99N8CiPnaSWUjvf6PRltdksb6fzhe1+88/ohwp
	 b5OEiJdZ9whgLcMGQmGPy658mxqN872PAEjNy+FC5JR9tXykoFzf0KM/Khehs/SMYV
	 x/uey5AGMxt/5RVdVoYgxuTkRc83R20bNqZdFIoXP53GTHk/KhRs1JtY6YHVHVJPX9
	 H7abMqQD3IAeQ==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: hui.zhu@linux.dev,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org,
	ljs@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	weixugc@google.com,
	yuanchu@google.com,
	zhuhui@kylinos.cn,
	baoquan.he@linux.dev,
	liuxiang.277@bytedance.com,
	wangzicheng@honor.com,
	lianux.mm@gmail.com,
	kasong@tencent.com,
	liam@infradead.org,
	surenb@google.com,
	mhocko@suse.com,
	rppt@kernel.org,
	zhangbo56@xiaomi.com,
	lyugaofei@xiaomi.com,
	ridong.chen@linux.dev,
	kunwu.chan@gmail.com
Subject: [RFC PATCH v5 10/14] mm/mglru: Run aging when pages are rare outside the youngest gen
Date: Fri, 23 Oct 2026 06:01:59 +0800
Message-Id: <20261022220203.91911-11-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261022220203.91911-1-baohua@kernel.org>
References: <20261022220203.91911-1-baohua@kernel.org>
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

From: lyugaofei <lyugaofei@xiaomi.com>

Run aging when the total number of pages outside the youngest
generation across both types falls below 1/MAX_NR_GENS of the number
of pages in the youngest generation. For extreme swappiness values
such as 1 and 200, also consider the balance of the corresponding
type.

This improves reclaim efficiency, especially at extreme swappiness
values, while reducing system time.

To avoid the overhead of aging, we only allow imbalance-based aging
when the reclaim priority is low enough that we might reclaim the
youngest generation. We also limit it to once per priority.

Signed-off-by: lyugaofei <lyugaofei@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 65 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 9 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 39f77a68be37..e8eeeeb76282 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4346,10 +4346,21 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
 	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
 }
 
+static inline unsigned long lruvec_gen_size(struct lru_gen_folio *lrugen,
+		int type, unsigned long seq)
+{
+	int gen = lru_gen_from_seq(seq);
+	unsigned long size = 0;
+
+	for (int zone = 0; zone < MAX_NR_ZONES; zone++)
+		size += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
+	return size;
+}
+
 static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
 				  unsigned long nr[])
 {
-	int gen, type, zone;
+	int type;
 	unsigned long seq;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	DEFINE_MAX_SEQ(lruvec);
@@ -4359,11 +4370,8 @@ static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
 	nr[LRU_GEN_FILE] = 0;
 
 	for_each_evictable_type(type, swappiness) {
-		for (seq = min_seq[type]; seq <= max_seq; seq++) {
-			gen = lru_gen_from_seq(seq);
-			for (zone = 0; zone < MAX_NR_ZONES; zone++)
-				nr[type] += max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
-		}
+		for (seq = min_seq[type]; seq <= max_seq; seq++)
+			nr[type] += lruvec_gen_size(lrugen, type, seq);
 	}
 }
 
@@ -5228,8 +5236,41 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	return scanned;
 }
 
+static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
+		int swappiness)
+{
+	unsigned long youngest[ANON_AND_FILE] = {0}, old[ANON_AND_FILE] = {0};
+	struct lru_gen_folio *lrugen = &lruvec->lrugen;
+	DEFINE_MAX_SEQ(lruvec);
+	DEFINE_MIN_SEQ(lruvec);
+	int type;
+
+	for_each_evictable_type(type, swappiness) {
+		unsigned long seq;
+
+		youngest[type] = lruvec_gen_size(lrugen, type, max_seq);
+		for (seq = min_seq[type]; seq < max_seq; seq++)
+			old[type] += lruvec_gen_size(lrugen, type, seq);
+	}
+
+	/* the vast majority of pages sit in the youngest gen */
+	if (youngest[LRU_GEN_ANON] + youngest[LRU_GEN_FILE] >
+	    (old[LRU_GEN_ANON] + old[LRU_GEN_FILE]) * MAX_NR_GENS)
+		return true;
+
+	/* Swappiness extremes: the corresponding type matters */
+	if (swappiness == MIN_SWAPPINESS + 1)
+		return youngest[LRU_GEN_FILE] > old[LRU_GEN_FILE] * MAX_NR_GENS;
+
+	if (swappiness == MAX_SWAPPINESS)
+		return youngest[LRU_GEN_ANON] > old[LRU_GEN_ANON] * MAX_NR_GENS;
+
+	return false;
+}
+
 static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
-			     struct scan_control *sc, int swappiness)
+			     struct scan_control *sc, int swappiness,
+			     bool do_balance)
 {
 	DEFINE_MIN_SEQ(lruvec);
 
@@ -5242,7 +5283,11 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 		return false;
 
 	/* better to run aging even though eviction is still possible */
-	return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq;
+	if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq)
+		return true;
+
+	/* run aging when folios outside the youngest gen are rare */
+	return do_balance && lru_gen_imbalanced(lruvec, sc, swappiness);
 }
 
 static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
@@ -5328,6 +5373,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	bool need_rotate = false, should_age = false;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	bool do_balance = (sc->priority <= DEF_PRIORITY / 2);
 
 	/*
 	 * Proactive reclaim initiated by userspace for anonymous memory only.
@@ -5352,11 +5398,12 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 			break;
 		}
 
-		if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
+		if (should_run_aging(lruvec, max_seq, sc, swappiness, do_balance)) {
 			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
 				need_rotate = true;
 			should_age = true;
 		}
+		do_balance = false;
 
 		if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH))
 			break;
-- 
2.34.1

