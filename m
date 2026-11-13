Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596205;
	b=WheVy5OfXLA3OjE58YFSj3zsCuNbHyfPnHz/5P6N50ompnP+G2xHN5EA1VBbhtKthM0c
	 yb5H0FJlwpI04zxmWA1gvFwAW4r8/Qk6dKkRc3I7HCziXF7bMUrhvYkMFAuPpxV1b2MZe
	 lwlQU3tVBeL6/M0TPyfyJHCKyLvmf2ArSCQxC13/HXSKzsx0ZZeE0Ih5sipjz9UOblj/x
	 ULxaKdWAHzDtM2yE1/X0To+A/b5p/hS25XEh1MtZNkEz2NfMouQ6bigtjSggSZiBnHszp
	 Mq/ZAjU1kPBewsolUzA7Pm3KawzTuuA4SrP/m5KUCV3sQbgjatLjqE90m2TBF8v8NDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596205;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UwDbN1ot1ctIjPl8+wDFKVVJfwEO25eR5Kqm0MHFTag=;
	b=Finzj0jNWnImwV4+GoBr3izRIEnuV8Y+cGP97qVZYTYStW8Pe9viPXkjdt7N14lqjz9g
	 ca+MJEzO9UWdiaSgWfPoY/d8WJqk6xEEmchFrHY01MD793DIiPOjQjq+823yqUtlNHD+X
	 fMerXykMyQbg7LxlnikvShwf+OUg3DMuci+wZO1dVyGlvww2y7G5+PMvFaOFvYWFgfrGU
	 8TmioBwMLXRbrtC/W4wwStJZXnwZ30Eqq8c7RRNBsGbUhdJV/esBD7B5LWQ1Ga90GDdB0
	 gjWtN6atz9veb5kyyUP5Mv8gvHxE3SWd2U6B1oT628jIvCfhowpB4j4AY8CYJi8k9Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/G/yeo8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43349606B2E9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/G/yeo8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DDB1F000C8;
	Fri, 13 Nov 2026 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596204;
	bh=UwDbN1ot1ctIjPl8+wDFKVVJfwEO25eR5Kqm0MHFTag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H/G/yeo8k4o8R6b59GQ/duO2ACA4Xo0LrB+SdVheP/1sMYcYRxEb3/BGXXGKDp5KP
	 P1Vso85yxB+MDZvwBshmZxjZZiyRdRY2UkDdZqGMpo5PWTyMN8BdJrMIbT3Thu2eGF
	 tl3YUP/F7hbbdD1R59yjl4wByMoFVwo+kKLqFcfndGYBwUXLp4Lajawub3YIGseiRN
	 YCYWdUTQ1AbdJ587s2g+ZR81kLKv5NSa5BAXDpzoRUqCGVVHZvxvfcWRS1xEOnHXL2
	 +OQpplN1HJIdo4/sffCHdO7evu+IZF3XmAODn3K9Af7hpnMRw7zc7DlRY/nZKvYII3
	 c1dFagW0IQnCQ==
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
Subject: [PATCH v8 11/16] mm/mglru: Run aging when one type has no populatable folios
Date: Sat, 14 Nov 2026 02:55:36 +0800
Message-Id: <20261113185541.70203-12-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261113185541.70203-1-baohua@kernel.org>
References: <20261113185541.70203-1-baohua@kernel.org>
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

We may have scan budget remaining for anon or file but no
folios in populatable generations to scan. In this case,
`scan_folios()` may waste time scanning that type while
the other type still has populatable folios.

Run aging in this case to make more folios populatable.
This also helps respect the scan budget distribution
determined by swappiness.

To avoid excessive aging, allow no-populatable aging only once per
`try_to_shrink_lruvec()` invocation.

With extreme swappiness values such as 1 and 200, reclaim initially
focuses exclusively on the preferred type. In this case, defer aging
the lagging type until `sc->priority` reaches `DEF_PRIORITY / 2`.
This avoids unnecessary aging and has shown better performance in
testing.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 59957fab915b..9071f8889b5c 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5109,7 +5109,8 @@ static bool lru_gen_imbalanced(struct lruvec *lruvec, struct scan_control *sc,
 }
 
 static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
-			     struct scan_control *sc, int swappiness)
+			     struct scan_control *sc, int swappiness,
+			     bool no_populatable)
 {
 	DEFINE_MIN_SEQ(lruvec);
 
@@ -5121,6 +5122,13 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 	if (sc->priority == DEF_PRIORITY)
 		return false;
 
+	/*
+	 * Run aging if scan budget remains but no folios
+	 * in populatable generations are available to scan.
+	 */
+	if (no_populatable)
+		return true;
+
 	/* better to run aging even though eviction is still possible */
 	if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq)
 		return true;
@@ -5208,6 +5216,13 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	bool need_rotate = false, should_age = false;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	/*
+	 * Avoid aging the lagging type under extreme swappiness,
+	 * as reclaim of the unpreferred type is disabled until
+	 * DEF_PRIORITY / 2.
+	 */
+	bool allow_no_populatable_age = (sc->priority <= DEF_PRIORITY / 2) ||
+		(swappiness > MIN_SWAPPINESS + 1 && swappiness < MAX_SWAPPINESS);
 
 	/*
 	 * Proactive reclaim initiated by userspace for anonymous memory only.
@@ -5225,22 +5240,19 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);
 
 	while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
-		DEFINE_MAX_SEQ(lruvec);
+		unsigned long orig_file, orig_anon;
+		unsigned long max_seq;
+		bool no_populatable;
+		long scanned;
 
 		if (mem_cgroup_below_min(sc->target_mem_cgroup, memcg)) {
 			need_rotate = true;
 			break;
 		}
 
-		if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
-			trace_mm_mglru_aging(lruvec, sc, swappiness);
-			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
-				need_rotate = true;
-			should_age = true;
-		}
-
-		if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH))
-			break;
+		orig_anon = nr[LRU_GEN_ANON];
+		orig_file = nr[LRU_GEN_FILE];
+		scanned = evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH);
 
 		if (should_abort_scan(lruvec, sc))
 			break;
@@ -5252,6 +5264,21 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 		if (root_reclaim(sc) && should_age)
 			break;
 
+		/* Limit no_populatable aging to once per try_to_shrink_lruvec() */
+		no_populatable = allow_no_populatable_age &&
+			((nr[LRU_GEN_ANON] && nr[LRU_GEN_ANON] == orig_anon) ||
+			(nr[LRU_GEN_FILE] && nr[LRU_GEN_FILE] == orig_file));
+		allow_no_populatable_age &= !no_populatable;
+		max_seq = READ_ONCE((lruvec)->lrugen.max_seq);
+		if (should_run_aging(lruvec, max_seq, sc, swappiness, no_populatable)) {
+			trace_mm_mglru_aging(lruvec, sc, swappiness);
+			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
+				need_rotate = true;
+			should_age = true;
+		}
+		if (!scanned)
+			break;
+
 		cond_resched();
 	}
 
-- 
2.39.3 (Apple Git-146)

