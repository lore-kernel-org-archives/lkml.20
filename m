Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1543C4B91
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267254; cv=pass; b=RUHGrfaJRY9Svx3oxVNVBRPdyT5y6nbYqgRLWhGk7X8KYWsBqIByhH8M/y98R0lh/aPv8wp9xKZ3SAyGe6LbCzsnoKTCNcZti4C+DxBNJsFYtMfCLo5oCUvfZii7bGy5lXag9KrT1lsNurneBnGT1wFdxbvgQ2oyIhuaZLtzfkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267254; c=relaxed/simple;
	bh=5ox2ct2yboHyEver6vM5hxy9diHibI+8bx6OOjEZObc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hA7GRWhicKCnF//x2C29B7pKQQt9Pvf2cS4IZCdDA2K5Yu1FCVBc1zplcHnIGZJwkCIPWGg9e1sKhUqc+ot9R2R9kTwCxjw7//Tj1mH1dMwVjRHAN5u9BSwneV3IgYYK5nwYveYA9/4aiORYfHxaUsy9OIgpLbUllcvneXNwvvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bD9TCcJ3; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bD9TCcJ3"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so949213a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788267249; cv=none;
        d=google.com; s=arc-20260327;
        b=eN6EHMG31Ok8y5ATUxbhSB5EYhYG8TPU1pDzCw1cQeC5MNeO8NEwoxbdfnB75Bj/9m
         suZ1iv/YEyW9jUZS/jzPfxX3muxPKXllrrg5/GMv6Un3Bxybpuntg7qAFF8Nz+0lvPPQ
         dWbkWcmTeyyfUf12Xb5XVBxa/XxOvo0qnfH5v1LBjbPekk8CejCy72iLVKxVJbX8NXAb
         U595ikM4dtt76WnaWUVJsRUbc6sfCQEh7C7s885t4yKKleYjrSTg9QL9KDPpzd8dFIct
         kdmpaQ0YvOluEVgWiQT+kHrJKe5ApRCjlLjaFDyk+k5HYJj7XfGHtUzPncsqAOMiriIc
         qzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RPgzm55fAw2ptYf8Sl/ajhFPBiEwWjWRkzAJIcml568=;
        fh=XH96SMq23FPctBfih2a+qcECTuEP2CEttSjpc8R1EkA=;
        b=msdmCWgN2jbCIYVITbLMVTfq+t6aK68Ydgshl8Kdq+mnwocm8NhDit+/fifETHYeLB
         YluF+givVn4yZqe0RbscG6wg6fCjLkaA5jwt8gnAYsc0BK6neYt6gl2MLf4w1T1lo4gg
         /VqUr9zjwWx8ZMLzFSiW6WQBiTlOkEVnm2ai4GIoP6JqijPi2yE0PgUHKV9/Ik8tgwnl
         5xI+Wecyu0UzaU27Ha6ui8+9Y8SziyIpDDA31msQgtsYqHjjg4y5q3/VlcUmFKv00gYj
         TYY7sKK78VhMo1tiZZKF5o3j9KPr4RDYETsZ6JG9Oyh4yDjOr9pNNr2S5adlrVIfMhUL
         Uh1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267249; x=1788872049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RPgzm55fAw2ptYf8Sl/ajhFPBiEwWjWRkzAJIcml568=;
        b=bD9TCcJ3u7W6mCldzDKZcLCPvFTU0KwDPGVEPf1wzQJk++ZXgiqU16pHHRKJabWjNc
         9Ka6pQDiMUGr6ZIPVk053313qdsDEplJsSaOXK+18ZAiIs+CgqclhNdkZdZ1/uewtkyo
         ndteRQ3hRLj8B0f+X8Wxqiu4mLxyW1BRYOtDonGy9umHn6uKyYFJz+BVjVVJRHkPB9Xt
         xOVHe+SVEzhfn0XLIl/eTMyRGTp6KK7RVdoKUZKizv75+s3qca0Zm7Me2xWo7bZrX4NE
         nuST78PLWVAfl08ICYd1KT2KbBJa84jufAleuMzPZBiuQ/BKvhm73HJz/UqXOJu3LZ/m
         MqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267249; x=1788872049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPgzm55fAw2ptYf8Sl/ajhFPBiEwWjWRkzAJIcml568=;
        b=HDPt9xlZ+2MeAGqlyQQmFHmLebNKZZycM2iv4cIKgsagXSLn3mxr40CVokjKJRqf+d
         bMUDdi/Mtwc2jlPJMZ/uNtM5AA1yOLb/E3iC8ZlQG9BiMCCgzxrtdYmRBeVtY0HmLgX5
         Ody0DcvcsVQm3vCtFAQmaZpXhZesJSIQ0s1n6dtieuGQQEOpNwwJ765RYFTlgKsseWco
         ko9LJc939vEK2JE9+WDiWZaMN832oiyo9zAYMdLII/f98Wr+jHkgq7BSdLvdbeNaV9N8
         Rob/NnMcZhKxp8m4WE08gRLQP5JHv1BwKQYoar93rmtLwcNxTU94nz8r7i8ycjflxakr
         UdQA==
