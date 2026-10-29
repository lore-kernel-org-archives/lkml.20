Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242370;
	b=CLW4M34OFRTXi5s6z6amZ9+ykMULWxv0zElULsXuWZFLYs9HKjrWmdbJzLLbCQd1ibaq
	 wDjGQilbYxwyAe0D2bNYu1g6sZrhc/lEAyHnLY8b0HKOYbdxS33lDPc9c6S3g1ccKc9Wo
	 F+ZNHHPR4PtpkF4DVGEVu+Tgl38/Ku2LLVEc0IDTmzqAW+o7l9Ih8BDyqSvYDhGktzPcK
	 QL6ERUk8PyTk3zzYRq7i3ux3elJyYYeA8/MBKyHtVEoje3RK99i1lUbG7aSUlN/cCQ8u1
	 mCxje0LW72v8Rjq7FEK+icOpAGHyTzfcDwZpC/3JAoXHYJByldvBMyasSVoKMk8GxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242370;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FL2u3+LOjy1pD6ogUH1J9mKepJJkNbeZ56gnD4oM/Bk=;
	b=nYVCvHgV3puUUAj2WD/CosAlcjHzGn98FqrkYGIEAo6Td0vq4WLSnQt14TcAzru0kxzj
	 MSa4ntElrL5L604X3+OrCSIkz6ckOuo519FKcfPJ2xJ3LcviFCE9LHnRDXfANjCKpzLM+
	 FMwwCxVaPutmdcaTsl+EhldO9ARG4V20Oga5k4LV0ydTIa2Ycn3owSYkEaEMu4/io1BYR
	 9ix/j0Vb6nndQwHUUWsAwmXjVQ/FXkYElc6AnvupgkxizBelvP/GyuV+/R5rTsf9ZeBMU
	 +R/ewNsaO7rRKjOzVtZs2yPu5UiNfXz8mQ5KswOSnhkFcDvM0/TR57M8CINIHzANVjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5CE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTKt0my6z171Yc;
	Thu, 29 Oct 2026 10:52:34 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTKr1nbxz171Yc;
	Thu, 29 Oct 2026 10:52:32 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id DD409314AC01;
	Thu, 29 Oct 2026 10:52:07 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:52:28 +0800
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
Subject: [RFC PATCH v3 13/17] sched/cache: Allow active balance to spread load from a full LLC
Date: Thu, 29 Oct 2026 10:45:43 +0800
Message-ID: <20261029024543.4003980-1-wujianyong@hygon.cn>
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

Cache-aware aggregation can trigger active balance for migrate_llc_task
without waiting for nr_balance_failed. Spreading load from an LLC via
migrate_task normally requires nr_balance_failed to exceed
cache_nice_tries + 2. This delay can leave an LLC above the aggregation
threshold while another LLC has room.

Allow migrate_task to trigger active balance without that wait when the
source LLC exceeds the aggregation threshold and the destination can
accommodate one full CPU of additional load. Require the source to lead
the destination by at least two CPUs worth of load, so moving up to one
CPU of load does not reverse their utilization ordering and immediately
invite a migration back. The existing task migration checks still decide
whether the selected task may move.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 54 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index c3f9ef8798d6..1e286296cd65 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13558,6 +13558,57 @@ imbalanced_active_balance(struct lb_env *env)
 	return 0;
 }
 
+#ifdef CONFIG_SCHED_CACHE
+/*
+ * Cache-aware aggregation can trigger active balance via migrate_llc_task
+ * without waiting for nr_balance_failed. Spreading load via migrate_task
+ * normally waits for nr_balance_failed to exceed cache_nice_tries + 2.
+ * This can leave one LLC above the aggregation threshold while another
+ * LLC has room.
+ *
+ * Allow that spread when the source is above the aggregation threshold,
+ * the destination has room for one CPU's load, and the source leads by
+ * at least two CPUs' load. The gap prevents one migration from reversing
+ * their utilization ordering and immediately inviting a migration back.
+ * The task migration checks still decide whether the task may move.
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
+	if (fits_llc_capacity(src_util, src_cap, true))
+		return false;
+
+	/*
+	 * Reserve room for one CPU's load at the destination. A two-CPU gap
+	 * keeps one migration from reversing the utilization ordering and
+	 * causing the task to ping-pong between LLCs.
+	 */
+	if (!fits_llc_capacity(dst_util + SCHED_CAPACITY_SCALE, dst_cap, true))
+		return false;
+
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
@@ -13571,6 +13622,9 @@ static int need_active_balance(struct lb_env *env)
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


