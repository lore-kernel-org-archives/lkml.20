Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D49390223
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513549; cv=fail; b=udXOMBWKDXP2GdO8TdC/W+ohQ8GtLtEhTBqfnuLz1izIjfk+l8AMa0r8zYEzruDATIdNajoJOGTdFRQLL7u3jumrPrGYm8Rw+hQiyWfqG+iM+wfY2c40w9w1B9nvVrrBsiol90KeDXr/NjztLfLf0RVRwQzosnsc1gcCC/f2gFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513549; c=relaxed/simple;
	bh=4RNHLW7AxlXg/JtChgIUkiFzCqJxU8sBSmExrNL5lms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AhURGcDALFrpjOsPLoiOi78afGcQzci10OaGF4V4Drru2KIRr+L2CtMMLaCp2Ln/szuVCFxadJ5Fn9k5Fxgq3cJUbc+rpuGzU5w3RU1NKQQ5uteI07LZ7sT+fQZfQxoMZBRlbzjDyLSnuQLcSTZ3Zp/K0Pv6KHZWj9Invdg5eJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nNcyV49D; arc=fail smtp.client-ip=40.107.209.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nNcyV49D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hybvY3rrvG3RcnPeK7xNQ2yyJuzaxMxG49+3/unnU0cSkGJWnbwg+N5VM/frrZkLrpQswrFZ3M85DsHRkXW1vJ++qXjWydHqnT9N/RinL1rBbtQQ4iMkPEpBhzDNjYbX7g7gh21jEUINNByyyb046HUeng3L+/v18Ty8HWp8U65WrlWMWJVwO1ElE8Vd98QBtjCVfEKR6d6+1I7fjpOUjJ1v2M6mE/unVCQooW1DP+Wpg5rbFONRODXfnt2e9O7jqZ1xTCGxUOnWC5KSaRjCdk7GC3FIjD7KhkXonuYQ0xJZUs3BhtI91nTWeVGwBzY/XqS7Omr/nliWYRINdddumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yWaluWTaRodsEDQ/GjAFAAsboEo28v5QKOOY42rfJ0=;
 b=NNPjqWKq2cWCO+rf6FRgC8eYyCyw+x+kKFRN/yus1Fka1vCwGnRsBqYOWtn2uyH6ujoUCWygukIJp909WI5mKHmjOENR3FAlPl5TVsMRUTJE89nTr+WaBx90TmhqbL3sJ3fGmuFKDgbSSQXotdCWprfZC7N+Oh7wXraTyD90Vtnpekuo4W4A8CFw95xDadU3dw/A+H6kMIDjFw4BrCW3CVn9B5O1qZdzCJSXZPrLB36sRqkJeutzld3c5Yv4mhaiHHfjvBU/tlIczfG42mxj8oWufGBlB/JVvk3veNxapNqQbyOvSaF5ImBgHWO6fbza+e3mHKMo86pMDx3c+jpqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yWaluWTaRodsEDQ/GjAFAAsboEo28v5QKOOY42rfJ0=;
 b=nNcyV49DGyCbySlQtn+ZTiDlXI8qyIv6Rpqf055hv+rT29J2PLBKzNNdP8AQvPo45A0fQ6wqH1irpumHfwNVYLvAYwb5RJa1M2aKPGYXh/4GCnFyxF93zyVjaCC696fY1VZkKn3dWpKhzvPq5ut1yludAQgGla4q5QLxm1AH2IeaW7ywY5CkWbhsuQuXfynlHw6K/zFdq+unnwmQaPim/iiIJuqfmN78vCAxTjCv8kJTpiIg200mzVwI15lf5WjYzBbN1TdaG1bAC+uth0bo/mL+hm7Ylw/GqeNAMvVV0YrVF+NARHpxm6dR9691HWYTO+DQUvcnvqr1mhxdGhlBHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:19:02 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:19:02 +0000
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
Date: Fri,  4 Sep 2026 11:18:04 +0200
Message-ID: <20260904091838.3617894-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904091838.3617894-1-arighi@nvidia.com>
References: <20260904091838.3617894-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0175.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::17) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ad8182-dd34-4a3b-c55a-08df0a658f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|10067099003|5023799004|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qxGdl/zjp9/VMjtxsp5IArUKUOiNlUxLHdaY7ASHPFmMH+5yDnNikgLcdqdKePJOY26cnHU5bUpl9hiCJoQJVXpTH9hoPKErOn9e/JjZikvNgcQYEWgr9XlwFgFP1JMwcwmNxUqrFMRaO8ierDP60RcVCd6gBHiwg6rIY7ce4KYpvkD9WsAMbXiZ5+jgFUKUGgaYxtLChffpVLxKpWddL4OL0XOJJXRjH3u++dh1w/uA/REMwpTzGDKfqPkLk6G5BKUrwf6qKLPN2IKDOsTl9S3JdZUIKHrSXU1hSGlDe14bUN3KJygGUWnh55ZdmpH/tEOp8h4Z8WTgSROXVCI65ryIR87pOEBJAVzNQJzAGpyrAw9yqa5zcNr+BWQ/lxiSzsYvT5dqvyDXHsDq1oph7fRfW2OVPfubJzRrAsvjf7SCJqzuUImtQ+59Zf1U1Xyjrj8BqX+1zEPaTAs9DguFmdKqk89zRRM+eBSgKsvdSFd6Rmm5RMHVOqaGZCtBJrzja5REVtKQv2ir3kJXNoy1ABX4eS5EyTnTm2qBEjTIFgFQSlFWz+5ndaYaOo+J4TO9wOOb0JXF7CtkCNGzsrK+LRtpRwuVADMrrC/BMyUBwGFmAvCfBpTwPC9UOT2WkF1z2GQZ9tfR0VZ6H03RKigu1956b6ZHhjoETlaFPbzY9CE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(5023799004)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d69rPuho5NQ0Rype7N5BlpJZujs4Y9E8Zeg/v4MqjRJS+LlZubsxCCbJCbWT?=
 =?us-ascii?Q?F4/kCktvkn3Yb+jtSnmrl9vHcOQLKVD4uylnVa8oEu89qmocV9GijJiunRae?=
 =?us-ascii?Q?vH8oma6NnaAJT/K+iZiZ30YCxKNVu6iMxl76ZRcHpL0UNbnPIrrpvon9J7V/?=
 =?us-ascii?Q?IFv7SZHHEwFYgsHLBCB6JeOG3oSpcE6fIAe1f5oqBaitSuqQZNdROk5ppWbU?=
 =?us-ascii?Q?d47AsbPrtlnJ9IDUp0afuyA51tjJhcUsrs9nogwMnDFXOKhfV/ZYShk58Xnw?=
 =?us-ascii?Q?GfJM6KYsvGCV8xfIAwDwqt2XDfWdWVR8fE47dOhOQa97IB4q1PyCbCpoAke7?=
 =?us-ascii?Q?bkqTysQ6QTjehENsPxnk6X89kMJZ9C+YrLmC2kt7FXaKV/2o6RfWX5a1PPk8?=
 =?us-ascii?Q?PUMdadyvUa4g2pn9XE1YvpQrqTXgr7PWuUJ00VUVh9dTrjI/9shYnx69Bn4D?=
 =?us-ascii?Q?149ckU9jicKo2hzJtBlgEuQWRWwB+dMHXaCbHxFXaHkjhf9xlm7HE22cbiEu?=
 =?us-ascii?Q?RftGAWp2h/g2jvE+o/8PBTdmt0v3s6v9Z5M1TsNq+On6lR3/ixjzlPJfeMaR?=
 =?us-ascii?Q?m4LBftHuAqT/FQj1l/Usyv+fv30BLIi8O4BicVPyuqOS/z3YCkY43v0HRBLk?=
 =?us-ascii?Q?7xonD4Vgb72EFQYMQ69dO55EBnAuPTR+kogXnT+DUAejP8AfwUemHx3qQzh4?=
 =?us-ascii?Q?gwQXbVbWIR7B8tQISvNJeEpyWC0aHPTskIW6Mo9ptz9KgarzM3C1LCjqZlJX?=
 =?us-ascii?Q?k/4GFOMin5/t7PozzaqDNSCaJOk4CNh0HOjxpPvB2230rZmxXWEjxMF4f5qt?=
 =?us-ascii?Q?z2eRATdOJ5MgpmGlYqsntSFsjp41IrUuRpKLc0yYHHQekRHhbjWBbhiBZ+Kv?=
 =?us-ascii?Q?VB8yxBJk4xXmPwaZHtV15MsnTR7HbHj+IiWurXiMu8Kl9OQIdkO2Gjkt8MF9?=
 =?us-ascii?Q?GXkd+ZqWKowazXRJPHqWv9vMRg+SYZ439aI0jS4mecw+4VXK3+dLao227cu6?=
 =?us-ascii?Q?DuivKRbTJWGpv+0B1xZjVhVQyRpk/MvBKGPIfamBPstUD6uiPm5a0m4+Mg/2?=
 =?us-ascii?Q?81xyCR3aFoyXchrBx41n1vLwcEePc+5xKOB36v+i+5PgFWCPqu/NJYmpcwtH?=
 =?us-ascii?Q?Zc6WAzbopoMAyBSLEvy8u5V+P3tME1bMrtmWi6VXMarXIpFUVlfR6689L1wo?=
 =?us-ascii?Q?2PvmvIbxAxaqvpxdu4h6ZAkvSnpBRpERjboAJ2BOILGmyoWR41Tl2kDKd6Ao?=
 =?us-ascii?Q?pGaIMvcmXZEFWbJULWFmBTy5K57pwC5g4iazOEiIK8vKFdN/Mfj6jaZDVVU5?=
 =?us-ascii?Q?TU6Y5FlJnSbA2vFF7mCSu3WQmVzMop7CPk+xcDkWJMyClHi/jp0mr4qPLfFu?=
 =?us-ascii?Q?FcFgUZl/Yp0h5YrjfckJl8JEB6u5bJ1CiY2d8MhcrLzunbNlmdx4qhq+muel?=
 =?us-ascii?Q?72GSShwYL/9gKhTWB46bQgAQPbIFJ1r+gULt+KwXTIE2FNkvQc7NzRkn7ZQV?=
 =?us-ascii?Q?QNPSkrG5E6MroXvqcpsBqD+pEqhNrP377mDGhFBdUPN6M4NuSJm0k7yX3iqA?=
 =?us-ascii?Q?Uk614pfrebscLnSZ3w+sW81mpB/emhgYvg7rABA2HlBAQy/CJAn31hDkiksI?=
 =?us-ascii?Q?EHJbsbg/CG59Xs+gfl+qpKVTbV+hyjnKWygpo+sHQCWWhzfg1my0YnLURDQQ?=
 =?us-ascii?Q?mY9uUMtBPMNtl0CuoWwOhpLu06odW/J97E4zQxzDUSfeDj4293Tmjv1kn25k?=
 =?us-ascii?Q?n3O7Hvg/Mg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ad8182-dd34-4a3b-c55a-08df0a658f4e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:19:02.5271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IH9Ha1R9jG2ZZNL7sVXoWn/5RmDlwKqcNAR/TG+tcd6D96ABdPrOR5l5Y6PgCWr+bRlj5RfGsBsy0I2hw9cWbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490

NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
capacity but two different resource modes. One-Thread Active mode gives
one PE the full core, while waking the other PE restores Two-Thread
Active mode and partitions decode, issue, cache, TLB, and vector
resources. Returning to full-resource mode requires the sibling to
remain in WFI for 10 Ki cycles.

Measurements show that pinned workloads perform equally on either PE,
but freely migratable workloads lose substantial throughput when they
alternate between PE identities. Consistently selecting PE0 keeps PE1
idle, avoids repeated SMT repartitioning, and restores one-thread-per-core
performance.

Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This is
independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal capacity,
while physical cores with different maximum frequencies are handled by
a higher scheduling domain.

Firmware currently provides no interface for describing the preferred
SMT sibling. Detect Olympus by MIDR until such an interface is available.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/smp.c           |  1 +
 arch/arm64/kernel/topology.c      | 62 +++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

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
index d28438f8b83f1..0dd9eec1c4946 100644
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
@@ -44,6 +46,66 @@
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
+static bool olympus_prefer_pe0 __ro_after_init;
+
+#ifdef CONFIG_SCHED_SMT
+static int arm64_smt_flags(void)
+{
+	int flags = cpu_smt_flags();
+
+	if (olympus_prefer_pe0)
+		flags |= SD_ASYM_PACKING;
+
+	return flags;
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
+	olympus_prefer_pe0 = true;
+	set_sched_topology(arm64_asym_smt_topology);
+	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
+}
+
+int arch_asym_cpu_priority(int cpu)
+{
+	if (!olympus_prefer_pe0)
+		return 0;
+
+	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
+}
+
 struct amu_cntr_sample {
 	u64		arch_const_cycles_prev;
 	u64		arch_core_cycles_prev;
-- 
2.55.0

