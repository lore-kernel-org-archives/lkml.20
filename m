Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686965;
	b=UU038iFsT22GAT4+lwbg+X/+Doo5Y5/JQd7nwH9n+fLiDN2o9ulsAxnkKrepMvZS2ci3
	 lmBuDMEu2Kd0sou0XyZ/yZbgByAZBhFDbhEE17NgeUCNUVrKwn49yxwXW4Bx2oXQI0c1s
	 iZaIdMTR+ODw5Va6Wd9LexxBwUIzt0fNM4ID3Bjy1+SrPWF5MbUjj7C3U04xXSTpqotCN
	 CaHqhi+ojWxLqmkTbwF9X+vjyS2j9kGYJQKc6YXJpDAcy8Pz5EAr2jmNUzHZwlEyrQpUq
	 8V5VHFaC2ZUu3DJ1ExGVl2gsQ03pJXI5uuDsWR5j6rdYSskY0szzumGvWMT13XZexXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686965;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HRcpUSkaTGFusb8WYfKLGOCKCHkeuMV1gCxvZ8tkSNI=;
	b=wB6U+Sd9QpAMIawewk57vIRGnDRIQ1eatIFkujuWr/n7LYKy7Iv6mcJmKFr6iSRMWKnT
	 Sqc4VqbdVS4Hoq4F8zcXYLfeNG5HBLfP2ECArXYm8fzXcOOFr2QEOMksx8qpY4kd70xiN
	 Iimhs4OB5kH7VXe1mR8OvNxcNZpKbHDAB3rLydXfr9eVRg4KmvoKr1Q94xPuBbgyJvO7U
	 HO5pFya+alKvAFleYuF0UR9UrUwMGUyi7BzZScqv/tDzWJurrXQybzXUxKUO1UeIucHuR
	 NCjc8kDub/twsFd0hS68fzvrrBuNt06QQzlcqOHmff2NwPunHnRvFjDWERVoYC32Ruw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APvIUpf9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D7606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APvIUpf9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B565D1F000CD;
	Sat, 14 Nov 2026 20:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686965;
	bh=HRcpUSkaTGFusb8WYfKLGOCKCHkeuMV1gCxvZ8tkSNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=APvIUpf97hLW+cfZUgdzZ7skBUDgnzIm8VzCxMvgD7kcmjnUXN/smOJRfjlRGnkmA
	 G/JU1vC8vD/8u4ZTV4JQ92vLqhBBe3HissKpK9tLrJsPPoWeRLh0oMzsqP7N7uPqyd
	 h0aE0CCB+op1kgwibUfuroGo/Ze85w/8u3WyS6VsY0WVfelcJmb+2TzX+63lnkV0fK
	 ipQwbBuljZWpI3wuWhuICxsdWs4G2/a44mak9leZaGgMGfKKXxjcKKih1gQU3CNv40
	 /2vj0w3gqjTB0TNnwd/FdMMb4gQS0usIQY1SBBKt105rAb8ck0DtTftxKXIDJGKcYP
	 5HSZYQP/YiMMA==
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
Subject: [PATCH v9 14/16] mm/mglru: Avoid prolonged anon reclaim with swappiness=200
Date: Sun, 15 Nov 2026 04:08:01 +0800
Message-Id: <20261114200803.23129-15-baohua@kernel.org>
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
index 6cb905162cba..abefd91f5b95 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4898,8 +4898,8 @@ static int get_tier_idx(struct lruvec *lruvec, int type)
  * We don't calculate the scan cost. MGLRU uses lazy promotion, which will
  * cancel the scan budget naturally.
  */
-static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
-		unsigned long total_scan, unsigned long nr[])
+static void lru_gen_balance_scan(struct lruvec *lruvec, struct scan_control *sc,
+		int swappiness, unsigned long total_scan, unsigned long nr[])
 {
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	u64 refault_rate[ANON_AND_FILE], anon_factor, file_factor;
@@ -4956,7 +4956,12 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
 	file_weight = nr[LRU_GEN_FILE] + nr[LRU_GEN_ANON] / size_bias;
 
 	anon_factor = (u64)swappiness * refault_rate[LRU_GEN_FILE] * anon_weight;
-	file_factor = (u64)(MAX_SWAPPINESS - swappiness) * refault_rate[LRU_GEN_ANON] * file_weight;
+	if (swappiness == MAX_SWAPPINESS)
+		file_factor = sc->priority < AGING_PRIORITY ?
+			      refault_rate[LRU_GEN_ANON] * file_weight : 0;
+	else
+		file_factor = (u64)(MAX_SWAPPINESS - swappiness) *
+			      refault_rate[LRU_GEN_ANON] * file_weight;
 
 	/* Cross-multiply the ratio above. */
 	anon_scan = mul_u64_u64_div_u64(total_scan, anon_factor, anon_factor + file_factor);
@@ -5144,7 +5149,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 
 	total = apply_proportional_protection(memcg, sc, total);
 	total >>= sc->priority;
-	lru_gen_balance_scan(lruvec, swappiness, total, nr_to_scan);
+	lru_gen_balance_scan(lruvec, sc, swappiness, total, nr_to_scan);
 }
 
 static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
@@ -5910,7 +5915,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 			return 0;
 
 		lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan, sc->reclaim_idx + 1);
-		lru_gen_balance_scan(lruvec, swappiness,
+		lru_gen_balance_scan(lruvec, sc, swappiness,
 				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
 
 		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH, NULL))
-- 
2.39.3 (Apple Git-146)

