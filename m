Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596154;
	b=RoC7uR+xKQQj66p43nkJGNny5ulvWcWPkxj1iQ8fU7eVrOmuYtPscXL/XwxFQdkW+e1Z
	 9THXybAafhULPCBWJtJIx+Vn1tAkXNKGk9mBlHMycXFvf6k2p1puiQtL4poAMiS16ygZN
	 I7kDevpcvzH55cfn0mc1uZNSH1sTYEn82zOi0zxgVJ8Ko7E/xcomTawLBHpX6wCTgvsH1
	 DVBiLs54I+9LmIbeO/36sTlF+T3yZQ61i8CUCPYuJO4e+MlXHL5JG2tEEFdKeNHpNb0aa
	 qFUAX/Sc6zVzZOpo77H/7ZNSYmTE2h1zVTJwwBrNna3qL7ipmGuH55XcBZ2BokrHwnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596154;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/dKIjKxFlwknpbWJVXX/cmtGsbGxhiJgbgpOqLZNO10=;
	b=xhgw6JW/iQf4yxQGIGlKD/dXlBhEJjb2mtWqMqs9qbl0AGPyYz4IsC7D+4MSxJ+sYWrr
	 nWJ9UShvjjpf0nX1wkJDxhz33i4ROgh7ejaKd0ghjWje0tJE2cqVOlcvCjeHFrXEDEh6i
	 4czutkKmL35ozVdlMTrv0wHm1yhtp68TXR4wSfxx09QJNwRbWGJcm0DO1/snPJxObgeP0
	 ouRDXX0oGq47IJutvJTs181iS1rC6c0C8oyKfU+8C0E59FcS4gzuKgnblo5cRwhEEtTZY
	 +E/BGBLvk/yKr+hQccu6tI7262S1j4N2o9vUoN9QQfYEcYBV1TpJRaiNF4XXafOJ3JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eUzhXTUF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E1960A2602
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eUzhXTUF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230F51F000C5;
	Fri, 13 Nov 2026 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596153;
	bh=/dKIjKxFlwknpbWJVXX/cmtGsbGxhiJgbgpOqLZNO10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eUzhXTUFbXoKr2sBu5psoSFRm1KZwtj4mV4RSQtAChYoF7VdQMKGUNcu4BnPo5X96
	 5GAfliIjUAmjKGNJU4TOuZEvLY/XPmoY0hvy6LDVeKwuXTlczoZByg9gQZdGQDy3XA
	 emo6ethhQEeBB3ZHZGH/sny8QEPKDQbz3DQiXAdUqOM2GrBSSyOaqLOKgFLiIHlYm3
	 mdSQgbZ3caheWyLIQ6W1OjNYkwpoqSEjLBWIvlwXYyRTgn9GHo4npaCHsAAIbm9lbG
	 X+8qRQg+D9PF/MNWvikOyRrS3Ltcel3a6AsPs0SEsgbnsSZ6Hr1Cek+TqxrCBhzhUE
	 wcVqHmKTIAj0A==
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
Subject: [PATCH v8 01/16] mm/mglru: report evictable sizes per type
Date: Sat, 14 Nov 2026 02:55:26 +0800
Message-Id: <20261113185541.70203-2-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

Change lruvec_evictable_size() to return the number of evictable
anonymous and file pages separately instead of a single total, so
that callers can weigh the two types independently.

Update lruvec_is_sizable() and get_nr_to_scan() accordingly; the
summed totals are unchanged, so there is no functional change.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/vmscan.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 46be9c7e967c..400f87fc51e1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4193,28 +4193,31 @@ static void set_initial_priority(struct pglist_data *pgdat, struct scan_control
 	sc->priority = clamp(priority, DEF_PRIORITY / 2, DEF_PRIORITY);
 }
 
-static unsigned long lruvec_evictable_size(struct lruvec *lruvec, int swappiness)
+static void lruvec_evictable_size(struct lruvec *lruvec, int swappiness,
+				  unsigned long nr[])
 {
 	int type;
-	unsigned long seq, total = 0;
+	unsigned long seq;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 
+	nr[LRU_GEN_ANON] = 0;
+	nr[LRU_GEN_FILE] = 0;
+
 	for_each_evictable_type(type, swappiness) {
 		for (seq = min_seq[type]; seq <= max_seq; seq++)
-			total += lruvec_gen_size(lrugen, type, seq);
+			nr[type] += lruvec_gen_size(lrugen, type, seq);
 	}
-
-	return total;
 }
 
 static bool lruvec_is_sizable(struct lruvec *lruvec, struct scan_control *sc)
 {
-	unsigned long total;
+	unsigned long total, sizes[ANON_AND_FILE];
 	int swappiness = get_swappiness(lruvec, sc);
 
-	total = lruvec_evictable_size(lruvec, swappiness);
+	lruvec_evictable_size(lruvec, swappiness, sizes);
+	total = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	/* whether the size is big enough to be helpful */
 	return total >> sc->priority;
@@ -5028,7 +5031,7 @@ static bool should_run_aging(struct lruvec *lruvec, unsigned long max_seq,
 static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 			   struct mem_cgroup *memcg, int swappiness)
 {
-	unsigned long nr_to_scan, evictable;
+	unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
 
 	/*
@@ -5044,7 +5047,8 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 			return 0;
 	}
 
-	evictable = lruvec_evictable_size(lruvec, swappiness);
+	lruvec_evictable_size(lruvec, swappiness, sizes);
+	evictable = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
 
 	nr_to_scan = apply_proportional_protection(memcg, sc, evictable);
 	nr_to_scan >>= sc->priority;
-- 
2.39.3 (Apple Git-146)

