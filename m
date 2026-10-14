Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE87559CBD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993537; cv=pass; b=dbOND8kv3DoIa8mPWQaab6NPZTx1OGKzOTpRMMmjIrbDfmA6ZQJoabeKSam5P0a55XOlNgAAJtUxAv9Yc4mERuW4cG4uRlMF9lVAFJWeminZ8Adw9Xl/Xj2sH72jeAeCZRTen5LSxxY5ZPMjYDOcQLclQ/2L/7ydK57FITxVQro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993537; c=relaxed/simple;
	bh=muQm0s7PvTWzSjbKEtdCukDHCYY4BrgfmWdQVqb1iTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjH7m/NXcuUzZagcvKxToLD4vAuXaRQtndcypSsxeTycyHT7qN7XUKPulc9GJ5hmYxOB0Hgka+rV/vF0kaSWJxYvCUv4LWP2dB5s3aHG9x8JVnzBpgbVzZj4RyEHmrbxDb4ylwZTSLvxcY27yrIdzs7n2EDHHT5dxN/BQMWntVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8iJesih; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8iJesih"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ad98c3fb15so35295227b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791993534; cv=none;
        d=google.com; s=arc-20260327;
        b=NeIZUCMxiqglt3Uka4/ZILbcasZKBMcz94g6PUj3YXtjmoh8bwho1MmtQ/ZP5kz8UF
         GMlgLvFsW80j2v32TauAG4TqIz0XGM8L74LikrfR0uNZA6mr20t1/RYnnI1+6iduw8Yf
         5w4rJ5jlVEBsHQYQeJBipWSCEa+peo3V38uBfn4JZoh1gR0ATH/wJdsObQgZJrLw9yvy
         ghdMe+n9X3eReNjIEg2JX/fWyD7a4/ccb0e5HrSNanhEfEAd2aGe2MFFMhKZVQv0peQV
         n+P830aQGUgsxN17XCuZv6+jZhzIBObbehQNQqPK9agFbla7CDh6+9+8m5s+Uth0PZJn
         PBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uG67pkTRgKzkR6LvuqxkQbDWT2zXsCHC/7cg773gWss=;
        fh=TrLEGAc+3r1G0yt2FM5b5aHwu6vtH1U4Q0blylKd1QM=;
        b=rN08PM+y6uC2rj94gt+RqYkVIXCeIe+yEzV/nJWvrK5GNyFbhBwLV6o1JXR5GE16fI
         RHJtddPcXMrQIYXPrh+HZhW4/VgsuS9OYKm/wh+IlWerTwAkaPV3Bm45nrsGErXrAgtE
         0IwYO66z44fnyl2NRr34p/1jQttOKxe/YmsbkLFSgDXCHLip1QxD0af5KLNsED94HvxA
         o+55v/cdUF4vmul/m4j4pSsRh9Q7azVQr+mx3kmg+LEVzhk1rilSZh9YeEqsNGVL7Le1
         mCdG5sbuw5KQ1NW5hx1euHwpBpUjmt/OKeIVzec7qe7V1OEBws5fqgROjB0/YhOcsXc4
         UF3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791993534; x=1792598334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uG67pkTRgKzkR6LvuqxkQbDWT2zXsCHC/7cg773gWss=;
        b=W8iJesihY5XNl3+jwedxyMaheTWRMCQPOHj9cID3H18db2Z1vXFkvdtHCgeQ9SVMSK
         G+huF5F8bucUqF/x4LxSqYmWmxKkVC8HcO3RIDNN9xrqhPn49LzWEmpvi9T8ZqSmDUg0
         zN313Oe5NK1Zz2aGK+p5Q6Ip9bWzwqUEhdAV9UiFlZGkG7iimU/udOMAXb/JNu1QYl8m
         CTePH3Aes+Ql1/Rmnh/mAOdBzRA1HFhbxH5hu5wKDhn8+VHjxnwOKLJgLYj+3hReA2oE
         mwXlWysZhe7VMMw4a79bE3XjimBoY0qcTBAUUdEQdtG/hO6AlAeksciT7eJcNggsvyPo
         V3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993534; x=1792598334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uG67pkTRgKzkR6LvuqxkQbDWT2zXsCHC/7cg773gWss=;
        b=kaSiFs9NQjO/069bO6fGkphqDMnYExXXlHRcbyjM1TfySqhvSv4AUcqijKGRwj7tyc
         CH/9BtEehoH76vWgI1qMk4c0mxxy9jU4vVcqC4TGdJe/LteLFe6pMnzWwqKBH2CMVSp0
         97PRfrPZHCfnjXYs24F9w7zrF2rQbtMI+2g9WghzKfi6qSqQ2iVqEcav4RihsMVPiO/t
         OGkY9EmmeVuK/LzjTMMM2l53y/i2qF/WBGG8qhcTFEKGlMG21IkV3aPd6E55OD6SMkoc
         wzu3lM9P3meKOotqz/WI0/H9M/1tpciaZk3HUEQ5hXcA/x+68QtQoLxM9wuQrHW0YwpP
         8vJg==
