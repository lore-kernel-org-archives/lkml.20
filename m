Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE37F420868
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386348; cv=none; b=DbwuW9Kq9r2hT26hj8YoNEh0RAT2xW1klHBlviyUGCGWzEwPx4AC/OwwgPMYOkuS6P90Bc6PoV887EEdklxhjf2a2iT/0Nnx+LJFhorliDE+gTDmlhImTx0/mq4mFf5AnC8RBQeYikuDexgZPXZS6D2+tTeMr7W6BsHGudZggvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386348; c=relaxed/simple;
	bh=oSsR80eSVWNOX/nycbByemPUoEr/qyJsIKYILOdRn/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZafTwys6jzp97PqT4dUoT8nmuqFkJWlxc7NnV9VRDcSbj8lz4nPPbnvQ2/R5hOUq5gsZ+pVSKqfHqIqzNlnPSi9XbDZllpMrQDWM8EFgRDPOmhpGqyoxuP8A/QMWWIWUVNh/ppF72lc0Yn1ccT1yLr1QfS3Tp3TGb+OrFe3xzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rNFyn5Mx; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rNFyn5Mx"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-910316a2fc9so8341026d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788386339; x=1788991139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrMSt6X8RvjxMQuQ2xs2fBaN0A8WJe+DFrieWn+26Jg=;
        b=rNFyn5MxxQrAKMgCY0Fjb3PMJ051FnM4iskHx/o/BOAneC8RXmkupOH5FlaWNUSZno
         xHqiWhTnukuVVPv+9FMwt1is5dUBWPbG1HMqjS7eMfIw4iIroxK+asnq/eoZln3Z5Y59
         9tDQPVFuoB8ccjwu2sonySfQsSzd19S0n/IUejmDyiNbrjfZEBIwQWcVcL6o9DO9Hix/
         z8oFl6binUzeCEvlcFYQ8WMXQ1lxlM5Fqez7ZmVJtim1kICkkd1PdNi9SkM4+igtGSHz
         sViL9tiwqnQijewo04NCqZ+zDbBqyIvkJRPKBQwdz9MMyY4W0L/fv/TqGeDIgN4UkNP4
         libg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386339; x=1788991139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrMSt6X8RvjxMQuQ2xs2fBaN0A8WJe+DFrieWn+26Jg=;
        b=DS0FACeIn5kLTPZ4UbUaJtA83iUwmZVv09GES6pgOR1e8VNsreMZwPaSrkdIYKKQ+a
         7tUqdUTCe++YCq73wLgiRywUvuNegEuPWB83C+memiGo6V9rlWwwcft4TLcZ+I7l4M3R
         nYvei34dwp8SvqwuUNBE6T44eKMHf85tGS9Wm6mZHyUmBDgNZ9uSBmbDhrisK7UL0tUL
         GM29Lgdw0Pcy92WSDN4KqNPZroo8zJdQQ4DZ5P3XohjW4jUDzueb79RZkSmlCgnKruQ1
         H5JASHY2/Q29U/NvP9rUbXbI0gAG9YAdz0jHIH3mV2NaFBvvz4LfJTvPR/ZEmuT8GaL0
         HqSw==
X-Gm-Message-State: AFuF++nvNoxdDec3GRqrV0DXU+bUQtIX46a9cbrZcsngIawz7uHWq/Br
	+SetpFrlnK0sf8dzGZiHrI96PqgeSX5owLHLRiwurC+Y8K4Q7AwQrR4I978U5bfxnn8=
X-Gm-Gg: AYBFou1rzCfJu7WqPVbnY5nlmRFyp6P7sNeXqKfXurGC3i6/Rds9rEN/3C0gZZsq+Oi
	5ZEkQKO6bkGmhspFiElDa/1KF+QBdBiO1yJ7Xw3Gr9q+gpIuAhvtmf3DIzwNuCPNqRsLQmZg9le
	QIkZ9qUjIdKZoXJ2BUeDUXUgXSrecd+dR9IaPAadt5cA9Cu2+jJvhJKM1dhk/QFHFiE2H0Dxzkn
	ZwMMUtCq0q+SN1Zs3YaW/b3smuiLlxS9aQMwhaja6rIoZVb8u9hvuwGIxURVxAD5LBsl4N5mwuj
	awnWKD4GkZ/IsFKT3/tbd0BkY+FeSpT06V8RKQsCQlLiF0ecfm9tJfh09vuHePGR8gk8ypOQJ5j
	sMuOtjt/WIV64nUmT4wm/onE4Xv0KjHcUxzuv9XdN5PLhX+SJlz/12lZr/bYSFkJG2qeENdumhT
	qf3CidLQgfF6QVtWeQ7gCbCrJdTQD7he789cAL25mwhgJJwJH033dWDnNYi2IN+x2XTKhjTLgzk
	IEsU11K1GgvMI9RwOvkFWMQt8qkwx2kDtMGE0ODIe/1We2QrA==
