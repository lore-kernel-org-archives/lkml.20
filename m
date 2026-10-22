Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706565;
	b=SMnNPpKjS5Mr2SafXUiQXE/Apb5uf7kcW5M780QvPZ9VsP8m4nTECRty3GXNrSnjJA1S
	 YO/m0aKX4Fq0eCFdbAb7dlu1I6fxcHMYPHovXXht2950Bf3J0yc9tc8RIoDKH+tk4dfm9
	 Qq/JLPCrzQ+ljgFWPVpbGgTtneWPQTqhxCuGe+TSJ7iIbQRQ4kcbkyci0Hv4sPZb32Ray
	 tSos3Xsi7U8EYbCv/dGHNmQKKXrWyskMe8PPhysPDmZmJbwyQuyR/G2jT+xBQjKCaE75C
	 Gcedp3rs0MCaxWdKlKNBJDH6AUAS3rN7yH4g/l/v0YGFmzgRFxtNk67cPN6BB5aBzCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706565;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=vQbgXpddcTuVN34Htk2SOZBEs+BmtG8kWRSjzolqx1o=;
	b=hWChph+78XDPXZvEmWWs7UOMTaGYpwetBTCZXzG6AlTJVCKoTTVFigO9TU9ab0xpPzmG
	 WjgiEjbvMKFl5TL4IngR/Ubc6uE7sQHRhODxbIh+9UWzBPAQNT6Fm7OJNqLOPGNCUT7ZY
	 ZJx/7Hkl3VjFlUxGzHgM07bXeV9a7PwY3ltcQqnLbliEqd8A8ELeZGalZ6EJ14u0P6zsH
	 EGGpN+jCGjEN5OY9C4tNDXHiPWsIUjJb+SwWsN8PxJ75NPm8/aw9HNnmC38ju5P+Xe0aK
	 kiuh4bhoJhJpHHaKsNslNMTV+quhWH9kOpL90J0j36mwcXfUxdQfGNkG7P9CAex7IDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnRr+6Xf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB198606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnRr+6Xf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6351F031E3;
	Thu, 22 Oct 2026 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706564;
	bh=vQbgXpddcTuVN34Htk2SOZBEs+BmtG8kWRSjzolqx1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XnRr+6XfOUCbH/xPlS5RKjnpP9QvE97884/4k0z9EfH2JOZ4uTuMGSFj61If9PFwT
	 9REgjLHsA4c6oDgeSJjBtoNljs25bmh6QtJzsDtYNpvI8Bub4IkPWVSuuQe4WS0EpK
	 b95CAKwrFrU17eG+C3jSZzk6qKGICpYbAt2Iq6rD4iKMbv8JUvVyZbVq7NvbUeum+B
	 r0mUgJUpO9LxRk0HQ3qJqX9TjrBnRKs05ruzHYBh2PuYXv+4RfNz0SpWpBkqGKY7bq
	 Am5ff9IDRSNUWNrtFJQob71+vnE+1xG648get02FKRjecPl8BUDT5RNa3765t2vCAn
	 CC6fWslSbJpiQ==
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
Subject: [RFC PATCH v5 06/14] mm/mglru: return for unavailable anon reclaim earlier
Date: Fri, 23 Oct 2026 06:01:55 +0800
Message-Id: <20261022220203.91911-7-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

No feature change, just shuffle some code, prepare for later commits.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index d3caed8aa789..0930bee5906e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5215,20 +5215,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 			   struct mem_cgroup *memcg, int swappiness)
 {
 	unsigned long nr_to_scan, evictable, sizes[ANON_AND_FILE];
-	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
-
-	/*
-	 * Proactive reclaim initiated by userspace for anonymous memory only.
-	 * SWAPPINESS_ANON_ONLY is set only on the proactive reclaim path, so
-	 * warn if it shows up elsewhere. When anon cannot be reclaimed (e.g.
-	 * no swap), return 0 to skip the scan entirely, avoiding useless scan
-	 * work when there is nothing eligible to reclaim.
-	 */
-	if (swappiness == SWAPPINESS_ANON_ONLY) {
-		WARN_ON_ONCE(!sc->proactive);
-		if (!can_reclaim_anon_pages(memcg, pgdat->node_id, sc))
-			return 0;
-	}
 
 	lruvec_evictable_size(lruvec, swappiness, sizes);
 	evictable = sizes[LRU_GEN_ANON] + sizes[LRU_GEN_FILE];
@@ -5285,6 +5271,19 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 	int swappiness = get_swappiness(lruvec, sc);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
 
+	/*
+	 * Proactive reclaim initiated by userspace for anonymous memory only.
+	 * SWAPPINESS_ANON_ONLY is set only on the proactive reclaim path, so
+	 * warn if it shows up elsewhere. When anon cannot be reclaimed (e.g.
+	 * no swap), return 0 to skip the scan entirely, avoiding useless scan
+	 * work when there is nothing eligible to reclaim.
+	 */
+	if (swappiness == SWAPPINESS_ANON_ONLY) {
+		WARN_ON_ONCE(!sc->proactive);
+		if (!can_reclaim_anon_pages(memcg, lruvec_pgdat(lruvec)->node_id, sc))
+			return false;
+	}
+
 	nr_to_scan = get_nr_to_scan(lruvec, sc, memcg, swappiness);
 	while (nr_to_scan > 0) {
 		int delta;
-- 
2.34.1

