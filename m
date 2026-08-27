Received: from mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F828C840
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787799942; cv=none; b=UTMelPcV53HvkcbwMllhkikeMTpgvBhPCjSiZLmh3PvsxTNVfnVHYtNETQ6PSEbfZUO5A+rZ4iq7Zo261QVRSiGO1wEdCUYgB666QfKjZch4jCYSYahQtOC57kI3Ghwp6YX9aYIfOQd1m4v/LTpn2g0Zm+e/Y7csNHlu0Sx03kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787799942; c=relaxed/simple;
	bh=/kXkE6EgK7Xu/D9nmz3lVFVzvuwgd7TR0qfSXqA3DEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hXDpFyFc/AYWCM5LxKBQ402F1hW7qBdxPAUaJJAqY265daOFkrtSVoOttHOXYmNnt//VKgyYwNFEsWoVPKvdYX3F53SIiocM5TkKcL1PtdD+hO+vhbugW8osNoo9aXH5HhankKNyAJWBF93X++2l+T/7pH4bxK0sJO2zlMB/nb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qV0/WMtn; arc=none smtp.client-ip=95.215.58.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qV0/WMtn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/kXkE6EgK7Xu/D9nmz3lVFVzvuwgd7TR0qfSXqA3DEM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787799938; v=1; x=1788404738;
 b=qV0/WMtnICRvc5EaONbUC6kNQX6pBCkoDLOwK+1vlDyWhmafPfMKMfkn8ggeZXkcWqPgkNcK
 Aga478H33DveslE8LnpfxoA6mxGaWAMxPeSUEMkLgdIi9Fvh2KboSg/bfRk+VoXb7YIJXJtiLsH
 t+vLGsRk9u6sNXQI3YHLHv5Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from mi-ThinkCentre-M760t.mioffice.cn (14.29.108.92)
	by smtp.migadu.com with ESMTPS id e84e612d5d5de145;
	Thu, 27 Aug 2026 03:05:35 +0000
X-Mizu-Trace-ID: e84e612d5d5de145
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH] memcg: sink mem_cgroup_uncharge_folios() into free_unref_folios()
Date: Thu, 27 Aug 2026 11:05:16 +0800
Message-Id: <20260827030516.462926-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

Every caller of free_unref_folios() invokes mem_cgroup_uncharge_folios()
on the same batch immediately beforehand.  This pattern is duplicated
across shrink_folio_list(), move_folios_to_lru(), folio_batch_move_lru()
and folios_put_refs().

Move the uncharge into free_unref_folios() itself so the batch is
uncharged in one place before the folios are freed.  This removes the
repeated boilerplate at every call site and makes it impossible to free
a batch without uncharging it first.  No functional change intended.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 mm/folio.c      | 5 +----
 mm/page_alloc.c | 1 +
 mm/vmscan.c     | 7 +------
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/mm/folio.c b/mm/folio.c
index c02dcea9c03c..2edbba47be1e 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -199,10 +199,8 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
 		lruvec_unlock_irqrestore(lruvec, flags);
 
 	/* Cleanup filtered dead folios. */
-	if (is_lru_add) {
-		mem_cgroup_uncharge_folios(&free_fbatch);
+	if (is_lru_add)
 		free_unref_folios(&free_fbatch);
-	}
 
 	folios_put(fbatch);
 }
@@ -1030,7 +1028,6 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
 	}
 
 	folios->nr = j;
-	mem_cgroup_uncharge_folios(folios);
 	free_unref_folios(folios);
 }
 EXPORT_SYMBOL(folios_put_refs);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 12fac9084c48..fb1ecab0ee78 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3013,6 +3013,7 @@ void free_unref_folios(struct folio_batch *folios)
 	struct zone *locked_zone = NULL;
 	int i, j;
 
+	mem_cgroup_uncharge_folios(folios);
 	/* Prepare folios for freeing */
 	for (i = 0, j = 0; i < folios->nr; i++) {
 		struct folio *folio = folios->folios[i];
diff --git a/mm/vmscan.c b/mm/vmscan.c
index e572d2742c8c..113e2e49447b 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1506,7 +1506,6 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 
 		folio_unqueue_deferred_split(folio);
 		if (folio_batch_add(&free_folios, folio) == 0) {
-			mem_cgroup_uncharge_folios(&free_folios);
 			try_to_unmap_flush();
 			free_unref_folios(&free_folios);
 		}
@@ -1575,7 +1574,6 @@ static unsigned int shrink_folio_list(struct list_head *folio_list,
 
 	pgactivate = stat->nr_activate[0] + stat->nr_activate[1];
 
-	mem_cgroup_uncharge_folios(&free_folios);
 	try_to_unmap_flush();
 	free_unref_folios(&free_folios);
 
@@ -1902,7 +1900,6 @@ static unsigned int move_folios_to_lru(struct list_head *list)
 			folio_unqueue_deferred_split(folio);
 			if (folio_batch_add(&free_folios, folio) == 0) {
 				lruvec_unlock_irq(lruvec);
-				mem_cgroup_uncharge_folios(&free_folios);
 				free_unref_folios(&free_folios);
 				lruvec = NULL;
 			}
@@ -1920,10 +1917,8 @@ static unsigned int move_folios_to_lru(struct list_head *list)
 	if (lruvec)
 		lruvec_unlock_irq(lruvec);
 
-	if (free_folios.nr) {
-		mem_cgroup_uncharge_folios(&free_folios);
+	if (free_folios.nr)
 		free_unref_folios(&free_folios);
-	}
 
 	return nr_moved;
 }
-- 
2.34.1

