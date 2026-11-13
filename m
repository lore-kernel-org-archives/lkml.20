Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596179;
	b=QGp6gM1lWxbJiv25J/IZ6oDrbzEfCbqtvME544V0TcsEN+tmiIUHuKYy6kzDGaGmY5dj
	 NYfOzKh30O08YjpoIkxprJ3wsxnH2QqNZym41FZpQOgKdyvsghuo2pwxEpJVon9oItFCw
	 wgn+JwB1Ua9OtYhBY6t+fNRj5/vXB0E1WXElFmWzVdWTekmrR/+HQWBqH3ILK4solAev/
	 zWG872xqtMOH1r/bWDhEPZHdhF2Xj1wdwRjHa3WqofiuH0s17/V/yK95BfbrS8bM0Ki3t
	 ABWUfHc9TR+qWtuH8J92VB+3bVA9LTMQCF0+VOivNHsdQ9Ab8P6AN6d+AJFNVedu9pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596179;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Rbf3ODCn28ZF0d7+U04laU0GN4Tl9A4x506ilfnoj8k=;
	b=asrliRxv4/6dpDc18G/2Csk/6eeUHNcu/e2np5unV3Hz3ayXEKKCvKXJwuYr9s9Gfzwy
	 klwVc/huFCCOpVuSAB2lqSPVEEGMmTX21WQEEGC3TZPnSZkFJGeMsc3ave34vkwPEcun3
	 +drTmSdKPPh/+yOcGr+HYzIRJ3hgghfl7d0dHLPzDfQH808143WrTyYejK7v0maarq0ZZ
	 Dyo8pHl/YvyzV5tYERW747IcbeHM7i12ye3FKJ8rOUPW483IUwOkvVtmRYFVcqf+Aw9B6
	 no7yBFtANG+h0yh2SvnKZ48/C/S+1VwsshoDlBHeossAQEd76QVriTgH9xfzlpLN7pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fprzCg4D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B5607105B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fprzCg4D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A004B1F000C8;
	Fri, 13 Nov 2026 18:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596179;
	bh=Rbf3ODCn28ZF0d7+U04laU0GN4Tl9A4x506ilfnoj8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fprzCg4DV5a+sKOrvMCSEHUHYXDixSlpUtiMZ3iT9aOZBMDTTzIxCg09st2uD7QMo
	 /DyhKM+9bkRtkLPibys9L1bMVZ4IXNfo0/V/C+Tak0UK8qmIW2jVzTZPyGtPREtbTw
	 paSdghLTKcTTtyxp6bjJHw8o987eVwIDium9roSWRcaZasNCtHE8pEZ3DhM+fbXz2S
	 tHDPSDn7fkTbij1XUvjDLqzcjUGAa2YOTOyJeiU/Zdmdb9V9kUdLyAPJpJcX3jM3v/
	 KK2YQi7HATCfkq8iTMR7GDcBOOJVymn2eiW1dzR1BdCR2gczsTCkxBLDfQwl/XBpMw
	 QehrS2DTFB6Ng==
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
Subject: [PATCH v8 06/16] mm/mglru: return for unavailable anon reclaim earlier
Date: Sat, 14 Nov 2026 02:55:31 +0800
Message-Id: <20261113185541.70203-7-baohua@kernel.org>
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

No feature change, just shuffle some code, prepare for later commits.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index a6e9e755e4b2..7a21890ebeff 100644
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

