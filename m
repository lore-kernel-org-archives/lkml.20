Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500744;
	b=dFtBS44lnUbNd9mOyh+Q8e37s3xUI27GU6Im/Sorc/y+ZA0ZqNGiT3zn6zG7WIDzgp+Q
	 InQdLUBAt0SXofkmj5IfjXFPvzmxGtiknO8uP8JxXe1+rsKp4aViAdrNcOsWb+EYKjwWg
	 zDorEeFfE2kXf9f/UyKk1Y9etRv7HgETewTDWu55kfAunMV+buQkUgmLHWwhyMn3cKLEo
	 3gXDQIBoG7OXyRFCmov8bRUdfcbG1Vg/hZyEy+5GzvqbdEvlH/Xw0yd9OheIX/D9TwAnm
	 kP7yKI9DQjrPrvDrLGAAxcfnShHbjmcbrl3QieLbdFBwRn7K+nBUhPlTeBM6saywzaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wsga5YxQJV8BdGLRzU12IcLaPMbibOtGEKGDnbNj1Ns=;
	b=Lw78yh86jaQBzivj1Vix5uBKxk+R2V7sD05vDBXFIELIRx7ideSAHz+XzP+zYqQTj+mN
	 jENcztEjEAjYkJt/t/rAFte86QOUw3kiMb7QIjW4RjZSAYqoCHyepfb3JTFuewHV+YtvS
	 uxZ5O6pLDFCHKtGQscRfLfHTmT5Wov9eKECxFOgailZpUv2TjKvp4bD1guubWTLjpjUbc
	 gq11JJiafohRhMTJEOwcnL41fWqUCrjH54QApED+AT/Ljlbx+T2BozJDw1yKU35GSyPR+
	 XXESbPFyyrlDrqiTsgYFKFf3WlnzxJwh0S69zOX0Gr7r11mT0g720QFfi4nkHUGDw0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrPgCRv6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE345606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE345606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PrPgCRv6
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba357a1929so3266913e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500741; cv=none;
        d=google.com; s=arc-20260327;
        b=DoBKZdPp1bvYy78RhvB4JU+stecW0/j+yoFB7WudhDqe0Tiyt2Kc3Ttc0uorr6qLV5
         RJ8ru/072ZHJ1OLNJg44s7htOl6QM2P+v0rQHtUpdlOgDpYlMAGUPWFZkqu6Xg7V/fob
         XVnCgg3IU25J44kD4uKLHTzXrWDpwyWv3s8BqdJ6VMhx8yVP/ZIeapOYYXoaxXo1499Y
         DQ59EugsXVckusL0/hGt+sasqwjaunJHMAWLtxFBHWkhPR6wXJlIYCZY1UBU2z9tVNRb
         joD9AzI8WH/6637aBaKYAYnHTAa6XpoYXtKwrWw0u7Tz4uWjTvDkxKTwBxSjgTb0LhIC
         hk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wsga5YxQJV8BdGLRzU12IcLaPMbibOtGEKGDnbNj1Ns=;
        fh=tohXEBdIsEuD/TaWeKhRwd3W3fpEV9YdydffNtEVeJ4=;
        b=Kn/N5ZF7Aa3PwlZP7j/Wsy4cXzlWIGgrL3+WrwRSL/MCJPiX+cLmY9QcqY4Xw2n3d1
         bFkIr907WqSPQ+GZi55b3HiHiufjNWS3ypBteWSdBFA0FBLqohc+v/tIEnLZCc0ApJ/K
         T8ObJMHzJ1GmLPC8QSdlY0rPVgpd/mYAk5kEQkWpmrBgs46aXpy70kJQgJbSezz2MWnO
         pu/gxn5ZsOdehnykxi4W0nIf3iAzHDIMDE9xnV57d8V+FSZ6nn+EMqbwq0XpAf/UXEzF
         cp/KNasQ3ThvEI/vrnAQL3/echHJfQKrQUcHyfouE1NvczZjj16F8kcOWguiDWg0DgUH
         /oFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500741; x=1793105541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wsga5YxQJV8BdGLRzU12IcLaPMbibOtGEKGDnbNj1Ns=;
        b=PrPgCRv6L1T/D0vpHhDQ6lq1raALqm+yvgAPgmwZQURa4DWNRvz9oE6PD3yvCQTtjP
         Y1lywOFm3VBwVe0a6HHLYoalcP2aWl6Hg7iLjHucS3Q4xxcuohVh0SEYhNDQJZvAyzke
         2+f/niXqjtpYA3DD+hgFV3cxhf665R5Uxqc5Ao91XSanD24191RNz82mtcMSCWCTpAZg
         BU4S/tfB31rwQon20+5JNK1ZAuyu3WDCOSO+ae2mCuBWM0Y/5NZv/8h7aZr5e9bTliEy
         6QR9heNHtjAxp0GeuWoftbWMDp4EejLBWGZBka3avb4ZvvSe+BsX3SZCv1V6rSkpS21C
         /lzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500741; x=1793105541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wsga5YxQJV8BdGLRzU12IcLaPMbibOtGEKGDnbNj1Ns=;
        b=ERXvMOJdRQae1cWMecOaLbzxpdCN8Qj8rxjDZ2mW3i9xWcU9yJNrVY3VLM5+sO757E
         k7fG+kjN0n20k4565CY3CImG6Pz2Q0+47Xh+iT0uhx2rl8H/HGAhSa513N8Da700WIb7
         Pt85oLjhdJxWI8MtfCM+XJ6Lfu0u/ntlGGc/tPAIYIL+oieDoKYuM4FedQFiWdbiu8wH
         oT+sNXP/99mLk0c9tZc1Ks9+ckgEvnea9cvefsO3pyuUT7bqVdgYXJ+kO64Nlno6H0A6
         4yKJGF+Y8OejOoldLHGTq47qM6BjhyyNiqJVGuXxVettFu4ZyY7KnV5/Ieu0Z3bvmuGp
         Z7pw==
