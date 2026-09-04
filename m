Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1D43B483
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513553; cv=fail; b=scdq/a+5C5AYEmSf466clMxuJh0LUHrrPY+3tCvK4w1VVbjzPq7ckDF14zj1AdEoxsg60khKfHaIvmcoWNTpbLNcv/QB1yOw4Mvf7P9los4gReEj3h1CGVeomYVmGn1xsZWFe6Ib0lYFT52TXLQupx3uA2M63GUHMJEdNN3+nDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513553; c=relaxed/simple;
	bh=bni7Pi4b94pA8k9nXWsSfpoo6C3SIGn8Da1VLwcsCog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eO9dimi2xKt0NTYM/Wet48Uic2WA91Bm+b32nE66SVjUnrndOh3XE8dNwIFc7aO7q0pOq84tUGsgdv5pUyx+vEtJr6GprOD3ueKtS5+kgaJJGXw3ECb0MtPOMK1tBal/9aOSb8N4y/DnJSbLI/+Coz5V0caE/Jnv/9uZ8Z4lE48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FJLbdw8X; arc=fail smtp.client-ip=40.93.196.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FJLbdw8X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHvGd2L/dXgof5DRjCY/rMyuY6uX6z1qKUhhNS/paefw6IDpWIz5qjuf4NjAyiYcg514Hbj3YK/JIxe/Ju6BnB6AxLY0BdAMsZrAbZ3bUZh2ZbO4k6vXHg/RDSQ1nOWQ5pXs8VcCNprew1ItMCRrlbSf6sw+6ofaFWVIOd/KZNdWuVP6QUkIi6k28IxqhU/cSNM4qnA0QcVK2DEMruCp76hAzwCcOTzUht0sWEqh3r55sYdOvE3ZdbVPpfUfa9qsgwLJKDDxlBQE5OxWbGJUMshQ+FwDyDRG9Z1B/QNAAg2a1rTPooNva+nrUnymJDoECda0I2awESMRHYVUDwz/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh8We7Ywop+Ffk12av4v9nX6khEIYv2GWAJJh9fKvM4=;
 b=WfBykAb4+icF6yJlaWSKL3G9AJEYO/jlm5/bmxLc4N4uWohuRWmuiYMySFOqzMO+y360em6JcllaVTrOoxTIE9pg9hLKhU0W+hJRYAFDSUga2C060SUDsloFrZ3FBuZ5Pm7dQpDjaPRbMTv2bsaY4ofCAL1BAmZxRVTmBtdvlugEOpSY/BCVkl46J64okGtLCOPn2Y6MLkcvybPOhoR/LuyackE9gyjPgJMBaDjPxpnyMWr3QWnlqpwxUVed9wn7kRVTdqnb18u7N59/S6gHHfRhfQiq9YrdAv9rbIvrEtOBzvNlp8OXm1MM69fh11WZh8INtB38qoy6PBYmVdqfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mh8We7Ywop+Ffk12av4v9nX6khEIYv2GWAJJh9fKvM4=;
 b=FJLbdw8XxAWbCuGB6Us961nwypHWKqaa17qkuYQXuYro6r6DX0ysG8V+6n42MxSOn24yyvWmsPnLCWAp3hEmEea5IUIyd+DnCaKwYHrHAdGL1lQOcrNynCNLBsTF2VLRLAVhN8js2WIksuckcc6+fuwda9w22i2FuNTAQy1gqQvZq4J34Y/nNRnKoabXFoga70/yW2yEDvENy82yLjKmjk8RkwdnYPnCJwBxrkjtY/Tr/36FStb3Ggv7MshE+X8KOuRV0m4Fd8WViGJtvBu1HlmlDy1QkMa8W9cQt7ZP0YsDjsa27BucaMU1jj41V2PFNrbw2LEPvGbk1sSEDdGeOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:19:07 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:19:07 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle selection
