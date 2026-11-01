Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533474;
	b=B3cGmJskyv+WLfkie8Mwd9qSnFf+Y6Ofs7Hfp83+zONNRvaZ8w8A/uNNsBlJerHs+C9o
	 nWnN8L+Amc2DXGJBZgdCj85sssUDhlks4QSKqYMoK9e0V5Ld25kVJn6LmL/Bhig/INCQY
	 7W+z4/8ThaMdXbdofBSG4uiAWQB0+0aC2tKfC2rYHZLZStYES9a8BXsd5xTLrzGHBxlZU
	 Wl06iEeIt+iuorQf7ozfXLTw6XhQLa1UXAXiDAIjNuj9u60kYCbJhDAFIP5NpblPpaLid
	 Kqak2rbqP6Z956sKQRIds8B7jV1tcLNBY4KZ+AjWyNtKR9T4ok3MAw7HqVapC25VYAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533474;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rPBOoOcn9YMa0HEDJ36VCsFrf4Utmcf9FUz58dfJrw0=;
	b=fy3aEPg5wRk9q00B8eR55FQX9PxJo9QnM4RbDFIn1CBd/LbFcvr1QYwLVisJXZNIatUR
	 BpI1ccqsaWMqwWIdc3ATFFERJXvWxCx0FVM3Z/TzwpKK8HTEIb03zgCab7GscEQd7Jgnr
	 V2fhv5F7/wdN1tgquoU+vZoqgDHjsyxmr3IZr6A3x2HgjRDZ/dDSQzoLB87WBPGurv4+N
	 GMn6GfxSETuRvMLB9yO4igTREYiAqzq640K1ng+lJEa66j5cA8D0zj2wWz609eTUaDkoo
	 iwiKTbYkjeiswlUw/CCAn47WKhWplgsbxoN7SATKlMUml96/VQt6PninH12ks8MEIVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VWU0IpO7;
	arc=none smtp.remote-ip=95.215.58.172
Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C88606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C88606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VWU0IpO7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KL5oNnXhKIdDZYsvWHer6MnCUgiQKpM/9l5bnswtm58=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793533471; v=1; x=1794138271;
 b=VWU0IpO7km9lyyS6SxppOS7g4xEidP4H3aD374t1xt3c7MMy/okg/bEOcgHUV/7HgQuiDKBm
 MsuQFkfr6VUAispe21E+v3BOLCQaYqBxLxkIh9YusP5ihGSi1R6UVnzMcgu49IXOC1ZqrXFakm2
 6VR1S01uJiwohXfdryVkOfxc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b2168c5e77cf421d;
	Sun, 01 Nov 2026 11:44:31 +0000
X-Mizu-Trace-ID: b2168c5e77cf421d
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Michal Koutn?" <mkoutny@suse.com>
Cc: Guopeng Zhang <guopeng.zhang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ridong <chenridong@huawei.com>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [RFC PATCH -v4 16/22] cpuset: simplify partition update logic for hotplug tasks
Date: Sun,  1 Nov 2026 19:42:00 +0800
Message-Id: <20261101114206.2434398-17-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101114206.2434398-1-ridong.chen@linux.dev>
References: <20261101114206.2434398-1-ridong.chen@linux.dev>
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

From: Chen Ridong <chenridong@huawei.com>

Simplify the partition update logic in cpuset_hotplug_update_tasks() by
calling the unified local_partition_update() interface.

For local partitions, the previous patch introduced local_partition_update
which handles both validation state transitions:
- Invalidates local partitions that fail validation checks
- Transitions invalid partitions to valid state when no errors are detected

This eliminates the need for separate transition logic in
cpuset_hotplug_update_tasks(). The only exception is when
subpartitions_cpus becomes empty because no CPU is left for the
top_cpuset, in which case the local partition is disabled directly
with PERR_HOTPLUG. The effective cpumask is then always recomputed.

For remote partitions, only the hotplug invalidation check is needed,
so jump to update_tasks directly after it instead of going through the
local partition checks.

The partition_cmd enum type can now be safely removed as it is no longer
referenced by any code paths after the partition update logic
simplification.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 78 ++++++++++++++----------------------------
 1 file changed, 25 insertions(+), 53 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 78a783cb6308..00afa4987381 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1135,17 +1135,6 @@ void cpuset_update_tasks_cpumask(struct cpuset *cs, struct cpumask *new_cpus)
 	css_task_iter_end(&it);
 }
 
