Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D6B2D876B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354601; cv=pass; b=fIGMGs+VcHEsynfdY0aByAg4Qgs2vjux3ieL53rh04aIfC/kCaUp14cWxS37wCDtZOCg0jMUYkMGKMLEG79sZmNEGCidf6RI0e48ifNt5meum1MDOCN5jbnO7cDiqiI7itGYPj1A4n62mLXnlL+RiOBIV0jo2myimpA42CVHELU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354601; c=relaxed/simple;
	bh=Vro0RFl8YpGJPOlRnygiQ7jO0ulgs5SFhx90iN7YVSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grOs1IPio4FAM3nyiRK1Df5rwVjEL38/ypQZWMJLCBeNjmKI6JDNKossX8scexNSPKo7G0zafO39cQ/GaqoF9zewkWsjo1tVga/dBYgL2df1wmlOrxQPyq0EuUw2c5x+ciktFChHls1ymHGMMSNsTzm4gCocxm9exZTWfklV6/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZij9Z7Y; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZij9Z7Y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49e6deb520eso18995855e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789354598; cv=none;
        d=google.com; s=arc-20260327;
        b=hIPcj+tlrIRxoGwy7+/DlbZLvsO2XeBvRSoQWufqoMksygD+UnOgD4A5CU0Lt2wwxo
         R9l1FBxdgelgoQm2ZSE4XEhAguxDd2nV+3/3Wk3Nt05vRjCwc4ojmgrYsB4F/hGlvXr4
         YgfaTi1U8SqjnLBBDbiE1m+clrLl2OdzhiVqJ1GjK2mew4KKNAJM6KcSTEnTQ2CJEQOK
         mEOfNLWHe33FmxHLIG/zo3E/VhsdOmX7jzyiV+Yn0cb4PT8zSDA7sBSqtjNAzW/PMTjw
         ko3cZMKh6aAfBhcb2e7nxyz7UOfyPg1E3PIrV/gekg+Umzjl37BAmuE9lolPVH3fFpZw
         iw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1fKicCxMIbMqKyjQQQabGvsh6ggRoBKXEKuJu8RTqL0=;
        fh=Z3fxfzRvRKL+xdu7R0N/IBISHI+POGp0O0TFqe3rs6M=;
        b=PyD4GCUPpmdm+PLVeEZFjRsQs+8EcOvkNAQUPQSDPCdfB1/ErbXQnD9GksONAsgZ9L
         8ytli+8s8FeBqwX4rZbS1CZ71DGY4EF6DKbXNzRfeOfih119Spw+CdpyAjjzsGG0IQ6Y
         4gr+jaeVMLbTZ977JsDUdC38nTc2I+WLZljU5DWmJeX92g36FEpEdT84z0J/CAebYG5l
         3Rew9++AmR7CfGRHJR61gFKZg3DKctEkgsvSbhpdpzMCMGVNGIXEaMGp3eACZxADZzuY
         Pv4xG8wJc1uS2mqx3V3SzUkKLhjhAuNjf2ZPZ7WB1SnaU6aY0RUZL1Q2rLwmUV/UWN8z
         9SBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354598; x=1789959398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fKicCxMIbMqKyjQQQabGvsh6ggRoBKXEKuJu8RTqL0=;
        b=sZij9Z7YmnHAg7oRgBWsoiiNhLmaQsiTKYbUOjKK5A1/6WVAu33upe9mPNs+FgqKvG
         aWmltV/UBzr0FAI2HpHszHvxVOvyRioA5HN5KnQMnP4i7KhCUSxCK3w18XQunFA3IBnc
         F903uoiGdEUPn/wXaf4xgNxFz7f4HETlcxMX2qqdOGHGDoaCDuM2E8vkocIaPlcYeMp6
         0xKF+iQfeju59aMZIpJbzdLc4/xaZiPvk4Ab937fjs1QhkcEk5DPOXjSREvkEcH8pHWe
         VpdOZAia73fknSHnf20iTqKj2dAR7dlV/6hchr37TfrRlsTHGz2ugcHdQYQjV7q1YaGN
         ksFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354598; x=1789959398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fKicCxMIbMqKyjQQQabGvsh6ggRoBKXEKuJu8RTqL0=;
        b=alcB2G21sSZCUJk3euvY4aYaWqb0LDkyxDF3rmFjKIsr+tKBQ04LiQO36gqCAYTKyk
         l41tqqYM/86zSfFxARuRsmZ/E+JXGKWTqYCWWYl/P+ogEGJNpbdXCabj+DpoY7sJ0qEn
         27mFYZ/nuNpGzaMH6Xuptl7aJpNVm2il+lG7kqxbXQ0Nf/yb43e9+sywDSd2/lgeeg7d
         DRfSq9LM/SOqxhdaqiqVTfjxFLh4IWG5F0VgCDK8BEHOQ8fXDrlzWWHuWpqri1OP0ua4
         /37xwuT6NLNLg1gZg2I1/2YCaTeWUNPpq6rUhWK1hYvpykI5O4uW8D5G5dRvqHmTWBxS
         aLZA==
