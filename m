Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F637F8BA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296972; cv=none; b=tU/hgdgak3wJrV1/5OgFj9u+QCrsVQKvYqHPkMQF3v7AZ0DiOQeJFuec8Cg977D2AcWn4gmS9lslcMtgGzyYapEt4hycxhq/xgwvt4tjS7+tE85u9D0jGHHZ2UmM/Ptpn13bbgEAHdgPUU+xYj4dxp7kL3X1ncfCzBtXCXI96AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296972; c=relaxed/simple;
	bh=KYBz7AewSTIw7ztItMXpu0v7NMpn+E4TS2AQy673wUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oULIpPXuhptCUIHMzNsDwct7oniSCdgc1FJXj6JRsrkG7bG9f9FaLOzyeiukqNy3RWxsm+rITu8DPnpw5JGKJcbuGtwCXAxfbd5cjIL5Cz8wXqyFWq3ndTouOHPpuoUxwMJGq0AkhepKRCURdRDdXgl2mbU/NZHPR5ldve2yNX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXoyoO9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXoyoO9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E081F00A3A;
	Tue,  1 Sep 2026 21:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296971;
	bh=8MsoSAxOz5GcDpSDTQ8RtLDPUGoX5sUB0zFT+7mh8Fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cXoyoO9g+TzRgl+yAsMLQe4Jb6Nb9C7OykSqf28NYqQmfV3VdCXRB9ofmONEOVQt4
	 sgrtz+UlHosqsOOUKMn+bWxWS1Qa5kaJ5J46qknRxHlnHWNxQsDSxBsGCs5e7eTKVZ
	 Hx+pMnbmNXORm2CC6aUsILvnZpKtPSNFTHPX6blKxLhvbARgOcXjm214q08xoX29b7
	 UJ+kcfQ4izUeTbzmyJB/lwq2Gf2T8vymUVXaP4XU56B2WcsRt3fFMqsdt4hI8A9wBz
	 s/pDWw5GwzcXxY4CtPlEOhzoXsdHUm/q67IppwPrbC92Ixkoj7ZSmo8xtuuNm6xqpV
	 hF7YkUSICULLA==
From: Tejun Heo <tj@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Yao Kai <yaokai34@huawei.com>,
	liuyongqiang <liuyongqiang13@huawei.com>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 1/3] workqueue: Add for_each_node_with_fallback()
Date: Tue,  1 Sep 2026 11:09:27 -1000
Message-ID: <20260901210929.3092513-2-tj@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901210929.3092513-1-tj@kernel.org>
References: <20260901210929.3092513-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per-node arrays in workqueue carry an extra slot at nr_node_ids for
NUMA_NO_NODE, and iterating them open-codes for_each_node() plus separate
handling of that slot. Add for_each_node_with_fallback() and convert
alloc/free_node_nr_active().

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/workqueue.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index d4d6bb8a23f5..9c69efcf5e2e 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -622,6 +622,26 @@ static void show_one_worker_pool(struct worker_pool *pool);
 	list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node,		\
 				 lockdep_is_held(&(wq->mutex)))
 
+/*
+ * Per-node arrays in this file carry an extra slot at nr_node_ids serving
+ * NUMA_NO_NODE. Return the slot after all nodes.
+ */
+static int next_node_with_fallback(int node)
+{
+	if (node >= nr_node_ids)
+		return nr_node_ids + 1;
+
+	node = next_node(node, node_possible_map);
+	if (node >= nr_node_ids)
+		return nr_node_ids;
+	return node;
+}
+
+#define for_each_node_with_fallback(node)				\
+	for ((node) = first_node(node_possible_map);			\
+	     (node) <= nr_node_ids;					\
+	     (node) = next_node_with_fallback(node))
+
 #ifdef CONFIG_DEBUG_OBJECTS_WORK
 
 static const struct debug_obj_descr work_debug_descr;
@@ -5052,13 +5072,10 @@ static void free_node_nr_active(struct wq_node_nr_active **nna_ar)
 {
 	int node;
 
-	for_each_node(node) {
+	for_each_node_with_fallback(node) {
 		kfree(nna_ar[node]);
 		nna_ar[node] = NULL;
 	}
-
-	kfree(nna_ar[nr_node_ids]);
-	nna_ar[nr_node_ids] = NULL;
 }
 
 static void init_node_nr_active(struct wq_node_nr_active *nna)
@@ -5078,21 +5095,15 @@ static int alloc_node_nr_active(struct wq_node_nr_active **nna_ar)
 	struct wq_node_nr_active *nna;
 	int node;
 
-	for_each_node(node) {
-		nna = kzalloc_node(sizeof(*nna), GFP_KERNEL, node);
+	for_each_node_with_fallback(node) {
+		nna = kzalloc_node(sizeof(*nna), GFP_KERNEL,
+				   node < nr_node_ids ? node : NUMA_NO_NODE);
 		if (!nna)
 			goto err_free;
 		init_node_nr_active(nna);
 		nna_ar[node] = nna;
 	}
 
-	/* [nr_node_ids] is used as the fallback */
-	nna = kzalloc_node(sizeof(*nna), GFP_KERNEL, NUMA_NO_NODE);
-	if (!nna)
-		goto err_free;
-	init_node_nr_active(nna);
-	nna_ar[nr_node_ids] = nna;
-
 	return 0;
 
 err_free:
-- 
2.55.0

