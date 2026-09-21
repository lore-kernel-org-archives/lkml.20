Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C323048EC93;
	Mon, 21 Sep 2026 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990259; cv=none; b=VE1ql7GlvLyccwKr/Ra2KWWTAcZt29BYI5pd0c4vG28ax4dsd9aXV64aJZQe6nLHQioYhdkGY0MTYWf1SRihqoREuRBcBVqLdiMd1jnguXAKU63QqQiwVOVFA75YW2Y2b0+/5VZmlAoxfnoSYuB3ldUkNFlcjbHHenP5xAMR2QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990259; c=relaxed/simple;
	bh=9uD6m1QMrum8kNgyQzmjuzlc5qVbTY+Wz5mVGTuoBt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBWuXwEnViXa6OedpBBLAnK7X282gS6FjAgPm5J5Xx0sG2jGRhdmlH96syqvyPBINEd6svCC+sOnyfMN0Ll4VpH1F9i41Qe01Hf/2egXhqWSZD856/WaYkjirtc2/vuoLnaUqtsKPISth69CblipEmZlmbGpDusOJKnSxpEOOkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gcjioh47; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pJJLpWuI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gcjioh47";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pJJLpWuI"
Date: Mon, 21 Sep 2026 13:30:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789990252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqDX8xLvebhZEuLKrDsOW36y6bdIhUzabRWLj6Vht3c=;
	b=Gcjioh47v1+20lpKBXIC9L03cjG00G3CeuWj5mf2gl4x8FAHmcOsiDillj/D8o/jd2oVlS
	KM3QoGuTSjegRnzW+vdQVp4azRIwsHiDKF2HJNqpICVR2zUfIS3gozGtBr+TKiIT/8OHqY
	CZxONNd1XMCx/dBwJxwWOpNHiMxVj6pmWqZKuJuv2A1l8X2Ov0q9j1qn/hsapwpTFW2rd0
	hzu8VyRaFNvnX446WhmKnT6EANU7L6yfaIo5uopHKHg+M8UsNMQzqjwfjnaprr7sPN/p+B
	3Ux3IYH2CmXsIlwFbz9nu5g648CP6gisthLc8QxOHCEBYFDSc0OKiJOShYp6IA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789990252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqDX8xLvebhZEuLKrDsOW36y6bdIhUzabRWLj6Vht3c=;
	b=pJJLpWuIOcUBMA7tUxM88GG6ZGipkBDZoPzIgKOdrY+VSRKBAu9ehVucq5pPpsTXP9qZeu
	uHBXHk6XZqrmcvCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched/doc: add a preemption model overview
Message-ID: <20260921113050.lwG9IphF@linutronix.de>
References: <20260920022003.1202546-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260920022003.1202546-1-quchaosheng000406@163.com>

On 2026-09-20 10:20:02 [+0800], Quchaosheng wrote:
> The scheduler documentation describes the individual scheduling classes
> and various tuning knobs, but there is nothing that describes the
> preemption models themselves.  The only place where they are documented
> is the kernel-parameters entry for "preempt=3D", which explains the boot
> time parameter but not the models it selects.
>=20
> Add Documentation/scheduler/sched-preemption.rst, covering the four
> models, which of them can be selected at runtime, and the mechanism
> behind PREEMPT_LAZY.  The lazy model in particular is easy to
> misunderstand: a lazy reschedule does not send a cross-CPU reschedule
> IPI, so it is only committed on the return to user space or on the next
> tick.  That makes the tick an upper bound on lazy preemption latency,
> and it means the usual real-time latency tools, which wake a pinned
> task on its own CPU, do not exercise it at all.
>=20
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
>  Documentation/scheduler/index.rst            |   1 +
>  Documentation/scheduler/sched-preemption.rst | 120 +++++++++++++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 Documentation/scheduler/sched-preemption.rst
>=20
> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/=
index.rst
> index 17ce8d76befc..d6d75421756a 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@ -23,5 +23,6 @@ Scheduler
>      sched-stats
>      sched-ext
>      sched-debug
> +    sched-preemption
> =20
>      text_files
> diff --git a/Documentation/scheduler/sched-preemption.rst b/Documentation=
/scheduler/sched-preemption.rst
> new file mode 100644
> index 000000000000..fc6fd89789cf
> --- /dev/null
> +++ b/Documentation/scheduler/sched-preemption.rst
> @@ -0,0 +1,120 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Scheduler preemption
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The kernel can be built to run kernel code either uninterruptibly, or wi=
th
> +varying degrees of preemptibility.  These are the *preemption models*.

  These preemption models apply only to the kernel - a user-space task is
  always preempted by the scheduler regardless of the selected model.

