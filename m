Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE93932DC
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017700; cv=pass; b=o9xzuWSQTtcS5acdy8VyKgmJB1cAxITjAyEICZ3bwFPzyuSSmW7F3HcLE7RyHwl+rRuMNT32G/SsrSlzUFT5FsNS5lDzpN+m13FG7OPA+MDwy9LEW/2yVm5UAqI0wi6CvlaFBOK7PB+TH6ws0DOB2wo9iVtaRVhQLph16v9Fhbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017700; c=relaxed/simple;
	bh=ZStmYwK2517SZukWL0OBGTySyFb/30xKB+Vyvyid+M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNJiks0W7b4D2AcS2gvWRYbm7+PpFvEzTrAm7DbQvIrtEXPosXIOZVXtGF/ea5sIeWlGGUdhWRNGR0E0uFMtnGHce1jl5ZeXNnAO53V6gYryl666LnQlA9fx9vhHuWrGTIVi6g4BH+sVLnphCYJVyUh3l56KVGT4NvIpCNHv7Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC9F5Fjk; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC9F5Fjk"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac9d666d4eso2417487b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 01:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791017696; cv=none;
        d=google.com; s=arc-20260327;
        b=DshFACjil55sS9apdCjsIWNekWESYRSGA/zCfy2lXlYTquRWQ8BcEtkjUn2Vv5j/HL
         AUDEbx0hTtCwvMFt3p86zXBjv+GH3ZyBTJ3RuOaKAcQp+pJnswPRzXZGw0kqtEjVLo1o
         JfGXhpeZhm6NYFQ59BPNCkFVXXmDnzKpxH9bn7iwYlDnNkTATLrITIDDg4Uturm/HD8I
         w6fdcyIJ9GR47nrZ9kLPX0l7kD4lvO1dJ/bun68fd13oA7e8eZZXUftfdEb9BrAMjwRO
         lD32OvT+HRGpX/+X7YB7TRs7qqmcsvH8+BGwtQgfPlHdRhvQ9U0NlXHB+S6avxD94KjR
         hTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XF1Rfe6tT9rWhz53Zwt6lcrDcxOktMryg4NS9sKRHVU=;
        fh=6FOXEWpEwie6Am0fgBpVgr+MWIrr0KizIp64SW/zYxk=;
        b=aZb8l46IU50YfOZ57RPP0H90h8raZW75ZPCXmu77D3hR6Ulh4ejxpRE2YCDZpcJ3Fq
         tdh42X9b2n9KiKlWFDhDM8LP0hooFJ+nMFXZ0ugB5P8ZuzDVeGbLy2QW0QAoiMnOGWf+
         dsQk2EgtqVkKGRLc8Yf4z0GROkvvWsr1Xqy6iOxo0vRt6fJB7yGIbiUNRrBLUXi9Al/P
         Bu3lwCMSeSPw+FopzUEz67ib9xolcACGpUjZS2pWU+/LhRemRW7NEFIZi0ChS5CRG9T+
         Y2ecsCxkv9F8O//YwN01ivTfA2diiGyuIlXAHLQJdLqc0v5xxtDB05MUePiYiGD/Dkun
         rhqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017696; x=1791622496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XF1Rfe6tT9rWhz53Zwt6lcrDcxOktMryg4NS9sKRHVU=;
        b=SC9F5FjkbpV1AH10GlNOdnz5lVkoiYgH/1WGxB88/F+BFy2R/+JwSydSja5cEFbdRf
         UMjeCRP6USHgFPZYGG1zHzwMaoo6f7w9yqADl6GUfAB8CbrH8rUxvko5v1+o9uiegFwf
         wsBj+9S2ltzPBef8hNg5bNZnUctVIVvYkhEWZzGxzlMfAxlfI8KZJBPJAWnH9haAx7s3
         SFSnTBLNPDfxGUlZBwn6RZV4KdHQcBr0MI72uNzmCWNeExKMaNQNhA5sAqbpxCrJvuuq
         s2McAqyJ5FOLLPM+5CxHOQUSGHf4GjDbydl1ZRk7ImoBktARzeLZtT++lwfYCt4szSY6
         fZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017696; x=1791622496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XF1Rfe6tT9rWhz53Zwt6lcrDcxOktMryg4NS9sKRHVU=;
        b=Yum74zSN1eUsoTgPoXuS5viWEJKGXgenU68wF0lc3YpaTJQj1EV+hky8D6es5CDqIM
         yGfvzZLUy41061qWnJR++/yYZtbtJ6d/nSYRrFbBJh8NF5aoR2Ox8hCTR8h9c8FLv+9q
         wXINwTL03aqb9JcbCpcnZhprOSZ1aA49FmCb8gmoPPNd9CIH0k0Rzw9FkoGDx1cduv4V
         TorKfkSJDIcN9Wm+Mo6kLwyTC4WthhUS6Xn2cq9gYp3ZKGWvPP4J53rvJ2TT3MYs6Xbo
         CZ5ZNKs3f1K0qwekDugqZt3/QAzWB6OOWgEJgCI33sBcx6yBzO9iBu/cgbov7hoBIEGY
         bggw==
