Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4129B385D83
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789182274; cv=none; b=Wtquc+q8VfvBvyInUl5+YdVW2R4hXNoR3tWjtwFt8z2CitRfFL+INX8uc3pi7TWyEhEGtvIRKGO9y+i4xqV4yOWBuk+LZRe+uwhatjjXHEbByQ8uPABUDkFgoF2QkoqNTY+7gVl4eKdIVTEF+DAuXLLVbuG0IjYKGSMnvW07wgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789182274; c=relaxed/simple;
	bh=gjx27FDXG8SgLeoaq0Wo8ZxlupU6Oj73FPP3NgswvwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izAa9D4FOrfacbUEoXucUj2xgAV0EUz+Uv+KttUVnykjkOoYz/SrA+VtaQEF89Lkl5HyTH05JyCX+z4oxUTFqqbHyuaige2vVuLupQknMunmka+qMx5fQDtCDaUEUYAfPRMR26ZxZa7X9kNyQlPB73F7ms3rHitC8P8PbDnD4rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QxIy6itq; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QxIy6itq"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910399d8b09so1892796d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789182272; x=1789787072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxIU5xWvvJNvSs/zUIGzI+Vs/buRWaBwnwkaFkIAvLk=;
        b=QxIy6itqPp2B0r7noOJStE00bUHh+yG0BflmgzX2juoZFQQ2viCFV9H9oMD9S4X7WP
         k9hb+RJ/vgpkS8IvTpCtbybIghNMKtsJfDKeFP1unG1ZroGPme5lZfxm8x1YvJ/TmbkK
         nHx5NfGxTl4g5Yegg7vruDCz4umZDTJAHcWJ1E6qvbxK/FCrnB1ZIMZs333GmhWHBs3P
         kz7L9JPJxHhlxq/pU4R7JnaCZ3JlSgy6J9NHl2C8K+KcxJaYnb4o/64x0UNLajVUy0Dc
         V5Rfp0UPSi5+wyRPxxMTvfenH5AVu/hZdWNuYZYiyNieA0TLWIWV1BPhGp6kk+5jtQJ/
         IYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789182272; x=1789787072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxIU5xWvvJNvSs/zUIGzI+Vs/buRWaBwnwkaFkIAvLk=;
        b=PSQh2hpvLe+NtKvNgzHB4O1y2ygUFWHxSZ2V83J4L3GPbtCBPSLZBXGwxhcft2IEtH
         fQHonhbrxGvFW3fc1S6AzjZbjRkKqUrjjDcKiEpCF/qBWaDvRKE9SzkbFlf0qJByR3lD
         ZHWKHQiSb4JE37VyzkijoFsm6JNtLDL9kLt02q1KCWW7NYkUz/JeVyrZREyfmDq0pAOO
         Z5vt+mPpZWFKfGWsoQ49tAPj5wAhqvuzJYzlMiwCL4oGACCXlj6gYiWuPEMA78pEu7pT
         NKDF2Jc1qsQJL6au/leukI5MsiZ7Lsfl67WJLW8EObzZ+ttJ1M+4b4XyoCQ2yevcKWSF
         UF4A==
X-Gm-Message-State: AFuF++miFhKjoP2vtBg2Q3LSVNeqCjCwOk/QN0KPFg3PSt9HxcUsKvR/
	Kt3zF2qjVqu13g4IxwHWpIvYf9FiyOtkKwtlRxQnQub4sV/qiAU0s/SP5Eg0O7bvEC4=
X-Gm-Gg: AYBFou0DLRmyD91VF8GC70zOPAX2KswF0RpWCwHrEhsQnBxhWcWkmoy2ndx09/IHBhj
	HT9I1EVo/rsv33odPNhBvjCcPt4o7jloeaHOeNBVePz+ABtccXyyOiPHcwG3ABBQKsMoL0PBDmN
	x+zQ4uMPqCvlzGxT7kCcNs5MD9IzFfUfw/4bW3rqh0b971/MmtOZlZJ133PgVoAJQHodOLzdV/L
	9l4e578p/jZskQJyiAH8GqLcRA84zEIi0YcAXsRyQsdbLQxjGrDSXk8bwZac03P5XCDJfOt8LuY
	ukAhedOF90Kv9XGmWOgZjyR9bMLqRCuGnK5oy3cfjNxA6/4VvPemlcAx2+7pfHw3Q6KqTjCAteB
	tWYR6pQD+gkrVgChI5Ql0zd0s+q0PluUthImEv6EXpZtJgRgOVwh5wyfT2iigWI+iVudEHBJosg
	wl6DQGGbJqihHKrAEM7UucHo7JSyfmiV6ZsbYPNrFBbuuR1SfA1M7lr7rxFEUeP2U+Qi68cuTgt
	EbIEeR2khVKUERQwg1v5B2YBExsPdhvTZpbbMsZbP86aE4WurkSGCcKamdZ7FQOp6IuTyw=
