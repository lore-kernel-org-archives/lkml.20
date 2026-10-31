Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409559;
	b=np25A8TFn4MECDYjHb7fSDkDet2nZnlIM7N4v7VTwEfxD6F58k+749/Vf9nt4s/Sfcmg
	 x5eXoOTjG9U0cU2tuDLSaWPdYuvHAvQ2TVI1vEM8fYbsl3Twd6CVdkwQ8VxhWbffrkZKQ
	 DAnyNHf/VAu1kgtiLyNpVkjHHh1jBXi/9qb/dUfyCmjuByvVvovtAfoNr6TTbv5WPlinx
	 J56E4L2zIYP2DsFVbh7urPl2aiEACbLGPyRmTiFv52uGGgbp3je2Uv1RP0eKP/8ILkjVN
	 K/llHzk9B6h3+q0MLEbkL/bWqFUNsdhG5RAMIZjc6Ho+WTwmgotYHp29HuyGmvtbiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409559;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Tus5cJ4/jKrGberNguLj6Jhp4diQUOWUDhWiJmOBLsM=;
	b=io9KusLmQl8a6N9HyxTrBfJbc7OOkswhYJ/RLVjSazTGoluxV9jR0E2/6j0hG69VQSDl
	 E5+5d12e0NMpmNfkp8vjwPFzfg1JGVFldG5nSa+c9dkXV7hDdwJZNh1ME4M4YbcJjYNRj
	 FNv6rR+HtI+pZVpX26GAeMFonj+NBXwnzgEvXBY4rNSK7wQXTz27qn4Eeq3NcYsxotnau
	 G+MCKqaDKGBg+3T1HJPVRRcycavolg6brM+ZUuqZ69J3flz9tMYyDDt8iVviw9GiRMFul
	 5lmnP+aQbhvKFaxWJ0N+aQ2s+WnBAWM1Ljf4O87hpN9FIrce0Js/w5cMk5aNb6hQznw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSvG91Aa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AE1606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSvG91Aa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A64C1F000C1;
	Sat, 31 Oct 2026 01:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793409558;
	bh=Tus5cJ4/jKrGberNguLj6Jhp4diQUOWUDhWiJmOBLsM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BSvG91AaF+5+sgO6DPOh1PvJ38nDjc55KnDQIOhXcEMYMRDz8NtU71yAJjioaC2tx
	 dWvIyfSJXFAJ52JzxbzPJxkNhlJd33CSG+ihby4E5i/KIT4lbRpPzltb7weMFGax0z
	 mlyoIXGXvK9vMxH8d8cbpQxvmi1LFeru08Hx+vstf1RjxdZlV3Srb9AfaN0tm7EVwz
	 dtWVjsCm3wj+0b9zEYT/mZ3zwjfwqedodS6iBHEQdoZpIWCC4/cHP+AyvXzlaEIlxx
	 66ZQyiBPQd+FpxWBB0qGLxynOe2XabuEF55XmgsUyri5Dinnn2zFBI/rYu34vJoaHf
	 UNhyLu0WC0/9A==
Date: Fri, 30 Oct 2026 15:19:17 -1000
Message-ID: <6db076ee2562b5fb84d70ed59abe670e@kernel.org>
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
In-Reply-To: <20261030221842.4071610-1-tj@kernel.org>
References: <20261030221842.4071610-1-tj@kernel.org>
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

This is what I should have sent: a bug report with a reproducer, not the
patch.

__pick_task_dl() records the server in rq->dl_server on RETRY_TASK too, and
__pick_next_task() clears it only above its restart label, so the restarted
pick hands the stale server to whatever task it takes. This became reachable
with b3a2dfa8b42e ("sched/fair: Add newidle balance to pick_task_fair()"),
which makes fair_server_pick_task() return RETRY_TASK when a higher-class
task was enqueued while sched_balance_newidle() had the rq lock dropped.

On mainline abf8c33470f7 in an 8-CPU VM, the reproducer below (60s, 500us
delay) hands the fair server to RT tasks:

  stale rq->dl_server handed to stress-ng-switc/1517 (rt_sched_class)

Six runs counted 8, 44, 0, 7, 24 and 22 hand-offs. No runtime effect of the
stale pointer was observed.

