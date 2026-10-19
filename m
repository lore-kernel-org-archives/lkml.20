Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792430671;
	b=DefasP3apGVqIy/87C5wRJ+0U8E1Pu0GPiTtKUEdWocxuPaPw5cUWKu1jMurfVQHGQ+r
	 8x3kaZCLp+tQ3+rSYiDOPvmecYi04+t548QgwDDj8dtksmSZBn/UqTyrqoQKsw5vLOTCS
	 Ura3lOEktJY+CC4ItT4ty0uULVvE/tS19EVIK5yY/USezs+BV9k2dRwpF5qkXqBdis6vS
	 KqIubV9eDevGpBXXkF8uF3RQSW3FTpjkchkUpbfixbdo9KdAnJco/vR6vJkSc/coiHqHf
	 2PCtFITwkoodj6PGOsmxvNcJM7X3JdEKSBlfi2WxNYtuktY9PEELfyYQWwnyOWsVqyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v94IzSlD8GtecAHwnUus+qXwzP2P3DMytwGnQox52CE=;
	b=K83O13Lyq2oySv1VwL3DkxB3ZQteEKh2KME+nBI+naxYBLWOdnQpquKvCo3a0XsojeGb
	 rLajwM3G0pTXuMT2SgdxgClUoZe6DKgn18dDS1lMfpP8Sn+C+wR4CduNKAC2IrPLMZQap
	 zulFzgf/BZrBdw0K0Y0p4MFX6Ob6hepRbfiJvo/gIS3tCzbU01b7iP9Fuht6ZUmYbtmKW
	 LDaFqFHtrvYpskFmIGv9KMb0WOjrZsx8nkrqTQ4Ki+m3OZAqrX40sIq34RrMGXMccB5gU
	 lWro2ZO6Gb5RXe620j1DNHQim5aBW9la9emWKFBpht8YXl+J9R4+4R3ycM6mO0IFz+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q7QUxSOG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C270A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q7QUxSOG
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67990a45e02so2100955d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792430670; cv=none;
        d=google.com; s=arc-20260327;
        b=C3jDJ612drOeSKkhOsaRPJ2085TqSn7buAwQiwktB1zh89N4LBKfzI0oI6+thuh4Ob
         WZ8NdJIg/NtsqEHYE4uhBCk6LTny+M0RLKiZo8HVZQLTh1RsvdnRknALF/X4/UlPqvZd
         28lf7CLpfhf6kApg05a0v3ucMuQtBJWZVPqIAVuWPbMk+qRpEkZfbjG1j6Z2Irq2ihZj
         DJQ5wQ1Y/DnNC3AOBIsAwaNrE9vgOBCrf7oIH4qhl1fBesMqm6EwU1Tt3+lSXreXv0TG
         oATxV+xAL30FdTPgqlKr9ImZNFmXxqPIfr2IUMme016A+RKkIp8FahsWcYllPSuiI6UA
         mAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v94IzSlD8GtecAHwnUus+qXwzP2P3DMytwGnQox52CE=;
        fh=9ZReeyupXSiTo/PguXFIcraIEgiKHodj6aFWQNwZy/g=;
        b=RZHuoQ81s4U2LcmpoTL7qetlrigIg9K9zruGLHKeZoD41OnFGR5YOjdnIByeZUyCJ7
         cozRc8qDTLCr8KPBTwGTHgRGGl0mJ1bt7U4pybZutPJCTxenccucSldv2W3CHG6tTC/E
         FhPX9zxHjo6x8aLPAkTkRkV26BbET110YG4Q/8KDY6z/glXlLKK1jBoVjxyLp7pFT+4L
         KpNPkzXIHfmmxQmT8IJ4n0G21b4bluDQIRtQdJmcWBgfeMOS6FAUTjiPalMyFDmtyXXG
         vrk2PahCjRmBnaBuKwvULOUe+9AxVell21aE/j43J7VwXGcn7HJfno3nvbwoY58Arsri
         h/9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792430670; x=1793035470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v94IzSlD8GtecAHwnUus+qXwzP2P3DMytwGnQox52CE=;
        b=q7QUxSOGk3KIF+Y6kBslawVtumMNsC4pSF5LlDTN+V7wpDO7X1mj5JfqcXPG0hsUA7
         htPG3egyEVa8LufE1Gx8YNN0faCBN72X9mdCdE7d+tJQOBk48D8w4KZEcFRZrPc4e2Oi
         FBah7xNi52jzD59CbdW8BcG8MxNAj/shn8rNs9NIYnQqUomyFTGqIwuKG8mit6lw1xru
         gm1m8+Z3YmXBwpS3iaFE8aWCb9Ssq9M3JiaGMlxJCzfHGyQpgwLTrTyfL6JV886s8W2Z
         au0+W21aMCqWW9VL+TeoTFPa4XuG3tOMtIUlp0MppSJtTCRnBYw7ad+tJvbcn2D4/4vw
         QnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430670; x=1793035470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v94IzSlD8GtecAHwnUus+qXwzP2P3DMytwGnQox52CE=;
        b=mePrIi1Xi5Hnmzjqew0WT5ndeUmSRDrixm/wEZnyfVlg+W4yNxr2srSO+v3vpj9Iyu
         tg48NuMZtLlE8mV/iGWa9UQoIpmL95NuYKSx+edSO5QQlqUn1FhfkBZcBvsXLANFUdgG
         pR6Qc+blqP0gpaKDL9scyFNbfLGV4rmJWgv+kU1IoDwurh709isHTAAMUSF7UGtOfW6l
         /RCrKW4j0N2YXUzc6AKOKaBtYNp65TC82exmgpyIkDhtU77m8bDA29cTNFYwazseFC1G
         5lWyU4JAQ9GHbPdUBDxHMHVc/1ElTjmD/yelrgtGEzJ9a0sC42diosgoA010KkcKKQWa
         lmcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxNBBz4S0ONT62k20ug9ITBSr3mptf/yJuuNWVNtXDXT60Wf5QGw72qpvMV9TB0uo4Chl/EKK+nogi/o0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLASK/oAl7CvV6+0cVCUUQQhNVXUIy19rpqO/w4d2L6RCV09MwX
	kmtZXLLWjfFHqSZR9RJAnITEoO+aLW/Hic8yL7WwsEWl2khRdc/9fFhaHK9HR/ARFnFQlnKNpM4
	QRVqxpSlFQN+igimvWPt9jFTwdGDE5Ak=
