Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021077.outbound.protection.outlook.com [52.101.100.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804353D0A1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098572; cv=fail; b=lYL9osYOEwh0BgRnWUGMgnQ5pCXpB8KgXBVOpAz1QSvpGHWe36VfbC8eWOO41Uc8jgGzrW2csE5nzfm/omeANLZbB2JxI/HXTFiprWUJo5TMBkcYh4x+bH/MOA3X5Hsb4/fAmXvh3lqw1YXBfQmOHk5dY79TaYhfQ1S+6OSyqFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098572; c=relaxed/simple;
	bh=fxBxZTq3IyzQKw77U9eC/Gooa/KyXj9zw/mZrJG2XUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e1TUoP9Yom1EQQI+o/ucNaLstlomhhE7TmYAP2aum3IA1ERuVm+D0y16sY75T8BjzH2IVY+YKvNfx91fE++fLdRMwQMFyS58eHU9UiZm5WRoEb+oxKhRxIndZmD1GInExJijTOvaswyFU3qU6nHjsesvGe05yAjikuftHLpZCJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C28Psah8DiMf/1GGHuXhn4sYIe3+FNc1rjekUYEDr0X+TFBNiZVd4btK2bFRukxUiMEiNoXtGaOXM+gaPnSIlj4yDDiK/d48sLM+UWx9Cq3cKRTO7IQDQHT3KxttxUUCDnce4laI3rYMhZ8HjfoX5SPo9CTpELge3zjKxOL5nEPE0tQa5pOKzUDXiu5rkrZ/K+PJYqYjahBQF/g13+Y9/fOFE0qvE10Ka2880e8ADDgrF7P19lRAyyWD6ECX4lzsRsSExdf8UerwS8IV24FMYymKkN21BFMsbmMO+QOW8q00Gbup/Kv+BV3dcfffc8gqHHVuhn4B1M+JVibDHTzleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=3O/Daj4/hWKmV44GclCPNRB5L16IinncmmSOXELDzYU=;
 b=P01pupd2t+yMqi/cRZzFdvX634n1bSu72gSp8V16mfILuUtt69GTImMm2Er9ydCBAj3y8Z+T5bP0aE6MKiTUMAy3sXGVUHP/6wvc9TO+zzO3UqypBMFzZNho1DtMY+NRRKtbdOf5RW9tvtmLmDNGI3AnRvnXKAEJ6P7qUhCDHGPac74r9s/cC5O8znaAc0oOP92AJj/xCC0HcZrG9Dklk5sRlXsgfkFGXLqlKzJuaMLdfTNrA/zqt6cwDbufTIpI2TRVbE9AwQZapzMz64ObNy0v07yJL2o6NG99dwkC8FhQJiDSlyV7scyYco9zzPV3oWLJM3s0LTVwqOoOKoXPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOBP123MB9062.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:4c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 17:36:05 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0428.011; Tue, 22 Sep 2026
 17:36:04 +0000
Date: Tue, 22 Sep 2026 13:35:59 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	feng.tang@linux.alibaba.com, pmladek@suse.com, kprateek.nayak@amd.com, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/debug, sys_info: Introduce
 SYS_INFO_CPU_RUNQUEUES
Message-ID: <rqph2yaqdxyu4dmwddmdcakiacmyumjh7adxdl2a6ibjc6wwi4@55oxsrrgjuaw>
References: <20260912013240.545742-1-atomlin@atomlin.com>
 <20260922144027.GT776954@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922144027.GT776954@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: CYZPR14CA0037.namprd14.prod.outlook.com
 (2603:10b6:930:a0::15) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOBP123MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a0c0f2-0ed1-43f7-6d84-08df18cffa58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|6133799003|18002099003|22082099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ikanArdrKiKBBPA03a/evThySGBy00a/C9pRacIPtrRNysvHKsKyvf69khRew+llsQ7D3cRUFV4yjZPWLSBnQxlsIpj39iPNvlRv93LwiChOgLj9t5JkZrXa4ahbQWxEPOowdla7/DHi5E7kvuQK0YK4lvmTuMOOGMT3xhQ5JoDZAczlE7T0WmPgBdU01Kal8ov/Mj3p2/ZwDgsucgJCaNLRMHOP1KgflxlvKIjhzyvXivzACDbhshh8Tt1CPl2sokP8FtVyF21WpdvfIyucHDQRSsH32Qh9TDZxKMbOBPik8n3GM8PBlo5PJB3OFUB3QXs+fgJ7kh+pRHbrHBNcEQCvUfhXUPVqDMC2l8YTgriaBzdAp6lch3D/frtYMpXmCoGw5/rQaKTmQ2Q0Ec68ukLpWrkEU48K/nDkrU5Az0xfUR+4FQmqXJ1erSgykgoZZYh9eJSQNEfE2Z7uM5hjUFvAFJPhnz7VBewZMWN9/jvF5HY6HklADO3+1pO/yPd0YsFLQP8eeTGzfe1s64S8oJ5x0t81P1Axxp4MLiuWKQrUaL9LS6x4gWmp11CbNmTCQB/ykeN5foqayUSWfEFgTmIOAckG+QXwG3XXfDGuUIex0WbR/LLm+XKJMDKc8cXIBqhu03PiNKsE8mSCGM4BDQZ9GHJnn41uvnvHmRQuZ4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkRkYXJobjFGbEEvYi9TYllGOFJKS3lwM21ZQnB5Z3RkQzVPa0x2cHVQcHNq?=
 =?utf-8?B?alkvZnBGNFZKY3F6OEYxa3ZrTVRud0VEdjJPd2hGR3dybXhubjNNeFkwWThj?=
 =?utf-8?B?OEovc0ptbGhDcEhSbURtQVc1QVpUS29uZ21WR3pWdkdHZWxlVFU0SlhVMDJj?=
 =?utf-8?B?aEtnZy9YVkNkdjJOSnZmWVVFYmpsUU5rVlE0K2tLc1lMUGpIUXc3MGZ2L3hi?=
 =?utf-8?B?TlZRNWxyemJtemlSMXNZZG4wdi9iaW1wNUJ0WGhaY010MlRVNVJQbXExcWQr?=
 =?utf-8?B?MHhsNVA0d2p4aElkVk5uTzN2dVpDYWN2RTF2RWRNUGNzVW82Y2VDVkNIN1A5?=
 =?utf-8?B?ZHFZdWV3ODkrYjhyZDN0UVZQWlBRcGViT0JpKzJvMWFkZjNpa0FyU2RWUUxv?=
 =?utf-8?B?TGdtcUtqSW5qZjFGbFpmTzVUQmpaU0ZGd1RqSzZuSlZRMW4zU2Ntd2gzLzEz?=
 =?utf-8?B?aUd0Tk5TT1orejZuNzA3V3F1Y0xtd3Ezbjg2MmpnT1hLMWlGQ2JtSlE3MU9p?=
 =?utf-8?B?K0JENksyUDdpREp2dHVjdmZjb0pTTmh6YkZlcWptVVNxVVNSbVI0TTNVSk43?=
 =?utf-8?B?ZUhOUkt0ZnZMNkUvTmU3UmIwQ2xpQXFLQzlXUlphWFloWTNmVGtqTHpVNWZ3?=
 =?utf-8?B?SEtOaTdWNnZqei9UdTBha0U0blk4UXhySWlmdVppeklLRHEyY243SDZRaS9q?=
 =?utf-8?B?bUhBWGkzZEZJTEc3Sm5BZnFHSzN6QkpvaTh3RGlCZ1RVdXo2T3R4dU9zWGl5?=
 =?utf-8?B?aGFPekt3cnpvL0hlV0ZIOGl6eTlNd0RyRktoR0UrcEdYVUpDRUp4Zmx2cVBR?=
 =?utf-8?B?VVlwZTBpcFZwaWd0NUxydnVKMG5IUEQ0aXIweTNReWdlWFNEajNuaUJxcDA0?=
 =?utf-8?B?bThyNWo4SUJRKzZTSCt6b1lzZEovZitDR1VHRm9GdXlpK2o1cXR3MHJhOE1i?=
 =?utf-8?B?MVFOQjBOWnQ3MHFMVjRqdSt6ck1oZ3BpVDRlazVxUFRraGhob2Rtek5DT2gv?=
 =?utf-8?B?SzJJRFB3Zm1KV0pLQXlxQzRIMUFZZ295MEovWVNNRVg2K2VrNU5sa0VmZkJZ?=
 =?utf-8?B?VFRnTitKd21XS2FVMStUMEtYRlFvUlFOOWhJeC9vNC9wY1NVT3BCcTVSMWFL?=
 =?utf-8?B?WS9DdnZ3ZTZ1akNuam9YOVI1ZWc5TjNVVjBYa1kvcEQvT1cvbXUwMGNWNDR0?=
 =?utf-8?B?Vk1IK0E5cW1wTWJuSWFmNzJHTUZuczNRNlFSaWpXdFJhUzY5UXU2cjd0Z1FZ?=
 =?utf-8?B?RE9WYWRjR29tcnpiMkkyL3p1Vk5jbklDQWtJYVNjejMzVDNuOHVwN0VNSnhC?=
 =?utf-8?B?b0hDaEI0dU4ybDlrYVVDOURDMDUrSHRhQlB6by83cDczYnowWkFDYndpa201?=
 =?utf-8?B?QzY1VWoxRjUrdDdEcUR5MStjcWxVVzh3ZXAzZWZpUFNsVDVSTlRHUHZ1SThr?=
 =?utf-8?B?ZXk1L0RmRTRNbHFDWGpsV0ZlalFpSjkva1g5dDMrNUN3ZXBsaEMvS0VTUlVY?=
 =?utf-8?B?WFlpT0tnRFZTVy9PeUgrSVAyeitoQlczSWIrZHdJNFNlWGxGMFc4L2w1UDQ1?=
 =?utf-8?B?bFkwOUVxdjNzWm5tY0lkYW1PMWJTZXNNTDFRT0hjeWoyWjFFQ2RERjVacTFZ?=
 =?utf-8?B?Y2laZWR1QlFjUHhjejlOTTZyblBxVTBTbE1KQWdIYlVSVk1LcXBTbFZ4by9z?=
 =?utf-8?B?NFRYa2dhcTVzK2JHSmEzSlNzSEhocG5aamFQS0ZtWHd2dVZscWk5SjdtOStZ?=
 =?utf-8?B?M0J3WmlLNmY4TERFaS9KeGpPSXVaUTlNcDFpVzFoVE5qTjZxdWMrSDhlRnF0?=
 =?utf-8?B?a25UKy9vc3JPMkFZUTU5MUlKVnlINkE4V3haZGVWNFg4c1hjS2o1Q3RyYWNS?=
 =?utf-8?B?d3dpbkpGMGxxcEQyTnQwbHZVeXZERGR4OTUrTEw1VmJjYkY4WkVzL2RlVU1x?=
 =?utf-8?B?YmFPQ2orOUxlK3Jmay9hb0VsOE1vQ2dsZDBCR2NHbUNyWnZCejFIWFlTNW5E?=
 =?utf-8?B?YkFrMXFIUFcvWWh0TXB2eEg5cFB3OFZxOUNVMXc3dWtLMk5xR2JLR0owNXgx?=
 =?utf-8?B?OGIyaWpwYmphbkE0TGw2aVlWNC9oaGVnS0ViRnhDaEZMWDdoUWNpMy9MTElp?=
 =?utf-8?B?YXlYRHNFZGdjTFNkL1lGOFd5TzJ4UVkxTmZRRUhiN1c0UG9qTm8wN1lZNEor?=
 =?utf-8?B?TWdCcm84RG9VZHo2YlF5dUN1TzgwMlN5QVh4LzVrbkk1MFNzSWc4U2NraE1B?=
 =?utf-8?B?WXZzWjlwUHFvTElpUVp4bEZLc09ZMHgwLzhYdkRJNXdmVXFhb1doWXVXRTE5?=
 =?utf-8?B?WG10cXJ4aDNkNGNYNzBLb1RicWt0QTQxRllnMkl0WnJ2ZngzTEgyZz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a0c0f2-0ed1-43f7-6d84-08df18cffa58
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 17:36:04.9146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flD6J86GJxeA6r4r2gLLGRiR1tAIC3gmcMUd3r1J7UlJ5qmDccyQrqccmHThlX8HXAivf6KSTaTghoWbGBJsDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP123MB9062

On Tue, Sep 22, 2026 at 04:40:27PM +0200, Peter Zijlstra wrote:
> On Fri, Sep 11, 2026 at 09:32:40PM -0400, Aaron Tomlin wrote:
> > When investigating kernel panics, inspectability of per-CPU runqueues
> > and runnable task states is valuable for diagnosing CPU starvation
> > priority inversion, etc.
> > 
> > While debugfs (/sys/kernel/debug/sched/debug) exposes runqueue metrics
> > to userspace, these details are not captured during an automated kernel
> > panic or crash dump. Capturing per-CPU runqueue state directly into
> > log_buf fills this diagnostic gap for post-mortem crash analysis.
> 
> Uh, crash-dump preserves everything.

Hi Peter,

Yes, fair point. The intention here is to preserve this state directly
within the kernel log buffer, particularly for scenarios where kdump is not
configured, the vmcore was truncated or fails to complete.
In such circumstances, dmesg, whether captured via pstore or serial, is
frequently the sole surviving diagnostic artefact.

> 
> 
> >  	rcu_read_lock();
> >  	for_each_process_thread(g, p) {
> >  		if (task_cpu(p) != rq_cpu)
> >  			continue;
> >  
> > -		print_task(m, rq, p);
> > +		if (queued_only && !task_current(rq, p) && !task_on_rq_queued(p))
> > +			continue;
> > +
> > +		print_task(m, rq, p, show_cgroup_path);
> >  	}
> >  	rcu_read_unlock();
> >  }
> > @@ -1234,7 +1242,7 @@ do {									\
> >  	print_rt_stats(m, cpu);
> >  	print_dl_stats(m, cpu);
> >  
> > -	print_rq(m, rq, cpu);
> > +	print_rq(m, rq, cpu, true, false);
> >  	SEQ_printf(m, "\n");
> >  }
> >  
> > @@ -1322,6 +1330,48 @@ void sysrq_sched_debug_show(void)
> >  	}
> >  }
> >  
> > +void sched_show_runqueues(void)
> > +{
> > +	int cpu;
> > +
> > +	pr_info("CPU Runqueues:\n");
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
> 
> This seems to want to avoid deadlocking on rq->lock, but then
> print_rq()->print_cfs_stats() will unconditionally take rq->lock again.
> 
> So meh.

No, print_rq() does not call print_cfs_stats(). It is print_cpu() (i.e.
used by debugfs and SysRq) that calls print_cfs_stats() and unconditionally
takes rq->lock via print_cfs_rq().

With sched_show_runqueues(), it specifically avoids print_cpu() and only
calls print_rq(NULL, rq, cpu, false, true). Inside print_rq(), it merely
iterates threads under rcu_read_lock() and calls print_task(), neither of
which acquires rq->lock. Hence, rq->lock is never taken again, and the
non-blocking guarantee of the trylock remains intact throughout the entire
dump.

> 
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
> > +
> >  /*
> >   * This iterator needs some explanation.
> >   * It returns 1 for the header position.
> > diff --git a/lib/sys_info.c b/lib/sys_info.c
> > index f32a06ec9ed4..fc5bfcc121de 100644
> > --- a/lib/sys_info.c
> > +++ b/lib/sys_info.c
> > @@ -22,6 +22,7 @@ static const char * const si_names[] = {
> >  	[ilog2(SYS_INFO_PANIC_CONSOLE_REPLAY)]	= "",
> >  	[ilog2(SYS_INFO_ALL_BT)]		= "all_bt",
> >  	[ilog2(SYS_INFO_BLOCKED_TASKS)]		= "blocked_tasks",
> > +	[ilog2(SYS_INFO_CPU_RUNQUEUES)]		= "cpu_runqueues",
> >  };
> >  
> >  /*
> > @@ -158,6 +159,9 @@ static void __sys_info(unsigned long si_mask)
> >  
> >  	if (si_mask & SYS_INFO_BLOCKED_TASKS)
> >  		show_state_filter(TASK_UNINTERRUPTIBLE);
> > +
> > +	if (si_mask & SYS_INFO_CPU_RUNQUEUES)
> > +		sched_show_runqueues();
> >  }
> 
> I really don't know if this is worth the trouble. I have *never* needed
> this.

I understand. However, the requirement primarily arises in production
support. In environments where kdump is not configured or the resulting
vmcore is truncated, dmesg is frequently the sole surviving diagnostic
artefact.

During an NMI-induced panic, capturing per-CPU runqueue depth in the log is
invaluable for identifying CPU starvation, etc. As with the remainder of
sys_info, this functionality is strictly opt-in and disabled by default,
imposing no overhead on systems that do not require it while providing
vital visibility where full memory dumps are unavailable.

Kind regards,
-- 
Aaron Tomlin