X-Forwarded-Encrypted: i=1; AKwUvBxIq8p/3LsRopiOpVzX9cY6KhqU4p5Ed184imBveCOD8P9+7zbCvgyoZcZcoPEXgLq0ZsjSaVcuh4xKpqo=@vger.kernel.org
X-Gm-Message-State: AFuF++l4UuO4QQMRaYz/J13r6WlVu9uEniZGD27Ryvv/8S05BC8UssGr
	b9Ay3EEJToPuCAjbhznAj/vjDe9ezAT5YQtEsand0SLpr7/jvJq/Kso1efDYD+OusAc2+Jjf4oA
	bXVHvDdSh2U5UbXFOwjK4lwGm8algK5bpjF7FpMk=
X-Gm-Gg: AYBFou0rxIHB6bLx89vzvz5sm7nNlx2PiqALztTxScQtIT9BAzqm4tE3XKwGFSjs8hM
	/hfroQgOFDm1F4SZmdiMpRWi1aHa5tiBOrEWqc32V2frQegOaen3f1YXNh8AgmNbV6lCF9kGtLp
	SKtu/UkHzpAO3cMYlQdgBdgYCDAkjfA4sAd5KR8/YUr1ri03gQkBtR2LTmXiJy/Ieq44V/A9fzp
	kFfyWfXFHO41cKNFRThvZwlkzXKtZvwOfMS0o/P85GtseMPoBqch5Hry9tpB2+zda2pDENUCluu
	/eJYuORibDiHnoB2s48leZS0zydW6N8eNLomwEb9TsNW6eLHIR+Z4zaXAJ1Ia3OwObcSL6I22sh
	j1S0GDPQ5YXvk
X-Received: by 2002:a05:600c:19cf:b0:49e:73d3:78ad with SMTP id
 5b1f17b1804b1-49e7a6859femr5586485e9.18.1789354598480; Sun, 13 Sep 2026
 19:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911093515.2802551-1-kunwu.chan@gmail.com>
 <0cf7b133-d2fd-4298-adba-70a2b86d1892@paulmck-laptop> <CAN_Opa-uuim=aiOuAmHYUoD5S=vBREemj-dCvcunF-4zNdp1=A@mail.gmail.com>
 <e6be6641-731c-4b21-ad4e-c05bedc388d6@paulmck-laptop> <32e952728ea1a9c25c2b56de468f43a32104b8a8@linux.dev>
 <CAN_Opa9v-6Kx2tUFkT4YiOVM_tgZuUVOkbwieOrC6WfbNj_=kA@mail.gmail.com> <ab4b7feb3d7ab68ce0de1d1d93d6272b355d7d5d@linux.dev>
