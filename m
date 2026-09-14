Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D61DED49
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354570; cv=pass; b=bpNIBqATEaVHXXpfoMCQoYJK5cxFVtd5XG7Cq/U+OsYRS/KsM61SQ1vlwd+izyYt3ANnqYUno/53imK3b6yOLrleEqywGB3jH4jIneXUXG68W76eT/emJtlPdWPRd3jEytmvPXyz54lovUyjV6qS6s3vU0TW2PAlAJl01K4y8pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354570; c=relaxed/simple;
	bh=20V9EK1SKEpkD8lWw3WkIYuPgZD0RPi5B4sAnBdaws8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsSCYJ6x0Wz9eG4h6j/JnLcldEctsSVaz0L5ZGf5nhbivnnuQUE7WFahucSAJl3HJELMaAFvbvGuSJ3fUdBON5TVPwc040D9aXPf/GQ6xHpxDWFcl6vklUDVbZSa49kcUY8tvbUK8TEc3VJizk66V7BiDHZs0oi4YLxhlwBdZA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N934W6cL; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N934W6cL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49e717c9841so7874135e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789354567; cv=none;
        d=google.com; s=arc-20260327;
        b=N2VzQrDY/OQrFgLJO00baTf4QO5Gx+LK4q2FrXwMlqsemt4jPAasdnXD1oFUPocgjv
         ijPG6YEVC/zcm6X+rLuQVabfpBNzLcvIPHbRR7hGOJxAVrJ8vO6AFVhe9ZFA5G8T+qho
         3VZlnVAN8hVrsnc/WtUDy/1STsTf2ShgPqU4sOYJIOrDlHF838xUgRXIqQzV+c2fMhB/
         Kf3XFKeslA5HZ3C3gsvFgVq4pGzDG8nK5SOW5g8kafm8nPXJaEm530oKTg3OOOzCBY5K
         d2ejDgnN6besye8AiQjdFVjuYv/T5mgDyBRmMGIDsz66lZfR12PVAaL51n3+ZHI8T79F
         Eekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h+MNAsZ5ycgRBqHHUq3Phypnjc8mzOMVB7LP0WVXtFQ=;
        fh=03n+st7r3kVmVWjblUBkKMywFcP6RI8aObRWMOI7TPw=;
        b=Ic959wgsd+QQYtorkhAl3GQZXXPkKFKRGqM0/T4OxGS4ETGita20/6Ei86M5uEQ5Uc
         3LjuhWJtd3XfgZjHvmr7OjofBpCwOGQISXblhE0c6Z495BQHHUu/1vMwvyrkeIOFIK3W
         CReTknXzh7iEgHVRd9+FGIPJAkx2BGTfiI/tcFsLrvU5YN7QCGT/u7Ov/fh78Migo5wX
         uRPa5Onri1Prb+qdWBm0xL4pq4cM4l/4J4QXxijgRadVEiloeLD3zfxRiKnSSAVg3dPg
         Sfqo2pDlDEH7RG194STAysSGVLjUlhq7JU9D1k2YMWAE75HDrfuLbbCROOC/+oK5lbyd
         l03Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354567; x=1789959367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h+MNAsZ5ycgRBqHHUq3Phypnjc8mzOMVB7LP0WVXtFQ=;
        b=N934W6cLRhiTVjfIDrwygD56+Tf5jX3YgYhZ+qkL3R2cUmvmCPDeYkJS5AiNNK6Ipk
         d6NBsrNIcu+C+0Knb+ZFQ8rtWt3JG8HNi5A+5wXZTa3JftppyuG47R8dBTdaVHKZywKg
         L8xk7iISktwYFvzv/Gmg8HZribp/DJG3X0PaRhtBbUsXMVljnLBRzQyBuNO5+2s9YbWe
         U8r+GQ46tOrMAIMwfP0OUxTuVprK07vz1fR+hp7JtQ5LWprqUrctLyACFW0sQWwxnGkv
         2sXFMpMRZFzCYSnCm38Egj5RMGiIk+nH82AN/++TmDj+Cl4w9u2Ut8yVoZarifo6F6Tr
         VIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354567; x=1789959367;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+MNAsZ5ycgRBqHHUq3Phypnjc8mzOMVB7LP0WVXtFQ=;
        b=KFOaR//Al+BCkJWoOto2QCcFJ+WQu2mPIXjXZO5eUtSIjdSIFrOsCAQGnEoHuCVXed
         Tj8K/Uvltnzgk/LBwlI2YS9jFAxbA+AZtid9xWw6bBE+a8RQ2zp9DRAKRh4bK7qMtOy+
         ihFCP+pfqN4+gXhQS5ZbVq3xHuf2NyaDLF4psY40MPEac9iN66d1mQPPgRzlivslOOmk
         vf/Xhw2/rwtqBe7vunu1/SAH+YOdrezFYRryn/aI33p0l6jjVD6TgG7UAa09MpHwKjkp
         MnJl/6inNzYDLM3SWSOo2pDXKCMuSK3kuQkMRFEKYEGO0r1fAdCrAZqwweVT1t6tRq4D
         IEog==