X-Forwarded-Encrypted: i=1; AKwUvBzO0qGsC469zqJIoPC0ebZJu6HXSS+Pe9fzkJeO9vg8lVF2p6yKZbsrML+PCNL7l4twdq810PiDWASeVx8=@vger.kernel.org
X-Gm-Message-State: AFuF++loSZ4LOfm1ips3gKO/Nc0dSRjxX4DbKcQNVkIyPHGHNgitTjdd
	EmawKysqMJ/DMSeGBaCdVoVaRbjlZRfufV7WltWofC1w5kvpEwgwYCF9kDprwmAUHsrMG1k/K1J
	fnHmezwy+Qc8954/ztVLjuDWnsCVXZBY=
X-Gm-Gg: AYBFou3w+7XR8uBYSg0yTLQEJCi6cyymbLaIu42k77pRm3TF/5zbTjjsoexcAeBIHDx
	eyB0DzxGcXNWqM6UJGvZJ3mK1DfnrtOgSOwAG3qQq8aEalN9DvnyUi9bMp37oMm2sFE4PEvbEWM
	qtypKp04dTPqWpPrGUoskgFD8pBQloo5+52z+y2V3kPZ67cC8DcEuDrLA6O6DkLNFwHfF4VI4YO
	RPtn7loXL86VRCzA1hgZiUHAp6yEPqSl/Zo/4CfIU41bRP1a8k4aaIjPmvB3yd46S25nmx4qdnq
	4MJN0hRMweMW/JXIhafei9ZbbDVcPjFGGHQ4eNE0yye/USgcPhf3kAj1n8E=
X-Received: by 2002:a05:6402:24d9:b0:6a5:f9ab:bdfd with SMTP id
 4fb4d7f45d1cf-6a60d15f4c5mr16070508a12.0.1788267248852; Tue, 01 Sep 2026
 05:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810122758.183765-1-puranjay@kernel.org> <20260810122758.183765-2-puranjay@kernel.org>
 <20260826144636.3IRUXeFV@linutronix.de>
In-Reply-To: <20260826144636.3IRUXeFV@linutronix.de>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 1 Sep 2026 14:53:56 +0200
X-Gm-Features: AcwNN1VMVsqA5TbOoGtCimTix5w0rFzm4VjPnSAE7cacecLqde7MaGCaDPITNHM
Message-ID: <CANk7y0hbwXL7nBDgjTgrneBejEgGrsZnc02RztG-aSBEEvAcwQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] rcu: Make call_rcu() safe to call from any context
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Zqiang <qiang.zhang@linux.dev>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Matt Fleming <mfleming@cloudflare.com>, 
	"Harry Yoo (Oracle)" <harry@kernel.org>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	bpf@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 3:46=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-08-10 05:27:50 [-0700], Puranjay Mohan wrote:
> > --- a/kernel/rcu/rcu.h
> > +++ b/kernel/rcu/rcu.h
> > @@ -572,6 +572,17 @@ static inline void tasks_cblist_init_generic(void)=
 { }
