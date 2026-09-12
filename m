Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D02223BD1D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789182273; cv=none; b=OqUnaMC20jwyaW7xpqBbBaO/+/ShCUguouc4RbozpFE8pl8Z1S45Ec/2NUY/MRS/4pS+CMKwOajbGB8bkeKmH47419xj9EgL/beV9ht4jYr63ZymCaEMphPLtV0YfoeVfnLWpdmH1Lbkh0giSKsO4+FtoXDL7YUJiJgH1g/+leo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789182273; c=relaxed/simple;
	bh=UumXD4YpIiaTE+6DzaH3TiHCesszgH7gFWbWLue+XkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoFFRc6iTwWI7CLR/NKe5hvP6zo4loqyQEC+ra75xXX1LCNrABqyQJuGvB2tYC26cYw0FhgUh22Imf61TXyOvCCSEO3ktVtAZmDk7jBtNGzT7JbBCcZ0wbNtp0K7IWDkKbI24Y/sNsjOya1OUlI4iBe2YwsQZOzqUjYzbHCpMGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=RAFLJaSC; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="RAFLJaSC"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9103228ef53so16838146d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789182270; x=1789787070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47nBXTe0p7S8h9Q2JUen+5KKbEFQG9U2loUXl5hvd/I=;
        b=RAFLJaSCV9/WY60wNvP1Y29xIGkys4wLLQQ6uDBB3vX6EHLUfK+D7CQtLxbSry2n8G
         1QbCw13Hy3gL2cnR3Ol5DTyySJGuSOdiMj5axUA54BCBU61d0Cp5lNUgKift+3orNUyb
         Bn3bAUuneHWRI3CL9QeeitszkEB8xFPaA584lh26yZ6aF6RVake7nWjzDNkC4M8cgAfB
         9BaKy4svCnw/aSyRiQp3yt46gIh8lnbPsBYP0mjOK+XZ6vMJLYRbnOby4alDJxBkZIfY
         HtucsrBGk12FkbBnrlp0hjOBbOFc7LmN5D28LIuuisJ3W1wtYJTIs8jJZ35OQDrTziaA
         SebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789182270; x=1789787070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47nBXTe0p7S8h9Q2JUen+5KKbEFQG9U2loUXl5hvd/I=;
        b=g1ZoZ/tdJ4i31EXvmO4Lyo+MpgDvZDIS5gmdmVHPBDAAKhURnSuiBcBKdjXaMtRO0u
         mezfQ26m9YMFJSscgtB0zqupD3eXXCHmJXRFjLNepmBlw0z45WINtkf2iFhHuiQygeB5
         kgeY42mPw+mUUZ8j+QWCpWOHYaLcM2P0bhTAeTRrlY+D50moYs2RxKqOHMAUsc191vVV
         P9QF58saoaVX+ILCClfjXpyCzksfck1qzSEqwG6itQca3y4oadVzgHbqh6lCUvaosx1f
         4kyw3FG8eyI6nAzx9E7hOm7FNmBRPGhOafyVktUgWCNFUtUg82wdlXph+gUEuxsCNxjT
         PrSA==
X-Gm-Message-State: AFuF++liIe9OqiOufdHeHWVOW+W6lr+fXQyEQLXjZmjzJIaMz/FKVUVS
	cOEXunIZNf00z3a+uoDyA4v0rqGNnDTz9onBFdOi1H36PDVmyYkMZoMeAto0NvSVRkA=
X-Gm-Gg: AYBFou0pCmE3mkJcBzTUWmuzu7dpARd0+Ph4EQzFtonRlMR2IkAKeXFdBIPbDVeeuJ0
	tnoe5xuQrVobQnCugNYxH1rfNS6BocnON5CWxRiMoNaildWpUXStseIDeam4nc3ztDzv37Xtn3u
	B0l8iheEoXLEmDiMXollSZi6xqqI09ip6mxJPScFYyqgLT+uNUtE16z2SL7NAalUotnmhGdjFW5
	ZP2JtlSTefyi4fsvw0nWV6LymoKaSnASQcRL99+tTnXPToP6kdye484vLpG38ml6MTn5jwTpyRQ
	yyJT2gz29MBio89XEWPIg9pjvLZjI8fjm6w/hGeX6oED9OIYGEUJwc9vYu3yJ7fNE0jwVn6ZVmo
	HvU4dunc4ECqHoclU4R8aFLD5lF4tXWMXiw/q5D672xTr8Ir4rz03j7fTKT4ifqFEV4g3xjJy1s
	HRbKpRFps0uagY7I6l1nudhqs7rFJQPZgfvtZezEEU2Tbs6mDjeALPfvdEd8ZO8Odl79R/TDsx4
	XXpcLUSzLsFi7nR+lRZyWMjQ7XQD++Xk6iSqPacLIn3RccHJtLzvngXk8vP
X-Received: by 2002:a05:6214:212e:b0:910:44be:42b8 with SMTP id 6a1803df08f44-9121207d62cmr104319336d6.6.1789182270357;
        Fri, 11 Sep 2026 20:04:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f202856sm36085296d6.2.2026.09.11.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 20:04:30 -0700 (PDT)
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
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	Balbir Singh <balbirs@nvidia.com>
Subject: [PATCH v2 1/2] mm: refactor find_next_best_node to find_next_best_node_in
Date: Fri, 11 Sep 2026 23:04:23 -0400
Message-ID: <20260912030424.2889731-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912030424.2889731-1-gourry@gourry.net>
References: <20260912030424.2889731-1-gourry@gourry.net>
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
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/internal.h     |  6 ++++--
 mm/memory-tiers.c |  7 ++++---
 mm/page_alloc.c   | 13 ++++++++-----
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index da14c56fb24e..1519dd21a900 100644
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
index 1cfbd0582a10..7efce139d562 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5793,9 +5793,10 @@ static int numa_zonelist_order_handler(const struct ctl_table *table, int write,
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
@@ -5807,7 +5808,8 @@ static int node_load[MAX_NUMNODES];
  *
  * Return: node id of the found node or %NUMA_NO_NODE if no node is found.
  */
-int find_next_best_node(int node, nodemask_t *used_node_mask)
+int find_next_best_node_in(int node, nodemask_t *used_node_mask,
+			   const nodemask_t *candidates)
 {
 	int n, val;
 	int min_val = INT_MAX;
@@ -5817,12 +5819,12 @@ int find_next_best_node(int node, nodemask_t *used_node_mask)
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
@@ -5907,7 +5909,8 @@ static void build_zonelists(pg_data_t *pgdat)
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