Date: Fri,  4 Sep 2026 11:18:05 +0200
Message-ID: <20260904091838.3617894-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904091838.3617894-1-arighi@nvidia.com>
References: <20260904091838.3617894-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: f46ef21b-c029-4c34-dc14-08df0a659262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2Z/tbCvvkv6MeEqGDA7aC31dtqCwWTgTFQ8dm/SHGplZf7WMfI484DvmWqfVmj9p555V9+xMTWxCPzBqSgcPo/NVDfIQgerJVn41BSZl/LWzgz6WHOgpYJcL7AHbNwmnqixri3GB+VdRP+pYwwkCJd51pwBS5QgVkhx0yDIarR6rKq7sGGx1sBHAEnSavoBf2LahUPZJ102jZFN7eoofiqUVcQtUtUIFUv1+1VpSorx0K07gW/hx8ooOsQHo047ZTP2Jb/HTHI0cNjy2HDKg4702x1JBI8LIOUEQfD5mnxZNX8XB/RY9PKIwBo7qsw4mwhWSuOXUOFczSQzV5Ioj91gdx7UuZLytkHqjCIQWsZORZTtHCpTyFGQLcv9NJS/HbG41Iaw3xvv1Qs4ySRv7VQbdpv8a8VtPtwP8hv4pr4o1ZHOY8KNo82oncozXSjL557hrmx6m+w9T2e+6bV1VX+lP6u1gzoczpZQoAm0Xn5nGjvDgSUKT+i8AF7cg4oRjbp25tgHKHHRcbF4X8/7Md3FgeNHWgtnPnWY5V9hl20e0tbsFYVM5Qy6BhuCUoaFwPkeHS6sCCYcn+SerK1WLi2QVvr2PLQgBtN6lxunkxNg4k0LAHTNb9ffQYP33P5T3NbTFrXW28gsZsnuGOtbM/noU4vieHv6/vBjdboTWlM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RvaNaLWPyhDj/q+rkln1ocuuB9tEiObp4/wbMIo9LqjJQ1CJRKKEqhnQ9ZM0?=
 =?us-ascii?Q?FrJq5Ih4mDfYmi4tmwNwL3ZKzX14XHArx0GqtCx+pejWbom+gkCTZuZLuDlK?=
 =?us-ascii?Q?kR4zsgciKbBD8Szyt1cotz5jWYXz6Y2s3ilXkzhWtpcMSJcwfqOr17gXcwad?=
 =?us-ascii?Q?PbK2vc7kcno+Z8gkIoTfh/4rX+XMbuZ74YNq/mmKTJpqZZdoJb7b7j1BJ8dw?=
 =?us-ascii?Q?TF34d2UO1ZmC2FYcp03a+Z3DBMvVpgj0Y3K+i9ZW3toNc2JugYXPatTEIDdS?=
 =?us-ascii?Q?YKkZgLm5/3vAgqy6HYQhSC2GIrvEMqDTH9xfLL9FWfD3YlPHQI11vG906Eek?=
 =?us-ascii?Q?Nk4XUKxz9AgkLP53gbSfIriSNyoRgxiaLxth7b22p2qA6cnf/sal97BL3smG?=
 =?us-ascii?Q?21dkMyRgu9k3OGySMNZNR8CR+bXJ+iXnwHFWesYF8vrq2jIC2eXt1nhmZqLD?=
 =?us-ascii?Q?M9IdtIg5QoBa2U4MrwabUD7WnjrHy/3eDZy+DqnrQaU9ZtSBlsrlPksy1tR6?=
 =?us-ascii?Q?EEvfkd+PbJQ1whl6IPEXGoJcjLqCn9ItQnUMpN+MaIq5J0b7VVNVI60KvAMI?=
 =?us-ascii?Q?yMtfb+NN41e5w4Shf1VhDHhHzwrPfVlYrCNo1JkV7hPf9pI2vrLYvc8DDefd?=
 =?us-ascii?Q?yQTUrGhhzOzeRzLhuCfFOr1MLRyCy9JT7G7PV8u1G11ITVqFZVTAsxPSzVkG?=
 =?us-ascii?Q?AOCO4CAZIjZ5QKgrbffRtM+KbX/OMlctdKrsQwEU4eC+Ft12pr8eZj7fXzG4?=
 =?us-ascii?Q?zqIkX3rIdyATQLkQnXMMB5QuCEpYTwthoXumun9jsAoTtAeBJ1LZkKieURiS?=
 =?us-ascii?Q?WEw2swO3Y8b8fdjpoIu3emQdyzcjLNjYuufWgwiESWz7vjt49p8OZ2Sy9ByV?=
 =?us-ascii?Q?FES8YoMAnbHGpxXLIk54gZsXRvIjB9ts85gSu7yergxMks3NiVA/n0Sk5ez7?=
 =?us-ascii?Q?+w/z3PWVjkCwxY3VHOPTLQ5VEZ2UAZ1qdnmLphd94CY/B4oLL//62rsnLdqM?=
 =?us-ascii?Q?EQEcLeGmJczJ4ICnq0eYx8ne3oOfw7tleRxMWB84f83Vugs5WQ7ZQv2PNA1F?=
 =?us-ascii?Q?TGWlsEDdokoc0I5d/ebm/YhufKCL3A3J0Q4o7ErV0bLv5UleiAKclboJ/vs7?=
 =?us-ascii?Q?gYr79p/fgonAylhAhDrYghKYuJERr6eUFv8CRnuapl2iNDOfSKmNKtUNYJLm?=
 =?us-ascii?Q?nWOpp0FadUc9SLpl4irB5wjgp2sLolGbspsoublpsn0YSOVUek52vLEb6r/1?=
 =?us-ascii?Q?3pGGwJ9Ldz5JWaG60FylAp2S4RPbOEEWojqz6yVg1KNXUThkcv+19nfAO+jO?=
 =?us-ascii?Q?3OPdPIj6Q0+ETB78gJkY3AwURNOhcRzg211czn4ez59/4prjoc98JBH9gPoW?=
 =?us-ascii?Q?S+kTPb2S94RM8WWA/TdpzmwkVEz+hRLq1yJ3pFvuZi0cjEz+JX+8Wf25n5Hw?=
 =?us-ascii?Q?9g2t2EEY8AM/2UTfPcqL+gmK3/RAjBoLK1wTyyuIu6Rz3Vld+FcVR7wrNCHj?=
 =?us-ascii?Q?SUr35a0VaYb41rknMWJPoLVlbS49cXEai1rAGHHNHRlY9TRzXtPeD86WoDvP?=
 =?us-ascii?Q?ffw2i7YCE4JLGy7WWsteD8Whv5dV21hcpCneCCMH+TkuEnH666/mFBu/HBxu?=
 =?us-ascii?Q?2b7vBBjukSpf1sVu+whgSoBrhwlaBQoVUsdURp7XaxDPyeyB4TSXWOn81m56?=
 =?us-ascii?Q?yjiOOzbpm+3h0+MgTQ+BDgOfjK8nnJ379AI2QgUmYAWSKZQGuDeSte1H+MEY?=
 =?us-ascii?Q?tVSiOst8Fg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46ef21b-c029-4c34-dc14-08df0a659262
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:19:07.5515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFFpK0UFJNP4FUQBMTL7TfdcNrsLyULvem5o1Ixqsov77DxrOM3jFvokibVTWFEr5EswbXhYxNr4YPaTUvPRIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490

POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity
SMT level to order hardware threads. Idle CPU selection does not consult
that order, so a task can wake on an arbitrary sibling and remain there
until load balancing corrects the placement. On these systems, that
initial choice can prevent the core from entering its preferred
lower-thread resource mode and cause a large and persistent performance
loss.

When idle selection finds an available CPU in an SMT core, choose the
highest-priority available sibling. On SMT2 Olympus this only changes
selection on fully idle cores. A partially idle core has only one
available CPU. On wider SMT systems such as POWER7, it also fills
available siblings in priority order while the core is partially busy.

Apply the preference to idle-core and idle-CPU scans,
asymmetric-capacity scans, and the target, previous, and recently-used
CPU fast paths. Inspect the lowest scheduling domain directly, but
require both CPUs to share its span because isolcpus can split hardware
siblings across scheduling domains.

Keep physical-core capacity selection independent from SMT sibling
ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
maximum capacities, then SD_ASYM_PACKING selects the preferred available
sibling inside the chosen core, whose siblings continue to share equal
capacity.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/fair.c     | 79 ++++++++++++++++++++++++++++++++++++-----
 kernel/sched/sched.h    |  6 ++++
 kernel/sched/topology.c | 36 +++++++++++++++++++
 3 files changed, 112 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b8bd308c2d5b1..ff9a7b1fcbe7f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8587,6 +8587,63 @@ static inline bool test_idle_cores(int cpu)
 	return false;
 }
 
