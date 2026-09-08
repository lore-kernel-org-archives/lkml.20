Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE93AAF59
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855851; cv=fail; b=Eh0umfT4L9HKIl/sZHvzqAR5y+H4WQmq0Ko4z0PUAYpCfQ0BR+/bnlqCyFCIV4RS85zyrb0favomXPlH1ojGwURn+GNKP0r5KUmKDIBbZTRbwU1te3LCBSq00IQrM8bdnPpQLzbBAeN5rUWJq82NfKxppmJcyT6QbsWIloe85xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855851; c=relaxed/simple;
	bh=gcTlgReVlUVoLwE6bsl3hGxK0jRdkL0Ewl2o+60uS2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rVN4JaIEq8huFG8DRFEh8gsSLCB4cpwQuZXaVsypulyF0y4RJA8u6FCJJstoY/isYwhqENe7Cdmun/h+rJBoRsYskJcFuYNleS1z6UjG0QywBCI+MMjGw5dw5mQKZdBo7iqQ2EQYBeUnQu0Z2o5LeRohKm3RI/mPfeBh1kPUA3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KdNErSWx; arc=fail smtp.client-ip=52.101.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KdNErSWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAPWy+7UbqouQVIJm4I+E6gXSRYw00t0CuHYXx2+uje1UcBEH3PDxsi2k+14gwZW8uLlsxUiNyaXpbyJJlnZ63N7m3rnWoQb7gRDafbviuSVhBMU5yV9+VICwgWeEXEaxGjK4GTIZW+5CQnvgnEVnnIadBan5p38DxChQw1AAoVHlZRcblFgGjzsKr3zDo8SsclsROw0rE3b1xsnZqQMmnYgtJFiAtv7rW/zqaR+srxv4MmMehW6uqNi1sdELgkN9AAab9Qfn7BheL0YuZvJYy2OQ3uyn1P5hfwRMT3yMFq9jhb4momjuRP/7GlfYTjOR3YWpqI/535Y3Ye5iiAR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcARQxxzlgWdN2EwT2mTaAh+xf0GiJ9EdSKMCW8BnrY=;
 b=pxZJ6xC9Kt6ziM6D4wxpXJA1Fc928tc0o/3P2U7QMRplQmakv2NuSudD8lOXdpER5jBQQJiv7SrFTbofccGCc0FOZLra5RtTzd2UGynyJ12AVV2h0eT/ymW+H7P8YFu8Sz3o9KFF/03gKdsu41hJKh2734kAUG8QSUcex/edv7t1KoIWFqlkcrg97t0slPPqD1CDwnoo4fBAqcCtmdnoCFfDIPWwYAvMMWN4v4amlDXme4bFmTjn7UqwNW3SrrA9mVHOmlKxay8JYRcWvcHq1xYrFnzSO+2mjsiecMnVUZrfLn/ZusMVEhszww9G/j/nz/I/ZFXOA/CUn6q+FHsD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcARQxxzlgWdN2EwT2mTaAh+xf0GiJ9EdSKMCW8BnrY=;
 b=KdNErSWxqD0Gn2jAC0UVhL66OZlY3PifYfo4UguPm+wz101Fbnm3dM8AkHJShkJ5roCl8D38sWY6MMO+v37ZesbrhkljJTS3MlVTi5an7dKAa6yppR2531eMj4ZjlItBm/YNB9h/vI+sjcUG7kNedgqteVY/e3mpUk2YDLL9T0hdfpIuAgTDnkIswkr2KjVLtDL48EssDwYxSsrgiweVcLWZgnSpgicFr6qq/0f6CjdoWtqGqvmvq2hlckVmeGd4z4jfCPc7/5VJbnh3kuUY+kOu0M7M86tYUJl7RCi0LKHFkRPwEBY2Zyzk5p6yhlZUmDQUshnXXOhK3bu5DgasLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by LV0PR12MB999069.namprd12.prod.outlook.com (2603:10b6:408:32a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 08:24:07 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 08:24:07 +0000
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
Date: Tue,  8 Sep 2026 10:23:12 +0200
Message-ID: <20260908082345.103087-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908082345.103087-1-arighi@nvidia.com>
References: <20260908082345.103087-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|LV0PR12MB999069:EE_
X-MS-Office365-Filtering-Correlation-Id: ca408a36-419b-4541-4e82-08df0d828cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zXqR0jGMsH3Jc6ERtkhojWSvYaGWyTjb/ctvmYYRZuwNByUPCNB1Us+E8QPMJvCXCS3U172glIwLlZKIbRjzwAZ40Qo0LyaFdhduTTIRfvIM97HuY52eXDBztSf/lePTyP/fiEvZgtfd0WVj70CcVRMXrtL0FX08r+a7Y0KJzFe/5UelNsQaFAN/c4fXXOFvXrRgvpsqXUVom1dciLV4ceG0hLO93vKMP3yK87LmGKhNhK7DTKxXLRf1Vo+tGyydGSQIxi6RDF4wUdBmS2om55Sub5bscVbJYzK4YHsRA2KetJFwvMMlLHkA2r/rt87ubPfii3omn7V3Fi12ftC3GPFZijdVdm6hbB3N5Er+u7qa+MkR8YNXiJ4AxyRbk/jt2DrXIkWOTTObIZEeXEj93ASOZrYKUl+J2JmSajs9uE1oiAu066VetFp/20MukZue7zVqKa5B/8JCge7EGX7I3bltgQGZ6XZ6A6mU+OhEA3HVuGi9IT3b1mgr04HqGcQaAaKTGH0L3jNf6xVCX0ZEZXc3MCaHMN1Sk3/kYq36MqUerk0l8QfuQGVYKnhN+pS4pzAgA1sQRXFxTsD5rwIaktAmLGPvu9jDhpOqBOKLKao4gvLgYBZxqp6ekXRKEzsdNpL5NnfZG1cZtphl6fzhTVoUfT1VxNlQszXSlZtSSZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dr8BiYG4t5iAbsqVzIeHhkKQhHxqj+1EUa226JL7lp/QWjvFqYo2NQeT51sL?=
 =?us-ascii?Q?dn/Aef4bxfMUwk23mEMKqMLSbI41loQZ0wfTb40/XXAZREyJICuEyz6f6307?=
 =?us-ascii?Q?yc5ydxg4OP4Xb9MUED8IwdGfCjCAY8QrhWCPvGRC0fuik3u9Zz6FwLGYY6Jw?=
 =?us-ascii?Q?iukwOpi4F6v5LJLZZP8QYzW1b92wkGTjVlDdHtACdlcNhE6HHP6nD4ZTjROG?=
 =?us-ascii?Q?aSaOWaB7Xv6CWNi8MGUGjM178No72xwiSmEvIY2g+zRHemj/cJ61UOKtHxWk?=
 =?us-ascii?Q?FIsgveSkR8r9guHTr7rW8pPIV41uL+lPg1pTFADsb6f3YbTZxFhK54aQfSTK?=
 =?us-ascii?Q?XjNxm6UXdhCO8l+ii7JF3hPWH2H+viIHYK63antyp116TtjPU4Lz4FBpXlKy?=
 =?us-ascii?Q?hUYYNjj9F/6mvExwtNptqWvM0LrPpAew9GXu25lIYHO6m9hMgEHrCPk7DriO?=
 =?us-ascii?Q?I4bmupVUIPIYzfRv+LE7vrq/rZsgFFmxtyWe5Qh3vu5zQy1yBvPN184FqRny?=
 =?us-ascii?Q?CWNn3smxRfJxGeHg9iKBqvTN+IRkBnKTf2RKauvrW+q/56WyIkHvMFV4MRDb?=
 =?us-ascii?Q?3f10B1SPGf9eHJiXeTHcJMWjdM70fJr2A9K4CowryBuyPlgDSlplNZT6AnBH?=
 =?us-ascii?Q?PtLBRg1qhv3KjiggHXPd5UWdabPBGntRzmXjM10APYMbxTwGuKzVlovbxx/L?=
 =?us-ascii?Q?LYry/pPHRqGSZWgxiKBTj5eDgzwz7gKGckTdSDpASxghJhqoVW+dhFYs3tmq?=
 =?us-ascii?Q?3CWbs20alyfLhXixnCC+B2wXC/WMrswr+k/+Fqs9DBzkLF12XfgpS9WQ7fR7?=
 =?us-ascii?Q?KXhejIuSXfHtLAx4xQuGo0acL2j7tN8TTgeoPHJ4NRgyTcxQYH5XYkXg6DGc?=
 =?us-ascii?Q?a40t3Acumjfmer7CfcjtzA4jxYlCXdquRvvsKLgui6B8Kgf3VyBpu/3/wsRx?=
 =?us-ascii?Q?yASrne3CkTRkJIlF68anQ9srWzSXMzo2Hx0oMTOawEUJFWDwkhSAuup6SOad?=
 =?us-ascii?Q?JCVcyefkxJhPByETm8b6R4D5c+HW0ckkySziTWDc4IeR8hljs4pvpfl3M+z1?=
 =?us-ascii?Q?WS14j0iwr/HvUnQ5mwl3U5SS+OW34BHXmZZbqGIcYIdUjDE1lmA6nXKWRNZ7?=
 =?us-ascii?Q?/sT5zC7D+bbIvVx++4ZheuKfyfzI6KrfQBdP+I4mRro+GJOHyUj5jEWLgJ//?=
 =?us-ascii?Q?5x43hCeuISJYQNwsy5RnOn3rOGr47AUxjKnOzrQ0G1lwu0BV5XpkvuhEopo2?=
 =?us-ascii?Q?xyLLPqXf3u+TUoMLs+LnCWR3pm3fX51ahhInaOJDhTOENOmMynlH97YBZxEp?=
 =?us-ascii?Q?Rc0tKTwtQWerDdPmZtVpI5ly8zkUGPoyS6Oz1mUHvlKYCzaIfExmFoBsDt1O?=
 =?us-ascii?Q?W3xxSPLxLgk0qbXihcIhlDrqbmm65d8/SsCjeTxCZMDp04uSdpd9Lg5HEqb2?=
 =?us-ascii?Q?Xdxv0k3XIpQdKcYnpluMDepr8xSLjPR0k8yC6EgNyZG+7Fd+ls8iCp2XpHo+?=
 =?us-ascii?Q?5MaJkoE7YOajoLIxTfPWCn3OuNozfsU9bUk+jR6F+LGbQjsWGMpoNtJ4n4/8?=
 =?us-ascii?Q?/3zsCg9YpTaJ2sZDI+AMKZCQqbUvtzHw1ygx84xPG1troE61J6UnqXycYAVH?=
 =?us-ascii?Q?E91pOl4jik1CWKnx989kg2o/O9ClDpEuu51SxMqjkoRMeW562SF3r/+5JXoo?=
 =?us-ascii?Q?xDSG3kSTSFlF9dzttvdu6IzEtuUhb93RMZGq/f550FqbRafPrRq1vpQPFmB1?=
 =?us-ascii?Q?dQHY9dYTgA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca408a36-419b-4541-4e82-08df0d828cdd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:24:07.1530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRoI0ynsrhdMH35uAlbs/fsNOJskh69HrUqj9oirzMubhPl4vPVBqXjhw21K3BRHnUDtDD9m/vOCqK7feEXtJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999069

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

