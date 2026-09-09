Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0395630569F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935240; cv=fail; b=S/B7DOHZ4y100ont55UHXDNWhLX75V9MLaJI1j6wlkIK/DI0pkXbChEIN1BUsZXQyP3RdG0ZTO4zURsN8x0rkUYKXzaRXdTDzTBi1bDR8clIOgT3zwkkBlESAfylcwTOX2inn9JC6EijVmHEiAud3fawzLJdsediURYF0LTEtaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935240; c=relaxed/simple;
	bh=QDPvXjGNkIEz1/uwcX0Ekx0vG9/qcrO9NdK/QuSogBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K1H45+aiL1CGFoAx2DPJZSZ+1X6QIOBWVQxrrG4k7nW651zDDuFE/GhX/kbRyCvbEHZpW0/VwGNHKFe++h1iy8T7NQ7Wu5+aT2Knl8UmFyymcsYxnowusHtqz9cuEQJDmk3/9oYnwyGF+jQWkMkuRUdfZ8lrfhRWkdlPPJVu7wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VKWo8HDJ; arc=fail smtp.client-ip=40.107.209.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VKWo8HDJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3GPlo7WA0p0i3oZC//xkeE7KD96gZxUHwWyChkT1QDJjKEn/y1MxIDYRrfsymfq7H3N+iEeYFFUaPbEiFdnfhFiQw6QD3t1yNvrTR3sm3GG9PhX0LHG4HNoa36im/zNB1H+TaBbMpsR4XXdaM8Heq1V7fU7xL8lrHkLIyW1sdwbnbdxpy7Rl8QiCt8PWnJHXrhvvbal/h/syDrm9CqfQZtiNB4VTUwJ9YD3CGtnyt7MWAzBvU+10WHWx8V8bnKFVjA/ejHvyuiaRw2I26VqQSNbBBZliFJj8sFh9LC3sVhspoeAqPYrG7EE24NwTLB4O799cHLvz5KsQyoUDpit2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PG1IApBdetBsh6raGJ0jTSnRK4n1xXZfA9GLNGitWa4=;
 b=OVwvIU7TzRF23sPEoPrlQ4Ncs9c2oYEkzAKSV+4NTMMw/24wTo/c+71wqyxhbOGbfx5J5lhaS2PVOmp106mshta+2NFKFSePmXvbpZTVxSeYpOLMy8T7pekYtlLqDg7jRB8F64mXXC9Kf/boPDYMHaYIHSAA5wSihx+jxq2AXlw6DmmzJ9cxQyXZu0dhet6BjHuunVW+IvhY5rAMYaQPwUStsci3pdqQ3qqL9F+b6qCNYNLDh8QBjck4mJW8RrVps954fvAlO+5b1qio4hKgbCGxNYAxVYtJ1dq/z9LdxdhSkQgLaDv0IhYGCB2xhwYNmXM3Nw54mlLn/ZD0eHSN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG1IApBdetBsh6raGJ0jTSnRK4n1xXZfA9GLNGitWa4=;
 b=VKWo8HDJAPW2FL0NaO7FKHPolEO/s+yq0HQTwOEcymLe8YfFmQVr1spW2xe5RGOAQXk2Y+mbpBrKiS7x0je67ToenRrKR8i5ATYKzGKgneHnwJ0KVIC/AXy7ylgE4nJFbrP6cX3tl+FettNEHZ4IJpRDUXCytu6zM4IjmXIdMlpVk47tplPBSKwOpPLTzHp4Wg3/6+5ONkLSgf4rgCMFHMpuAy37YivTiWs18HD2aW8AkRWQPYQVUj27lygV9bp8qn9PXsqwK1K63P8cGOGgIO7woZJe/fZyS6de6VDs9Ogajk4Nap9ibCA23DNnRdgXWdu354n2yvcP3WFOEZoudA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 06:27:13 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 06:27:12 +0000
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
Subject: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
Date: Wed,  9 Sep 2026 08:26:08 +0200
Message-ID: <20260909062649.469633-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909062649.469633-1-arighi@nvidia.com>
References: <20260909062649.469633-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF000008D1.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::42f) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: b6871d78-103e-4747-504f-08df0e3b6204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|11063799006|5023799004|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	npWBqSRAvt/zmiaGUJIYQsMfvgP7Mf70zzqymwgjYampqM0yA2mLnBgJIMRBsZBOYtOsayAv8DOW76wEH73ZJXydRUT2Dj3NlwK1nlo4U3d4dnKFO6uGuPWqkqfnOz5SCZgAXfqM+Dr5EuxPetyza+6qvirvikSxFV09Je5HOnPMFy5Q4bOMkoWbgniOR5t3ibsqSATrbf5yPfW3eXe+GA+AgW/6P/7QaXx+yfu/pIAO2jogXzlrxLWT8ghIwQlnz2ZmWhGzqH+ciNezmDixAjom0o6HIPc9ZXL3Q524cuV1SpoVdCNY06dUUeWyf3xAq/n1ZkBKRaUoR6rBJHz09h7xFql1AONVVh/QoKkzKk+lWJg8spPEw6h8owDpS24KRZKVD15MrqtX178STbsZBwiOw/lz4gwpBNOZPjFVKtXZ3nNMkiF4aurj2JMEJULTwPSyRKzWiTL5rK0+1MzZ6716VMqImTfToYn1RjNcrKCWtZhsQi3R/4fv/QvBp8AJbbq8FaHyAWlWGrLsCZF/tODpja+CnOUBf1m+TSc9rwk1LhmWcuVDpHk8S98g/7R1LEikDX37lnQqJIrmuK6wfBPmE1jrL1QDwKBtG+6Idbp/tdQTrQRgaJOWvafWXkVDFVT5MA8aROCYrNrLfRYhzVmS/vKRFUOjhtUFZg2zDOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(11063799006)(5023799004)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eUs/vx+s0F5osW9oLTXfxbBrfMgpWAj/6UZ9swQ/dY5vMsE7R87VJ1Df+MOE?=
 =?us-ascii?Q?D0e6Ow8vppovRFwmdX2N1vnUyLBuj/kvRJl/xZU1WZwY15BkPQimVuAKhLaE?=
 =?us-ascii?Q?ckl/iB0oBgCR5MhcWecGrwxVnLFX+Vs9Yla+EruA2IXV8NfhxUnx1pHMTFCt?=
 =?us-ascii?Q?U1MPgw45TCf1+GJLUnJu+LM755nC7xLzSGlYs91LJzb5zRIqbi7WXCQM8Cba?=
 =?us-ascii?Q?07C9SEhyjTSHVeAZdZZ6FFkGvnB6HgU3bYedOzG2JFnDkZSkcQameRd0StAS?=
 =?us-ascii?Q?dusdKFPPXg7vCWIol+FCyF2Ufp2n/JofhFu6icf26O/KmHdvo1aAdCUoHlCB?=
 =?us-ascii?Q?YMtwLNOwimaweYTxNAIdx0Gp2tt9m/m34friCW2ijXNapuhRgihmJP0t7TaC?=
 =?us-ascii?Q?N5T7Nc31hD3oiWKo4L6laWgs/MZuKutSCzGNZx4fuekADQTwxJgdHAf3yiFz?=
 =?us-ascii?Q?xbALqOmiSZsIuJvebpFNJDU9BfF0j8RY7S/8GFkteWogpmpxjqhfc9hBoQBq?=
 =?us-ascii?Q?AaIbWXrak+hSIxF2pcY9UzBvRZSQ2daPWN3YUk8MomqRkEW+FELvODGgIM/0?=
 =?us-ascii?Q?pViJBk1GDC5nr3RSrobtfXi3qnSGZdFZ5xwlmeto+1l1QXLowVoYSuZ2983v?=
 =?us-ascii?Q?Qd/l7vj1iQHkhNPR4v3uh50FoFffPflgGbqxolFfjgoOkCZTq4/rsVDNxkc+?=
 =?us-ascii?Q?JNE9GtXqjdiQM0KhD/GmlTe1Qpic1hTdzubuI5hOUNrZ/TVmuqHf1X6IixpJ?=
 =?us-ascii?Q?S0WU2VRsUmrLwe/2iH0NCnUZYt4Vc7sJ3jQ5lP5LDGAJ4iaYKkb02dfwshcV?=
 =?us-ascii?Q?Ic4wXXG/YjSy3GQAg8w4+omtDD60R0qgRtHaPajMp0pA59SEpgKNPretewWk?=
 =?us-ascii?Q?OC6l0wHOR4j1vvRjn46F641qBAN+1REQV4WW9VEmQRV3XzkL1XEwjvvK84X3?=
 =?us-ascii?Q?XTPA1jT4HgjJqKHcWlP0gq/9aGht9Bf8/AbrFkj5TcRlIQE4/gvR1g4oF0k0?=
 =?us-ascii?Q?+L3FYEcXq9apFHEZ2ADbUMQ+2tTv/yGSOWPkRGM9NsMZ6eJUMlCb23jWsM49?=
 =?us-ascii?Q?teSOtwvkH78b22FIrDKltULFyEl5fcG374I7BEM45jeTlq9V68WXob9wLmC4?=
 =?us-ascii?Q?ygDEFKhV4E72ANSLV4Pb6Wj7a9ni8j7bhqkXF1yonmIg8Q40mnjlBl0SUUYl?=
 =?us-ascii?Q?L+w19+cVGaL9E2VJQ6KoNlOVxwbTo4Wv5zvEOZXNnZJNRX2hQEXr9yQu6/VD?=
 =?us-ascii?Q?rHUPJXP5LZ7TdRUd+BOwhis8qgsk26+7gEpJCpqwG0UGJC/uBJp4RSrtrECz?=
 =?us-ascii?Q?iFd2LfAubOfjPVhtaz+aE7qZKaS4tG+wWe/CQ98F5vrKgO/WRXb9DkOj14e2?=
 =?us-ascii?Q?kC0tOen/w9MqPKV9gaFk8w7eZWFex2077tcivifc9Y6WnG98S5eOvY/0F+LI?=
 =?us-ascii?Q?n/WR/bqWqQybwVhryqmmxMSc+sW90Rqge0TPu9mzryVUPw1B749H0ea/ys3G?=
 =?us-ascii?Q?OUaOwg65Ir8SwOeTWCsSKDRxn3pC9nWQASUviSPbbnPcm9lmONsR7pr73/Iv?=
 =?us-ascii?Q?ePISk+HHu7KntmCwTsP/4STF9PUyF0kadmwuSyAbBuE1FiIUSQIJ2pnGVhs/?=
 =?us-ascii?Q?NtHHze7Vd6t65ZzoetW2mrJmrvv9vLx95jssEQVX1saVM7PaOqNBI28w8ghX?=
 =?us-ascii?Q?cQGb/n3qjsqDQ2BbLxn0cQFWZ2SGJPZXwKKL/+3Df4+CAz5QzmnkngxfLvzQ?=
 =?us-ascii?Q?FZ37f3IwuQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6871d78-103e-4747-504f-08df0e3b6204
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:27:12.1736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lErs7GIaXuh6xgAM0tsUu9mCm/QytYuHNsmK7T77uZQNeGW65QGHUSUd3FrnBwkNB7SkHPhHc22X0Q35HOohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829

NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
capacity but two different resource modes. One-Thread Active mode gives
one PE the full core, while waking the other PE restores Two-Thread
Active mode and partitions decode, issue, cache, TLB, and vector
resources. Returning to full-resource mode requires the sibling to
remain in WFI for 10 Ki cycles.

Measurements show that pinned workloads perform equally on either PE,
but freely migratable workloads lose substantial throughput when they
alternate between PE identities. Consistently selecting PE0 keeps PE1
idle, avoids repeated SMT repartitioning, and restores
one-thread-per-core performance.

Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This
is independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal
capacity, while physical cores with different maximum frequencies are
handled by a higher scheduling domain.

Firmware currently provides no interface for describing the preferred
SMT sibling. Detect Olympus by MIDR until such an interface is
available.

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/smp.c           |  1 +
 arch/arm64/kernel/topology.c      | 51 +++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad70850..edc1c59b3448d 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -18,6 +18,7 @@ int pcibus_to_node(struct pci_bus *bus);
 #include <linux/arch_topology.h>
 
 void update_freq_counters_refs(void);
+void arm64_init_sched_topology(void);
 
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick topology_scale_freq_tick
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a117..0135ac4eea8bd 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -443,6 +443,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	hyp_mode_check();
 	setup_system_features();
 	setup_user_features();