The debug patch widens the newidle lock drop inside a dl server's pick by
fair.dbg_newidle_delay_us and reports the hand-offs. The script needs
stress-ng and root.

  --- a/kernel/sched/core.c
  +++ b/kernel/sched/core.c
  @@ -6240,6 +6240,12 @@ restart:
   		if (unlikely(p == RETRY_TASK))
   			goto restart;
   		if (p) {
  +			static DEFINE_RATELIMIT_STATE(dbg_rs, 5 * HZ, 10);
  +
  +			/* REPRO: only a dl server pick in this pass sets rq->dl_server */
  +			if (rq->dl_server && class != &dl_sched_class && __ratelimit(&dbg_rs))
  +				printk_deferred(KERN_WARNING "stale rq->dl_server handed to %s/%d (%ps)\n",
  +						p->comm, p->pid, class);
   			put_prev_set_next_task(rq, rq->donor, p);
   			return p;
   		}
  --- a/kernel/sched/deadline.c
  +++ b/kernel/sched/deadline.c
  @@ -2813,6 +2813,9 @@ static struct sched_dl_entity *pick_next
   	return __node_2_dle(left);
   }
   
  +/* REPRO: lets sched_balance_newidle() widen its lock drop in a server pick */
  +DEFINE_PER_CPU(bool, dbg_in_dl_server_pick);
  +
   /*
    * __pick_next_task_dl - Helper to pick the next -deadline task to run.
    * @rq: The runqueue to pick the next task from.
  @@ -2831,7 +2834,9 @@ again:
   	WARN_ON_ONCE(!dl_se);
   
   	if (dl_server(dl_se)) {
  +		this_cpu_write(dbg_in_dl_server_pick, true);	/* REPRO */
   		p = dl_se->server_pick_task(dl_se, rf);
  +		this_cpu_write(dbg_in_dl_server_pick, false);	/* REPRO */
   		if (!p) {
   			dl_server_stop(dl_se);
   			goto again;
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
  @@ -14849,6 +14850,11 @@ static inline bool nohz_idle_balance(str
   static inline void nohz_newidle_balance(struct rq *this_rq) { }
   #endif /* !CONFIG_NO_HZ_COMMON */
   
  +/* REPRO: fair.dbg_newidle_delay_us, see __pick_task_dl() */
  +DECLARE_PER_CPU(bool, dbg_in_dl_server_pick);
  +static unsigned int dbg_newidle_delay_us;
  +module_param(dbg_newidle_delay_us, uint, 0644);
  +
   /*
    * sched_balance_newidle is called by schedule() if this_cpu is about to become
    * idle. Attempts to pull tasks from other CPUs.
  @@ -14968,6 +14974,10 @@ static int sched_balance_newidle(struct
   			break;
   	}
   
  +	/* REPRO: widen the drop inside a dl server's pick, after the cost update */
  +	if (dbg_newidle_delay_us && this_cpu_read(dbg_in_dl_server_pick))
  +		udelay(dbg_newidle_delay_us);
  +
   	raw_spin_rq_lock(this_rq);
   
   	if (curr_cost > this_rq->max_idle_balance_cost)

  #!/bin/bash
  #
  # Reproducer for a stale rq->dl_server after a dl server's pick returns
  # RETRY_TASK. Needs a kernel with repro.patch applied, stress-ng and root.
  #
  # RT FIFO hogs starve the fair tasks, so the fair server runs them. The fair
  # tasks sleep often, so the server's pick finds no fair task and runs
  # sched_balance_newidle(), which drops the rq lock. An RT task woken from
  # another CPU in that window makes the pick return RETRY_TASK, and the
  # restarted pick hands the stale server to the RT task.
  #
  # usage: repro.sh [DURATION_S] [DELAY_US]
  
  DURATION=${1:-60}
  DELAY_US=${2:-500}
  KNOB=/sys/module/fair/parameters/dbg_newidle_delay_us
  N=$(nproc)
  
  [ -w $KNOB ] || { echo "$KNOB missing, is repro.patch applied?"; exit 1; }
  dmesg -C
  echo "$DELAY_US" > $KNOB
  
  # RT hogs on every CPU, RT pipe ping-pong across CPUs, fair tasks at 20% load
  stress-ng --cpu "$N" --sched fifo --sched-prio 10 --timeout "${DURATION}s" &> /dev/null &
  stress-ng --switch "$N" --sched fifo --sched-prio 50 --timeout "${DURATION}s" &> /dev/null &
  stress-ng --cpu $((N * 2)) --cpu-load 20 --timeout "${DURATION}s" &> /dev/null &
  stress-ng --switch "$N" --timeout "${DURATION}s" &> /dev/null &
  wait
  echo 0 > $KNOB
  
  dmesg | grep -E 'stale rq->dl_server|__pick_next_task: [0-9]+ callbacks suppressed'
  printed=$(dmesg | grep -c 'stale rq->dl_server')
  suppressed=$(dmesg | sed -n 's/.*__pick_next_task: \([0-9]*\) callbacks suppressed.*/\1/p' |
  	     awk '{ s += $1 } END { print s + 0 }')
  echo "stale rq->dl_server hand-offs: $((printed + suppressed))"

Thanks.

--
tejun
