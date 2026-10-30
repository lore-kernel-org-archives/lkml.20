Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370313;
	b=Z2ASDAmTka/jnjW66Ivw6DK9pnK2vNrwj3oRTvfeccZQgPSe7llEJuiakU2CBV3TNhme
	 EgdOMsniOqSaN1srtl7ao0GZjLrEu+/jnFUrWofswUhXWdGhxjiqlviyisCbvatwDwVEz
	 W2nfv2e+jmybFK36phXGY1U+zHGvi4pogZOPDDDsY88JLnuAQ6Pep5Yn+LaBP5WPZSavH
	 quHgrO9vV0HXq3/WopsiDNMOh+bheGWRo1QdQzJcmo6+4/FKPxe9b3kK289TM8TDU7Z6B
	 xsU3nuEcWYsoIw5RJpGwthnZw6G06jcsDqMYqARhoOBvBmiW1w+PmJR8YSlox/vhbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370313;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MGVaOZX62QNtOidP1MYg8O90e6ZEkAc58ZUQbuvc14s=;
	b=D483iaGZDWzXxBVRVsY5gP/tunFSulqa51rf5M3e7u7XRHMfu6WXVfQalyL2q8CNuLXS
	 Npi/miEO/Vf7U7DEnhy/XWKqBsEgmLjmJaI2I0TtB06oGMQAGmdMQHvkioz7W54xt26sq
	 2bY10HFVapLddtbzBswWwOoF7vT5gNfiOHmOBUoEhk9M3Lvethz1WzqcbUtMI2KQepFJz
	 m7XGtaHs+Ga5KszbbP1kkvXANmqrNijAgu9BAxZoavTNvufKVoX3zlDCnMyc6NdbeBU1X
	 2ZUD1qLwbJB4zAU/ngQ8/sigjBR2DssUsNbkVbDrRQOiSFrjgVD+kIob66sFxV6QEmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWS5bIXf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD75606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWS5bIXf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421151F000C1;
	Fri, 30 Oct 2026 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793370313;
	bh=MGVaOZX62QNtOidP1MYg8O90e6ZEkAc58ZUQbuvc14s=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=cWS5bIXf+XIXia3oxdZRWq1FVnFpwhazVkp3oVVMGaoANXG07Ye7QH2qS5pb2YUyn
	 KKM2yyWPJPGWbccST9ox3FJjRCAe+HvrXcFgBg+D5Gjj/KIS1ykcE3BQfoPdOdJqMS
	 3tlCu7KWhOGX8NP8XvQrtwoaG9SHsFelcn8py7/hhzv3cVGZsEvhLFvfPtSsrT15Nu
	 PlsSKdiS0eDRpZ0km2nbc5ApeFlQ9+UpP5H2HVYbxMOwYCyB/GTqmsHsVzBVmrbskn
	 23ViA0BWBg6rt72ijdGqWSot8hwSyQEbSQifOOsvs0QqC/k9WSi67tDxkUxrW7FIWl
	 ZHc4HfCXj/hAw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0173DCE09CD; Fri, 30 Oct 2026 07:25:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:25:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Kees Cook <kees@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [BUG] KCSAN cannot find frame in stack trace
Message-ID: <35116d04-624a-4a5b-b586-b8cc43192d34@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <97f6213a-1dec-494e-96d1-abe546bce993@paulmck-laptop>
 <auRWcyCJehRIi287@elver.google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auRWcyCJehRIi287@elver.google.com>

On Fri, Oct 30, 2026 at 08:33:55AM +0000, Marco Elver wrote:
> On Thu, Oct 29, 2026 at 05:10PM -0700, Paul E. McKenney wrote:
> > Hello!
> > 
> > I am seeing the following (very) intermittent spat when running
> > the rcutorture script torture.sh on recent -next (starting about
> > next-20261014) with KCSAN enabled:
> 
> I think there's no reason why this should happen more often. Maybe the
> torture testing or your system became better at exposing this?

Quite possibly.  An effective test suite never stands still.  ;-)

> [...]
> > This is the code at line 344 of kernel/kcsan/report.c:
> > 
> > 	/* Should not happen; the resulting stack trace is likely misleading. */
> > 	WARN_ONCE(1, "Cannot find frame for %pS in stack trace", (void *)ip);
> > 
> > This does not happen often enough for reasonable bisection.  However, the
> > alleged fix below does seem to prevent this from happening.  This alleged
> > fix should of course be considered to be part of the bug report: I am
> > *not* claiming that it is a proper fix.
> > 
> > The diagnosis sounds plausible to me, but perhaps not to those who
> > understand the affected code better than I do.  And I don't know why
> > this wouldn't have been showing up earlier.
> > 
> > Thoughts?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > LLM alleged fix:
> > ------------------------------------------------------------------------
> > 
> > kcsan: reset per-task KCSAN state in dup_task_struct
> 
> Yes, it's very plausible and the stack-trace and WARN all line up.

Whew!!!

> We don't need to reset kcsan_save_irqtrace as that's guaranteed to be
> overwritten before reading out again.
> 
> Updated fix below; it's basically identical, except for
> kcsan_save_irqtrace. Let me know if I can either add your
> SOB+Co-authored-by, or you send it out as a PATCH yourself.

Please do send it out.  A Reported-by will more than suffice.  It is
not like I put any of my own effort into that patch.  ;-)

But if (and only if) your procedures absolutely require it:

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

							Thanx, Paul

