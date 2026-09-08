Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1E8412269
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855861; cv=fail; b=gs8hdp4yhTxwlg4gQ4mWmQlPm9kJb0FDnlKgOdirsAFQ/fIvakoZ78zQXShekpCcPXhae9Hh6B1xyvWhWt7TO3J0x+6S+gl7WQnQ5cAobrQKEuFK5dkZednaXp4ss4oZRCsdPbZTs9srUU/C91/a0+zz8KDHxm5sM/LwMiQz7rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855861; c=relaxed/simple;
	bh=fkIiwBPwlHgpenpeXwmIkgPfKjRTO8vyGn+kj5ov+iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o883/lSeJXfve8lpvG65qLDsF2dLPl6dGK0/e3ZjMeWyIjHkGDGLcZfVB98HEdjn5yXWWlDsLDYqpMG4I6NXw6yUQcMW5tyV3ndVilUFiPgnzVZnlor/6jAXI/IL03i/XufkQt4GgtGNmJaXxQFZC+D7Ji6wLyslkIYcWld51lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NCaf+xZt; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NCaf+xZt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsNQBfUXTZ8CUZlNIyRpwE2NW3lRJ/vo4lFlTtZcLtXWXxFLx3qgvxAN/HhS3Aovx6FwGH6LMuBYLcfANwQXCTkrulZwi7tRS122l+7UJ/UaHlmqk024/Za86mLsCqEhbbplCxTHfQ8iuOotobr7tfJHSpuwiMHWIPV3MAfCmmZJ5/75r9T69XnWCLJpVGbSlTytH+IX5c5Tvm/pIfj6hn2a2ZsdNufXVp5FupuLM9Be/RiC/Myws2TTzV6Wls6tRImLFFaYRZlspcgDkC493FoU10kiyrsd58ificIeRCZIRaUqN6HH/wiFxjbgXYaf0zTA9rzW4ORbgTWnz3YbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M+hM3+vBkrrGz+pKZWRXDRidaH6HiblK4ACIn9CTYA=;
 b=HDLZF8IFJmCAEIM3SGG8FTciF6QP4VmKMJfWOIzksA6BL0oyl43loWhd8m0dCFQci7uF+5BcUNZSQ/6icyKeQP45kRw+qmeHhnrrEJeWO43aSNrc+U3OCnf44NnZFliHPLV2lUo4hGB9GQ+EmMycSoM48kH6v6xkjZ0LKaxJYBhqCj27Y10tyxrFeiijvs1gbTcTFqzWgXQ7mnDIZOnbMLWdzguwfdDXrvwyXXZgSL0ih5RK3ds8BQ/0XdYkJXO0ZjnLGygsZiqwigKYVxnLap4FwxaP06Mg2YMY7q4k8kTWvf7V+T0B6hJwzXfWaGK/kxqk2gwwQ9zzxfjsFXeETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M+hM3+vBkrrGz+pKZWRXDRidaH6HiblK4ACIn9CTYA=;
 b=NCaf+xZtFR/8yUCK76k2X+bFaB4tls8uURhw6Zo/qb56MTlT/1Qa78231LfIkDgquhxBxhcnvThy+Z4y/YOStqVsHZfrKItJjJhFx1lSK4Zwyt1pcxlh3/vEIcsLHgdvGWL/8AsOwOcWsUcfHmwdyD5yHe338ClWUZrJkbKIrFTHaOrs5Lhru31FN+LjnTjy/a8fJ+1is6EEc/5f3B8MIaxyFRkYxjzxZXi4Y22nw71QrPRooqLBlAjdwKQOb58WHQILzTNeP8h4mSQyzEoT9vB/gJc03kVoZLTUDCzHZkCEgOs0B4L26EqYatHc3LXK4H9TWMbYpv2goKb+cB4YxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by LV0PR12MB999069.namprd12.prod.outlook.com (2603:10b6:408:32a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 08:24:16 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 08:24:16 +0000
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
Date: Tue,  8 Sep 2026 10:23:13 +0200
Message-ID: <20260908082345.103087-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908082345.103087-1-arighi@nvidia.com>
References: <20260908082345.103087-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B7F.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::413) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|LV0PR12MB999069:EE_
X-MS-Office365-Filtering-Correlation-Id: f50d4ac0-09d9-4f81-fba4-08df0d829263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c+AV5inAInGj+Mp6o6q3f0uJ65z4mqAeaya5ZFEHgUJtSnUcATAPs/6nYrGe4ZM7j7KPoo2X2cYOnvTXRVUrc2nYMBNMZIAq1O8Q2djj73hobb5MihJ3rOCLm9rvIX7jdLsQNVPFI/Mc5DD/QUtOeu5RYdHeScchde3BZHoFyI3Gd6i8EQqSFIaVTO+8862XEtfe+UG/u9Sp0hn2Ioq2ebXdHRT1UTyBNQMwsuqN3C45wW80xaPDW5AZ/43rW9/2DaRghBkMK7z+/UwSGh7RaPwFLFDcNfnbXw1zKcEHi5X28ZBjybzlwBeOCcENC0s1KvQAdHQXkTLs3iT53s+geZFbH+0KAsYJAxwED3ZHLOg2zs3qmAxlT05Do6Er5U/bqKwlfbHBVV6L8bi0skNsWs3Wf3xXcXUztei7lAZtOF1IIU17mNLFVMJbOqIZwFAZ3xF6jTAdFkGGnu6NT+kbpcZ4peE/LWMxFLfaVmjcKs8L0UrNsKiy8RHA9PTi2fXZsajRY7GTMSb0+M8WGgOslLj/OmkxtB1Y9VEkMg6Mo1ruzMwvDuTDLOVin/Kfv+Zi6KmgBYNwK5dfgGpXPuveReG7GIqNUMXIE+PuYjd/TvpYjbMGb9wxa32gC0rQXl4fR28DfEXABZkmigrYJfLhHpoTFxRWHIAoUzQQxpRK12s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vWUuZD4KyBCosD1YpuboJv72ybI6mBeycKOxPp9uVRahNYDPRmLfnVpjsk/o?=
 =?us-ascii?Q?0T8yCPK58vZ6rus1hUl6coGb6jvKPJV2FThz1CbHFGNXpuE7HKYpscQIkyRv?=
 =?us-ascii?Q?+gXn9U5YsxG7kAG53HhrYPvuQ+5Ebp2otvX3eP5zjgEapgj81O/P2Qu3QAMO?=
 =?us-ascii?Q?FNF1/3GWWP2ZmHgPEZOHLmGFi+LDEOCIm/CGOD5IkPpTFxkRHTh/xvHPOE54?=
 =?us-ascii?Q?sMjOAlni00ylTRe7K2A4bBJWXi2oqYAKYcrQxrpvNbeIJybnKfPjkUsYMHUs?=
 =?us-ascii?Q?fsdaM2P7ZR5DzWnOVPFdE7wIAmVIw2OWYhm8dfU1wA6k2foHvfSvpJTOHe0P?=
 =?us-ascii?Q?ZpFBoDwTjGMuhffU5sWEkQL6ZTpBxpq3UsDVIvneT381/eWdfeDDTXE24pOf?=
 =?us-ascii?Q?rVO8WwuA7gxf3OzIgf29dKH6k0aZ5UblOUtDqllqbPdSg0QdTxfpO7KoA6Lk?=
 =?us-ascii?Q?YVRyhtqjQedVUyKrZpxWcxmy61GbAjSHavbD8PeYSMfAdOrCzZshRymn2yvC?=
 =?us-ascii?Q?g6FSnuynFsFB7SdFmIWc7V3BTQ+C4kFdayfv95VOMklvxA+ZhTQFDir3P229?=
 =?us-ascii?Q?uoFiLIZelj/ZbtJY10rUC73HvazcKos5uTlF59Rx/JTZ+OlV9b91oeMMlBFD?=
 =?us-ascii?Q?+g7JCNwB/Dr/0sYLGtzEAQQCeKx9dNgID5MiaWxaYxtsAsZvWIVFOmc65Pwj?=
 =?us-ascii?Q?OrDszCA6CzeiP+TxkCQRVl6NdxXe6+lqMJu52C96ufVTg33TYYmxoyUu+7D7?=
 =?us-ascii?Q?c7N6e3jQcOiohICumklGv/QYdupWCAfvDkq63LuOaOPCFvmInv3qtsdWUrcJ?=
 =?us-ascii?Q?d158EC3/8nc/lKTTuLXxRyRGiEGQ2WiIojOXe8hjwEHXWdbR80rQI8VbLEAv?=
 =?us-ascii?Q?LHf6EdFiDajus+Du4fC0bp11GbeU/9JZLH4S4fmwSHvRDKx+v/va5XZdNToT?=
 =?us-ascii?Q?E26yzaWH40s5gqzTJSVCwaRVRDwS6z/5b2lJqiOk4UfqkRZkyVmu2iZIAwr5?=
 =?us-ascii?Q?e909lVjjJB5JrrNbZD7ew1z8CDLCbibyxnICRdqffofm8ieY/kuMZlh5vrR5?=
 =?us-ascii?Q?6ptxX4o1Xpp6sVuoST9SqJ1rThTMNK1t+Dxpx8eAOwYExo9eKi/1tQBoxhYx?=
 =?us-ascii?Q?BWgKTIsV1/AOb7nJiBNhIVqMtTFtKlyw5s8YmahYXROSFdr44TUHjHZUo124?=
 =?us-ascii?Q?JMQVsNvSYZP0VQoXkToDR7cV+Eeo+I21C8xDT8b2O7bDNdYrCTOQvUlBvIyJ?=
 =?us-ascii?Q?TZ73f8im715cshFIxdgVFP6wH5CZhTSxgcWV5g+TGY0ZE70jHIbw4H44WUD5?=
 =?us-ascii?Q?sRsQztFD7Gs/is7VNhw6AGzHJkwqOwbhaRMSoQg30JO6BIRvmjqsXxoDmegv?=
 =?us-ascii?Q?Fr6uGfgJWXw2EFogEXdgaAPJ3TGv574rQEYm8nkOfxbWzMmaNZPOwWo+3Woh?=
 =?us-ascii?Q?pJwVp75XHF3G9R9itEPtlwwXdYagJxJnkurwwlzWc/kc91YT6cf5Zgoe7n+1?=
 =?us-ascii?Q?LL20to/Xm7q3b0LhPpgS3suE41UQGC3nLZMD656mDmll9O4X30j3pdw9Lz/k?=
 =?us-ascii?Q?kiyLVgpmpNOYxj65BkD/EEbir0OjlGqp9mdm0NpOR1f+IdaJu4ZndrFugs5U?=
 =?us-ascii?Q?o+FMUNv/qX9H+l0mRTEBpg7ohhDIgPLQezBRkzlnj769hijBjeytQ6j92f8L?=
 =?us-ascii?Q?WUpA8bqF5V812EXkWxsg9RkzGyPJ+237RkQ6MaSJx+71rme5KNe8tL4A7knv?=
 =?us-ascii?Q?cD5LLOK4Vw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50d4ac0-09d9-4f81-fba4-08df0d829263
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:24:16.5238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpJuO6CidnFcIQao8wL2XrW8M+64M3pQpDwcoA65YetWJAH4FpW2uYt1WnczWcTJvt6YSXcs0eDCX2RAe53tUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999069

POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity SMT
level to order hardware threads. Idle CPU selection does not consult
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
asymmetric-capacity scans, target, previous, recently-used CPU fast
paths and the slow path. Inspect the lowest scheduling domain directly,
but require both CPUs to share its span because isolcpus can split
hardware siblings across scheduling domains.

Keep physical-core capacity selection independent from SMT sibling
ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
maximum capacities, then SD_ASYM_PACKING selects the preferred available
sibling inside the chosen core, whose siblings continue to share equal
capacity.

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/fair.c     | 85 ++++++++++++++++++++++++++++++++---------
 kernel/sched/sched.h    |  6 +++
 kernel/sched/topology.c | 36 +++++++++++++++++
 3 files changed, 110 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b8bd308c2d5b1..37837c36288a0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8587,6 +8587,35 @@ static inline bool test_idle_cores(int cpu)
 	return false;
 }
 
+/*
+ * Redirect a CPU to a higher-priority available sibling in its SMT domain,
+ * subject to task affinity.
+ */
+static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
+{
+	struct sched_domain *sd;
+	int best = cpu;
+	int sibling;
+
+	if (!sched_smt_asym_active())
+		return cpu;
+
+	sd = rcu_dereference_all(cpu_rq(cpu)->sd);
+	if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
+	    !(sd->flags & SD_ASYM_PACKING))
+		return cpu;
+
+	for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
+		if (sibling == best || !choose_idle_cpu(sibling, p))
+			continue;
+
+		if (sched_asym_prefer(sibling, best))
+			best = sibling;
+	}
+
+	return best;
+}
+
 /*
  * Scans the local SMT mask to see if the entire core is idle, and records this
  * information in sd_balance_shared->has_idle_cores.
@@ -8971,7 +9000,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 	if (choose_idle_cpu(target, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
-		return target;
+		goto select_smt_priority;
 
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
@@ -8981,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
-		    cpus_share_resources(prev, target))
-			return prev;
+		    cpus_share_resources(prev, target)) {
+			target = prev;
+			goto select_smt_priority;
+		}
 
 		prev_aff = prev;
 	}
@@ -9000,7 +9031,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    prev == smp_processor_id() &&
 	    this_rq()->nr_running <= 1 &&
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
-		return prev;
+		target = prev;
+		goto select_smt_priority;
 	}
 
 	/* Check a recently used CPU as a potential idle candidate: */
