Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488382;
	b=aGDSnct3MIu+mrwdcUbnDLrVmUlwWmQy9wxkNNknB+f3GEBdFVbBHezyzwEgxR8yxdEr
	 bR9DucHR7ciXxV9chXaMleu0Dst7cTUgND0k49jmNkjFjo4B67erYHKZIBSvz2tN0yyWM
	 99AIxJ38PdPXi8opFOQIlEUFPN6M6lT+Wxe89jksyzaz+8qWFpoloP2eZXbkA5FwP/0Cl
	 sxId4pyMnP7Kj6YYaDWoiCqfWWDjXkOzHzKIJUkpCACOBa2aVY2fOEvM1+YQXx7n3SxHv
	 NuZ3aXgDmLcOqmEHkVxKX0v9LdzJoAhVwfAWhpRsl9GKxQb+dY/mXyhXMzPcg5zjWIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488382;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3Kq7UED8yWl7smnWaQ122+SHPZANinmdZfnaIZ2GDo4=;
	b=4f3vAdBZQaCurPzL93H8WdPWxl47nwhAoYNiv92vc026NOLRTR30jj+eBQHjn1TnUre1
	 QQuwFAt3eTJOoPtE2yCVR+Q/4LJMr9nyvbBGSwlo7UDhI+rc5d2pcAaZ80N2PZmQjCH6o
	 QJCmq+VBYiQ+e4v9Emc61zsPEahh5CObYTplV1n18eTEWgsFNKzHqyFhpklwtnx+uwoZP
	 9Jx7tVRC+MJSigoziUUNgLVAIhTpBYnM+AJdLCSBcX2lm4Yny3V9ozbltr1tKBzin2XY3
	 jQEoV7qf1yzrZcdTUa7QF3UYhmEC1o996wP+Mk0dMd+CclXdzhFxfDJCiUaUmMpR2hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j9htu+g9;
	arc=none smtp.remote-ip=91.218.175.10
Received: from mta0.migadu.com (out-10.mta0.migadu.com [91.218.175.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB860A263F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39BB860A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j9htu+g9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CRfd8+zYcRqY9z+4AYrFkkTq95qSoIZN0ekyLrC8jBI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794488380; v=1; x=1795093180;
 b=j9htu+g9tQIsaEz+W0EKwmRgq9PSInQAy7HTkgCckdwTUzWNm6o1sci12u3doqdnnT+hpfHI
 D0RkwXu3s3ltfe0ZlRvDvQJ2rwmiUmdlPPX//vW/kHTjTYvaFmiPkefE7CMfnTM7pwGZem/mF8p
 60lzjnQD5+sSHB3Wg3V8/3d4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 9721da014f7e0601;
	Thu, 12 Nov 2026 12:59:40 +0000
X-Mizu-Trace-ID: 9721da014f7e0601
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Subject: [PATCH 1/2] mm/ksm: extract helper functions for scan cycle cleanup
Date: Thu, 12 Nov 2026 20:59:28 +0800
Message-Id: <20261112125928.177598-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112125754.176930-1-xu.xin@linux.dev>
References: <20261112125754.176930-1-xu.xin@linux.dev>
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

Since scan_get_next_rmap_item() is getting too large, extract two new
helper functions, ksm_prune_migrate_nodes() and ksm_reset_unstable_trees(),
to reduce indentation levels, isolate local variables, and improve the
readability of the main scan loop.

No functional change intended.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
 mm/ksm.c | 56 +++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 5e24b5ca8dc8..49977bcf04f7 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2609,6 +2609,37 @@ static struct mm_walk_ops ksm_next_page_ops = {
 	.walk_lock = PGWALK_RDLOCK,
 };
 
+static void ksm_prune_migrate_nodes(void)
+{
+	struct ksm_stable_node *stable_node, *next;
+	struct folio *folio;
+
+	if (ksm_merge_across_nodes)
+		return;
+
+	/*
+	 * Whereas stale stable_nodes on the stable_tree itself
+	 * get pruned in the regular course of stable_tree_search(),
+	 * those moved out to the migrate_nodes list can accumulate:
+	 * so prune them once before each full scan.
+	 */
+	list_for_each_entry_safe(stable_node, next, &migrate_nodes, list) {
+		folio = ksm_get_folio(stable_node, KSM_GET_FOLIO_NOLOCK);
+
+		if (folio)
+			folio_put(folio);
+		cond_resched();
+	}
+}
+
+static void ksm_reset_unstable_trees(void)
+{
+	int nid;
+
+	for (nid = 0; nid < ksm_nr_node_ids; nid++)
+		root_unstable_tree[nid] = RB_ROOT;
+}
+
 static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 {
 	struct mm_struct *mm;
@@ -2617,7 +2648,6 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 	struct vm_area_struct *vma;
 	struct ksm_rmap_item *rmap_item;
 	struct vma_iterator vmi;
-	int nid;
 
 	if (list_empty(&ksm_mm_head.slot.mm_node))
 		return NULL;
@@ -2639,28 +2669,8 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 		 */
 		lru_add_drain_all();
 
-		/*
-		 * Whereas stale stable_nodes on the stable_tree itself
-		 * get pruned in the regular course of stable_tree_search(),
-		 * those moved out to the migrate_nodes list can accumulate:
-		 * so prune them once before each full scan.
-		 */
-		if (!ksm_merge_across_nodes) {
-			struct ksm_stable_node *stable_node, *next;
-			struct folio *folio;
-
-			list_for_each_entry_safe(stable_node, next,
-						 &migrate_nodes, list) {
-				folio = ksm_get_folio(stable_node,
-						      KSM_GET_FOLIO_NOLOCK);
-				if (folio)
-					folio_put(folio);
-				cond_resched();
-			}
-		}
-
-		for (nid = 0; nid < ksm_nr_node_ids; nid++)
-			root_unstable_tree[nid] = RB_ROOT;
+		ksm_prune_migrate_nodes();
+		ksm_reset_unstable_trees();
 
 		spin_lock(&ksm_mmlist_lock);
 		slot = list_entry(mm_slot->slot.mm_node.next,
-- 
2.34.1

