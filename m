Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013042.outbound.protection.outlook.com [40.107.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A887472098
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200300; cv=fail; b=PuYYiWhZTPmeXfcs68qMpvmUjjmj2zVgkALencMlzagdT5D8jHGPkAG6XkI59XDyH9QQzGyYy7rVNX8CBbFR0HL8lJQTa6i61xOXh9JOqh1Kgvwkbu/RMG0B8PcIbA8USLUbZL/r8hqdqz7lhzCd11IxrPG6cyPpv8oTYGi5alo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200300; c=relaxed/simple;
	bh=hNwqjJYUwATyxoZdqlEvRhsaV1WH18tgdroEZ9kKcc4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sPtAuQqNDuyd/4DokMAbavnSD+1ZSYp6L8KCCO4LfOXjvanKTG/6uABilC9inOTo6XlHjDnhHv0+cWOicS1Q1K4doznyKUoQ/3/cOHZnxMQxJC8UgBzMvkXZoYtrS2Vvi3HIuaejnlrLgh5AK9XaNYJoffXTBusx0sxsUysP9sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ARK08CZu; arc=fail smtp.client-ip=40.107.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ARK08CZu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjl91rysrTILEvMLgXc8qy7c8c4qe0W/HMTBmZozQ45vvr1GCoNQ6XJYlJz1nA6Gz5FGssHlVODzJLfXzKSNF9U5d4X3r5LLRGzb7RG0GyR7PBA1pQmC111r+U5M13Yjcc+7Ol425VrmscytkbHH5O68znbGRGwMqUMv8Gr9xkzdF6rMgiVTMe4E4Lc97A2dHBjDrp1WsYaQV//iO6gQ2SnWuOT88tJK7sGWw8mSmD18OQkgkmGamAUMVQAZz6UrgMo8iUlC7rxfsWN5fOsVEwlek4QPNJ1dBrBr0nJkhbNCPI4gsXGfplKfeKcmaL4fbpPlYABnRkFb4+5o+aFbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90hKnJqi8flNNql9zSvlZrF5lGGlotSa6h45XR068QY=;
 b=MgoLKJX9lqddH2v65VdO2Jw4rEnDro5cdpSw0szgKnXLli2MjunZ2b0c91sU3dRTd+GSVttKesNmhDgn4Eeg42XHBsGyBukWlWDH+73tCt2/Rq7NZ0AqrPeLCpOQFTh7o62dihXeKxPW81Mbe27JUK5eE6Ycdn2ArZO56mJ8KjaWEvBLPiA3NQqtxw96NG60Nh5rrwDeO9KsAOJzOnIAFpUEkQZib/4xjyfPjy5Y33JB4rQo46iiw7HFzqAqAqoGzerlxWOp4r9JZa0Inm028nzn0+k5ci3AVTCUjwT8d5q8NVoAzhYZeGLOq4ViIjUDSxn7kIynCFsxqoVpmXDJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90hKnJqi8flNNql9zSvlZrF5lGGlotSa6h45XR068QY=;
 b=ARK08CZuoUk/tTFaGnz7mT9wJWyxrtUtcVBi80GxewBd0/G+UmJnysT/N/E/PHAYVW+I1eJPOjvpFoD99cFf9Sn16KpgyUnp7BSXJBQ4Lv0OHDrrMG8WmV4heH8mUd06mTqGaEnIKgDmr+O5cqXhrqzmIY0IOWeyovmE/R03X6X/UAxVEduJNStBA8BQTyG3pYzu9DJVqgNriyK+n8WBrlSvuE60PVUaGzB+eMOpl8NGhaFg2KwsG1qGYTMjwhwTa9uyRmV2PgQYij3n/auAgJYcOvTJJexCYi2I/gprPjtvOVDv4NIKBCNCDx+ferJhUTcIfEha3KyDGgAvg/HcmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:18:12 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:18:11 +0000
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
Subject: [PATCH 0/2] sched: Enable preferred SMT siblings on NVIDIA Olympus
Date: Mon, 31 Aug 2026 20:10:49 +0200
Message-ID: <20260831181800.1668646-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::17) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: f252a151-c790-41e9-a762-08df078c375d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S/gFgJfFfD8WHQml5D3/VY9+si8BEx4NKQjmx88DmCVmEC1T4aacnCE7mGrcjbgd9ZmXCm0cP4w8YV1oB0mkCzIUHVCsS1Oex+gEN3GTu6ZjuIXLLyO7gbieS1PC5bytTq8IfLM1ZxHNC2FDIiBp2WKxK/X5E74jM5/iY3ybwe3jdLjkuP0pgtWQzrC3vlPokcuO/HFUBksTMJcwITQH4zVdmYjTMciiisLZVQutkVd6qDn5CgLdWktu5waI+mkerD6Q46uEY4xweiSojrt/Y5vvph/gq3S55Co0rjKnsgqB1ubRHDC8LkNf//q0eQZEfgy1PutLbCCfKDBzSAXadZpy1YE2MwN7i2068KyDNemuGLLMpw8BP/ygOhg2Z8Z8/yCNoXmMBEWOul6F/CDuPqI+/J/57Yvn+oPJvojLyhqo4eLVoP1PctIZ46ZTX97Wticm4j/5Svju7qVZmH5ziPLWcRV2sXY/O1yd6HfwAiO0/HyOzzIneG/ph27ZhmzAllVSOvQ4rtWgxVCeaPcc2ldljf+KDojeJnb221uKVjXLFF5I3JY/m0Z8TJw81oJwAtvV8kgJehCXCQJWD3guulUpD3JHPMsxCtHFvE3/w5/Zbkpi/SCA+849p7YKxInO/rwTQVFYLBmmQX9iPdFxlOaSmw/OjVn4jDZsuWCIvVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ycxO2G8y8wIsTHS781KcJvY/ClBSW8IfDHhU6hJ2V2yVKBRET80UnwUjs3l?=
 =?us-ascii?Q?YFQJbsexPSEqehy5klSgYtltU6HGNUx8yYPEweSJBc0RueSfunQwjPUyfYLl?=
 =?us-ascii?Q?g49MQFrHr5ewqkmYc2EXYH21JoWz0r8jnlu5aEEKSvZoNhtXCyhvTjer4oa1?=
 =?us-ascii?Q?PKkDCubsNnm05kjS3cMmn8F7w/3F4xfpu8Qb+CZXvOuPRbCEFWHvmUrwPJ6T?=
 =?us-ascii?Q?KTfvuNrXLSb3/qmMdvxAMBOF0YISVATiGaV1Twws9a++TSeTEL+AM0jDPGyR?=
 =?us-ascii?Q?WZhSGr7HXMfWJ+2kEK4AOvcw6M2471uFgbyzar3KQ2vn5668lx8UmFeYL9j5?=
 =?us-ascii?Q?OFOC1zHX13SaIdovfFC5pSGfxcGm3FqEgMRtDc5smTWfsg1t4GAxG9xYQ6XN?=
 =?us-ascii?Q?7YA1SvtXvtuSYu/O2JTLifXRS6qUJ4zyVljYdAhPLVccvkpJZuZc25myDKId?=
 =?us-ascii?Q?xYIMJEQILw7Q0xB0jpOr/Sp93Rdxrp3sxWmjH14vsl/Aan6a2uknhqzUm7f8?=
 =?us-ascii?Q?ZhEv9itJ5xbA4PcfrwP8UuDfB+T40B/h5WZhJZ2r5rsL+MB9iG4un7QVOFcW?=
 =?us-ascii?Q?os1KxvL+Pm/wFF+kiqjMaYYzomLORSM0SdsO2FzyD2jVK8TYQQBxrdMtnsZd?=
 =?us-ascii?Q?bjhG8wXnWHggQd3KWPms7PdYs5OQ0HjkBEBOfw9tuLF8hLGqMKSp4gvOnB18?=
 =?us-ascii?Q?1+0UrNdERzDB8kbumVwP1UrpLzEZhIKmBnOD1RZ6luHoEtWtBHT52iesR6MZ?=
 =?us-ascii?Q?2fTVeQ1f4xG+3ufZTV1hXVVOW0c8hOl+7iKOSTzD6hdZIdryQey/gWgrFnJm?=
 =?us-ascii?Q?B69Wbf0sQlllmthECeiO4nNIrXIHkcYZH/eNLLzHLU4L+jXHVx8HU6/9d5eW?=
 =?us-ascii?Q?ICvrHtJ5rg/iVYcb6Utd1eJHLwZjf1VDS8XN4Ay5wLcGgRRn6u1O8K3gif3W?=
 =?us-ascii?Q?ig4C/zKAzwDRusaXBWjAtOsrv2mbFfY3LfV9b8Tk7m391jZloxKvfD0b4vIL?=
 =?us-ascii?Q?lRwujgO734Q04Kp4Llw+C+3HmgOewgoy+gJrIJ6ZAgIuceXflXqOmEEzEZrH?=
 =?us-ascii?Q?UTykmgRyhDsDc75Vwg6lAhsSREQi2XCT0ftRlz/T0f1XUYL6dv2BYVekc6Ps?=
 =?us-ascii?Q?Rv9YOvvhKqis1EoL7WQx4FUUSqHAblHwEe+urM2zvRotAh+8hNr3tVmXrdyY?=
 =?us-ascii?Q?ZS2qDQm59i3Mp3xMqQvm01e0bkS/D32nsF8UPZzb+pKBUFPsDRGS8UYLC6hO?=
 =?us-ascii?Q?0X4lIYQu6wgwR1/Q1pYCQI7HO75J3zC3A7F0MvEB55jzcmZQLS2fHbE5buuZ?=
 =?us-ascii?Q?xRX0Ao2xy8YJISPOWy5+2pkknwR2T0guGGqJY0I2irKRxW6ra5HB2j9wAnHX?=
 =?us-ascii?Q?L/My12V7QzSmkAbocjh2Xn/udANYr5EzEbWi1QuiJy81D+GAXSr3owY/PSnh?=
 =?us-ascii?Q?9Uoa02YwLiWJ6sLEpn41mSJJ085f9YhQ/FFGW4KgP1+214mrrUGbOkPDt450?=
 =?us-ascii?Q?deIVPm7I7qXX/d6yn7r3v3o7DDgBEYqCADRXuxNhenme6ZPGhe3r1D9Ya/j8?=
 =?us-ascii?Q?DdzWfQIBqPQZ1s2kX7GbN88tNoM0XWTLiEFJ0pX5EtWWIL92bSN0ggSCmosJ?=
 =?us-ascii?Q?xzx1FRi8wJqTl7cMXrN0kTw4LWQIEcYNnJ5N2VVprwUn462f193lP8K6/O+a?=
 =?us-ascii?Q?gf+iHSH5cnegbQART5CD9F7QawXoxVbbkq1I6Z5XwzaMWVnlCoIRW0cZdXD0?=
 =?us-ascii?Q?F6FK5GVJng=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f252a151-c790-41e9-a762-08df078c375d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:18:11.7698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10rWBNg5eLwrVwBqQNYHwhb5HsIF0QEi8tuKJqmMSoEC8r8fG/2trZZbSpAIyFWrAowtm7usD4gDhEgUgH521A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264

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

Andrea Righi (2):
  arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
  sched/fair: Honor asymmetric SMT priority in idle selection

 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/smp.c           |  1 +
 arch/arm64/kernel/topology.c      | 62 +++++++++++++++++++++++++++++++++++++++
 kernel/sched/fair.c               | 81 +++++++++++++++++++++++++++++++++++++++++++------
 kernel/sched/sched.h              |  6 ++++
 kernel/sched/topology.c           | 36 ++++++++++++++++++++++
 6 files changed, 178 insertions(+), 9 deletions(-)