@@ -9014,8 +9046,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
-		    cpus_share_resources(recent_used_cpu, target))
-			return recent_used_cpu;
+		    cpus_share_resources(recent_used_cpu, target)) {
+			target = recent_used_cpu;
+			goto select_smt_priority;
+		}
 
 	} else {
 		recent_used_cpu = -1;
@@ -9037,7 +9071,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		 */
 		if (sd) {
 			i = select_idle_capacity(p, sd, target);
-			return ((unsigned)i < nr_cpumask_bits) ? i : target;
+			if ((unsigned int)i < nr_cpumask_bits) {
+				target = i;
+				goto select_smt_priority;
+			}
+			return target;
 		}
 	}
 
@@ -9050,14 +9088,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 		if (!has_idle_core && cpus_share_cache(prev, target)) {
 			i = select_idle_smt(p, sd, prev);
-			if ((unsigned int)i < nr_cpumask_bits)
-				return i;
+			if ((unsigned int)i < nr_cpumask_bits) {
+				target = i;
+				goto select_smt_priority;
+			}
 		}
 	}
 
 	i = select_idle_cpu(p, sd, has_idle_core, target);
-	if ((unsigned)i < nr_cpumask_bits)
-		return i;
+	if ((unsigned int)i < nr_cpumask_bits) {
+		target = i;
+		goto select_smt_priority;
+	}
 
 	/*
 	 * For cluster machines which have lower sharing cache like L2 or
@@ -9065,12 +9107,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	 * first. But prev_cpu or recent_used_cpu may also be a good candidate,
 	 * use them if possible when no idle CPU found in select_idle_cpu().
 	 */
-	if ((unsigned int)prev_aff < nr_cpumask_bits)
-		return prev_aff;
-	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
-		return recent_used_cpu;
+	if ((unsigned int)prev_aff < nr_cpumask_bits) {
+		target = prev_aff;
+		goto select_smt_priority;
+	}
+	if ((unsigned int)recent_used_cpu < nr_cpumask_bits) {
+		target = recent_used_cpu;
+		goto select_smt_priority;
+	}
 
 	return target;
+
+select_smt_priority:
+	return select_idle_smt_cpu(p, target);
 }
 
 /**
@@ -9747,8 +9796,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	}
 
 	/* Slow path */
-	if (unlikely(sd))
-		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
+	if (unlikely(sd)) {
+		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
+		return select_idle_smt_cpu(p, new_cpu);
+	}
 
 	/* Fast path */
 	if (wake_flags & WF_TTWU)
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