+/*
+ * Return true when @cpu has a higher asymmetric-packing priority than
+ * @other in their shared SMT scheduling domain.
+ */
+static bool sched_smt_asym_prefer(int cpu, int other)
+{
+	struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);
+
+	if (!sd)
+		return false;
+
+	if (!(sd->flags & SD_SHARE_CPUCAPACITY) ||
+	    !(sd->flags & SD_ASYM_PACKING))
+		return false;
+
+	if (!cpumask_test_cpu(other, sched_domain_span(sd)))
+		return false;
+
+	return sched_asym_prefer(cpu, other);
+}
+
+/*
+ * Return the highest-priority available CPU in @cpu's SMT core that is also in @cpus.
+ */
+static int __select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
+{
+	int best = cpu;
+	int sibling;
+
+	for_each_cpu_and(sibling, cpu_smt_mask(cpu), cpus) {
+		if (sibling == best || !choose_idle_cpu(sibling, p))
+			continue;
+
+		if (sched_smt_asym_prefer(sibling, best))
+			best = sibling;
+	}
+
+	return best;
+}
+
+static inline int
+select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
+{
+	if (!sched_smt_asym_active())
+		return cpu;
+
+	return __select_idle_smt_cpu(p, cpu, cpus);
+}
+
+/*
+ * Redirect an available SMT CPU to a higher-priority available sibling allowed by task affinity.
+ */
+static inline int select_idle_smt_priority(struct task_struct *p, int cpu)
+{
+	return select_idle_smt_cpu(p, cpu, p->cpus_ptr);
+}
+
 /*
  * Scans the local SMT mask to see if the entire core is idle, and records this
  * information in sd_balance_shared->has_idle_cores.
@@ -8645,7 +8702,7 @@ static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpu
 	}
 
 	if (idle)
-		return core;
+		return select_idle_smt_cpu(p, core, cpus);
 
 	cpumask_andnot(cpus, cpus, cpu_smt_mask(core));
 	return -1;
@@ -8668,7 +8725,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
 		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
 			continue;
 		if (choose_idle_cpu(cpu, p))
-			return cpu;
+			return select_idle_smt_priority(p, cpu);
 	}
 
 	return -1;
@@ -8720,7 +8777,7 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 						return -1;
 					idle_cpu = __select_idle_cpu(cpu, p);
 					if ((unsigned int)idle_cpu < nr_cpumask_bits)
-						return idle_cpu;
+						return select_idle_smt_priority(p, idle_cpu);
 				}
 			}
 			cpumask_andnot(cpus, cpus, sched_group_span(sg));
@@ -8745,7 +8802,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 	if (has_idle_core)
 		set_idle_cores(target, false);
 
-	return idle_cpu;
+	return (unsigned int)idle_cpu < nr_cpumask_bits ?
+		select_idle_smt_priority(p, idle_cpu) : idle_cpu;
 }
 
 /*
@@ -8858,7 +8916,7 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 		 * immediately.
 		 */
 		if (fits > 0 && preferred_core)
