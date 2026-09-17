Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA50396D25
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789622539; cv=fail; b=iNwfAg7/Ex8yYiH0KKZSifguBLo1IpkoOq07xzYlMrLbQAjHMm+e+8HPBigeFBNHiWzTWqio+9BAR6Zme3AUw/pMah1yvvElUELYPLQxqh9dx0MbqmPBSmp9B8whaAQO395+RxGyYIhzj5T2pW1L1eWAySCN6JCSzwcZ6N/ZNWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789622539; c=relaxed/simple;
	bh=34yEn56aaAdyju7oN2z0HciafN18lb9Sahl98MR/0T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TOsTqTLK2wjIFPFAIgYQM4cnWYCzMu4Km6VEROQ2YiFdXTZzwQSkQp61f+DsUoFwI0r6h7u01VV0g1nxnU2YgeBzk4I66MBuIiVdLT7sDnlS3xm5k7x3YNL35xnBqYKMt+1f8sPH7kT6v2nRjlfxXPl5V5u5ffb5TR0pR5Mrtrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xUf0KPLB; arc=fail smtp.client-ip=52.101.85.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xUf0KPLB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfMcrvgZsaS7ZgQkO5Sw/dDZt14D5Tnzw+Mlz903AFoZP53Onn9/bklx9txfHoRgYLhJLSElMx7dg+iJrHWeQmAOlsz3FLSyg6fyU1I0AtFsM0L+rO9CM+S45nGmcTOwklZWajsczz/ofi+1OBU3PKe9PxMw7fY9U2q4PFlr98L2UY90GyF9u3iCpx/J2pM63GqPLxNkJKHuaiUa3MBfoxB0Ot48He0i2G74sIraxJQKYGj1sjh+x1osQy/FNawTSk1EH8BvBhhqoBvnFJ1zLQ9hdQxk1WzW56NA54vNMdovhtMucNJRdBmxJcaQf5DOnS5+OKm+ZTB9FmDToJl+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcamN+jh4chuG8QcUmEd+T343H4EDYb6rEGMOvD+Fx4=;
 b=fpmWJNsMtZIrwa0nddxisOC/U+Xyai4na9ki4H9EjS1V5yARCyGUTkG1E1pQn8f3/cKDsi6xn9Cj1Eg84Fwhyi9dL2GfoqrginJYdcZ4DEPJBHXv4ucgDKiyrXjArxapvF+/rsGRxCMuhm+X4+szVeO4il2oeqpgUzRsgOlcjDanwJIfVv6q4oSue4Wh0LXwKzUeRuYOJ/j8xAkbAtTLfRrwriuC6SQQ2ZW4/m7PH2KDcZnjwU0aQzwakws677JQ6xZLn6O4U5SSkQGjEx9VyvGhpZoUJRUnkHQyYRwru2eH+HP3HZwoHjKbBRio9YuxUpm7wd41meDz/5LfVQTuwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcamN+jh4chuG8QcUmEd+T343H4EDYb6rEGMOvD+Fx4=;
 b=xUf0KPLB/tyw0O0rj11PgasP9sY0s0hIoUyLpi0+dugRyvmA66R8ChdgqdWAFcmz4H8AQMVmtTdIrtuWphVAZG1wAYwMoM3pGsk8uIBpFE/hcqO65L5ZiZbBrpi+XG+F4f/O9dNnb+OkZcH2nxEntxXSmybdVESjv/CJzGK/zlQ=
Received: from SJ0PR05CA0094.namprd05.prod.outlook.com (2603:10b6:a03:334::9)
 by MW4PR12MB6975.namprd12.prod.outlook.com (2603:10b6:303:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 05:22:13 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::3a) by SJ0PR05CA0094.outlook.office365.com
 (2603:10b6:a03:334::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Thu, 17
 Sep 2026 05:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Thu, 17 Sep 2026 05:22:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 00:22:06 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 00:22:06 -0500
Received: from [10.136.41.131] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 00:22:02 -0500
Message-ID: <f0f597da-4700-4682-9361-b921aab7e462@amd.com>
Date: Thu, 17 Sep 2026 10:52:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16][PoC] sched/core: Alternate approach to
 sleeping-owner handling in PROXY_EXEC
To: John Stultz <jstultz@google.com>
CC: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>,
	<linux-kernel@vger.kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Waiman
 Long" <longman@redhat.com>
