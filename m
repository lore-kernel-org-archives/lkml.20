Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793484547;
	b=zdA1RKR2ZJgfxIPWZgY86brLZfv9CdN+Qgr5N1Z31IfX/cAHfH8lY4phlRpMWSe6TCLP
	 g+oZYyyJrNkSBy31FtRqQJBxBaMzTIBtip8uE6ag1SKJeNCW/BQCIVqyWmD4JYzGpfYKi
	 wvhXMYype6/n8kwA6L+gRXm+91rbKxV8xodo7VkAVxxZjUM2YNqWAQbdckdub9opHxtFK
	 g/pcsVRn7YxkijpgRj+e9DkGj9HgWMmGRy5OKrok+2kms0vSIOsogWfr4SyLD032WK5HB
	 EBUt6f5eFRsGc5R4LuWvIjCwQhlHt/QJcO9wpT22EyQyCZswV07Cgvt1xgJJAwlqMHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793484547;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nHO0WMdIDamn3FBNdzLyeYZup1qzz9kZ3mhGfqufqE0=;
	b=Nz3aRg00IEJurrpx18jdQKYh+G6G5vu2ZtdSFa4s21zT9KoG91yIzotN2y+w+tj/h56x
	 +yXEwlBH4A1z85BnOppAARWjN9P5SnB0vL/wkMZB4h1+0xtcNEogc6Hf9iFEO0/o4z3Xe
	 XEn7bQwM6fC0pfw2rAb77VkY2PhuoJYf196ZRgr2IK2bMkKE16VwgUnbu8vSO2Z6En4dd
	 ovhJbiGEvkmPNn8WDTY7luubnQgOpLhxSojWjU5WntEzGXy+osUeabjC1VkzIJpLj56K2
	 9VZZZyGmfKRGdvnNqaL1rPaqchhl9z+N6qL5Tc3BqPZ3zO4FM4RAnIexEFGxpF8P3KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQVFOWp2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EDC606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQVFOWp2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E7D1F000C1;
	Sat, 31 Oct 2026 22:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793484547;
	bh=nHO0WMdIDamn3FBNdzLyeYZup1qzz9kZ3mhGfqufqE0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YQVFOWp2tQoiJAWEaY9XskjB/0pq8xVIQ4xLNbMAptf0mtF4V24e4glwEyaiCwECk
	 zFm+kfkdObIb5WzxCxqWuu9a1gk6tYoL3ePzAkXjo+C58eNm6d6YrTVAIBvtP+aAk9
	 TJ0XYa//cLYxxDCgY9gj+Fy7sJn0feqpwCiZgSL9bBafe09cXwBQaPoxUgopEgNqnU
	 Zd+Wxear0Z981wVJBRn3uWmXLQ+oXow621sLqDu6CxwGK+oJ58uCg6DX07f+OWusgA
	 DwRmScrZ7R8GGGnP6Sz+gXFYHrpWIfiDNGXjGHGJ2XhyRYJiH+R/uu+sP6DKnkgnXZ
	 9TJqZE96CuJ7Q==
Date: Sat, 31 Oct 2026 12:09:05 -1000
Message-ID: <0de31a5e777c6cafce329dd9571b0049@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched/urgent] sched/deadline: Fix stale rq->dl_server after a server pick returns RETRY_TASK
In-Reply-To: <6db076ee2562b5fb84d70ed59abe670e@kernel.org>
References: <20261030221842.4071610-1-tj@kernel.org> <6db076ee2562b5fb84d70ed59abe670e@kernel.org>
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
Content-Transfer-Encoding: 7bit

Hello,

The report covered only the non-core pick path, __pick_next_task(). The
core-scheduling pick_next_task() has three more ways of leaving
rq->dl_server wrong. All three reproduce on mainline d89e1d186ec9 in an SMT
VM with the fair server.

1. In the core-wide selection, the cookie pass replaces this CPU's
   first-pass pick, through sched_core_find() or forced idle, without
   clearing the rq->dl_server that a server pick set, so
   put_prev_set_next_task() hands the server to the replacement. This dates
   from bd9bbc96e835 ("sched: Rework dl_server") and reproduces reliably.

