Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E54417BC3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855843; cv=fail; b=qKItSUR/unMNKvOK3/uPiKJzK868kf22rMsGwYDpOOeOlM8R/ReuhaFLCbwUwxW2KrDzCrp938bJ7+VqJ7fFb+/YcbDpN9JGBwfpWrxU2j2gghSkhc44W9lWSphye8X+D4RTomBOGU0uWk9RSydrMv0gvozUT+U4DAzMyqP8+N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855843; c=relaxed/simple;
	bh=0Z/Tu6UWTLQOmplqCQN/m0Wby9BQkHYXOouaIFi285E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Wl+skecbmxzQ83B0BBq/GNvIhvc5NTduE/QX/6OtRyuPegSJQO+myRIkbQ1GYna1PTAdE+TNisSDIB+SQ2oszaPZ6VveyZsUAbYXUpDiHTY57WjliuvItZFxW66KIuzfLgww5TNxJ5WHWbxbIahQ6PHiwDHOtha5LEqbnJOfsLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SwsPy4ZN; arc=fail smtp.client-ip=40.93.196.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SwsPy4ZN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF2kDMAnnVJmvsKDFAAZlAcKgXDQhzq8Wou5E/3FObaHn3Wgma/yWLYfINtduzwIiLHPCEPHJ+SQv9YhvS3ydzWbjqx/hT69BULo4QiBq8BtISHgb0PLcLBCblPxEumaLWYso9u2RnkgqC0yz5SmOmmv6RCO6p2C4Px5VzBfwcOWBjV8VA2M5BRMG9RjPwVyLve6sji6zlfhQz2n+IVq3aMBqFeOf+N/C6wD408pUqkhax+2p3XRx8DtKHkHjpT6Y/StfGZ9KSFidOwZrHVO71JFL62nzn5VxGrntpraeAjB5Yz+WXIM4xFx7lx6XzzcNwr/cXwQsDnHhFcUOwXyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlZljgQvoon2wFCuBaa9vTlUtnEnda5rGeFFCccE+Ck=;
 b=RBdBNIZJNnWkEXiegCIyV7bFem/XjuI7R7c8u7vA1iP5DMYadB71mkIbPLMeVCb6nDnZD8adPhmO2pYcXapuH1aGgFqJUoBGQ0ISGVpvxpHBynjYImoZgZsZI70IG42XaqzHF5x67k2hHtRuS1NpSZ84lNEKLKmQF4C1S/bMxU5yR4EWplZK7liNd0nfMbNdca4CRkjJQXxP6nC4cikHtQChRn27gGFLDx2K6NFwtJ10aDqtCj1q5um0jkPz8lnLnFnfhacp8QzKenumWQK9DG6WFrnS11FSJM9YcNqDYYytPIz4QVLyVmOhHSJDl++VMqfoPHMMYjbuIYSdirnZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlZljgQvoon2wFCuBaa9vTlUtnEnda5rGeFFCccE+Ck=;
 b=SwsPy4ZN9u3PnVWtjdQkCje+smIiZUn+JJI++njWQMfgG4/Jgukd1CcKsXUmQ5IcIkt/I8glqORPY+QV1E6KbH9mEw6jinONcaW77Ob1oHlT/TM2E/G14DMxkMDYn0vdd47WhsyGGwMhDQNKkfsCMOhkjEO97aNrFzARfVGSlSp6Vi1hgf/4v9ceNLVyBYMTNuo/7QxTetBbi3ycwJe149whggWv9zmOOFFjre5Y01c3su8ogRJ+nk8V8tR2mDdwweZst1ZOJWmZkx8XGuuBkPbAo2EqSYRWqqyafmIUoPiY8YQl2Hzgsgi54zL1nS1g5+fEq2ijXSogq8FYIHY95g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by LV0PR12MB999069.namprd12.prod.outlook.com (2603:10b6:408:32a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 08:23:58 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 08:23:57 +0000
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
Subject: [PATCH v4 0/2] sched: Enable preferred SMT siblings on NVIDIA Olympus
Date: Tue,  8 Sep 2026 10:23:11 +0200
Message-ID: <20260908082345.103087-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0010.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::20) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|LV0PR12MB999069:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b5a1c8-4eb2-427b-d120-08df0d82872b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Weit9gNDAv9+jw2TSVTMunYujNYL4Ucz/Vqs5A6mXnHpO0JkcnrQzjSMSNN3+bX5Mc9GZo5wuo3BkB3Ug8W4BtVzuP1dIP5qQE6wg5mSYsPWVtDm+WaLll3g7I7ZsmVoxQxXq4sGMFVGqs+JTyOxINFTsVlOFg9lm04Es6y5r3vBNalSRzyMATxYqRCXC/uKe823QrgiFRXOWly8hgib4uLTGrY1tL4p4SiiBmKMHi/N3ARc4fipM/iTVXcNbMUDF+RNp5BronjAOG4WLZcvtDpEXw/myK34T7L3g1hhfjwFS7SxLjDjLPUf7+W2MF76Thp6LOkBWp/yRT4gK42yBqNRnIyedIo5fh1u/7ujMDfVzJLTUzUtKmWVT/W3nxFFyM87tUCeWnzSuaMSKhgkOTbIbaHscVsxSP3K80vDKK8uyQtUXzWum5EMW1DYrb7PTyfGN/scfnuQqiillWjO94ftaL/JdKaeQLLNOWj3yF9S0xJFvYQ5owOEU/OVjd2TL2vJWtGz9fKWrRqjSBmDAyWk/dSfuIsRBx7w+rhtl511SXvlvQ8FKLanVsIxgf/dQp6ENLavn6ex29l2dMe+5N5Bhdcicc6iMzRUJoLizhUTsUxF5P7iRt25cgOf5mQIwYQz+IgsuGkh1Zd+RK9tXXX9KjC500nBeyCeEbJzoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qRrTK2/W9670dZdHtnUV7mB1X7lkBX4rpMIFloR+qQoDVsI6oGVwm9uBlDCm?=
 =?us-ascii?Q?8iqQQrj1AbPdHGenTiod8lqImetWxaUbwbg5wKErt3RFmFD5xnNCC9iXZEni?=
 =?us-ascii?Q?SFRSb2YWoqHWqUCnxOsR7Onw82Q1xVU4RqWY3fQ0meVyWKSBeSd+GmnnTYLm?=
 =?us-ascii?Q?JHjTbe++Rot04dfaD0rKZfuBa2MyXN04F/qqnbT8mCwGEGHZ6uhByAYpdAiM?=
 =?us-ascii?Q?puwAeaBfvn0u7s5+9qkQBvhvmZXflZFrztxu6hxhiMNa+lUqAH2bCgF0egmk?=
 =?us-ascii?Q?vnR4V6VHLblUJwhMX/lyKkq1ho4HDbEtlyoiq1jLcvrVvTp69BMNrE4dna0S?=
 =?us-ascii?Q?SV/kNx5LNZnAF2gQ/0ZXCS+7h79LAZpA8+aM4Fc5EGZQkPGzRG9KUiVQhfBg?=
 =?us-ascii?Q?3w78OVVottA3+o49bybWiO6mb06GjH6Yid6NiMCS31fJNPcBnzZ3xGAAXbIe?=
 =?us-ascii?Q?BzxYOA38NLrJ5XZLq8qzrvlt17h4d6PEM7rX7YIxWKbc/oM5Sk7/EJsbbkPF?=
 =?us-ascii?Q?rJdfLyvLlOk8y/yq6MZ8Tys/wZG08kkDY9vp4sl9brnKEiovTUtidx5LFAce?=
 =?us-ascii?Q?SKqRgVTjzkZxaCm/ID5mOe0kvdOsHiwUArs2zCwyBFRI21zyRa7h+8S1rAjk?=
 =?us-ascii?Q?f3qd0PZ9pu9H6+J99tXl9Sa/f0MqnpXGYIWaUUdIPwaTDOGf7yEfcLMi6K6+?=
 =?us-ascii?Q?jaUdJlSQYTNfLuh0JbI3SKaUt42YECMAFXMhZpZNmhgDTbd9oRNSi0l2+aeA?=
 =?us-ascii?Q?pwepaHusACLDg7iodgir3T3vQVE1nIzyEiMboKHjhNEMMJh6KYW8LKIqH5Ne?=
 =?us-ascii?Q?bfiHQJU08RaEXQhuWunFGPBL5MjMVoZFGZmpDWJKX11YY/QC6zASVjjJOSCl?=
 =?us-ascii?Q?eUDiYeMmtIYvNXeED4HYhmqEFNKSEtzd0Bzxais01rHKC00MtPlnCxMw4rId?=
 =?us-ascii?Q?mzIsnYiifQJRDxnV4o2pfr0xDfDN6tsow08COeNOBZ2FmhSTNJipUBtiG0Wd?=
 =?us-ascii?Q?H9mQl6EG8WjaJqXTgUgUII1s+s6nqACPNSnuKJ8t+ln3Mpx3UhJm9/lV6Xai?=
 =?us-ascii?Q?ueATQzAYu0ciRoQdKTPGC4TAk/EJrUji3xMaXg754wC1lXlbZjK74OiV2EXO?=
 =?us-ascii?Q?9bvm91KcUKEfKEygNyfgUE2VBHGoZuSKqRshlTSTfbaVMOUx+h0rTfziAWxs?=
 =?us-ascii?Q?56M2AIDbkVV2uvgrY0bbYup2bkvBAgw8ev0zJczsGYLH0IqWqOnrPgcrSfvv?=
 =?us-ascii?Q?1bU2x6GAGjzWE+KhENhqCEAtKcuZCJxBT/Rqome2BZRbSAvfW0t373ozhLuP?=
 =?us-ascii?Q?E9fBEWkvLHwdTDEULILDx+cpkgNuu/cN4+SQvD9RkX7Q2PGIUHy/evcd93GJ?=
 =?us-ascii?Q?e7TRhoQAliVvwNCdbUoNCtV5rwH4Ca1660i1GBkJFxUVv8Pae3109NcoaziJ?=
 =?us-ascii?Q?9dDNzw3On13TKzc7IGZyL07fPvIyCwoIF/VR6JXTqVx2hQhNmsX5Z3K81Oic?=
 =?us-ascii?Q?wSTnl2o44Q94kQLQbHJPOqIVe9m0wZo7LZBKMeWct78Kd8eHoFCEWQcrszon?=
 =?us-ascii?Q?9RcrWEesX8FHjCig8QcVd2Yd6J7OSjch427kRE9GglAdyhb9r+JukzDdnLAJ?=
 =?us-ascii?Q?uKW5oXoTDGUkMkpY0da9vAHGok2LV+k6O7OGnIsNADLJ7O9vq2Hoi5JTIDX6?=
 =?us-ascii?Q?n2CdnqWq5+LYWcHGE7dWzgIezHoCWY9/J+5dyh5R6IZ0FgfCUKGv2UVoN4EO?=
 =?us-ascii?Q?4mbeRN3IPw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b5a1c8-4eb2-427b-d120-08df0d82872b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:23:57.6154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBFT0oJwGnW58ePouh2bXA/2eptTc02+1Oo8iJ5OB/ouuXa9xvL7vEp7XBoQi6hHzR1NFzj4EV+7AJ798JB1Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999069

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

Changes in v4:
 - Honor the SMT sibling priority in the slow path (Srikar Dronamraju)
 - Rename the consolidated helper to select_idle_smt_cpu() (Srikar Dronamraju)
 - Link to v3: https://lore.kernel.org/r/20260907163513.4172411-1-arighi@nvidia.com

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
 arch/arm64/kernel/topology.c      | 62 ++++++++++++++++++++++++++++
 kernel/sched/fair.c               | 85 +++++++++++++++++++++++++++++++--------
 kernel/sched/sched.h              |  6 +++
 kernel/sched/topology.c           | 36 +++++++++++++++++
 6 files changed, 174 insertions(+), 17 deletions(-)
