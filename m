Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183B221254B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834028; cv=none; b=o19j0hDvyxsy4jGWY9zO7yZuG7OnDfTEFkXrDY+hHN1Mi0SbfAJGVsbR4dvOS3vR0MFTbaEEu3XRJvTAc3ZtEWAWqpQhEfCawNn9vbC0TNJqbO+KGDlL7NnWpGv1kLGaIcNOHaOMm2gFzQgiRCpocP/FiZ+SIsL4m7UYsKfWz44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834028; c=relaxed/simple;
	bh=DDre0j81JlJg85IBi/l20Pw+SnmsekN2Kd/mvZ/bLks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d00dMYc4rm4snicb+jDpIOMM1UsFGB4+AzEQ5FVeC3RY0uSulf9BultIHbTpvqT6DPk2rwW1jHkPHQMC6dRpRjUYO7z8gKF3UmKsyPe9Yr6sb6Vrtl3i2TCRYcFANsY5oS2D7eKb6DPluDqFUqimVuM+nFcGqpd6VktBjB3I8jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1C30WBGzBJb6d;
	Thu, 27 Aug 2026 20:33:19 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1C20vCjzBJb5x;
	Thu, 27 Aug 2026 20:33:18 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id E3EC036F1F84;
	Thu, 27 Aug 2026 20:29:35 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:16 +0800
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
Subject: [RFC PATCH v2 06/23] sched/topology: Add sd_node for the NODE sched domain
Date: Thu, 27 Aug 2026 20:27:59 +0800
Message-ID: <20260827122816.756234-7-wujianyong@hygon.cn>
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
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

There is no straightforward way to retrieve the NODE-level sched domain,
which will be used in subsequent patches. To simplify this, add a per-CPU
variable `sd_node` for convenience.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/sched.h    |  1 +
 kernel/sched/topology.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 38453a78c885..3d3f1d40a672 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2197,6 +2197,7 @@ DECLARE_PER_CPU(int, sd_llc_id);
 DECLARE_PER_CPU(int, sd_share_id);
 DECLARE_PER_CPU(struct sched_domain_shared __rcu *, sd_llc_shared);
 DECLARE_PER_CPU(struct sched_domain_shared __rcu *, sd_balance_shared);
+DECLARE_PER_CPU(struct sched_domain __rcu *, sd_node);
 DECLARE_PER_CPU(struct sched_domain __rcu *, sd_numa);
 DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
 DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index eaaca6c9a805..46ae1f94e9f5 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -679,6 +679,7 @@ DEFINE_PER_CPU(int, sd_llc_id) = -1;
 DEFINE_PER_CPU(int, sd_share_id);
 DEFINE_PER_CPU(struct sched_domain_shared __rcu *, sd_llc_shared);
 DEFINE_PER_CPU(struct sched_domain_shared __rcu *, sd_balance_shared);
+DEFINE_PER_CPU(struct sched_domain __rcu *, sd_node);
 DEFINE_PER_CPU(struct sched_domain __rcu *, sd_numa);
 DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
 DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
@@ -721,6 +722,19 @@ static struct llc_local_rank_topology __rcu *llc_local_rank_topo;
 static void rebuild_llc_local_rank(int size);
 #endif
 
+/* Get sched domain by its name */
+static struct sched_domain *get_sched_domain_by_name(int cpu, char *name)
+{
+	struct sched_domain *sd = NULL;
+
+	for_each_domain(cpu, sd) {
+		if (!strcmp(sd->name, name))
+			break;
+	}
+
+	return sd;
+}
+
 static void update_top_cache_domain(int cpu)
 {
 	struct sched_domain_shared *sds = NULL;
@@ -753,6 +767,9 @@ static void update_top_cache_domain(int cpu)
 	 */
 	per_cpu(sd_share_id, cpu) = id;
 
+	sd = get_sched_domain_by_name(cpu, "NODE");
+	rcu_assign_pointer(per_cpu(sd_node, cpu), sd);
+
 	sd = lowest_flag_domain(cpu, SD_NUMA);
 	rcu_assign_pointer(per_cpu(sd_numa, cpu), sd);
 
-- 
2.34.1