X-Forwarded-Encrypted: i=1; AKwUvBwTJAarmtF7VmmmMlrVMFhPBOIb2wtL64JeKSYGTrN9j+MPUJSbEBQPYCYUZV/9Mg3twqLjGlzK2xHc4b4=@vger.kernel.org
X-Gm-Message-State: AFuF++lPp0vZ7tjzzePSctAVICvPKYd9zHiX9mhZtjvxhnB65pQQRNL2
	4w4CusdREw/1khFumI4+tyYasjpi5e1bsReH4liyutgTJhtAf8HT8SBaD30VJs3D5jblCi6UZuK
	v0Ni1G/DrbPrCKbLYLCjp/8DeHb7jiKk=
X-Gm-Gg: AYBFou3TmahzREeapHjfVArkseqYhwtuf3X2BDIyYB8IahkJDJ4SC11DBQ7I7+QZ66N
	tCjcqXE9hAbw29moRV6fOn/UDfhkg3k/5kGvLEXdElI1+1vc/7+Dciu+821GVFIN9ToQfc30xjM
	GxZwfr2dF81zjI7x+LUQL4xgieHz8WBZxkNGViPOor3P+15EFfZ/CbZWy7r/TM80uuu/BwHqQM0
	VHRa864vCiFDjrnq9/eOe5giV7WmGh1N7HJwewxKKZu+svLK/Azt/83L+hja8X+XruXaYQR02oV
	sJjKRXKvWgeSEuyUYMte+474VYv30ags8Hfd2dk3Ml7lDFObYk7j32mReGse8cUiosH/ySXLytD
	lsc6O2s9Hdh6WQIuA9dx/xuU=
X-Received: by 2002:a05:600c:4754:b0:49d:174e:2a1e with SMTP id
 5b1f17b1804b1-49e7a66c99fmr4339645e9.19.1789354566807; Sun, 13 Sep 2026
 19:56:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911093515.2802551-1-kunwu.chan@gmail.com>
 <0cf7b133-d2fd-4298-adba-70a2b86d1892@paulmck-laptop> <CAN_Opa-uuim=aiOuAmHYUoD5S=vBREemj-dCvcunF-4zNdp1=A@mail.gmail.com>
 <e6be6641-731c-4b21-ad4e-c05bedc388d6@paulmck-laptop> <32e952728ea1a9c25c2b56de468f43a32104b8a8@linux.dev>
 <CAN_Opa9v-6Kx2tUFkT4YiOVM_tgZuUVOkbwieOrC6WfbNj_=kA@mail.gmail.com> <31e11dda-2f23-42b1-89a9-98e08f32d539@paulmck-laptop>