References: <20260826062901.2137-1-kprateek.nayak@amd.com>
 <CANDhNCpEYgckCPYhjL8oQGYv9r8joP_1tBps4bGQFD3vWDCetA@mail.gmail.com>
 <CANDhNCoVzHqS627Vv55E==VsJfnDMwvEnvYMxBt5Euu8PRUP3Q@mail.gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <CANDhNCoVzHqS627Vv55E==VsJfnDMwvEnvYMxBt5Euu8PRUP3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|MW4PR12MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e6754b-27b8-4c57-74c0-08df147ba1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|1800799024|376014|23010399003|82310400026|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	60X7VQUKNiWWvKykEo39waE9MX6oDKW9hkWTHZGRLtNoZv6ykWmQtryYD0OyKRgrF39lFyIhEuT5ezBO5pwtKS+8Hi+j/EZANs5VEmmf+wWcaNCZHIYHCa41DCi3/SP09bjFpSrz1pvC/nQorv0BfC/rmZFmZZ3YAHgUKHwTmx08Owx/y4o2b/T/DZqrm/dzGZUogWCGsY6VEpqSEAPtBEKsDBvzbIePyp67bKp9lMf6TiBGzxYZfIe7zetTtOmx5ocJghN/g6j1aivCwvoxrWM+nRDfJZUfiI0pLp0pUCstC+FdmvIiyV3bXxcVOWN/v+pIwravs1PZ3dxAHZ0I97st8znCgYwBUMEU+qtceGeRoJsM9TI8Xha8d570XSjm2zAhllauHY0fIa0sGusLw2W8ITc6DK3hCd8eXHcQ+/72FfssCuKq2iUhln0qAA4A9yRwPjyMdNFiDukV6FQZv40GQuaUiOQ3JhOrptdtIcdqiwxTEismkQIxmvASoJCx2fq6uzIAntN09iXF9H7jH5Uym5eTyAugv57OCH1proy45yBCBrZUemCxNDjAWMu/V7OY5QQ93x4N4noHP03+kBrt6aQvrcx1qnidcYv5NCY4bUc/U7VczI7Frxe5xBQl8r2u87pn7trv8z5m4xZ9NVQuzHMD7slLiuONnPXeXKUFjOkFD8Le7OxL5sLP5rjY0lji4cY8lyM23HgwfhDpNQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(376014)(23010399003)(82310400026)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uJx1kFDFTaxAAHYsJdXaeiWg8CWTEVAOx4SDBbInHeRci1FsyxR3crqJ8az5F6YmWY67t5dirW3Ipu1amW9jR4mZ68fZ8BdXp77QIgwL216D8XmPlaiI16rmjCCxUXiWtnHOCoO3In4vUAPc/OhR3BlfpTxJYtSvhitLjiqzX65BHPiBcRs5V5uKAwfLTCi/MvUSV9zRjhyeMRTaRxHGK2F1BHE+UYdqOyVmTluDIkdbv+lVf/Kwi9afq2hlqRkEGfQb+Z/CYb6DJn6usplIWPn7Nak673E51yj7w4cP4ZJnx7H6UGyyLf9G7nFDiG17hye1ljo8XcFvEZcHQK2IMIxMrI0PnQRN3xs/bFEFsf3M/3a1EXEnj8S3ShZtgibdiy0JpIuoQjNZt/7enj9S96agmkek+nvkMeAahlO85ulfeXWlr78wbDQHCW0qT1Zg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 05:22:13.4777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e6754b-27b8-4c57-74c0-08df147ba1ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6975

Hello John,

