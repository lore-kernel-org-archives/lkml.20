Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794245076;
	b=wz6l+xgRESE63yep7V3HRTbRl8Uk2oJ+7AVrHVy3HCV5LSQHzF20vvhlT8ngkMzqA422
	 xjmVCevfkfCtoP+5VDepNjld7XTcYm46sVq6oRUipwfX+ARPIgVGXu0DP9TASPNbQbkWg
	 p81H5rUYc0SPN4p55gx8RGh8ynDeCqzb3ctIqNiwSu+KIkjkHH1+EjO+rbIX1pwqN2lrg
	 OeGUFD15zXtUonw+x4t1sq+h+nGXjA7xSng45uRPJzQQXLuHKMc5zoNVCK2ho2gzUkdZZ
	 rQ0DX+oEh9K/f4Ye+FJ949I34POf3SQSOY4gbWboT1bpq+PILQQ7ZEhXEwc+Y4Mtipw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=75LWm4YgfF535fyHgmLexuIeGLLIKvWsWeRY/V6ckTE=;
	b=3Sso8GNh4QhtDfXe+k0424rlwJP/CekNFFzZviLCIm3mmi7IxubpA67Mj0AywPm9MzyY
	 R3BqmvjPvAyAgFtRpJb+mxyWjDhyfcUMkACtydw7xbL/kCxQz+p1jCC656QeEAtMsiBev
	 PZP5j6Jye+ksATteBHL6OtM0RBGjmvUX/wAs6RqFQTDnuzU3dO3npLKQxjZ3CXJ1qxHvp
	 k4tlAFQKZ7YIP9uIkde740NvFMuQX8YjxaCQb+3sVQozbJsEZq8nNKje55umL41NI5+wz
	 de+Aix+uI3Hxyf5IG6xAA0NqKRntTpSsr3NgC4QuL1BACqC7ez8sgZahwCpeTuKCm2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D6qDH78Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2512606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2512606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D6qDH78Y
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso167079766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:24:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794245074; cv=none;
        d=google.com; s=arc-20260327;
        b=nO3+bbVgynIMteitqzlwJ+UHsZyUbF3/M6wDq/iJqCwtkNVsSmE1QIMRLU9FhJs8dX
         QUeH+P0DC7EKTfBx7bU5I1pTpGAwBTzXjROHYCC6dsGT5y1QvinKQVxjzmltl0Voj7cG
         sgsgzRa4Il4GYa429+EPcoyTWiZu+0sLfsYdI52IkTdueIMW4SDaMhCNMpJERE5ByZOY
         0KrQNwVyaTWSamqag3TGfBQeovRtSVm6OsrcA3rfnuNT5KzNwHQbYxDqSJEMCON/PPlc
         Ap3do4yXckQB8Ak3zC87noU257W1tUC3nvuI8CWmslGuSBYDjGTpBL5kYgw3NebChl5E
         2g5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75LWm4YgfF535fyHgmLexuIeGLLIKvWsWeRY/V6ckTE=;
        fh=dpfzKIz4N71KaeLAOjzc2Ud058LyRnK1LoT1TllygWI=;
        b=dd29gt9g1QojJrp2BsLqM1bcSVMMdlxVNaFAMtAMopTiwaZAZWSAJQFdZOAn6DemfN
         eJbMxQWbocRTiSrk+OPhRmvMp7nl5ecBBTFM7Y+3SYFQLCVrWAPBjj8hPCa5Pjh19kDv
         p+PD6OEuIj9+rKfKuNqN15l8aDqXUtDtfH50dqyR2Xvjh83t3rPIIiirXemHJ9WtP+0Q
         rcCrwTJEozgUY3n+1GrPcLTvNV5YZ9P2l2Ku2eLyGykq0AAVk2qIFxbab/3GgUYoP1xf
         n2Gh2bFlK/e6CT8SnnLFK8mCtBT5ypsdRDzzeyWb55MSQYcZeZOvonVMPz6BjnS5TAYt
         FTJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794245074; x=1794849874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=75LWm4YgfF535fyHgmLexuIeGLLIKvWsWeRY/V6ckTE=;
        b=D6qDH78YgqioHE5LrN592I7Cj+jIwd4L5q70QyG8m8Lg43CH2XibFp2XWVA9MfwI+P
         1GWiqmg3VLvoJFxRxBLYiKjAVjQ1G2WU9EWdz3YtskGVKkHFeKxD5CUO9FLSF/1RqbZL
         LmrGE7VByNHU8Q31V/S9SL2d6SuhkXMtjD63uJnU/jIUyU+TH6+1ebnImQSBXPPbFdBH
         Wq9DurwU9cPKx6V4hEq5LkRyBHcrmxwX9rjaCwttglLncuH78qxUl+KDoW1hTJjfGaNj
         b8ZZ3PpogRYV2U7DnsXqC3usmn+k+cPE+MlqKbNSOESIPNxTQVEbtRZ3OmfKmv9bSPXz
         Ky0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245074; x=1794849874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75LWm4YgfF535fyHgmLexuIeGLLIKvWsWeRY/V6ckTE=;
        b=USPLC1FP9AK8e3RrOvvs+RF2h5NII2oavezPIlERXOEQhp9a1GWHNKvpRq2HYf1uZb
         wgkdHhaffvx36hEDmVXwtgDouR6nLnJNRYT/fqsc5KYHeix+YNari8L5Nn2FQ7As24pU
         KkLEM32UpDw+o89knZSIwsDFdag7XiIEd+GbhAroxTH8708H6E6pC1z+fQQSBa8vqEOY
         yeprUaMWDkU+XbD6cf428I64mQTp/P+mfpOokvs19ZdHVwPMFVSj1bB1eAliQHhhSTmL
         1C5Tp7Dsc/BO8FTSArs0881n7GM6Uz1tvMDtUR2u5Zy42vEJorRCkjSaST9PEM0bLNox
         j3GQ==