> +
> +When CONFIG_PREEMPT_DYNAMIC is enabled the preemption model can addition=
ally
> +be selected at boot time with the ``preempt=3D`` command line parameter,=
 without
> +rebuilding the kernel.  See
> +Documentation/admin-guide/kernel-parameters.txt for the parameter itself.

  Additionally the preemption model can be inspected and changed via the
  /sys/kernel/debug/sched/preempt file (which is available for debugging
  purposes and may change).

> +
> +The models selectable at runtime are:
> +
> +	=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	none		No preemption of kernel code other than at explicit
> +			``cond_resched()`` / blocking points.
> +	voluntary	As ``none``, plus ``might_sleep()`` sites.
> +	full		Any section that is not explicitly preempt disabled
> +			may be preempted at any time.  Tasks also yield
> +			contended spinlocks.

What does "Tasks also yield contended spinlocks" mean?

> +	lazy		As ``full``, except that a reschedule requested by
> +			the fair scheduler does not interrupt the target
> +			CPU.  It is committed at the next return to user
> +			space or at the next tick, whichever comes first.

  Same as ``full` except that the scheduling request is delayed until the
  return to user space or the next tick, whichever comes first. This delay
  does not apply to real-time tasks.


> +	=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Not every model is available on every kernel.  On a kernel that selects
> +ARCH_HAS_PREEMPT_LAZY, only ``full`` and ``lazy`` are offered and ``none=
`` and
> +``voluntary`` are rejected.  A PREEMPT_RT kernel likewise does not offer
> +``none`` or ``voluntary``.

I would rephrase it to
  On an architecture, that provides support lazy-preempt, only =E2=80=A6

and maybe=20
  A PREEMPT_RT kernel offers always ``full`` and ``lazy`` if provided by
  the architecture.

> +The model that is actually active is reported in the boot log::
> +
> +	Dynamic Preempt: full
> +
> +PREEMPT_LAZY
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +``lazy`` is the interesting one, because its behaviour cannot be underst=
ood
> +from the "can this be preempted" question alone.
> +
> +When a wakeup makes a running CFS task preemptible, the fair scheduler c=
alls
> +``resched_curr_lazy()``.  With the lazy model inactive that is just
> +``resched_curr()``; with ``lazy`` active it sets ``TIF_NEED_RESCHED_LAZY=
``
> +instead of ``TIF_NEED_RESCHED``.  The consequence is in ``__resched_curr=
()``:
> +the cross-CPU reschedule IPI is only sent for ``TIF_NEED_RESCHED``.
> +

This is a technical description of the code. From a bird's eye view:

  The scheduler becomes a wake up request for a task and marks it
  immediately as eligible for running. If there is an idle CPU which is
  suitable then it will move the task there. Otherwise the scheduler must
  decide which task to preempt. Once a decision has been made, the task,
  that needs to be removed from the CPU, gets a "NEED RESCHED" flag set.
  In tracing this is visible in the "need-resched" column and is denoted
  by a ``N`` for "NEED_RESCHED" or ``l`` for "NEED_RESCHED_LAZY" request.
  The next step for kernel is to honour this scheduling request.=20
  A task executing in userland can always be preempted. A task executing
  in kernel can only be preempted when it is safe to do so.
 =20
  - No Forced Preemption
    Code paths with loops have often a "cond_resched()" function which
    performs scheduling.
 =20
  - Voluntary Kernel Preemption
    Same as in the previous model and additionally functions, which are
    known that they may block and schedule, have also such a
    "cond_resched()".
 =20
  - Preemptible Kernel
    The previously mention "cond_resched()" mechanics is not involved.
    Instead the kernel tracks preemptiblity and schedules after a
    scheduling request (NEED_RESCHED) once possible.
 =20
  - Scheduler controlled preemption model
    Same as in the previous model except that the default scheduling
    request is "NEED_RESCHED_LAZY". This scheduling request is not
    honoured immediately, even if possible, but delayed until the task is
    returning back to userland (allowing running to completion).
    This "NEED_RESCHED_LAZY" scheduling request will be turned into a
    "NEED_RESCHED" request on the next HZ tick should the task not
    schedule on its own before that. This is denoted in the tracing output
    by a "B".
    Real-time tasks use always the "NEED_RESCHED" mechanism to avoid any
    delays.

Wouldn't this do the job?

> +A lazy reschedule therefore does *not* interrupt the target CPU.  It is
> +committed later, in one of two ways:
> +
> +1. On the next return to user mode.  ``__exit_to_user_mode_loop()`` trea=
ts
> +   ``_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY`` as a reschedule reques=
t, and
> +   ``xfer_to_guest_mode_work()`` does the same for a vCPU returning to g=
uest
> +   mode.
> +
> +2. In ``scheduler_tick()``, which promotes a pending
> +   ``TIF_NEED_RESCHED_LAZY`` to a full ``TIF_NEED_RESCHED`` once per tic=
k.
> +
> +The tick is thus an upper bound on lazy preemption latency for CFS tasks=
: a
> +runnable CFS task that has been passed over is picked up within one tick=
, not
> +immediately.  The tick is guaranteed to run in the case that matters: wh=
ile
> +more than one CFS task is runnable on the CPU, ``sched_can_stop_tick()``
> +refuses to stop the tick.  A lazy reschedule aimed at the idle task is p=
romoted
> +to a full one instead.

This is an implementation detail I think.

> +That is the intended trade-off -- it avoids sending an IPI to every CPU =
that
> +has a runnable CFS task -- and it is why ``lazy`` gives up latency in ex=
change
> +for fewer inter-processor interrupts.

Maybe I miss the point but a wakeup never sends an IPI to every CPU. It
only sends one to the CPU which should run task in a cross-CPU wake-up.

> +The idle task is never delayed: ``__resched_curr()`` promotes a lazy
> +reschedule to a full one when the target is the idle task.

You never explained what an idle task and this is not visible in ps
either. Also an implementation detail.

> +Only the fair scheduler issues lazy reschedules.  RT and deadline tasks =
are
> +still preempted immediately.  ``lazy`` is therefore not a replacement for
> +PREEMPT_RT; it is a way to keep most of the responsiveness of ``full`` w=
hile
> +removing a large part of its IPI traffic.

Not sure it is the IPI traffic. Of course the IPI is absent on cross-CPU
wake-ups. The main point however is to allow "run-to-completion" for the
task. By pushing a scheduling request to the point where it returns to
userland, the "in-kernel-work" has been done. That means all locks have
been dropped so another task will not ask for a mutex which is held by
preempted task. Also it will not write-back cache hot memory which needs
to be dragged back once it schedules back-in.

> +
> +Debugging
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The scheduler debugfs directory provides ``/sys/kernel/debug/sched/preem=
pt``,
> +which lists the models that may be switched to; the active one is enclos=
ed in
> +parentheses::
> +
> +	# cat /sys/kernel/debug/sched/preempt
> +	full (lazy)
> +
> +Writing a model name to the file switches to it.  A name that the kernel
> +cannot select (either because the model is not built in, or because it i=
s not
> +available on this kernel) is rejected with EINVAL.  The ``preempt=3D``
> +boot parameter rejects such a value as well, but only prints an ``unsupp=
orted
> +mode`` warning and keeps the default model.

I added a small point upstairs, you have a bit more here, not sure what
to do about here. Reading and writing is sort of obvious.

> +Measuring
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Two things routinely trip people up when measuring preemption latency.
> +
> +First, the classic real-time latency tools do not exercise lazy preempti=
on at
> +all.  Lazy only applies to the fair class, so waking a SCHED_FIFO task t=
akes
> +``resched_curr()`` and preempts immediately, whichever model is active. =
 And

The scheduling request happens immediately for SCHED_FIFO, yes. But
preemption does not happen immediately on NONE for instance.

> +when the woken task runs on the CPU the wakeup happens on, even a fair l=
azy
> +reschedule is committed as soon as that CPU returns to user mode, which =
for an
> +already runnable task is immediate.  For both reasons such workloads mea=
sure
> +the same under ``lazy`` and ``full``.

I don't comprehend that one.

> +
> +The difference only shows up when the woken task is *not* running on the=
 CPU
> +where the wakeup happens.  In that case the waker requests the reschedul=
e, and
> +under ``lazy`` that request is not turned into an IPI; the target CPU on=
ly
> +notices at its next tick.  A measurement that cannot distinguish ``none`=
` from
> +``full`` is usually not measuring the preemption model at all: in the ab=
sence
> +of ``lazy``, the reschedule IPI is sent regardless of the model and prov=
ides a
> +preemption point even on PREEMPT_NONE.

This is a detail that could be mentioned. However, despite a wakeup (as
of try_to_wake_up()) the scheduler can decide to keep the current task
on CPU (because it did not consume enough of its time slice) and not
schedule the runnable SCHED_OTHER task immediately. There is no
requirement that a freshly woke up task must be scheduled right away.

> +
> +Second, when driving cross-CPU wakeups from a periodic source, keep the =
wakeup
> +period away from integer multiples of the tick.  A period that is phase-=
locked
> +to the tick will hide (or invent) exactly the effect that is being measu=
red.
> +Add jitter to the wakeup period, and confirm the active model from the
> +``Dynamic Preempt:`` line rather than assuming that ``preempt=3D`` took =
effect.

If you do timer-based wake ups for SCHED_OTHER tasks you also have the
"slack" value. Also you can have jitter from preemption or interrupts
disabled regions.

Sebastian