On 9/16/2026 11:27 PM, John Stultz wrote:
> On Tue, Sep 15, 2026 at 10:22 PM John Stultz <jstultz@google.com> wrote:
>> The series definitely looks interesting, and it seems to be holding up
>> ok in testing.  Though figuring out how to refactor them so that they
> 
> Well, I did hit the following last night during stress testing:
> 
> [11176.672951] WARNING: kernel/sched/sched.h:1645 at
> sched_change_begin+0x1b6/0x2b0, CPU#14: torture_shuffle/433
> [11176.676650] CPU: 14 UID: 0 PID: 433 Comm: torture_shuffle Not
> tainted 7.2.0-rc4-00032-gf14e36dcc837-dirty #138 PREEMPT(full)
> [11176.680917] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.17.0-debian-1.17.0-1 04/01/2014
> [11176.684794] RIP: 0010:sched_change_begin+0x1b6/0x2b0
> [11176.686748] Code: c9 1e 48 89 03 80 7b 1c 00 0f 85 ca 00 00 00 80
> 7b 1d 00 0f 85 91 00 00 00 48 89 d8 5b 5d 41 5c 41 5d 41 5e e9 1b 63
> 23 01 90 <0f> 0b 90 41 f6 c5 08 0f 85 c7 fe ff ff 48 89 ef 41 83 cd 08
> e8 b1
> [11176.693913] RSP: 0018:ffffc900010b3e10 EFLAGS: 00010046
> [11176.695962] RAX: 0000000000000000 RBX: ffff8881b9198020 RCX: 0000000000000001
> [11176.698747] RDX: 0000000000000001 RSI: ffffffff82c8b519 RDI: ffffffff82cad7fe
> [11176.701554] RBP: ffff8881b91abdc0 R08: 0000000000000001 R09: 00000000d19ffe29
> [11176.704561] R10: 000000000000000e R11: ffff88810264cff0 R12: ffff888106694400
> [11176.707423] R13: 0000000000000002 R14: 0000000000000000 R15: ffffc90000017d58
> [11176.710161] FS:  0000000000000000(0000) GS:ffff88823563e000(0000)
> knlGS:0000000000000000
> [11176.713196] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [11176.715628] CR2: 0000000000000000 CR3: 00000001072a7006 CR4: 0000000000370ef0
> [11176.718462] Call Trace:
> [11176.719460]  <TASK>
> [11176.720319]  __set_cpus_allowed_ptr_locked+0x146/0x1f0
> [11176.722343]  ? __pfx_torture_shuffle+0x10/0x10
> [11176.724063]  __set_cpus_allowed_ptr+0x64/0xa0
> [11176.725913]  set_cpus_allowed_ptr+0x3a/0x60
> [11176.727513]  torture_shuffle+0x12b/0x230
> [11176.729014]  kthread+0x103/0x130
> [11176.730304]  ? __pfx_kthread+0x10/0x10
> [11176.731758]  ret_from_fork+0x27c/0x340
> [11176.733220]  ? __pfx_kthread+0x10/0x10
> [11176.734680]  ret_from_fork_asm+0x1a/0x30
> [11176.736366]  </TASK>
> 
> Followed shortly after by:
> [11663.223681] kernel BUG at kernel/sched/rt.c:1020!
> [11663.226093] Oops: invalid opcode: 0000 [#1] SMP NOPTI
> [11663.228669] CPU: 46 UID: 0 PID: 0 Comm: swapper/46 Tainted: G
>  W           7.2.0-rc4-00032-gf14e36dcc837-dirty #138 PREEMPT(full)
> [11663.234796] Tainted: [W]=WARN
> [11663.236392] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.17.0-debian-1.17.0-1 04/01/2014
> [11663.241196] RIP: 0010:dequeue_rt_stack+0x2ad/0x2c0
> [11663.243652] Code: 83 a8 fe ff ff 39 c1 0f 8e 47 ff ff ff 90 0f 0b
> 90 e9 b7 fd ff ff 90 0f 0b 90 e9 e8 fd ff ff f3 48 0f bc d0 e9 80 fe
> ff ff 90 <0f> 0b 48 8d 3d 1a 79 dc 01 67 48 0f b9 3a e9 e9 fe ff ff 90
> 90 90
> [11663.253981] RSP: 0018:ffffc90000c10dd8 EFLAGS: 00010046
> [11663.256630] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88810ad50080
> [11663.260225] RDX: ffff888235e3e000 RSI: 0000000000000000 RDI: ffff88810ad501c0
> [11663.263862] RBP: ffff8881b99abdc0 R08: 0000000000000000 R09: ffffffff83b9a280
> [11663.266876] R10: 000000000000002e R11: 0000000000000000 R12: ffff8881b99abdc0
> [11663.269626] R13: ffff88810ad501c0 R14: 0000000000000000 R15: 0000000000000025
> [11663.272412] FS:  0000000000000000(0000) GS:ffff888235e3e000(0000)
> knlGS:0000000000000000
> [11663.276347] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [11663.279185] CR2: 00007f03955d60ac CR3: 00000001072a7006 CR4: 0000000000370ef0
> [11663.282698] Call Trace:
> [11663.284061]  <IRQ>
> [11663.285116]  enqueue_task_rt+0x77/0x3f0
> [11663.287276]  enqueue_task+0x1cf/0x330
> [11663.289121]  proxy_activate_blocked_task+0x498/0x640
> [11663.291579]  ttwu_do_activate+0x287/0x290
> [11663.293582]  sched_ttwu_pending+0x10b/0x220
> [11663.295726]  __flush_smp_call_function_queue+0x1f8/0x680
> [11663.298320]  __sysvec_call_function_single+0x35/0x180
> [11663.300877]  sysvec_call_function_single+0x8a/0xb0
> [11663.303287]  </IRQ>
> [11663.304376]  <TASK>
> [11663.305467]  asm_sysvec_call_function_single+0x1a/0x20
> [11663.307994] RIP: 0010:pv_native_safe_halt+0xf/0x20
> 
> 
> The only change I made to your tree was passing the rf into
> proxy_activate_blocked_task, to use rq_(un)lock() instead of
> raw_spin_rq_(un)lock().

Thank you for testing and the report! Let me go find what I've
broken.

-- 
Thanks and Regards,
Prateek

