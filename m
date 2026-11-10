Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342087;
	b=E+GlwP8rIyCxRlsQ8Dlq1U/JoCs46eEtMxJUvSsWCQ+qD5xeK14M885ryAW6Z+lUpoHi
	 WbAQJRMDHaaDMb8cSxZUqaDwDxyDuFXaGap4jueZZipw4VR17i4SYqi3pW3LlT1tnqGTz
	 5NFqIBU7rXXEyPS77jt2GatIIdQjoX5hypaMPd0TRC862o3k4IGlYdt5ARyuwtV0OW9fa
	 zyt526wC8vLtn2PJhWvhgKWYE+P4/saa8B5HbrUNt2AEeLum++AE3TphV6X6DnbnoNrkH
	 VH3bl/xgNUhHP3lsYdOIuFfQaYW6F4DIF3n/r+nC/O5sty973kJsws1mU6VbRubk3yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342087;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AiZ7N6GU02U+o9iesZbyf8ratkWg+EWsdL11fnyuYU8=;
	b=te7aptToifAiaziWPhiWO0NMsztwzJ6HXHJpKnEceaRA4Gm2T8iYSCOZGC6M/SiZ6BK8
	 WmC+RkNkMP0Yhi3rdcy2VeIKZPEHliXVpTZtLEYarb3YApLOaDD3ZCw9An97uf2LmKaaS
	 RGBVfmrraUtC1LseIYQEi7NEaxrKag80rcBJKQAJrBaquOzpN7FKmavNsEKiDzFj8bEZP
	 UehSkYrfnMt8AVlNjK5qZBAztNmuSY5FjQSBU+dOwudahsCWFCE3jj80MeaBEK9CmTlSX
	 s9MvTsWe/x19h95mxCHRWsahqRwY935V65IsuLiWSHwFZtwq+O7NhY28NN7GHjJTeBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQfpZpJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE93606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQfpZpJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F56A1F008A1;
	Tue, 10 Nov 2026 20:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342087;
	bh=AiZ7N6GU02U+o9iesZbyf8ratkWg+EWsdL11fnyuYU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GQfpZpJDF5NPDaWm5L0da6tQj33/hECXNWhj2Z8APnZoHS2nsmjGCgeYvP3O+FqnD
	 PpbL6c/NCc9ulYh6r8/eTyb7O9JytaP9NkxmD5unJUPv1SZVRakV5iITHyDbCtfRxn
	 MHwlyplZPfzDZxJzcHfBL4G5sarT6b1swJVj/HOtLDTtRieozKqrjLQ9mp6Fl/AXZ4
	 d6VOTv57FKYCINNCi6vGIuwWmFjK+ZHsxf6t6LdRxl2kMtX62bOHBEJGKzD4EU0b6j
	 dIcH6cH6LujqTdjhACz1XpeX7PoyTknXYnXBdoNwFnXMu5v/sNO8N7ljsS9gQ7OXzy
	 VXIhweELWI+CA==
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
	Barry Song <baohua@kernel.org>
Subject: [PATCH v6 10/15] mm/mglru: Run aging when pages are rare outside the youngest gen
Date: Wed, 11 Nov 2026 04:20:20 +0800
Message-Id: <20261110202025.25736-11-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261110202025.25736-1-baohua@kernel.org>
References: <20261110202025.25736-1-baohua@kernel.org>
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
 mm/vmscan.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index bde67da7db57..8014a90e4bc2 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5068,8 +5068,41 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
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
 
@@ -5082,7 +5115,11 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
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
@@ -5168,6 +5205,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	bool need_rotate = false, should_age = false;
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
+	bool do_balance = (sc->priority <= DEF_PRIORITY / 2);
 
 	/*
 	 * Proactive reclaim initiated by userspace for anonymous memory only.
@@ -5192,12 +5230,13 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 			break;
 		}
 
-		if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
+		if (should_run_aging(lruvec, max_seq, sc, swappiness, do_balance)) {
 			trace_mm_mglru_aging(lruvec, sc, swappiness);
 			if (try_to_inc_max_seq(lruvec, max_seq, swappiness, false))
 				need_rotate = true;
 			should_age = true;
 		}
+		do_balance = false;
 
 		if (!evict_folio_lists(nr, lruvec, sc, swappiness, MIN_LRU_BATCH))
 			break;
-- 
2.34.1