X-Received: by 2002:ad4:5ca3:0:b0:90c:d2e0:efcf with SMTP id 6a1803df08f44-910327a4d10mr48897596d6.30.1788386338868;
        Wed, 02 Sep 2026 14:58:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ef0ef6csm27578886d6.44.2026.09.02.14.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:58:58 -0700 (PDT)
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
Subject: [PATCH 2/2] mm/page_alloc: refactor build_node_zonelist() out of build_zonelists()
Date: Wed,  2 Sep 2026 17:58:53 -0400
Message-ID: <20260902215853.156267-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902215853.156267-1-gourry@gourry.net>
References: <20260902215853.156267-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract per-node fallback-list construction into build_node_zonelist().

This lets us build new zonelists from candidate nodemasks instead of
just the default N_MEMORY node state list.

No functional change: build_zonelists() builds the same FALLBACK list over
N_MEMORY with node_load updates as before.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/page_alloc.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4dde1cbe2fd43..e1d7c8b221d0d 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5849,12 +5849,12 @@ int find_next_best_node_in(int node, nodemask_t *used_node_mask,
  * DMA zone, if any--but risks exhausting DMA zone.
  */
 static void build_zonelists_in_node_order(pg_data_t *pgdat, int *node_order,
-		unsigned nr_nodes)
+		unsigned int nr_nodes, int zlidx)
 {
 	struct zoneref *zonerefs;
 	int i;
 
-	zonerefs = pgdat->node_zonelists[ZONELIST_FALLBACK]._zonerefs;
+	zonerefs = pgdat->node_zonelists[zlidx]._zonerefs;
 
 	for (i = 0; i < nr_nodes; i++) {
 		int nr_zones;
@@ -5883,26 +5883,28 @@ static void build_thisnode_zonelists(pg_data_t *pgdat)
 	zonerefs->zone_idx = 0;
 }
 
-static void build_zonelists(pg_data_t *pgdat)
+/*
+ * Build one node-ordered fallback list from a candidate nodemask.
+ * update_load round-robins node_load across equidistant nodes.
+ */
+static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
+				int zlidx, bool update_load,
+				int *node_order, int *nr)
 {
-	static int node_order[MAX_NUMNODES];
-	int node, nr_nodes = 0;
 	nodemask_t used_mask = NODE_MASK_NONE;
-	int local_node, prev_node;
-
-	/* NUMA-aware ordering of nodes */
-	local_node = pgdat->node_id;
-	prev_node = local_node;
+	int local_node = pgdat->node_id;
+	int prev_node = local_node;
+	int node, nr_nodes = 0;
 
-	memset(node_order, 0, sizeof(node_order));
 	while ((node = find_next_best_node_in(local_node, &used_mask,
-					      &node_states[N_MEMORY])) >= 0) {
+					      candidates)) >= 0) {
 		/*
 		 * We don't want to pressure a particular node.
 		 * So adding penalty to the first node in same
 		 * distance group to make it round-robin.
 		 */
-		if (node_distance(local_node, node) !=
+		if (update_load &&
+		    node_distance(local_node, node) !=
 		    node_distance(local_node, prev_node))
 			node_load[node] += 1;
 
@@ -5910,8 +5912,22 @@ static void build_zonelists(pg_data_t *pgdat)
 		prev_node = node;
 	}
 
-	build_zonelists_in_node_order(pgdat, node_order, nr_nodes);
+	build_zonelists_in_node_order(pgdat, node_order, nr_nodes, zlidx);
+	*nr = nr_nodes;
+}
+
+static void build_zonelists(pg_data_t *pgdat)
+{
+	static int node_order[MAX_NUMNODES];
+	int local_node = pgdat->node_id;
+	int node, nr_nodes = 0;
+
+	memset(node_order, 0, sizeof(node_order));
+
+	build_node_zonelist(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK,
+			    true, node_order, &nr_nodes);
 	build_thisnode_zonelists(pgdat);
+
 	pr_info("Fallback order for Node %d: ", local_node);
 	for (node = 0; node < nr_nodes; node++)
 		pr_cont("%d ", node_order[node]);
-- 
2.53.0-Meta

