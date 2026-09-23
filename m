Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3485369D56
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130550; cv=none; b=Qp2hy2oah53Arz+h9xRMm7Ym5JYZvFKEx0KbGMCoAaboulp7jtmQwqNs7Dq487ATxqb0hq+Oh9o/ZfoqfTKMAx+VTP1g7vk8BlIhStSA4NNTx0aW1K6V8iFu7k1Iw9JqDLZ0N7cuMbOxzA3fN7xp2uAcW64c0eQNKcjOmnushqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130550; c=relaxed/simple;
	bh=/AeIosBLYXEmJJMjp1lQbjdRZXC4yVGPyR4w8hqfOfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgni0wIvRQDVIMcODoABZ4yQg7L4l6JuXEWchzi/XCOFJwyqhDB5MdKzEuFPE6y73uNZVF1xlXKT53YT0xESECHZ7jmc3KJEd8Yu98VCwRIF7QttuHoJgDVgKUsBhuVqQrrTBIdiZb2OGkPzINpikcVliXxGSL/1wp48tl3EQnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=VJpWXgUD; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="VJpWXgUD"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bef17c191so39547485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790130548; x=1790735348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DTbYesErX7uqQ2UiAVBtVPVMTumuecPrjo9lCd5uig=;
        b=VJpWXgUD9cl9fmRHcovDtejzVsZ//OoHovKRlTL97Vx17B4KjTnBS11OO2ZCVWMInJ
         SGJ0JYpjJoj1VUUdswgdM/XZpNhmCdQzA1EQgZfjqHXoE557nFp4cEo5vSz9uBjJtB/4
         3I3dvD/som2xRnaDV9VMu+4iEeiNknfKmgYE6qiON4QMOQCD4RY0xnThDgi1cOYcjCPI
         7WzBhVPJDTFtjexdE6wkCC9+vSOtdj2A6SyLNP5J2L4lwYwfHeul2jbS4+f0JcfEO5yk
         Yis3JNifxO8SGjwBOv2k3/bW5JmGy4RvFUIkaIJwFzoaEi0hCps+ySSq5mxo7qxnKZoK
         bFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130548; x=1790735348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DTbYesErX7uqQ2UiAVBtVPVMTumuecPrjo9lCd5uig=;
        b=25rr7xFzN5Q4uDlrddqTe5cl5QSSeNVl/YfyQ7XFbcuad8QDvcmkL3b1si7AXYs1ws
         4ebn8yznDBQmFADN/H9VhzAklP0C5ibCe6nSr75txn3JgzzSrTPBZTKS4X5yVM+25f+f
         ibWHx6RF201gW6bEVgDMaSNJQvXeZfIWFeynnZXrEXJmoT/XkthDS0KJwfpPjDLeDc3l
         brATCEssC+qrw2KmmHuIIIyIAoXVhs/B52xZyEps99qXZUPBsalFMRQxa8ZUc+n1Js74
         Bt3R6UcRqXdmUWIFjRDW2HBfR6+8gEkNgNFy2Cm7eFkT08DtneVwEyCXgB1Z8UWsHHER
         geqA==
X-Gm-Message-State: AFuF++lEvSS9lkZHNwL3sVHda7gvPWfua/u/wBN/qBAL4Ef3fScQ6Has
	oh2xEKGyf+hX4toEX+eDyPYpyb8/4CWGdCJRea4E1osIekE2nOqsja5AVYpRlnv6VD8=
X-Gm-Gg: AYBFou3J67ITXnNJUzAVWXx8OhEQrbUHuvdSI+2euS+VnoKU7cZh8e0wRk+gOOf2eEl
	tjfLHQtA6OjAF+aCr4lcGxKzrcwUTwoSD/oaQC7Z3y5eA4pB66d6XqQieUxj1m59TIMCMmMP5m7
	f3iLalqQcIEgr8tuvYMn61wT2z6t8ACBg/fXYfPMYHvzjRg/XK0HYHhXmj4zOCxiL0RQlvXqkw4
	Y6rb9U74Hn9gJIVItzfwEH1fbz2ORDIsFHZhsrmht9ySSfqLQH955fTl3D7i81qVnzZmKZ1cdR1
	NhMHmW8AZhdfgKdWT9kkIHX1PrKrnTjCz8ApbA80aVFG56ITMrjbA3C+shSV8lhM9bs1JpSjb9E
	UTA1//wgBBASEDGmwt6JPdjTJ7/W81LSil91ZZUjmao93nroHu96VuoM1IuTGS8W4+5zYPVJZoO
	17vDacgm4BtJIAtYsmO1fPgGa4P+yNHWurFAEKOYiAPttRU8Ayq0RocrshoKDJmwZqEe83Hlj15
	s5iJp0/nPjqsfMZyiczc7+IjH/xqicQS/6QANkwxXikBsffAnLcl7bO1RLv
X-Received: by 2002:a05:620a:3902:b0:93a:2221:5460 with SMTP id af79cd13be357-93c251af18dmr218974285a.40.1790130547657;
        Tue, 22 Sep 2026 19:29:07 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2482302fsm122626785a.12.2026.09.22.19.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:29:07 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	gourry@gourry.net,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	Balbir Singh <balbirs@nvidia.com>,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH v3 1/2] mm: refactor find_next_best_node to find_next_best_node_in
