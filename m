Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043E81922FD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882965; cv=none; b=CCPbi8aD6nitFQ//f9/gktf0dsp/xHsFoSl4SvYt1nelN+tbcDYN6PjrHhl3Rm0hpsR0297DMwCGE9DM+GJzr48Mav7h+XYW4Db5Vvjy3kdG3YJ8BT8QGZXkQKnfZAoG9XsgNDdGy0+U2VToeA6WWU7poIHAlVbq1e9Lpvs64G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882965; c=relaxed/simple;
	bh=smdGzjqxJH8m/G8A9Nn50c+2Dlz8mHJ+N2Ld1KKlVuI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LrA+4ENAnDDSTLVyqDNmpTcAKk/0HjJ6IahgxeEqX4jRhJkhn9vtWfIIRv1naQ7QaBTzdNYsYiEz3RsX3SIlD5dc99hNivnC/zykDeiu0LY8oy0y73E5EqLJStC5oXxRZcckTAeR1y/teaBvnRflsvrGgnUzaJnZgxMLM7FZ69k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMJK0WNqz34Dg;
	Fri, 28 Aug 2026 10:09:05 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMJG3bKfz34Dg;
	Fri, 28 Aug 2026 10:09:02 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 4A2983104800;
	Fri, 28 Aug 2026 10:05:19 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 28 Aug
 2026 10:09:01 +0800
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
Subject: [RFC PATCH v2 16/23] sched/cache: Allow un-throttled active balance to spread out of a full LLC
Date: Fri, 28 Aug 2026 10:04:57 +0800
Message-ID: <20260828020457.785383-1-wujianyong@hygon.cn>
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

Cache-aware aggregation reaches active balance through two asymmetric
paths. Pulling a task back to its preferred LLC uses migrate_llc_task,
which need_active_balance() lets through unconditionally. Pushing a task
the other way. Out of an LLC that is already over the aggregation cap
and into one that still has room. It only happens via migrate_task, which
first has to wait for nr_balance_failed to exceed cache_nice_tries + 2.

Let the spread direction reach active balance without the
nr_balance_failed wait as well. The source LLC must already be over the
aggregation cap and the destination must still fit under it with a full
CPU of load added, so this can only undo an overshoot and never fights
the aggregation itself.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 58 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0defdd4316b8..42ab6347e667 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13506,6 +13506,61 @@ imbalanced_active_balance(struct lb_env *env)
 	return 0;
 }
 
+#ifdef CONFIG_SCHED_CACHE
+/*
+ * Cache-aware aggregation pulls tasks back to the preferred LLC via
+ * migrate_llc_task, which reaches active balance without any
+ * nr_balance_failed gating. Spreading tasks the other way. It only
+ * happens through migrate_task, which must first wait for
+ * nr_balance_failed to exceed cache_nice_tries + 2. That asymmetry
+ * lets a few LLCs stay oversubscribed while other LLCs of the same
+ * preferred region stay idle.
+ *
+ * Allow the spread direction to active balance un-throttled as well. The
+ * source LLC must be over the aggregation cap and the destination must
+ * still fit under it, so this can only undo an overshoot and never fights
+ * the aggregation itself. Region containment is still enforced by
+ * alb_break_llc()/can_migrate_node(), which run before this.
+ */
+static inline bool llc_spread_active_balance(struct lb_env *env)
+{
+	unsigned long src_util, src_cap, dst_util, dst_cap;
+
+	if (!sched_cache_enabled())
+		return false;
+
+	if (env->migration_type != migrate_task)
+		return false;
+
+	if (cpus_share_cache(env->src_cpu, env->dst_cpu))
+		return false;
+
+	if (!get_llc_stats(env->src_cpu, &src_util, &src_cap) ||
+	    !get_llc_stats(env->dst_cpu, &dst_util, &dst_cap))
+		return false;
+
+	if (fits_llc_capacity(src_util, src_cap))
+		return false;
+
+	/*
+	 * Only move when the destination still fits with a full CPU of the load
+	 * added, and when the source leads by at least two CPUs worth, so that
+	 * moving one task cannot invert the imbalance and bounce it straight
+	 * back.
+	 */
+	if (!fits_llc_capacity(dst_util + SCHED_CAPACITY_SCALE, dst_cap))
+		return false;
+
+	/* Avoid threads ping-pong migration */
+	return util_greater(src_util, dst_util);
+}
+#else
+static inline bool llc_spread_active_balance(struct lb_env *env)
+{
+	return false;
+}
+#endif
+
 static int need_active_balance(struct lb_env *env)
 {
 	struct sched_domain *sd = env->sd;
@@ -13519,6 +13574,9 @@ static int need_active_balance(struct lb_env *env)
 	if (imbalanced_active_balance(env))
 		return 1;
 
+	if (llc_spread_active_balance(env))
+		return 1;
+
 	/*
 	 * The dst_cpu is idle and the src_cpu CPU has only 1 CFS task.
 	 * It's worth migrating the task if the src_cpu's capacity is reduced
-- 
2.34.1


