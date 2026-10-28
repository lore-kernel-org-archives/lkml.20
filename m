Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160860;
	b=v81DsgTBnatYE4DhScUmnMI6BH5U+llYVr4PVwYMmAunlB1E/WMcDls0yBsu96FQJYCI
	 ykha8lkf1Ee7LdS6gXZyMbeB7ZvrF2jcq/AQ87faPCecpaMIPz4L8uJU0x667PRj3kYOW
	 jtPRX6vi8EhQ1PyI8YH8I6qgGDAJWlKq0xUYXQScx8qx8JDMfybJQvje5CuMIHIpCm9S6
	 apBBEtdjiYK2P2YosQtQ8v+5yNwA6oztXiAZueXnmjSGelTYr+TyKwRy3MyEdH6Hfeuji
	 rN3Ii2wNynXfa3n8Y5Wh7adzqomX4hlqxANCAOtbscSv+Nz9nNah4cxWxZzDcY+DfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160860;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 X-Mailer:To:Subject:X-Original-From:From:Message-Id:Cc:Date:
	 References:Content-Type:In-Reply-To:X-Lms-Return-Path;
	bh=Kv8Uf76D8g9HHwpLA0JXrynTIbbQnsLJupQzb81VbQk=;
	b=s3RT/Zm/pnXYPoaJyFRHycNBqTzCbUgAh6PJc0FVOfThJcVbaII10/N8xLLYGgFXThXR
	 jwx71yux3V5ZQXhbcDKb3USgUsCWq0pYYQE54b0qmBEFWaQHewMDCjmY00z12v14lefox
	 yjH7M6uworRa3rzGmyF1gYAbX7Fav9BvXH/t4JnvUFterAH1YAWJ/VtBtbiT7N7xgjLXJ
	 g/9xF7wwBKBn32n5eWMrloJzvEW+p0/WYNvFIeSjaAF14WRs4isomZVzEVM6YsKwCP4Ej
	 LDoaIFLHHS4Zz+bPQHcQ0ir6rYvPk/iZS6tC0Ur3eyPnMUqo5ueB1zV7f3RahGKiisA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=KwdzROd7;
	arc=none smtp.remote-ip=209.127.231.113