X-Received: by 2002:a05:6214:2685:b0:912:bed:c74 with SMTP id 6a1803df08f44-9121da7ecd7mr19424046d6.30.1789182271965;
        Fri, 11 Sep 2026 20:04:31 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f202856sm36085296d6.2.2026.09.11.20.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 20:04:31 -0700 (PDT)
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
	ziy@nvidia.com
Subject: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out of build_zonelists()
Date: Fri, 11 Sep 2026 23:04:24 -0400
Message-ID: <20260912030424.2889731-3-gourry@gourry.net>
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

Extract per-node fallback-list construction into build_node_zonelist().
Build each selected node directly into the destination zonelist so no
intermediate node_order array or node count is needed. Print the fallback
order as each node is added.

This lets us build new zonelists from candidate nodemasks instead of just
the default N_MEMORY node state list.

No functional change: build_zonelists() builds and prints the same FALLBACK
list over N_MEMORY with node_load updates as before.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/page_alloc.c | 63 ++++++++++++++++++-------------------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 7efce139d562..d1888d5630e0 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5857,31 +5857,6 @@ int find_next_best_node_in(int node, nodemask_t *used_node_mask,
 }
 
 
-/*
- * Build zonelists ordered by node and zones within node.
- * This results in maximum locality--normal zone overflows into local
- * DMA zone, if any--but risks exhausting DMA zone.
- */
-static void build_zonelists_in_node_order(pg_data_t *pgdat, int *node_order,
-		unsigned nr_nodes)
-{
-	struct zoneref *zonerefs;
-	int i;
-
-	zonerefs = pgdat->node_zonelists[ZONELIST_FALLBACK]._zonerefs;
-
-	for (i = 0; i < nr_nodes; i++) {
-		int nr_zones;
-
-		pg_data_t *node = NODE_DATA(node_order[i]);
-
-		nr_zones = build_zonerefs_node(node, zonerefs);
-		zonerefs += nr_zones;
-	}
-	zonerefs->zone = NULL;
-	zonerefs->zone_idx = 0;
-}
-
 /*
  * Build __GFP_THISNODE zonelists
  */
@@ -5897,20 +5872,24 @@ static void build_thisnode_zonelists(pg_data_t *pgdat)
 	zonerefs->zone_idx = 0;
 }
 
-static void build_zonelists(pg_data_t *pgdat)
+/*
+ * Build one zonelist ordered by node and zones within node. This results in
+ * maximum locality--normal zone overflows into local DMA zone, if any--but
+ * risks exhausting DMA zone.
+ */
+static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
+				int zlidx)
 {
-	static int node_order[MAX_NUMNODES];
-	int node, nr_nodes = 0;
+	struct zoneref *zonerefs = pgdat->node_zonelists[zlidx]._zonerefs;
 	nodemask_t used_mask = NODE_MASK_NONE;
-	int local_node, prev_node;
+	int local_node = pgdat->node_id;
+	int prev_node = local_node;
+	int node;
 
-	/* NUMA-aware ordering of nodes */
-	local_node = pgdat->node_id;
-	prev_node = local_node;
+	pr_info("Fallback order for Node %d: ", local_node);
 
-	memset(node_order, 0, sizeof(node_order));
 	while ((node = find_next_best_node_in(local_node, &used_mask,
-					      &node_states[N_MEMORY])) >= 0) {
+					      candidates)) >= 0) {
 		/*
 		 * We don't want to pressure a particular node.
 		 * So adding penalty to the first node in same
@@ -5920,18 +5899,22 @@ static void build_zonelists(pg_data_t *pgdat)
 		    node_distance(local_node, prev_node))
 			node_load[node] += 1;
 
-		node_order[nr_nodes++] = node;
+		zonerefs += build_zonerefs_node(NODE_DATA(node), zonerefs);
+		pr_cont("%d ", node);
 		prev_node = node;
 	}
 
-	build_zonelists_in_node_order(pgdat, node_order, nr_nodes);
-	build_thisnode_zonelists(pgdat);
-	pr_info("Fallback order for Node %d: ", local_node);
-	for (node = 0; node < nr_nodes; node++)
-		pr_cont("%d ", node_order[node]);
+	zonerefs->zone = NULL;
+	zonerefs->zone_idx = 0;
 	pr_cont("\n");
 }
 
+static void build_zonelists(pg_data_t *pgdat)
+{
+	build_node_zonelist(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK);
+	build_thisnode_zonelists(pgdat);
+}
+
 #ifdef CONFIG_HAVE_MEMORYLESS_NODES
 /*
  * Return node id of node used for "local" allocations.
-- 
2.55.0

