Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132EB501F45
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798932; cv=fail; b=kEUTqx3UKAoP4wd3Y5Z5EIzaXe+suLV3yBGjJyiyeUx7yl5ZQnSQ4TsNBVnPM087DspTzmICh1n+8KVkTe2H5q7LD+gQBVYNM7NWl4g+m+cNeBxlam6Z7F9ECwSVhYrSUZDAyBKup5Rdr7plC2xifXUSLeessW6valYDi60aj6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798932; c=relaxed/simple;
	bh=caXdHaS76aQOpmB5tGs4onDEgjB2l5DjkDvAO8Om1Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iWDJ40QGFEkJPHkg78WcnmHm5bu+0gonICzDtvQO40DbPpWPusf5LinbhkM1zKVAgmg/aWmPchze+odwXLoqHWNp+F7egLtPuHd8++RPGHjb16eCU7CuzwG2BG6Cakeh5AVMaxKM77r+hrFRVZj6RdgmE4DOWrVs1APlSmTjiZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VQex/yT2; arc=fail smtp.client-ip=52.101.52.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VQex/yT2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erlz1sG8UgqYMqSnR4ZJ7eTbmHxYVgDfiwhw/oSf9sV96DQ/lv7qgRKcoCZMbZ5sgS+q2fBAZOwIcY5PQ/S8/0X+twdyJ8AkIe6QLtvoNeVrPKAk17lWDFXN3TjqhPBx3DFMIZyuWFmLsiUVVJ4tYjCe46G8nK7EMEGA9XNA97bZRb82MxHX/oVAZykNpOJPRk/qRMzR/TAiB9ZBju+8G2l+tD6Wpo4uk61RXfRadZlMxmKWbGkISUJsDge2vp1PLzhes1j4xAagB6VAvEysb0Y3KDCuxFErwcoCs7Y8xP7d5d8ODNVjXATjh+il58luN2qFXQz6yuB+vXw/GygCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdvtWaphSkdCQM0LAJw/u93kH3JJSRGeYZcmeu5ocSQ=;
 b=xON3JXw0LVCulpgmaZAJo1kd0Lq1U4TfgvBFDiGJyCWhDJndIsOsDHLhJNrP5Omc9Gz3bDAHnAz5oBABMcil8K35BMJU8q4B4rUoaSZS+7TOshhbDeZOpo3t2AgltBGtJAN/vcIEoCWHsoCeHgdc3vtFgQ+kEAp/3F6F63dd5iVEszsHRgyE7AXWe4UKuV9VGOAmn+rc7gpWjQ17I1X/bwOXSyuZu4dKypNkpy9WT3zeouVA0taPfUW9TebTxxjYAbnADnQvw4VGyClq7vcEO6GpVY6rSsG9EdzE/IxVRH2Cx1zrX+OxDXCpt/OyNnlfcF7aV7g9+wpPdYMZYt3VXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdvtWaphSkdCQM0LAJw/u93kH3JJSRGeYZcmeu5ocSQ=;
 b=VQex/yT2Dvr27z50t7kl580t72Q2zttSCLJd1TTvMqJe6LUwB+6+9Rz0O/hbwLkguWvvpjGUZO4GmqoCTsyxldzi6lhNx+ihHkLwK1M0X4a/5XVmy+lU3nMcBo1CCjHQHZYi35TEK22y3Xhkb9YT8/wW1AdCPd+SCac7HLX9z1JLWF8JAIJN3bD5O0Y7ptCQEgs9aCp/orHVTtC1NtYVYXr5Nhi3C1A8LlOGlRG6nJZJo68Pyll5xBgYnNLCoTiobF2V5+U1hpaFsZFoTPtrsGqGOkGaSpsHjTRG3ym67ga2vMe8jEalzEYUjhZunc1mO8zTXInGAQyo2UP1xAxVBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 16:35:24 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 16:35:24 +0000
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
Subject: [PATCH v3 0/2] sched: Enable preferred SMT siblings on NVIDIA Olympus
Date: Mon,  7 Sep 2026 18:30:08 +0200
Message-ID: <20260907163513.4172411-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00007540.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4d6) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 781f979c-4d12-423a-c8b2-08df0cfe0448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|7416014|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ICiaKhzarbnSGzZQ4VzT0crvXFMu5JcXogwmc6mMvHkvnqdPnggUSuxgnAD962BIMlXZGusZAxGeaMpNNOn1g7i7VnJdgB+Qz3cxfwNPBWiQHHRal/oaGqlrroA1F90M/JuLEaN4/qJVort2gYSdBoJRlLvUvKiqch1m4nPkidwryFojosSWwceut8og5okPfBiGIbKMOE6vbJbKmJDm6Ykunib7alwx25naUV6O75wbXQaAkCoZQ52bIKt/+C9pdyuezJruvmWvCBEOntBkp4jJLLERkbl7jY1Z2ibUfQhdg40EV4tDKetrGnzgE1DCAV9p7xtNbhU/BEEZTghbrTwlkAfkxj5YwqqfsChiZdPDuM383JX+JnpqHpfTRVTU1x5xqL4fTIUnds2MvB+cqyZtjJQczj7ymIqP66jy6s56uuBPBxYasK6p37dtkUGI0Gj/ykKrJvFgpEs/n1v8BGoHDdh09WeH3GmkzRELHt3FzvuroXLlamJLkln28gnCT/TbVLkzU6Udhkl6wi7jfp9biOme/SHOHC/Kg5Ymc+NV65BUq9ba5PEoS7RnTKht8iK9VlkAXJlH4nZD7gOxftek3x1578oWyLxpRjetbKxLKnEUVzEjX0CJ2tpLrvOhbzcroB8CwV5PRsI9sZG1SIklN0peYsh08/8+eQWmcjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(7416014)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FNAytnOr7Ffr+xM3bdMw7VtfkLKxERYo/fOTOleqsNcZXuDjUXcgzaMQy+ct?=
 =?us-ascii?Q?CkjWMaATxJDTPFy9gju2IykpX+1+pjpHEqBJLUrVBHKBDEECSNjH8VxYXg5T?=
 =?us-ascii?Q?z1lEIB60XDsTtFtaEo/oyIUPrauX/kQfMosvaQ0ZyrEHMFxfN1iTNilhOmsm?=
 =?us-ascii?Q?Oq9TuzQQcyF+11mZsMfB43Keu5p9d/95mpbOaFqAfQTpUy8/vjD+SgvsC6hi?=
 =?us-ascii?Q?ZkZU/j1sLtwef+rQ4jpeDFkA6lT0omhq9guQTaz71DMbW8FDW1XSg9r7lOhI?=
 =?us-ascii?Q?FFHR1PKuWfu9P2znWY5uFutSY+M2Gs2ymSdqnt0tt/a7NpEcofU4Ug1iLBfV?=
 =?us-ascii?Q?SuMwtQ2NXEZeEhOKvF+qJa72a4YFwuoqfAgscDL8LGsLJ8lT+fXJB0ZK/OSw?=
 =?us-ascii?Q?gBeGsxBfYrE23F3LPOg67WGtUni3wCxo4t+7oivRC7PfLadKFO3VhGQd3tat?=
 =?us-ascii?Q?b3X42KelCuNvnizrC5VmNFgED9gLZ0k5XAAbKNNUL6yF+352QChoQyIO9wTV?=
 =?us-ascii?Q?lo09R2M1BEJT6wOdhGRFSmxY0Y/IrFRWX1g12gQLL646okULO+/Q4IUQU64Y?=
 =?us-ascii?Q?h/bKC8QfzUkxLqle8BNm4V6bpa9afMhnHNaudyEnzdzXNTAIkW3UajhgSW4e?=
 =?us-ascii?Q?TfaO+9mNQNhI6WYH+DKXuhcZI3WwTuGxEsgpoc5tcCESRuKndLdQhy4GiqM5?=
 =?us-ascii?Q?bdZ4QbH4gQYc+ITnnsP75l9uDEwx8geH48RyPshoPrw5lsdW0+NC0AYyZ1sE?=
 =?us-ascii?Q?weRoyBufyaTNIdgt5QXZPCA9Kp0s2URIXkZWcGJP6Z6VTrMnk70P4vCYctnU?=
 =?us-ascii?Q?Nj6qgpm4dCvI0420ufRodLvRcMxpj9YMde/78byKbqQDy9HxeA8043eYgvol?=
 =?us-ascii?Q?Fb5YcFeRfTscUDP6wgiCMeKqs3xbarVrB03BBqr6Jf+VuUdo1sOqgQMDq/L2?=
 =?us-ascii?Q?ybgtl4BIjKMj2vNqTslFRqrEZaq+l5paDrTLaFGNIZBDKOPEK8PjlVk8PhBf?=
 =?us-ascii?Q?UGJUzm7Uhzpl0pxbyq/REOGWJaUOqeyR/0DwBM1JdG9OqhVQ7zwaTpB1xk/G?=
 =?us-ascii?Q?LMIkkdQINfOmEjQb31WAYIcCR92LouASv4MUsS37B7Z4f2Q8A+SKhKYLiyX4?=
 =?us-ascii?Q?iNAM6ETTbXac+XFuiFTNIJxvD4m/zZ9M/i32i7joA+952oQbkqMNz0kl4VW4?=
 =?us-ascii?Q?5gWkhL9WNgVgHc9rINsQ3m3ixkrH0P69n7wtuCyQmEqXVPI+1N8RczN0EL0q?=
 =?us-ascii?Q?wDbs6PWbkV5t28z/YTCdcri9UeKqpNRMAbdl2N+teJhSuhrl3MikQbG6S8iD?=
 =?us-ascii?Q?pDnGiKcyUqfWJSOa3CdsDVJePPbtZaHbMlNtZpAi2UnF8yhOdnTmhiXrWPbc?=
 =?us-ascii?Q?AX9b40rxvUkX6tldn1JTr/IyBzVWedbaT7InYyCryMHzdg2GMmXgT6J6O3xy?=
 =?us-ascii?Q?ctCLVa8N2ptpohwPcx9gxwkhKWEP9sSSLpPB2vfcSHFuabULnWJ7MD8VfXxk?=
 =?us-ascii?Q?N7G+ZQNOmhXL87xB6FREjIQYdsLYqFaeilNK/v2OHvHh5KTKVvpB1gtIKNH7?=
 =?us-ascii?Q?Yey3pmM6TneAx6MMaEjl8F+DwgHibMmkdetvRY3lHckFzLdQf9sO0vCv9GyT?=
 =?us-ascii?Q?nGXgzl6T/QFGHAdVvHrUCKqBy/RqtQJpY3temSSpwCOMvBLaSDho94f2rjet?=
 =?us-ascii?Q?zgTmqf4liOaXeFLKQjZHOCfeQxlKilYcNZ6rPV9zshiAzaFanZEH4bh4WFee?=
 =?us-ascii?Q?sm90YlFNAw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781f979c-4d12-423a-c8b2-08df0cfe0448
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 16:35:24.4680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7a2z9gilxLg3wxKEATuuK4T7DJW22u4aGfiMTtratH5QSVMCPhTq/sU4fIDdn3eFzY45kA3pqRGf3FtrjKQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912