Received: from va-2-113.ptr.blmpb.com (va-2-113.ptr.blmpb.com [209.127.231.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1C7606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=KwdzROd7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793160853; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Kv8Uf76D8g9HHwpLA0JXrynTIbbQnsLJupQzb81VbQk=;
 b=KwdzROd73dvrapoCQxe/K5JjQnGqsV1jX61fAbvNYfxMpoybEctfIusmvR8pbyFCLzJrcz
 4ZE8C20VHAj+Ow3nZi8W7vqc5y0DePDk9TpQxmwR70mFYkRGDKWMW2O+PpJpzZdV1fzH1K
 4b663MjktnnSkjocwwS6muWD42X1buEdt5rkz4Ry2oiGCuTxOXg9kBt9X+poN5l/87PxT2
 GMzgngDymLDMceMc/EkRIPXHHYav06ZPxINLYkhxZ/BgdJsSRJltASfjs60m6u4bIdkXo+
 xA7OgrNL+qwBv1vJQdFaRd+2Y4QEyljvs+kBFkPRbxJl1uoP/oHiX1RRrBhB6A==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.45.2
To: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>, 
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, 
	<joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>
Subject: [PATCH v2 1/3] sched/numa: make free-space tiering promotion bypass configurable
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261028041253.74839-2-lizhe.67@bytedance.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
Date: Wed, 28 Oct 2026 12:12:51 +0800
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20261028041253.74839-1-lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26ae17693+ee59cf+vger.kernel.org+lizhe.67@bytedance.com>

Memory tiering normally promotes any recently accessed slow-tier page if
the target fast-tier node has enough free space. This preserves the
existing policy of filling available fast memory before relying on
hotness and rate-limit control.

That is not always the desired policy. Some deployments may intentionally
keep part of a workload's memory on CXL-attached memory, for example to
preserve a desired DRAM/CXL capacity split or bandwidth distribution. With
the free-space bypass, short cold accesses and bursts of hot accesses can
refill the fast tier and pull the workload away from that distribution
whenever DRAM has free space.

Redis testing exercises this policy issue. On a CXL system with node0 as
DRAM and node3 as slow-tier memory, a Redis test was run with
memory-tiering-only mode enabled. The test used a Redis dataset with 12
million 4KB values. It reclaimed memory until about 85% of Redis
anonymous memory was on node3, used a Redis benchmark configuration with
a 10% hot-key working set, and then issued a short 256MB access burst to
cold keys outside that working set. The cold-key burst mainly touches
memory outside the hot working set, which is expected to remain mostly on
the slow tier.

The upstream default promoted the cold-key burst through the free-space
bypass. The patched default preserved that behavior, while disabling the
bypass kept the same promotions behind the hotness and rate-limit checks:

                              upstream     patched default    bypass disabled
  cold-key burst ops/s          117250         115481             142505
  cold-key burst P99.9 ms        0.854          0.859              0.686
  pgpromote_candidate              0              0               1488328

Compared to upstream default, disabling the bypass improved cold-key burst
throughput by 21.5% and P99.9 latency by 19.7%.

Add a sched debugfs knob:

  /sys/kernel/debug/sched/numa_balancing/promote_free_space_bypass

It defaults to enabled, preserving the existing behavior. When disabled,
enough free space in the target fast-tier node no longer bypasses the
normal hotness and rate-limit controls.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/mmzone.h |  5 ++---
 kernel/sched/debug.c   |  2 ++
 kernel/sched/fair.c    | 14 ++++++++------
 kernel/sched/sched.h   |  1 +
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ecd1ebd49756..bf2d604c04b3 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -278,9 +278,8 @@ enum node_stat_item {
 	 */
 	PGPROMOTE_CANDIDATE,
 	/**
-	 * Not rate-limited (NRL) candidate pages for those can be promoted
-	 * without considering hot threshold because of enough free pages in
-	 * fast-tier node.  These promotions bypass the regular hotness checks
+	 * Not rate-limited (NRL) candidate pages selected for promotion through
+	 * the free-space bypass. These candidates bypass the regular hotness checks
 	 * and do NOT influence the promotion rate-limiter or
 	 * threshold-adjustment logic.
 	 * This is for statistics/monitoring purposes.
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index e6a3b516c703..a28f0f09c91e 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -736,6 +736,8 @@ static __init int sched_init_debug(void)
 	debugfs_create_u32("scan_period_max_ms", 0644, numa, &sysctl_numa_balancing_scan_period_max);
 	debugfs_create_u32("scan_size_mb", 0644, numa, &sysctl_numa_balancing_scan_size);
 	debugfs_create_u32("hot_threshold_ms", 0644, numa, &sysctl_numa_balancing_hot_threshold);
+	debugfs_create_bool("promote_free_space_bypass", 0644, numa,
+			    &numa_balancing_promote_free_space_bypass);
 #endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_SCHED_CACHE
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98..46a11f5ddafb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -134,6 +134,8 @@ static unsigned int sysctl_sched_cfs_bandwidth_slice		= 5000UL;
 #ifdef CONFIG_NUMA_BALANCING
 /* Restrict the NUMA promotion throughput (MB/s) for each target node. */
 static unsigned int sysctl_numa_balancing_promote_rate_limit = 65536;
+/* Preserve the existing default of using free fast-tier space eagerly. */
+bool numa_balancing_promote_free_space_bypass = true;
 #endif
 
 #ifdef CONFIG_SYSCTL
@@ -2759,11 +2761,10 @@ static inline bool cpupid_valid(int cpupid)
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
@@ -2884,7 +2885,8 @@ bool should_numa_migrate_memory(struct task_struct *p, struct folio *folio,
 		long nr = folio_nr_pages(folio);
 
 		pgdat = NODE_DATA(dst_nid);
-		if (pgdat_free_space_enough(pgdat)) {
+		if (numa_balancing_promote_free_space_bypass &&
+		    pgdat_free_space_enough(pgdat)) {
 			/* workload changed, reset hot threshold */
 			pgdat->nbp_threshold = 0;
 			mod_node_page_state(pgdat, PGPROMOTE_CANDIDATE_NRL, nr);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 87c5335add37..662b11bd401e 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3218,6 +3218,7 @@ extern unsigned int sysctl_numa_balancing_scan_period_min;
 extern unsigned int sysctl_numa_balancing_scan_period_max;
 extern unsigned int sysctl_numa_balancing_scan_size;
 extern unsigned int sysctl_numa_balancing_hot_threshold;
+extern bool numa_balancing_promote_free_space_bypass;
 
 #ifdef CONFIG_SCHED_HRTICK
 
-- 
2.20.1
