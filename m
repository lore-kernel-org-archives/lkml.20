Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90534499F32
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859637; cv=fail; b=HonePMEBGhAt6U8oCvmub5wQRO5iE5CEGHM4MCXXrCPasb00XUn4Jb7VfZUQEzA5Qjs3KZ1jKIAauQhRq6+oRc3VPQAMT/CqwOL+n8yQh5SRXkGk3EpWzrUDj2nVaZPybJQS8Zz9Ve36Af1+cAP3NX4F9iz+VRM6qLom82b6vjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859637; c=relaxed/simple;
	bh=FAMBmEKNH0E3r93mDqrGDdpD1wt5J3bOKGCk+3QO3y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nsyp7yH+72qluET6tQfjlEzSxUXy3sjE1euaHyADN1qcBVJS8SP6ekA8rd7Cw3hYXl0OSMkKrVV9mKCi0esrmjPcgCxI5Q+AQezfBaF/ZSavyiwdldf5e4LENOkr9E6XXDV5j+EYAYouJyjTicqTKfHAqjSk5Te4dye9xPCtDqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3ZGJW+09joyCPVlE5uykwBVvue55bXH11DSzgrlErRL46wDCGbyn9FsoszXjuk2mrnRPF1J92DRcYDHmk3YBGVakpHE4NnzCXr4nMSYetRtfc4TSX+ZG1A16GEX6vjVnzApQxQQuqpV+a96NjRMhaB7GcRHY2MwTEmZvGsmWlhBQc8THeDaV40ooBoAePZzaGGsCgTpu3qqGF5j7fnd3puFmPuY6aE0iTs2ccWlVJ6AbK9gGVdGBW8Gffbx8Pp6kRE9J2u03aZWiktz/Z5hDMlvU81OQmzLwGBo+e/H4IPT7PovY50ARK9Ju2kBYMUlFBseN0XmLkvmmD3FCxbWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=8LrLKpfCtcUw4SDnojsAv51pIUjB6Rdt3xL3H1e6+mg=;
 b=w1HDTJGj702I6AQbMYM2Tc34RBymh97fW00agnaO+tHTGwDkx8KpsIH5VeTO+hexxg9KXIVQtIfXtch+COx3sUnPAKvV2IKP7RZ71SEAUuRhysm/PiUPJLPfzvoqZTCfEoqH5UTVFVmoIZ7jZTk16kD08uNOnL46anHg2eZDR9lN4I3GjfgTu0HVC19T/uuZke2/vGEEu97cJm0K4qYwZU1K4IokLx+SKZa332rM0zdlGTsXOoiLbjrgnaBOh5TrWsS28FQtI/2ikZkryM/eiKAY7GqjOFy5xXStqEaQ4fn6i10p0jrULuNgBxPNxI8ylEM9wQnLyZbb8eveczxAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB7744.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:247::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:40:22 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:40:22 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	zhanxusheng1024@gmail.com,
	neelx@suse.com,
	atomlin@atomlin.com,
	chjohnst@mail.com,
	mproche@mail.com,
	sean@ashe.io,
	steve@abita.co,
	rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/6] sched/debug: Protect p->mm access in sched_show_numa()
