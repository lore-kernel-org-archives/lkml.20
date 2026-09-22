Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021137.outbound.protection.outlook.com [52.101.100.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53DE56B84F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095125; cv=fail; b=IjRcEVFVV/QDs3JWQike92x+XuP4yG5zPfTQOYiFEIawkUAmtk3sqQ7P0C2do8f0ituHi4ybHIsIqj17hHEZwJ77k+Gfv9LQdUWm+4T2lzsb2bE1133pEmQrusXWmu1pBjxsMAyrRLwaHQu1bP49yFB6B3bWeNKYrOTXSRrLGM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095125; c=relaxed/simple;
	bh=dRw3AJYgdBmSsZG9lRsy0UFYnBGjNF8DLkEOk/r4JKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rxFG8hqXCWDIXvZOO6kLo2L5s5KBp0UZAfESCG2v2OIg70WsDXiYQZPRb889ScXqs6pfolCo2OcXN+a4bSnLzAGWYw9WQNL6NZRfsLgbsaU9pwhEZBGAFZYmHWsuPZpwCKBQnTGlrxIcyji4+RwynBeVGv+8wvWmZ8fyvZzNk/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBPZWXtsizi2vbjIR3+IwgVNnRM0EmtTno6ACeEv3MzlJ/hIC85AJ/OeY7Ww8LfssTolOFqM/MKeyt3ayGVTwl7g2pyi3s96MQYxITILEIoWdK6ls6fa7D6Q8NkXEpfZ52UviIJ5L0I5ho4YU/BD/z5epYi7cr208zbsDjqsyfwfE+cAT8ytV7FIuHSk52IETKbjngsI7sFSwdOEMV28lTlLfDXxIpTfPxTnphCJEs9J/tQ7V5BqeNPulPqmcCw0/J9DfE2kM5QOhNWw+4gQqCg7GXdhrH3G1Xikv5s+nFD2fQde0mEc7V4j+ZY3NJc0HTP5ELrW9YaaL4tG7UuWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=zuTAjoOkC3gqsHUyAncFpyhkDWiRw1kxooZMRoXQ2Dc=;
 b=jzgseOq2+lUcZAynpRPvQ2ixzsU7jPCY1/dzy2ai6sNk5dOHBWxC5v5Cm/BkBOYUUV8lRJwnvSXIDECb0uIiSwh1q7kHmgmq/KsQ1aBa7wVp2OTMgO7xJcDvO+++QccfQO0U2AcZXKiqti39sZKhT+mS9oqrRGWdPYhj4PebwUcFW7swo+TDf2dw124pWFCzAOhgSO5VyfmIxd17zKnJV/2UWHesg+jkn+QWc3NP8HrwdtPHZYBqUYFiEDjpoMBF0cvWCCogGSCk6xR9jxrANWFmt+Qsh2bDK2eWaIAmNpgMVrUlY06xVbjzjCZcAruBZolI9EixReseqDSaxzV+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWLP123MB3715.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.17; Tue, 22 Sep
 2026 16:38:34 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0428.011; Tue, 22 Sep 2026
 16:38:34 +0000
Date: Tue, 22 Sep 2026 12:38:29 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	feng.tang@linux.alibaba.com, kprateek.nayak@amd.com, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/debug, sys_info: Introduce
 SYS_INFO_CPU_RUNQUEUES
Message-ID: <uccrrdkyufnfhjer5lapd24dastzq7pkc4qhujn3jcbs4nnpxl@fzvxux6wtmef>
References: <20260912013240.545742-1-atomlin@atomlin.com>
 <arKRTnnubfxJSj3M@pathway.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arKRTnnubfxJSj3M@pathway.suse.cz>
X-ClientProxiedBy: BN9PR03CA0556.namprd03.prod.outlook.com
 (2603:10b6:408:138::21) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWLP123MB3715:EE_
X-MS-Office365-Filtering-Correlation-Id: 267d98df-9f2e-436f-51cf-08df18c7f17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|56012099006|4143699003|6133799003|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XATbIfYv+toOvpjCSOzVsoIvoT8Sr1/EiaGI94NMAVRap+ZX4xSOvo3n5NAcwdQaeEugtXhQh2v5/JnEZWJTLGGBlWrmLx0sHjSosVWenInOGd3llW/6OV4nabjc9r3t9RaFYjj9IibBxr8ihPMmjvKzvMrLxnBT5ZsBvGnx+iywTk+vyyPIs8NevPBQo39oud3pawVvO9CnO13Twksa8UWfKLA1rywbMMbGNZqrIK1Grq9zt5BDVO8hkWCWL/QiQYdtoSWCc0nAp1EnVIFM2Oq5E6b5Tx1Z9KuzLN488DFrebej02VQydvCKzK4vRJEtGe7GKK/YloYIpLpPis08Zxi4/4LR3WbGjzPnP+l+v3TClAS5xCbAeYDg/ztYgG4rQW+ibu2EuhY6rTSj4ApK56/Krocd8K0qnIxuWXYhL8yRhVEqklnFTup0uPdBS3BVPQ/NY5tY4IEkfPbrMc/5aaxuQNSTAfDGFd5bi3uMRM/IYaOTHCf/uKc3d12jSJj+r/MI7JcvLXWD3cRzbEisWTcv9dnZtuFKygHAhUjq/iNfuq4XdgloGkwitTAfbonYj0g8rDRkRmMOBWPRmdwB2Kq+UHtdEx6y2ddMLwcZ/FITjCiVfzQmPc6QoUWeiTLq9gs9qQ2bgUNGSz7FqNZEj1stdXCqW2A5hZivlhAqFs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(56012099006)(4143699003)(6133799003)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlkwS09XYzUrdUFIaXR0WnBmeGNvSnRIemowVnpXZ0hjcGhIbUVtU1lyMVNI?=
 =?utf-8?B?YzU4TGZjMHp2cml3YkN1TExJTU5FUHBGSk5QZU1YWHh5MmxvRmtoRzM3eC9o?=
 =?utf-8?B?Z0Jna2d6ZUowalU4ZUFQc0krQVlIY3dIVXc2SEpUU2VwTkFIOUZLQVNGSkhz?=
 =?utf-8?B?UUdIMEwySGlEVnU2SUthUWtnOC9qQmZrUmV6eGxRakU4d3VSR0hGR2lKeCta?=
 =?utf-8?B?dDBvTkNEUXlkc2hnNGhlMGNFRFl3ZC9jTzd3bUlJVnZGNCsyMUNOMHdpbStI?=
 =?utf-8?B?M3liYUhFUG1yaHNjNUI2eS9wcENxT2ZSODJ6Sy9ySDZXZTRVNjcvWmVOU29O?=
 =?utf-8?B?RzkxRWEyaHdBc2k4WmREYWtUcWE2blU4SlI4ek1BS2R6Wnk3ZE5aRjFsZDBH?=
 =?utf-8?B?SklmR0tqM0h1Q2RvL25zckpuSGRJM2gvaCs4S3htb1JDUFJQdnJQUDNxQzM0?=
 =?utf-8?B?ai9CR1c4emptR2RLRTd4K1NNcXJybGJzSjVrNGRFcnBVQWF1OGxUOTRzbnZZ?=
 =?utf-8?B?Q0VheUZTZnBvMXlrdkUxYTJua0tON3VYcitlTGU3ZVdJTDJQNWhkQ1dudHM4?=
 =?utf-8?B?M25lNDRoYVcyL2tFNU9CSWpZblN0bk4yNHZVWjUra3oza09ESldUejBSUGNX?=
 =?utf-8?B?YkdhZGZ4YVZadmlZeTh3Z2ZlR2REUDZwQnJrbGRxdVM5ZmM1MTg2WmlhZXIy?=
 =?utf-8?B?YmtwTUhYOFR5ZDBkV2JBUXliTTR6M2Y2bU0vU1JXZExNMGRpSVRsS1hxSWJl?=
 =?utf-8?B?L09MMEd0MDBsRjBhdVdxMUU1MnhsU0E4SklCWDB6eGVxQ0FvWmMyU2I5bHBP?=
 =?utf-8?B?Mkg4UFd6emRqSHh1aGRqRUhqMUdUcGtDNUxETFVkSUpXNEg4Mm9lcFFzeUEv?=
 =?utf-8?B?dHh0MHQvT0E0VWs1MHJyOXdVbnM1cm5YUDV0ZnduOGpTQkRBZGdyRXU0T3NZ?=
 =?utf-8?B?THZuNjg2SlpWNDFpRGlZTzRrRytHSFd3TmFydTB1V01qODg4cG1CbnIxUVly?=
 =?utf-8?B?aE1MY2E0NU4rcjVlZlFVNW9MOVVPdStXRVRya0plbXFtbG5IWGpnblAzdE8w?=
 =?utf-8?B?YVpmKzY2VGxBUTY1WmlSTEZjODJubUg2RzUrWU1kNUFmZGM2RTlVNCszM0h3?=
 =?utf-8?B?Sm9mQk5VZDF4QzNkRVZtY0hNWkw3QjlUMXJzVjNFR3UveC9PVHd6VVVlaU1U?=
 =?utf-8?B?dHdiNUh0VkNUemVVd0JGM1lEMkFMcmxLWHloSUNxTE5JY3NYOXExK0pWS3J3?=
 =?utf-8?B?czBkQ0gzUFpLT3hTUnZhMjdpcHk2alJsWDQrVGgyM1NRdWRRMUx5NVZoY0Zl?=
 =?utf-8?B?L0dtd0xDMThLem1qRzVlZDk0VVlNeUQxb1hvZ21zaDFiWGNWV3Nsa2JYOEdv?=
 =?utf-8?B?S3hOQngrMW93ZHB0b2ZqaDRJeS9ObFBqbVhzdW9sbytYUWlNRXlieFNPWWxw?=
 =?utf-8?B?aXpRcmhsQ2lmSjU5d1ZIR2xscmZKVS9YNm1lRWZndmc1UkM3WUl1bjR0T2ls?=
 =?utf-8?B?MU0rWFQ2MWxGdU9HSUt0a2ZxRE0xOTEzc0dRLy9ZYU1KdkswM1J4VDNtUTBv?=
 =?utf-8?B?TFBmOVM0ZGxYUW9ZL29tRnNzcTJDWVRaVm1aaWMrNnNBZC8zUHJBMnNzYU9k?=
 =?utf-8?B?eS9tSFZTcWxmSFVocjV3Y2RoVWhBZjQzOW00SHgwc2Jrb1l2ZUxoeFUzcTcy?=
 =?utf-8?B?am5taW9EOEZJeGFLdmxGUjZKN2Z1c2xpcjdmdm5La2RWSXJRL21CSER5bm9K?=
 =?utf-8?B?Tk5QTTNlbmx4ZGkyKy8xNkw0dmhONVovYVNZUnhqV3NyZEFxNjMzRFZLbUV2?=
 =?utf-8?B?L2duRE52WDNvN2ltOHdsZkljOTZscU5FTG9HZ1VmSFJHdXMyWldhaUpaSEpp?=
 =?utf-8?B?dU03NUZtMUwrK0JPdUl0Kyt3NHNaN1Y4NXl6QlpVZlp4Q0xVV3NuU3VLcW92?=
 =?utf-8?B?UXpNNTVoeFpxT2tnbUt0SHhhb082TU05RUkrdzNMTzFndmdzN0M1NnZZa09V?=
 =?utf-8?B?M0tqc1d4MEtBcnhrUW9LM3o0Y0tQMTZnaDBZdGREaHhZOHROMDRUaTIxOEVI?=
 =?utf-8?B?TWJrSWt6d3pxTlc0UThhTEI0M1hJRXg5VnV0c2lLemdsVkwrNSt2RE85bG9K?=
 =?utf-8?B?U0xZWmhLWWRWdU1KVXZVSHNLYkloWUpMOFRmZHc5eHZiNDVVQ25vRjVDRWJ5?=
 =?utf-8?B?WVhJVE9yTlMrRTZDRStBd1NYUHZiOWkrclp4Y3R2ZnZubGljQm1Pd0lQZFJD?=
 =?utf-8?B?Rk83RTExdDRYZlBEMG1ySTBRenBycExzWTdpbjJOVUttaGQxWC94UmYxcC8v?=
 =?utf-8?B?MUQxNkRZOU9xZ3lvcng3bjJkekN3QUxWK1ZCQVBpZDNHNWVhaGt6Zz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267d98df-9f2e-436f-51cf-08df18c7f17b
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:38:34.1332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njUVao+OcxLlIuN10FyfEi8IZ00Kx5PRFlGX7UB8A2NqWgGSzTVwvYwprd548w6J3iV6s3qWzp9iIsTZFtPQxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3715

On Tue, Sep 22, 2026 at 04:31:42PM +0200, Petr Mladek wrote:
> On Fri 2026-09-11 21:32:40, Aaron Tomlin wrote:
> > When investigating kernel panics, inspectability of per-CPU runqueues
> > and runnable task states is valuable for diagnosing CPU starvation
> > priority inversion, etc.
> > 
> > While debugfs (/sys/kernel/debug/sched/debug) exposes runqueue metrics
> > to userspace, these details are not captured during an automated kernel
> > panic or crash dump. Capturing per-CPU runqueue state directly into
> > log_buf fills this diagnostic gap for post-mortem crash analysis.
> > 
> > Introduce SYS_INFO_CPU_RUNQUEUES and its corresponding string token
> > "cpu_runqueues" to panic_sys_info. Add sched_show_runqueues(), modelled
> > on print_rq(), to emit per-CPU scheduler diagnostics to the kernel log.
> > 
> > Unlike /sys/kernel/debug/sched/debug which dumps all threads assigned to
> > a CPU, sched_show_runqueues() only emits threads that are actively
> > running or queued on the runqueue (via task_on_rq_queued() and
> > task_current()). This keeps the panic log concise, reflects the true
> > runqueue depth, and prevents overflowing the printk ring buffer on
> > systems with high thread counts.
> > 
> > Additionally, to guarantee deadlock and memory safety in panic context:
> >     - Acquire the runqueue lock using raw_spin_rq_trylock() with
> >       READ_ONCE() and rcu_dereference() fallback, marking contended
> >       queues with " (contended)"
> > 
> >     - Wrap the per-CPU inspection in rcu_read_lock() to protect the
> >       sampled current task (comm and PID) against premature release
> >       during pr_info() across other callers
> > 
> >     - Omit cgroup group-path printing in print_rq() to avoid acquiring
> >       cgroup_mutex and traversing kernfs dentries
> > 
> > --- a/Documentation/admin-guide/sysctl/kernel.rst
> > +++ b/Documentation/admin-guide/sysctl/kernel.rst
> > @@ -939,6 +939,7 @@ locks           print locks info if CONFIG_LOCKDEP is on
> >  ftrace          print ftrace buffer
> >  all_bt          print all CPUs backtrace (if available in the arch)
> >  blocked_tasks   print only tasks in uninterruptible (blocked) state
> > +cpu_runqueues   print per-CPU runqueue depth and runnable tasks
> 
> I would keep is short and call it "rq".

Hi Petr,

Thank you for your review.

Acknowledged, fair enough.

> >  =============   ===================================================
> >  
> > --- a/include/linux/sys_info.h
> > +++ b/include/linux/sys_info.h
> > @@ -16,6 +16,7 @@
> >  #define SYS_INFO_PANIC_CONSOLE_REPLAY	0x00000020
> >  #define SYS_INFO_ALL_BT			0x00000040
> >  #define SYS_INFO_BLOCKED_TASKS		0x00000080
> > +#define SYS_INFO_CPU_RUNQUEUES		0x00000100
> 
> Similar here: SYS_INFO_RQ

Acknowledged.

> >  void sys_info(unsigned long si_mask);
> >  unsigned long sys_info_parse_param(char *str);
> > diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> > index 72236db67983..79f6b00974bb 100644
> > --- a/kernel/sched/debug.c
> > +++ b/kernel/sched/debug.c
> > @@ -1322,6 +1330,48 @@ void sysrq_sched_debug_show(void)
> >  	}
> >  }
> >  
> > +void sched_show_runqueues(void)
> > +{
> > +	int cpu;
> > +
> > +	pr_info("CPU Runqueues:\n");

I will drop this. In print_rq(), there is often no overarching banner line
emitted beforehand.

> > +	for_each_online_cpu(cpu) {
> > +		struct rq *rq = cpu_rq(cpu);
> > +		struct task_struct *curr;
> > +		unsigned int nr_running;
> > +		u64 nr_switches;
> > +		unsigned long flags;
> > +		bool locked;
> > +
> > +		touch_nmi_watchdog();
> > +		touch_all_softlockup_watchdogs();
> > +
> > +		rcu_read_lock();
> > +		local_irq_save(flags);
> > +		locked = raw_spin_rq_trylock(rq);
> 
> Is the trylock needed for all sys_info() callers or just in panic()?
> If it is just panic() then I would use it only when oops_in_progress
> is set and use raw_spin_rq_lock() otherwise.

Yes, the trylock in sched_show_runqueues() is needed for all callers to
__sys_info(), not just panic().

Because __sys_info() is also called from NMI context (hardlockup), hardirq
context (softlockup), and khungtaskd, oops_in_progress is 0 in those paths.
Using unconditional raw_spin_rq_lock() there risks fatal self-deadlocks if
rq->lock is already held on the local CPU. Furthermore, locking arbitrary
runqueues in a loop risks AB-BA deadlocks with concurrent scheduler
load-balancing.

Using raw_spin_rq_trylock() ensures sched_show_runqueues() remains strictly
non-blocking across all __sys_info() contexts, and tagging contended queues
with " (contended)" adds useful diagnostic value.

As such, I believe the current implementation is sufficient.

> 
> > +		if (locked) {
> > +			nr_running = rq->nr_running;
> > +			nr_switches = rq->nr_switches;
> > +			curr = rcu_dereference(rq->curr);
> > +			raw_spin_rq_unlock(rq);
> > +		} else {
> > +			nr_running = READ_ONCE(rq->nr_running);
> > +			nr_switches = READ_ONCE(rq->nr_switches);
> > +			curr = rcu_dereference(rq->curr);
> > +		}
> > +		local_irq_restore(flags);
> > +
> > +		pr_info("cpu#%d: nr_running:%u switches:%llu curr:%s[%d]%s\n",
> > +			cpu, nr_running, nr_switches,
> > +			curr ? curr->comm : "<none>",
> > +			curr ? task_pid_nr(curr) : -1,
> > +			locked ? "" : " (contended)");
> > +
> > +		print_rq(NULL, rq, cpu, false, true);
> > +		rcu_read_unlock();
> > +	}
> > +}
> 
> IMHO, it might be a useful feature.
> 
> The main question is whether it is acceptable to scheduler
> maintainers. It adds some churn. Also they would need to keep in mind
> that it can be called in panic().

Thank you for your feedback.

Indeed. Regarding the scheduler maintainers (Cc'd Ingo Molnar, Peter
Zijlstra, Juri Lelli, and Vincent Guittot):

The churn was kept strictly confined to kernel/sched/debug.c:
    1.  It reuses existing print_rq()/print_task() helpers with two flags;
        queued_only, to keep output concise and show_cgroup_path, to avoid
        cgroup_mutex.

    2.  sched_show_runqueues() is completely read-only and non-blocking
        (raw_spin_rq_trylock() with READ_ONCE() and rcu_dereference()
        fallback), so it does not impose locking constraints or latency
        risks on core scheduler code, even in panic() or NMI/hardirq
        contexts.


Kind regards,
-- 
Aaron Tomlin