X-Forwarded-Encrypted: i=1; AKwUvBznLPEzRmVf6Cl41UdvdqOG3rWz/v5CL7i2h1qZgt8POtjpLDhNlEuMCJd2JKQrASn0n2ZjpGiDepD37GQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP1vbeDfNjOrzplGdLBhcUxxoz+J+HCVTtA7xA9ODFpIBz3GT0
	mUGn7KZRK90S30IrPUX7eseCnazZMS2mUFCNstW5VrMmXvcC4UTI49Csh69hgcVnAvQfEFuI///
	seBLIGZFedyzmhFS12g6rkiH/7wM4HEA3TEeuefI=
X-Gm-Gg: AYBFou2qX5YUuMGlFcPfeNzK7bo3XqUAWXOZ2nuVO9k2SPUyQpbwuKTrV+1NFeeVMoc
	fbunyukjLGfFwqsgGbcWMJx3YkiPzkgifzciqD8+5aP/JD7Cn7DRkjppVwJ7XQfgkEmdFbxTie7
	3m23yBFWqavy4EQLIe4Ib9Lq23SSQsRS4ZcUgTCkJjSxd8ry61uPSnLv+C8smPI5D+X1n67PWUu
	ax7Sh6Z5Z0dx/H3EkfhlHIve+hef5stAxipy7nWQprrzOtic6+FUAnpd0jntQrzRpNVLWMmX1Fw
	QGbAny825C7HNvIdQyQlYCwVcfC8ldHXXfpa9lSJ3Q0l+9noS2RDnu0=
X-Received: by 2002:a05:690c:5806:b0:8a3:81cd:d44b with SMTP id
 00721157ae682-8ae957dc0f1mr6697157b3.101.1791017695981; Sat, 03 Oct 2026
 01:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com> <ar_Rathmoj2aP-H7@xhacker>
In-Reply-To: <ar_Rathmoj2aP-H7@xhacker>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sat, 3 Oct 2026 10:54:44 +0200
X-Gm-Features: AclHuK9m1M4Lrz4Ru5FcuKLbDUhiUabKkeX8NFZe_o4dWUeThLGkjCTU9xIeOag
Message-ID: <CALsPMBOYQbro2gZTQR=DSUowmVDs9kujH4ua2UzCoHAQrncuiw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 6:04=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> w=
rote:
>
> On Sun, Aug 30, 2026 at 04:36:37PM +0200, Roman 'Hedin' Storozhenko wrote=
:
> > Make RISC-V TLB flush path selection observable. Record whether Linux
> > handles an invalidation locally, delegates it to SBI RFENCE, or execute=
s
> > it through a cross-CPU call, so MM activity can be correlated with the
> > RISC-V, firmware, or Linux cross-CPU path carrying the request.
>
> I didn't see too much usefullness of the trace here. why not use kprobe
> instead? can you plz show a real usage example of the trace? Which
> bug/performance problem can be solved conveniently with this trace only?
>
> From another side, except x86, other architectures don't have the trace
> in the TLB path.
>

Hi Jisheng,

Thanks for the review. I agree that the current commit message describes
the intended use rather abstractly.

A kprobe can certainly be used to investigate this. My motivation
for a tracepoint is not that dynamic tracing cannot obtain the
information, but that doing so requires knowledge of the current
implementation and reconstruction of a semantic decision made inside
__flush_tlb_range() / flush_tlb_all().

