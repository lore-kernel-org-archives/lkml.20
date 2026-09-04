Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAF03D7D9B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511153; cv=pass; b=OGzccrJWQhL8/32TTKD8ZMBHc7uPl3ZlJMepUUJLVkPu9TEIXTdsfs+Dl08rNbIjMwZ8EUqwhoKPkhrQZ/ONM/eYoZ7e45A7Bn5SwldLr+ubghnlKH1Ct8A0Qeso8QQfN2DairuUmNF/H5XreIUlU5fj7Fvu8+z6k3/wCmccqNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511153; c=relaxed/simple;
	bh=GQed7CqsS3QleH5pIiv9aPt0TZqyTnZ/ZD+IeeOLgiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXexwImc+2ngjecQQu68DRVW2f5I4eCs0iJpBc65bEGUwSECdOZ4zt1PHniIMga2CZE1GikzCkrdjri6Tu4ifZYr2Jwlck4YMtzIqC7X8yXxkykt8QRqxy7/jL8CbuyM/estoAJLoypsF5LEvhWiGwCQABsX/9IMWqU0W564R1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=RmKf2yp3; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RmKf2yp3"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so1098988a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511149; cv=none;
        d=google.com; s=arc-20260327;
        b=PELlu6Bb62IoRY3eYzpGVf6QXQ/kBFPJ2e4fOfkAfc06Dx0Iy+TLpO+QHgwyM2xjNn
         xY8KRH9Rf9vZyLxPdFr/SMytu9ALTuX0FdmYUp1w1C/MvxQMskYjwF7X95J1eIpA1gV3
         uSTd4EDXWtbWr7IHeLzNNncyCAmEXQJCvNJ24tQ90dC23Jc+nQqO08r1tCXTAxRZpTA1
         vKlm9GJ3TYM/+bfQv8fvOYVtlw9SCmc4uKIqVraPgYZIn2i6suQ2BguQr2yzy6Td6QpX
         2Q9A1EEmsEEhaxJY7hVUJkd/TpxuFaG/RaOLpbV0cs7cz9T4rdelFhQX3pCq3h8klHtr
         GhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EzvphpTn3Z6bxsTKUhE7ieqFjf3qSKtb7ZjdbCXHmpM=;
        fh=12YmYF1q7Kqg6kvD1FF/k/kqI0pQ6S4uK5iNugwcjc4=;
        b=s/5Jo04Rh6vxj1oE/1qi86I5e4e6n6bSu1TZFDcELuC2/QQ1iab2dUdMXqPuI7N4f6
         O1siVtAZSSv9pYLo/MLg9UQdW69S4SQEUeO/8U3hjF+zatNCtYMZ1rMSvRzK7BzGnP+G
         XNdvC32FyGRcFosY7FKpWwzsHlTozEn5uZU7PXZ9jqaiaTRQYd58LAa50d9t55RGHWqC
         8SOHJURUBErIVnpDqQWMcSu2zp2P8z5GAIY87JYxgsez8BFRcQNJzABaEtIe2XGnZfdj
         2TAtLaRk8RmHgBxecfrikZ0Lu9OAWEKu+w3MNvRqJlX5EpBLU/ZG5lJm+uaKT33HlQCT
         7bCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788511149; x=1789115949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EzvphpTn3Z6bxsTKUhE7ieqFjf3qSKtb7ZjdbCXHmpM=;
        b=RmKf2yp3kM3TGCNL70B+CFoWSkLrZ/6bTQo6acZBWz7A/Y1Opa0fZaheUQYgKVoZW9
         APqua+lscUkExQBSBnXffyVaHlExIX3cqQZuSOoetKattKeAVZXbeTOxOnKyBkFbBC9J
         fAun3Y+XDWI7jGZjOw41GTdmUDxRHCNUmN2ianVfzhf7wXO6uR8vvEkVorbBtP6MU1cy
         p9JCoUe8ZYIxe1ZKvEW92uDpFATNKelP8EE4uTKofgPJi95cf5jaZGvQqmOdlNRilT2p
         AQliYyjsMLELaJP65ZZ/kEFXiP3b8hiABdebzSGgxLU9KwZquA+37OW33wSrit5cyy2L
         HaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511149; x=1789115949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzvphpTn3Z6bxsTKUhE7ieqFjf3qSKtb7ZjdbCXHmpM=;
        b=WzcpYNUSKHvPiYgK6h0W2cgrL7MXQd70EyyqdmkzUTefrUnbse/vcLaBafMpLBYfNQ
         3jonBjgHgM9c/XSaiU9NhnN7a5kXfX7dHrhvbEyHbbGv4tzzRQNIb+6YgLoJKlasDTza
         J3TQPZLG1jCgkHCKnjc2KP6HB4ujanayyyqPxf93TH8AT/sR1ivPVX0I/G74Vm+soDje
         oRAKQ9LbH7vHpgjdbv4oF8z7MBGtQN6BC9/Kbzkz0IdnxxRrRcxC17J4bLDJ7JojmNp0
         7LSSIitmi3xscU392Daj1GUztuhvxkyPWTso1fheQgGaTQ/c32/H5GieSijTm0BZNnfu
         mnrA==
