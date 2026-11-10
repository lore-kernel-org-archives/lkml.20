Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342066;
	b=wlfleUWCd/vOavtnJlkrFqXFzC40YHl01SmPx+Zy7+8F/fXqtsRS1lzF8N33aCAk7BRZ
	 jvsbZKdRu36MyWy/Qt59mUPJFHEnHCjyJoeW96pQ1rfM7zODST0mHLss56yUcXhNHMAxI
	 6itkllV6VmDGFtCWRdmsfCOivdGcDhA2ZEWYsO547LKu8vQC3NgMTZe10OGASJmmRlZlo
	 eF6p/V27kzuP0jWuq4khmbPMgDFt6lPJslyBLIkJWRxN/KrzSsBfC904iFjNygSf9zKHU
	 x9MrszPeIk8OMmeGR+e2yoqsGmp5x+CGAYtJmAUNk+Zw4IbpWqYinBe4DnjElBpEKrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342066;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=svLW62vkvxW0xvIszMrXeZ8SojWKg92Vr+WIfieUekQ=;
	b=BasHXRBPHvtCZAULXEh37sih9jruuWX6h7ldAVTXfEkFhkw7Lc20zZnK9sxy9oM8UTpC
	 AO8AIATYlFPPFkDtEUDMmQ0O9oNmcZ8CKOJjJ2fbCWITmVYUcka+HPE3jeszElXaiaWJp
	 iWZa0ObkC+hIyoJ84GRnKMAbJcn4oJw9sQ+hjEpDkmeMdUnuYe2FNU4RbhXCAkPPKz3kb
	 dZUUO0aSRP+IxKTOizs+01DRYa9OKhuEl2BELiJPqbPgXJ+pS4LXokba6zIX7LR1+0TUj
	 2SXQH/7Mnr8gGDO9+91bxTWOP9TyUZonNrchD4OEAVhFWFYWRBoDBb1jC3xU0rcgiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TjnvK/YA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D92860A6F7E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjnvK/YA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA15B1F008A2;
	Tue, 10 Nov 2026 20:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342066;
	bh=svLW62vkvxW0xvIszMrXeZ8SojWKg92Vr+WIfieUekQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TjnvK/YAvvUg9oKn3idKeHXGSn/xtyNOamiw70cQDIAFP5WSiK2eLBsHazNOvcg9O
	 4JHACPddPsMkjq9uMu1edkXnSz2+0GQow2ewXV7NsjqcQ0+D6Zik7pnPHmbZXoMLmr
	 XwtPv4vDw7lmTX3EYyFc0IvbmOQE/Bv+KwbWt+/j3ePbd60RjfG9ZbFl6erx3HkWIO
	 f+CVKm2qdTCrob5En9s50yZGXulzGCmZ3/5XlrEqrms4yIVd4zFe4j3yuD2jl/Vgr/
	 99O0Y0/tNKoisx0UD4VMoFtx1JqOqpngayT9B3E3rqqFpFeKTvS1ISlW76Rb5lacRn
	 JL1IWyIV4+1Uw==
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
Subject: [PATCH v6 06/15] mm/mglru: return for unavailable anon reclaim earlier
Date: Wed, 11 Nov 2026 04:20:16 +0800
Message-Id: <20261110202025.25736-7-baohua@kernel.org>
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

From: Kairui Song <kasong@tencent.com>

No feature change, just shuffle some code, prepare for later commits.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/vmscan.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6b1670677974..e2807faf26de 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5055,20 +5055,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
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
@@ -5121,6 +5107,19 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
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