X-Forwarded-Encrypted: i=1; AKwUvBxGtjNMV/tUeMh4cXrXFrW/Q/KAY8HicUVpD5XDhGKj0B2INlkc6sSTm7ZHnThQfdQlXcMJbsFM69p/Ho8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAN8i/R2H80dKsfMx+uDG6No6EyKZNtjZLzajoEr3tbvyPUlX3
	1P0Nu2C6tDtXXGF/XRTv7fjGukfi0/fLqPNcPBa3Nkbi0NDfg8EoXMorOvSrU/0N+Tyc7BNjkC9
	cNERe4YoP6TmFcdIQ8wEp+YQEML222EM=
X-Gm-Gg: AYBFou0xYah4MqMUHuqtP0F4mxPIAgBmSmd63MzR4FypkJUHIYplZXidJO7A/gB8sDX
	7IKk2wr9ryri9utTSq4u1I2RMms5sWX01j3cY7EAOSnty5a+g4tlPDfLkxq2zBhUxFe1ESJw9XE
	ai7W2U3wu1FTiYAC/n4Y4QiXAG6if+JE6bJ63zxMeqJxy2xlSmBkTSWsS8kFUbw/ooT0hsBfCZ6
	au06IEKTc5HtLCX8gP37psN/vFtdWBYAz+u8auRCGIBHg8SfHTmF6E+RQ1h+lWDD+jHuyUmHhA5
	lPd1/xJuxBx8pG5y47DoXnXUXjbPMWpBTF4VmrkEr9iwe13RT/LBeW4=
X-Received: by 2002:a05:690c:10:b0:87d:b776:c659 with SMTP id
 00721157ae682-8b07edca197mr64794137b3.11.1791993534223; Wed, 14 Oct 2026
 08:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
 <ar_Rathmoj2aP-H7@xhacker> <CALsPMBOYQbro2gZTQR=DSUowmVDs9kujH4ua2UzCoHAQrncuiw@mail.gmail.com>
 <asm95GdbmMpc81p3@xhacker> <CALsPMBPMHc7q-YZvqLLYDSr5RfLmDRwBSq-TFeB8Fc8bPBjQGg@mail.gmail.com>
 <as8NpaT0g9Tsl6PS@xhacker>
In-Reply-To: <as8NpaT0g9Tsl6PS@xhacker>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Wed, 14 Oct 2026 17:58:42 +0200
X-Gm-Features: AclHuK8jzKVVHBmsU7NvUZhjXtKxblD3j-K7ELEsbZkJt4NswiokTV40lqJbK8Q
Message-ID: <CALsPMBOdy4ZDWfnkYokUFuB3UYPV27wTUpBCZaxLWEV10ZuS=A@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jisheng,

Thanks for the clarification.

Since Radim's tracepoint code-generation results are now part of this
discussion, I've added him to Cc in case I misinterpret any aspect of
that issue.

I agree with you on one point regarding the compiler overhead. Since
the kernel supports older GCC versions, we have to take the code
generated by those supported compilers into account today. So
describing the issue simply as temporary was too strong.

However, I think there are two separate questions here: whether the
event exposes useful information, and whether the disabled-path cost
of its current implementation is acceptable.

Regarding kprobes, most of the raw fields in this event are indeed
already arguments of `__flush_tlb_range()`. My point is not that these
values are impossible to obtain dynamically.

Kprobes can be used to observe a very large part of the kernel. If the
ability to reconstruct an event with kprobes were by itself sufficient
reason not to add a tracepoint, the same reasoning would apply to many
existing tracepoints.

The distinction I see here is between observing implementation details
and exposing the semantic event directly.

