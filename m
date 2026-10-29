Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793241079;
	b=fCrA+XPq6ogKmqgxooKrfEsJyCA3/sbHB3vUlY1FzRZYjxJr2O5v1MMebHYxGx3VwYLo
	 OlLeWnodsNi+6Fd6ZSZX71hRm19FbEBswC2ScMw718JF/wqDPEogIRvAiE/xXXSr6/+/j
	 4YY9SmVTKZo+ayyRZtprm597AamwVQtWqoSbZO/aAJzaHCdUyA6DSpbddvyHWY0ct2cBD
	 v/Pvssey5ZoBttPGhQDUtLeHmgwXRD3kRpMxj56doYcH5wlSJkXEmeC9heiO5K6+evxBL
	 dnkKI8jWfano5fdKWn/d+pciIwEJ9cMLWj1w/SXUzC+YfKRybm0fR+qPZ4FeR1es4cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793241079;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=pb+6LSg1e/mt5m4hjS2N4unf/Tq+5ITpN7ZF/2tjmpY=;
	b=Uze2k9EAOenNFFDotK6qMJktJQSpCHg9MzOMVd6I0cOidwKsAR0BNV9QPDHCeN3ceXwH
	 VzgSOXgMFoH6XubCgcLPmfilWYdiySJ6RgBbNAc5mrLKA4+NoZZNaql8AQ+LOFqgU8iT9
	 vEINagQwEoGD0uNWbfGYm2N33dPZwoZN7xrx4t0feMxShWyUpkOXXNEp83ZBIoLs/NFet
	 l5bwVtEXCPsIGaR3XdodBmeDZMO0rLO3QFujG/345XaUxrtCLCaufC+c/XEgPAG4aV0AC
	 CRkZLPUeXkHvira8ISck4qusB3HBc5CPZA8JguwQv7HWpOX3iuXO67Nyzb7Pko3A+Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B21606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5B21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSs705LZz171Yk;
	Thu, 29 Oct 2026 10:31:07 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFSs66k2Lz171Yk;
	Thu, 29 Oct 2026 10:31:06 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 1B9D75943;
	Thu, 29 Oct 2026 10:30:59 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 10:31:03 +0800
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
Subject: [RFC PATCH v3 07/17] sched/topology: Add per-sd scratch for cache-aware load balancing
Date: Thu, 29 Oct 2026 10:20:25 +0800
Message-ID: <20261029022036.4002331-8-wujianyong@hygon.cn>
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

Cache-aware load balancing needs arrays of eligible LLC/node IDs and
affinity weights when scoring candidate runqueues. Selecting a source
runqueue by LLC load also needs a temporary CPU mask to avoid sampling
the same LLC more than once.

Allocate these buffers on the bottom sched domain of each CPU, next to
llc_counts, rather than allocating memory in the load balance path.
Size both affinity arrays by llc_max and the independent statistics mask
by cpumask_size().

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/sched/topology.h |  7 +++++++
 kernel/sched/topology.c        | 37 +++++++++++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index b5d9d7c2b8ad..e41fc64391c3 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -121,6 +121,13 @@ struct sched_domain {
 	unsigned int llc_max;
 	unsigned int *llc_counts __counted_by_ptr(llc_max);
 	unsigned long llc_bytes;
+	/*
+	 * Scratch for the load balance affinity score, llc_max entries each.
+	 * Only the bottom sd owns them, like llc_counts above.
+	 */
+	int *affi_ids __counted_by_ptr(llc_max);
+	int *affi_weights __counted_by_ptr(llc_max);
+	struct cpumask *llc_stats_mask;
 #endif
 
 #ifdef CONFIG_SCHEDSTATS
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 37f1eeae9b7b..7d65a4d7b0dd 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -643,6 +643,9 @@ static void destroy_sched_domain(struct sched_domain *sd)
 #ifdef CONFIG_SCHED_CACHE
 	/* only the bottom sd has llc_counts array */
 	kfree(sd->llc_counts);
+	kfree(sd->affi_ids);
+	kfree(sd->affi_weights);
+	kfree(sd->llc_stats_mask);
 #endif
 	kfree(sd);
 }
@@ -846,10 +849,16 @@ cpu_attach_domain(struct sched_domain *sd, struct root_domain *rd, int cpu)
 			sd->llc_counts = tmp->llc_counts;
 			sd->llc_max = tmp->llc_max;
 			sd->llc_bytes = tmp->llc_bytes;
+			sd->affi_ids = tmp->affi_ids;
+			sd->affi_weights = tmp->affi_weights;
+			sd->llc_stats_mask = tmp->llc_stats_mask;
 			/* make sure destroy_sched_domain() does not free it */
 			tmp->llc_counts = NULL;
 			tmp->llc_max = 0;
 			tmp->llc_bytes = 0;
+			tmp->affi_ids = NULL;
+			tmp->affi_weights = NULL;
+			tmp->llc_stats_mask = NULL;
 #endif
 			/*
 			 * sched groups hold the flags of the child sched
@@ -1307,6 +1316,8 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 {
 	struct sched_domain *sd, *top_llc, *parent;
 	unsigned int *p;
+	int *p_ids, *p_w;
+	struct cpumask *stats_mask;
 	int i;
 
 	for_each_cpu(i, cpu_map) {
@@ -1316,8 +1327,20 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 
 		p = kcalloc_node(max_lid + 1, sizeof(unsigned int),
 				 GFP_KERNEL, cpu_to_node(i));
-		if (!p)
+		/* Scratch for the load balance affinity score. */
+		p_ids = kcalloc_node(max_lid + 1, sizeof(int),
+				     GFP_KERNEL, cpu_to_node(i));
+		p_w = kcalloc_node(max_lid + 1, sizeof(int),
+				   GFP_KERNEL, cpu_to_node(i));
+		stats_mask = kmalloc_node(cpumask_size(), GFP_KERNEL,
+					 cpu_to_node(i));
+		if (!p || !p_ids || !p_w || !stats_mask) {
+			kfree(p);
+			kfree(p_ids);
+			kfree(p_w);
+			kfree(stats_mask);
 			goto err;
+		}
 
 		top_llc = sd;
 		/*
@@ -1333,9 +1356,15 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 			sd->llc_max = max_lid + 1;
 			sd->llc_counts = p;
 			sd->llc_bytes = get_effective_llc_bytes(i, top_llc);
+			sd->affi_ids = p_ids;
+			sd->affi_weights = p_w;
+			sd->llc_stats_mask = stats_mask;
 		} else {
 			/* avoid memory leak */
 			kfree(p);
+			kfree(p_ids);
+			kfree(p_w);
+			kfree(stats_mask);
 		}
 	}
 
@@ -1345,9 +1374,15 @@ static bool alloc_sd_llc(const struct cpumask *cpu_map,
 		sd = *per_cpu_ptr(d->sd, i);
 		if (sd) {
 			kfree(sd->llc_counts);
+			kfree(sd->affi_ids);
+			kfree(sd->affi_weights);
+			kfree(sd->llc_stats_mask);
 			sd->llc_counts = NULL;
 			sd->llc_max = 0;
 			sd->llc_bytes = 0;
+			sd->affi_ids = NULL;
+			sd->affi_weights = NULL;
+			sd->llc_stats_mask = NULL;
 		}
 	}
 
-- 
2.34.1