Date: Tue, 22 Sep 2026 22:29:01 -0400
Message-ID: <20260923022902.2433614-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923022902.2433614-1-gourry@gourry.net>
References: <20260923022902.2433614-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_next_best_node() picks the next-closest node for a fallback list
from the full N_MEMORY set. Refactor it into find_next_best_node_in(),
which takes an explicit candidates nodemask.

This enables building fallback lists with non-N_MEMORY candidates.

No functional change: every caller still selects from N_MEMORY.

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/internal.h     |  6 ++++--
 mm/memory-tiers.c |  7 ++++---
 mm/page_alloc.c   | 13 ++++++++-----
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index cbdec2193fad..0434dfcfc36f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1133,7 +1133,8 @@ extern int node_reclaim_mode;
 
 extern unsigned long node_reclaim(struct pglist_data *pgdat,
 				  gfp_t gfp_mask, unsigned int order);
-extern int find_next_best_node(int node, nodemask_t *used_node_mask);
+int find_next_best_node_in(int node, nodemask_t *used_node_mask,
+		const nodemask_t *candidates);
 #else
 #define node_reclaim_mode 0
 
@@ -1142,7 +1143,8 @@ static inline unsigned long node_reclaim(struct pglist_data *pgdat,
 {
 	return 0;
 }
-static inline int find_next_best_node(int node, nodemask_t *used_node_mask)
+static inline int find_next_best_node_in(int node, nodemask_t *used_node_mask,
+		const nodemask_t *candidates)
 {
 	return NUMA_NO_NODE;
 }
diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index 54851d8a195b..25e121851b58 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -370,7 +370,7 @@ int next_demotion_node(int node, const nodemask_t *allowed_mask)
 	 * closest demotion target.
 	 */
 	nodes_complement(mask, *allowed_mask);
-	return find_next_best_node(node, &mask);
+	return find_next_best_node_in(node, &mask, &node_states[N_MEMORY]);
 }
 
 static void disable_all_demotion_targets(void)
@@ -450,7 +450,7 @@ static void establish_demotion_targets(void)
 		memtier = list_next_entry(memtier, list);
 		tier_nodes = get_memtier_nodemask(memtier);
 		/*
-		 * find_next_best_node, use 'used' nodemask as a skip list.
+		 * find_next_best_node_in, use 'used' nodemask as a skip list.
 		 * Add all memory nodes except the selected memory tier
 		 * nodelist to skip list so that we find the best node from the
 		 * memtier nodelist.
@@ -463,7 +463,8 @@ static void establish_demotion_targets(void)
 		 * in the preferred mask when allocating pages during demotion.
 		 */
 		do {
-			target = find_next_best_node(node, &tier_nodes);
+			target = find_next_best_node_in(node, &tier_nodes,
+							&node_states[N_MEMORY]);
 			if (target == NUMA_NO_NODE)
 				break;
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 090419c70173..7f706e3d7e50 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5802,9 +5802,10 @@ static int numa_zonelist_order_handler(const struct ctl_table *table, int write,
 static int node_load[MAX_NUMNODES];
 
 /**
- * find_next_best_node - find the next node that should appear in a given node's fallback list
+ * find_next_best_node_in - find the next node that should appear in a given node's fallback list
  * @node: node whose fallback list we're appending
  * @used_node_mask: nodemask_t of already used nodes
+ * @candidates: nodemask_t of nodes eligible for selection
  *
  * We use a number of factors to determine which is the next node that should
  * appear on a given node's fallback list.  The node should not have appeared
@@ -5816,7 +5817,8 @@ static int node_load[MAX_NUMNODES];
  *
  * Return: node id of the found node or %NUMA_NO_NODE if no node is found.
  */
-int find_next_best_node(int node, nodemask_t *used_node_mask)
+int find_next_best_node_in(int node, nodemask_t *used_node_mask,
+			   const nodemask_t *candidates)
 {
 	int n, val;
 	int min_val = INT_MAX;
@@ -5826,12 +5828,12 @@ int find_next_best_node(int node, nodemask_t *used_node_mask)
 	 * Use the local node if we haven't already, but for memoryless local
 	 * node, we should skip it and fall back to other nodes.
 	 */
-	if (!node_isset(node, *used_node_mask) && node_state(node, N_MEMORY)) {
+	if (!node_isset(node, *used_node_mask) && node_isset(node, *candidates)) {
 		node_set(node, *used_node_mask);
 		return node;
 	}
 
-	for_each_node_state(n, N_MEMORY) {
+	for_each_node_mask(n, *candidates) {
 
 		/* Don't want a node to appear more than once */
 		if (node_isset(n, *used_node_mask))
@@ -5916,7 +5918,8 @@ static void build_zonelists(pg_data_t *pgdat)
 	prev_node = local_node;
 
 	memset(node_order, 0, sizeof(node_order));
-	while ((node = find_next_best_node(local_node, &used_mask)) >= 0) {
+	while ((node = find_next_best_node_in(local_node, &used_mask,
+					      &node_states[N_MEMORY])) >= 0) {
 		/*
 		 * We don't want to pressure a particular node.
 		 * So adding penalty to the first node in same
-- 
2.55.0