In-Reply-To: <ab4b7feb3d7ab68ce0de1d1d93d6272b355d7d5d@linux.dev>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 14 Sep 2026 10:56:27 +0800
X-Gm-Features: AcwNN1Vr9uy0VeobIrFPAZncEAHXBsnAekHunjfGPGNOcbvHf26v4qpcGZ3p1zs
Message-ID: <CAN_Opa_HoUyzuj=h7faDh57JRS-vy746VF0YYjDuXpaiftr46w@mail.gmail.com>
Subject: Re: [PATCH] srcutree: Add lockdep and early-boot checks to synchronize_srcu_atomic()
To: Zqiang <qiang.zhang@linux.dev>
Cc: paulmck@kernel.org, jiangshanlai@gmail.com, josh@joshtriplett.org, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 8:12=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wrot=
e:
>
> >
> > On Sun, Sep 13, 2026 at 2:21 PM Zqiang <qiang.zhang@linux.dev> wrote:
> >
> > >
> > > On Sat, Sep 12, 2026 at 08:37:33PM +0800, KunWu Chan wrote:
> > >
> > >  >
> > >  > On Sat, Sep 12, 2026 at 12:47 AM Paul E. McKenney <paulmck@kernel.=
org> wrote:
> > >  >
> > >  > On Fri, Sep 11, 2026 at 05:35:15PM +0800, Kunwu Chan wrote:
> > >  > > Add the lockdep annotation, same-type SRCU nesting warning, and
> > >  > > early-boot check used by __synchronize_srcu().
> > >  > >
> > >  > > Suggested-by: Zqiang <qiang.zhang@linux.dev>
> > >  > > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > >  >
> > >  > Queued for review and testing, thank you both!
> > >  >
> > >  > Interestingly enough, it is now the case that there is a grace-per=
iod
> > >  > wait that can be placed in a normal RCU read-side critical section=
.
> > >  > Does this mean that we should also adjust the --do-srcu-lockdep te=
sting
> > >  > in tools/testing/selftests/rcutorture/bin/torture.sh?
> > >  >
> > >  > Thanks, Paul. Good point.
> > >  >
> > >  > I=E2=80=99ll check the current `--do-srcu-lockdep` coverage, inclu=
ding the
> > >  > case where `synchronize_srcu_atomic()` is called from a normal RCU
> > >  > read-side critical section, and follow up with the necessary tortu=
re
> > >  > testing changes.
> > >  >
> > >  Sounds good!
> > >
> > >  Perhaps you and Zqiang can work together on this. Co-developed-by,
> > >  for example.
> > >
> > >  Hi, Paul and KunWu
> > >
> > Hi Zqiang,
> >
> > Thanks for pointing out these cases.
> >
> > >
> > > Should we also consider the following situations ?
> > >
> > >  idx =3D srcu_read_lock_atomic(srcu)
> > >
> > >  by interrupt run hardirq context:
> > >  synchronize_rcu_atomic(srcu)
> > >
> > >  srcu_read_unlock_atomic(srcu, idx)
> > >
> > For the same-CPU interrupt case, the existing check in
> > synchronize_srcu_atomic() already catches it:
> >
> >  synchronize_srcu_atomic(ssp)
> >  RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
> >  "Illegal synchronize_srcu_atomic() in same-type SRCU ...");
> >
> > lockdep_is_held() resolves to __lock_is_held() (lockdep.c:5612),
> > which checks current->held_locks[]. The interrupt handler runs with
> > the same current, so it sees the SRCU dep_map acquired by
> > srcu_read_lock_atomic().
> >
> > >
> > > or:
> > >
> > >  CPU0: CPU1:
> > >
> > >  idx =3D srcu_read_lock_atomic(srcu)
> > >
> > >  smp_call_function_single(CPU1, som_func, NULL, 1)
> > >  to send IPI to CPU1, and sync wait complete.
> > >  hardirq context or ide task context:
> > >
> > >  some_func()
> > >  ->synchronize_rcu_atomic(srcu)
> > >
> > >  srcu_read_unlock_atomic(srcu, idx)
> > >
> > The cross-CPU case is different. current->held_locks[] is part of
> > struct task_struct (sched.h:1302), so the existing
> > __lock_is_held() check can only see the current task's held locks.
> > It cannot see the SRCU read-side lock held by the task running on
> > another CPU. The same limitation applies to the
> > lock_is_held(&rcu_lock_map) check in synchronize_srcu() at
> > srcutree.c:1665.
> >
> > >
> > > Add WARN_ON(irqs_disabled()) to synchronize_rcu_atomic() ?
> > >
> > >  Any thoughts?
> > >
> > WARN_ON(irqs_disabled()) wouldn't help with the cross-CPU case:
> > CPU1 could be running in process context with interrupts enabled, so
> > the WARN would not trigger. It would also add a false positive for
> > legitimate hardirq calls. synchronize_srcu_atomic() omits
> > might_sleep() (compare __synchronize_srcu() at srcutree.c:1676)
> > because it is designed to work in contexts where sleeping is not
> > allowed, including hardirq context.
>
> If runing in hardirq context, we should use raw_spin_lock_irqsave_rcu_nod=
e()
> and raw_spin_unlock_irqrestore_rcu_node() to replace raw_spin_lock_irq_rc=
u_node()
> and raw_spin_unlock_irq_rcu_node() in synchronize_srcu_atomic().
>

Thanks, Zqiang. I'll take a closer look at the IRQ-state handling and
consider the change. If a patch comes out of it, I'll add the
Co-developed-by tag.

Thanks,
Kunwu

> Thanks
> Zqiang
>
>
>
> >
> > Whether a general cross-CPU read-side-hold check is feasible is an
> > open question. It would need to account for the read-side state across
> > CPUs without adding too much overhead to the SRCU read-side fast path.
> >
> > I'm happy to discuss and explore whether there is a reasonable way to
> > handle this cross-CPU case.
> >
> > Thanks,
> > Kunwu
> >
> > >
> > > Thanks
> > >  Zqiang
> > >
> > >  Thanx, Paul
> > >
> > >  >
> > >  > Thanks,
> > >  > Kunwu
> > >  >
> > >  >
> > >  > Thanx, Paul
> > >  >
> > >  > > ---
> > >  > > kernel/rcu/srcutree.c | 8 ++++++++
> > >  > > 1 file changed, 8 insertions(+)
> > >  > >
> > >  > > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > >  > > index 6a9c432a3bd0..6c729e805fb3 100644
> > >  > > --- a/kernel/rcu/srcutree.c
> > >  > > +++ b/kernel/rcu/srcutree.c
> > >  > > @@ -2123,6 +2123,14 @@ void synchronize_srcu_atomic(struct srcu_=
struct *ssp)
> > >  > > unsigned long rdm0, rdm1;
> > >  > > unsigned long unlocks0, unlocks1;
> > >  > >
> > >  > > + srcu_lock_sync(&ssp->dep_map);
> > >  > > +
> > >  > > + RCU_LOCKDEP_WARN(lockdep_is_held(ssp),
> > >  > > + "Illegal synchronize_srcu_atomic() in same-type SRCU read-side=
 critical section");
> > >  > > +
> > >  > > + if (rcu_scheduler_active =3D=3D RCU_SCHEDULER_INACTIVE)
> > >  > > + return;
> > >  > > +
> > >  > > // Initialize. Either init_srcu_struct() was invoked or
> > >  > > // DEFINE_SRCU() or similar was used. Therefore, no allocation
> > >  > > // will be done here.
> > >  > > --
> > >  > > 2.43.0
> > >  > >
> > >  >
> > >
> >
