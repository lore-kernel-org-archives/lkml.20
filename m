Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32C457E65
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971185; cv=none; b=HGSDHKht+KlpDKvSpvd4ihM+/chLgjEgrvUhSUOknkZ/21SpyyPj9v1ka3laT/8bAg5H6GvA4B5SxEYZ1xs9ygMoKMJBw5O9rUPdq3c0gUnEKn/x6l6hzTx1x2LR4CDkmkQOcjJl7omganUtyu7q/EVKD1MwvFT6tpAMCyJgrU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971185; c=relaxed/simple;
	bh=pPMR4Q8xaGvS7SttOwlONotpEI9RRoO0t+V8f8ieag8=;
	h=To:In-Reply-To:From:Subject:Message-Id:Mime-Version:Date:
	 References:Cc:Content-Type; b=hHQEFgkuALU+laLZH1I2cTo0JAMe9uKDIXbIX8dvB92zAbB/qXC2vOpPNG0vYm5gE8Ic2OIqm1beb8sL4Z70IVxAcalTikH9Ve6LKuS+nZGFvnRDGgoPRD7aNCwkRnm+os3P/FcI3UVScwte0OiW/WmG08ZgGWThTdT/Xu9e4Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NmOPoufl; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NmOPoufl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791971173; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=5g9Mw8eoznlsynpSJ6z9deMC+OBzAzCqHJiI3+n9U7c=;
 b=NmOPouflIqEqOH2cP2X61xIj0lD7N1IcWwvu9ZWYCWbEVxWJkKWHNVAcUivyBsCDWBraID
 gfIhKANvNLEeJyrIsOiOtqgZwHw2VYRJCTZJqahRE9GsTy89NAaJ85gWM29cHTRn20rQdS
 4KZjgfqBr6r2T4eDu9VKcwsk6ljqbi5WV37HJpzm3dIGFXVgbn8XeSBRPUHRM5NqJxeE88
 nobiGYrzgFqAAWP9S3li0Sq64nitxSilDh6mFaoyLQmayg6UowdnzTtATAohMr2KcocsKt
 Wvye9PH3L9IPP7Q6/ePdrzPJUe2Zgh+AvFuusSdx06FBHIvkmranlahIbxlIdg==
X-Lms-Return-Path: <lba+26acf4f62+db2148+vger.kernel.org+lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <mgorman@suse.de>, 
	<riel@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261014094347.99157-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH 4/6] sched/numa: make free-space tiering promotion bypass configurable
Message-Id: <20261014094347.99157-5-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 14 Oct 2026 17:43:45 +0800
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

Memory tiering normally promotes any recently accessed slow-tier page if
the target fast-tier node has enough free space. This preserves the
existing policy of filling available fast memory before relying on
hotness and rate-limit control.

That is not always the desired policy. Some workloads may intentionally
place memory across CXL-attached memory and DRAM to use aggregate memory
bandwidth. With the free-space bypass, cold one-shot accesses and bursts
of hot accesses can refill the fast tier and pull the workload away from
that distribution whenever DRAM has free space.

Add kernel.numa_balancing_promote_free_space_bypass. It defaults to 1,
preserving the existing behavior. When cleared, enough free space in the
target fast-tier node no longer bypasses the normal hotness and
rate-limit controls.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 16 ++++++++++++++
 include/linux/mmzone.h                      |  5 ++---
 kernel/sched/fair.c                         | 23 +++++++++++++++------
 3 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index ffea61d448eb..4a035b18aff4 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -765,6 +765,22 @@ will be limited to be no more than the set value.
 A rule of thumb is to set this to less than 1/10 of the PMEM node
 write bandwidth.
 
+numa_balancing_promote_free_space_bypass
+========================================
+
+Controls whether memory tiering promotion may bypass the normal
+hint-fault hotness check and promotion rate limit when the target
+fast-tier node has enough free space.
+
+The default value is 1.  In this mode, if the fast tier has enough free
+space, recently accessed slow-tier pages can be promoted without the
+hotness check or the promotion rate limit, so the kernel can fill
+available fast-tier capacity.
+
+When set to 0, enough free space no longer bypasses these controls.
+A slow-tier page must pass the normal hotness and rate-limit checks before
+promotion.
+
 oops_all_cpu_backtrace
 ======================
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 94f9c3ff5416..5d583b17dfa2 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -297,9 +297,8 @@ enum node_stat_item {
 	 */
 	PGPROMOTE_CANDIDATE,
 	/**
-	 * Not rate-limited (NRL) candidate pages for those can be promoted
-	 * without considering hot threshold because of enough free pages in
-	 * fast-tier node.  These promotions bypass the regular hotness checks
+	 * Not rate-limited (NRL) candidate pages that are promoted through the
+	 * free-space bypass. These promotions bypass the regular hotness checks
 	 * and do NOT influence the promotion rate-limiter or
 	 * threshold-adjustment logic.
 	 * This is for statistics/monitoring purposes.
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ec8a6bfeb2c7..2e11107bf5ca 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -134,6 +134,8 @@ static unsigned int sysctl_sched_cfs_bandwidth_slice		= 5000UL;
 #ifdef CONFIG_NUMA_BALANCING
 /* Restrict the NUMA promotion throughput (MB/s) for each target node. */
 static unsigned int sysctl_numa_balancing_promote_rate_limit = 65536;
+/* Preserve the existing default of using free fast-tier space eagerly. */
+static unsigned int sysctl_numa_balancing_promote_free_space_bypass = 1;
 #endif
 
 #ifdef CONFIG_SYSCTL
@@ -157,6 +159,15 @@ static const struct ctl_table sched_fair_sysctls[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 	},
+	{
+		.procname	= "numa_balancing_promote_free_space_bypass",
+		.data		= &sysctl_numa_balancing_promote_free_space_bypass,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= proc_douintvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
 #endif /* CONFIG_NUMA_BALANCING */
 };
 
@@ -2816,11 +2827,10 @@ static inline bool cpupid_valid(int cpupid)
 }
 
 /*
- * For memory tiering mode, if there are enough free pages (more than
- * enough watermark defined here) in fast memory node, to take full
- * advantage of fast memory capacity, all recently accessed slow
- * memory pages will be migrated to fast memory node without
- * considering hot threshold.
+ * For memory tiering mode, if the target fast memory node has enough free
+ * pages, recently accessed slow memory pages can bypass the normal hotness
+ * check and rate limit so the fast tier can be filled. The bypass can be
+ * disabled by numa_balancing_promote_free_space_bypass.
  */
 static bool pgdat_free_space_enough(struct pglist_data *pgdat)
 {
@@ -2941,7 +2951,8 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
 		long nr = folio_nr_pages(folio);
 
 		pgdat = NODE_DATA(dst_nid);
-		if (pgdat_free_space_enough(pgdat)) {
+		if (sysctl_numa_balancing_promote_free_space_bypass &&
+		    pgdat_free_space_enough(pgdat)) {
 			/* workload changed, reset hot threshold */
 			pgdat->nbp_threshold = 0;
 			mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE_NRL, nr);
-- 
2.20.1