X-Forwarded-Encrypted: i=1; AKwUvByrzGuaW86eFMPDqPu1WNWDdrmH2P7bFoysXbWgL99RGCGfU2/zQbImFNWt28ryOFxXxz9ZZdxNGsS5INI=@vger.kernel.org
X-Gm-Message-State: AFuF++mBBz+PWm7W6c756DjLLk4QTnLmqjW4n1zSXs7x5ZVwZL3JHCSl
	e/9MoJUgVNV3mxNjhchgZFy7k2OKWIlliv2yVa3kkJ0gVDp/uaDS0/D8nHWQATUVA/pK8deWXmr
	hTOyEx1ZRA48lWThYPPjn4i6g6+gePcP2IzH3qALDSw==
X-Gm-Gg: AYBFou3U0MDS9Nl3vjgJOZkHy32WzltTR7N7uWD6cddsDuASbeIcXLkVWz2v7HcIIur
	w7pURD+Bo1Z2dd1w7mYrZKR1X6hySuZZpv3B2ZSxA5VEvRkT567rcmawfPDN+zHa+yViqhcflY8
	RtbIQD52eeEDB4TCdzP5BxHlIGmv4ep+iZ6XdEw95picOMEjVn0NALkpJBw++suApoUrYMdl0oa
	Yh2AtWhr9zdDqXd8RnHLd1Ao6roLJoB1EFYetzPTAyKx377Wv6BzcbclRtYniKQJ127ggJXwYwS
	keWGrp3yDt8rrK166kaQPMwCz+oAKCjz7vQLTx2yS0FrZ64=
X-Received: by 2002:a05:6402:424d:10b0:6a6:b9eb:e20 with SMTP id
 4fb4d7f45d1cf-6a6b9eb0f5cmr2529416a12.2.1788511149397; Fri, 04 Sep 2026
 01:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828085819.4076449-1-zong.li@sifive.com> <20260828085819.4076449-4-zong.li@sifive.com>
 <8267ee7a-98b7-42a5-b479-648d2bec8ade@picoheart.com>
In-Reply-To: <8267ee7a-98b7-42a5-b479-648d2bec8ade@picoheart.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 4 Sep 2026 16:38:58 +0800
X-Gm-Features: AcwNN1WRMTwypdAaHYFPNb0pSuReY3IdEEBJ4QNibyPzSTaAHRt107IZJ6oSt6Y
Message-ID: <CANXhq0ogpMSEdjycnz0HCO15q_gYA1hwFU98u09tYL0X8PMtoA@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 3/3] drivers/perf: riscv-iommu: protect shared
 state with a raw spinlock
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com, 
	andrew.jones@oss.qualcomm.com, guoren@kernel.org, 
	david.laight.linux@gmail.com, zhangzhanpeng.jasper@bytedance.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 4:07=E2=80=AFPM Yicong Yang <yang.yicong@picoheart.c=