2. The cookie pass also clears rq_i->core_dl_server for every sibling, so a
   sibling whose first-pass server pick survived the cookie pass runs it
   from the fast path without its server. Same origin. It reproduces
   reliably.

3. Core scheduling gets enabled while a non-core __pick_next_task() has the
   rq lock dropped in sched_balance_newidle(). core_pick_in_flight counts
   only core-path picks, so __sched_core_flip() doesn't wait for it, and a
   sibling's core-wide selection then runs pick_task() on this rq and sets
   rq->dl_server, which the non-core pick hands to the task the fair class
   picked. It reproduces only rarely, and needs the newidle window widened
   by the patch's 2ms delay and a cookie toggled in a loop. It also happens
   with the RETRY_TASK restart fixed.

In a debug kernel, recomputing the core-wide selection's first-pass max with
the servers the picks actually went through changes the cross-sibling
priority choice and the chosen cookie in some selections; that is a
recomputation, not an observed scheduling outcome.

The scripts need an SMT topology, stress-ng, coresched from util-linux and
root, and the third also chrt.

The case 1 patch reports the hand-offs.

  --- a/kernel/sched/core.c
  +++ b/kernel/sched/core.c
  @@ -6291,6 +6291,10 @@ extern void task_vruntime_update(struct
   
   static void queue_core_balance(struct rq *rq);
   
  +/* REPRO: core.dbg_core_1 counts the hand-offs */
  +static atomic_t dbg_core_1;
  +module_param_named(dbg_core_1, dbg_core_1.counter, int, 0444);
  +
   static struct task_struct *
   pick_next_task(struct rq *rq, struct rq_flags *rf)
   	__must_hold(__rq_lockp(rq))
  @@ -6303,6 +6307,7 @@ pick_next_task(struct rq *rq, struct rq_
   	int i, cpu, occ = 0;
   	struct rq *rq_i;
   	bool need_sync = false;
  +	struct task_struct *pass1 = NULL;	/* REPRO */
   
   	if (!sched_core_enabled(rq))
   		return __pick_next_task(rq, rf);
  @@ -6434,6 +6439,8 @@ restart:
   
   		rq_i->core_pick = p;
   		rq_i->core_dl_server = rq_i->dl_server;
  +		if (i == cpu)
  +			pass1 = p;	/* REPRO */
   
   		if (!max || prio_less(max, p, fi_before))
   			max = p;
  @@ -6482,6 +6489,17 @@ restart:
   	/* Something should have been selected for current CPU */
   	WARN_ON_ONCE(!next);
   
  +	/* REPRO: pass 2 replaced the pass 1 pick, so rq->dl_server is stale */
  +	if (next != pass1 && rq->dl_server) {
  +		static DEFINE_RATELIMIT_STATE(dbg_rs, 5 * HZ, 10);
  +
  +		atomic_inc(&dbg_core_1);
  +		if (__ratelimit(&dbg_rs))
  +			printk_deferred(KERN_WARNING "core pick: stale rq->dl_server handed to %s/%d (%ps), pass 1 picked %s/%d\n",
  +					next->comm, next->pid, next->sched_class,
  +					pass1->comm, pass1->pid);
  +	}
  +
   	/*
   	 * Reschedule siblings
   	 *

  #!/bin/bash
  #
  # Reproducer for core scheduling handing the server of a CPU's pass 1 pick to
  # the task pass 2 replaced it with. Needs a kernel with the case 1 debug patch, an SMT
  # topology, stress-ng, coresched and root.
  #
  # RT FIFO hogs starve the fair tasks, so the fair server runs them. Each load
  # runs under its own core scheduling cookie. When a CPU's fair server picks a
  # fair task while its sibling picks an RT task, the RT task's cookie wins and
  # pass 2 replaces the fair task with a task of that cookie or with idle.
  #
  # usage: repro-1.sh [DURATION_S]
  
  DURATION=${1:-60}
  N=$(nproc)
  
  dmesg -C
  coresched new -- stress-ng --cpu "$N" --sched fifo --sched-prio 10 --timeout "${DURATION}s" &> /dev/null &
  coresched new -- stress-ng --switch "$N" --sched fifo --sched-prio 50 --timeout "${DURATION}s" &> /dev/null &
  coresched new -- stress-ng --cpu $((N * 2)) --cpu-load 20 --timeout "${DURATION}s" &> /dev/null &
  coresched new -- stress-ng --switch "$N" --timeout "${DURATION}s" &> /dev/null &
  wait
  
  dmesg | grep 'core pick: stale rq->dl_server'
  echo "stale rq->dl_server hand-offs: $(cat /sys/module/core/parameters/dbg_core_1)"

The case 2 patch reports the fast-path picks that run without their server.

  --- a/kernel/sched/core.c
  +++ b/kernel/sched/core.c
  @@ -6291,6 +6291,12 @@ extern void task_vruntime_update(struct
   
   static void queue_core_balance(struct rq *rq);
   
  +/* REPRO: each CPU's pass 1 pick and server. core.dbg_core_2 counts drops */
  +static DEFINE_PER_CPU(struct task_struct *, dbg_pass1_pick);
  +static DEFINE_PER_CPU(struct sched_dl_entity *, dbg_pass1_dls);
  +static atomic_t dbg_core_2;
  +module_param_named(dbg_core_2, dbg_core_2.counter, int, 0444);
  +
   static struct task_struct *
   pick_next_task(struct rq *rq, struct rq_flags *rf)
   	__must_hold(__rq_lockp(rq))
  @@ -6335,6 +6341,16 @@ pick_next_task(struct rq *rq, struct rq_
   	if (rq->core->core_pick_seq == rq->core->core_task_seq &&
   	    rq->core_pick) {
   		next = rq->core_pick;
  +		/* REPRO: pass 2 dropped the server that picked @next */
  +		if (next == __this_cpu_read(dbg_pass1_pick) &&
  +		    __this_cpu_read(dbg_pass1_dls) && !rq->core_dl_server) {
  +			static DEFINE_RATELIMIT_STATE(dbg_rs, 5 * HZ, 10);
  +
  +			atomic_inc(&dbg_core_2);
  +			if (__ratelimit(&dbg_rs))
  +				printk_deferred(KERN_WARNING "core pick: rq->dl_server dropped for %s/%d (%ps), pass 1 picked it through a server\n",
  +						next->comm, next->pid, next->sched_class);
  +		}
   		rq->dl_server = rq->core_dl_server;
   		rq->core_pick = NULL;
   		rq->core_dl_server = NULL;
  @@ -6434,6 +6450,8 @@ restart:
   
   		rq_i->core_pick = p;
   		rq_i->core_dl_server = rq_i->dl_server;
  +		per_cpu(dbg_pass1_pick, i) = p;			/* REPRO */
  +		per_cpu(dbg_pass1_dls, i) = rq_i->dl_server;	/* REPRO */
   
   		if (!max || prio_less(max, p, fi_before))
   			max = p;

  #!/bin/bash
  #
  # Reproducer for core scheduling dropping the server of a sibling's pass 1
  # pick that pass 2 kept. Needs a kernel with the case 2 debug patch, an SMT topology,
  # stress-ng, coresched and root.
  #
  # RT FIFO hogs starve the fair tasks, so the fair servers run them. Each load
  # runs under its own core scheduling cookie. When the max is a fair task, a
  # sibling's fair server pick with the same cookie survives pass 2 and runs
  # from the fast path without its server.
  #
  # usage: repro-2.sh [DURATION_S]
  
  DURATION=${1:-60}
  N=$(nproc)
  
  dmesg -C
  coresched new -- stress-ng --cpu "$N" --sched fifo --sched-prio 10 --timeout "${DURATION}s" &> /dev/null &
  coresched new -- stress-ng --switch "$N" --sched fifo --sched-prio 50 --timeout "${DURATION}s" &> /dev/null &
  coresched new -- stress-ng --cpu $((N * 2)) --cpu-load 20 --timeout "${DURATION}s" &> /dev/null &
  coresched new -- stress-ng --switch "$N" --timeout "${DURATION}s" &> /dev/null &
  wait
  
  dmesg | grep 'core pick: rq->dl_server dropped'
  echo "server picks run without the server: $(cat /sys/module/core/parameters/dbg_core_2)"

The case 3 patch widens the newidle lock drop by fair.dbg_newidle_delay_us
once a fair task is queued and reports the hand-offs.

  --- a/kernel/sched/core.c
  +++ b/kernel/sched/core.c
  @@ -6197,6 +6197,30 @@ static void prev_balance(struct rq *rq,
   }
   
   /*
  + * REPRO: per CPU, whether a non-core pick is in progress and the server a
  + * sibling's pick_task() left meanwhile. core.dbg_core_3 counts the hand-offs.
  + */
  +static DEFINE_PER_CPU(bool, dbg_np_pick);
  +static DEFINE_PER_CPU(struct sched_dl_entity *, dbg_sibling_dls);
  +static atomic_t dbg_core_3;
  +module_param_named(dbg_core_3, dbg_core_3.counter, int, 0444);
  +
  +/* REPRO: @p is getting rq->dl_server. @srv_pick means the dl class picked @p */
  +static void dbg_np_handoff(struct rq *rq, struct task_struct *p, bool srv_pick)
  +{
  +	struct sched_dl_entity *dls = __this_cpu_read(dbg_sibling_dls);
  +	static DEFINE_RATELIMIT_STATE(dbg_rs, 5 * HZ, 10);
  +
  +	WRITE_ONCE(*this_cpu_ptr(&dbg_np_pick), false);
  +	if (!srv_pick && dls && rq->dl_server == dls) {
  +		atomic_inc(&dbg_core_3);
  +		if (__ratelimit(&dbg_rs))
  +			printk_deferred(KERN_WARNING "non-core pick: stale rq->dl_server from a sibling's core pick handed to %s/%d (%ps)\n",
  +					p->comm, p->pid, p->sched_class);
  +	}
  +}
  +
  +/*
    * Pick up the highest-prio task:
    */
   static inline struct task_struct *
  @@ -6207,6 +6231,8 @@ __pick_next_task(struct rq *rq, struct r
   	struct task_struct *p;
   
   	rq->dl_server = NULL;
  +	__this_cpu_write(dbg_sibling_dls, NULL);	/* REPRO */
  +	WRITE_ONCE(*this_cpu_ptr(&dbg_np_pick), true);	/* REPRO */
   
   	if (scx_enabled())
   		goto restart;
  @@ -6228,6 +6254,7 @@ __pick_next_task(struct rq *rq, struct r
   		if (!p)
   			p = pick_task_idle(rq, rf);
   
  +		dbg_np_handoff(rq, p, false);	/* REPRO */
   		put_prev_set_next_task(rq, rq->donor, p);
   		return p;
   	}
  @@ -6240,6 +6267,7 @@ restart:
   		if (unlikely(p == RETRY_TASK))
   			goto restart;
   		if (p) {
  +			dbg_np_handoff(rq, p, class == &dl_sched_class);	/* REPRO */
   			put_prev_set_next_task(rq, rq->donor, p);
   			return p;
   		}
  @@ -6280,8 +6308,13 @@ static inline struct task_struct *pick_t
   
   	for_each_active_class(class) {
   		p = class->pick_task(rq, rf);
  -		if (p)
  +		if (p) {
  +			/* REPRO: a sibling picks during @rq's non-core pick */
  +			if (cpu_of(rq) != smp_processor_id() &&
  +			    READ_ONCE(per_cpu(dbg_np_pick, cpu_of(rq))))
  +				per_cpu(dbg_sibling_dls, cpu_of(rq)) = rq->dl_server;
   			return p;
  +		}
   	}
   
   	BUG(); /* The idle class should always have a runnable task. */
  --- a/kernel/sched/fair.c
  +++ b/kernel/sched/fair.c
  @@ -21,6 +21,7 @@
    *  Copyright (C) 2007 Red Hat, Inc., Peter Zijlstra
    */
   #include <linux/energy_model.h>
  +#include <linux/delay.h>	/* REPRO */
   #include <linux/mmap_lock.h>
   #include <linux/jiffies.h>
   #include <linux/math.h>
  @@ -14849,6 +14850,10 @@ static inline bool nohz_idle_balance(str
   static inline void nohz_newidle_balance(struct rq *this_rq) { }
   #endif /* !CONFIG_NO_HZ_COMMON */
   
  +/* REPRO: fair.dbg_newidle_delay_us, see sched_balance_newidle() */
  +static unsigned int dbg_newidle_delay_us;
  +module_param(dbg_newidle_delay_us, uint, 0644);
  +
   /*
    * sched_balance_newidle is called by schedule() if this_cpu is about to become
    * idle. Attempts to pull tasks from other CPUs.
  @@ -14968,6 +14973,10 @@ static int sched_balance_newidle(struct
   			break;
   	}
   
  +	/* REPRO: widen the drop after the cost update with fair tasks queued */
  +	if (dbg_newidle_delay_us && data_race(this_rq->cfs.h_nr_queued))
  +		udelay(dbg_newidle_delay_us);
  +
   	raw_spin_rq_lock(this_rq);
   
   	if (curr_cost > this_rq->max_idle_balance_cost)

  #!/bin/bash
  #
  # Reproducer for a sibling's core-wide pick leaving rq->dl_server set in a
  # non-core pick that released the rq lock before core scheduling got enabled.
  # Needs a kernel with the case 3 debug patch, an SMT topology, stress-ng, coresched
  # and root.
  #
  # RT FIFO hogs on one thread of each core make the fair servers run there.
  # Sleeping fair tasks make the picks pull tasks in newidle balancing, and the
  # knob widens the rq lock release once a fair task is queued. A busy group
  # gets a new cookie and has it cleared in a loop, which enables and disables
  # core scheduling and makes the busy tasks' CPUs run core-wide selections
  # right after each enable.
  #
  # usage: repro-3.sh [DURATION_S] [DELAY_US]
  
  DURATION=${1:-60}
  DELAY_US=${2:-2000}
  KNOB=/sys/module/fair/parameters/dbg_newidle_delay_us
  N=$(nproc)
  
  [ -w $KNOB ] || { echo "$KNOB missing, is the case 3 debug patch applied?"; exit 1; }
  dmesg -C
  echo "$DELAY_US" > $KNOB
  
  stress-ng --cpu $((N / 2)) --taskset even --cpu-load 95 --sched fifo --sched-prio 10 \
  	--timeout "${DURATION}s" &> /dev/null &
  stress-ng --cpu $((N * 2)) --cpu-load 20 --timeout "${DURATION}s" &> /dev/null &
  stress-ng --switch "$N" --timeout "${DURATION}s" &> /dev/null &
  setsid stress-ng --cpu "$N" --cpu-load 50 --timeout "${DURATION}s" &> /dev/null &
  BUSY=$!
  sleep 1
  
  # the toggler runs above the RT hogs, or they starve it
  chrt -f 90 bash -c '
  	end=$((SECONDS + $1))
  	while [ $SECONDS -lt $end ]; do
  		coresched new -t pgid -d $2 || break
  		sleep 0.01
  		coresched copy -s $$ -t pgid -d $2 || break
  		sleep 0.02
  	done
  ' toggler $((DURATION - 2)) $BUSY
  wait
  echo 0 > $KNOB
  
  dmesg | grep 'stale rq->dl_server from a sibling'
  echo "sibling-written rq->dl_server hand-offs: $(cat /sys/module/core/parameters/dbg_core_3)"

Thanks.

--
tejun