-/*
- * Commands for update_parent_effective_cpumask
- */
-enum partition_cmd {
-	partcmd_enable,		/* Enable partition root	  */
-	partcmd_enablei,	/* Enable isolated partition root */
-	partcmd_disable,	/* Disable partition root	  */
-	partcmd_update,		/* Update parent's effective_cpus */
-	partcmd_invalidate,	/* Make partition invalid	  */
-};
-
 static void update_sibling_cpumasks(struct cpuset *parent, struct cpuset *cs,
 				    struct tmpmasks *tmp);
 
@@ -3944,7 +3933,6 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	static nodemask_t new_mems;
 	bool cpus_updated;
 	bool mems_updated;
-	int partcmd = -1;
 	struct cpuset *parent;
 
 	wait_attach_done_lock();
@@ -3960,54 +3948,38 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	if (!tmp || !cs->partition_root_state)
 		goto update_tasks;
 
-	if (is_remote_partition(cs) && (cpumask_empty(subpartitions_cpus) ||
-				       (cpumask_empty(&new_cpus) &&
-					partition_is_populated(cs, NULL)))) {
-		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
-		remote_partition_disable(cs, tmp);
-		compute_effective_cpumask(&new_cpus, cs, parent);
-	}
-
 	/*
-	 * Force the partition to become invalid if either one of
-	 * the following conditions hold:
-	 * 1) empty effective cpus but not valid empty partition.
-	 * 2) parent is invalid or doesn't grant any cpus to child
-	 *    partitions.
-	 * 3) subpartitions_cpus is empty.
+	 * Compute effective_cpus for valid partition root, may invalidate
+	 * child partition roots if necessary.
 	 */
-	if (is_local_partition(cs) &&
-	    (!is_partition_valid(parent) ||
-	     tasks_nocpu_error(parent, cs, &new_cpus) ||
-	     cpumask_empty(subpartitions_cpus))) {
-		enum prs_errcode prs_err;
-
-		if (!is_partition_valid(parent))
-			prs_err = is_partition_invalid(parent)
-				  ? PERR_INVPARENT : PERR_NOTPART;
-		else if (cpumask_empty(subpartitions_cpus))
-			prs_err = PERR_HOTPLUG;
-		else
-			prs_err = PERR_NOCPUS;
-		partcmd = partcmd_invalidate;
-		local_partition_disable(cs, prs_err, tmp);
+	if (is_remote_partition(cs)) {
+		if (cpumask_empty(subpartitions_cpus) ||
+		    (cpumask_empty(&new_cpus) &&
+		     partition_is_populated(cs, NULL))) {
+			WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
+			remote_partition_disable(cs, tmp);
+			compute_effective_cpumask(&new_cpus, cs, parent);
+		}
+		goto update_tasks;
 	}
+
 	/*
-	 * On the other hand, an invalid partition root may be transitioned
-	 * back to a regular one with a non-empty user xcpus.
+	 * The subpartitions_cpus may be cleared if no CPUs remain available for
+	 * the top_cpuset. In this case, disable the local partition directly.
+	 * Otherwise, local_partition_update() will handle the automatic
+	 * transition between valid and invalid partition states.
 	 */
-	else if (is_partition_valid(parent) && is_partition_invalid(cs) &&
-		 !cpumask_empty(user_xcpus(cs))) {
-		partcmd = partcmd_update;
+	if (is_local_partition(cs) && cpumask_empty(subpartitions_cpus))
+		local_partition_disable(cs, PERR_HOTPLUG, tmp);
+	else
 		local_partition_update(cs, tmp);
-	}
 
-	if (partcmd >= 0) {
-		if (is_partition_valid(cs) || (partcmd == partcmd_invalidate)) {
-			compute_effective_cpumask(&new_cpus, cs, parent);
-			cpuset_force_rebuild();
-		}
-	}
+	/*
+	 * Recompute effective CPU mask after partition state update:
+	 * - For valid partitions: calculate partition-specific effective CPUs
+	 * - For invalid partitions: compute member effective CPU mask
+	 */
+	compute_effective_cpumask(&new_cpus, cs, parent);
 
 update_tasks:
 	cpus_updated = !cpumask_equal(&new_cpus, &old_cpus);
-- 
2.34.1

