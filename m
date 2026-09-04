Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590BA46EF64
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519995; cv=none; b=Ft1caa+AMsRfLm9JgDMsggAgCE3xEb8kCBu6f5qGrmRuuLup233WC/jRujmlDsx+0WkRepulwoJyPEll9zvX6PnEgLk3nLReyXu2gzunKAmik6YPIHJgWA9Y22Hd4/qsx4eRP23qQ9O4rLX10R2vHqQMUBUoYkYdrIPAyzAutWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519995; c=relaxed/simple;
	bh=w61n32K7yju7ZBZSoaJ7YUaVGJsA65OE5vqupbVdfuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfPfupHGphGApv6RPgtAcavZgsvmoJfDVaZXtHlD+hlrnPCxmxGNcLOomznVnNTQqWQv9+Qn+44rSt00P3hi8u59jCDONimRTE8JZfvNOCzyH93jKnt3+bIlJbjeIYcBsJPpktEYlNJxQz7Lz0e1T23PoHheo9+dNWfOX8pnoYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MoFnhj+h; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MoFnhj+h"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a682579c72so1058441a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788519989; x=1789124789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w8c0zgCdZSXgeITpMZz/Cd5zd6jUWTEuCO88FJazoaM=;
        b=MoFnhj+hLz0GZUtOH6vGsGe1frAO5pWV6S9cuKDXl8IsqVCT6r4bslOJiLoUrXZb7W
         jz5uSsxJuwXLQWb8vrvHDFuby7qvV9t2NkQ/RR0ype0LW47cFas3SvVeGJCyUIsKKCht
         omqnULLGaylf9TP3uNDrfQY0W1MazIdS5YjC2irE9UjhnnolvmXewV+8l64Gk3rMl4A1
         r/Gp0KOP8y0QQpXKSq0ODelgVylZhFUbEx5WaSrmUoryeG8AsXoz+6gqJtbxfbkfUvY8
         3rd3YBf53l7yOUrUaW0/pyzId+Ps6wH+D2YBhUOdMCFsbjnSiAfJKY3Lt+G9ENvA4iqC
         Z2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519989; x=1789124789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8c0zgCdZSXgeITpMZz/Cd5zd6jUWTEuCO88FJazoaM=;
        b=cW4DrMtlH3KNZUfw769v/2CpJI+0qE0124coZfoKBUtGpf5xPevJJEoP2DH+iw6btR
         tBfUvNeN6xtXiMR66RJqqlYD+4r0+0/utZ30/rcpOFNLtjQnIYbobGciWFX2aiNokqQj
         M2DE4etbzuUqF4S9mZfCVjDKBCqQXIoJ5jVNcPI0oj9sqN+hJku3fMjherzXHEpjGrHa
         pP7/93yujMVuaUJ+8pqSY6vSFnnh2dfR3lNYOrJ4iYXPrI5ncUzXeMCixKR+PMWKm3at
         g/fJ0SdDKbpiegiQsYKDfuOOFzZQX45Q7VltvFfOurg4IzFg0lPhCGZZyqUbSDOQsWPe
         3VPw==
X-Forwarded-Encrypted: i=1; AKwUvBzxo+kJrAj+bEyioDo1WthTWNSzohqbZghk2IiK2FihcUJDBkmCpoKCHoDD/Seieb3SbOvcc9wKU72krBs=@vger.kernel.org
X-Gm-Message-State: AFuF++kkS2nH1mjOcO4H/xPsDC4Uv8+TaNGmbrWaSGaTL9RL5QT3orGm
	07+g435uwe6M/SjYJs2iGH1IM6Oak9mvaZq+b+GjBr8PUpdjXRzheYEDbcc5eUoJeSI=