om> wrote:
>
> On 8/28/26 4:58 PM, Zong Li wrote:
> > Events are bound to one CPU and the interrupt is affine to it, so the
> > perf callbacks running with interrupts disabled would be enough to
> > exclude the handler.
> >
> > PCI MSI/MSI-X on IMSIC breaks that: the irqchip sets
> > IRQCHIP_MOVE_DEFERRED, so irq_set_affinity() reports success while only
> > recording the request, and the move is applied in interrupt context upo=
n
> > the next device interrupt. Until then the interrupt is still routed to
> > the CPU IMSIC picked initially, so the first overflow interrupt can run
> > concurrently with the perf callbacks on the CPU the events are bound to=
.
> >
> > Take a raw spinlock, with interrupts disabled so that the handler can
> > never interrupt a holder on the same CPU, rather than depending on that
> > irqchip behaviour. It covers the state which is reachable from both
> > sides:
> >
> >  - IOCOUNTINH is read-modify-written by ->start()/->stop() and is saved
> >    and restored around the whole handler.
> >  - pmu->events[] is written by ->del() and read by the handler.
> >  - hw_perf_event::prev_count is updated by both.
> >
> > ->add() and ->del() call the unlocked __riscv_iommu_pmu_start() and
> > __riscv_iommu_pmu_stop() so the lock is taken once per callback.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  drivers/perf/riscv_iommu_pmu.c | 66 ++++++++++++++++++++++++++++++----
> >  1 file changed, 60 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/perf/riscv_iommu_pmu.c b/drivers/perf/riscv_iommu_=
pmu.c
> > index f6acd56f2f61..ee2f6d1fbece 100644
> > --- a/drivers/perf/riscv_iommu_pmu.c
> > +++ b/drivers/perf/riscv_iommu_pmu.c
> > @@ -101,6 +101,7 @@ struct riscv_iommu_pmu {
> >       u64 event_cntr_mask;
> >       struct perf_event *events[RISCV_IOMMU_HPM_COUNTER_NUM];
> >       DECLARE_BITMAP(used_counters, RISCV_IOMMU_HPM_COUNTER_NUM);
> > +     raw_spinlock_t lock;
> >  };
> >
> >  #define to_riscv_iommu_pmu(p) (container_of(p, struct riscv_iommu_pmu,=
 pmu))
