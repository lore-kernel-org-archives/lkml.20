Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794062813;
	b=SLmCPAkGpgIU3s3Ln3YG4Ksw4jOzSNyfxYZ7qII+V1M5yRHGseZDxFLE0VkZ6zfSeFM3
	 k+G9t156BwEpIe2u5CLAK5cRSiDFv30V1eMVrwtLKeRFZqX8qL1bYxiEfqjph6XopoY3V
	 dTSfdd/i84jPk5dhF3oIFViWBGFWXYYcqxydKTE+J5TfrhhFMg2tTVaGjFJGY/IIHVUBC
	 L8z2AJQirID4gibLrl40+t/jY32c4N+id2NOGWNhMl/4h3WGULut4/PU91YQRsInyBLi8
	 C/vp5Ufnz7n/flIjD98dfXUnwT8M03+SPuYjWOYyhVaZ29+QyWhk6kEqkN89jhRbYQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pxitTAYlT4aTP/HIST+A7fiKG52u+ZyWvKldQ+tSMQk=;
	b=3uVK83tR6iHA9bSMEVQeaHgF3cX0eeLxHo3vPAWiK2Dqjv8dfifqg3LMFct7QKnulGoF
	 HzFNG9bi1qIQgO32ktL/1YlS2rahswRX8k5pBWqP2glYAJ3c2KORoB6zkdOl0qmbbeznM
	 XeZrCOhFme496ck5L0Nx47F7mZJd3YEeVc9RG2Q28ydL5vCwGJdKL5ALdj+7U6on+4SsD
	 Q4TkEc595nu75DEBLYquVJxol5eAFmb/dBjV3y4QiNiAUdnm0WdS+z6PmIFZWIEypDyss
	 ts2AS48OXOXBnX+d+L+W2L/5W64HwxmsEcYTzXz0gsXr4kdZNPywN77NtuKYSWMiZAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=B3Pl9onQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F6606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=B3Pl9onQ
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso1530341a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794062811; cv=none;
        d=google.com; s=arc-20260327;
        b=UZYNTru7nkArh8iicdodikzti/v7+E4oMCyIf9UfKTNbvPY1y+mDY3/Ppmw2M0M7BT
         C4LmmrdsOUKp76XgfKsv7LFsVI7VWi9QUNoYyMT7ZcGTXm/QaxQR0EAWl8rpOjii1J2j
         DbSs6m7iT+WUCPL2c7pLyHkSBa4PKM6CmK+AiVOkzgIbDEEw0rpvPe0RO/9GH5lNX2v4
         xJLahUsEEYYIkuni3hNp9/+oN47q5peXTYIM0AivutReLaeUcMpwD0qe2SCz5KYBH38T
         qkaBaluSB9Tu+3S2uqVVgmL+IAGRKKGcKJhU0hAexzyWO7YUHZ6WBHpBGrsU9n+FqwA8
         5IbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pxitTAYlT4aTP/HIST+A7fiKG52u+ZyWvKldQ+tSMQk=;
        fh=VmC/6h4gJmpojQKUYPPgVupyzasg6kV6s+ygTDaQG18=;
        b=XmqCIJW4Z4mlRnazKH5s2Ucw7HSqYYYnIjsACtyXgoVw6xAyC7/Wss1f6OVvGYIusD
         88zEQyOzjFLdaYEGpbUdL5T30zv8s7vHZpaIphWe7s7yDsa8mO3oSPtuSO3OoWtSeEZe
         q+Zsfe2483hPR1qFOFdTAhzj3LOeWRBpLuWjmbu+1KwUtd/qX8AWmGcw9+HNnIezzEHh
         EYs1xu5eXPepJa2uJ5idmpjmJ2L05MhV3PJ32yLCpAfUm61ENzNeP3LKsjJpUBQE8NvJ
         ga3vd+EAplW7gEgJQT9KpuU7fj80svc8WVN4nCBlH7TGC+6dK+H+LRW+7u82mjQW9ZEm
         6PqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794062811; x=1794667611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxitTAYlT4aTP/HIST+A7fiKG52u+ZyWvKldQ+tSMQk=;
        b=B3Pl9onQPa2k0fPvoGDNTc5+wn0COtvE1KZZJyTNbBcq6ZUOnhIPXzx/fGjsd/2h5S
         DOjc8G0ByGgogim9cIZ4tehp331i45spbgoJ7Vs0p3YWICSGoAusVfAVLMfSZdOmEOLq
         Wj6tH6NWk8Ccoz4S4z7tUoNMmPX+QWHSmWedauVGCFovQbx0qgodto99OXQ7cnb22qd+
         QpXq1NjNOqbl2GsRtxtBJUYx7ipO+GsCVaFNi15ddtE+zCaTR5mrChdiUUdOM1XJ/P9J
         KWRIFMKfhFf1XXXZxxAlu+JHJmB01cSFq78lCTt366pPgl/6lNPbBGBmnHC/WSYZFrOV
         TQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062811; x=1794667611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxitTAYlT4aTP/HIST+A7fiKG52u+ZyWvKldQ+tSMQk=;
        b=b3iAGNVcDOuExQgNc79hkBeyceb+CGJahElFgFWFaEEqlL4tDlg/WfME7YHn5LAH8m
         2HOrL1fYj9fCMyeEGKm9Mse6+wV1ggz+FudQz9qIh1HEqmCc4JomvMpkSxCMokznCzMW
         4494GUS+NdX/OK/ENUS9dD0Ynh0DeuPbrfgakRwaQMt9QPCBoQKIcMbUGY1U931CZuaZ
         R9hGahQujCFVQIUQ2Q2oW2+THTegE3wYY1H2gvOhbbU2026vgTA4lu7wvLh3Imb3TGA9
         bjMQXcyC8/lgux4ES1pCCpBtR+RNQYWLi55q0a2AXsmE3mkLlKR09adsuovLYqmaaX4z
         JK/g==