X-Gm-Gg: AYBFou3RINwI6buXeJ8QiT/6tke63LYSBvssfMvA+ihMY+eLzwpkNo+zJdHferIlzG6
	leNLN4w1d6qKk6JkdWIfbYzS6sEycI8pGspJpGqnMYZcSx+Xt3jx3//sLUl8G4FMKY9pqx2LRdq
	LS/Fwcx2mShZIjROO4oQoRAQR85uto0Y0h6IfOU/G6ZHg866bXBIYYHpB0LR86rwJMQX7X6W5Qm
	gZXti44g4D08YCc+OjlgibnoOk+ybNLnsmasVhmGHlp8eU0iwBXxKe7HMH8nYCoufWNM3Z4EsAr
	iZi1dwT+CjlHYFtqkOqmD52inLE5Bwiwb8bcAMsJYMgVNW2r2KR+sYhZDANuMBOwMT8L1+jZ+hl
	86jBZdbkrv523kHGo5UoLQPAKhwpdNMn3R24amJXbGgTUNqDsUPZy4P652lSsqCCB4INTA7vC3s
	4cs2PktbrdG8Ij98QoPaUwrG2busZjJLLpLlVR6qIWCNOJhJHqcz0Pdv05yhSUG//WZvkVFi0YD
	A==
X-Received: by 2002:a17:907:94c7:b0:c15:e8c8:340 with SMTP id a640c23a62f3a-c260cb54a27mr338016566b.23.1788519989375;
        Fri, 04 Sep 2026 04:06:29 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm5673432f8f.29.2026.09.04.04.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:06:28 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:06:27 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Ye Liu <liuye@kylinos.cn>,
	Pavel Machek <pavel@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Petr Mladek <pmladek@suse.com>, Waiman Long <longman@redhat.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, rcu@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] kernel: convert process/thread iterators to
 for_each_*_rcu
Message-ID: <apqmM9GCQn9KFxEA@tiehlicka>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-6-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-6-ye.liu@linux.dev>