Date: Thu, 27 Aug 2026 15:40:12 -0400
Message-ID: <20260827194014.977758-5-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827194014.977758-1-atomlin@atomlin.com>
References: <20260827194014.977758-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0291.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::20) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: dd04bb66-1ce5-4e9a-094e-08df0473087f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EzpMcdaYOF1/uD5VdLROMsMBO5EtF6KLKtZLMmp5g0lsBYu2dodvxiedc0hTonx4ftNpvjgRiVgJc/zc3eT2bl0BAKEbaXkCI5cuzNMwcnTRLBlQ+7DigyvzDzAZrFLKVAH5/9BF2TgwlDkftp0uKwRPUKq0zs0DS2icCmTcvR2wyGpCO4DCttuWZE+/EO4iFJEOwPJrUsh6UCi18/K1KHhHv8tt7NIymTF/RW/CiZqW0Rok4ybaM4ttOqae6du8I8dmZPjK3IR6kG6g3fwC79WHjrhq6NRdO/XkoRM2Svdm/ibD8Yhp5da25qi+avStrYvPHk3+Cr/Mh5NRZ1kle2XuKgThEj6AEh9PyfIWjCu17Y2XZB6zhRicMiotLsguBweyhni/p2jFMhJ7TMcckRFFQGr8ftpntDQlKmeoIjmtelXBn4PFCV1hmTzKEJD0/Mec7ch2x3wciLAGxNj4nLdOuXJwrCWMdoDSANSJ+qTwwFQI61YYNlEWHf4M/X8HFyae5DK8QfA7GUaK60eR3YinDhqnNptEPDyUgoi2SZ0ocRi8mawTwvPOoQvAp3aHWmTWuuO7lS1BT4nuo8zmfSzi5HeSRdhtQo85l0gozHWm4cYJoOyEAAUzqSUjcp0C7CSCGbigJznWVKr/fl57v+hB4GZmSFnZ+NfMuhiCwCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ks1gHKVXKOB3OK6nAGFctaJx/f0AWzRTNwm0mUiU05ZeDuyppIvlG6pS+1+1?=
 =?us-ascii?Q?d3PMBfsUEblAb6GG3NmetGTl6d/D9DF3k6j+XeiKkpWZvXrBEenE9ppgPTaB?=
 =?us-ascii?Q?8Zd5SmFD6KRFO1t6V1fK0SXXzNLQqOSuGQOprXfHjksqT1UenukBl393M2DC?=
 =?us-ascii?Q?a2ERR3+8xft5T1JIDLwq2YXk7RN3tARQ/gbRRAeDElO86lv8SuPJqfoa32NX?=
 =?us-ascii?Q?aceoXT7/kp6qeInNut6Ysd/RTLWW3yrBZFqFTsSjkOtrqmBy7YLiAinSWfJK?=
 =?us-ascii?Q?TsYwQCGr8TC1UxUljhkg/tN6kkSmve8s1BpJZ059XvFKzf7DJOQHcFwjLTdg?=
 =?us-ascii?Q?L4tmdPjXZ5ux2bojNVlEB0QkDd3HqYKP8YL9Eo0huwkZa1hxn/Vv+oWW02XN?=
 =?us-ascii?Q?sNnIuqBIoChcZmRS/VL6yGb+bLfoJzx7dlYAFvTJFKubqrvFkWNWclZIs1Vv?=
 =?us-ascii?Q?QlFA9Q8f2dbYR/T5lliy3CCDFRheaVk4W9iinfo4S6TdYXpni0tUruRI3r97?=
 =?us-ascii?Q?JdC1J2Vy6bYickSCxrjY6TZ9cHdrVZ2ESgrSaszAVUoKs4NCHPU0AR3YnVrj?=
 =?us-ascii?Q?htnkUDakhvXzH+Pzg48/Vy8VX8LAO87OYDGsbcW3lykGSiCUVfW93NOPTKIq?=
 =?us-ascii?Q?G/KMDEnT4+B23DeaeyA84Bopxcud1QSfT5kb+t9oV6w3UWeHuCX3RtP1HsGe?=
 =?us-ascii?Q?0KTMRbPLqhX3K3nXj87CZubew4G0L6h0AtkL72fRqjL3OwiFwV9M6WPL+Fud?=
 =?us-ascii?Q?vZviYecO6T7y62CCM8VLoBilyA8dKsYomekpSvrJkrbLuDQySJa3IIXMQ73L?=
 =?us-ascii?Q?LWPZJ6VlCysZ+KnDLJwV2g5cTpI1cfdF/PHrIPmSWQluzEjA5TETnTNwozRc?=
 =?us-ascii?Q?VuyJUMGHMWNOPXX/x3ok/AuTk2mbw8ijiZrFPiOrNcjtN2wvKyToI84ndj6r?=
 =?us-ascii?Q?eSJDtrZYi9eaeGCBwtPm7E+XpQVQ5R8+EcVn9oWbac0KKoj2JxJal2D/WAKR?=
 =?us-ascii?Q?0ysAr1V78lepm5XjbnShTq0Nj5jK9IcbxPyVH42c2a8Zk64xOlXkRQk8/jwf?=
 =?us-ascii?Q?uAztPYnEcy5wx9UrPlAmMCdy/Ti5p/HFkAz0c2FR2Pe1TQS6wDZda8sHffNT?=
 =?us-ascii?Q?7vk1/XQGExNo0IMjw7QqsPXSmq98rL/bonlhgQnygipGn1hT8105FpLwjpMx?=
 =?us-ascii?Q?Kd69ap+yJI2OySkmd3gNxNcWJvo8NQcXzRpQ3sfAPoupG7X/8jMqVCBU6/tU?=
 =?us-ascii?Q?m6uHyi16+FGRYoiRpqIa/0KnNIwfPaKn5jg/R6451ZGUOQzsBbBjgZBxN/C1?=
 =?us-ascii?Q?S+YPADvuY0tfvF5ReJw+/KYodJicstLv7N51Yl0dziAN1ehoZKGlxT8K641V?=
 =?us-ascii?Q?QZhp+kOBF04DQNmAgdW6maswvdck+Pnp8Fi3gq6yeO4ByVAiPTJDtxrjsE1y?=
 =?us-ascii?Q?hioJ43buPqyJm6tqWR5MGpLmvA3jBMeLIGPFLDiZHlGIKCrMXzPLenEGC6MZ?=
 =?us-ascii?Q?oyzu/R7INj2zqWtub5aat+7bAq6PDgfN0gHDccKGaGrdSioFjThVJxhuh7tR?=
 =?us-ascii?Q?FbkPc+sQENJwpEnhLvFyBkIshp0U3bX/0IwsB4aTblyCYl0vdF2Oh29nWWv6?=
 =?us-ascii?Q?Xtj1UxWayivhTjhSVMzir1V4GoXFzEFv5B6l6nIZIX57vRzrc4X1PA4N7ZL6?=
 =?us-ascii?Q?m5vI02gRc+6qER47Mzo4JcMY2aBC2jSu6fivV58zNHb9f0SH?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd04bb66-1ce5-4e9a-094e-08df0473087f
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:40:22.1162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpLlW8G8aqQwDGoJ0iW6XX4WbyTWoNE0878VJgdHWTRD6ZXb7uApAalchBxYAnao+IiMQD5LMaXLQ/a1rqdY1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7744

In sched_show_numa(), p->mm is checked locklessly and then passed to the
P(mm->numa_scan_seq) macro. This presents both a time-of-change to
time-of-use race and a potential use-after-free vulnerability.

If a task exits concurrently via exit_mm(p), another CPU can set p->mm
to NULL and call mmput(mm) to free the struct mm_struct. Dereferencing
mm->numa_scan_seq without holding task_lock(p) can access freed memory if
mmput() runs immediately after the check.

Fix this by wrapping the p->mm check and macro dereference in
task_lock(p) and task_unlock(p). In exit_mm(), current->mm is set to
NULL under task_lock(p) before mmput() is called, guaranteeing that
p->mm cannot be set to NULL or freed while task_lock(p) is held.

Fixes: b32e86b4301e ("sched/numa: Add debugging")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 3d6248c50dad..1b6d2a83d50f 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1395,8 +1395,10 @@ void print_numa_stats(struct seq_file *m, int node, unsigned long tsf,
 static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 {
 #ifdef CONFIG_NUMA_BALANCING
+	task_lock(p);
 	if (p->mm)
 		P(mm->numa_scan_seq);
+	task_unlock(p);
 
 	P(numa_pages_migrated);
 	P(numa_preferred_nid);
-- 
2.55.0