> > @@ -485,7 +486,8 @@ static void riscv_iommu_pmu_update(struct perf_even=
t *event)
> >       local64_add(delta, &event->count);
> >  }
> >
> > -static void riscv_iommu_pmu_start(struct perf_event *event, int flags)
> > +/* Called with pmu->lock held */
> > +static void __riscv_iommu_pmu_start(struct perf_event *event, int flag=
s)
> >  {
> >       struct riscv_iommu_pmu *pmu =3D to_riscv_iommu_pmu(event->pmu);
> >       struct hw_perf_event *hwc =3D &event->hw;
> > @@ -500,11 +502,22 @@ static void riscv_iommu_pmu_start(struct perf_eve=
nt *event, int flags)
> >       riscv_iommu_pmu_set_period(event);
> >       riscv_iommu_pmu_set_event(pmu, hwc->idx, hwc->config);
> >       riscv_iommu_pmu_enable_counter(pmu, hwc->idx);
> > +}
> > +
> > +static void riscv_iommu_pmu_start(struct perf_event *event, int flags)
> > +{
> > +     struct riscv_iommu_pmu *pmu =3D to_riscv_iommu_pmu(event->pmu);
> > +     unsigned long irqflags;
> > +
> > +     raw_spin_lock_irqsave(&pmu->lock, irqflags);
> > +     __riscv_iommu_pmu_start(event, flags);
> > +     raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
>
> could use guard(raw_spinlock_irqsave)() to help handle the lock release.
>
> I'm considering if it'll better to use irq_work or function call to handl=
e the
> counts update from the interrupt handler, e.g. in the irq handler first c=
heck
> if current cpu is the pmu->on_cpu, if so update the counts, otherwise que=
ue
> the update work to pmu->on_cpu by irq work or smp_call_function_single_as=
ync.
> In this way we can use pmu's original synchronization mechanism without
> extra spin locks since the callbacks will always run and synchronized by
> the same cpu, and the shared interrupt doesn't matter at all.
>
> any thoughts on this?
>

Thank you for your suggestion. It really helped me re-think the impact
of IRQCHIP_MOVE_DEFERRED.

When an IRQ goes to the wrong CPU, handle_edge_irq() already changes
the affinity to the correct CPU via irq_ack at this time. Because of
this, we might only need a simple check at the beginning of the IRQ
handler. We can just check if the current CPU is the correct one. If
it is not, we can simply return and do nothing. Since PMIP is still
asserted, the IRQ will trigger again and go to the correct CPU.

I will drop this patch and make a new, simpler fix.

Thanks again for your help!

> thanks.
>
> >
> >       perf_event_update_userpage(event);
> >  }
> >
> > -static void riscv_iommu_pmu_stop(struct perf_event *event, int flags)
> > +/* Called with pmu->lock held */
> > +static void __riscv_iommu_pmu_stop(struct perf_event *event, int flags=
)
> >  {
> >       struct riscv_iommu_pmu *pmu =3D to_riscv_iommu_pmu(event->pmu);
> >       struct hw_perf_event *hwc =3D &event->hw;
> > @@ -521,13 +534,26 @@ static void riscv_iommu_pmu_stop(struct perf_even=
t *event, int flags)
> >       hwc->state |=3D PERF_HES_STOPPED | PERF_HES_UPTODATE;
> >  }
> >
> > +static void riscv_iommu_pmu_stop(struct perf_event *event, int flags)
> > +{
> > +     struct riscv_iommu_pmu *pmu =3D to_riscv_iommu_pmu(event->pmu);
> > +     unsigned long irqflags;
> > +
> > +     raw_spin_lock_irqsave(&pmu->lock, irqflags);
> > +     __riscv_iommu_pmu_stop(event, flags);
> > +     raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
> > +}
> > +
> >  static int riscv_iommu_pmu_add(struct perf_event *event, int flags)
> >  {
> >       struct riscv_iommu_pmu *pmu =3D to_riscv_iommu_pmu(event->pmu);
> >       struct hw_perf_event *hwc =3D &event->hw;
> >       unsigned int num_counters =3D pmu->num_counters;
> > +     unsigned long irqflags;
> >       unsigned int idx;
> >
> > +     raw_spin_lock_irqsave(&pmu->lock, irqflags);
> > +
> >       /* Reserve index zero for iohpmcycles */
> >       if (is_cycle_event(event->attr.config))
> >               idx =3D RISCV_IOMMU_HPM_CYCLE_IDX;
> > @@ -535,8 +561,10 @@ static int riscv_iommu_pmu_add(struct perf_event *=
event, int flags)
> >               idx =3D find_next_zero_bit(pmu->used_counters, num_counte=
rs, 1);
> >
> >       /* All event counters or cycle counter are in use */
> > -     if (idx =3D=3D num_counters || pmu->events[idx])
> > +     if (idx =3D=3D num_counters || pmu->events[idx]) {
> > +             raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
> >               return -EAGAIN;
> > +     }
> >
> >       set_bit(idx, pmu->used_counters);
> >
> > @@ -546,7 +574,9 @@ static int riscv_iommu_pmu_add(struct perf_event *e=
vent, int flags)
> >       local64_set(&hwc->prev_count, 0);
> >
> >       if (flags & PERF_EF_START)
> > -             riscv_iommu_pmu_start(event, flags);
> > +             __riscv_iommu_pmu_start(event, flags);
> > +
> > +     raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
> >
> >       /* Propagate changes to the userspace mapping. */
> >       perf_event_update_userpage(event);
> > @@ -556,18 +586,26 @@ static int riscv_iommu_pmu_add(struct perf_event =
*event, int flags)
> >
> >  static void riscv_iommu_pmu_read(struct perf_event *event)
> >  {
> > +     struct riscv_iommu_pmu *pmu =3D to_riscv_iommu_pmu(event->pmu);
> > +     unsigned long irqflags;
> > +
> > +     raw_spin_lock_irqsave(&pmu->lock, irqflags);
> >       riscv_iommu_pmu_update(event);
> > +     raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
> >  }
> >
> >  static void riscv_iommu_pmu_del(struct perf_event *event, int flags)
> >  {
> >       struct riscv_iommu_pmu *pmu =3D to_riscv_iommu_pmu(event->pmu);
> >       struct hw_perf_event *hwc =3D &event->hw;
> > +     unsigned long irqflags;
> >       int idx =3D hwc->idx;
> >
> > -     riscv_iommu_pmu_stop(event, PERF_EF_UPDATE);
> > +     raw_spin_lock_irqsave(&pmu->lock, irqflags);
> > +     __riscv_iommu_pmu_stop(event, PERF_EF_UPDATE);
> >       pmu->events[idx] =3D NULL;
> >       clear_bit(idx, pmu->used_counters);
> > +     raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
> >
> >       perf_event_update_userpage(event);
> >  }
> > @@ -635,12 +673,24 @@ static irqreturn_t riscv_iommu_pmu_irq_handler(in=
t irq, void *dev_id)
> >  {
> >       struct riscv_iommu_pmu *pmu =3D (struct riscv_iommu_pmu *)dev_id;
> >       DECLARE_BITMAP(ovf_bitmap, BITS_PER_TYPE(u64));
> > +     unsigned long irqflags;
> >       u32 ovf, idx, inhibit;
> >
> > -     /* Check whether this interrupt is for PMU */
> > +     /*
> > +      * Check whether this interrupt is for PMU. Done outside the lock=
 so
> > +      * that a shared interrupt line is left alone as cheaply as possi=
ble.
> > +      */
> >       if (!(readl_relaxed(pmu->reg + RISCV_IOMMU_REG_IPSR) & RISCV_IOMM=
U_IPSR_PMIP))
> >               return IRQ_NONE;
> >
> > +     /*
> > +      * Hold the lock across the whole sequence below. Stopping the
> > +      * counters, processing them and restoring the previous inhibit s=
tate
> > +      * has to be atomic against ->start()/->stop(), otherwise a count=
er
> > +      * enabled in between would be inhibited again by the restore.
> > +      */
> > +     raw_spin_lock_irqsave(&pmu->lock, irqflags);
> > +
> >       /* Process PMU IRQ */
> >       inhibit =3D riscv_iommu_pmu_stop_all(pmu);
> >
> > @@ -672,6 +722,8 @@ static irqreturn_t riscv_iommu_pmu_irq_handler(int =
irq, void *dev_id)
> >
> >       riscv_iommu_pmu_start_all(pmu, inhibit);
> >
> > +     raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
> > +
> >       return IRQ_HANDLED;
> >  }
> >
> > @@ -735,6 +787,8 @@ static int riscv_iommu_pmu_probe(struct auxiliary_d=
evice *auxdev,
> >
> >       iommu_pmu->reg =3D iommu_dev->reg;
> >
> > +     raw_spin_lock_init(&iommu_pmu->lock);
> > +
> >       /*
> >        * Counter number and width are hardware-implemented, detect them=
 by
> >        * writing 1s and reading back which bits stuck.