X-Forwarded-Encrypted: i=1; AKwUvBxHujHoIHh2Y55UKIfNfsngg1EvDeQCUThoc9vNdlnhHKGz5vrMAsykKZfrHcp2/+4/sBdsiQcqjDjFyJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzCT8G1ZS77M7lx79oJJlvlCWIpU4cEs1zDCXM2kKuez9xr5Ya
	VHARZdaaiHOXVEmZ4sYD0BY43a7uhx87MD98mZT2sqdBWeKcFGxV3tUCxE8iRMXEibbNViVkNC8
	g61vcp4iXcrlMi/vGiCwLxBcEfMk0pFQ=
X-Gm-Gg: AYBFou2HacSlRj9PfVpqxQ+MbfdYDjkdxurtgVN4DnGT+DH9DxxmtkBuAxnQEy30Pzj
	n73X9bnEb4O+DLlNUCxWPiaAgwWJMlkXi1M1MwK182cjzeGreDwMzc5YE6qZUW2+MniEdwkidJV
	xZ9X7f4JX16M8d2/JRysZGbxMTrX1Kpkk2Ld4LGFvPInm5y8B9FMoMAGtmZb/wL5k3+VKH9VdRo
	tx8xpKsjbYKpcGKB4ShQuMcltxyh6G5lvgTLtwmKH5zgGx+BIfZB6A6uvps8w7bYCZoPRPbp5/F
	H5DvCRylyZUtH2efmslEwZ+aY0pQT4Fh7x3WKW4chEYiw1OXO4HIG8k=
X-Received: by 2002:a05:6512:3a8a:b0:5bc:e47d:498c with SMTP id
 2adb3069b0e04-5be50a6c2e7mr3613971e87.22.1792500740687; Tue, 20 Oct 2026
 05:52:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-tlb_tracepoint-v7-1-4cc3e99d387a@gmail.com> <atbBHT6vY5we4YpE@xhacker>
