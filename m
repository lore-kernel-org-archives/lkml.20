Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F267E4C150A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789497676; cv=fail; b=c8r/DxbfWgxOxW6AZtITs8SQeeTP8irFHi4vGsg6OPDCx5DSU0udPp/ggr1fZGh/jnKJg9b2gf19AsOyQKy6DrX2dL5+LqWTvRouRDR+9D0hqwzSOryJZuY47z+mMTCg12zBx/JZXHijdSqbcK4NuX2k/ZVKI5D1M/gNSmpjefM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789497676; c=relaxed/simple;
	bh=NIDtbsn24YXruExKVqMaow6Wfo+FRYUx8jcCWwK8Y5E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XxwZDjrvg2ZaEpKFwYxybSUp89rc0jhdF9XwzmMhKEIB15844UsQnhAGfWEJchk3hzpCeDSYlFmZCRwVfdrp5qoWU8wAeut3FzSJ6F1urxR1HxhP2HHsqH0ELOyT0mJdCmhn60p4vfkHTKf5hRCr5TaW6rOCesj1mxF1Ymu4xMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UlmDOH0S; arc=fail smtp.client-ip=40.107.200.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UlmDOH0S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTWgB38YtR/Xr59cr2Th1Gaddw0MhmULMmkF/MsTMxxhFdcj1JSMb9JibNComyz+REJAdZ+7+K4hqKY8wFj1ixdONnBBAXKwSWctNLYVHyaLPXi3W2ISHMyzS7rwkWvvxtPPVAxzN1ZNBekIcBhNRiSSs5N8GXhN3b69PbubleJhtADwAlOpu00DTHw9pXg4lbO4pIudssydWiac9UTghPl4kgk7IXAdVlnBGHG02TE/MInmMag45qvgH+krqjdjycMU0ris3QfYSkAfBNMGV5+Wu+oqLGA+uQRf9OCMbV3SkeNzlhYDNvO7S5eSFvCA3fY+QyjxuO1lBHaJ0Xthng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0p7qY3GG0jtl9LN5w0zxB13QEwSDaF5r4YOarvAUtrc=;
 b=KGoydiesfcEottXosGXbFiAWSujMVTLe978iKLKyJ64C1V70q/AY5AdyIp5ZxDDwl/DgbxaSJcW4+Lypq/iTwdqP9DFmXPyckN9cifYDU4lsBS8bXNeoL4ZKcIp3gBlUch2SGwMfug5F9+26DiQKnSWWhnawdBmlHyJVSJuAxBDmBWU25AumkmaUqf09CBbb5j4+sfvmSbek5pOgg+yqWGIBPzhGZNBCy2T7E2EY6sWEmhrxgPdWBPoP3GiFzGTMqYokAElULdru2UEMsZnqnM6Di3KBvIAnGLuu+Eymu6+0yO46rr+9MKKvnSsB0pKYvD0yzgkCofQGEh3Tum22BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p7qY3GG0jtl9LN5w0zxB13QEwSDaF5r4YOarvAUtrc=;
 b=UlmDOH0SE0n4oVks7hBfWIRLKB1q1oVClNmq0bxw7z/wuk1QUHBXKtZtF4tGiEEespJ4YO74ViPaIMMxdvwgEuYZogXCLG19O1XB64P4wl0ytrhN8UmegaVJvniAkZf2hG9RDYefo4xd32svrw5ozIzQQ5vl01iDP4O38OQ/H52+qwd7H1vV1M5GGlKRVkmcY/4Ki30Yu9sMjLUBJfLX87XB7Ldg07EL+vNyOQeDcqX7C+9RHGrakPuLNd5uZDC5vyj5Q5b54HZdHo43udMI5WsLtBedV9nw1kusS88mST0W+rOhjGOQ/YGqC/YP1gY5tDjeIW7Ob8w/x8LovWK05Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by LV8PR12MB9419.namprd12.prod.outlook.com (2603:10b6:408:206::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 18:41:11 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 18:41:11 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/core: Avoid false migration warning for proxy donors
Date: Tue, 15 Sep 2026 20:41:01 +0200
Message-ID: <20260915184101.2621252-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B7F.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::413) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|LV8PR12MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4afc48-9755-4631-dffe-08df1358e99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xjhObhIkHOoXriuwTN33YL8neaYOG0Kbbz1q5pEXvfdXyXsW06P13PxnsUhqF+iSVikBn316MpFNjCQuY5ILAjzffU76Ec7iJJRPerNepzUdCjVYXJwF2C22Sd6IWOwHFhmnKFLmW5G9LkEmZ2XG5yKCBTAJCQaBzYjPL931r0RB6T28BjO+y52Jm4a81zJ8ZZCbftJsiSq1IzhZltBlvLG6Jxs8XX07zw7RLLveXo4gAJnOy5OwGYmEYCUA5SFrb6/G1cR8be9wJjbqS/6JwoFML7N+yrmTsJfakjJBwZLxIf4CgPD/GelNzRFXQfzaGIxlBJ3DMNw6+L8XeyzibrSmTg7fY/UfW1FZWyQTD90dHAxH2HKWYSiASHJnmzv10duzmkE8SCsGVS3aVbexpmD/7gUXCF2S9NNvJ/2z7wpfsamg8XkHw1A8PvhYPck63IfuQrBUAWjDl6TPLh9IV0CNIU+Z+B4Taiu3qAxe4Uqs2GDeAlTFFRd+RI9qt4Q4RnU2gsJc79HtNqTGjszMG4BRkzvR871lTd2btGnc0GsTzs5jk8R3hUlH2PlOZXY2xrC1SPwgx/b8rm+9CW/CnPIxb5iYK+xzzKYnsFZP13H8XXOax5XHdXxnlYbY/uNSGO954erjGe7RFgfyoouQ8+dEMM6biBXWP3CiFfeVfTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T9ZF6R/m9n9xwig+hEGSruHN5S+VcP94WjjmCAlH8mYO9AE93enyOZT/EUaf?=
 =?us-ascii?Q?e7ijLRBgii4E891/pP6stQEv7bU3i5GQa68u/CFt++sVkCNWayhGn/KfCV6p?=
 =?us-ascii?Q?2aEhQyungtvSYIu56enA5Dmbc5Rtt3aQln3d+7HcKYFNTZ4rNIbKFWoDEDwH?=
 =?us-ascii?Q?O/2KPzQ2+ACrzpcGtQTefqCDwl45DZH44ngs09c4zqF8dfJRsYiYx09pgCZh?=
 =?us-ascii?Q?v+FsPX+6wVeQqQh6xgwADKMudxnIGUwRo7KdqsixI68bm1b45Xtp/t0Am5o8?=
 =?us-ascii?Q?p0ACpXZTFEe54mOZrPtvzQyj9Pd8TAlNtnFKd3HeyC70/6k2GqetHTvEchpp?=
 =?us-ascii?Q?tUhEkmLjf4E/j/HGpP1Hpk8JWi1hN3V7dUnPoYwQ+94YE5G/d1lioZ0xi+LO?=
 =?us-ascii?Q?odvb8oE1mpF+BTgAq3PYY5klfOFFp2stJvomLx3JDgTXCtn1S7lDWvUsqmln?=
 =?us-ascii?Q?G7rpK+9oy/IsC729YWUNGhNrwDoVsDP62EkgD6nJa5uC4R5GEWaL5BoynvPB?=
 =?us-ascii?Q?GLUdm0YOshKxwWZVW2XR55H8aCFQtcK6Iy3EEqjJa4fYL/Oy3ebH5MiYyw65?=
 =?us-ascii?Q?+rVgTa9z1feivtR8TOqGmfBEG3fvxcAYAECovxtfwBDuiqc4rAlhndgjrIGQ?=
 =?us-ascii?Q?rh1gmgBWzuo3Z9JaYNbVb2XPCmEGTNADBqE/+SYJDWhMpMrBJz/D6dw1lMUf?=
 =?us-ascii?Q?iWZ1RxoO2hsPBu5Fg/C9Dn13Ej39Bl8a2Y7B41nxsr3NmPOv/N73I0d39cLM?=
 =?us-ascii?Q?4Z4Oz8R5NHbtI8UVs200LpcWi4rMejamAqOSmKqY7dO8lDROmySfcIXFnPU1?=
 =?us-ascii?Q?q2SlUeq15nNcM6yu73vmv16gJ5Qsf9XrUDlxtvIPPoXpEZqHNaH875nEA9Vf?=
 =?us-ascii?Q?zIRWGUTi0RBTLAm2hC4GRRvbrwCwVAb9o5I8BO5nadPbumb0UWSBBbzqSSVq?=
 =?us-ascii?Q?DZ/sY911kCg1+0Vo5Djcs/KQWGpcIOHz6T/duWXMj6dttWr9fYmkG9y9FqDc?=
 =?us-ascii?Q?7CN2NYra+1ivyVhR7bST9xmgz5QIpsCYNT/Nm9Eet8i0HbHnD997OOzY7vbK?=
 =?us-ascii?Q?KsnE1rQYQm3t7Zn+tZYhyi4arKlsVn/MeYOdKU3pvZG2eMjSsfihzVC6ndjt?=
 =?us-ascii?Q?gn2J3HQ5OYqbIzDj0LNjjnuhLJvPhbCo1MvfsAw4v86H1UWHUJ/Q8SfM5qIJ?=
 =?us-ascii?Q?8yhwY2jNy8JmdJxxiJcnNE2wXnPvz690AY4M5zbRWWBQkGihmtz9WwSbGdKL?=
 =?us-ascii?Q?i0XvuGSMnCneY7ntfmS8tNDCqyqKBX4vH9ri/PzBzY+3doNdSZC6O2k7rsV/?=
 =?us-ascii?Q?G2btIcJlReMfnJGOSyWhC8S9kWpcZ+OHQBVYLhQBUvcAZfKWodl89uO7A6FK?=
 =?us-ascii?Q?jAD1OZfmzOMfCCY7E4z0CNdWjP6BlMU4tWHAL5Q+6LkAcbFcRNacgEt5zQkn?=
 =?us-ascii?Q?9o7hO/c+aoIHU1oKtZjrEIqjCbzzA1ldD+arvVACtcHi3OVB1EM95r2gAjtY?=
 =?us-ascii?Q?1LwdXz19+PNgZrjrrLTOOpdqoT/rP5Js7mHbEJhxWKB6EHmJJTzC/v2WPMJG?=
 =?us-ascii?Q?bjqvKwjsvYX3Cxlg+79JuINcHdf9ih3EPoX1lPubkTJIBgFY2RFTwkiKZXBc?=
 =?us-ascii?Q?POF4ehVOGonin+dn8ynmP4KtKFdEJH6NGS50rUIVCe0LwRUmYs9qQVG/TDa3?=
 =?us-ascii?Q?PS0SBcMFSQSpx9GBMrIbbbaSP9YGpY53TiJErRHshXIKiaKbt/N/9MOaKAc/?=
 =?us-ascii?Q?Kt/b+BNKJg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4afc48-9755-4631-dffe-08df1358e99d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 18:41:10.9038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rj7lEED/Ipuq1FQgqJmQpW9AfyhgGDfkG9Is8j7G23u+vTYQtdCE9bggCrXI/k/ImD1toFGQfoMn5E7zwXLFnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9419

