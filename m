Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893912;
	b=T89OCUoTf6yRcuKeJ4ierFYqyQK58uIZlZjo9evD45H7QB8rKfrh1sZ9/Y18WHCl63bi
	 POdlSz2QXH604/yHPmhGDR2jQHsVdLIDyKNiPiHMwsAl0u0ryii364Jy8/+Ri7+5E9miC
	 TniOQ3oD2nKJIjxcxrpp+pcBYtRE3Uart/OnoPgxn11GGaB9HRYXwZII29Efwi644rPBD
	 Dhv2ShXzXbMUkkLPFLm3bWzarru8UY6EuJQgU695vUCraqTRa7wVihJFRlTR1hRxMfcj1
	 reoDkj/fI2616HgcBcfEF2SvMkSdO1w+5zawM1LuIHmvJR+4+LSwCQHtbR5NTnZRBtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893912;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-GND-Sasl:X-GND-Score:X-GND-Cause:X-GND-State;
	bh=EIK49Tcg3pu8WRBXo8Mfb4XG8bVZ55wdfLeeW4Ym45I=;
	b=itdGmuhtPjDuPTRc+dGxdOhkxaZG6Wj491WPBCqgFVbRELnIqi6/QWpaObJToO4ct2hO
	 3RvvPp1UE5wDB2vEr02FzWU6JPOD1oz7Zmc1bibSpjAzGzKbAM3gQWGcWgzZ3UJIuF1jL
	 458GUs+9UM/M3cGf9HIs5kIs5K+ojPoskzX52nycpOrxTLcsDrthUFRt7Tir0tqe1j70D
	 mnypjnRB3/FobNSQn11Qve6le3dwtcEzBQTfacDqL7qFMh66+Ddmio0uBYGmnoDDQlowE
	 E7U9VMmIzEkTkVc9jcgEsUiZuKfYzCiFMeLtydlFEy9HzKKnpONsjsmeXLbMOuffoLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ghiti.fr;
	spf=pass smtp.mailfrom=ghiti.fr;
	arc=none smtp.remote-ip=217.70.183.196
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE3D606D804
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE3D606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7CD13EDD7;
	Thu,  5 Nov 2026 15:51:40 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Youngjun Park <youngjun.park@lge.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v2 1/1] mm, swap: only prefer nonfull clusters on synchronous devices
Date: Thu,  5 Nov 2026 16:50:17 +0100
Message-ID: <20261105155032.240457-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105155032.240457-1-alex@ghiti.fr>
References: <20261105155032.240457-1-alex@ghiti.fr>
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
X-GND-Sasl: alex@ghiti.fr
X-GND-Score: -100
X-GND-Cause: dmFkZTE+woJDVoV0nQAdmju6GXPQzp/37WRGqRlscp+7unek+1nQNJTbvmeTlTd0ZpBK4WOforKxfGb9LZ+Ebki3ZTxLhTP2DkVqpWuUqkuMma22Pq3kWAdenYRiH/OB/oNr+X9LZjsiyptfHUdeuqMNYlPNonH82ECvysafYuTYEheuBQwDfnUuX3Ke+p6SrbAiZtE3gj391nmjpp6K2OwnrClynn4/9TK+ADwy1brBNcyTPAKRRe0o6mQN9X9LB+4Rl3VxjHOqCaEaD8OsyMsg9A6ZENWf6x6JPlMtd5ZZhDJGOcDNERaePHThGJqB6HmyKlCHwAwM62K9AATHCrb14vrLXtPQ59imH+DNJKnRz53f4kcVGtktkkWc0Ur+oVDUdARQKwX1ETe/qFU+1fvu+OMcRDLadNb3dOq6uNpuSZIH4B7lza8uIlF41USk7ZoLjRUsp6ec9+87ZnCfzn9pOkagalwwxyabncFmL06v4qxQya4WOmTYyKAh/Ow/LtIpSwqnGCORCdcGiiPBsEUNXVPHJnjdNjub/6goq4HkNQRXspoOT/KiieGnOpoxglicIEQnb0McGG4LVt8f1nLbhYqSAX4FH1wCKJO1yrIxPd+6jMa/G+gvbjr7NYZfxf3WtzIpOt+l9qIa2nXYKjQTI70eGt4NwdWeiYKvH5ZSjao0/w
X-GND-State: clean

Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters") made
allocations fill the nonfull clusters of their order before taking a
free one, on every device without discard. Since commit 3cedb745d354
("mm: clarify the folio_free_swap() for do_swap_page()"), an exclusive
write fault frees the swap slot, so a workload that rewrites swapped out
memory leaves holes in full clusters, which then go back on the nonfull
list. Reclaim allocates slots one folio at a time, so a batch of folios
gets scattered over those holes, its writes can't be merged and it is
written with many small requests.

So partially revert commit 9a42aed48421 ("mm, swap: prefer nonfull over
free clusters") and prefer free clusters again, except on synchronous
devices like zram: they don't merge I/O, so the contiguity of the slots
doesn't matter to them, and filling the holes first keeps the free
clusters for large folios.

Fixes: 9a42aed48421 ("mm, swap: prefer nonfull over free clusters")
Suggested-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 mm/swapfile.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 189f04d8838f..1c1b5d0b724a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -973,6 +973,17 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 	return true;
 }
 
+/*
+ * Prefer a new cluster over a nonfull one if the device needs discard, to
+ * spread out the writes, or if it is not synchronous, to keep the slots
+ * of a swapout batch contiguous so that its writes can be merged.
+ */
+static bool swap_prefer_free_cluster(struct swap_info_struct *si)
+{
+	return (si->flags & SWP_PAGE_DISCARD) ||
+	       !(si->flags & SWP_SYNCHRONOUS_IO);
+}
+
 /* Try use a new cluster for current CPU and allocate from it. */
 static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
 					    struct swap_cluster_info *ci,
@@ -1143,11 +1154,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 	}
 
 new_cluster:
-	/*
-	 * If the device need discard, prefer new cluster over nonfull
-	 * to spread out the writes.
-	 */
-	if (si->flags & SWP_PAGE_DISCARD) {
+	if (swap_prefer_free_cluster(si)) {
 		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
 		if (found)
 			goto done;
@@ -1159,7 +1166,7 @@ static unsigned long cluster_alloc_swap_entry(struct swap_info_struct *si,
 			goto done;
 	}
 
-	if (!(si->flags & SWP_PAGE_DISCARD)) {
+	if (!swap_prefer_free_cluster(si)) {
 		found = alloc_swap_scan_list(si, &si->free_clusters, folio, false);
 		if (found)
 			goto done;
-- 
2.53.0-Meta