-			return cpu;
+			return select_idle_smt_cpu(p, cpu, cpus);
 		/*
 		 * Only the min performance hint (i.e. uclamp_min) doesn't fit.
 		 * Look for the CPU with best capacity.
@@ -8915,6 +8973,9 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 	if (has_idle_core && best_fits > ASYM_IDLE_COMPLETE_MISFIT)
 		set_idle_cores(target, false);
 
+	if (best_cpu >= 0)
+		best_cpu = select_idle_smt_cpu(p, best_cpu, cpus);
+
 	return best_cpu;
 }
 
@@ -8971,7 +9032,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 	if (choose_idle_cpu(target, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
-		return target;
+		return select_idle_smt_priority(p, target);
 
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
@@ -8982,9 +9043,9 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
 		    cpus_share_resources(prev, target))
-			return prev;
+			return select_idle_smt_priority(p, prev);
 
-		prev_aff = prev;
+		prev_aff = select_idle_smt_priority(p, prev);
 	}
 
 	/*
@@ -9015,7 +9076,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
 		    cpus_share_resources(recent_used_cpu, target))
-			return recent_used_cpu;
+			return select_idle_smt_priority(p, recent_used_cpu);
 
 	} else {
 		recent_used_cpu = -1;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8e..568cb1ed2dd6b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2240,6 +2240,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
 DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 
 extern struct static_key_false sched_asym_cpucapacity;
+extern struct static_key_false sched_smt_asym_packing;
 extern struct static_key_false sched_cluster_active;
 
 static __always_inline bool sched_asym_cpucap_active(void)
@@ -2247,6 +2248,11 @@ static __always_inline bool sched_asym_cpucap_active(void)
 	return static_branch_unlikely(&sched_asym_cpucapacity);
 }
 
+static __always_inline bool sched_smt_asym_active(void)
+{
+	return static_branch_unlikely(&sched_smt_asym_packing);
+}
+
 struct sched_group_capacity {
 	atomic_t		ref;
 	/*
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a7..06c40eb5932af 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -683,8 +683,24 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
 DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 
 DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
+DEFINE_STATIC_KEY_FALSE(sched_smt_asym_packing);
 DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
 
+static bool has_asym_smt_domain(int cpu)
+{
+	struct sched_domain *sd;
+
+	for_each_domain(cpu, sd) {
+		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
+			break;
+
+		if (sd->flags & SD_ASYM_PACKING)
+			return true;
+	}
+
+	return false;
+}
+
 static void update_top_cache_domain(int cpu)
 {
 	struct sched_domain_shared *sds = NULL;
@@ -3084,6 +3100,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	struct rq *rq = NULL;
 	int i, ret = -ENOMEM;
 	bool has_asym = false;
+	bool has_asym_smt = false;
 	bool has_cluster = false;
 
 	if (WARN_ON(cpumask_empty(cpu_map)))
@@ -3202,6 +3219,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 
 		cpu_attach_domain(sd, d.rd, i);
 
+		if (has_asym_smt_domain(i))
+			has_asym_smt = true;
+
 		if (lowest_flag_domain(i, SD_CLUSTER))
 			has_cluster = true;
 	}
@@ -3210,6 +3230,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	if (has_asym)
 		static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
 
+	if (has_asym_smt)
+		static_branch_inc_cpuslocked(&sched_smt_asym_packing);
+
 	if (has_cluster)
 		static_branch_inc_cpuslocked(&sched_cluster_active);
 
@@ -3310,11 +3333,24 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
 static void detach_destroy_domains(const struct cpumask *cpu_map)
 {
 	unsigned int cpu = cpumask_any(cpu_map);
+	bool has_asym_smt = false;
 	int i;
 
+	rcu_read_lock();
+	for_each_cpu(i, cpu_map) {
+		if (has_asym_smt_domain(i)) {
+			has_asym_smt = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
 	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
 		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
 
+	if (has_asym_smt)
+		static_branch_dec_cpuslocked(&sched_smt_asym_packing);
+
 	if (static_branch_unlikely(&sched_cluster_active))
 		static_branch_dec_cpuslocked(&sched_cluster_active);
 
-- 
2.55.0

