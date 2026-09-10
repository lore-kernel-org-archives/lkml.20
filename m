Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0B4BE458
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057010; cv=none; b=I80lWhdC1LDn2dj4dj6HMDe3j/UI9AjHlqwoOclbLQW7MCIfByDKfiEJlCm7mya42TfQx7CFYSIqMhi10j+KARngPDLHWXJMNuN9+XvWru42D1eBH5Ao3iUrG9Z6bkWoTXnoT4N1J/d+OsVvwrv+ur93ENRZ3zcVqHcXjZY4xJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057010; c=relaxed/simple;
	bh=QDGWKUSpA0ZxHvVTbH1yKMTLunO9/wQIEeTzRMkY/lo=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=GMmKz6yqzPs1v/0tiNeaO6kWnTvbqUU0DWK7XCFiFny+Wahs3mUoJiPwSXc3Euo+jm8XRR52FLFLcJfE678C190lwhI0eEb9Pr4F6JH5dogVS8aX31s5w+Xd+888jAy6Wp8rn7gBRjnsy+yqe6jkAtYEx3bFfi1IZraVipvpCl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=g005xAPn; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=haXWtvhw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="g005xAPn";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="haXWtvhw"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789056976; bh=IfiZIFA+uddWj5w+6qVw4wd
	Bpqh5AzV1R1JudCc2O68=; b=g005xAPnqiFJYtToI8zm1VrfD7+Gk/sTCicCOgKMV1K1kqaWrE
	zmBy2AdIx1+Oy7VaXk+yOwHDvkeGulDVT2ut802AJGKwMqstxl66Nd1DsI5EvG5qp/RXz77RliA
	zakUJUR4rdJ3GOBweuEaCd/PwNPaHMqgETJ7j4GnLWr6Y3Dom//gM/XtEx6I6dWozGmgRaT2FIa
	ifRHOGRaXWVlwRHmoumVxYgpqrTn/WKYNcSc/ocfty31XI+odU5YAuesz/Ghc2+PY9bwWkJF+pS
	4ffQShDFkRhEfwugCZt9raCj+8laF419wkXSGOm6h3P58rpeOyuhZ3qIkAK6N5sElKg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789056976; bh=IfiZIFA+uddWj5w+6qVw4wd
	Bpqh5AzV1R1JudCc2O68=; b=haXWtvhwlldi1kZ3vzeZidaJE7SEQBoJk3mVo+rbWHcH99qQbN
	b1a4Ksx7esNMdjTBWgMHOql0cnUhegsOYoAg==;
Date: Thu, 10 Sep 2026 17:16:17 +0100
From: Bradley Morgan <brads@mainlining.org>
To: aditya.chillara@oss.qualcomm.com
CC: john.ogness@linutronix.de, linux-kernel@vger.kernel.org, pmladek@suse.com,
 rostedt@goodmis.org, senozhatsky@chromium.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_stop=5Fmachine=3A_Defer_legacy_cons?=
 =?US-ASCII?Q?ole_flushes_while_a_CPU_runs_a_stopper_callback?=
In-Reply-To: <20260910-defer-legacy-console-write-on-multi_cpu_stop-v2-1-88324d2f4e7f@oss.qualcomm.com>
Message-ID: <87984398-AD80-4AC8-B5FD-21219BA85FD5@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 10 September 2026 04:53:55 BST, Aditya Chillara
<aditya.chillara@oss.qualcomm.com> wrote:
>The cpu stopper thread runs above every other scheduling class, so while a
>stopper callback executes, nothing else on that CPU is scheduled. If such
>a
>callback emits a normal-priority printk(), the legacy console path can
>synchronously flush the pending console backlog. On systems with a slow
>UART and a large backlog, this holds the CPU long enough to starve RT
>kthreads such as the watchdog pet, and for multi_cpu_stop() prevents the
>CPU from advancing the state machine while the other CPUs wait.
Oh!

>The
>resulting delay can prevent watchdog servicing long enough to trigger a
>watchdog bark or bite.
>
>The same can happen from an interrupt taken during the callback:
>multi_cpu_stop() keeps interrupts enabled during MULTI_STOP_PREPARE, and a
>printk() may be emitted from a softirq run on irq exit.
>
>Run CPU stopper callbacks in printk-deferred context to prevent legacy
>console flushes while they execute.
>