X-Forwarded-Encrypted: i=1; AL+hErHpcbBXVmTcIGlUxvYbZFzkWGK7xotmjODP6ZSTTYpjs5xKPyqfxuDRZCMTdRNMiz3uiaRCSP0pfSTZ6t4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TmZ0RG1tTsuj9zsbsDQeh2cmab6EcRbJyhH8gA9FokDm/dqnS
	3i5rmSLfy9GYdkCG/D4MqdQL8rkdlQGL4cPETLQZ6b2bDi53rL3ck64VnNjTkQWTFZmrLIuc3I+
	gCe06yRAN2iJH2HGzE62nElwELExxZG0yQoTtxY4Y3w==
X-Gm-Gg: AYBFou05YWJeoPV4yaKyrCYaROCups8BkuqB2jsdu74IOZbTqPc2PtBLZzQ/spVF+ML
	VfMcQg9ZaUgdkNWRnknpVc3ER8lrYwLWTYBAr4p/u0MGleFY+F+r5YG1lMWglFoj6y4S0X7FtaA
	7ZZuThyUOgUkVHcdK1qzxZrn8tvh3LXCTse/H3K+EJ96x8mB7nkFNfcAFm2b26XEYHWSu9ezRmT
	LxqHzjJc0JlgnWg1YVJNv77dR6zkAflh7jqZSey1ZTN8R0YKu20LPdSyqvKaj6cxstlgwBqA+rw
	bHOYYYlUV0H3OhOfhkiWe2lAEggeqP3uibUwZ8BTSET+IBmINWVZkj1p3d1s748O1spQw39qC9y
	ETy/Cx77JYxyFePjm0gE/5GmfbQK8PY9C3p/ET+k=
X-Received: by 2002:a05:6402:d05:b0:6b5:9156:4e9b with SMTP id
 4fb4d7f45d1cf-6b5977a301emr3803850a12.8.1794062811145; Sat, 07 Nov 2026
 06:46:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006090327.309550-1-zong.li@sifive.com> <CANXhq0qPxywpTmw=mAspYgfXivAyyoBN-r8iPpwYVXmJ3AmXyQ@mail.gmail.com>
 <7f7a6f3a-de8b-4ca2-8fc7-ea7586cbb270@picoheart.com>
In-Reply-To: <7f7a6f3a-de8b-4ca2-8fc7-ea7586cbb270@picoheart.com>
From: Zong Li <zong.li@sifive.com>
Date: Sat, 7 Nov 2026 22:46:37 +0800
X-Gm-Features: AclHuK8qfSlihFNyI0xS7KkPURkTjEgxqr80EjCjuJaTqfla2V-ZszF9QGRBUYA
Message-ID: <CANXhq0oMmqeDkMLu1L7+vBGXQ+_N2ANfBV9EbbQ+19BGiBR8OA@mail.gmail.com>
Subject: Re: [PATCH v16 0/2] RISC-V IOMMU HPM support
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com, 
	andrew.jones@oss.qualcomm.com, guoren@kernel.org, 
	david.laight.linux@gmail.com, zhangzhanpeng.jasper@bytedance.com, 
	nutty.liu@hotmail.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 8:37=E2=80=AFPM Yicong Yang <yang.yicong@picoheart.c=
