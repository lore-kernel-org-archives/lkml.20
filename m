Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A827C470444
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200313; cv=fail; b=tdif8WwKyn7fz2IcB7fRrSiC8c14whg4RfLF83x2A4+TZvZ4b+etWNquntCBELgSXLMF4VXs+9XVEPKlH/hRXkoSk9JShaj1kGTg26koVnQejXbJBCRHablKPgJ/REsdjDZ4h4Ph4j+Orn1Cp1QjjAYPhjfNcmvXMmZVex9mqgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200313; c=relaxed/simple;
	bh=JhkhrFw0LY785R6MkDqCFgX1huiyJv9OFb9NbVZgo5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ID195kC3wfvGEa22PYaz9rqZdsfs9f0mv37F4QGWk5UHCuDFj+v8XjPzh9KB8WAWJe366qf42hUr24kxBlVDi18DfdTzqSy15AAPHbfvJ5ePf62pilS8v1SGQakYq5Y2qrUMxUJs69ewRbAgLAkKYdAugR8jD/FKYXpsFA7WYz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SxJfUMng; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SxJfUMng"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJRyAV6nEWHMls0VgzNsDKJMdTSKfzYr0H5ZrE9S6BtzpIavCqIbHcPs4wPYUNcCIq2Xm2DXqQZKP5hGQw8qaAtQW/64b4nnkY0RvN3i0s/6jZu5GMErWPT5ULFH48aTAiPdYxExWTywbD7cE1xE8GRM+Uk2kHuh4InXPvJMc/Dx566VLzK3lG68OefvEtBGw84W+qXhTcVuiwCeJFm1Y0faxUr58GBMGgYCjeP4+DlNwQmGqk/FU6He+VAE71i+rulOnKxerpHvk0V9rvj54RYaDuOUkxQShcDC9cR7qCIbVnXdq95MOOaPe67jS1TfEb4e4kC/uX8C15CwilH4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YwznRa6JNcqM/HAj8XkjL8QB1l3Mp/HPjnGBqTuiNs=;
 b=JUjRUOUnxRZzs7i+speaU/umEt7aiS8/QJ7xiC3q4zNGymrKlFes4bADXqOmAcYLcF9QcOAD6qCsXpi57wZ+fWt682fZcJo392Y2Uj+2VnpAFHLKOFN+WYYFc2CWZQV5g6BwIboNqo8zCi42Tzlo8VCOO0TdLNEo8+HMODiO6VvYLzyslFvi6fcSFA+P6xbYKYeY0ZWcKoQNI1P2qB5eFXSlHfa0N7Y9izjy/fKBt5wbVmjsunCF8pXDkfbQngjeGY8ZLDOaHOc5t2hAalGoFcalOGZS31fX1NsPRUlLwNLFyu0qB3V7eotmiHkfRhLl1vyVnWT/5vU49GkafEoaog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YwznRa6JNcqM/HAj8XkjL8QB1l3Mp/HPjnGBqTuiNs=;
 b=SxJfUMngWsShW2VCH/xMKXoStlcExgWGzEDLlG1uWuz59ILIZ4ddXTUIoqKf2ZrQauKIcyTNU33cfpiTylflH1aXLyXlEF9vzJ8wUufzVWzxyTb9cXf54FmjNjTMi04grv/btxEZ6Si7K4BM/OjyEfE5HH9Y8LMlZKzpFsRalFS1GOqybdiA2y3I35+Pfwhd/UbGs/u/c3A6jIqXrMBdEoiEFWxBY8yPGUiv6s/FIUsG3IFwAKfqrlXvkRPgKdX0M/apEoMnThUFCuaJJz4Y3FjEbIAcJnTT7Zvk4SuuQRMVvSpvQ55+MkkAAgyZV1Q7Ym1ny9X42c2MREs8aKN/zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:18:26 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:18:26 +0000
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
Date: Mon, 31 Aug 2026 20:10:51 +0200
Message-ID: <20260831181800.1668646-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831181800.1668646-1-arighi@nvidia.com>
References: <20260831181800.1668646-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1d9d10-49ca-4601-9a04-08df078c3fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Vd5U9vvFNzBh9/18MU3/f/rAD46Wc0dChHxU2tkjFvnhnaLmcad45YwEF6PoiSoB/9g0P5iXA6gfODBwgy3fsquqLC+gcrYLSjUAqxkLt4RXKgM0OOATsxBp9ku6JYzUVdkA2DvzogFBVtlCKGl1+ur53WcM4IQ3nxgZXSoXHnHU7po1hDMl1PHH7QZzkM8P0dxvqmFcofk6UnfDL/oYzXgH6YszTzH7phMwNGyBf8WzagR9ZPi2Hey6uFQys90VTPiIDKk+isCifYuXeR40d+RiSjZMfMIcP9tiBmo0k/+XCILkWouwQIuvWW9YNZ1aueskRLdsx6BFptKrBU2TiBFlhgh4P50PV6CEvrEozsJTc0rhjzIVD3nWrYwCzlJRBcpxu9nM3mYfFA1lfVH2e6r4EpCT/hBPCBjkfM/n1KFrHqPhrOktXn9xZ4uno7iUAGkGEXKAHyWJPqMTFIh2Sp3XY2CU+IT0BGZh4R+U5lLcqfmenquk6IFWWywEdW+oEngz8TLN0RVsT6m9Sj20cH5F8YSLeaz1LDl1ik6zdBRenu1SMtpI3DFPVbK2yvc15psx9VKzwOzad0u15JlNT45+rx2XvPfj8opqxotXZV+/W6Me9m8JEORgedg4b4g/crePDc3N9gq3bCn3Ih8oa7h+4Wvum1v11T6vjhqtgw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pRbtFLojt2woiib9so88bJGaWc6zmKVdpuUnfrOSvLK4j4c6WVEeZZYgUAjz?=
 =?us-ascii?Q?n1Dy8jCdcxkS6EgChJFetcLgXXUBRCzZWSMPcWIUCgItY81cQu2OyxRl+Rgc?=
 =?us-ascii?Q?B44r8vfFX9+YqbceZuq9/4S9CS8uMgKlfHlSjVMQ7n4cU+aodr+wDzLfYU/9?=
 =?us-ascii?Q?HM18QBYtPHGSl7mb5h+/GSmXxJpyfZ1eXKfCGHzSANs15C0P17r3pX0TVfC0?=
 =?us-ascii?Q?h2A3l+jhuHSB0seR7AvVnADibvYg7tYBbIQyh4u6yaYRgJfCbrg+5ybt0/vd?=
 =?us-ascii?Q?0bobuySPGcxymTzNIWM2BN2Wqvqk24Au+a0biLUqe3a3oA5R8MXdBLpi033/?=
 =?us-ascii?Q?NYmchDJupiQLDXVOWkHErY6zBPZT59J+xWHahqmNjQE34c57Ym3HlDKiulr0?=
 =?us-ascii?Q?fvJjIu9ymm9SZSvy2VLu0D1Pb6naVPY8iPQjgky8G/QrdI2abR353j24LlaA?=
 =?us-ascii?Q?fKR5pomFhCfSp8XbOj62BT1DB+F/qzHQkebCwHyIoMD2coSHKJyvMmrq1AsX?=
 =?us-ascii?Q?jrJSe60VhxMKXPjUV2fY7uTm64O0ZcmnfSAWx6KFQm+7yIoe8U2FXNw6HPbT?=
 =?us-ascii?Q?v1FL0gIoI+t/IcrYuTisGmHIjpA89+ypY3+6grjdcdYMDGl2/Hq5JparWN0s?=
 =?us-ascii?Q?Hq+ea5fgzCG8b0feLlGpIVUVS/tw7taQuHdNwWG7Y2Sdkfj5EVAO59axUyFg?=
 =?us-ascii?Q?bLwInimXRbPQWspLqrJwtEITsby80QyUgv3AwwlU9y03x3GUUDQg53PGlDCR?=
 =?us-ascii?Q?wLshrG8HZFKwmWQAjxhaB2NTwKOH12d8I8jDKCUBkv+SjN6eaWFzEWlOzlql?=
 =?us-ascii?Q?LnzX3XISe0LguMvW95vFILYC2Tds5SCGaq1OC1FTwzHPwex0BbWPYroWXfx0?=
 =?us-ascii?Q?oYIpJRHaXyqnLPS3FgrRg4YL+t4+VJyueRRayIWse4I5+AxswDQTkSYGZGCs?=
 =?us-ascii?Q?QjFM8lEwwv9njlNXtNuL6rotdKP/0yTr8vSm4pl4NAc1qWrlVFvkbSbLkMHz?=
 =?us-ascii?Q?muC/bEyPKS3qQvJ97kK3Cw4Q/0pizRm/GyjBBkSpCWu1HxZMYCyPsFuZ/Wn4?=
 =?us-ascii?Q?tBD3XN7DmwOUG7Azp1PEGcEBB8JHTXFifwSK4NwTwSUTuhxLha7xeWIzdsQl?=
 =?us-ascii?Q?mEd7p498ZS4EYf2vs0sJMLAqq85epnnhV8sUvu+A2ch7yfqWXCDjGtDJFnAD?=
 =?us-ascii?Q?dUBxOA0M/rr2kbmcpSjZWstK0kyXVoQId+hTjPYdk0fHgMCK6FZxbJU+IHZ1?=
 =?us-ascii?Q?Asp/ij+gmWr+ul9kzCEoxnURP28AE9e7bqcZgR6edJMmZmInW5XS+PRIGJeY?=
 =?us-ascii?Q?b2vosEZdd1uIuIiBVdy5PDvuCZdS5h4KiLoc+9Mp6C196LdRPbHFAfnNP6YT?=
 =?us-ascii?Q?B6VDO42p+owTtDTN0apsQa4GLb20FpsW4Ia0tfq1AFdtmsHAXX5BiN4CbJ39?=
 =?us-ascii?Q?OWnaIyR2HqQGW0pOuWhHDAL7gVNlzSmRZ9qQqnCa/7Hkhxggs8MKmb6aIIgW?=
 =?us-ascii?Q?eBtAjw2hKDDaH5G3iUCZxfMKf1uLFtY8Otn8aqRfO9h+VYJqiQokHp8zu7i4?=
 =?us-ascii?Q?usGdDrChXlfG/kF3cAHtrJg3FhXpJ5gboZnHCwGKOTPvrAipQacAjkfyd2C3?=
 =?us-ascii?Q?KtkgVyFeYrxMJyZkPkuxybefdYVZvXv8Goy/1wHpCy9s4tINQS26BZUXHK1k?=
 =?us-ascii?Q?PMIhihUEp4OD7NLFRmlTMa9Q/q+xaHX/aIhVSb8Kf+t2uo6VM0MhY+jE4XEz?=
 =?us-ascii?Q?9ZcY1OLMgw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1d9d10-49ca-4601-9a04-08df078c3fd4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:18:26.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDYUqHmQjlQQU2qiBYBFSqyUkPZQC8z4XAAaPJyRBO6ld9X0RRdLN8O4wPm6bX0rH1O/pePiRTK9Ns8B8clPfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264