In-Reply-To: <31e11dda-2f23-42b1-89a9-98e08f32d539@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 14 Sep 2026 10:55:54 +0800
X-Gm-Features: AcwNN1WgyOpRgH9sg6e2HCUH71GOxZz6HqF_Oy4HTY88xwbkYvQ1fbG-qvqctww
Message-ID: <CAN_Opa8ZrB4n+qHRw=j-1v4CYp_NoLgqd0Dx_GjJ+3ZM19CdUg@mail.gmail.com>
Subject: Re: [PATCH] srcutree: Add lockdep and early-boot checks to synchronize_srcu_atomic()
To: paulmck@kernel.org
Cc: Zqiang <qiang.zhang@linux.dev>, jiangshanlai@gmail.com, josh@joshtriplett.org, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:18=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Sun, Sep 13, 2026 at 06:36:56PM +0800, KunWu Chan wrote:
> > On Sun, Sep 13, 2026 at 2:21=E2=80=AFPM Zqiang <qiang.zhang@linux.dev> =
wrote:
> > >
> > > >
> > > > On Sat, Sep 12, 2026 at 08:37:33PM +0800, KunWu Chan wrote:
> > > >
> > > > >
> > > > > On Sat, Sep 12, 2026 at 12:47 AM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> > > > >
> > > > >  On Fri, Sep 11, 2026 at 05:35:15PM +0800, Kunwu Chan wrote:
> > > > >  > Add the lockdep annotation, same-type SRCU nesting warning, an=
d
> > > > >  > early-boot check used by __synchronize_srcu().
> > > > >  >
> > > > >  > Suggested-by: Zqiang <qiang.zhang@linux.dev>
> > > > >  > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > > > >
> > > > >  Queued for review and testing, thank you both!
> > > > >
> > > > >  Interestingly enough, it is now the case that there is a grace-p=
eriod
> > > > >  wait that can be placed in a normal RCU read-side critical secti=
on.
> > > > >  Does this mean that we should also adjust the --do-srcu-lockdep =
testing
> > > > >  in tools/testing/selftests/rcutorture/bin/torture.sh?
> > > > >
> > > > >  Thanks, Paul. Good point.
> > > > >
> > > > >  I=E2=80=99ll check the current `--do-srcu-lockdep` coverage, inc=
luding the
> > > > >  case where `synchronize_srcu_atomic()` is called from a normal R=
CU
> > > > >  read-side critical section, and follow up with the necessary tor=
ture
> > > > >  testing changes.
> > > > >
> > > > Sounds good!
> > > >
> > > > Perhaps you and Zqiang can work together on this. Co-developed-by,
> > > > for example.
> > >
> > > Hi, Paul and KunWu
> >
> > Hi Zqiang,
> >
> > Thanks for pointing out these cases.
> >
> > >
> > > Should we also consider the following situations ?
> > >
> > >
> > > idx =3D srcu_read_lock_atomic(srcu)
> > >
> > > by interrupt run hardirq context:
> > >    synchronize_rcu_atomic(srcu)
> > >
> > > srcu_read_unlock_atomic(srcu, idx)
> >
> > For the same-CPU interrupt case, the existing check in
> > synchronize_srcu_atomic() already catches it:
> >
> >     synchronize_srcu_atomic(ssp)
> >       RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
> >         "Illegal synchronize_srcu_atomic() in same-type SRCU ...");
> >
> > lockdep_is_held() resolves to __lock_is_held() (lockdep.c:5612),
> > which checks current->held_locks[]. The interrupt handler runs with
> > the same current, so it sees the SRCU dep_map acquired by
> > srcu_read_lock_atomic().
>
> I am not sure whether or not it is worth checking in lockdep, but the
> general rule is (almost) that if synchronize_rcu_atomic() runs in a given
> context, then srcu_read_lock_atomic() must be invoked from a context
> that is at least as strict.  So if synchronize_srcu_atomic() is invoked
> with interrupts disabled, then all of the SRCU-atomic readers for that
> same srcu_struct structure must also be invoked with interrupts disabled.
>
> For the "almost" part, note that preemption-enabled context is
> treated the same as is preemption-disabled context because both
> synchronize_srcu_atomic() and srcu_read_lock_atomic() disable preemption.
>

Thanks, Paul, for the detailed explanation. The context rule makes
the two cases much clearer.

> > > or:
> > >
> > >
> > >
> > >            CPU0:                                                     =
             CPU1:
> > >
> > > idx =3D srcu_read_lock_atomic(srcu)
> > >
> > > smp_call_function_single(CPU1, som_func, NULL, 1)
> > > to send IPI to CPU1, and sync wait complete.
> > >                                                                    ha=
rdirq context or ide task context:
> > >
> > >                                                                      =
     some_func()
