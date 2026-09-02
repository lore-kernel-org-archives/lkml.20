Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89790390214
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386359; cv=none; b=lH1MCO8YxMkmwisSPYD2i/C0lCOysQRxElgtT/nGJblR76YcyNTOdWr8ORQ20/vPbP/ZKkczrI+qSOYHgR5h9/GOWcXV0X823DjdX2HlECzCSdfh9Q1+ycFAkk6elTM7XtqS7gGiHFP/5WgeY8Ech0RmhScQJPDHo1FWN/li8Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386359; c=relaxed/simple;
	bh=ZBSBacC6OksRJ7tDhUU7udnfGu3Xkq0kGWKWISxrI3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0LjiO2WrVMB+WBBIxjevnP9MQEEjRZDnn74xBfyXS9uNyGy2v0M38k6bfRI/j9+NmxZkaM02PsMNLtJw2g1aliN6SrN8cw0+BZQEBZWProFkjDW8X1UHqvE3z5Zhf3hQ8AZZdewtlZ0o93dXQvJ30q4XctoD9abDqMaafBF4IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nbIZTED7; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="nbIZTED7"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90e7bde5596so16504566d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788386337; x=1788991137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZSNl67a4z/Ek/H1r9xgDJx4ye1r3GSWdBoGj8sqRqk=;
        b=nbIZTED7dYtqO1WnPdYzn3ZgCxM05fAJaQG0XfykrBi2pU4L5x3038vyJQrqMgSzps
         GBug0+JgGvpDpW41D8Z6rWPfhVOUn0b7RildMZ4dkFe4qwMenrPjYR1jQ8yLcBa8vkME
         BeM0zaxBhG5rNyUZyvT/qcQbqgJ8/CkO35oLKukRL87bHDuG4h3+NRdWfQS8wEVzuW5v
         HLwb+umVJ4Y9nHpqBw3JGM8z6MhjaST4RpR79S7i2AOe8Pu9H65/gAF+TSzp3Ccp/y9E
         0yBgdilTQyUti8qql7TuncpgR2CI9aUc9ATR+CKvqUbb2UbZc0BWeIZy1qzDtjpzDMw5
         Xl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788386337; x=1788991137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ZSNl67a4z/Ek/H1r9xgDJx4ye1r3GSWdBoGj8sqRqk=;
        b=YlPaHaUcr2G/+MiFxHKSboKplEfUnqNtUYLTqoqSm4hxLHUuIWe0mQV2VTHHcGan9c
         1Gup9Le+7BUT9gOKF9R++q05zUwTJnSRghZAfRtsVBoXAt4FC6Ms1xj4hkvIM+6/Ffxs
         aL1iY1RzxmVXBC7FhkSAa6/e4BjLgU8WuIVhDQUMnv6rcF7agEw49Gr3YbwSffTnW+Ys
         cezMq/Lrp1N3h4TfowGMl5sR+5bJFU0kfkxHUwDJs2AU9/OnfKhwdfUa3S+ZEe5te5mN
         f/6M7uHs0W3pEfcPV2aF5/KRlrHjBfVecI2t9zP1VAFYF+NMGYs8+Q0o3X7XepK2CHuT
         yC1A==
X-Gm-Message-State: AFuF++kzBcVeZS6ehrA06zsoW9aXxvJuwOx5q01XT1PkMTJFIxbh8M6+
	ennTzR3GzyQpBaW5xN8qxqTSv1BxHil9vqiIsEvEoW8iCmMfhebkFXRTKIEJ2pj52lQ=