+	arm64_init_sched_topology();
 	mark_linear_text_alias_ro();
 }
 
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f1..e5a7a4b2e3844 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -19,6 +19,8 @@
 #include <linux/init.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/sched/topology.h>
+#include <linux/smp.h>
 #include <linux/xarray.h>
 
 #include <asm/cpu.h>
@@ -44,6 +46,55 @@
 static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
 static cpumask_var_t amu_fie_cpus;
 
+/*
+ * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
+ * two-thread active mode, with resources partitioned between the PEs.
+ *
+ * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
+ * mode. Firmware does not currently describe this preference, so detect
+ * Olympus by MIDR until a firmware interface is available.
+ */
+#ifdef CONFIG_SCHED_SMT
+static int arm64_smt_flags(void)
+{
+	return cpu_smt_flags() | SD_ASYM_PACKING;
+}
+#endif
+
+static struct sched_domain_topology_level arm64_asym_smt_topology[] = {
+#ifdef CONFIG_SCHED_SMT
+	SDTL_INIT(tl_smt_mask, arm64_smt_flags, SMT),
+#endif
+#ifdef CONFIG_SCHED_CLUSTER
+	SDTL_INIT(tl_cls_mask, cpu_cluster_flags, CLS),
+#endif
+#ifdef CONFIG_SCHED_MC
+	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
+#endif
+	SDTL_INIT(tl_pkg_mask, NULL, PKG),
+	{ NULL, },
+};
+
+void __init arm64_init_sched_topology(void)
+{
+	if (!IS_ENABLED(CONFIG_SCHED_SMT))
+		return;
+
+	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
+		return;
+
+	if (!topology_core_has_smt(smp_processor_id()))
+		return;
+
+	set_sched_topology(arm64_asym_smt_topology);
+	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
+}
+
+int arch_asym_cpu_priority(int cpu)
+{
+	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
+}
+
 struct amu_cntr_sample {
 	u64		arch_const_cycles_prev;
 	u64		arch_core_cycles_prev;
-- 
2.55.0