SD_ASYM_PACKING orders CPUs that share an SMT core, but idle CPU
selection does not consult that order. A task can therefore wake on an
arbitrary sibling and remain there until load balancing corrects the
placement. On SMT implementations where changing the active sibling
repartitions core resources, that initial choice can cause a large and
persistent performance loss.

When idle selection finds an available CPU in an SMT core, choose the
highest-priority available sibling. On SMT2 this only changes selection
on fully idle cores, because a partially idle core has only one
available CPU. On wider SMT cores it also fills available siblings in
priority order while the core is partially busy.

Apply the preference to idle-core and idle-CPU scans, asymmetric
capacity scans, and the target, previous, and recently-used CPU fast
paths.

Keep physical-core capacity selection independent from SMT sibling
ordering. SD_ASYM_CPUCAPACITY can first select among cores with
different maximum capacities, SD_ASYM_PACKING then selects the preferred
available sibling inside the chosen core, whose siblings continue to
share equal capacity.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/fair.c     | 81 ++++++++++++++++++++++++++++++++++++-----
 kernel/sched/sched.h    |  6 +++
 kernel/sched/topology.c | 36 ++++++++++++++++++
 3 files changed, 114 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf7..3c49aa63742cb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8587,6 +8587,65 @@ static inline bool test_idle_cores(int cpu)
 	return false;
 }
 