For example, probing __flush_tlb_range() gives the request context, but
not directly the path subsequently selected. To determine whether the
request was handled locally, delegated through SBI RFENCE, or executed
through Linux cross-CPU coordination, a tracing tool needs to
probe/correlate implementation-specific call sites, or reproduce the
selection logic itself.

The intent of the proposed event is to expose that semantic decision
directly, together with the target CPU mask and request context, rather
than make users depend on the current helper names and call graph.

One concrete RISC-V example is commit ae9e9f3d67dc:

  "RISC-V: clear hot-unplugged cores from all task mm_cpumasks
   to avoid rfence errors"

In that case an offline CPU could remain in mm_cpumask(), which was then
used as the target of an SBI RFENCE request. OpenSBI checks the requested
hart mask against online harts, so such a request could fail.

With this event, such a situation could expose, for example:

  target_cpus=3D0,3 target_mask_weight=3D2 scope=3Drange path=3Dsbi-rfence

while CPU3 is already offline.

That shows that Linux constructed an unexpected target mask before the
request was handed to firmware, so the investigation can first focus on
Linux's mm CPU tracking rather than starting inside the SBI
implementation.

There is also a performance-debugging use case. Real-world latency
investigations have found TLB shootdowns responsible for significant
latency spikes; for example:

  https://www.jabperf.com/how-to-deter-or-disarm-tlb-shootdowns/

That particular case eventually identified automatic NUMA balancing as
the source of excessive shootdowns. I am not claiming that this proposed
event alone would identify that root cause. On RISC-V, once TLB
shootdowns have been identified as relevant, the event provides the
architecture-specific next step: which CPUs Linux targeted, and whether
Linux selected local handling, SBI RFENCE, or Linux cross-CPU
coordination.

This distinction also helps separate where to investigate next. For an
otherwise similar MM request:

  path=3Dsbi-rfence

points toward firmware/platform handling after Linux delegates the
request, while:

  path=3Dcross-cpu-call

points toward Linux cross-CPU/IPI handling and target-CPU activity.

An unexpectedly broad target_cpus mask can similarly indicate that the
cost comes from Linux targeting more CPUs than expected rather than from
the execution time of the selected mechanism itself.

I also put the workloads used to exercise the event here:

  https://github.com/Romeus/tlb_workloads

They provide reproducible examples using the same 64-page mprotect()
request with different CPU footprints/configurations. I used them to
exercise local, SBI RFENCE, and cross-CPU-call paths.

I am not claiming that a tracepoint by itself solves these bugs, or that
the same information is impossible to obtain with kprobes. The intended
value is to expose the RISC-V TLB path-selection decision and its target
context in one semantic record, without requiring each tracing tool to
reconstruct that decision from implementation-specific probes.

I also take your point that, apart from x86, architectures generally do
not currently have permanent tracing in the TLB path. If the use case is
considered sufficient for a tracepoint, I will rework the commit message
to make the concrete motivation and the distinction from dynamic
probing clearer.

For context, I also posted an unchanged v2 RESEND on Sep 24; this reply
is on the original v2 thread where your review landed.
https://lore.kernel.org/lkml/20260924-tlb_tracepoint-v2-1-4e3e78ef5cdb@gmai=
l.com/

Thanks,
Roman