X-Gm-Gg: AYBFou1e0vyFDHAH6MCDV7E9Rc2zVzjtxmY9dsf5thCke1l9RTW4lp7JgHRJ6MRJbOf
	IHddm58lhuoiKXRerl+o6dbOjilWS92Di2N2ObHnpgSA4OTpQ8bO9jyUleSFWG6GQdKww1o1epA
	GmSwYsetMvfRtM9kh+mgh3CNE5sIvAUKgeJeydkRjycF5ECcT4aXH09DTuS2XaFslOolYkg6a15
	OxQwd2Pxm36y5MGXdKbg3wRQPxV1qKBWv7XOcZr1Mch8BoXplP/N/fedKJbqqEP6uAEPaTB6c70
	9ZXcOgklcS5VW2k0haAwbb6hCNUftccX3L2YTFjlKXPerXilRsxlpXH81SHNddMloQ==
X-Received: by 2002:a05:690e:d58:b0:676:863f:8ed2 with SMTP id
 956f58d0204a3-679ca83508fmr2653476d50.58.1792430669722; Mon, 19 Oct 2026
 10:24:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-tlb_tracepoint-v6-1-14476427870f@gmail.com> <20261019100029.32a09f71@gandalf.local.home>
In-Reply-To: <20261019100029.32a09f71@gandalf.local.home>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Mon, 19 Oct 2026 19:24:17 +0200
X-Gm-Features: AclHuK_oGHvZP8ZsUmOuB3mE6AE11B0H-Atozg5trQ0bWx9omrbaU2HKmEywW-o
Message-ID: <CALsPMBOKENath9-6pUoPrrSRbuudg0V9tc76bLcxsnkQJJkvgQ@mail.gmail.com>
Subject: Re: [PATCH v6] riscv: mm: Trace TLB flush requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 4:00=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Sun, 18 Oct 2026 13:14:59 +0200
> Roman 'Hedin' Storozhenko <romeusmeister@gmail.com> wrote:
>
> >  arch/riscv/include/asm/riscv_tlb.h | 103 +++++++++++++++++++++++++++++=
++++++++
> >  arch/riscv/mm/tlbflush.c           |  45 ++++++++++++++--
> >  2 files changed, 144 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/riscv_tlb.h b/arch/riscv/include/as=
m/riscv_tlb.h
> > new file mode 100644
> > index 000000000000..4d5f48112941
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/riscv_tlb.h
>
> Normal convention would be to have "trace" in the name. riscv_trace.h ?
>
> As riscv_tlb.h looks to be specific about tlb and not tracing.
>
> -- Steve
>

Hi Steve,

Thanks for the suggestion.

I've renamed the header to arch/riscv/include/asm/tlb_trace.h
in v7. I prefer this over riscv_trace.h because the latter
sounds too generic for a header dedicated to TLB tracing.

Did you have a broader use in mind, such as including other
RISC-V tracepoints in this header?

If you still prefer riscv_trace.h, I'm happy to reconsider.

The updated patch is available here:

https://lore.kernel.org/linux-riscv/20261019-tlb_tracepoint-v7-1-4cc3e99d38=
7a@gmail.com/

>
> > @@ -0,0 +1,103 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM riscv_tlb
> > +
> > +#if !defined(_TRACE_RISCV_TLB_H) || defined(TRACE_HEADER_MULTI_READ)
> > +#define _TRACE_RISCV_TLB_H
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



--=20
Kind regards,
Roman 'Hedin' Storozhenko
