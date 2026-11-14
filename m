Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686945;
	b=yk9kAy4U+X1Zu9tiUOAD27hW0nmEm4zVUBZtJ6J39O2ZRoT+u7uUvMhkpO0jkhHS+U45
	 HSCgj45kkeDV+wlPgsRQsz2DN3qgcoViYB/UU2DT5y2jkUh+j8qzkhUY4KftVii/z+qRf
	 tDuYL4F/5bTqk9zTHUVUs8LwRqZLJDuGEVRhdN0CUj/OuqKjkveWSn629fMXTn2rWMqYZ
	 9Bkx3EA5OpKi7pW4pT9VgpJyQdSAIexzncxUZCwRWE4U7/nA0en/w8JtvX4amRx6kRLNK
	 nR1TqYiz4sHnxunQuB+Dnr4TJOlF7Lhjles6V/WQmf1eQgi+FLBUJP+KB9NOgLYwHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686945;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=c/ndpLLRDbznk6v7ZrvYi9tlyPUMaUAwwpffbug2sIM=;
	b=JkjURjiuASOcShQCHk+VME9dc1uUoyvkVZ6/M7p9k0U3KVQBPhFxvlyMjjtMivozL/X8
	 W4JGth4mXSZrfeIPvzZ08hAmFcof4P3QTpH7k3tqVsAH1qiSDBKuV6nfMKBMISJiTRApW
	 halXn0+9UXSrG7oKlQxRS6gpqjO93pADKRtz28ZYKZHyBOWKYTuZ4XyxLXcIN6un4RWZ9
	 LzkjsnsDiDhHjGfGlHTkOHXzh4NYykoUhU7uIJfo7W+PKIDMZXoyoMYFsEfTT5LtQbMIn
	 QaEuy6mo0lLqHNGEsR5W8sp4jWdOTrUjPK5YpVvWD1cbcnjbq49RqMw7nHjaOa/AgyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VvAVL/1R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B2F606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvAVL/1R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97B11F000C7;
	Sat, 14 Nov 2026 20:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686944;
	bh=c/ndpLLRDbznk6v7ZrvYi9tlyPUMaUAwwpffbug2sIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VvAVL/1RkU+XlN1/eHqWsigVeg4ge3l7d/HGr98ip/dc2LOid9j/8OxZ/QK3brEHG
	 k7C8xOYk6qzhloys2wHqy5lwapCQOBVWxltKNw175pUjJXsRDykd/ISncuY1bGJw+g
	 Ypak8HohuM0qC0BbQJSsl8sokIM5lle2f4r080wRCaFU/ezXQY68GgcPz0DRHSj/PU
	 5/iRzzOiJiyKAMeVtorlkPoZRG7W7JK3ljtFLkrEWxDg850l+c5rq7i2lBB7w2mfLn
	 xinApyKZYFRjy9xWwky8e2Nivw3TzNc+Uqz1dpoZVWRXwInlqmgv6hKtK8vZJob6UK
	 PB1TfyvM3r1Ew==
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
Subject: [PATCH v9 10/16] mm/mglru: Run aging when pages are rare outside the youngest gen
Date: Sun, 15 Nov 2026 04:07:57 +0800
Message-Id: <20261114200803.23129-11-baohua@kernel.org>
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

From: Gaofei Lyu <lyugaofei@xiaomi.com>

Run aging when the total number of pages outside the youngest
generation across both types falls below 1/MAX_NR_GENS of the number
of pages in the youngest generation. For extreme swappiness values
such as 1 and 200, also consider the balance of the corresponding
type.

This improves reclaim efficiency, especially at extreme swappiness
values, while reducing system time.

To avoid the overhead of aging, we only allow imbalance-based aging
when the reclaim priority is low enough that we might reclaim the
youngest generation.

Signed-off-by: Gaofei Lyu <lyugaofei@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 0fef966b0a14..1450542d709c 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2743,6 +2743,8 @@ static bool should_clear_pmd_young(void)
 #define get_memcg_gen(seq)	((seq) % MEMCG_NR_GENS)
 #define get_memcg_bin(bin)	((bin) % MEMCG_NR_BINS)
 
+#define AGING_PRIORITY	(DEF_PRIORITY / 2)
+
 static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
 {
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
@@ -4780,7 +4782,7 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 	 */
 	if (sc->priority == DEF_PRIORITY)
 		seq = lrugen->max_seq - MIN_NR_GENS;
-	else if (sc->priority > DEF_PRIORITY / 2)
+	else if (sc->priority > AGING_PRIORITY)
 		seq = lrugen->max_seq - 1;
 	else
 		seq = lrugen->max_seq;
@@ -5073,6 +5075,40 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
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
+	if (sc->priority > AGING_PRIORITY)
+		return false;
+
+	/*
+	 * Round up or down corner swappiness, to balance the heavy biased
+	 * type better
+	 */
+	if (swappiness == MIN_SWAPPINESS + 1)
+		swappiness = MIN_SWAPPINESS;
+	else if (swappiness == MAX_SWAPPINESS)
+		swappiness = MAX_SWAPPINESS + 1;
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
+	return youngest[LRU_GEN_ANON] + youngest[LRU_GEN_FILE] >
+	       (old[LRU_GEN_ANON] + old[LRU_GEN_FILE]) * MAX_NR_GENS;
+}
+
 static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 			     struct scan_control *sc, int swappiness)
 {
@@ -5087,7 +5123,11 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 		return false;
 
 	/* better to run aging even though eviction is still possible */
-	return evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq;
+	if (evictable_min_seq(min_seq, swappiness) + MIN_NR_GENS == max_seq)
+		return true;
+
+	/* run aging when folios outside the youngest gen are rare */
+	return lru_gen_imbalanced(lruvec, sc, swappiness);
 }
 
 static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
-- 
2.39.3 (Apple Git-146)

