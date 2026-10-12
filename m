Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7C392822
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815463; cv=none; b=hp/Bl1Yeby58xqpdleUKRzFVLNo0ntTNgG18Dm+EzCHqb/szvzRZQlydapRMwoa3lGsrMiWcwsMisH5LmOnMpKda3yqWTzI5xAk0mXBQmGwy/wJKJlbgF2MdSVXvOzEd7py9jT61EedEfVrPHBi9yO3hRWV68gcLJJngDCLFBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815463; c=relaxed/simple;
	bh=LGgmqh2MLqir3C+8ZDFdMii09F46RRiDyfl38h29TQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSopm+Zv9KbUlzaLDf9CDh3x808u+kB2RzQ6v+DKHY4bnWikW9Np0nnChU/bG5Co/ZDMKToUU3dlCKc/Ng0V5WaWT0yqWN/+MFePvl+118IiePZ5dQm3s+0kGhufczXlfW6ufnEUzxluScpGo8bxrq6hDmG52ST629vlZBtuYKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AVb4Bt61; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AVb4Bt61"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CLjYLfxJnK6GkVOplIqun7ZyK1q9cTFbEiWppKDfqmo=; b=AVb4Bt61shNQuwqBuSkAOU71yH
	8zPas4dO7QmGnDrIqgV50vhOGSJNTZJM5DAlg8qKebQmvtnlwJPnAD+E4VSdtNraCVHS7X1/4Qo6B
	cMtSkyqgOatkaINQiD9Cz8cEhW/mNh4AXOogPS5YI888fhM2uR2H/Jt/8uLcOeP96crZNf4Q5+NJ8
	/Cosm0jhI/2fgD9gJbGV42+Xujw9N54QF2QFx/yDXBzaXBst1UkjwNShRc3WHOiK0UTYULMHmxLMj
	IOlaHh1N81sJF8x1KHDUsvUtl783sDI8J9ZvdfmLKAPVZPazjJxbBYSNNXcBtveXe7P1CvK55nv0I
	rHj9z1rg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH3A-00000005jxK-3qPm;
	Mon, 12 Oct 2026 14:30:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 04CCD30045A; Mon, 12 Oct 2026 16:30:48 +0200 (CEST)
Date: Mon, 12 Oct 2026 16:30:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC PATCH v2] sched: irq: cpu-hotplug race vs
 set_cpus_allowed_ptr()
Message-ID: <20261012143047.GV2009045@noisy.programming.kicks-ass.net>
References: <20261012103946.aOSAmrRe@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012103946.aOSAmrRe@linutronix.de>

On Mon, Oct 12, 2026 at 12:39:46PM +0200, Sebastian Andrzej Siewior wrote:
> syzbot reported a race of assigning a CPU affinity during CPU hotplug
> operation.
> After the affinity of an IRQ has been changed, the IRQ-core sets
> IRQTF_AFFINITY and wakes the relevant interrupt threads which need to
> adjust their affinity mask. The thread will then invoke
> set_cpus_allowed_ptr() to update the mask. Based on the new mask a CPU
> is chosen on which the thread should run.
> 
> It is verified that this CPU is online however there is no guarantee
> that this CPU remains online while affine_move_task() is moving _this_
> task. Since the current task requests the migration the stopper/
> migration_cpu_stop() is involved at which point the task pauses for a
> while. If the CPU goes offline (or is no longer cpu_online_mask) then
> __migrate_task() (due to is_cpu_allowed() reject) will return the rq of
> the CPU on which the task is currently running (which does not match
> it's task_struct::cpus_mask).
> 
> The aftermath:
> The IRQ-thread's CPU and task's cpus_mask do not match. A
> migrate_disable()-> schedule() will change task_struct::cpus_ptr
> ensuring that the following migrate_enable() will update the task to the
> requested affinity mask. At this point, affine_move_task() expects
> task_struct::migration_pending set but it is NULL because no one
> requested an affinity change while the task was in migrate-disable
> section.



> I see two ways of fixing this:
> - Holding the cpus_read_lock while set_cpus_allowed_ptr() is invoked.
>   This ensure that the CPU remains in the cpu_online_mask while the
>   migration task moving the task over. Should the mask be already
>   invalid, then it is rejected otherwise the operation completes.
> 
>   sashiko complains about deadlock of cpus_write_lock() in the CPU down
>   path and calling irq_migrate_all_off_this_cpu() vs
>   irq_thread_check_affinity() doing cpus_read_lock().
>   As far as I see, there is no deadlock because the mask is updated, the
>   tread is woken, the tread blocks with cpus_read_lock() until the CPU is
>   down.
>   There is nothing that waits for the interrupt thread to complete,
>   there is no synchronize_irq() invocation which would be required for
>   the deadlock to happen.

But any other set_cpus_allowed_ptr() call in the kernel can suffer the
same problem, no? Why is the irq thing 'special'?


> - Should __migrate_task() fail to return the requested rq make sure its
>   CPU is part task_struct::cpus_mask. This ensures that the current CPU
>   is still part of mask avoiding a possible push by migrate_enable().
>   sched_class::set_cpus_allowed did not see this mask. It might be a bit
>   inconsistent and feels a bit like select_fallback_rq() without the
>   printk.
> 
>   Sashiko complains:
> | If __migrate_task() fails (e.g., due to a concurrent CPU offline event), this
> | fallback code forcibly modifies p->cpus_mask with cpumask_set_cpu(). This
> | skips the required p->sched_class->set_cpus_allowed() callback and fails to
> | update p->nr_cpus_allowed.
> | Can this bypass global EDF real-time invariants for SCHED_DEADLINE (as
> | set_cpus_allowed_dl() is skipped), and allow unprivileged tasks to escape
> | affinity boundaries, giving them access to CPUs outside their cpusets?
> 
>   We did do_set_cpus_allowed() for CPU X and can't migrate there now. We
>   also don't know if the invocation was successful.
>   
>   Looking at this, it is not possible acquire the CPU-hotplug lock here
>   and not every caller holds it. This seems to be limited to
>   migrate-disable. Should this happen without the lock, then during the
>   wake-up the scheduler will just print "process … no longer affine to
>   cpu" pick a CPU and be done with it.
>   Maybe set the bit followed by do_set_cpus_allowed()?
> 
> Both changes are implemented to illustrate, one is enough.
> I can reproduce this back on v6.8, therefore I assume we have this since
> day #1 of migrate-disable.

I am struggling to follow along. The actual fail scenario is a
combination of hotplug *and* migrate_disable()? Can we get a picture?

A CPU must not be able to go offline while there are migrate_disable()
tasks on it. Are you saying the migrate_disable() happens after hotplug
already marks the CPU offline?

The thinking was that either:

 - task is asleep, and ttwu()/select_task_rq() picks a fallback
 - task is running, and __balance_push_cpu_stop() picks a fallback


There is a TLA+ model of all this somewhere; Valentin, do you remember?
That would have to be extended at the very least.