NVIDIA Olympus implements SMT with two symmetric processing elements (PEs).
When only one PE is active, the core operates in single-thread mode and
that PE can use the full core resources. When both PEs are active, the core
operates in two-thread mode and the PEs share those resources. This
behavior is common to SMT implementations, but Olympus is particularly
sensitive to brief sibling activations because returning from two-thread
mode to single-thread mode after a sibling becomes idle is not immediate.
As described by commit 293f9611ae735 ("sched/fair: Prefer fully idle cores
for NOHZ balancing"):

  Briefly activating an otherwise idle sibling can reduce the performance
  available to the other sibling and this effect does not necessarily end
  once the activated sibling becomes idle: after the ILB finishes and its
  CPU enters WFI, full single-thread performance is restored only after the
  sibling has remained idle for a qualification interval (10 Ki cycles on
  the tested Vera system).

That change prevents the NOHZ idle load balancer from unnecessarily waking
a sibling of a busy PE. However, ordinary task placement can still select
either sibling of an idle core and repeated changes of the active PE can
keep Olympus cores in two-thread mode despite little or no useful overlap
between the siblings.

This series makes PE0 the preferred sibling of an Olympus core using
SD_ASYM_PACKING and teaches the fair scheduler's idle-selection paths to
honor asymmetric SMT priority. The scheduler first selects an idle core
according to its existing placement and capacity rules, then chooses the
highest-priority available sibling within that core. The generic scheduler
behavior is enabled only when an architecture supplies an SD_ASYM_PACKING
SMT domain.

PE0 and PE1 have equal steady-state capacity, the preference does not
identify a faster PE. PE0 is used only as a canonical choice when both
siblings are available. Consistently selecting the same sibling avoids
alternating the active PE across wakeups, lets PE1 remain idle for longer,
and allows more cores to remain in, or return to, full-resource
single-thread mode.

The series was tested on a two-node Vera system using an 88-thread
single-precision GEMM on the 88 physical cores of NUMA node 0.

With the workload allowed to choose either sibling of every core, observed
throughput improved from approximately 9.4 TFLOP/s on the baseline kernel
to approximately 10.1 TFLOP/s with this series applied. Repeated runs also
became more predictable because the workload consistently settled on PE0
while PE1 remained quiet.

Changes in v3:
 - Consolidate the SMT-priority adjustment in select_idle_sibling() after an
   idle candidate has been selected (K Prateek Nayak)
 - Fold the asym SMT checks into select_idle_smt_priority() and scan the
   scheduling-domain span directly (K Prateek Nayak)
 - Link to v2: https://lore.kernel.org/r/20260904091838.3617894-1-arighi@nvidia.com

Changes in v2:
 - Clarify that the generic scheduler change also covers POWER7 (Dietmar
   Eggemann)
 - Simplify sched_smt_asym_prefer() by inspecting the lowest scheduling
   domain directly (Dietmar Eggemann)
 - Link to v1: https://lore.kernel.org/r/20260831181800.1668646-1-arighi@nvidia.com

Andrea Righi (2):
      arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
      sched/fair: Honor asymmetric SMT priority in idle selection

 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/smp.c           |  1 +
 arch/arm64/kernel/topology.c      | 62 ++++++++++++++++++++++++++++++
 kernel/sched/fair.c               | 79 +++++++++++++++++++++++++++++++--------
 kernel/sched/sched.h              |  6 +++
 kernel/sched/topology.c           | 36 ++++++++++++++++++
 6 files changed, 170 insertions(+), 15 deletions(-)