X-Gm-Message-State: APuU4Z+gNNz2tpuQwnmZHUBZJ51lM+6cLvyLE9xwvQogdzP4xx6m7Fl5
	uQAHSw2MXzcZ5jWBx4G3WwH8/ceGP/4U32kB1zpxpunnw94e+izw80e88k0FcC6ocT3k8osa6Yz
	n+3gi2m4chHFBlKEYkUkSYjkUvc8bdoZo0v4qog+38Q==
X-Gm-Gg: AYBFou1xBf4SK4IAMVtzOZr99SSoOO6oUg2NY6IxOANOQsTW/juuVZzfeGZhM8UQxYp
	kMIDjqqxhUxJmcs5n63HTeqJHkjhbs2KB6dEvmpfmw+gzf7LVTJrHQ1RLYQBamroGt5fYyKQh0E
	zXcxMVG8LRhBCRYXGKmhj8yCQt1vkw0d+5iFf2neN+6kRH6zd1wRKvEAd24/gN4ICP8a3xU2qP1
	XKop/kn4fTPQg6rO6kLfqPGZ4OFW0ZbaxED3798md/5Az268UWdReh4HzgVLuCT1CMgznfu/J88
	Pgz08gB3NHkAey6BIaT2ZXXgKBc/PjuLhbtpxW4v+8LS6Q/aweMBUUXLJY99AN7MOowB3ll5ThS
	S84MMSw+69WVftqmlIPqIMA8BwKK4k3lnG5DiXGWUP95vwydd4IwV1l1TvcLMbbwIXG44Rw==
X-Received: by 2002:a17:906:7947:b0:c41:b4e4:7958 with SMTP id
 a640c23a62f3a-c5048c75ebdmr11216566b.0.1794245074059; Mon, 09 Nov 2026
 09:24:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106160621.347228-1-marco.crivellari@suse.com>
 <20261106160621.347228-2-marco.crivellari@suse.com> <au5RmN37RlOCp2m9@pavilion.home>
