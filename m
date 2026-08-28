Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7F3E1CE1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907279; cv=none; b=pUmJeUGRsst+AudUz/SPiOOO9iDI6NXsSRD+/I649QBoaNSqDG2jbFXOy7Gj3BzjIh0fUOmm8Kc6gK54ygbRi2op+yVMgwOSY/FswiZ8SMx7hdQsuy7OFd05t8qm8dZnoSJAwKWCdu9fD6trtB2C2IObf4+JKyYGTJJLKwp7fXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907279; c=relaxed/simple;
	bh=goqDZqgGKZx/JXeB8KIp8z16eqZegUb8srt3Eace9aE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=anNA7waQgBbwV1BTMyvW+/KStX2lyvkMF4sErHx0RDMbHXPJcARLT5SRiax/hyWaGUs6LnuiiLORwXzbgP2Hjmo4fk0kUzYYbwm+cDajEhZLIjSkS6rJZ5stK549mPWY19Sv8bFrkbpeH+jjhIYukigUAg/9q6nKOJqcuaoZn0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EmwKjJsZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Od6NBhQE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EmwKjJsZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Od6NBhQE"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787907269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x967szcbJfDjbDgAb8otvTblv1FN1CnHf+XT/9p44FU=;
	b=EmwKjJsZZQUWjLo7K3j0birD+kbhQdKSReSEIupdARa3p2qSHf5+68C1Jaemk2VQL+VWKM
	1AbGtOLp+RzeY9x/8R0fAWFIhlWaGaDLs2BE54i6L6/VhO0PzYU/M+YyC9ZIkIv1fGFroT
	y0X32XdJPf6PJSpDnmHUdyhbtDMQFDIqm49nD9llxVn1OiuhXvH01vOFvSUREbDcthpHjx
	Svfih+m10gZGlivkwL2yyTy1ZrwU8qQSVvsKWJLp4u9n/LbmqLNp/X+O3z6xJpoSyo0cRf
	geMr1FHgbs387xxBk94rWE1x6l21Q427z3OZOFYCacJfjlhMwOn1nQIDsVIg5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787907269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x967szcbJfDjbDgAb8otvTblv1FN1CnHf+XT/9p44FU=;
	b=Od6NBhQE0pbmvbwl0R+mG2LuDFqzZ4LXLjfkh4yJVkl+cH1fDPjRW5FPvZov8p9h3UqI9a
	sn2gT92jDakxSRDA==
To: Aditya Chillara <aditya.chillara@oss.qualcomm.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, Aditya Chillara
 <aditya.chillara@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] printk/stop_machine: Defer legacy console flushes
 while a CPU runs a stopper callback
In-Reply-To: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
References: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 11:00:28 +0206
Message-ID: <87o6emy69n.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Aditya,

On 2026-08-27, Aditya Chillara <aditya.chillara@oss.qualcomm.com> wrote:
> A device using a legacy UART console (console=ttyMSM0,115200n8) hit a
> watchdog bark/bite about 40 seconds after boot.
>
> stop_machine() (used here for kprobe text patching) stops every CPU by
> running multi_cpu_stop() on each of them, through the per-CPU
> "migration/%u" threads. These threads run at a higher priority than the
> msm_watchdog thread. At bite time, all eight CPUs were still spinning in
> multi_cpu_stop()'s MULTI_STOP_PREPARE state, where interrupts are left
> enabled.
>
> Heavy SELinux denial logging had built up a large backlog on the
> console. One CPU took an interrupt while spinning in MULTI_STOP_PREPARE.
> Handling it eventually led to a printk(), and because the console was a
> legacy console, that printk() synchronously drained the whole backlog
> over the slow UART. While the drain was still running, the watchdog bark
> interrupt hit the same CPU, found no recent pet, and escalated to a
> bite.
>
> The captured stack for that CPU, innermost frame first:
>
>   qcom_soc_set_wdt_bite
>   qcom_wdt_bark_handler
>   __handle_irq_event_percpu
>   handle_irq_event
>   handle_fasteoi_irq
>   generic_handle_domain_irq
>   gic_handle_irq
>   do_interrupt_handler
>   el1_interrupt
>   el1h_64_irq_handler
>   el1h_64_irq
>   console_flush_all
>   console_unlock
>   vprintk_emit
>   dev_vprintk_emit
>   dev_printk_emit
>   __dev_printk
>   _dev_err
>   btspi_sleep_timeout_handler
>   call_timer_fn
>   __run_timer_base
>   run_timer_softirq
>   handle_softirqs
>   __do_softirq
>   ____do_softirq
>   call_on_irq_stack
>   do_softirq_own_stack
>   __irq_exit_rcu
>   irq_exit_rcu
>   el1_interrupt
>   el1h_64_irq_handler
>   el1h_64_irq
>   multi_cpu_stop
>   cpu_stopper_thread
>   smpboot_thread_fn
>   kthread
>   ret_from_fork
>
> Every other CPU stayed parked in the rendezvous the whole time, since
> their stopper threads outrank msm_watchdog. Nothing could pet the
> watchdog until the drain finished.
>
> This was observed through multi_cpu_stop(), but the hazard is not
> specific to it. Every cpu stopper callback runs in stop_sched_class,
> above msm_watchdog and every other thread on the CPU, so a slow flush
> from any of them (including single-CPU callbacks such as the migration
> and task-migration stoppers) can starve the watchdog just as well. The
> fix therefore covers all stopper callbacks, not only multi_cpu_stop().
>
> Fix this by having the cpu stopper mark the CPU active while a callback
> runs, and having printk use that marker to defer legacy console flushes
> until the callback returns:
>
>   1/2 stop_machine: Track when a CPU executes a stopper callback
>
>       Add a per-CPU flag, set in the stopper dispatch path around the
>       callback, and an in_cpu_stop() accessor.
>
>   2/2 printk: Defer legacy console flushes while a CPU runs a stopper callback
>
>       Route legacy console output through the offload path instead of
>       flushing it directly while a CPU is inside a stopper callback, and
>       flush it once the callback returns. Emergency and panic output is
>       unaffected.
>
> Reproduced and verified with an out-of-tree test module that triggers
> stop_machine() with a queued console backlog and a printk() inside the
> rendezvous, paired with a kprobe-based script that flags any console
> flush happening while a CPU is inside a stopper callback.

Generally speaking, we are not taking the whack-a-mole approach to
workaround all the known legacy console problems (there are a lot of
them!). However, if there are problems that occur during normal usage
(as opposed to crafted tests), then we can insert workarounds.

For workarounds of known legacy console problems we have the deferred
enter/exit functions. These only affect legacy consoles and literally
exist for these purposes. I would expect the following patch would also
solve your problem.

John Ogness

diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
index d085ba1f4b44e..31f7af41249f1 100644
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -507,7 +507,9 @@ static void cpu_stopper_thread(unsigned int cpu)
 		stopper->caller = work->caller;
 		stopper->fn = fn;
 		preempt_count_inc();
+		printk_deferred_enter();
 		ret = fn(arg);
+		printk_deferred_exit();
 		if (done) {
 			if (ret)
 				done->ret = ret;