> > >                                                                      =
     ->synchronize_rcu_atomic(srcu)
> > >
> > > srcu_read_unlock_atomic(srcu, idx)
> >
> > The cross-CPU case is different. current->held_locks[] is part of
> > struct task_struct (sched.h:1302), so the existing
> > __lock_is_held() check can only see the current task's held locks.
> > It cannot see the SRCU read-side lock held by the task running on
> > another CPU. The same limitation applies to the
> > lock_is_held(&rcu_lock_map) check in synchronize_srcu() at
> > srcutree.c:1665.
>
> The rule stated above also prevents this situation.  The problem in
> the above scenario is that srcu_read_lock_atomic() was invoked with
> interrupts enabled, which means that invoking synchronize_srcu_atomic()
> for that same srcu_struct structure from the interrupts-disabled IPI
> handler is a usage bug.

The cross-CPU case initially looked like a lockdep limitation to me.
Your context rule clarifies that the usage itself is invalid
regardless:
the reader is in a less strict context than synchronize_srcu_atomic().
The rule is a more direct way of catching the problem than trying to
make lockdep see across CPUs.

The preemption detail is also helpful here, since both
srcu_read_lock_atomic() and synchronize_srcu_atomic() disable
preemption.

>
> > > Add WARN_ON(irqs_disabled()) to synchronize_rcu_atomic() ?
> > >
> > > Any thoughts?
> >
> > WARN_ON(irqs_disabled()) wouldn't help with the cross-CPU case:
> > CPU1 could be running in process context with interrupts enabled, so
> > the WARN would not trigger. It would also add a false positive for
> > legitimate hardirq calls. synchronize_srcu_atomic() omits
> > might_sleep() (compare __synchronize_srcu() at srcutree.c:1676)
> > because it is designed to work in contexts where sleeping is not
> > allowed, including hardirq context.
> >
> > Whether a general cross-CPU read-side-hold check is feasible is an
> > open question. It would need to account for the read-side state across
> > CPUs without adding too much overhead to the SRCU read-side fast path.
> >
> > I'm happy to discuss and explore whether there is a reasonable way to
> > handle this cross-CPU case.
>
> If lockdep could check for the rule stated above, that would be quite
> nice.  ;-)

I'll investigate how this context rule could be checked by lockdep.
I'll also check the IRQ-state handling in synchronize_srcu_atomic()
based on Zqiang's suggestion.

Thanks for the clarification and for pointing out the direction here.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > Thanks,
> > Kunwu
> >
> > >
> > > Thanks
> > > Zqiang
> > >
> > >
> > > >
> > > >  Thanx, Paul
> > > >
> > > > >
> > > > > Thanks,
> > > > >  Kunwu
> > > > >
> > > > >
> > > > >  Thanx, Paul
> > > > >
> > > > >  > ---
> > > > >  > kernel/rcu/srcutree.c | 8 ++++++++
> > > > >  > 1 file changed, 8 insertions(+)
> > > > >  >
> > > > >  > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > > > >  > index 6a9c432a3bd0..6c729e805fb3 100644
> > > > >  > --- a/kernel/rcu/srcutree.c
> > > > >  > +++ b/kernel/rcu/srcutree.c
> > > > >  > @@ -2123,6 +2123,14 @@ void synchronize_srcu_atomic(struct src=
u_struct *ssp)
> > > > >  > unsigned long rdm0, rdm1;
> > > > >  > unsigned long unlocks0, unlocks1;
> > > > >  >
> > > > >  > + srcu_lock_sync(&ssp->dep_map);
> > > > >  > +
> > > > >  > + RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
> > > > >  > + "Illegal synchronize_srcu_atomic() in same-type SRCU read-si=
de critical section");
> > > > >  > +
> > > > >  > + if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
> > > > >  > + return;
> > > > >  > +
> > > > >  > // Initialize. Either init_srcu_struct() was invoked or
> > > > >  > // DEFINE_SRCU() or similar was used. Therefore, no allocation
> > > > >  > // will be done here.
> > > > >  > --
> > > > >  > 2.43.0
> > > > >  >
> > > > >
> > > >