X-Gm-Gg: AYBFou1QcmtYRAJgJNdlT35DJIF1gpiS1/7qA6cLPctgvnYDmmpQ8lN8upSg6Ph/0uy
	BujXc481pV/U6COq3VIQqX/pvWAvQHTUIbBwQyb8uCTJ053N/COWg7PTGmXtRsOdCWmNvpnMxXM
	UfZ9KJ6xr94DvC69frRj3jkbmGMwNeolfVQ9oHW2Yxyg1ktEPmggRnCt6XJaBrmhVQ3oMWIbZEW
	RZnMLaS4EvTt5jMnOHxpac+xWlI4E9dIS9rzjZ+VZoJ5ujeoxx68eFB/mF9zMreawEs9z6Y5pJO
	zzXXd7EKG+BmHXvGFOvkDQpRAqJuUHCafJ/zo7TJIXQCCs3Fr42lMVvrCWk3O1Y5BOCTo6hVArk
	NJamgQnvvFuew5cfLLzrMzAroFXclSUBWyQPr/7jl/X3DoBZunqq3jQylMy6MAn+5z+cgRXPvkl
	6oKhkHq94S/VGFKi3M+Xhu7Aj4mA5tzKP0BRRBrSg4P1OTaa78ByPSLkGDfFUTKqSQhSb7hOPAd
	jHVKQGi5WEwwIa2EyS7vczZn3PREdOFiuHUtHLTfvHueLItEg==
X-Received: by 2002:a0c:ec12:0:b0:910:3451:343 with SMTP id 6a1803df08f44-91034510417mr24522816d6.34.1788386337360;
        Wed, 02 Sep 2026 14:58:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ef0ef6csm27578886d6.44.2026.09.02.14.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:58:56 -0700 (PDT)
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
Subject: [PATCH 1/2] mm: refactor find_next_best_node to find_next_best_node_in
Date: Wed,  2 Sep 2026 17:58:52 -0400
Message-ID: <20260902215853.156267-2-gourry@gourry.net>
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

find_next_best_node() picks the next-closest node for a fallback list
from the full N_MEMORY set. Refactor it into find_next_best_node_in(),
which takes an explicit candidates nodemask.

This enables building fallback lists with non-N_MEMORY candidates.

No functional change: every caller still selects from N_MEMORY.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/internal.h     |  6 ++++--
 mm/memory-tiers.c |  7 ++++---
 mm/page_alloc.c   | 13 ++++++++-----
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index e16f1250b25c8..18d041ff5c52c 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1130,7 +1130,8 @@ extern int node_reclaim_mode;
 
 extern unsigned long node_reclaim(struct pglist_data *pgdat,
 				  gfp_t gfp_mask, unsigned int order);
-extern int find_next_best_node(int node, nodemask_t *used_node_mask);
+extern int find_next_best_node_in(int node, nodemask_t *used_node_mask,
+				  const nodemask_t *candidates);
 #else
 #define node_reclaim_mode 0
 
@@ -1139,7 +1140,8 @@ static inline unsigned long node_reclaim(struct pglist_data *pgdat,
 {
 	return 0;
 }
-static inline int find_next_best_node(int node, nodemask_t *used_node_mask)
+static inline int find_next_best_node_in(int node, nodemask_t *used_node_mask,
+					 const nodemask_t *candidates)
 {
 	return NUMA_NO_NODE;
 }
diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index 54851d8a195b0..25e121851b586 100644
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
index c4dc61ec663ee..4dde1cbe2fd43 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5779,9 +5779,10 @@ static int numa_zonelist_order_handler(const struct ctl_table *table, int write,
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
@@ -5793,7 +5794,8 @@ static int node_load[MAX_NUMNODES];
  *
  * Return: node id of the found node or %NUMA_NO_NODE if no node is found.
  */
-int find_next_best_node(int node, nodemask_t *used_node_mask)
+int find_next_best_node_in(int node, nodemask_t *used_node_mask,
+			   const nodemask_t *candidates)
 {
 	int n, val;
 	int min_val = INT_MAX;
@@ -5803,12 +5805,12 @@ int find_next_best_node(int node, nodemask_t *used_node_mask)
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
@@ -5893,7 +5895,8 @@ static void build_zonelists(pg_data_t *pgdat)
 	prev_node = local_node;
 
 	memset(node_order, 0, sizeof(node_order));
-	while ((node = find_next_best_node(local_node, &used_mask)) >= 0) {
+	while ((node = find_next_best_node_in(local_node, &used_mask,
+					      &node_states[N_MEMORY])) >= 0) {
 		/*
 		 * We don't want to pressure a particular node.
 		 * So adding penalty to the first node in same
-- 
2.53.0-Meta