In-Reply-To: <atbBHT6vY5we4YpE@xhacker>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Tue, 20 Oct 2026 14:52:06 +0200
X-Gm-Features: AclHuK8CFDT1NLkIHkcvm-gnGPC_p_-YqfBZfjctSJgRH68aNefJ3mQu-D6JmaU
Message-ID: <CALsPMBP6pZAWz=sKhmVWbHPsBL5OLm_YOca8Y1pnK9QvU9NSqw@mail.gmail.com>
Subject: Re: [PATCH v7] riscv: mm: Trace TLB flush requests
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:37=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> On Mon, Oct 19, 2026 at 07:20:51PM +0200, Roman 'Hedin' Storozhenko wrote=
:
> > Make RISC-V TLB flush requests observable together with the
> > architecture-specific context available when the request reaches
> > the RISC-V implementation.
> >
> > The generic tlb:tlb_flush event provides reason and page-count
> > information. At the RISC-V implementation level, additional
> > context is available, including the invalidation range and stride,
> > ASID, target CPU mask, and invalidation scope.
> >
> > This context is useful for debugging and workload analysis. The
> > target CPU mask shows the address-space CPU footprint involved in
> > an invalidation, while range and stride distinguish requests at
> > different mapping granularities. The ASID and scope help correlate
> > requests with MM, scheduler, IPI, and firmware activity.
>
> Hi Roman,
>
> no doubt the info is useful. But as commented in v2, the problem
> is whether the information can only be gotten with tracepoints,
> if no(I believe no, because the info exported by this patch are
> all function parameters now), what't the benefit of it over kprobe
> or function trace given the non-trivial tracepoint overhead on riscv
> platforms until gcc14, and we still dunno whether newer gcc has
> improved the situation or not.
>
> So I prefer not adding this tracepoint. But let's wait for riscv
> maintainers decision.
>
> Thanks

Hi Jisheng,

Thanks for your feedback.

I agree that much of this information can be obtained using
kprobes or function tracing. However, I don't think that
availability through dynamic instrumentation makes a dedicated
tracepoint unnecessary. The same argument could be made about
many existing kernel tracepoints.

The main benefit here is not access to individual function
parameters, but exposing a well-defined semantic event: a TLB
invalidation request, including its scope and target CPUs,
before it is dispatched.

Reconstructing this information using kprobes requires knowledge
of the current implementation, function signatures, and how
different parameters relate to the invalidation scope. Such
instrumentation can become fragile as the implementation evolves.

A dedicated tracepoint provides a consistent interface that
can be consumed directly by tools such as trace-cmd, perf,
and BPF, without requiring users to reconstruct the request
semantics from implementation details.

Regarding overhead, I agree that it matters, particularly when
tracing is disabled. However, I think we should distinguish
the usefulness of the tracing interface from compiler-specific
code generation issues. The latter can be improved independently
and should not necessarily determine whether the former is worth
providing.

If there is still significant overhead with current compilers,
I think it would be useful to quantify it rather than assume
it is a permanent limitation.

I believe the semantic observability provided by this tracepoint
justifies its inclusion, but I agree that the final decision
belongs to the RISC-V maintainers.

Regards,
Roman

