Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376BC2D73B8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957226; cv=none; b=qgCCbMSDkE5BioMXnlIbNdzAPVGXCk9suthPsCSF/ZY+ExMkyzhiD7L4ozoIcB5kiyVxUqWSkJVZWct24A443igKdzOnxw+SGW5Tovp0+wWlMhVZ04naB/c/ZINHBSRMG/1gjnVOc2ds/OOMVGU7jw8VVhymYQRKO+b5FSE1wcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957226; c=relaxed/simple;
	bh=meqc0dOGYKrukNFPGjKjWqm+txv9FoUAa7lhQu1j19c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdvCBRPc4bzj/zDxDQWsk2ahgVdcSsNZKS1ocxufHc8A0NrkcsUx1DtvA2bO+S4/mvMprODyEWsH//qrgseYyKEL6NHdaW3eDjUioWZlmcN09iVro2aB7Hen1Fs1bYqEHPIX5UErYvW8/vA77NWE7kFLRlZ/jRjfzfjICrTSMd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LV4STyyO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0c7CtnPm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LV4STyyO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0c7CtnPm"
Date: Fri, 2 Oct 2026 18:07:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790957222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJTEyTe7qH2FQWucTsB+fiyvqCJ18mfNW95IuTL9s7U=;
	b=LV4STyyOt1frGtbd+yLYcoOOQKIMNfDUoPcN32d/g/6bXtXERUIp7Qau56bXwnnJBGvAQO
	F4kfLSAfqrEYZTcX2s8gn997YZknnQ7rgoeLBf/rxjj9sBfVTZYutD54yV8jNlJ8OHDSrE
	egeZiMkE9F8dYUorid9hKfB1XLhSQFSGbTnchnaOyQl4j7kokL/HMt+5Z992fMwzqnTPz8
	J2xbyrdUaU8yDBZONe+m64r4fJicXYMz9vTyXo2/2yC20X7yTspboJXf94VvIlThcqjrhX
	W/Md5CqqE4hdnHbi/dh9+756cnH6TiWg0wleMW0b9Od2WgWJIFECUjIHMi/dEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790957222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJTEyTe7qH2FQWucTsB+fiyvqCJ18mfNW95IuTL9s7U=;
	b=0c7CtnPm1li8iDTSo/vk0WfZEYmlh6N3dO2qLeGaEOLzqLyLH7KiORmH01+v/nNGlkzecK
	YFIT8XfmK5xtiOAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org
Cc: syzkaller-bugs@googlegroups.com, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC PATCH] sched: irq: cpu-hotplug race vs
 set_cpus_allowed_ptr()
Message-ID: <20261002160701.7Pqp05o3@linutronix.de>
References: <6a9919ac.94649fcc.25487e.0005.GAE@google.com>
 <20260907085825.f-CZ1Q5y@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260907085825.f-CZ1Q5y@linutronix.de>

Hello :)