+/*
+ * Return true when @cpu has a higher asymmetric-packing priority than @other in their SMT
+ * scheduling domain.
+ */
+static bool sched_smt_asym_prefer(int cpu, int other)
+{
+	struct sched_domain *sd;
+
+	for_each_domain(cpu, sd) {
+		/*
+		 * Only honor priorities declared at shared-capacity SMT levels.
+		 * SD_ASYM_PACKING at higher levels may describe core ordering.
+		 */
+		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
+			break;
+
+		if ((sd->flags & SD_ASYM_PACKING) && cpumask_test_cpu(other, sched_domain_span(sd)))
+			return sched_asym_prefer(cpu, other);
+	}
+
+	return false;
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
@@ -8645,7 +8704,7 @@ static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpu
 	}
 
 	if (idle)
-		return core;
+		return select_idle_smt_cpu(p, core, cpus);
 
 	cpumask_andnot(cpus, cpus, cpu_smt_mask(core));
 	return -1;
@@ -8668,7 +8727,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
 		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
 			continue;
 		if (choose_idle_cpu(cpu, p))
-			return cpu;
+			return select_idle_smt_priority(p, cpu);
 	}
 
 	return -1;
@@ -8720,7 +8779,7 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 						return -1;
 					idle_cpu = __select_idle_cpu(cpu, p);
 					if ((unsigned int)idle_cpu < nr_cpumask_bits)