For this case, the interesting information is not only `start`,
`size`, `stride`, `cmask`, etc., but their correlation with the path
Linux selected for that particular request:

        local
        SBI RFENCE
        cross-CPU call

Calculating the local case from `cmask` may be simple with the current
implementation, but the tracing program still has to reproduce
knowledge of the selection logic. Likewise, observing downstream
functions ties the tracing program to the current call graph.

I also don't think `/proc/interrupts` provides equivalent information here.

The RISC-V IPI statistics are aggregate counters. In particular, Linux
accounts `IPI_CALL_FUNC` as "Function call interrupts", while SBI
RFENCE is handled below Linux by firmware; for example, OpenSBI
implements the remote TLB operation using its own `IPI_TLB` event.

So checking `/proc/interrupts` can certainly be useful as a sanity
check in a controlled workload: an increase in function-call IPIs can
indicate use of the Linux cross-CPU path.

But it cannot associate that IPI activity with a particular TLB
invalidation request, and it cannot correlate it with the range, ASID,
stride and target cpumask. Other users of the call-function IPI also
contribute to the same counters. In a concurrent workload this becomes
an inference rather than an observation of the TLB path decision.

That per-request correlation is what I am trying to expose with the tracepo=
int.

Regarding the performance argument, I agree that the disabled path
must be cheap and that the current RISC-V tracepoint code-generation
issue is relevant when evaluating the patch.

I would not claim that all tracepoints have exactly the same overhead.
My narrower point is that the issue referenced in Radim's thread is a
general interaction between RISC-V tracepoints and compiler code
generation rather than something specific to the semantics of this
event.

If the generated disabled path is considered too expensive, that is a
valid implementation concern and may require improvement or
mitigation. But I don't think it shows that the TLB path-selection
event itself is redundant because the information can be reconstructed
with kprobes.

There is also no contradiction, in my view, between using the event
for performance analysis and the event having overhead when enabled.
Tracing normally perturbs the workload when it is enabled. The
intended use here is primarily to understand things such as the
distribution of local/SBI/IPI decisions and the request context
associated with those decisions, rather than to use the tracepoint
itself for cycle-accurate measurement of the cost of a TLB flush.

The important requirement is therefore that the disabled path be
sufficiently cheap.

I think the PowerPC TLB tracepoints also remain a useful precedent
here: they show that permanent architecture-specific TLB observability
can be worthwhile when the architecture-specific information is
useful.

So I agree that convenience, maintenance cost and disabled-path
overhead all need to be considered. I just don't think that kprobes or
`/proc/interrupts` provide the same abstraction as recording the
path-selection decision directly.

Thanks,
Roman

On Wed, Oct 14, 2026 at 7:25=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> On Sun, Oct 11, 2026 at 02:43:05PM +0200, Roman Storozhenko wrote:
> > On Sat, Oct 10, 2026 at 6:44=E2=80=AFAM Jisheng Zhang <jszhang@kernel.o=
rg> wrote:
> > >
> > > On Sat, Oct 03, 2026 at 10:54:44AM +0200, Roman Storozhenko wrote:
> > > > On Fri, Oct 2, 2026 at 6:04=E2=80=AFPM Jisheng Zhang <jszhang@kerne=
l.org> wrote:
> > > > >
> > > > > On Sun, Aug 30, 2026 at 04:36:37PM +0200, Roman 'Hedin' Storozhen=
ko wrote:
> > > > > > Make RISC-V TLB flush path selection observable. Record whether=
 Linux
> > > > > > handles an invalidation locally, delegates it to SBI RFENCE, or=
 executes
> > > > > > it through a cross-CPU call, so MM activity can be correlated w=
ith the
> > > > > > RISC-V, firmware, or Linux cross-CPU path carrying the request.
> > > > >
> > > > > I didn't see too much usefullness of the trace here. why not use =
kprobe
> > > > > instead? can you plz show a real usage example of the trace? Whic=
h
> > > > > bug/performance problem can be solved conveniently with this trac=
e only?
> > > > >
> > > > > From another side, except x86, other architectures don't have the=
 trace