> >
> > Add riscv_tlb:riscv_tlb_flush_request in flush_tlb_all() and
> > __flush_tlb_range(). Record start, size, stride, ASID (or the
> > no-ASID sentinel), whether an mm is associated with the request,
> > the target CPU mask and its weight, and the derived scope.
> >
> > Record the complete target mask because CPU identity cannot be
> > reconstructed from a count. Calculate its weight from the recorded
> > bitmap so both fields agree even if mm_cpumask() changes during
> > recording.
> >
> > The event describes an invalidation request before dispatch. It
> > does not report whether a remote flush uses SBI RFENCE or Linux
> > cross-CPU coordination, since that choice is effectively established
> > during initialization rather than made for each request.
> >
> > The address field (start) may contain kernel virtual addresses
> > for flushes involving kernel mappings. Require perf tracepoint
> > permissions even for counting-only events, since perf filters
> > could otherwise reveal address information through event counts.
> >
> > Tested on QEMU virt with OpenSBI using local and shared-mm
> > mprotect()/munmap() workloads, exercising single, range, and
> > address-space invalidations. A MADV_PAGEOUT reclaim workload
> > exercised global flushes. All four scope values were observed.
> >
> > Confirmed that trace-cmd records the event and that perf can count
> > it with sufficient privileges. With perf_event_paranoid=3D0,
> > unprivileged attempts to count the event using perf were denied,
> > as intended.
> >
> > Tested local and shared-mm invalidations with
> > CONFIG_UBSAN_ALIGNMENT=3Dy on QEMU virt without tracepoint-related
> > alignment warnings.
> >
> > Built with and without CONFIG_PERF_EVENTS.
> >
> > Signed-off-by: Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
> > ---
> > Add a RISC-V tracepoint for observing TLB invalidation requests
> > before they are dispatched by the architecture-specific
> > implementation.
> >
> > The generic tlb:tlb_flush event describes TLB flush activity using
> > reason and page-count information. The RISC-V event records
> > additional context, including the invalidation range and stride,
> > ASID, target CPU mask and its weight, and derived request scope.
> >
> > This context helps correlate TLB invalidation activity with MM,
> > scheduler, IPI, and firmware activity. The event describes the
> > request rather than the execution backend. SBI RFENCE versus Linux
> > cross-CPU coordination is effectively determined at initialization
> > rather than selected independently for each request.
> >
> > The target CPU mask weight is derived from the recorded bitmap to
> > keep both fields consistent under concurrent mm_cpumask() updates.
> > Since the address field (start) may contain kernel virtual
> > addresses, the event requires perf tracepoint permissions even
> > for counting-only access.
> >
> > Tested on QEMU virt with OpenSBI using local and shared-mm
> > mprotect()/munmap() workloads. A MADV_PAGEOUT reclaim workload
> > on QEMU virt with APLIC+IMSIC exercised global flushes. All four
> > scope values -- single, range, address-space, and all -- were
> > observed.
> >
> > Confirmed trace-cmd recording and privileged perf counting.
> > With perf_event_paranoid=3D0, unprivileged attempts to count the
> > event using perf were denied, as intended. The kernel was built
> > with and without CONFIG_PERF_EVENTS.
> >
> > Tested local and shared-mm invalidations with
> > CONFIG_UBSAN_ALIGNMENT=3Dy on QEMU virt without tracepoint-related
> > alignment warnings.
> > ---
> > Changes in v7:
> > - Rename the tracepoint header to asm/tlb_trace.h to make its
> >   purpose explicit, as suggested by Steven Rostedt.
> > - Link to v6: https://lore.kernel.org/r/20261018-tlb_tracepoint-v6-1-14=
476427870f@gmail.com
> >
> > Changes in v6:
> > - Change the scope field from u8 to u32 to ensure the dynamic
> >   CPU mask is properly aligned for bitmap operations.
> > - Verify local and shared-mm TLB flush tracing with
> >   CONFIG_UBSAN_ALIGNMENT=3Dy on QEMU virt.
> > - Link to v5: https://lore.kernel.org/r/20261017-tlb_tracepoint-v5-1-25=
6fb5393a7f@gmail.com
> >
> > Changes in v5:
> > - Move the architecture-specific trace event definition under
> >   arch/riscv/, as requested by Steven Rostedt.
> > - Calculate target_mask_weight from the recorded CPU mask to
> >   keep both fields consistent under concurrent updates.
> > - Require perf tracepoint permissions for counting-only access,
> >   since the event may expose kernel virtual addresses.
> > - Link to v4: https://lore.kernel.org/r/20261015-tlb_tracepoint-v4-1-f2=
38a2bd8f7e@gmail.com
> >
> > Changes in v4:
> > - Drop unrelated whitespace-only changes in arch/riscv/mm/tlbflush.c.
> > - Link to v3: https://lore.kernel.org/all/20261015-tlb_tracepoint-v3-1-=
eef305a3bb63@gmail.com/
> >
> > Changes in v3:
> > - Rebase on current RISC-V for-next.
> > - Thanks to Jisheng Zhang for pointing out that SBI RFENCE versus Linux
> >   cross-CPU coordination is effectively a system-wide choice establishe=
d
> >   during initialization rather than a per-request decision.
> > - Drop the local/SBI RFENCE/cross-CPU path field.
> > - Rename the event from riscv_tlb_flush_path to
> >   riscv_tlb_flush_request and refocus it on the semantic TLB
> >   invalidation request.
> > - Emit one request event independently of the mechanism subsequently
> >   used to perform the invalidation.
> > - Address checkpatch.pl --strict alignment issues.
> > - Link to v2: https://lore.kernel.org/r/20260830-tlb_tracepoint-v2-1-e3=
c88c24df5b@gmail.com
> >
> > Changes in v2:
> > - Use trace_call__riscv_tlb_flush_path() after the explicit
> >   trace_riscv_tlb_flush_path_enabled() check to avoid a second
> >   tracepoint static-key test, as suggested by Steven Rostedt.
> > - Link to v1: https://lore.kernel.org/r/20260829-tlb_tracepoint-v1-1-df=
daede7e741@gmail.com
> > ---
> >  arch/riscv/include/asm/tlb_trace.h | 103 +++++++++++++++++++++++++++++=
++++++++
> >  arch/riscv/mm/tlbflush.c           |  45 ++++++++++++++--
> >  2 files changed, 144 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/tlb_trace.h b/arch/riscv/include/as=
m/tlb_trace.h
> > new file mode 100644
> > index 000000000000..60b48eb0d355
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/tlb_trace.h
> > @@ -0,0 +1,103 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM riscv_tlb
> > +
> > +#if !defined(_TRACE_RISCV_TLB_TRACE_H) || defined(TRACE_HEADER_MULTI_R=
EAD)
> > +#define _TRACE_RISCV_TLB_TRACE_H
> > +
> > +#include <linux/cpumask.h>
> > +#include <linux/tracepoint.h>
> > +#include <linux/perf_event.h>
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
> > +#endif /* _TRACE_RISCV_TLB_ENUMS */
> > +
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_SINGLE);
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_RANGE);
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE);
> > +TRACE_DEFINE_ENUM(RISCV_TLB_FLUSH_SCOPE_ALL);
> > +
> > +#define show_riscv_tlb_flush_scope(scope) \
> > +     __print_symbolic(scope, \
> > +             { RISCV_TLB_FLUSH_SCOPE_SINGLE,        "single" }, \
> > +             { RISCV_TLB_FLUSH_SCOPE_RANGE,         "range" }, \
> > +             { RISCV_TLB_FLUSH_SCOPE_ADDRESS_SPACE, "address-space" },=
 \
> > +             { RISCV_TLB_FLUSH_SCOPE_ALL,           "all" })
> > +
> > +/*
> > + * Record the invalidation request received by the RISC-V architecture=
 code
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
> > + * implementation.
> > + *
> > + * The event records the invalidation request before it is dispatched.=
 It does
> > + * not describe the mechanism used to execute the request.
> > + *
> > + */
> > +TRACE_EVENT(riscv_tlb_flush_request,
> > +         TP_PROTO(unsigned long start, unsigned long size,
> > +                  unsigned long stride, unsigned long asid, bool has_m=
m,
> > +                  const struct cpumask *cmask,
> > +                  enum riscv_tlb_flush_scope scope),
> > +
> > +     TP_ARGS(start, size, stride, asid, has_mm, cmask, scope),
> > +
> > +     TP_STRUCT__entry(__field(unsigned long, start)
> > +             __field(unsigned long, size)
> > +             __field(unsigned long, stride)
> > +             __field(unsigned long, asid)
> > +             __field(bool, has_mm)
> > +             __field(unsigned int, target_mask_weight)
> > +             __cpumask(target_cpus)
> > +             __field(u32, scope)
> > +     ),
> > +
> > +     TP_fast_assign(__entry->start =3D start;
> > +             __entry->size =3D size;
> > +             __entry->stride =3D stride;
> > +             __entry->asid =3D asid;
> > +             __entry->has_mm =3D has_mm;
> > +             __assign_cpumask(target_cpus, cpumask_bits(cmask));
> > +             __entry->target_mask_weight =3D cpumask_weight((const str=
uct cpumask *)
> > +                                                  __get_cpumask(target=
_cpus));
> > +             __entry->scope =3D scope;
> > +     ),
> > +
> > +     TP_printk("start=3D%#lx size=3D%#lx stride=3D%#lx asid=3D%#lx has=
_mm=3D%d target_mask_weight=3D%u target_cpus=3D%s scope=3D%s",
> > +               __entry->start, __entry->size, __entry->stride,
> > +               __entry->asid, __entry->has_mm,
> > +               __entry->target_mask_weight, __get_cpumask(target_cpus)=
,
> > +               show_riscv_tlb_flush_scope(__entry->scope))
> > +);
> > +
> > +#ifdef CONFIG_PERF_EVENTS
> > +TRACE_EVENT_PERF_PERM(riscv_tlb_flush_request,
> > +                   perf_allow_tracepoint());
> > +#endif
> > +
> > +#endif /* _TRACE_RISCV_TLB_TRACE_H */
> > +
> > +#undef TRACE_INCLUDE_PATH
> > +#undef TRACE_INCLUDE_FILE
> > +
> > +#define TRACE_INCLUDE_PATH asm
> > +#define TRACE_INCLUDE_FILE tlb_trace
> > +
> > +/* This part must be outside protection. */
> > +#include <trace/define_trace.h>
> > diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> > index 962db300a166..9dcb07fb3ac0 100644
> > --- a/arch/riscv/mm/tlbflush.c
> > +++ b/arch/riscv/mm/tlbflush.c
> > @@ -9,6 +9,9 @@
> >  #include <asm/mmu_context.h>
> >  #include <asm/cpufeature.h>
> >
> > +#define CREATE_TRACE_POINTS
> > +#include <asm/tlb_trace.h>
> > +
> >  #define has_svinval()        riscv_has_extension_unlikely(RISCV_ISA_EX=
T_SVINVAL)
> >
> >  /*
> > @@ -63,6 +66,32 @@ void local_flush_tlb_kernel_range(unsigned long star=
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
> > +riscv_tlb_trace_flush_request(const struct cpumask *cmask, unsigned lo=
ng start,
> > +                           unsigned long size, unsigned long stride,
> > +                           unsigned long asid, bool has_mm)
> > +{
> > +     enum riscv_tlb_flush_scope scope;
> > +
> > +     if (!trace_riscv_tlb_flush_request_enabled())
> > +             return;
> > +
> > +     scope =3D riscv_tlb_get_flush_scope(size, stride, has_mm);
> > +     trace_call__riscv_tlb_flush_request(start, size, stride, asid, ha=
s_mm,
> > +                                         cmask, scope);
> > +}
> > +
> >  static void __ipi_flush_tlb_all(void *info)
> >  {
> >       local_flush_tlb_all();
> > @@ -70,12 +99,18 @@ static void __ipi_flush_tlb_all(void *info)
> >
> >  void flush_tlb_all(void)
> >  {
> > -     if (num_online_cpus() < 2)
> > +     riscv_tlb_trace_flush_request(cpu_online_mask, 0,
> > +                                   FLUSH_TLB_MAX_SIZE, 0,
> > +                                   FLUSH_TLB_NO_ASID, false);
> > +
> > +     if (num_online_cpus() < 2) {
> >               local_flush_tlb_all();
> > -     else if (riscv_use_sbi_for_rfence())
> > -             sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, F=
LUSH_TLB_NO_ASID);
> > -     else
> > +     } else if (riscv_use_sbi_for_rfence()) {
> > +             sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE,
> > +                                        FLUSH_TLB_NO_ASID);
> > +     } else {
> >               on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
> > +     }
> >  }
> >
> >  struct flush_tlb_range_data {
> > @@ -105,6 +140,8 @@ static void __flush_tlb_range(struct mm_struct *mm,
> >
> >       cpu =3D get_cpu();
> >
> > +     riscv_tlb_trace_flush_request(cmask, start, size, stride, asid, !=
!mm);
> > +
> >       /* Check if the TLB flush needs to be sent to other CPUs. */
> >       if (cpumask_any_but(cmask, cpu) >=3D nr_cpu_ids) {
> >               local_flush_tlb_range_asid(start, size, stride, asid);
> >
> > ---
> > base-commit: a5ae1bf65cee84bcc121d659e7e22a767853f5f5
> > change-id: 20260829-tlb_tracepoint-844105ab5092
> >
> > Best regards,
> > --
> > Roman 'Hedin' Storozhenko <romeusmeister@gmail.com>
> >



--=20
Kind regards,
Roman 'Hedin' Storozhenko
