Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439603;
	b=jiqd2k0AqtSTzTNoxmjOgYLaACKspCRu0N32X5QwTRymTWTHQ42lFBtyDZ5N1N+iaRcQ
	 UqfTU/GYj/l7ZnNFxjPXb50ux0NeGNA7BhxK93gPUqlBVweWzCEn5ZJtjJs2msrrpuU3E
	 A5SasDtNFStIjmJK+4M+JEbCCJQJQiqC7z5jsk5lt2DM6NENqsB8Np+AwnvcmqH4EfhxU
	 DmTnUjt9f+T4jXvHKZzqs/hBeag2b9rSwMjVp7BhGzWSPfk3zPMcqezgYMSrdcTgd6s/n
	 w5xL6I2Ea9SBg3/bV9Nde/roHrZYalsCqMAnMoJnRGmBI0jYY47bmLypilbrvodKl3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439603;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=svLW62vkvxW0xvIszMrXeZ8SojWKg92Vr+WIfieUekQ=;
	b=2auoNoIzoY60EoHaXrUQ3qUmCx6UVq9V5ylAnGa+CVWP3FRmrvWLJxpkcVebLNKU6tC9
	 Om9NOUKhJwBcWXaak51aXha704uhaS9LHIkBpnQ3SXQe7HQSPv1/IDmGUf5Kyu/j3WvgC
	 kOhiSqdpv24RZnboUxVVFROdHCMgzQpiH+n7hTmM93735OIdBF3FuIjO3pA4NB3ZY0c20
	 2mmAE9SsknpYdstzeBXWgS0dH9cVqlRufKlkuxV5kwdbHcKYRa6rMsGxNF6cyr6ybY0iF
	 ulnpG0ljnuh35zLQBUUQWsleAmYpx0TObjriRLbrP/kNW/2/2YMUJR6AtJ4K+ytRHqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hebxcBgm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4227C606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hebxcBgm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576811F00A08;
	Wed, 11 Nov 2026 23:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794439603;
	bh=svLW62vkvxW0xvIszMrXeZ8SojWKg92Vr+WIfieUekQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hebxcBgmWepyx7VjbguRAqqK17gGACZTgFgv4nuQqAUoBo2S80BMonpgiyWcFu3Kw
	 qr+0XdOMyL/g58305NxMlAkn2m0MMuSNzoJ6mOOxVo5dZH//ks4GTGqvTO6Q7s9fws
	 1RtjJBcerT5lWeuMyl8P7Rb4wZgUBSyi4Sh9QBOfwbAIIk7hZ6TjnAtcYipuTU8SbA
	 EwWSB8+reOYIcGhJhqwG9u8I20Xp6ovAe90r7DzH+u4ilbQV+5z3nfKN/QisjsjTMk
	 iZej9gAtV5yMKNwQumbjWGcM6NatLRZmWktNDZTYz/Trs3HdKWUwpNTqNmJUpulvDR
	 Ccien+d1qIVTA==
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
Subject: [PATCH v7 06/16] mm/mglru: return for unavailable anon reclaim earlier
Date: Thu, 12 Nov 2026 07:25:53 +0800
Message-Id: <20261111232603.9934-7-baohua@kernel.org>
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

