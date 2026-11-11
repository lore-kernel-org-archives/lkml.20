Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439644;
	b=5UtLzx2jCQB7IW1UVCwceQTy1To2JtdKWkboFYosCj3m9T1bxnHWZBknj9DR8ZBb+gdY
	 bJEzX/UsUIOdNVgGSLKDJbg+NCq7XLDcsPk846yO6rJHJItGKLaHy1H3OsfMn6R2QkmsL
	 hb7bcJVEe323peDGP8QLxK3A/n+67t+nQgipIe+1eWN1czqNfvzZ9bEIByaKKB8LbB6d2
	 r8veDiEqTAi79QDTKpj/j+XzOtec+YKPr1BAK3i/qCH5Z63pWlo+KIvykePUCmd9bngC+
	 1HiF3u0d1glGax/VxPiCGk+XkS9rtr9ukVnZVRqYa+4/lLEF/M8l4l6avykvZ0NIhNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439644;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zlKFVUc+Cq7/iu4xyn5/uvDHqyvVKC45Z+ABVWfXn4I=;
	b=ixkHoBtzAI5Q1U3f52cP4aQjFK3kY/t2ey+j93olVGnfKvL59bPEL9JmWkoAPCh/4vRe
	 PjoIZbmxWPhxeZv+UM2XojujR6jNO4vx/7dbbXf9QHIloBWbdsz6ndLtQ1guxGW6h1KsA
	 euH3KIKGDPksbrusS8OH0oX6ULAZcKCEH+ZMeo4HOt0/hPl9uR9YYaVNVbT+oVWEdO9Sq
	 A/DkFFdj8Ex2+qGXBYHyALWSMbtX79t79jFwIO8rnuNfKOmfE8BRW/5dC5FXs4TUwHFy9
	 7yp9WWaPwoT+zVnUpzFjipS62zR7GzyLclI+ccpTZcdV8mirig33umtQLaUN3qDpKTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLi7dqh2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F76606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLi7dqh2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3CD1F00A0B;
	Wed, 11 Nov 2026 23:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439643;
	bh=zlKFVUc+Cq7/iu4xyn5/uvDHqyvVKC45Z+ABVWfXn4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JLi7dqh2JUvmWCHop4iEUWFNVgNnoLK6MUvtG2HxGhHLlK9eEjD2Ut/St51XS2ahX
	 nUwltJLf3OmxE4+hXOl8YdKOa1Q7kkG4/eTPiMgfIVgWXWXyMP3ZXU18CLMG2WDtiC
	 Sgl15FpuSMZfxH98ybz+j+yCYdsQeHjzGFOt473Q5nmHfDmKXAqLADmJ/SrzSX/INg
	 roUjPVMTyXTyuEiKDhHvuCw7ygoDiFrngZKKucD29PfF1sOy7B/6diQRoThndGm9TP
	 yXJ4gKmhkZ4kfNyXvoKeImIfNROgXEuKd1yarcBKRcRDKD16YQvGk7t56RIy6yYM2R
	 CCkUJYcX++T8w==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org
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
	linux-mm@kvack.org,
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
Subject: [PATCH v7 14/16] mm/mglru: Avoid prolonged anon reclaim with swappiness=200
Date: Thu, 12 Nov 2026 07:26:01 +0800
Message-Id: <20261111232603.9934-15-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261111232603.9934-1-baohua@kernel.org>
References: <20261111232603.9934-1-baohua@kernel.org>
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

It has been observed that swappiness=200 can significantly slow down
reclaim on some machines, with some workloads running 3x slower
under MGLRU than under CLRU.

This is because swappiness=200 currently results in file_factor=0.
Give file reclaim a small factor at lower priorities, for example,
when sc->priority < DEF_PRIORITY / 2.

Signed-off-by: lyugaofei <lyugaofei@xiaomi.com>
Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6315edf50376..3872305bac2a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4888,8 +4888,8 @@ static int get_tier_idx(struct lruvec *lruvec, int type)
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
@@ -4946,7 +4946,12 @@ static void lru_gen_balance_scan(struct lruvec *lruvec, int swappiness,
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
@@ -5143,7 +5148,7 @@ static void lru_gen_prepare_scan(struct lruvec *lruvec, struct scan_control *sc,
 
 	total = apply_proportional_protection(memcg, sc, total);
 	total >>= sc->priority;
-	lru_gen_balance_scan(lruvec, swappiness, total, nr_to_scan);
+	lru_gen_balance_scan(lruvec, sc, swappiness, total, nr_to_scan);
 }
 
 static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
@@ -5890,7 +5895,7 @@ static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct scan_co
 			return 0;
 
 		lruvec_evictable_size(lruvec, sc, swappiness, nr_to_scan);
-		lru_gen_balance_scan(lruvec, swappiness,
+		lru_gen_balance_scan(lruvec, sc, swappiness,
 				     nr_to_reclaim - sc->nr_reclaimed, nr_to_scan);
 
 		if (!evict_folio_lists(nr_to_scan, lruvec, sc, swappiness, MAX_LRU_BATCH))
-- 
2.34.1

