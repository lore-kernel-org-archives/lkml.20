Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F037F339
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130552; cv=none; b=A5xsa3RZqajwZhOKSYdt9dWkLl0QQWxbFUYYdViesOo2zbz0SnbMvXJ3sNAU/1NinJZVpf2yDUu7L7GaZwxpfXpIiLTh5fz1G8n2MXRFntpp3C3wBT4IR9c3IartOhsemDo5Y3YDN5xumdTV7CQfK0+uaYCQwt3xlmmlTMqcYmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130552; c=relaxed/simple;
	bh=5BejYXRDjaXsEFSHm/4GOXt9VbHt5qODsu2loC2kU1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUpeo7d1PXWyIBckWSttX/PipI++v7kOHw0lmSRCAvNMY1pSgDWjEcGev20WcS3MoQMDU5+Xc+w7/+ftvYNFlwADZ49XuGUP3Bi/idHc5XVGg9b+J3B46Xe1o2LFOu3yzmz+QV5m2gwPzcWrTs3Ffz4PqA8u/E6TfiRJ8gUpiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Kxa7iJHw; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Kxa7iJHw"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93a0fb2f9efso25673185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790130550; x=1790735350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWWHCDlvz4uiBBqUhZH0RsVaOlDUvVDcH0PiwNo8xZc=;
        b=Kxa7iJHwBqgaYl0DKV0tzCnmeV9uA+nDixUuL9QCmibs20WZQnoXp9DDY3DJvDoh0c
         HmsKGF4NRkOBYuBIOsUNDzMuYRHkSmr18jeLVxmk/XcQpoenwTt+v5u7WKKIDC9jRPON
         tEDCWzoAB7zFAWTRmzWJsZVcRoJDapQz8DWOReWQvsKbMPNfiykl7b5SgF9RA9VACaoi
         YZii+3kWlz7ciak5kc8cyGOYo3BgNKyz37zDZIzjpLPXNDxcqMZdsQkmG2fyk4JUi9UT
         3/fgpvu9oKnokx54TYPetD0IAwuNU4nPZUse4sISfjYDev0+waZ+Fh6UoUv9wzaALBwp
         cpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130550; x=1790735350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWWHCDlvz4uiBBqUhZH0RsVaOlDUvVDcH0PiwNo8xZc=;
        b=MAp+ZyGGNlBTfGoLjLJcaQqQCoxz7H0g5fDfag7vXpXnj+cQlOExj1TqwAid6HqIz7
         PFz/t3EFVL1b3CQPjPR2hBLEurwxvu5xicQlW++jUwYO6xphrgDlblwvJdYJ+ePuXTUG
         f4+9+ByQ2PAAKbJ/yg1fgXeXe/WM3f9TtozOKHk8eKQdq6iFpFOtOlHqmZNfXnoAlEev
         XT/xhyk9H7muEpl3F2Ep+K8dSEfaPMy51ytNuqAc0UjEpaFtgGpRIQ8l8vTfZVxYt99/
         cdlyCxrNJvL9qIuRhuSgx/Z8Cr+vRcSw/MBb48dvoN5Rq01JOLy5DsWBLkRXdyVInHj0
         8xpQ==
X-Gm-Message-State: AFuF++ldMWSP2ngRZUxJe7ANSbCx7dKjl8Z+vjkw8fccVRNgMed12A5Y
	sk0b7DpB6aU2DfbKYVOpGsgeDHRUQwQ+K+toT8nUIA4YHVMbAD7sV8+paSRRQtEulNI=
X-Gm-Gg: AYBFou0qTdFEhZlKgc6Xs3Itd1NP44yg0/HwJzJ6RKc/p9B3QyMsUJgk2NkRsBlrRBe
	ImxH9SXu3ZZzgZoT4YPOn03HqRtZRese6EAKLkPh1KJ9hvBa+DTwJdPvOeRp0UjnC2C2fHpUqG+
	i0F2DE+czpubxKeB2kZxUmEV9eP8SPyVxXRYUF/t3rnse4qQF4L1pWQTc+GxV6zu3EPUD5YGxu1
	unXIaNLNGuRFwf/p4s5/iH+2vf9K4sepRLg3VfU/MObeFp5AMkWNxJwNsEsLcz7Jw0TwVpeDIfz
	ReP4X9sPrCtGgALUpa7eEPoyObMLD/cr0vp1ozpvsOO+vfE/Muo8Q0pk6V3qv5c/ubXZ8zfi7d7
	9q3ahpUSPz1NFPj6zwVfmTVL4R+s7yQso2xLOBS2xgOYQDR4Tzs5GDkLuDNRicJfUYUvaenUeCn
	uvPDgTesERkGgdATdEahO7rgDw3wKA7XNWwBDiiuIjA0scWqMDSIWJNCoBVvx7iXg1O49TGnckY
	iwLX6dELqMp581UYEFVRub5AznWh7B5J0YF/wPQLK8zjJ/2XRv95693qSuG
X-Received: by 2002:a05:620a:4112:b0:939:fbe0:9abc with SMTP id af79cd13be357-93c17e2edd3mr739670285a.9.1790130549781;
        Tue, 22 Sep 2026 19:29:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2482302fsm122626785a.12.2026.09.22.19.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:29:09 -0700 (PDT)
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
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH v3 2/2] mm/page_alloc: refactor build_node_zonelist() out of build_zonelists()
Date: Tue, 22 Sep 2026 22:29:02 -0400
Message-ID: <20260923022902.2433614-3-gourry@gourry.net>
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

Extract per-node fallback-list construction into build_node_zonelist().
Build each selected node directly into the destination zonelist so no
intermediate node_order array or node count is needed. Print the
fallback order as each node is added.

This lets us build new zonelists from candidate nodemasks instead of
just the default N_MEMORY node state list.

Add a zlidx argument so callers explicitly select the destination
zonelist. The existing caller continues to use ZONELIST_FALLBACK.

No functional change: build_zonelists() builds and prints the same
FALLBACK list over N_MEMORY with node_load updates as before.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/page_alloc.c | 63 ++++++++++++++++++-------------------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 7f706e3d7e50..07e03c7c7771 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5866,31 +5866,6 @@ int find_next_best_node_in(int node, nodemask_t *used_node_mask,
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
@@ -5906,20 +5881,24 @@ static void build_thisnode_zonelists(pg_data_t *pgdat)
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
@@ -5929,18 +5908,22 @@ static void build_zonelists(pg_data_t *pgdat)
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