> >  #define RCU_SCHEDULER_INIT   1
> >  #define RCU_SCHEDULER_RUNNING        2
> >
> > +/*
> > + * Defer whenever interrupts are disabled, since a callback-list opera=
tion may
> > + * be in flight on this CPU.  Not before the scheduler is up: irq_work=
 is not
> > + * usable that early, and rcu_init() itself calls call_rcu().
> > + */
> > +static inline bool should_rcu_defer(void)
> > +{
> > +     return IS_ENABLED(CONFIG_RCU_DEFER) && irqs_disabled() &&
> > +            rcu_scheduler_active !=3D RCU_SCHEDULER_INACTIVE;
> > +}
>
> Why does the description say that the defer part is for usage from NMI
> and the test here has irqs_disabled() instead of in_nmi()?

We defer for both irq disabled sections, hard irq, and in_nmi() and
checking for irqs_disabled() covers all three.

>
> > +
> >  enum rcutorture_type {
> >       RCU_FLAVOR,
> >       RCU_TASKS_FLAVOR,
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index 21b6ce1dffb63..3bf3a250f9de8 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -3206,6 +3204,103 @@ __call_rcu_common(struct rcu_head *head, rcu_ca=
llback_t func, bool lazy_in)
> >       local_irq_restore(flags);
> >  }
> >
> > +/*
> > + * Re-issue deferred callbacks straight to the enqueue so they cannot =
defer
> > + * again.  ->defer_lock serializes the drainers: this CPU's irq_work,
> > + * rcu_defer_flush() and rcutree_migrate_callbacks().
> > + */
> > +static void __rcu_defer_drain(struct rcu_data *rdp)
> > +{
> > +     struct llist_node *node, *next;
> > +     unsigned long flags;
> > +
> > +     if (!IS_ENABLED(CONFIG_RCU_DEFER))
> > +             return;
> > +
> > +     raw_spin_lock_irqsave(&rdp->defer_lock, flags);
> > +     llist_for_each_safe(node, next, llist_del_all(&rdp->defer_head)) =
{
> > +             struct rcu_head *head =3D (struct rcu_head *)node;
>
> Why do you need the lock. This is still not clear to me despite the
> comment. You can do llist_del_all() towards another list and then feed
> it into rcu_do_enqueue() one by one. And you use the LAZY part.

Because rcu_barrier() can call this for each cpu and at the same time
rcu_defer_drain() can call it too, so this would cause a race where
the irq work can remove the callbacks (llist_del_all) and before it
can enqueue them, rcu_barrier will see that the list is already empty
and will not wait for these callbacks. We want the llist_del_all() and
rcu_do_enqueue() to happen atomically so rcu_barrier() can work
correctly.

>
> > +
> > +             /* Bounds a node self-linked by a double call_rcu(). */
> > +             head->next =3D NULL;
> > +             rcu_do_enqueue(head, head->func, false);
> > +     }
> > +     raw_spin_unlock_irqrestore(&rdp->defer_lock, flags);
> > +}
> =E2=80=A6
> > @@ -4231,6 +4330,9 @@ rcu_boot_init_percpu_data(int cpu)
> >       rdp->rcu_onl_gp_state =3D RCU_GP_CLEANED;
> >       rdp->last_sched_clock =3D jiffies;
> >       rdp->cpu =3D cpu;
> > +     init_llist_head(&rdp->defer_head);
> > +     raw_spin_lock_init(&rdp->defer_lock);
> > +     rdp->defer_work =3D IRQ_WORK_INIT_HARD(rcu_defer_drain);
>
> Why is this IRQ_WORK_INIT_HARD() instead, say, IRQ_WORK_INIT_LAZY()? Is
> there a requirement that the RCU callback needs to complete asap and not
> be delayed to the next tick? This would give kind of the LAZY part.
>

In discussions with Paul, we concluded that we need HARD because in
low memory situations delaying rcu callbacks can be problematic. Given
that we are already deferring the callbacks, it would be nice to have
them enqueued asap. But if there are downsides to this we may change
it later.

> >       rcu_boot_init_nocb_percpu_data(rdp);
> >  }
> >
>
> Sebastian