om> wrote:
>
> On 10/7/26 3:30 PM, Zong Li wrote:
> > On Tue, Oct 6, 2026 at 5:03=E2=80=AFPM Zong Li <zong.li@sifive.com> wro=
te:
> >>
> >> This series implements support for the RISC-V IOMMU hardware performan=
ce
> >> monitor.
> >>
> >> The RISC-V IOMMU PMU driver is implemented as an auxiliary device driv=
er
> >> created by the parent RISC-V IOMMU driver. Therefore, the child driver
> >> can obtain resources and information from the parent device, such as
> >> the MMIO base address and IRQ number.
> >>
> >> It seems sashiko-bot is giving conflicting advice about whether to add
> >> a lock to ->read(). No matter if we add it or not, the sashiko-bot alw=
ays
> >> suggests the opposite. Looking at no lock case again, sashiko-bot
> >> concerns about a BPF program calling bpf_perf_event_read() from NMI
> >> context and self-deadlocking against the IRQ handler, but that scenari=
o
> >> cannot occur here:
> >>
> >>   - bpf_perf_event_read() goes through perf_event_read_local(), which
> >>     refuses to call ->read() unless event_cpu =3D=3D smp_processor_id(=
)
> >>     (kernel/events/core.c). All events on this PMU are CPU-bound and
> >>     non-task-bound (->event_init() forces event->cpu =3D pmu->on_cpu a=
nd
> >>     rejects sampling events), so PERF_ATTACH_TASK is never set.
> >>   - More fundamentally, perf overflow interrupts are not NMIs on RISC-=
V,
> >>     and every pmu->lock critical section in this driver is held under
> >>     raw_spin_lock_irqsave(). There is no context that can interrupt th=
em
> >>     and re-enter ->read().
> >>
> >> No other driver under drivers/perf/ uses a trylock or in_nmi() check i=
n
> >> its ->read() callback, so dropping it also brings this driver in line
> >> with the rest.
> >>
> >> sashiko-bot also reported that migration calling trigger a NULL pointe=
r
> >> dereference. I don't think this can happen on current mainline.
> >> perf_pmu_migrate_context() does not touch pmu->cpu_pmu_context unless =
it
> >> actually finds events to migrate. This used to be a real hazard: befor=
e
> >> commit bd2756811766 ("perf: Rewrite core context handling", v6.2-rc1)
> >> the first two lines were per_cpu_ptr(pmu->pmu_cpu_context, ...), which
> >> did dereference a pmu-owned pointer unconditionally. That is also why
> >> several in-tree drivers pre-seed thier ->cpu field with a real CPU num=
ber
> >> rather than a sentinel, and so do call perf_pmu_migrate_context() in
> >> this window, without any reported oops.
> >>
>
> [...]
>
> >
> > Hi all
> >
> > In the v16, sashiko-bot suggested to add a pmu->lock in ->read()
> > again, let me address this, and explain why I would prefer to leave it
> > as a documented limitation in this series rather than respin.
> >
> > What I would like to push back on is the suggested fix, because every
> > point fix in this area has already been reviewed and rejected in an
> > earlier round of this series:
> >
> >   - Taking pmu->lock in ->read() (which is literally the diff
> > suggested here) was in v7-resend. It was rejected: a BPF program
> > reading an IOMMU PMU event from NMI context via bpf_perf_event_read()
> > invokes pmu->read(), and if that NMI lands on a CPU already holding
> > pmu->lock in the IRQ handler or in ->add(), the read callback spins
> > forever.
> >   - raw_spin_trylock_irqsave() in ->read() was the v13 answer to that.
> > It was rejected in v14: on cross-CPU contention the trylock fails,
> > ->read() returns without updating, and userspace silently gets a stale
> > count.
> >   - The current lockless form is what v15 and v16 are objecting to.
> >
> > So the three obvious shapes for ->read() have each been rejected, in
> > each case for a valid reason. That is a strong hint that ->read() is
> > the wrong place to fix this: the actual root cause is that the
> > overflow handler may run off the bound CPU at all.
> >
> > Worth noting that no PMU driver under drivers/perf/ (including all the
> > hisilicon ones) or arch/x86/events/intel/uncore.c takes a spinlock in
> > its ->read() callback -- not even on x86, which does have NMI-context
> > perf events. They don't need to, because they pin the overflow
> > interrupt to on_cpu with irq_set_affinity(), so the handler and the
> > perf callbacks all run on the same CPU, and ->read() is already
> > invoked there with interrupts disabled (smp_call_function_single()
> > from perf_event_read(), or the event_cpu =3D=3D smp_processor_id() chec=
k
> > in perf_event_read_local()). Same-CPU plus interrupts-disabled is the
> > entire synchronisation mechanism, and it is why the
> > prev_count/hardware pair cannot be observed half-updated.
>
> that's how the event core's synchronization is designed and expect the
> PMU drivers to follow. so the race is true if pmu::read() is not protecte=
d
> in the current implementation.
> >
> > RISC-V IOMMU PMU driver does the same irq_set_affinity() call, but on
> > IMSIC the move can be deferred, so the guarantee is weaker. Hence the
> > race. On the scope of the impact, to explain why I think this can
> > wait:
> >   - The consequence is confined to a reported count. prev_count and
> > event->count are local64_t and the cmpxchg cannot tear, so there is no
> > memory-safety issue, no oops, and no effect on IOMMU operation itself.
> >   - The window requires an affinity change to be in flight.
> > riscv_iommu_pmu_bind_cpu() is only called from the CPU hotplug online
> > and offline callbacks, so a deferred move is only pending during CPU
> > hotplug. In steady state the interrupt is already on on_cpu, ->read()
> > runs on that same CPU with interrupts disabled, and the window does
> > not exist. This is a transient during hotplug, not the common case.
>
> so the problematic part is that the counter update from the overflow
> interrupt is not guaranteed to run on the event->cpu for the first
> even if the affinity is set to event->cpu, due to IMSIC's affinity
> move deferral. this should only affect IOMMU implemented as PCIe
> device, not platform device with either wired interrupt or MSI.
>
> what was the problem of using irq work to queue the counter update
> on the event->cpu? I see it was removed in v10 due to IRQCHIP_MOVE_DEFERR=
ED
> which confused me. with irq work we can ensure the counter update
> on event->cpu no matter which cpu take the interrupt. was there
> other issues with the irq work?

