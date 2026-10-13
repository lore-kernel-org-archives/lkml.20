Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A14FE2FE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899026; cv=none; b=qJ4BcvtRjwY8dlr7ehXbX3OtmzI0Bnpl+0WTPKIZjKLB5TMzZYK2tIh0ZEldY8AgZieEYraxMXM+KlHCERuv+8ZTStkSb3CVo1KWaB99OOPTb3jr1gRfnPnHQ8LeAgkCPZT4B1f5yAU0/liut4UkeMjRv84Sev8NyO0hQZZPUss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899026; c=relaxed/simple;
	bh=9k33jwrW4wrJfu2jUWO5z/w/EvrPe0gole5T8Jz02Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5kR/PwAseTs/Up9QSZz+JOk0w4qCbg8Ua6A898GcxWMxkGe5TR0hJ+/Siblef1mkBAdDhV6X7H4RZUx4YOKH+3KA5XjxjdFOml/I3SIhRc7mi5eTJNl9+MmFBhRCJinUPuXFj+RtRrVy3ZI5Jr/x1mrIZhbSyF70WBWgW301WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MwHH84ts; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TBAGnjXH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MwHH84ts";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TBAGnjXH"
Date: Tue, 13 Oct 2026 15:43:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791899022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=145qld84tBo3MYktfwGMf1cMjBFj8glXmHtIgipCdnI=;
	b=MwHH84tskaCoSls3CoTwfmkBri1HiACtIqorZpwTQaNC+Gl2OnKsH95PM/Ee7mN3FYFLZP
	5m7FcKbzOeT7XB+r/AtdDyE5bR3zv4cZegOLtGkg+ssDHI6L7TPqUotfmUO/yfukdY11FR
	hpMqcYSvKYvoW0t2IoIjTzx6uNo0y/SszEbT2UqLDInYLr0kngPWZbTA326H2P6M+aD9Kp
	UwrqJus7Imz/0P7jp8KAHpffYZiCkIegBXGYEZUJaM92ytpMhXaBTk81uL8GF2Ia2rOdN8
	PghbMER4wOPe+5WN5aecC7lv/ony1RPX8qEfYBZs53znJ0/v7p1Qfgl5Bz27fQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791899022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=145qld84tBo3MYktfwGMf1cMjBFj8glXmHtIgipCdnI=;
	b=TBAGnjXHfn2zXdRxuffAG6/IbwGkhnZ6uqesmPwYfQT0j+XW+zWisUL2m6q6gOA/j69oEG
	JdU0+iiljC1hBQCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <20261013134340.Ua8DuZTD@linutronix.de>
References: <20261012103946.aOSAmrRe@linutronix.de>
 <20261012143047.GV2009045@noisy.programming.kicks-ass.net>
 <20261013064617.jw7Sk6un@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013064617.jw7Sk6un@linutronix.de>

On 2026-10-13 08:46:19 [+0200], To Peter Zijlstra wrote:
> > I am struggling to follow along. The actual fail scenario is a
> > combination of hotplug *and* migrate_disable()? Can we get a picture?
> 
> let me grab the reproducer and a few tracepoints to make an accurate
> drawing.

CPU1 is actually doing nothing. And migrate_disable() is involved way
later:

 CPU0
 _cpu_down(1)
    set_cpu_dying(1)
  /* CPU1 is now present in ONLINE and DYING mask */

  <idle or whatever>
  try_to_wake_up(p)
  -> select_fallback_rq() -> falls back to CPU0 because CPU1 is not available

<irq-thread>
  irq_thread_check_affinity()
    set_cpus_allowed_ptr(, 1)
    /* cpu_valid_mask = cpu_online_mask */
     -> affine_move_task(dest_cpu = 1);
       -> stop_one_cpu_nowait()

  /* switch to migration_cpu_stop-0 */
  migration_cpu_stop()
  -> __migrate_task(arg->dest_cpu = 1) /* returns rq of 0 */

  < back to irq-thread >
  set_cpus_allowed_ptr(, 1) return with cpus_ptr set to CPU1 while running
  on CPU0.

A schedule out (and sleep) at this point is fine, try_to_wake_up() will
again go to select_fallback_rq() and schedule the task on 0 with proper
::cpus_ptr.

If instead the task does
	migrate_disable()
	schedule() /* remain running on RQ */
	-> migrate_disable_switch()
	   -> set_cpus_allowed_common()
	      -> p->cpus_ptr = ctx->new_mask; = CPU0

Once back on CPU0, migrate_enable() does:
	___migrate_enable()
	-> __set_cpus_allowed_ptr(SCA_MIGRATE_ENABLE | &p->cpus_mask)
	  /* ::cpus_mask has still the 1 set. There was no wakeup, task
	     remained on RQ so the mask is not fixed */

Now affine_move_task() will expect task_struct::migration_pending to be
set but it was never set. The task would have remained on the current
CPU (0) if the previous set_cpus_allowed_ptr() would not have set an
invalid CPU mask.

Sebastian
