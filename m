Received: from mta1.migadu.com (out-45.mta1.migadu.com [95.215.58.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE5E32E73E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748272; cv=none; b=ej1mDFspGx68o5/k+Wy+Bi/sefphxgpVBqjqlMEX56g6HyIbOVNyhU1mFIz7zn//z4mHZwmr8+n04zChkPWO3AwZ7W9lPx0iktkDhKW1kOjx1OgtV8BQHrf5GSu+Jvu7/tKsUPKTrSqtpy0EzWHtdH18GcJmoGsWiHn81ycmF+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748272; c=relaxed/simple;
	bh=IzFZRj95FedhBG7vUWVbKK27BO98pC0xOrlDItWw6R4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XV7Bpj6K3Qqxz7Ma2x3rm5ICcxArltKg+vp2aJ5w51wd1qeknKu098yRYtoLqIlV7xZrAJj7btzv3CcZp1YHqm9v2W1a/zd8udcPul6YSO9GoA+YM2zuk28tt0Uzy5jIYvwZWt39C9SWXGVLSrFxRbEOSb5SgnV6KDQvpruB9+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jlq+R6xr; arc=none smtp.client-ip=95.215.58.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jlq+R6xr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IzFZRj95FedhBG7vUWVbKK27BO98pC0xOrlDItWw6R4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787748268; v=1; x=1788353068;
 b=Jlq+R6xr0RmFc4fb0Z0uoWumjHnkqYl6PcH8XDuSBFvGqCk80HWl01bwTou/Qefq9SAh3FhN
 lwwSa2tgiAHnuhf6BomiF3C6l1WhGCYCQ5wcIruG6k2bDWMA7s5xMVsnCxdHtt4XrHERFJQRhSl
 Hno5drnYDTZ+6CZHeZDgyj3A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from mi-ThinkCentre-M760t.mioffice.cn (14.29.108.92)
	by smtp.migadu.com with ESMTPS id 4a6433d0eb768628;
	Wed, 26 Aug 2026 12:44:28 +0000
X-Mizu-Trace-ID: 4a6433d0eb768628
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH] mm/vmscan: drop the combined limit gate in __node_reclaim()
Date: Wed, 26 Aug 2026 20:44:09 +0800
Message-Id: <20260826124409.35569-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

__node_reclaim() is called from two paths: node_reclaim() and
user_proactive_reclaim().

node_reclaim() already bails out early unless node_pagecache_reclaimable()
is over pgdat->min_unmapped_pages or the reclaimable slab is over
pgdat->min_slab_pages.  The identical check inside __node_reclaim() that
guards the shrink_node() loop is therefore redundant for this path.

user_proactive_reclaim() is proactive reclaim driven by userspace and
should not be gated by the per-node min_unmapped_pages / min_slab_pages
limits at all [1].  With the gate in place, a proactive request is silently
turned into a no-op whenever the node happens to sit below both
thresholds.

Drop the gate in __node_reclaim() and always run the shrink_node() loop.
The node_reclaim() path is unchanged, since its caller has already applied
the same test; the proactive path is no longer wrongly gated.

[1] https://sashiko.dev/#/patchset/20260723045718.2052070-1-ridong.chen@linux.dev
Fixes: b980077899ea ("mm: introduce per-node proactive reclaim interface")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/vmscan.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5..6dff207ad8c6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7851,16 +7851,9 @@ static unsigned long __node_reclaim(struct pglist_data *pgdat,
 	noreclaim_flag = memalloc_noreclaim_save();
 	set_task_reclaim_state(p, &sc->reclaim_state);
 
-	if (node_pagecache_reclaimable(pgdat) > pgdat->min_unmapped_pages ||
-	    node_page_state_pages(pgdat, NR_SLAB_RECLAIMABLE_B) > pgdat->min_slab_pages) {
-		/*
-		 * Free memory by calling shrink node with increasing
-		 * priorities until we have enough memory freed.
-		 */
-		do {
-			shrink_node(pgdat, sc);
-		} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
-	}
+	do {
+		shrink_node(pgdat, sc);
+	} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
 
 	set_task_reclaim_state(p, NULL);
 	memalloc_noreclaim_restore(noreclaim_flag);
-- 
2.34.1

