Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686924;
	b=hKTtUPFHAujyuN1mzdDcsX0gGVNaHyaFXC5bSmqlcR2QDCJYjQ2yAtpfDsv7buLcQi2T
	 Z70WOmwEwdQ1EPXgBgP+HMYqQc309Lq4yU1HEmYPXjssKlnGznfouJNRwmIMc/GXbLuCA
	 yL2Qi6a8MOWZvbrlku9796SsbmCfGpvJ6qPjkofxip+DTj0W4YcHmJkd9HJuiAVQuCJ5o
	 aLAAAZ+XUe2PL5Sqf414/qx2MVQpGKWs01LZ0gnTHw16QqVKaGaMpvacxveQL+XoKXbng
	 rQM5vfX7wU+CyXbGxQ0Lt1WeaPVXrxq8wr2pl98chJ+AztryEAu7uwoXnKU8/hrqkQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686924;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ezq18gHIz45Kz1JSXDZjpuR0ZwqFcCzL6dRcguaRMw4=;
	b=Qq1JblS4/MyGOItIvybRvbWWjEot635KMA8WslQciA5e2hiFBOprPWxI3A7/hFJ0+xkZ
	 IZKHazLhzqBnVK6nO+izFxzPbwHkSxd7U5jXyE2HNjrj20uKQsLdTz7E7JukAeQjF2iTW
	 1QqiWjxs9aNkXyzKXYNITRfvh3NUWwZim8AbG3f4YO7M0U4CDf7xgGU1Ovi1Hk4qpKfns
	 UcZjPoSOEUS3K2sJnC79gPgzA00QNNh6TtPYjDLDTQpvH5HH8zq1uJiIFr8Yith9B6KW9
	 YeUJNjRT3E3UL66JAK9k5csY+Ef+6Sfo/jYCZD6aACLNuOUJbUGWWAx9ab9THl/cEbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BYDplYd1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5655D606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BYDplYd1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310A21F000C6;
	Sat, 14 Nov 2026 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794686923;
	bh=Ezq18gHIz45Kz1JSXDZjpuR0ZwqFcCzL6dRcguaRMw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BYDplYd12wGj0zV7FRN5cJajx6LmjGREGd60GueNn3xuj2yt0NoP8Tm/8TKCmCxXL
	 foBwABCUEsjvetT8pq8pG/zyiMgpAJpnc2pJrCXGWUBp7AoavBmHWTE3b0S4LpNfmH
	 ls6Jf52lGnGOTEQlALsDOVp/3/oG/RQE4YLzE6f5HgQTAsP6EXwFpAQagYHqnmqqVP
	 9I4PSg4YtzSlwSjnRpQ0r0BrBZvKgE2gwUzSxn1ZRBK3Ho5HEVzjcVjcxpIGvHxhA6
	 qVExLaF4ww3PKOmzUjE6k4/of/plt5dP6rKRuWlm2OHZt4nw9YcT9BtfwafFckiwpL
	 DRGeYXQqzhFLg==
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
Subject: [PATCH v9 06/16] mm/mglru: return for unavailable anon reclaim earlier
Date: Sun, 15 Nov 2026 04:07:53 +0800
Message-Id: <20261114200803.23129-7-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

No feature change, just shuffle some code, prepare for later commits.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b3ce4a550a62..f7fbe91fedf3 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5060,20 +5060,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
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
@@ -5126,6 +5112,19 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
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
2.39.3 (Apple Git-146)

