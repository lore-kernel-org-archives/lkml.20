Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596220;
	b=ZTlSIx+BxJmQRC3l10bbPanVSecG2MHJbzzVHZkkSEvRw7yNHn00cUkTZq7H2qzeov2B
	 JkjxOkfFLvlAYyRvMsA0NcrjQALMYVihi/if+yNtTKrqbOpZ9HbjWsdcQnvo7tVYhiajR
	 np7B5TCzQtpr2CLky9vjraTv24xhP1831Q4/G1qmVGbFl6gpcA947SwKev6fpZyGRB2vc
	 M+WDvPzPB6bV8bAWFZdwCf+V8OWQlL9OtqUtrXKQT6noGHgJA35e0UZJ5gdH4oysfWnwD
	 Fh5peGG8c/suCOD/D/ebdiUYPoN5Jfp0SaV951ShFwke8tk8ARStj2OGo4tX1jbWuKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596220;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=S5jCGWK0mMVJUZnlxb/Lm2+++2Og+50SQZcmUWnLKIY=;
	b=D1RkLSIsp9qde8aeMIQIqnEek7Y2M2ae59qAOkTijCGuA9dbMS24h1FPMBfNSu70NI4O
	 Uko0YRpWTpsZuCL2rnm+DfczL7DuvxbGFfPcQw2Aw1C9lfWDJ02G81BsyKKLyJ16cceqU
	 n74zijZ7lVnqgatQ2GsnUE2kSwOYfNZTZZnRge/iSDprB2l57o02v6bD0nXqUc8pZybZz
	 EfsTEq2HqIlfqHAnMgCtowZpvt6ADwpvVLL85BMZPFp4kNZuSHwvuc8jLe2jrxXkFfSNb
	 a7pZwgh/PKp9VkJJiZQgX/XFCF9slW42jTJFvp/zTWqCoD7DRytXULYG/jcL6GPmkhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSsQEHar;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEA606A8B8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSsQEHar
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2A91F000C4;
	Fri, 13 Nov 2026 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596220;
	bh=S5jCGWK0mMVJUZnlxb/Lm2+++2Og+50SQZcmUWnLKIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hSsQEHarvAkvCU45KeaGeDjcWDMOqt3OZAJvXxoHb+LNXMMCikLCUgF7KeB4Hmmu/
	 fINAm+gwafUcWqYxD60C6gieAY5asMO/WHIqwagOJDD0sYpoDNnob1E9WnJ9d9eAwK
	 opug0lrdGWffL8JQoJSwWKWmCG9kCZx4u0FJ++6jLCQijP/Ry09OAkC1dwK01sArTW
	 JSVXVtA8Hu2P5U+MShtJFIU/zi4NJXZR/JYEJqN+PcNgTV7YzWVOq3w0A0TGMzT+D0
	 Q3GIub7JiUzQo7LBQhjZU9Y4PobLZ/6uKAHSPgHV32FgbCursDerf93GyW1zFOJKgM
	 t3HUS1ujSx6KQ==
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
Subject: [PATCH v8 14/16] mm/mglru: Avoid prolonged anon reclaim with swappiness=200
Date: Sat, 14 Nov 2026 02:55:39 +0800
Message-Id: <20261113185541.70203-15-baohua@kernel.org>
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

From: Gaofei Lyu <lyugaofei@xiaomi.com>

It has been observed that swappiness=200 can significantly slow down
reclaim on some machines, with some workloads running 3x slower
under MGLRU than under CLRU.

This is because swappiness=200 currently results in file_factor=0.
Give file reclaim a small factor at lower priorities, for example,
when sc->priority < DEF_PRIORITY / 2.

Signed-off-by: Gaofei Lyu <lyugaofei@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 2595f3fbe1b6..b1a36dae6da6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4899,8 +4899,8 @@ static int get_tier_idx(struct lruvec *lruvec, int type)
  * We don't calculate the scan cost, MGLRU uses lazy promotion, which will
  * cancel the scan budget natually.
  */
-static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
-		unsigned long total_scan, unsigned long nr[])
+static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
+		int swappiness, unsigned long total_scan, unsigned long nr[])
 {
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
@@ -4957,7 +4957,12 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
 	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
 
 	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
-	file_factor = (u64)(MAX_SWAPPINESS - swappiness) * refault_rate[LRU_GEN_ANON] * file_weight;
+	if (swappiness == MAX_SWAPPINESS)
+		file_factor = sc->priority < DEF_PRIORITY / 2 ?
+			      refault_rate[LRU_GEN_ANON] * file_weight : 0;
+	else
+		file_factor = (u64)(MAX_SWAPPINESS - swappiness) *
+			      refault_rate[LRU_GEN_ANON] * file_weight;
 
 	/* Cross-multiply the ratio above. */
 	anon_scan = mul_u64_u64_div_u64(total_scan, anon_factor, anon_factor + file_factor);
@@ -5154,7 +5159,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 
 	total = apply_proportional_protection(memcg, sc, total);
 	total >>= sc->priority;
-	lru_gen_balance_scan(lruvec, swappiness, total, nr_to_scan);
+	lru_gen_balance_scan(lruvec, sc, swappiness, total, nr_to_scan);
 }
 
 static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
@@ -5914,7 +5919,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 			return 0;
 
 		lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan);
-		lru_gen_balance_scan(lruvec, swappiness,
+		lru_gen_balance_scan(lruvec, sc, swappiness,
 				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
 
 		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH))
-- 
2.39.3 (Apple Git-146)