Wow! Thanks

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
>---
>A device using a legacy UART console (console=ttyMSM0,115200n8) hit a
>watchdog bark/bite about 40 seconds after boot.
>

Which SOC?

>stop_machine() (used here for kprobe text patching) stops every CPU by
>running multi_cpu_stop() on each of them, through the per-CPU
>"migration/%u" threads. These threads run at a higher priority than the
>msm_watchdog thread. At bite time, all eight CPUs were still spinning in
>multi_cpu_stop()'s MULTI_STOP_PREPARE state, where interrupts are left
>enabled.
>
>Heavy SELinux denial logging had built up a large backlog on the
>console. One CPU took an interrupt while spinning in MULTI_STOP_PREPARE.
>Handling it eventually led to a printk(), and because the console was a
>legacy console, that printk() synchronously drained the whole backlog
>over the slow UART. While the drain was still running, the watchdog bark
>interrupt hit the same CPU, found no recent pet, and escalated to a
>bite.
>
>The captured stack for that CPU, innermost frame first:
>
>  qcom_soc_set_wdt_bite
>  qcom_wdt_bark_handler
>  __handle_irq_event_percpu
>  handle_irq_event
>  handle_fasteoi_irq
>  generic_handle_domain_irq
>  gic_handle_irq
>  do_interrupt_handler
>  el1_interrupt
>  el1h_64_irq_handler
>  el1h_64_irq
>  console_flush_all
>  console_unlock
>  vprintk_emit
>  dev_vprintk_emit
>  dev_printk_emit
>  __dev_printk
>  _dev_err
>  btspi_sleep_timeout_handler
>  call_timer_fn
>  __run_timer_base
>  run_timer_softirq
>  handle_softirqs
>  __do_softirq
>  ____do_softirq
>  call_on_irq_stack
>  do_softirq_own_stack
>  __irq_exit_rcu
>  irq_exit_rcu
>  el1_interrupt
>  el1h_64_irq_handler
>  el1h_64_irq
>  multi_cpu_stop
>  cpu_stopper_thread
>  smpboot_thread_fn
>  kthread
>  ret_from_fork

Same question as above, but a added "Is this a modern SOC?"

>
>Every other CPU stayed parked in the rendezvous the whole time, since
>their stopper threads outrank msm_watchdog. Nothing could pet the
>watchdog until the drain finished.
>
>This was observed through multi_cpu_stop(), but the hazard is not
>specific to it. Every cpu stopper callback runs in stop_sched_class,
>above msm_watchdog and every other thread on the CPU, so a slow flush
>from any of them (including single-CPU callbacks such as the migration
>and task-migration stoppers) can starve the watchdog just as well. The
>fix therefore covers all stopper callbacks, not only multi_cpu_stop().
>
>Fix this by running the CPU stopper callbacks in printk-deferred context.
>
>Reproduced and verified with an out-of-tree test module that triggers
>stop_machine() with a queued console backlog and a printk() inside the
>rendezvous, paired with a kprobe-based script that flags any console
>flush happening while a CPU is inside a stopper callback.

Hmm, interesting, could you provide what you did? (Not in the description,
but to me so I can have a look at it)


>---
>Changes in v2:
>- Use printk_deferred_enter/exit() to defer legacy console flushes instead
>  of in_cpu_stop().
>- Link to v1: https://patch.msgid.link/20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com
>---
> kernel/stop_machine.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
>index d085ba1f4b44..31f7af41249f 100644
>--- a/kernel/stop_machine.c
>+++ b/kernel/stop_machine.c
>@@ -507,7 +507,9 @@ static void cpu_stopper_thread(unsigned int cpu)
> 		stopper->caller = work->caller;
> 		stopper->fn = fn;
> 		preempt_count_inc();
>+		printk_deferred_enter();
> 		ret = fn(arg);
>+		printk_deferred_exit();

Clean! :)

> 		if (done) {
> 			if (ret)
> 				done->ret = ret;
>
>---
>base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
>change-id: 20260824-defer-legacy-console-write-on-multi_cpu_stop-d3ef6f6b150b
>
>Best regards,
>--  
>Aditya Chillara <aditya.chillara@oss.qualcomm.com>
>
>
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