> >
> > The generic tlb:tlb_flush event describes TLB flush activity using
> > architecture-independent reason and page-count information. The RISC-V
> > implementation subsequently selects between local invalidation, SBI
> > RFENCE, and Linux cross-CPU coordination, with additional
> > architecture-specific request context available at that point.
> >
> > Making this selection observable is useful when debugging RISC-V TLB
> > shootdowns. When a remote invalidation is observed to be slow, the
> > selected path determines whether to investigate SBI firmware and
> > platform handling or Linux cross-CPU and IPI handling. An unexpectedly
> > broad target mask can reveal an unintended address-space CPU footprint,
> > while the range and stride distinguish invalidation requests with
>
> > different mapping granularities.
> >
> > Place the event in the RISC-V implementation because the local, SBI
> > RFENCE, or cross-CPU choice is made there, and SBI RFENCE and the
> > invalidation stride are RISC-V-specific semantics rather than propertie=
s
> > of the generic MM flush request.
> >
> > Add riscv_tlb:riscv_tlb_flush_path in flush_tlb_all() and
> > __flush_tlb_range(). Record start, size, stride, the hardware-visible
> > ASID, whether a specific mm is associated with the request, the target
> > CPU mask and its weight, the requested scope, and the selected path.
>
>
> >
> > Record the complete target mask in addition to its weight because CPU
> > identity cannot be reconstructed from a count and is needed to correlat=
e
> > the request with per-CPU scheduler, IPI, and firmware activity.
> >
> > The event records the invalidation request and the path selected by Lin=
ux
> > before the operation is dispatched. In particular, selecting the SBI
> > RFENCE path means that Linux delegated the request to firmware; the eve=
nt
> > does not describe the implementation or outcome of that delegated
> > operation.
> >
> > Tested on QEMU virt with OpenSBI using local and shared-mm
> > mprotect()/munmap() workloads. Local requests reported path=3Dlocal,
> > while remote requests reported path=3Dsbi-rfence and were followed by t=
he
> > existing riscv:sbi_call RFENCE event.
> >
> > The cross-CPU-call path was tested with QEMU virt using APLIC+IMSIC.
> > A MADV_PAGEOUT reclaim workload was used to exercise mm-independent
> > global flushes. All reported path values (local, sbi-rfence and
> > cross-cpu-call) and scope values (single, range, address-space and all)
> > were observed.
> >
> > Signed-off-by: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
> > ---
> > Add a RISC-V tracepoint for observing the path selected by Linux for TL=
B
> > invalidation requests: local invalidation, SBI RFENCE, or Linux
> > cross-CPU coordination.
> >
> > The tracepoint is intended to make RISC-V TLB shootdown behavior easier
> > to correlate with MM activity, CPU targeting, SBI calls, and IPI
> > handling. The patch records the invalidation request context and the
> > Linux path-selection decision before the operation is dispatched.
> >
> > The patch was tested on QEMU virt with both the SBI RFENCE path and an
> > APLIC+IMSIC configuration. Local, SBI RFENCE, and cross-CPU-call paths
> > were exercised. All reported scope values -- single, range,
> > address-space, and all -- were also observed.
> > ---
> > Changes in v2:
> > - Use trace_call__riscv_tlb_flush_path() after the explicit
> >   trace_riscv_tlb_flush_path_enabled() check to avoid a second
> >   tracepoint static-key test, as suggested by Steven Rostedt.
> > - Link to v1: https://lore.kernel.org/r/20260829-tlb_tracepoint-v1-1-df=
daede7e741@gmail.com
> > ---
> >  arch/riscv/mm/tlbflush.c         |  60 +++++++++++++++++++--
> >  include/trace/events/riscv_tlb.h | 113 +++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 169 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> > index 962db300a166..cefce9364bd2 100644
> > --- a/arch/riscv/mm/tlbflush.c
> > +++ b/arch/riscv/mm/tlbflush.c
> > @@ -9,6 +9,9 @@
> >  #include <asm/mmu_context.h>
> >  #include <asm/cpufeature.h>
> >
> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/riscv_tlb.h>
> > +
> >  #define has_svinval()        riscv_has_extension_unlikely(RISCV_ISA_EX=
T_SVINVAL)
> >
> >  /*
> > @@ -63,6 +66,33 @@ void local_flush_tlb_kernel_range(unsigned long star=
t, unsigned long end)
> >       local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_T=
LB_NO_ASID);
> >  }
> >
> > +static enum riscv_tlb_flush_scope
> > +riscv_tlb_get_flush_scope(unsigned long size, unsigned long stride, bo=
ol has_mm)
> > +{
> > +     if (size =3D=3D FLUSH_TLB_MAX_SIZE)
> > +             return has_mm ? RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE :
> > +                     RISCV_TLB_FLUSH_SCOPE_ALL;
> > +
> > +     return size <=3D stride ? RISCV_TLB_FLUSH_SCOPE_SINGLE :
> > +             RISCV_TLB_FLUSH_SCOPE_RANGE;
> > +}
> > +
> > +static __always_inline void
> > +riscv_tlb_trace_flush_path(const struct cpumask *cmask, unsigned long =
start,
> > +                        unsigned long size, unsigned long stride,
> > +                        unsigned long asid, bool has_mm,
> > +                        enum riscv_tlb_flush_path path)
> > +{
> > +     enum riscv_tlb_flush_scope scope;
> > +
> > +     if (!trace_riscv_tlb_flush_path_enabled())
> > +             return;
> > +
> > +     scope =3D riscv_tlb_get_flush_scope(size, stride, has_mm);
> > +     trace_call__riscv_tlb_flush_path(start, size, stride, asid, has_m=
m,
> > +                      cmask, scope, path);
> > +}
> > +
> >  static void __ipi_flush_tlb_all(void *info)
> >  {
> >       local_flush_tlb_all();
> > @@ -70,12 +100,26 @@ static void __ipi_flush_tlb_all(void *info)
> >
> >  void flush_tlb_all(void)
> >  {
> > -     if (num_online_cpus() < 2)
> > +     if (num_online_cpus() < 2) {
> > +             riscv_tlb_trace_flush_path(cpu_online_mask, 0,
> > +                                        FLUSH_TLB_MAX_SIZE, 0,
> > +                                        FLUSH_TLB_NO_ASID, false,
> > +                                        RISCV_TLB_FLUSH_PATH_LOCAL);
> >               local_flush_tlb_all();
> > -     else if (riscv_use_sbi_for_rfence())
> > -             sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, F=
LUSH_TLB_NO_ASID);
> > -     else
> > +     } else if (riscv_use_sbi_for_rfence()) {
> > +             riscv_tlb_trace_flush_path(cpu_online_mask, 0,
> > +                                        FLUSH_TLB_MAX_SIZE, 0,
> > +                                        FLUSH_TLB_NO_ASID, false,
> > +                                        RISCV_TLB_FLUSH_PATH_SBI_RFENC=
E);
> > +             sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE,
> > +                                        FLUSH_TLB_NO_ASID);
> > +     } else {
> > +             riscv_tlb_trace_flush_path(cpu_online_mask, 0,
> > +                                        FLUSH_TLB_MAX_SIZE, 0,
> > +                                        FLUSH_TLB_NO_ASID, false,
> > +                                        RISCV_TLB_FLUSH_PATH_CROSS_CPU=
_CALL);
> >               on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
> > +     }
> >  }
> >
> >  struct flush_tlb_range_data {
> > @@ -107,12 +151,20 @@ static void __flush_tlb_range(struct mm_struct *m=
m,
> >
> >       /* Check if the TLB flush needs to be sent to other CPUs. */
> >       if (cpumask_any_but(cmask, cpu) >=3D nr_cpu_ids) {
> > +             riscv_tlb_trace_flush_path(cmask, start, size, stride, as=
id,
> > +                                        !!mm, RISCV_TLB_FLUSH_PATH_LOC=
AL);
> >               local_flush_tlb_range_asid(start, size, stride, asid);
> >       } else if (riscv_use_sbi_for_rfence()) {
> > +             riscv_tlb_trace_flush_path(cmask, start, size, stride, as=
id,
> > +                                        !!mm, RISCV_TLB_FLUSH_PATH_SBI=
_RFENCE);
> >               sbi_remote_sfence_vma_asid(cmask, start, size, asid);
> >       } else {
> >               struct flush_tlb_range_data ftd;
> >
> > +             riscv_tlb_trace_flush_path(cmask, start, size, stride, as=
id,
> > +                                        !!mm,
> > +                                        RISCV_TLB_FLUSH_PATH_CROSS_CPU=
_CALL);
> > +
> >               ftd.asid =3D asid;
> >               ftd.start =3D start;
> >               ftd.size =3D size;
> > diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/ri=
scv_tlb.h
> > new file mode 100644
> > index 000000000000..3eff171ec54f
> > --- /dev/null
> > +++ b/include/trace/events/riscv_tlb.h
> > @@ -0,0 +1,113 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM riscv_tlb
> > +
> > +#if !defined(_TRACE_RISCV_TLB_H) || defined(TRACE_HEADER_MULTI_READ)
> > +#define _TRACE_RISCV_TLB_H
> > +
> > +#include <linux/cpumask.h>
> > +#include <linux/tracepoint.h>
> > +
> > +#ifndef _TRACE_RISCV_TLB_ENUMS
> > +#define _TRACE_RISCV_TLB_ENUMS
> > +
> > +enum riscv_tlb_flush_scope {
> > +     RISCV_TLB_FLUSH_SCOPE_SINGLE,
> > +     RISCV_TLB_FLUSH_SCOPE_RANGE,
> > +     RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE,
> > +     RISCV_TLB_FLUSH_SCOPE_ALL,
> > +};
> > +
> > +enum riscv_tlb_flush_path {
> > +     RISCV_TLB_FLUSH_PATH_LOCAL,
> > +     RISCV_TLB_FLUSH_PATH_SBI_RFENCE,
> > +     RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL,
> > +};
> > +
> > +#endif /* _TRACE_RISCV_TLB_ENUMS */
> > +
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
> > +
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_LOCAL);
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_SBI_RFENCE);
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL);
> > +
> > +#define show_riscv_tlb_flush_scope(scope) \
> > +     __print_symbolic(scope, \
> > +             { RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
> > +             { RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
> > +             { RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" },=
 \
> > +             { RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
> > +
> > +#define show_riscv_tlb_flush_path(path) \
> > +     __print_symbolic(path, \
> > +             { RISCV_TLB_FLUSH_PATH_LOCAL,          "local" }, \
> > +             { RISCV_TLB_FLUSH_PATH_SBI_RFENCE,     "sbi-rfence" }, \
> > +             { RISCV_TLB_FLUSH_PATH_CROSS_CPU_CALL, "cross-cpu-call" }=
)
> > +
> > +/*
> > + * Record the invalidation request received by the RISC-V architecture=
 code
> > + * and the path selected by Linux.
> > + *
> > + * The target CPU mask represents the CPUs Linux intends to cover for =
the
> > + * request. It can be correlated with per-CPU activity, but does not d=
escribe
> > + * which harts ultimately performed an invalidation.
> > + *
> > + * The ASID is hardware-visible and may be reused. It must not be trea=
ted as a
> > + * persistent identifier for an mm.
> > + *
> > + * The stride describes the invalidation granularity supplied to the R=
ISC-V
> > + * implementation. SBI RFENCE receives start, size and ASID, but not s=
tride.
> > + *
> > + * The event is emitted at path selection time. For SBI RFENCE, it rec=
ords
> > + * delegation of the request to firmware; firmware processing after th=
at
> > + * point is outside the event's scope.
> > + */
> > +TRACE_EVENT(riscv_tlb_flush_path,
> > +     TP_PROTO(unsigned long start, unsigned long size,
> > +              unsigned long stride, unsigned long asid, bool has_mm,
> > +              const struct cpumask *cmask,
> > +              enum riscv_tlb_flush_scope scope,
> > +              enum riscv_tlb_flush_path path),
> > +
> > +     TP_ARGS(start, size, stride, asid, has_mm, cmask, scope, path),
> > +
> > +     TP_STRUCT__entry(
> > +             __field(unsigned long, start)
> > +             __field(unsigned long, size)
> > +             __field(unsigned long, stride)
> > +             __field(unsigned long, asid)
> > +             __field(bool, has_mm)
> > +             __field(unsigned int, target_mask_weight)
> > +             __cpumask(target_cpus)
> > +             __field(u8, scope)
> > +             __field(u8, path)
> > +     ),
> > +
> > +     TP_fast_assign(
> > +             __entry->start =3D start;
> > +             __entry->size =3D size;
> > +             __entry->stride =3D stride;
> > +             __entry->asid =3D asid;
> > +             __entry->has_mm =3D has_mm;
> > +             __entry->target_mask_weight =3D cpumask_weight(cmask);
> > +             __assign_cpumask(target_cpus, cpumask_bits(cmask));
> > +             __entry->scope =3D scope;
> > +             __entry->path =3D path;
> > +     ),
> > +
> > +     TP_printk("start=3D%#lx size=3D%#lx stride=3D%#lx asid=3D%#lx has=
_mm=3D%d target_mask_weight=3D%u target_cpus=3D%s scope=3D%s path=3D%s",
> > +               __entry->start, __entry->size, __entry->stride,
> > +               __entry->asid, __entry->has_mm,
> > +               __entry->target_mask_weight, __get_cpumask(target_cpus)=
,
> > +               show_riscv_tlb_flush_scope(__entry->scope),
> > +               show_riscv_tlb_flush_path(__entry->path))
> > +);
> > +
> > +#endif /* _TRACE_RISCV_TLB_H */
> > +
> > +/* This part must be outside protection. */
> > +#include <trace/define_trace.h>
> >
> > ---
> > base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
> > change-id: 20260829-tlb_tracepoint-844105ab5092
> >
> > Best regards,
> > --
> > Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



--=20
Kind regards,
Roman 'Hedin' Storozhenko
