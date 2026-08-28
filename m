Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B90E15E5BB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883290; cv=none; b=edKIg3rbhctPYW8IJKh5HV6Y7ixE2SsNxGhvTUdhdeeKg17YDBuGPzWDAc0p7YGgohzcDBPcqo7khUzUpzyAMEKxqYA4g/cw+2UYNSVXciLbfXNoHPTV576QxcKM7tgJbnWlGkrIM3q3fASaRIg1GZyYDY4tA5UwJwh5jgdUb/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883290; c=relaxed/simple;
	bh=sgjxznIFMV9JZZdYFoph4sBQM4ArL/fgoy2ElzeKfU8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NGYvCh10sd8Tyey6kA7gQjdo3tc0jaqqki7na8sWV6DlMpRnQVVAFOZrfMidn816nm2vVD4lq2e0YiFMyULIRgrz4F5r4Vv/B6yisb7cfnvTplLU2TdxYsxoeNSiuOchz5vwF6L/TOE80UtT1+JccQvVMeoCsOLd2E1S4iVE2nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMQc0h1Vz34Dg;
	Fri, 28 Aug 2026 10:14:32 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMQY4RBYz34Dg;
	Fri, 28 Aug 2026 10:14:29 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 60CDE7889;
	Fri, 28 Aug 2026 10:14:21 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 28 Aug
 2026 10:14:28 +0800
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
 Hildenbrand <david@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>, <justin.he@arm.com>
Subject: [RFC PATCH v2 19/23] sched/cache: Remove preferred LLC/node check no longer needed
Date: Fri, 28 Aug 2026 10:10:32 +0800
Message-ID: <20260828021032.785642-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827122816.756234-1-wujianyong@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

When CAS extends to the whole system, preferred LLC may not locate inside
preferred node of a certain thread and migration can happen to move to a
destination cpu that is not thread group's preferred LLC. So, all of these
check should be removed.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 27cb05373a1d..45dd3e5e0a86 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1680,27 +1680,9 @@ static int get_pref_llc(struct task_struct *p, struct mm_struct *mm)
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
 
@@ -10917,15 +10899,6 @@ static bool migrate_degrades_llc(struct task_struct *p, struct lb_env *env)
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


