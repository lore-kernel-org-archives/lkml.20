Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243001;
	b=z7hefgUt2ba7aPXS/xgEzD2Wm2MK5oWZmQyeYVMg7a1Gl79dID9FC6NL2LawCiS33NyZ
	 WAkHNhatBRpw1La+jM2foGacp5Ev2GAr1xzIrpMh4JmgHX7CI0VOzD3AaTKvGgJclHgNS
	 GUBiIzg5wwPVGAbsCIaVOaHSktNlOf3qgkKd8HIgVx43GXWBQZs/1gtawLn3SJ39r1H6S
	 5psA7kIxIcskAfAuwlSs5VQXnYsYuvCo6rS1uuTI3Jqg4k/1Fz5gW7R/sm9hWVXrwDvKw
	 xIEk+Zj2E95VX0TRTwKMMYloWQcyPD83VJ44jTY6qxWV2YspZJSjGGC/4JDpPCzpczw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243001;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=oKF5wqMFzUCUVxGDoC2rEk2wPVNMUgCMUrf0EZTo9Bc=;
	b=zixYTmfXdxLGrhUWclUpH2n4kolcS0cFSKjgOekvoXmz/wj8Y+Y97y9IvwCpt+G/VpkV
	 UC7ZAO9HtrzuyIdh8vH5RNQhsVHQTHbjB1fl1su/5piDuqjhSk4YAy7X33Uko+YYgEqC9
	 Zjl5u+Mz+XNwH4Ujma7aJYxhvla3/94FMqYCFW7PMKn6o3BEc9AUmYUNYsjuvf9Bw5x1/
	 boJqEVlhZpmH6lGYB4xO7ASZNzcm5ZZ4AJk+2hW1mv4vgJ4+l+XoQV1I2bJFXUu5vwney
	 0saxtJmT9TI/WjQb6Cg3XoyFgSgivPjWgRH7hG06DJG7jSgqzEdX/+a50LLP7fQVpJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021FA606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTZ21MrTz171Z8;
	Thu, 29 Oct 2026 11:03:06 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTYz2b9Qz171Z8;
	Thu, 29 Oct 2026 11:03:03 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id EE91F314AC01;
	Thu, 29 Oct 2026 11:02:39 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 11:03:01 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Chen Yu <yu.c.chen@intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld
	<pauld@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, <ljs@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>
Subject: [RFC PATCH v3 16/17] sched/cache: Drop stale preferred LLC checks
Date: Thu, 29 Oct 2026 10:58:28 +0800
Message-ID: <20261029025829.4005192-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029022036.4002331-1-wujianyong@hygon.cn>
References: <20261029022036.4002331-1-wujianyong@hygon.cn>
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
Content-Type: text/plain
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

With multi-LLC aggregation, an mm's preferred LLC can be
outside a task's preferred NUMA node. Do not discard that LLC when
calculating the task's preference.

Likewise, an LLC migration may select a destination other than the
task's preferred LLC. Let can_migrate_llc_task() decide whether the
migration is allowed instead of rejecting the task based on an exact
preferred-LLC match.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b93b6e6c9dea..5d11f9b7f685 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1669,27 +1669,9 @@ static int get_pref_llc(struct task_struct *p, struct mm_struct *mm)
 		return -1;
 
 	mm_sched_cpu = READ_ONCE(mm->sc_stat.cpu);
-	if (mm_sched_cpu != -1) {
+	if (mm_sched_cpu != -1)
 		mm_sched_llc = llc_id(mm_sched_cpu);
 
-#ifdef CONFIG_NUMA_BALANCING
-		/*
-		 * Don't assign preferred LLC if it
-		 * conflicts with NUMA balancing.
-		 * This can happen when sched_setnuma() gets
-		 * called, however it is not much of an issue
-		 * because we expect account_mm_sched() to get
-		 * called fairly regularly -- at a higher rate
-		 * than sched_setnuma() at least -- and thus the
-		 * conflict only exists for a short period of time.
-		 */
-		if (static_branch_likely(&sched_numa_balancing) &&
-		    p->numa_preferred_nid >= 0 &&
-		    cpu_to_node(mm_sched_cpu) != p->numa_preferred_nid)
-			mm_sched_llc = -1;
-#endif
-	}
-
 	return mm_sched_llc;
 }
 
@@ -10898,15 +10880,6 @@ static bool migrate_degrades_llc(struct task_struct *p, struct lb_env *env)
 	if (env->sd->nr_balance_failed >= env->sd->cache_nice_tries + 1)
 		return false;
 
-	/*
-	 * We know the env->src_cpu has some tasks prefer to
-	 * run on env->dst_cpu, skip the tasks do not prefer
-	 * env->dst_cpu, and find the one that prefers.
-	 */
-	if (env->migration_type == migrate_llc_task &&
-	    READ_ONCE(p->preferred_llc) != llc_id(env->dst_cpu))
-		return true;
-
 	if (can_migrate_llc_task(env->src_cpu,
 				 env->dst_cpu, p) != mig_forbid)
 		return false;
-- 
2.34.1