Proxy execution can move a blocked donor's scheduling context to the
lock owner's CPU even when the donor is migration-disabled. The donor
does not execute there, and its original execution CPU remains recorded
in wake_cpu.

set_task_cpu() warns unconditionally for migration-disabled tasks, so a
subsequent proxy migration or the wakeup path returning the donor home
triggers a false positive: moving a blocked scheduling context does not
violate the migration-disabled execution context.

For example, creating a mutex owner on CPU1 and a migration-disabled
waiter on CPU0 can trigger the following warning:

  proxy_migrate_repro: donor blocking on CPU0 with migration disabled
  proxy_migrate_repro: donor moved from CPU0 to CPU1
  WARNING: kernel/sched/core.c:3389 at set_task_cpu+0x1d3/0x280
  ...
  Call Trace:
   try_to_wake_up+0x43f/0x780
   __mutex_unlock_slowpath+0x330/0x540
   owner_fn+0x9f/0xc0 [proxy_migrate_repro]
  ...
  proxy_migrate_repro: donor woke on CPU0, task_cpu=0
  proxy_migrate_repro: completed

Exclude blocked proxy donors from the warning. The proxy wakeup path
restores an executable placement before clearing the blocked state.

Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 91f059a556950..319ae9f988578 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3351,6 +3351,8 @@ void relax_compatible_cpus_allowed_ptr(struct task_struct *p)
 void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
 {
 	unsigned int state = READ_ONCE(p->__state);
+	bool proxy_migrated = sched_proxy_exec() && p->is_blocked &&
+			      task_cpu(p) != p->wake_cpu;
 
 	/*
 	 * We should never call set_task_cpu() on a blocked task,
@@ -3386,7 +3388,12 @@ void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
 	 */
 	WARN_ON_ONCE(!cpu_online(new_cpu));
 
-	WARN_ON_ONCE(is_migration_disabled(p));
+	/*
+	 * Proxy execution can move a blocked task's scheduling context to any
+	 * CPU without moving its migration-disabled execution context. The
+	 * wakeup path will return the task to a CPU where it can execute.
+	 */
+	WARN_ON_ONCE(is_migration_disabled(p) && !proxy_migrated);
 
 	trace_sched_migrate_task(p, new_cpu);
 
-- 
2.55.0