Yes, as I mentioned at the end of the cover letter, I might prefer to
send a separate patch to address this issue. In that new patch, I am
trying to use irq_work to solve it. The main difference from the
irq_work implementation in v9 is that the previous approach was too
simplistic. The new patch will take more scenarios and corner cases
into consideration and address them properly.

>
> thanks.
>
> >
> > That is a structural change to the interrupt path with several
> > interacting constraints, each of which has already caused a regression
> > in this series once. I would rather not fold it into this series at
> > this point, both because it deserves review on its own and because
> > getting it wrong again in a hurry is worse than a documented
> > counter-accuracy limitation during hotplug. So my proposal is: leave
> > the code as-is for this series, add a comment on
> > riscv_iommu_pmu_read() recording the limitation and why the three
> > obvious fixes are not used, and address it in a follow-up patchset.
> >
> > Please let me know if you want me to do more for this series.
> > Thanks!
> >
> >> Zong Li (2):
> >>   drivers/perf: riscv-iommu: add risc-v iommu pmu driver
> >>   iommu/riscv: create a auxiliary device for HPM
> >>
> >>  drivers/iommu/riscv/Kconfig      |    1 +
> >>  drivers/iommu/riscv/iommu-bits.h |   61 --
> >>  drivers/iommu/riscv/iommu.c      |   58 ++
> >>  drivers/iommu/riscv/iommu.h      |    4 +
> >>  drivers/perf/Kconfig             |   12 +
> >>  drivers/perf/Makefile            |    1 +
> >>  drivers/perf/riscv_iommu_pmu.c   | 1102 +++++++++++++++++++++++++++++=
+
> >>  7 files changed, 1178 insertions(+), 61 deletions(-)
> >>  create mode 100644 drivers/perf/riscv_iommu_pmu.c
> >>
> >> --
> >> 2.43.7
> >>