On 2026-09-07 10:58:25 [+0200], To syzbot wrote:
> syzbot reported a race of assigning a CPU affinity during CPU hotplug
> operation.
> After the affinity of an IRQ has been changed, the IRQ-core sets
> IRQTF_AFFINITY and wakes the relevant interrupt threads which need to
> adjust their affinity mask. The thread will then invoke
> set_cpus_allowed_ptr() to update the mask. Based on the new mask a CPU
> is chosen on which the thread should run.
>=20
> It is verified that this CPU is online however there is no guarantee
> that this CPU remains online while affine_move_task() is moving _this_
> task. Since the current task requests the migration the stopper/
> migration_cpu_stop() is involved at which point the task pauses for a
> while. If the CPU goes offline (or is no longer cpu_online_mask) then
> __migrate_task() (due to is_cpu_allowed() reject) will return the rq of
> the CPU on which the task is currently running (which does not match
> it's task_struct::cpus_mask).
>=20
> The aftermath:
> The IRQ-thread's CPU and task's cpus_mask do not match. A
> migrate_disable()-> schedule() will change task_struct::cpus_ptr
> ensuring that the following migrate_enable() will update the task to the
> requested affinity mask. At this point, affine_move_task() expects
> task_struct::migration_pending set but it is NULL because noone
> requested an affinity change while the task was in migrate-disable
> section.
>=20
> I see two ways of fixing this:
> - Holding the cpus_read_lock while set_cpus_allowed_ptr() is invoked.
>   This ensure that the CPU remains in the cpu_online_mask while the
>   migration task moving the task over. Should the mask be already
>   invalid, then it is rejected otherwise the operaton completes.
>   Maybe we should also check if cpus_read_lock is held during the
>   invocation of set_cpus_allowed_ptr() so we don't get this problem from
>   other callers.

So sashiko complains about deadlock of cpus_write_lock() in the CPU down
path and calling irq_migrate_all_off_this_cpu() vs and
irq_thread_check_affinity() doing cpus_read_lock().
As far as I see, there is no deadlock because the mask is updated, the
tread is woken, the tread blocks with cpus_read_lock() until the CPU is
down.
But there is nothing that waits for the interrupt thread to complete,
there is no synchronize_irq() invocation which would be required for the
deadlock.

> - Should __migrate_task() fail to return the requested rq make sure its
>   CPU is part task_struct::cpus_mask. This ensures that the current CPU
>   is still part of mask avoiding a possible push by migrate_enable().
>   sched_class::set_cpus_allowed did not see this mask. It might be a bit
>   inconsistent and feels a bit like select_fallback_rq() without the
>   printk.

Here sashiko complains:
| If __migrate_task() fails (e.g., due to a concurrent CPU offline event), =
this
| fallback code forcibly modifies p->cpus_mask with cpumask_set_cpu(). This
| skips the required p->sched_class->set_cpus_allowed() callback and fails =
to
| update p->nr_cpus_allowed.
| Can this bypass global EDF real-time invariants for SCHED_DEADLINE (as
| set_cpus_allowed_dl() is skipped), and allow unprivileged tasks to escape
| affinity boundaries, giving them access to CPUs outside their cpusets?

We did do_set_cpus_allowed() for CPU X and can't migrate there now. We
also don't know if the invocation was successful.

Looking at this, it is not possible hold the CPU-hotplug lock and not
every caller holds it. This seems to be limited to migrate-disable.
Should this happen without it, then the during wake-up the scheduler
will just print "process =E2=80=A6 no longer affine to cpu" pick a CPU and =
be
done with it.
Maybe set the bit followed by do_set_cpus_allowed()?

> Both changes are implemented to illustrate, one is enough.
> I can reproduce this back on v6.8, therefore I assume we have this since
> day #1 of migrate-disable.
>=20
> Reported-by: syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6a9919ac.94649fcc.25487e.0005.GAE@goo=
gle.com/
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  kernel/irq/manage.c | 6 ++++--
>  kernel/sched/core.c | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 57eff26fa646a..75b6798c1d97c 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -8,6 +8,7 @@
> =20
>  #define pr_fmt(fmt) "genirq: " fmt
> =20
> +#include <linux/cpuhplock.h>
>  #include <linux/irq.h>
>  #include <linux/kthread.h>
>  #include <linux/module.h>
> @@ -1044,8 +1045,9 @@ static void irq_thread_check_affinity(struct irq_de=
sc *desc, struct irqaction *a
>  		m =3D irq_data_get_effective_affinity_mask(&desc->irq_data);
>  		cpumask_copy(mask, m);
>  	}
> -
> -	set_cpus_allowed_ptr(current, mask);
> +	scoped_guard(cpus_read_lock) {
> +		set_cpus_allowed_ptr(current, mask);
> +	}
>  	free_cpumask_var(mask);
>  }
>  #else
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index b998ef6b87af4..b090a374fa728 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2674,6 +2674,8 @@ static int migration_cpu_stop(void *data)
>  		if (task_on_rq_queued(p)) {
>  			update_rq_clock(rq);
>  			rq =3D __migrate_task(rq, &rf, p, arg->dest_cpu);
> +			if (rq !=3D cpu_rq(arg->dest_cpu))
> +				cpumask_set_cpu(rq->cpu, &p->cpus_mask);
>  		} else {
>  			p->wake_cpu =3D arg->dest_cpu;
>  		}

Sebastian
