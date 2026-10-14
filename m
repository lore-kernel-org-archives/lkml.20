Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0474A489892
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971130; cv=none; b=nMN4OvPgh3qbxuS/c7L5HwkRtqNZm6GtAMjBuLf3RvKw89tP/ZjMOBLSD7n1Cx/tEYKSRduSrr0RZYrT1JL1KrfocQE/QiaNMsyG+p1fHQmahKiBzvCGwxw4/eC7DC0QdnUBpAbVR5iv+GHEvhB1xr2diqLtshdPuFTPYbFFFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971130; c=relaxed/simple;
	bh=xazHyhS2f4LRvsfmhc48qJ41ehXvxDOc7cVlZTUgyAk=;
	h=Content-Type:Message-Id:Mime-Version:To:Date:Cc:References:
	 In-Reply-To:From:Subject; b=Re1Jvtpi0CRTElbwYk+sIzKewMN3OeffH3HwszQPNLezu8gKg4JyZwBlPQV3uk6fjdPqLnbG8a0gGSslVUEMvN8MxGyWVN4iHqam6mj2YvQpR/fpTZ9Eo2RVzpwYGYc6+EDILeWGwtJwbZRoOXfaVs191YYDQkl/tfVS8tA/GXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JmgUkH8O; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JmgUkH8O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791971123; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=U2XQA7j4tYm2Zsyj3FeGcSE0tdyDSiJaEUUcQjCd3Vc=;
 b=JmgUkH8OhSzXZmANuSFVgonctsEvOsfPiMwQieXTykwtgwSPPiwHCBu7Kx3VuRKJnqfaCw
 pMqBFrbH5hI2OmUb1aiLJjath1XBpE9Aspahbr0dUrKTGQt+Yac0UZfjH0gm+ubZb0W1Yz
 0IZ2X7QOypJygCql/mnCokKvk2kaHU818ptY5PMy1BkASfXFYFMaOHxGkmyol4Bv+BSlBQ
 am29FgWQ6mpOF6b8VZRbggF4dPIDue5bInI/c0P1qzJQmPBeOufX3xi0IX2PrzWO+vQJcZ
 wesFdtrIe/N8zD7EeNafMHMAnQZGyiSKgYkevDGY1XQL1Bb20OH3iGlCW6Emxw==
Content-Type: text/plain; charset=UTF-8
Message-Id: <20261014094347.99157-3-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <mgorman@suse.de>, 
	<riel@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>
Date: Wed, 14 Oct 2026 17:43:43 +0800
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
In-Reply-To: <20261014094347.99157-1-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26acf4f31+abf191+vger.kernel.org+lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: [PATCH 2/6] sched/numa: fix scan-period ratio denominator checks

update_task_scan_period() scales the scan period with two ratios:
local/(local + remote) and private/(private + shared).

The existing guard only checks local + shared. That normally implies
that both ratio denominators are non-zero because the locality and type
counters are updated from the same hint faults. Memory hotplug can make
that assumption fragile because task_numa_placement() folds the
private/shared buffers by walking online nodes, while the locality counters
were already charged when the fault was recorded.

The divide-by-zero was reproduced on v7.3-rc1 in a QEMU guest by
hot-removing a NUMA node after NUMA balancing had collected fault feedback.
The next NUMA hint fault enters task_numa_placement() with locality
feedback that was charged before node1 was removed. The per-node
private/shared buffers for node1 are skipped by for_each_online_node(), so
update_task_scan_period() can see local > 0 while private and shared are
both 0. The old local + shared guard lets that state pass, and the
subsequent private/(private + shared) calculation divides by zero.

Keep the slow-scan fallback for empty or unusable samples, but test the
actual denominators before calculating the ratios.

Fixes: 37ec97deb3a8 ("sched/numa: Slow down scan rate if shared faults dominate")
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 kernel/sched/fair.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1053437933ee..76532b8202dc 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3698,6 +3698,8 @@ static void update_task_scan_period(struct task_struct *p,
 
 	unsigned long remote = p->numa_faults_locality[0];
 	unsigned long local = p->numa_faults_locality[1];
+	unsigned long locality_faults = local + remote;
+	unsigned long type_faults = private + shared;
 
 	/*
 	 * If there were no record hinting faults then either the task is
@@ -3706,7 +3708,7 @@ static void update_task_scan_period(struct task_struct *p,
 	 * migration then it implies we are migrating too quickly or the local
 	 * node is overloaded. In either case, scan slower
 	 */
-	if (local + shared == 0 || p->numa_faults_locality[2]) {
+	if (!locality_faults || !type_faults || p->numa_faults_locality[2]) {
 		p->numa_scan_period = min(p->numa_scan_period_max,
 			p->numa_scan_period << 1);
 
@@ -3723,8 +3725,8 @@ static void update_task_scan_period(struct task_struct *p,
 	 *	 >= NUMA_PERIOD_THRESHOLD scan period increases (scan slower)
 	 */
 	period_slot = DIV_ROUND_UP(p->numa_scan_period, NUMA_PERIOD_SLOTS);
-	lr_ratio = (local * NUMA_PERIOD_SLOTS) / (local + remote);
-	ps_ratio = (private * NUMA_PERIOD_SLOTS) / (private + shared);
+	lr_ratio = (local * NUMA_PERIOD_SLOTS) / locality_faults;
+	ps_ratio = (private * NUMA_PERIOD_SLOTS) / type_faults;
 
 	if (ps_ratio >= NUMA_PERIOD_THRESHOLD) {
 		/*
-- 
2.20.1
