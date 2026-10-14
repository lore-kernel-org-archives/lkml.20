Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD04E5350
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971154; cv=none; b=UEoZ3HFFaSIWFYgKF9E05pYp3PZRIcxLOTG711khMk38zKpidMqYl/fcAX/ZvgaP8kV/Lxrv7tGBQU6Uzuky+SQCTjfE1KIzRreuawoH5lki3ICDInfkzO319Gx6RARpWt7QxojJXEDPDmGBlsTJ4ji2DzCh2YDgH2loU/fy5d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971154; c=relaxed/simple;
	bh=UuTDZykY1DR8yjqNS48cPNFHrb48dRUznDlo5zj/+rc=;
	h=In-Reply-To:Subject:Date:Message-Id:Content-Type:References:To:Cc:
	 From:Mime-Version; b=kYWXEu7RaSe3s5Kpm7h9RQ94OdgcWPElCpn5ydFkZvdNQEXncmShigonyG/xFDvv5X9ySAHFIVcm59ShKIkolisWkXKJd73qX+lcHEfJ6TUZOVvDhMN912kLGssh0PZo9AHRS3Gc0s/Wdyqel/cIJT3k+6eM6OXYZWJohOb+cb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HIkL+ZdS; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HIkL+ZdS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791971147; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=5cjoSrIIljOIInwRxHyN89H7Srl+gGPS+IjzpyYAnwk=;
 b=HIkL+ZdSxmwBtu7okcdRns5fwXsFRyI+u8xX0JAaGFTq9O7JN8E92ha3/Z48Swyudxva+Y
 YL2UuFN/33wkUZeD7ofjMGSjV324sDnY9oqkCEb8WMLoKjye3EhkHQyVPLaSI2Mwvi6XQi
 4WdpRkh6l1/NERnHnXBz8kTl5bRsjDgcFKTSzMg3oPPn9WIvO0QvzHp5W/nPUNu2xWudh9
 hKh5falYiUYuv1tjm9wKMzL/HwNdLfikpvlANBrb1ToP1E8HFeJ5vFStuOD40NarU1tnNJ
 U2Jr+7rWSnl+dojThkCCfHJkmBr1QKEZTEtyu5FyaxqG10+fZbviMYN0nofEyw==
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261014094347.99157-1-lizhe.67@bytedance.com>
Subject: [PATCH 3/6] sched/numa: fix scan-period adjustment for shared faults
Date: Wed, 14 Oct 2026 17:43:44 +0800
Message-Id: <20261014094347.99157-4-lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26acf4f49+4e0a7b+vger.kernel.org+lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <mgorman@suse.de>, 
	<riel@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit

Commit 37ec97deb3a8 ("sched/numa: Slow down scan rate if shared faults
dominate") intended to slow scanning when either shared or local faults
dominate, and to speed scanning up only when many private faults are on
remote memory pages.

The implementation uses the private-fault ratio as the slow-scan signal.
That makes private-dominated samples slow scanning, while
shared-dominated samples can still fall through to the speed-up path.
That does not match the stated intent.

Replacing the private ratio with a shared ratio fixes the
shared-dominated case, but the scan-period code still only has separate
locality and sharing ratios. Those ratios cannot distinguish a window
with many remote shared faults and only a few remote private faults from
one with substantial remote private faults.

Track faults that are both remote and private, and only speed up scanning
when that signal is large enough. This keeps local or shared samples
slowing scanning and avoids extra hinting overhead when the remote
activity is mostly shared.

Fixes: 37ec97deb3a8 ("sched/numa: Slow down scan rate if shared faults dominate")
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/sched.h | 17 ++++++++---
 kernel/sched/fair.c   | 68 ++++++++++++++++++++++---------------------
 2 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..1be7a9ba7553 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -832,6 +832,16 @@ struct task_ipi_mask {
 struct task_ipi_mask { };
 #endif
 
+#ifdef CONFIG_NUMA_BALANCING
+enum numa_faults_locality {
+	NUMA_FAULT_REMOTE,
+	NUMA_FAULT_LOCAL,
+	NUMA_FAULT_MIGRATE_FAIL,
+	NUMA_FAULT_REMOTE_PRIVATE,
+	NR_NUMA_FAULT_LOCALITY,
+};
+#endif
+
 struct task_struct {
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	/*
@@ -1422,11 +1432,10 @@ struct task_struct {
 
 	/*
 	 * numa_faults_locality tracks if faults recorded during the last
-	 * scan window were remote/local or failed to migrate. The task scan
-	 * period is adapted based on the locality of the faults with different
-	 * weights depending on whether they were shared or private faults
+	 * scan window were remote/local, remote private, or failed to migrate.
+	 * The task scan period is adapted based on those fault patterns.
 	 */
-	unsigned long			numa_faults_locality[3];
+	unsigned long			numa_faults_locality[NR_NUMA_FAULT_LOCALITY];
 
 	unsigned long			numa_pages_migrated;
 #endif /* CONFIG_NUMA_BALANCING */
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 76532b8202dc..ec8a6bfeb2c7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3675,10 +3675,10 @@ static void numa_group_count_active_nodes(struct numa_group *numa_group)
 
 /*
  * When adapting the scan rate, the period is divided into NUMA_PERIOD_SLOTS
- * increments. The more local the fault statistics are, the higher the scan
- * period will be for the next scan window. If local/(local+remote) ratio is
- * below NUMA_PERIOD_THRESHOLD (where range of ratio is 1..NUMA_PERIOD_SLOTS)
- * the scan period will decrease. Aim for 70% local accesses.
+ * increments. The more local or shared the fault statistics are, the higher
+ * the scan period will be for the next scan window. If the private remote
+ * ratio reaches NUMA_PERIOD_SLOTS - NUMA_PERIOD_THRESHOLD, the scan period
+ * will decrease. Aim for 70% local or shared accesses.
  */
 #define NUMA_PERIOD_SLOTS 10
 #define NUMA_PERIOD_THRESHOLD 7
@@ -3693,11 +3693,13 @@ static void update_task_scan_period(struct task_struct *p,
 			unsigned long shared, unsigned long private)
 {
 	unsigned int period_slot;
-	int lr_ratio, ps_ratio;
+	int lr_ratio, sr_ratio, rp_ratio, ratio;
 	int diff;
 
-	unsigned long remote = p->numa_faults_locality[0];
-	unsigned long local = p->numa_faults_locality[1];
+	unsigned long remote = p->numa_faults_locality[NUMA_FAULT_REMOTE];
+	unsigned long local = p->numa_faults_locality[NUMA_FAULT_LOCAL];
+	unsigned long remote_private =
+		p->numa_faults_locality[NUMA_FAULT_REMOTE_PRIVATE];
 	unsigned long locality_faults = local + remote;
 	unsigned long type_faults = private + shared;
 
@@ -3708,7 +3710,8 @@ static void update_task_scan_period(struct task_struct *p,
 	 * migration then it implies we are migrating too quickly or the local
 	 * node is overloaded. In either case, scan slower
 	 */
-	if (!locality_faults || !type_faults || p->numa_faults_locality[2]) {
+	if (!locality_faults || !type_faults ||
+	    p->numa_faults_locality[NUMA_FAULT_MIGRATE_FAIL]) {
 		p->numa_scan_period = min(p->numa_scan_period_max,
 			p->numa_scan_period << 1);
 
@@ -3721,40 +3724,36 @@ static void update_task_scan_period(struct task_struct *p,
 	/*
 	 * Prepare to scale scan period relative to the current period.
 	 *	 == NUMA_PERIOD_THRESHOLD scan period stays the same
-	 *       <  NUMA_PERIOD_THRESHOLD scan period decreases (scan faster)
+	 *       <  NUMA_PERIOD_THRESHOLD scan period may decrease if the
+	 *                            remote-private signal is strong enough
 	 *	 >= NUMA_PERIOD_THRESHOLD scan period increases (scan slower)
 	 */
 	period_slot = DIV_ROUND_UP(p->numa_scan_period, NUMA_PERIOD_SLOTS);
 	lr_ratio = (local * NUMA_PERIOD_SLOTS) / locality_faults;
-	ps_ratio = (private * NUMA_PERIOD_SLOTS) / type_faults;
+	sr_ratio = (shared * NUMA_PERIOD_SLOTS) / type_faults;
+	rp_ratio = (remote_private * NUMA_PERIOD_SLOTS) / locality_faults;
+	ratio = max(lr_ratio, sr_ratio);
 
-	if (ps_ratio >= NUMA_PERIOD_THRESHOLD) {
+	if (ratio >= NUMA_PERIOD_THRESHOLD) {
 		/*
-		 * Most memory accesses are local. There is no need to
-		 * do fast NUMA scanning, since memory is already local.
+		 * Most memory accesses are local or shared. Local faults do not
+		 * need fast scanning; shared faults may just be moved elsewhere by
+		 * other tasks.
 		 */
-		int slot = ps_ratio - NUMA_PERIOD_THRESHOLD;
-		if (!slot)
-			slot = 1;
-		diff = slot * period_slot;
-	} else if (lr_ratio >= NUMA_PERIOD_THRESHOLD) {
-		/*
-		 * Most memory accesses are shared with other tasks.
-		 * There is no point in continuing fast NUMA scanning,
-		 * since other tasks may just move the memory elsewhere.
-		 */
-		int slot = lr_ratio - NUMA_PERIOD_THRESHOLD;
+		int slot = ratio - NUMA_PERIOD_THRESHOLD;
 		if (!slot)
 			slot = 1;
 		diff = slot * period_slot;
 	} else {
 		/*
-		 * Private memory faults exceed (SLOTS-THRESHOLD)/SLOTS,
-		 * yet they are not on the local NUMA node. Speed up
-		 * NUMA scanning to get the memory moved over.
+		 * Only speed up scanning when enough faults are both private
+		 * and remote. Mixed windows dominated by shared remote faults
+		 * should not create extra hinting overhead.
 		 */
-		int ratio = max(lr_ratio, ps_ratio);
-		diff = -(NUMA_PERIOD_THRESHOLD - ratio) * period_slot;
+		if (rp_ratio >= NUMA_PERIOD_SLOTS - NUMA_PERIOD_THRESHOLD)
+			diff = -(NUMA_PERIOD_THRESHOLD - ratio) * period_slot;
+		else
+			diff = 0;
 	}
 
 	p->numa_scan_period = clamp(p->numa_scan_period + diff,
@@ -3906,8 +3905,8 @@ static void task_numa_placement(struct task_struct *p)
 	p->numa_scan_seq = seq;
 	p->numa_scan_period_max = task_scan_max(p);
 
-	total_faults = p->numa_faults_locality[0] +
-		       p->numa_faults_locality[1];
+	total_faults = p->numa_faults_locality[NUMA_FAULT_REMOTE] +
+		       p->numa_faults_locality[NUMA_FAULT_LOCAL];
 	runtime = numa_get_avg_runtime(p, &period);
 
 	/* If the task is part of a group prevent parallel updates to group stats */
@@ -4262,11 +4261,14 @@ void task_numa_fault(int last_cpupid, int mem_node, int pages, int flags)
 	if (migrated)
 		p->numa_pages_migrated += pages;
 	if (flags & TNF_MIGRATE_FAIL)
-		p->numa_faults_locality[2] += pages;
+		p->numa_faults_locality[NUMA_FAULT_MIGRATE_FAIL] += pages;
 
 	p->numa_faults[task_faults_idx(NUMA_MEMBUF, mem_node, priv)] += pages;
 	p->numa_faults[task_faults_idx(NUMA_CPUBUF, cpu_node, priv)] += pages;
-	p->numa_faults_locality[local] += pages;
+	if (!local && priv)
+		p->numa_faults_locality[NUMA_FAULT_REMOTE_PRIVATE] += pages;
+	p->numa_faults_locality[local ? NUMA_FAULT_LOCAL :
+				 NUMA_FAULT_REMOTE] += pages;
 }
 
 static void reset_ptenuma_scan(struct task_struct *p)
-- 
2.20.1
