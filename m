Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A557472F8A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088055; cv=none; b=dVL+HXlXFyznPqPPmthQ5jZv9h1tf6htGtWBfcgnrgahVVVsEdvs1FUQpi8CKcNv1mnxbQP4ukx8slbMLqNeMiuaO0vBQt0bupUwkrJtwKMICZYFLvUminVOiAbhopkQuiAgciIzjL9dBEdXsye6uA9N65+M4KDZvtFz1DyeKH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088055; c=relaxed/simple;
	bh=Y2z8PpC87S6NNUE4hw7Th9Az2O2bFUBZkD8UfzxBySE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m751H5G0IDmCeNlyQKSnVafClWm5VB7R8JzqVPG7Wa1fhiSHSazejRIw5gGkJGUFipWG5KJJrHRLqguEZPAhFTvpf0YPvIttr0mIUU0a9uIpbcAVWhzoQ7vQBMLb+ClPuyukFpiwAg+bRmyLk1DlqrxqbNwCDxexQKU8fQo+bLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mL7IFaHT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mL7IFaHT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KyMxkC6VxH1bZFwzm+ssFP6a+bO4tuiB/LDpPOqNJR0=; b=mL7IFaHToT8AFy8uj6FlxetQzn
	H2Qd7tw/Xl7Ns71U/kJihXkM+2AJssuvRCZ41oPiprzsPVJxBfEZfy5iNurSml6uRQ6SAMvlUqYOe
	Ed9fp6+Mldofy3be5aRr1oyXVyhxk2afAjT9au9J42DokmtJ1dmJ/yZT+6PXzGEUCPfvEmUf8t2id
	JksR0aIJkjyC7OYIDRwYWM85mAdnu20V00eAlJjvgHJURUKx7x1drGS+SU1TEBUBC00YRKmOBWM0b
	J7bVLTxBHIjTMPgoJRLcV3Ff99ArcrbAekTala6bXPIJ59FqUNznPGPaUgE37tvKePVYMZzildwmS
	PKgq7sMA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x91fY-0000000DhVN-2wTd;
	Tue, 22 Sep 2026 14:40:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3B249300708; Tue, 22 Sep 2026 16:40:27 +0200 (CEST)
Date: Tue, 22 Sep 2026 16:40:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: akpm@linux-foundation.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, feng.tang@linux.alibaba.com, pmladek@suse.com,
	kprateek.nayak@amd.com, rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/debug, sys_info: Introduce
 SYS_INFO_CPU_RUNQUEUES
Message-ID: <20260922144027.GT776954@noisy.programming.kicks-ass.net>
References: <20260912013240.545742-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912013240.545742-1-atomlin@atomlin.com>

On Fri, Sep 11, 2026 at 09:32:40PM -0400, Aaron Tomlin wrote:
> When investigating kernel panics, inspectability of per-CPU runqueues
> and runnable task states is valuable for diagnosing CPU starvation
> priority inversion, etc.
> 
> While debugfs (/sys/kernel/debug/sched/debug) exposes runqueue metrics
> to userspace, these details are not captured during an automated kernel
> panic or crash dump. Capturing per-CPU runqueue state directly into
> log_buf fills this diagnostic gap for post-mortem crash analysis.

Uh, crash-dump preserves everything.


>  	rcu_read_lock();
>  	for_each_process_thread(g, p) {
>  		if (task_cpu(p) != rq_cpu)
>  			continue;
>  
> -		print_task(m, rq, p);
> +		if (queued_only && !task_current(rq, p) && !task_on_rq_queued(p))
> +			continue;
> +
> +		print_task(m, rq, p, show_cgroup_path);
>  	}
>  	rcu_read_unlock();
>  }
> @@ -1234,7 +1242,7 @@ do {									\
>  	print_rt_stats(m, cpu);
>  	print_dl_stats(m, cpu);
>  
> -	print_rq(m, rq, cpu);
> +	print_rq(m, rq, cpu, true, false);
>  	SEQ_printf(m, "\n");
>  }
>  
> @@ -1322,6 +1330,48 @@ void sysrq_sched_debug_show(void)
>  	}
>  }
>  
> +void sched_show_runqueues(void)
> +{
> +	int cpu;
> +
> +	pr_info("CPU Runqueues:\n");
> +	for_each_online_cpu(cpu) {
> +		struct rq *rq = cpu_rq(cpu);
> +		struct task_struct *curr;
> +		unsigned int nr_running;
> +		u64 nr_switches;
> +		unsigned long flags;
> +		bool locked;
> +
> +		touch_nmi_watchdog();
> +		touch_all_softlockup_watchdogs();
> +
> +		rcu_read_lock();
> +		local_irq_save(flags);
> +		locked = raw_spin_rq_trylock(rq);
> +		if (locked) {
> +			nr_running = rq->nr_running;
> +			nr_switches = rq->nr_switches;
> +			curr = rcu_dereference(rq->curr);
> +			raw_spin_rq_unlock(rq);
> +		} else {
> +			nr_running = READ_ONCE(rq->nr_running);
> +			nr_switches = READ_ONCE(rq->nr_switches);
> +			curr = rcu_dereference(rq->curr);
> +		}
> +		local_irq_restore(flags);

This seems to want to avoid deadlocking on rq->lock, but then
print_rq()->print_cfs_stats() will unconditionally take rq->lock again.

So meh.

> +
> +		pr_info("cpu#%d: nr_running:%u switches:%llu curr:%s[%d]%s\n",
> +			cpu, nr_running, nr_switches,
> +			curr ? curr->comm : "<none>",
> +			curr ? task_pid_nr(curr) : -1,
> +			locked ? "" : " (contended)");
> +
> +		print_rq(NULL, rq, cpu, false, true);
> +		rcu_read_unlock();
> +	}
> +}
> +
>  /*
>   * This iterator needs some explanation.
>   * It returns 1 for the header position.
> diff --git a/lib/sys_info.c b/lib/sys_info.c
> index f32a06ec9ed4..fc5bfcc121de 100644
> --- a/lib/sys_info.c
> +++ b/lib/sys_info.c
> @@ -22,6 +22,7 @@ static const char * const si_names[] = {
>  	[ilog2(SYS_INFO_PANIC_CONSOLE_REPLAY)]	= "",
>  	[ilog2(SYS_INFO_ALL_BT)]		= "all_bt",
>  	[ilog2(SYS_INFO_BLOCKED_TASKS)]		= "blocked_tasks",
> +	[ilog2(SYS_INFO_CPU_RUNQUEUES)]		= "cpu_runqueues",
>  };
>  
>  /*
> @@ -158,6 +159,9 @@ static void __sys_info(unsigned long si_mask)
>  
>  	if (si_mask & SYS_INFO_BLOCKED_TASKS)
>  		show_state_filter(TASK_UNINTERRUPTIBLE);
> +
> +	if (si_mask & SYS_INFO_CPU_RUNQUEUES)
> +		sched_show_runqueues();
>  }

I really don't know if this is worth the trouble. I have *never* needed
this.