On Fri 04-09-26 16:29:57, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() and guard(rcu)
> pairs combined with for_each_process(), for_each_thread() and
> for_each_process_thread() loops across kernel/ with the
> for_each_*_rcu() macros.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  kernel/cpu.c             | 4 +---
>  kernel/freezer.c         | 4 +---
>  kernel/hung_task.c       | 7 ++-----
>  kernel/locking/lockdep.c | 4 +---
>  kernel/rcu/update.c      | 4 +---
>  kernel/sched/core.c      | 3 +--
>  kernel/sched/debug.c     | 4 +---
>  kernel/trace/fgraph.c    | 8 ++------
>  kernel/unwind/deferred.c | 3 +--
>  9 files changed, 11 insertions(+), 30 deletions(-)
> 
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index b3c8553d7bd6..bc70fd21561a 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1254,8 +1254,7 @@ void clear_tasks_mm_cpumask(int cpu)
>  	 * full-fledged tasklist_lock.
>  	 */
>  	WARN_ON(cpu_online(cpu));
> -	rcu_read_lock();
> -	for_each_process(p) {
> +	for_each_process_rcu(p) {
>  		struct task_struct *t;
>  
>  		/*
> @@ -1268,7 +1267,6 @@ void clear_tasks_mm_cpumask(int cpu)
>  		arch_clear_mm_cpumask_cpu(cpu, t->mm);
>  		task_unlock(t);
>  	}
> -	rcu_read_unlock();
>  }
>  
>  /* Take this CPU down. */
> diff --git a/kernel/freezer.c b/kernel/freezer.c
> index a76bf957fb32..a27b2382fda9 100644
> --- a/kernel/freezer.c
> +++ b/kernel/freezer.c
> @@ -217,11 +217,9 @@ void thaw_process(struct task_struct *p)
>  {
>  	struct task_struct *t;
>  
> -	rcu_read_lock();
> -	for_each_thread(p, t) {
> +	for_each_thread_rcu(p, t) {
>  		__thaw_task(t);
>  	}
> -	rcu_read_unlock();
>  }
>  
>  /**
> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
> index 6fcc94ce4ca9..76871f78497f 100644
> --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -315,8 +315,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>  		return;
>  
>  	this_round_count = 0;
> -	rcu_read_lock();
> -	for_each_process_thread(g, t) {
> +	for_each_process_thread_rcu(g, t) {
>  		if (!max_count--)
>  			goto unlock;
>  		if (time_after(jiffies, last_break + HUNG_TASK_LOCK_BREAK)) {
> @@ -337,9 +336,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>  			hung_task_info(t, timeout, this_round_count);
>  		}
>  	}
> - unlock:
> -	rcu_read_unlock();
> -
> +unlock:
>  	if (!this_round_count)
>  		return;
>  
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index c56a7f91d72e..9c3dce0f0c4b 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -6834,15 +6834,13 @@ void debug_show_all_locks(void)
>  	}
>  	pr_warn("\nShowing all locks held in the system:\n");
>  
> -	rcu_read_lock();
> -	for_each_process_thread(g, p) {
> +	for_each_process_thread_rcu(g, p) {
>  		if (!p->lockdep_depth)
>  			continue;
>  		lockdep_print_held_locks(p);
>  		touch_nmi_watchdog();
>  		touch_all_softlockup_watchdogs();
>  	}
> -	rcu_read_unlock();
>  
>  	pr_warn("\n");
>  	pr_warn("=============================================\n\n");
> diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
> index 2a778b8ab4ad..c48a84a0da82 100644
> --- a/kernel/rcu/update.c
> +++ b/kernel/rcu/update.c
> @@ -548,15 +548,13 @@ void synchronize_rcu_trivial_preempt(void)
>  	struct task_struct *t;
>  
>  	smp_mb(); // Order prior accesses before grace-period start.
> -	rcu_read_lock(); // Protect task list.
> -	for_each_process_thread(g, t) {
> +	for_each_process_thread_rcu(g, t) {
>  		if (t == current)
>  			continue;  // Don't deadlock on ourselves!
>  		// Order later rcu_read_lock() on other tasks after QS.
>  		while (smp_load_acquire(&t->rcu_trivial_preempt_nesting))
>  			continue;
>  	}
> -	rcu_read_unlock();
>  }
>  EXPORT_SYMBOL_GPL(synchronize_rcu_trivial_preempt);
>  #endif // #if IS_ENABLED(CONFIG_TRIVIAL_PREEMPT_RCU)
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0697ed0f1c3d..a41cdd2ff02f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2005,8 +2005,7 @@ static void uclamp_sync_util_min_rt_default(void)
>  	smp_mb__after_spinlock();
>  	read_unlock(&tasklist_lock);
>  
> -	guard(rcu)();
> -	for_each_process_thread(g, p)
> +	for_each_process_thread_rcu(g, p)
>  		uclamp_update_util_min_rt_default(p);
>  }
>  
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 72236db67983..8f37b1a7adfe 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1029,14 +1029,12 @@ static void print_rq(struct seq_file *m, struct rq *rq, int rq_cpu)
>  #endif
>  		   "\n");
>  
> -	rcu_read_lock();
> -	for_each_process_thread(g, p) {
> +	for_each_process_thread_rcu(g, p) {
>  		if (task_cpu(p) != rq_cpu)
>  			continue;
>  
>  		print_task(m, rq, p);
>  	}
> -	rcu_read_unlock();
>  }
>  
>  void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
> index 40d373d65f9b..e522433ec8a5 100644
> --- a/kernel/trace/fgraph.c
> +++ b/kernel/trace/fgraph.c
> @@ -1057,11 +1057,10 @@ static int alloc_retstack_tasklist(unsigned long **ret_stack_list)
>  		}
>  	}
>  
> -	rcu_read_lock();
> -	for_each_process_thread(g, t) {
> +	for_each_process_thread_rcu(g, t) {
>  		if (start == end) {
>  			ret = -EAGAIN;
> -			goto unlock;
> +			goto free;
>  		}
>  
>  		if (t->ret_stack == NULL) {
> @@ -1074,9 +1073,6 @@ static int alloc_retstack_tasklist(unsigned long **ret_stack_list)
>  			t->ret_stack = ret_stack_list[start++];
>  		}
>  	}
> -
> -unlock:
> -	rcu_read_unlock();
>  free:
>  	for (i = start; i < end; i++)
>  		kmem_cache_free(fgraph_stack_cachep, ret_stack_list[i]);
> diff --git a/kernel/unwind/deferred.c b/kernel/unwind/deferred.c
> index 5bea47314254..61fe2d4727ce 100644
> --- a/kernel/unwind/deferred.c
> +++ b/kernel/unwind/deferred.c
> @@ -319,9 +319,8 @@ void unwind_deferred_cancel(struct unwind_work *work)
>  
>  	synchronize_srcu(&unwind_srcu);
>  
> -	guard(rcu)();
>  	/* Clear this bit from all threads */
> -	for_each_process_thread(g, t) {
> +	for_each_process_thread_rcu(g, t) {
>  		atomic_long_andnot(BIT(bit),
>  				   &t->unwind_info.unwind_mask);
>  		if (t->unwind_info.cache)
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