> Thanks,
> -- Marco
> 
> ------ >8 ------
> 
> From: Marco Elver <elver@google.com>
> Date: Fri, 30 Oct 2026 00:46:03 +0000
> Subject: [PATCH] kcsan: Reset per-task KCSAN state on fork
> 
> arch_dup_task_struct() copies the parent's task_struct verbatim, which
> includes kcsan_ctx and kcsan_stack_depth; nothing reinitializes them for
> the child.
> 
> With CONFIG_KCSAN_WEAK_MEMORY this leaks a live reorder_access: an
> access whose simulated reordering is only valid until the parent returns
> from the frame that performed it (tracked via kcsan_stack_depth and
> cleared by __tsan_func_exit()). The child inherits both the entry and
> the parent's stack depth, but never returns through the parent's frames,
> so the entry is never invalidated and is replayed on every subsequent
> check_access() of the child.
> 
> The most direct way to hit this is the copy itself: __tsan_memcpy()
> runs check_access() on the destination before copying. If that access is
> selected for a watchpoint, set_reorder_access() records it (ptr = the
> child's task_struct, ip in arch_dup_task_struct()) in the parent's ctx,
> and the memcpy then copies that entry into the child. For an idle task
> created by fork_idle(), the stale access covers thread_info.flags, which
> other CPUs frequently access, resulting in false positive reports and:
> 
>   WARNING: kernel/kcsan/report.c:344 at sanitize_stack_entries+0x120/0x12c
>   Cannot find frame for arch_dup_task_struct+0x40/0x154 in stack trace
>   ...
>   Call trace:
>    sanitize_stack_entries+0x120/0x12c (P)
>    print_report+0x84/0x488
>    kcsan_report_known_origin+0x14c/0x1ec
>    kcsan_setup_watchpoint+0x578/0x864
>    __kcsan_check_access+0x1ec/0x1f8
>    do_raw_spin_lock+0xa4/0x1c4
>    _raw_spin_lock+0x70/0x88
>    rcutree_report_cpu_starting+0x1ac/0x4b8
>    secondary_start_kernel+0xe8/0x28c
>    __secondary_switched+0xc0/0xc4
> 
> Reset the child's KCSAN state in dup_task_struct() after the copy,
> alongside the existing kcov/kmsan initializers.
> 
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Link: https://lore.kernel.org/all/97f6213a-1dec-494e-96d1-abe546bce993@paulmck-laptop/
> Fixes: 69562e4983d9 ("kcsan: Add core support for a subset of weak memory modeling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  include/linux/kcsan.h | 10 ++++++++++
>  kernel/fork.c         |  2 ++
>  kernel/kcsan/core.c   | 16 ++++++++++++++++
>  3 files changed, 28 insertions(+)
> 
> diff --git a/include/linux/kcsan.h b/include/linux/kcsan.h
> index c07c71f5ba4f..c7e9d15dd7bd 100644
> --- a/include/linux/kcsan.h
> +++ b/include/linux/kcsan.h
> @@ -13,6 +13,8 @@
>  #include <linux/kcsan-checks.h>
>  #include <linux/types.h>
>  
> +struct task_struct;
> +
>  #ifdef CONFIG_KCSAN
>  
>  /*
> @@ -66,9 +68,17 @@ struct kcsan_ctx {
>   */
>  void kcsan_init(void);
>  
> +/**
> + * kcsan_task_init - initialize KCSAN state of a new task
> + *
> + * @task: task to initialize; must have been copied from its parent already.
> + */
> +void kcsan_task_init(struct task_struct *task);
> +
>  #else /* CONFIG_KCSAN */
>  
>  static inline void kcsan_init(void)			{ }
> +static inline void kcsan_task_init(struct task_struct *task) { }
>  
>  #endif /* CONFIG_KCSAN */
>  
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 5ef413368912..62a096ca8dce 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -93,6 +93,7 @@
>  #include <linux/compiler.h>
>  #include <linux/sysctl.h>
>  #include <linux/kcov.h>
> +#include <linux/kcsan.h>
>  #include <linux/livepatch.h>
>  #include <linux/thread_info.h>
>  #include <linux/kstack_erase.h>
> @@ -986,6 +987,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
>  
>  	kcov_task_init(tsk);
>  	kmsan_task_create(tsk);
> +	kcsan_task_init(tsk);
>  	kmap_local_fork(tsk);
>  
>  #ifdef CONFIG_FAULT_INJECTION
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index a3aa5e5b039d..d19d60ad007a 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -828,6 +828,22 @@ void __init kcsan_init(void)
>  	}
>  }
>  
> +void kcsan_task_init(struct task_struct *task)
> +{
> +	/*
> +	 * arch_dup_task_struct() copies the parent's kcsan_ctx verbatim,
> +	 * including a reorder_access that is still live in the parent's frame
> +	 * (e.g. the write of the copy itself). The child never returns through
> +	 * that frame, so it would replay the stale access indefinitely, causing
> +	 * false positives and "Cannot find frame" warnings in replace_stack_entry().
> +	 */
> +	memset(&task->kcsan_ctx, 0, sizeof(task->kcsan_ctx));
> +	task->kcsan_ctx.scoped_accesses = (struct list_head){ LIST_POISON1, NULL };
> +#ifdef CONFIG_KCSAN_WEAK_MEMORY
> +	task->kcsan_stack_depth = 0;
> +#endif
> +}
> +
>  /* === Exported interface =================================================== */
>  
>  void kcsan_disable_current(void)
> -- 
> 2.56.0.317.g454f8302e1-goog
> 
