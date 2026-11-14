Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686950;
	b=a7eqofFPO5PSZJUl89KxadvmtMD9CvCJt6vMfz0Gbc2BWqoe/0MXCgsXdbTapkui+0AQ
	 OIl19CXf+z5QoiSHRlCj0LeCiQAR8zi0NRsAq2msn+yrNu0clxJ1NQYM0Cb9Z+YREo78e
	 KWMwRWg/F79XQMreWtaXTcsdid+uTCXsaUOf6iRW2ykkBL/ChHfZCsADhVxuMaUTeNNqb
	 kAcfwXD/L3Jj9vhKVlc1lOIBYg04juRTtqkYhb6Bju9DL/zIG/P6TPwaXNJSyKhvXgRAt
	 Bx49yKlL/yRYAXDf2e9nWirITipgiXLLe3Sqf/goWVJwKbI8klkfj39Tci+QpQK8zEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686950;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j/THqEh73uO5IZ1+KcP40L4GxFwbCOfpeNn99UA8KJ4=;
	b=b5nAz8RwfgroFD2HJmWyEdBybwFYNHZVm9QfJ1BwiH9/hyES5y65gH4T3PAF0yjqJxn6
	 ZD7tC3OYtpC0d0t3LRaGqzYyHY/JfmN0oGQ2QnxOGjo0a2PFwI8Z/LMLdTzc3D+95WE5V
	 vxpWAhU9aLuHKX0B+3ZHXcmTTt/8vsOkKOu8BcZJWj4YBFrfNCWqS87z7YQhZRaoi1QJk
	 9vAb6Y+zutdPVbk0bMg+Rq3TWg6I8uhnN3R/gy8fFgUvuPs0eq6TsJmZf8+I1vsz/1AFW
	 3X3oTlalskaZolUKVWw+7AQ67NbITQjve+LPKnUmPTKWObIqm1IRLBpHgyeVP0f5QZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iyzr08bL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A5606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iyzr08bL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7271F000C4;
	Sat, 14 Nov 2026 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686950;
	bh=j/THqEh73uO5IZ1+KcP40L4GxFwbCOfpeNn99UA8KJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iyzr08bLFQ3J4EKZzrDOjhs3pNLwcIyBS98MmFtslUMoWO10x+Byk3ltevuhZy/vi
	 Tib/re5qNFDRCXF2Nhx/q22C/BKYeVk4GUl4lsjCEMyniw9ZxkHgmABNbD8SJFYGGO
	 fmMqt+kMVIAhMN7Ko7u4pa5ryBVLSXmHRv087fnmT457XeRZCCSeBWU2Dcx05YtFUq
	 ecJTishbOaDhToHB9FtKZKs2SA6MBVHH/j2CFBvm4ch6OFN+Ty5YFU7s/7gcW9jxKL
	 2KHOF2jfFWHoN0s4x5WFjHmqZrbskSDnxeweHzOd2s5VKzLoohdh+HOmkJRkrj+rvq
	 5kDNZuH8SzbEA==
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
Subject: [PATCH v9 11/16] mm/mglru: Run aging when one type is drained
Date: Sun, 15 Nov 2026 04:07:58 +0800
Message-Id: <20261114200803.23129-12-baohua@kernel.org>
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

We may have remaining scan budget for anon or file but no folios
in populatable generations to scan. In this case, `scan_folios()`
may repeatedly scan that type without making progress, even when
the other type still has populatable folios.

Run aging when a type is drained to make more folios available for
reclaim. This also helps honor the scan budget distribution
determined by swappiness.

Move aging after eviction to detect a lack of scan progress and
avoid unnecessary aging when eviction can still make progress.

To avoid excessive aging, allow drained aging only once per
`try_to_shrink_lruvec()` invocation. Also skip drained aging if
another reclaimer has advanced `max_seq` during eviction.

At extreme swappiness values such as 1 and 200, reclaim initially
focuses on the preferred type. Rely on imbalanced aging once
`sc->priority` reaches `DEF_PRIORITY / 2`, rather than triggering
drained aging for the unpreferred type. This avoids unnecessary
aging and has shown better performance in testing.

If `evict_folio_lists()` returns zero, retry eviction once if
`max_seq` has advanced since the aging decision.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 49 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 1450542d709c..6d942f192e63 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5175,7 +5175,8 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
 }
 
 static long evict_folio_lists(unsigned long nr_to_scan[], struct lruvec *lruvec,
-			     struct scan_control *sc, int swappiness, unsigned long max_batch)
+			     struct scan_control *sc, int swappiness,
+			     unsigned long max_batch, bool *drained)
 {
 	int type;
 	unsigned long batch, scanned, total_scanned = 0;
@@ -5191,6 +5192,8 @@ static long evict_folio_lists(unsigned long nr_to_scan[], struct lruvec *lruvec,
 		batch = min(nr_to_scan[type], max_batch);
 		scanned = evict_folios(batch, lruvec, sc, type, swappiness);
 
+		if (drained && !scanned)
+			*drained = true;
 		nr_to_scan[type] -= min(nr_to_scan[type], scanned);
 		total_scanned += scanned;
 	}
@@ -5206,9 +5209,15 @@ static long evict_folio_lists(unsigned long nr_to_scan[], struct lruvec *lruvec,
 static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 {
 	unsigned long nr[ANON_AND_FILE];
-	bool need_rotate = false, should_age = false;
+	bool need_rotate = false, should_age = false, retried = false;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	/*
+	 * Avoid aging the lagging, unpreferred type at extreme swappiness;
+	 * rely on imbalanced aging once priority reaches AGING_PRIORITY
+	 */
+	bool allow_drained_age = sc->priority < DEF_PRIORITY &&
+		swappiness > MIN_SWAPPINESS + 1 && swappiness < MAX_SWAPPINESS;
 
 	/*
 	 * Proactive reclaim initiated by userspace for anonymous memory only.
@@ -5226,22 +5235,17 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	lru_gen_prepare_scan(lruvec, sc, memcg, swappiness, nr);
 
 	while (nr[LRU_GEN_ANON] > 0 || nr[LRU_GEN_FILE] > 0) {
+		bool drained = false, do_drained_age;
 		DEFINE_MAX_SEQ(lruvec);
+		unsigned long new_seq;
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
+		scanned = evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH, &drained);
 
 		if (should_abort_scan(lruvec, sc))
 			break;
@@ -5253,6 +5257,27 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 		if (root_reclaim(sc) && should_age)
 			break;
 
+		/*
+		 * Allow drained aging only once per invocation and skip it if
+		 * max_seq advanced concurrently during eviction
+		 */
+		new_seq = READ_ONCE(lruvec->lrugen.max_seq);
+		do_drained_age = drained && allow_drained_age && max_seq == new_seq;
+		allow_drained_age &= !do_drained_age;
+		if (do_drained_age || should_run_aging(lruvec, new_seq, sc, swappiness)) {
+			trace_mm_mglru_aging(lruvec, sc, swappiness);
+			if (try_to_inc_max_seq(lruvec, new_seq, swappiness, false))
+				need_rotate = true;
+			should_age = true;
+		}
+
+		if (!scanned) {
+			/* Retry once if aging advanced max_seq */
+			if (retried || new_seq == READ_ONCE(lruvec->lrugen.max_seq))
+				break;
+			retried = true;
+		}
+
 		cond_resched();
 	}
 
@@ -5885,7 +5910,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 		lru_gen_balance_scan(lruvec, swappiness,
 				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
 
-		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH))
+		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH, NULL))
 			return 0;
 
 		cond_resched();
-- 
2.39.3 (Apple Git-146)

