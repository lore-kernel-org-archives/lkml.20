Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020079.outbound.protection.outlook.com [52.101.195.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E974C6EF7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787859629; cv=fail; b=M0OjjfcB9JN1FosDLn4dIyPCWAck2dvYxsIX9zCeVGIWDoPRefT9bRTBQJ2fXqMyaXMAvJ4aUdAbQJ5xoJ+Anao6iY23XYT3HUHhUxQIKhIwo+3v4teV9cTpaAwz4cIxjO1jlaBJNLbN0X/24rZt0wKqyL68JEkTTKI1Y+kogjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787859629; c=relaxed/simple;
	bh=EjWRLuMtddpGpEz0wwcKvBoRX/wKRrozMZJvimQ/Fmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i0Fp2aw1Hinq71mC2sVhAgiquVhtVnXTaHEh60ZIJfdjR0DWYXfLAy49KGsXgwBduk69fn52S629jgn18Dlen4Ul/gs5VSiAOaLuT04otU7vV+0ZtaQAUpmGnZasky7yoFcIjehBLKp2b4abOyJoKNGMpKC+wzkxuExOCr/0mxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.195.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMz568lSLctzXBE2CiivvdvsE4WNELG82Tb1xUJYrjSe+eUM/vC9tKG4WQm2u3JbY6ef+52wj4mPQZs3Dl6N7dXdiZGJZ4G44UKaBL/UUCLXuJl0/fR89WOQJhqxRskpezYH4ZtQa2M9bUnuQ0UOEzhjGqADgCydKMDe4WIOkqjFJHHlTVPE3ruPZqXiJfV/4M0NKO+31CF8FdxO94TGiHfInchlOUbThWJ2XajxpSORVX7GVF+zxwZC5UJRJVXVc1t+d+1736/xT68Hd66oIkkzm/WQFR7Jd1+ftI2Z9tYOqjMMG148JflmTk/Fr4PkrbvpR0GGp4fFZt6xECL4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=N4L2lHhG5/Tgj/tMXo3AuwJe4R1m6EosDrnQHHDyi3c=;
 b=nJMg346ZLN+2w5UmM+Mlz3beezoQ/dFZ/I0wo2bowNnvPlq3/vOMDELwF2Bm5Gqcjm3zDcFjRZJHiYthoxce1h+AhCpo65BnET6ROctEnz8FQEYwWvWrXjiKSIzVQuJrmL/aK64T//HtDbQp6myIuNyI7woA/4a1PsQfhMk7F2kj/hepswiBu6G53I7MXg/kAuppnvDOwXxnzTuqNbvr3H/RBJICAr+WxNVmr3Ija8gtsFEeliQwu4M3jF7+lcuUJDOq8/3ij6vlxLuYfpjTma4Id9njTK8Qs+2giMrk6FTEkRCOeA2gPWlDSfSEjFPdbIS24HUt6CU+Z1IRazOLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CW1P123MB7744.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:247::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 19:40:20 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 19:40:20 +0000
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
Subject: [PATCH v8 3/6] sched/debug: Protect lockless rq->curr access in print_cpu()
Date: Thu, 27 Aug 2026 15:40:11 -0400
Message-ID: <20260827194014.977758-4-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827194014.977758-1-atomlin@atomlin.com>
References: <20260827194014.977758-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CW1P123MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc91ee2-586b-4565-5c22-08df0473079a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kTxaMX70Mu60snwXImzGseILn3j/V0fgVjnB6gVOUAQn413evsFtwtDy8bramndfMpLNmfH072YB8AqbPugiQ5bngyk5A08mkKq4N2lU/q6NubaXblr73F6uhu8dcvj5fLLohtKotARcf4ykovwlXL5B7g0fUUmiUDDDxuNG0t1AnITYJIK4g2SQWDFRxsOIP08m9Z5odWZwKn7k2anN2TdWiwmU5GVsKBl/QhluyUZvayjw+8moUA1GbGcKolmIRTMCQtdAGllPTf8PXuvkhs/jym670liCtGDefQI7mjXB37zXrhJM3Z8TqHJRDDmjoDEAWHfCEbkTCknLc6OXZbuTkWPUNumRiMnxC7HhCd3MmfJVPBzsbOG4UHJzXj8YV5J2N5HNcPQqWMzMZDywJytAlFOgfVzH0Y/IM63I9D2eUN3oO5C6oWTBli45Cd5O+NwpOqW4pukh0UNYixzfu7rlukM8NjNMDOGT6a1XcMOVfoCdavRE6neupG/v54eqLAA3UcSETblNbCqh7MsT9XGu1xlIJ46RcfZBjmYYwIht4l79qcVq9mk62S+vWHmvIu2ArfgsWSRzbZf7o1gpPLUAFRU9FP8OAX+5RGtto8D/FN+Ev8/iYfg/tsiQqsjfWI5oi/N0C2AA98+DQukDtDzdCntmrJhLBHA4/1CqfrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X9Z9mtojPc2J4fHYPWuPAUmiJtQbkq9UChGmgGbFkppNJKQGCjaSm2dFnLxN?=
 =?us-ascii?Q?9lY0XgDRqkGaW+zgoqG3hOQPPohk1Csh3W359KwjKsdca52P3umh3IgBgfWc?=
 =?us-ascii?Q?4SeZ7My6/CaDpqeQTPdgE1wuNrg5cxAy08WbL6cLj2krMYfQybLQNsjQ0sgG?=
 =?us-ascii?Q?oL4lWLrtlgE/4i3fVOrPFNE5XT1/ytsxpYkjiOzldLNCL2i36Y/Swm/4ibZ6?=
 =?us-ascii?Q?lIuhRlhbaHpVsrsKnMyWvx4j64pE0VAgYAeYnrafnfo5ePh6WickJ1rWxfcT?=
 =?us-ascii?Q?EtGkBUVTCwrReqF6Zm/hkD2ZOtnAmWenJJALjENVsxN22fGJm7yvROZX0IXn?=
 =?us-ascii?Q?HHkoZ2nrZ7QRXyANIBzF2ffSEFtxgrqnMcHnlqwpk+b/LoepQzDVupJ1RWX4?=
 =?us-ascii?Q?0qsJdTpIP/Emn2qTAUBpx1734/mHUu1rvhQdsbrB3+tmqcM9gTM9Rv8+CEwM?=
 =?us-ascii?Q?TAWgG5xxo3+vtCXtw9Y0vRqge81hMFCbRprxvuBMXZy2vD5e2MxdWr5TMn4f?=
 =?us-ascii?Q?yWrJ/tFC6svjMvRsJUuOpSr80wg95MuWnddkhhcF3/48ECFkVMocWeWJd1Q7?=
 =?us-ascii?Q?d8V6cD9pWDgHhIp23pcgViNCGJXUvRtq5pBZUwEDf2u06ZwRfDwldeynCrv6?=
 =?us-ascii?Q?FFn+gZBb9MDkmLkF6JXsejq89D1Whf9c4jTbPE9l7ThF6E+xVnUpgYUgg8B4?=
 =?us-ascii?Q?tTIdIwgYtCEdGKcXIRduvvddXKYSbvWGLUhHSGP3rUb2rJgFrW3bu4bM2Xum?=
 =?us-ascii?Q?ythcn6PA5uDUVV3YJYx5UcM4JyPW4B2Wq1FiHPyUOiMXvYl9+7le8YrQCrzp?=
 =?us-ascii?Q?1I18VAxDuBDJ69oxrxv99bcHjCEsCOu3ACYKzy9VButsdp/IaTVa9RJcpscR?=
 =?us-ascii?Q?G2cHCCv280/hGvRDrVvvPPhmft01A9bdnAerF05Q8coa81bs6j2wRpZb7V5E?=
 =?us-ascii?Q?Camfk5xEpXSIP1n6+6U+6rlcuPXV6BXxdFoCYxifpVG5Zw6thx1XqaPhvsj4?=
 =?us-ascii?Q?FcVEC6XrJcXSCwvBgxCx8gAZEi2xONFz+JvJdvHhICf7dGknTumP6JGRPiQ0?=
 =?us-ascii?Q?Npxxu223DK4Lanf1cKQ406vGY4xPlwniBhJpTaXgfAVu2pnkYvO2Z3e2vmw4?=
 =?us-ascii?Q?N2URkFyeEtqU/3TqegSJVwGFeGtdY4kYdvxubM8hrYFvx7B+ycHbLVI+S7+J?=
 =?us-ascii?Q?nDbTjbXmd862tCNo11m72cGk146ZGdeDtMjZ6FpgzIm2rbrxFaRHLv3WWZTK?=
 =?us-ascii?Q?mWZiyWnb99PcvB2/MErivpl3tn01YTZdygC7oQgPAInJ/xpfQmtAR3MfYLUV?=
 =?us-ascii?Q?pkHoeZ/C1wBkkX5HPTl5NuDm37UpCBvjht6Titb2pkxleQ87QDQaHxJVd7AC?=
 =?us-ascii?Q?p+bmm/vU44mqeky+PVvCEy5Sdn5bUahLLKNvFEHlljWZUnkr4KuS4oV3sxMX?=
 =?us-ascii?Q?1XVsSHfwMVl6u5iqaFuP6RSOMK55jSxmH0XjL0aN+PJMDjKNYLP/lt51gBAn?=
 =?us-ascii?Q?5zWO5lUaX4oaB7XNoeYYLDHbEyOn2yFvej5biTv0VFMrWg/LJqSB6t9cQSU+?=
 =?us-ascii?Q?ZR0HsJEGg4vRzCmLJ846sPRcn7Y3D0kQMnJiV8c0T+Fxini9UDoFyfYuZsI3?=
 =?us-ascii?Q?/0pMQZu3o5J4fNUMYiQmovklUgLz8gI4n6h1Rdbzew5v2p9qa0tDoIW3FnNG?=
 =?us-ascii?Q?8k2Nevtxmr0YJLrq6+gkMX/+0foKp7iSHaeeXG1ayHk9YFkA?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc91ee2-586b-4565-5c22-08df0473079a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 19:40:20.6438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3X9N2H61zbhMC2bICGAKkcaAlxaq1Qo2GKotE1fJsgxCjooYs4t5UUMO/rTrez7Pbn9O0VsuJMQ6qxoJ40bwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7744

In print_cpu(), rq->curr is dereferenced locklessly to print the current
task's PID via task_pid_nr(rq->curr).

While accessing /sys/kernel/debug/sched/debug is inherently best-effort
only; rq->curr is indeed expected to change dynamically while
print_cpu() is executing. However, if the task currently running on the
CPU exits concurrently and its reference count drops to zero,
put_task_struct() calls call_rcu() to schedule
__put_task_struct_rcu_cb(). Because print_cpu() does not hold the RCU
read lock while dereferencing rq->curr, an RCU grace period can complete
concurrently and free the task structure via free_task(), creating a
potential use-after-free race condition.

Resolve this by reading rq->curr using rcu_dereference(rq->curr) inside an
RCU read-side critical section. Holding the RCU read lock delays the
invocation of __put_task_struct_rcu_cb() until after rcu_read_unlock(),
ensuring that the struct task_struct memory remains valid while being
accessed.

Fixes: 02968ccf7b80 ("sched: add /proc/sched_debug file")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 61932ef7ec4f..3d6248c50dad 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1210,7 +1210,10 @@ do {									\
 	P(nr_switches);
 	P(nr_uninterruptible);
 	PN(next_balance);
-	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid", (long)(task_pid_nr(rq->curr)));
+	rcu_read_lock();
+	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid",
+		   (long)(task_pid_nr(rcu_dereference(rq->curr))));
+	rcu_read_unlock();
 	PN(clock);
 	PN(clock_task);
 #undef P
-- 
2.55.0