In-Reply-To: <au5RmN37RlOCp2m9@pavilion.home>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 9 Nov 2026 18:24:22 +0100
X-Gm-Features: AclHuK_ruQ5gLRJqJddE242OYMBgVRbYiI_kvPnQdeuUVsDAR3vcLNtNdQACNCg
Message-ID: <CAAofZF6_JpSDNSKUuePiJx+74tbRH8vJ4spyNGp9KbjFPrbA0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] tick/nohz: Re-evaluate the tick on polling idle and
 on user entry
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 11:15=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
>
> Le Fri, Nov 06, 2026 at 05:06:13PM +0100, Marco Crivellari a =C3=A9crit :
> > On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit=
.
> > There are three places where this is not enough:
> >
> > - A kick handled while the CPU is in polling idle: in idle,
> >   tick_nohz_irq_exit() only does accounting and relies on the idle loop
> >   iterating again. HLT and MWAIT return on any IRQ, but cpu_idle_poll()
> >   only returns on TIF_NEED_RESCHED. The tick always runs in polling idl=
e
> >   for now, but once the next patch stops it there, a timer enqueued fro=
m
> >   an interrupt on the polling CPU would not be programmed until somethi=
ng
> >   else wakes the CPU up.
> >
> >   Set TIF_NEED_RESCHED on the idle task when the kick is handled in idl=
e,
> >   so that cpu_idle_poll() returns and tick_nohz_idle_exit() re-evaluate=
s
> >   the tick.
> >
> > - The return to userspace: if the tick is left running in the kernel,
> >   for example because a tick dependency was cleared (tick_nohz_dep_clea=
r*()
> >   don't kick the CPU) or a timer that kept it running was cancelled, it
> >   fires at least once in userspace before tick_nohz_irq_exit() stops it=
.
> >
> >   Stop it from context tracking right before resuming userspace. When t=
he
> >   tick is already stopped, the common case, this costs a few flag tests
> >   on each return to userspace.
>
> This patch should only be about the return to userspace. Sorry if I
> confused you about that.

Oh, okay. Maybe I misunderstood; no problem anyhow, I will move that
hunk to the other patch.

> > --- a/kernel/time/tick-sched.c
> > +++ b/kernel/time/tick-sched.c
> > @@ -323,8 +323,17 @@ static enum hrtimer_restart tick_nohz_handler(stru=
ct hrtimer *timer)
> >        * - to the idle task if in dynticks-idle
> >        * - to IRQ exit if in full-dynticks.
> >        */
> > -     if (unlikely(tick_sched_flag_test(ts, TS_FLAG_STOPPED)))
> > +     if (unlikely(tick_sched_flag_test(ts, TS_FLAG_STOPPED))) {
> > +             /*
> > +              * In polling idle on nohz_full the idle loop doesn't ite=
rate on
> > +              * interrupts, so it would never reprogram the tick for t=
he next
> > +              * timer. Make cpu_idle_poll() return.
> > +              */
> > +             if (tick_sched_flag_test(ts, TS_FLAG_INIDLE) &&
> > +                 tick_nohz_full_cpu(smp_processor_id()))
> > +                     set_tsk_need_resched(current);
> >               return HRTIMER_NORESTART;
> > +     }
>
> I don't think we need this. The change in nohz_full_kick_func() should be
> enough.

Mmh I'm not entirely sure. Look at this:

Without that hunk:

<idle>-0       [002] dN.1.    21.838685: csd_function_entry:
func=3Didle_cycle [nohz_poll_timer_test], csd=3D0000000006a53f0a
<idle>-0       [002] dN.2.    21.889256: hrtimer_start:
hrtimer=3D000000007acc0071 function=3Dtick_nohz_handler
expires=3D21879000000 softexpires=3D21879000000 mode=3DABS|PINNED|HARD
was_armed=3D1
<idle>-0       [002] d.h1.    21.900238: local_timer_entry: vector=3D236
<idle>-0       [002] d.h1.    21.900238: hrtimer_expire_entry:
hrtimer=3D000000007acc0071 function=3Dtick_nohz_handler now=3D21879002056
<idle>-0       [002] ..s1.    21.900246: timer_expire_entry:
timer=3D0000000076975009 function=3Dtest_timer_fn [nohz_poll_timer_test]
now=3D4294689147 baseclk=3D4294689147
<idle>-0       [002] dN.2.    23.737243: hrtimer_start:
hrtimer=3D000000007acc0071 function=3Dtick_nohz_handler
expires=3D23716000000 softexpires=3D23716000000 mode=3DABS|PINNED|HARD
was_armed=3D0
<idle>-0       [002] dNh1.    23.737250: local_timer_entry: vector=3D236
<idle>-0       [002] dNh1.    23.737251: hrtimer_expire_entry:
hrtimer=3D000000007acc0071 function=3Dtick_nohz_handler now=3D23716014595
<idle>-0       [002] .Ns1.    23.737255: timer_expire_entry:
timer=3D00000000134bb09d function=3Dtest_timer_fn [nohz_poll_timer_test]
now=3D4294690984 baseclk=3D4294689177
<idle>-0       [002] dN.1.    23.737261: csd_function_entry:
func=3Dwatchdog_check_skew_remote, csd=3D00000000ecfea5e9

With the hunk applied:

<idle>-0       [002] dN.1.    10.363861: csd_function_entry:
func=3Didle_cycle [nohz_poll_timer_test], csd=3D0000000046d09235
<idle>-0       [002] dN.2.    10.414660: hrtimer_start:
hrtimer=3D00000000ccc99756 function=3Dtick_nohz_handler
expires=3D10405000000 softexpires=3D10405000000 mode=3DABS|PINNED|HARD
was_armed=3D1
<idle>-0       [002] d.h1.    10.425656: local_timer_entry: vector=3D236
<idle>-0       [002] d.h1.    10.425656: hrtimer_expire_entry:
hrtimer=3D00000000ccc99756 function=3Dtick_nohz_handler now=3D10405001482
<idle>-0       [002] .ns1.    10.425660: timer_expire_entry:
timer=3D00000000654cb5a4 function=3Dtest_timer_fn [nohz_poll_timer_test]
now=3D4294677672 baseclk=3D4294677672
<idle>-0       [002] dN.2.    10.425661: hrtimer_start:
hrtimer=3D00000000ccc99756 function=3Dtick_nohz_handler
expires=3D10435000000 softexpires=3D10435000000 mode=3DABS|PINNED|HARD
was_armed=3D0
<idle>-0       [002] d.h1.    10.455656: local_timer_entry: vector=3D236
<idle>-0       [002] d.h1.    10.455657: hrtimer_expire_entry:
hrtimer=3D00000000ccc99756 function=3Dtick_nohz_handler now=3D10435001994
<idle>-0       [002] .ns1.    10.455659: timer_expire_entry:
timer=3D00000000a060ca9a function=3Dtest_timer_fn [nohz_poll_timer_test]
now=3D4294677702 baseclk=3D4294677702

With the hunk, the stopped tick firing for the first timer sets
TIF_NEED_RESCHED, the polling loop exits and the tick is reprogrammed
for the second timer within a few microseconds; the 10 iterations
captured take 0.92s instead of ~18s. Without that hunk, the CPU stops
spinning on an unrelated event.

So in my understanding tick_nohz_idle_exit() program the tick only for
the earliest timer; when it expire, the tick is stopped and not
rearmed in tick_nohz_handler() (HRTIMER_NORESTART). Without setting
NEED_RESCHED if another timer has been queued it has to wait for
another event that set NEED_RESCHED.

> >
> >       hrtimer_forward(timer, now, TICK_NSEC);
> >
> > @@ -414,6 +423,12 @@ static void nohz_full_kick_func(struct irq_work *w=
ork)
> >               if (WARN_ON_ONCE(tick_sched_flag_test(ts, TS_FLAG_INIDLE)=
))
> >                       return;
> >               tick_nohz_full_update_tick(ts);
> > +     } else if (tick_sched_flag_test(ts, TS_FLAG_INIDLE)) {
> > +             /*
> > +              * In idle, tick_nohz_irq_exit() doesn't re-evaluate the =
tick, and
> > +              * cpu_idle_poll() only returns on need_resched().
> > +              */
> > +             set_tsk_need_resched(current);
>
> And this part should move to the next patch.

Sure, I will!

Thanks,
--

Marco Crivellari

SUSE Labs