> > > > > in the TLB path.
> > > > >
> > > >
> > > > Hi Jisheng,
> > > >
> > > > Thanks for the review. I agree that the current commit message desc=
ribes
> > > > the intended use rather abstractly.
> > > >
> > > > A kprobe can certainly be used to investigate this. My motivation
> > > > for a tracepoint is not that dynamic tracing cannot obtain the
> > > > information, but that doing so requires knowledge of the current
> > > > implementation and reconstruction of a semantic decision made insid=
e
> > > > __flush_tlb_range() / flush_tlb_all().
> > >
> > > I prefer aligning with other architectures(except x86), I.E not
> > > add this kind of trace. However, I would leave the decision to riscv
> > > maintainers.
> > >
> > > FYI, you may notice that the riscv trace overhead is not trivial per
> > > https://lore.kernel.org/linux-riscv/20250619190315.2603194-4-rkrcmar@=
ventanamicro.com/
> >
> > Hi Jisheng,
> >
> > Thanks for the feedback.
> >
> > Regarding the comparison with other architectures, thanks to Michael
> > Ellerman for pointing me to the PowerPC TLB tracing when we happened
> > to discuss this at LPC 2026.
> >
> > PowerPC defines the powerpc:tlbie and powerpc:tlbia trace events in
> > arch/powerpc/include/asm/trace.h, and the corresponding trace calls
> > are used in the PowerPC TLB invalidation paths.
> >
> > These events are not identical to the proposed RISC-V event: the
> > PowerPC events primarily describe architecture invalidation
> > operations, whereas this patch records the path selected by Linux
> > before dispatch. However, I think they provide useful precedent for
> > architecture-specific TLB observability beyond x86.
> >
> > Regarding kprobes, I agree that dynamic tracing can be used to investig=
ate this.
> >
> > My concern is that obtaining the same information requires knowledge
> > of the current implementation and reconstruction of the decision made
> > inside __flush_tlb_range() / flush_tlb_all().
> >
> > For example, probing __flush_tlb_range() gives us the incoming
> > request, but does not directly tell us whether Linux selected the
> > local flush, SBI RFENCE, or cross-CPU-call path. A tracing tool has to
> > probe and correlate implementation-specific downstream functions, or
> > reproduce the selection logic itself.
>
> Hmm, let's look at where the tracepoints added:
> void __flush_tlb_range(struct mm_struct *mm,
>                               const struct cpumask *cmask,
>                               unsigned long start, unsigned long size,
>                               unsigned long stride)
> void flush_tlb_all(void)
>
> most of the information you exported with the tracepoints are just
> parameters of flush_tlb_range.
> So kprobe or function trace can also get most of them, while whether
> local or not needs to calcuate the cmask, but getting this info is
> also easy via. adding one LoC to the kprobe routine.
>
> The tlb invalidation is frequently executed, so we need to carefully
> evaluate the convience VS maitanince offort and performance overhead when
> adding permanent tracepoints, given current riscv tracepoint overhead
> isn't trivial.
>
> BTW: whether SBI RFENCE or cross-cpu-call is much easier. Just search
> IPI in /proc/interrupts. No need to kprobe/function trace/tracepoint
>
> >
> > The proposed event records this semantic decision directly at the
> > point where Linux makes it. Users therefore do not need to depend on
> > the current helper names, call graph, or exact implementation of the
> > selection logic.
> >
> > Regarding the tracepoint overhead issue, I agree that disabled-path
> > overhead is important, especially in the TLB flush path.
> >
> > However, I see the referenced SBI tracepoint case primarily as a
> > RISC-V compiler/code-generation issue rather than as an argument
> > against providing this kind of observability.
> >
> > The referenced discussion itself shows that the generated code depends
> > significantly on compiler behavior, and that this is an area being
> > improved. The undesirable overhead is not an inherent semantic
> > requirement of the tracepoint.
> >
> > Even if the same code-generation problem currently affects this
> > tracepoint, I don't think a temporary compiler limitation should by
> > itself determine whether the tracepoint is useful or whether this
> > observability belongs in the kernel.
> >
> > If the compiler currently generates unacceptable disabled-path
> > overhead, that is certainly something that should be improved or
> > mitigated in the implementation. But I would separate that issue from
> > the question of whether exposing the RISC-V TLB path-selection
> > decision is useful.
> >
>
> But we need to live with it. Per the Radim email, gcc14 can still
> see the issue, given the minimum gcc version of kernel building
> requirement is gcc8 now, gcc14 has a long time to bailout.
>
> And another tricky point here is
> one of your motivations of adding the tracepoint is to profile then
> improve the tlb related code path performance, but adding the
> tracepoint brings non-trivial overhead to tlb code path.



--=20
Kind regards,
Roman 'Hedin' Storozhenko
