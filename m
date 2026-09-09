Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B10356A12
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935248; cv=fail; b=IazzdnijfImaM9w1drE0KmejR+hQvvaIAJCr73zw8FZJu/dpnxm7DSDgQY9CliqHu1JP3B1DdrrGn01dAINn1pyGfMsjM9j7rZRO1dP90IdpLGo2/qFI+4A4sqJ+MfHO83ducEgn2thqan5+LjKT5fLGfX9rukwggPJMkxPv6Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935248; c=relaxed/simple;
	bh=fkIiwBPwlHgpenpeXwmIkgPfKjRTO8vyGn+kj5ov+iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RD8fU0VTBS9k1lwZI6OMX/89w4oRFjYwGJO3Pk1cqqPEaghibiAonHwJDcsaEGhtZZFgjudHlI+S+gep+J+HG1wtxPpbOHPOF4BzhBZYX72fYN12THjawuJlbeG8MlkkmbOa7oluWphvX4HDlKmxGnl5dibhJCBsZ/AMTdjmZow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P109xUpM; arc=fail smtp.client-ip=52.101.62.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P109xUpM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADVS5jhTEEHBjvZiiVm0buHK/ZOqQgNO/CLzpo7jAiEz1byvs2LL/AjCYxwDTnhAfRgKXpeXzsafOeXjDZKeZB0J2z2QeJ5PFzlVHzHEVRp+9wQzAsFElW/8qKfGevngwI2oHg5VQUc2PrbnzwbEClV8szbFT4KtEV+Uhi2CfnVzdIKIE+I+tJe/h1YJ4Vunn5hg0x+gb0rqouFJqwbOpMs9u9fCDExR0wT7XKjnWsvYVpr64r9vWe5xoaAzi68RKbw8jGB+f46HQLX5WCInZe10EvBM3/NsZuI7zoqEfsHSMsO+xDrIpEW3aeqIIBZTNa2t/N1YmCc2t2KoZMbPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M+hM3+vBkrrGz+pKZWRXDRidaH6HiblK4ACIn9CTYA=;
 b=k0f3uzC6t6dAnFUKTHEb+rTw9CCfZlOVtzxHTPj8v7Sb7Fr6hntNX5WiJ6HiqDXHaSsORUrlBmUK/JwTsOTjWe+VnUEmGGxjl2ts3XmV9Or5Nr9oEZthJDJz3XhMnV0ED0HGFOwqF6QKEFaM3dWR0JzSvTzkIwmorsQpxn6E7ut/sn59OsE+a1E8vQu2CiSZZ6urFzl3Fq65QxopXEoEpDqZ6cOBBR+JHbUV35Ro2QV6PYsMTn8quAg5F//pcgzKS/8R1+YOqDPZMxkSlWjs8ORPdCUcLXoY6LW7wF+MWrrXwwrnSAnYPC0YlProMrZA1IupOrZMZk2xWE5Nj3Ugbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M+hM3+vBkrrGz+pKZWRXDRidaH6HiblK4ACIn9CTYA=;
 b=P109xUpMPXBHvmSkb7obE9ZdnWOgP4m1MmHsxBcKsJ8Q9KDehRK3u1MNJYShXgCbgLJ8cnSldlCjcrPFUn/unUmLttCUMyvSDIUUa5JYABPQ7eKdYqmymWMyBehrRoiqjK/nWN7HBVuinjK0gu7iasjv6AeFVdAoa8h857hsyXf4frqzPCPwBR4oNnvnsrJDSNTCGI0Lzq8rCPVucaEVaHxZ/P4YpYOtiqdUpIlpsGMMrJsMAevIqnLwjvqGSz/Of8RvjCRWnnVnNEXuOMDZWGHHgmSoWAFvQfZkQsMFlOcbTM4kuT6Cq6vOM6MsOTaK11rq9GAD2uayZUhc4U3Rlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 06:27:21 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 06:27:20 +0000
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
Date: Wed,  9 Sep 2026 08:26:09 +0200
Message-ID: <20260909062649.469633-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909062649.469633-1-arighi@nvidia.com>
References: <20260909062649.469633-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::15) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d3ef94-47af-4f4f-9905-08df0e3b6736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	A2u1G27em2wfqsg8LrdgB4DECvkUs5QN9LKKaB3C1vM2aQp6a5lKcxP32M245B/hKTZ7Chzf02SNDVAqzGvnyx+x/4+2g3jPjC7tWsRsOPf0Qe0d7gMAmm9qEgCuKyIk4b/hgC4vGUy5r9jlgAX2n7DTgVSpr8PxuObvXkrRj+9IL62beyZkKnOPENj3+k/WQKe54+sV3Cy/sg5yAnItSMh/BYrg78IX420m1Li68AAcT1m9DkRSQu9Bg5yzJcPyGDGXnBt38wXSUZXlsdLDmwxvI2IyuyyR0ozU3uzU54E+N0jhfUriAS5jKav+Z5uBeqK6VretHMShfGe47AlcuRO9WVuNhum7LAFAWpviOiXse7brAkmwb/rX6+nrzHC2HWE9pocwaNyDY8rxFSOxyfyzGbdlncNmGPQpfijIrcRFRPU8PkMXYysAJdEs94sw1C8lpUjOdFnm416CO70o+OHvUcbjsJAata9sSuYzqcv7UCPX3Ne2ps2SxIsWhqrEn/XiD2cSgKwsGWgBICd4QndxeM3VPDeicZHgMFNmJll0uXQTeCPm+LRDzwii6kS283NdRWsoFQRyQQIoliriq1tvZ5hmOSV3eXt2qQnZ6jWkFMagAO/i32J2tMeMp8yNPDXmAwgbyq7M0iKphImTrbnoXp2WJHYyfPc01KgrdAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bLntILgszHMARs5ZG8jgI1BI8bYMNFi1YWYmCvsaPqZTGpcWUI+qLkQ6+11V?=
 =?us-ascii?Q?ytv6VLKiF47JlYewpXa9gjtcon0vKpD/wC1gBU0kP2A8b1LRvk3UIDYjmtz7?=
 =?us-ascii?Q?Ld4m1j9C0qCvv0h1E75GYQ0YbYkSIVe7HjLpnrv1daO3gM4Aw4NkuiNyiK6A?=
 =?us-ascii?Q?2d3uVjx961o/F/w+ayMgeUQ2BvdXx+kNJzn03Ie2lNNFn5jPYpLwbv74j91T?=
 =?us-ascii?Q?8IY7hSF3Vk4qMtgLwhx3Rxu1Zw9Q0JIYOzvG1L4v1hUJ3TQPvLUpkz+uhnHG?=
 =?us-ascii?Q?tmLXPAU3f/q92zMJGyz67Ix7ySb/z/7kgEHAKqJjRdXRqpzUlqa7/CizceWi?=
 =?us-ascii?Q?JCmJJvnsIjqbIwGmziCbTVcqt13AOa4wyAzubREnns3KfoClFYCmCk3Yl6mn?=
 =?us-ascii?Q?cO8/wJqo/ilpBQmUlY2zTF3wsKLxfOwyZpBIYdA6omyeRScR9kyRlKPsHw7H?=
 =?us-ascii?Q?5jKwJwq735Icre5LuplXe6zZnyGgT2S3ZzphSgXnS9Cy6tR2adwZLut6nV8e?=
 =?us-ascii?Q?Tm8a/lo5aGbVocHwfnl0mpvtdKlMjsOT0dexdYyaG6v+WjAiyB7ujlQCe6IR?=
 =?us-ascii?Q?xp8BsLE1RLdda4x5sDg8r2TRSu6JHTbCFsXmf5Sx4l0Y1x3kiIJQt42Of2cl?=
 =?us-ascii?Q?nAloOCl8HfgDJKjKBgE4qS+esHDQgwKkcaUmYIEWslG/jM4PNqABWWmxEFeN?=
 =?us-ascii?Q?zFW5LCxLWbX15oRgksgT33WDRZ8ptyC3ClAjHUpnnUG+Cb7AfHe8jxfCvqwJ?=
 =?us-ascii?Q?JX+8VhKpqTCgeWczV2Vkk0IZv8Pd8YXUJm95A6QH+7DxM0xxU3ESZQTsPNLB?=
 =?us-ascii?Q?hFSnNmLeMBIUYBsQfx1XRLOe8qgsxgGwsQ83BYJXEtB2ngRYbGi7od4iO5Ey?=
 =?us-ascii?Q?4PWEshrAwCDyKBMdu3yKhygGoTUFsAXUOrDfO304bKP154Rf16jk9tXR4tk7?=
 =?us-ascii?Q?hnCj+8Blvk1eSABME0hquDD5S3i/IsRAXKX9PUmufqvMq7xO0IFtt+alqX6E?=
 =?us-ascii?Q?Bxe/zyNcbcinPNIBWAvOIRiyv1j31h7RsWVd2nYocAImGtoq5ibVeVKUAXTm?=
 =?us-ascii?Q?6QszaUChgHqrxQwsiRfq2UjUhPry3S+16I986s3wVggE+bdRGw7J3lc5Lyk1?=
 =?us-ascii?Q?chfgTnol2aHFYDuIFQ4u1ezVQFCkuC5FzFWsiqiwwW+2Zi1YXPEP8HZaBmJX?=
 =?us-ascii?Q?CN7DHj6LvEjufG4r8SWKe9AsF/kFpK5v/hwEjS4wR3+ADqTz9ZOsWrlTRn6z?=
 =?us-ascii?Q?ayKCgQ/txzO52HzOMHbAeJQKpOX7JrON3FWEBfr03v5CU+K5a/gaiNKo6Ici?=
 =?us-ascii?Q?JTf6BunYeV5FReE3GkFFGZtgOz6+z41hXI1e5k8OVOMQ7jY32DrGz1fCUbMV?=
 =?us-ascii?Q?USoTwCo7FJG/aFRuEZ0qGfKfnHu4vrS0x6Az8BhjSdd+SiT6p7qIUV6NWAZI?=
 =?us-ascii?Q?FKbzeTvGD9tEdrcJtu98/cOPkYvRV4gaIA7mLjpz4PAf3qlFSoA1qmJ2zPMF?=
 =?us-ascii?Q?mu7EGXekBBbjJgy82e4U7SAvIXfbWaMq4Oaf3F2tTg4MhU98OWhxklp8MNHr?=
 =?us-ascii?Q?dbfiCCc92K2zLqMirYLcK9pt1m17T3/xfQXYQ8Ukf1psZIZjLW/txGTfvZis?=
 =?us-ascii?Q?HbaforBpEIzyQ2GZtd606K4NMZwWBvdd38WL5JDYi77wbSLjTB80YIniwnIq?=
 =?us-ascii?Q?2aHENjwQ9HzDgq+phqYzwR2IEvSTrl9lCX41xo+fTriTGiMQrU/Y6AVgNoyC?=
 =?us-ascii?Q?hfIIk1g/LQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d3ef94-47af-4f4f-9905-08df0e3b6736
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:27:20.9534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynGSmJwqEFGclsubcsVCyt1OV3lHbVI3bE7wVJshPEilXn1vMHj44oV4GRNihQ0+28LQoctydAMWzkiAVHFI+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829

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