-						return idle_cpu;
+						return select_idle_smt_priority(p, idle_cpu);
 				}
 			}
 			cpumask_andnot(cpus, cpus, sched_group_span(sg));
@@ -8745,7 +8804,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
 	if (has_idle_core)
 		set_idle_cores(target, false);
 
-	return idle_cpu;
+	return (unsigned int)idle_cpu < nr_cpumask_bits ?
+		select_idle_smt_priority(p, idle_cpu) : idle_cpu;
 }
 
 /*
@@ -8858,7 +8918,7 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 		 * immediately.
 		 */
 		if (fits > 0 && preferred_core)
-			return cpu;
+			return select_idle_smt_cpu(p, cpu, cpus);
 		/*
 		 * Only the min performance hint (i.e. uclamp_min) doesn't fit.
 		 * Look for the CPU with best capacity.
@@ -8915,6 +8975,9 @@ select_idle_capacity(struct task_struct *p, struct sched_domain *sd, int target)
 	if (has_idle_core && best_fits > ASYM_IDLE_COMPLETE_MISFIT)
 		set_idle_cores(target, false);
 
+	if (best_cpu >= 0)
+		best_cpu = select_idle_smt_cpu(p, best_cpu, cpus);
+
 	return best_cpu;
 }
 
@@ -8971,7 +9034,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 	if (choose_idle_cpu(target, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
-		return target;
+		return select_idle_smt_priority(p, target);
 
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
@@ -8982,9 +9045,9 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
 		    cpus_share_resources(prev, target))
-			return prev;
+			return select_idle_smt_priority(p, prev);
 
-		prev_aff = prev;
+		prev_aff = select_idle_smt_priority(p, prev);
 	}
 
 	/*
@@ -9015,7 +9078,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
 		    cpus_share_resources(recent_used_cpu, target))
-			return recent_used_cpu;
+			return select_idle_smt_priority(p, recent_used_cpu);
 
 	} else {
 		recent_used_cpu = -1;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf86..73731e9439b97 100644
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

