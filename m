Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA05581226
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194399; cv=pass; b=rb379RvA01K6Lu3Vbbla9g/xxbkYw4n8ExdKbe5fWEVX9akIQZJOnYScJhfao3XDfwMOhz3S+21KjHvjpqvU0hUssNOW0vtrCWmFgeYcfwNI9vpxKCr6kvPaQYoFPRizF88gukCZOaKzOwHr6YZEeYDsXSGM1N16TQrs8n2XFVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194399; c=relaxed/simple;
	bh=gWu15iqRJxgX/RGyZaRqm+zMAOUbKzCJkVvlqDFqjUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mmc3w4LkM7CeJ2n1JKphl/vLCfD4nOcWBv/iiKC/UIpDIN73nnQANF2nFxXD9Pi1QtJjQEfRU5+h4hXzQRT4kQYHR2Fv5HL3sW9cvVw98cQTz6xMLG8c98ZnGp0Gb8URrVjThXe0TsjkAOhS9bF0zctyMNsKi3S/jecS0h9vzUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D6MyiWwo; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D6MyiWwo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8facae850so21615ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790194378; cv=none;
        d=google.com; s=arc-20260327;
        b=pajAvNrer1iNy73ynXC1k0SG/KxpjuQO7BsmvKC0A3CaZMs6Otll3fAGuQDVAymYmA
         //KJ/JX30p4diCEOxNsoB1FXGhMlbit2HnPoJ8h++8fk8wqACSYAIc2/nIGSwhePMhFR
         Qa14J9ikVIi6Bf2JN0AbZA7eCfGDVTgzoNFCnm/u6hzJxzao2TgiFHvfcRLxZlN2VaSD
         MGOTRJZR7JiEqZ0bP0+x69qkq+ruTZRA1Br85f090rt1fc3UgALyxtENAhXqVgR6mthV
         6twdA4vJoHg7vd+4HLWAYmuAw6rsdagCMZXwc+FhG9JSu2ihtt1mkegQQSrncYYM44S7
         tr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/Qf9KIEloyGlc9WNysMiio4j06l4Rvqcqlp89ks3rI=;
        fh=HSGZOgSyBGz9R1vdpzand/2ba8X/BEYjcwOH7nGSTLc=;
        b=kSkMxzc8M2KvonrF+0Hhvv8rTxAmoJXsiN/D0gokQgG3bEy8IRpYTpj4NB/ALzAhPW
         Sq6HUdEwMLj5zdrr6cEJqQYXKc34q9me6eB5tIr27AhtSeLdC+rOmNxBuQlD+6en05ZY
         +QLFnh48zsjIlS1ir5+ztyyeUMAPYpGXm06o1c9bmYAQcKN08oLV8smvnjHuJWbiRvcK
         C7kqOSb6uErYsQGBs+yecAOyYTYmj0l1KuRpOqU7VCWlOOCvVKxyK+ffkm16OUJrJ4dU
         LwqiqZwco8eaFDP9/PEEnaCLclGbnARLGA0GWOlefwegzomxNaF5Eu+01CNKJKHCwVng
         FdNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790194378; x=1790799178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/Qf9KIEloyGlc9WNysMiio4j06l4Rvqcqlp89ks3rI=;
        b=D6MyiWwoOGEfjRBqhn2Rboi1pPtO0FDcHa1jTAmukEVtb0+4HZ+y/XSkXrq4bSkMr8
         nBp9IXns4KjzDCQUmL085gMZ9DcioEbZbFfkO9kJwrUX5VtQEFrUt2ll6BxsR2qS2UUf
         7gjMvRAR0DvIhuyqIKa7PEj008pJENjsLZOKe9qDCsk5HMw6o1cubB4OWvQ2DRW2RGSL
         oLHzJbCcybToYZuDdKWDPrDRWnOlkV5dyIAZ9k9mFNdpkOqJv7gjrcKOSxR2WnD8g68r
         wSrXtxVKTTP5hkjc1UgSHLicQD1JT7cxHPbnAwUOtAHg30aoTJFvhGz2ycWEgJyO+fRG
         IKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194378; x=1790799178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/Qf9KIEloyGlc9WNysMiio4j06l4Rvqcqlp89ks3rI=;
        b=QGHq7CPsIFZKbFTuH5N0ryN+2cQfRGIfFwjMnxQgwKN/YnI19HZqPQLSCz2KZhdicM
         /Yj4P6i1aNrEonHSpLuSsYfpjAa4u2lACo0hckTikCwxyHhKIxsLQuYo/xpTxcswFRtW
         2I6/F8Qm2SYhcuMjKu6M7Th3Dim2gv7QkwE2J1OnstLfh+WvN4SeQZKDgMRwWQD6h7N6
         rex6YSUcv1DDylPHFJoTia9HtBH6g3EmUotZrX+pEjeDtXbFeuzcEahxK2fmTpVZ2EqG
         yTV681+JpXwla1Xc9h2mF1763fSCcPWskDkYTjaPRFNpAjR5MZ9tkcDcNS++IB9PcM4G
         TdBw==
X-Forwarded-Encrypted: i=1; AKwUvBxuas5Z5MV/ImAXkRJ9UZfMyEmHU4HAe+HLuQxMJ7Y5urUdhgWfMSz4Tbp8NCy60EAx5WX+39z8SL/rz/M=@vger.kernel.org
X-Gm-Message-State: AFuF++k472z79Uv6YdCA6X7sxLYKri+M/W/G9IPjIShugu5mk5MTr5UA
	6IdaCS+NCKz3ZRqB2UNII+0sKwwAGB4M9D/+5xkR9gpwjbHCxdtVXNVvs4czX62aqGor5J+t1xv
	NJkB3gah5c40sXCzSUMA6L13uGPu9aVPVcIA/q7hD
X-Gm-Gg: AYBFou1XGztnBI7Ep23sWl5WFEaIR00B5FTKPubbodDrE3Y4Md6R8CxgVhWaeQJR/G8
	zEtba5RcNIlU2Ha80VbWeGKOD+8sbyExKBGoeP6+ULmZafOkv4kWtd6BE/UR5vYu/NqSyxZVzBN
	ePn1WrlcBnK7jbOccpMRRpthlTeAPeVYMf4PhLMluDXzxEDn89UIxIApZKXh6SfdOEdD0+KoZdb
	c23GN6LijSwrN8wYLsW+cTZFPxzINTZ+oIi7CA47bqAaKlMTv83B/kk6n1dyylOx5QN1IaLkhCh
	Ba0diPEm99AjszN1erQ8lexqzMvgSOea6lsYCQ5ohWl9rcmwYUeWWJblHOXK7AjCszG02LmKxW4
	tjKyBhhHY
X-Received: by 2002:a17:903:90d:b0:2ca:4bb4:4bd with SMTP id
 d9443c01a7336-2df7bbd799fmr1410675ad.5.1790194377700; Wed, 23 Sep 2026
 13:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790025465.git.abhishekbapat@google.com>
 <06c3a9b52785e6968ea15709a55365b2342c7a15.1790025465.git.abhishekbapat@google.com>
 <e8f65e6d-440b-418d-b7ba-e05ca2b0d712@linux.dev>
In-Reply-To: <e8f65e6d-440b-418d-b7ba-e05ca2b0d712@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Wed, 23 Sep 2026 13:12:46 -0700
X-Gm-Features: AclHuK90u3QKMhLOPT-K2l4GMYlhS4sfA0uEIsFHML1VSEDfbP-0xqaYfivaip4
Message-ID: <CAL41Mv7P3xDAvTGtdSHEG3Cvu70W6uhZ9mThm-OD3PcGDDU17w@mail.gmail.com>
Subject: Re: [PATCH 1/4] alloc_tag: Add trace events for tracing allocations
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:55=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
> On 2026/9/22 05:26, Abhishek Bapat wrote:
> > The memory allocation profiling framework intercepts allocations across
> > the core subsystems, but currently lacks runtime tracing hooks for
> > standard observability tools to dynamically track the context (stack
> > traces and lifecycles of the individual memory chunks) of the
> > allocations made.
> >
> > Introduce three standard trace events to allow this tracking:
> >
> > 1. `alloc_tag_hit`: Fired at the exact call site. This allows userspace
> >    tools to trigger and capture a call stack.
> > 2. `alloc_tag_mem_alloced`: Fired in alloc_tag_add upon successful
> >    allocation. It records the allocated size, the tag, and the uniquely
> >    generated codetag_ref metadata pointer.
> > 3. `alloc_tag_mem_freed`: Fired in alloc_tag_sub right before memory is
> >    freed, yielding the same codetag_ref to allow tracing tools to find
> >    the corresponding allocation.
> >
> > Because the introduced trace events occur at different stages in the
> > call stack, userspace tracing tools must stitch them together to form a
> > complete picture of a buffer's lifetime. Here's an example of how
> > userspace correlates these three events:
> >
> > 1. On `alloc_tag_hit`: The tool captures the stack trace and caches it,
> >    keyed by the combination of the current thread's PID and the `tag`.
> > 2. On `alloc_tag_mem_alloced`: The tool extracts the PID and `tag` from
> >    the event and looks up the stack trace cached in step 1. It creates =
a
> >    new active allocation record, mapping the new provided `codetag_ref`
> >    to this cached stack trace and the newly returned allocation size.
> > 3. On `alloc_tag_mem_freed`: When the memory is freed, the event yields
> >    the same `codetag_ref`. The tool uses this reference to look up the
> >    original allocation record, correlates the free, and safely retires
> >    the tracking entry.
> >
> > Also, introduce `alloc_tag_trace_key` static key to minimize the
> > overhead when no tags are being traced (the usual case). Once tracing
> > for any tag is requested, the key is set, opening the path to check
> > whether tracing is enabled for the current tag.
> > Nore that the mechanism to enabl tag tracing is implemented in the next
> > patch, therefore for now, `alloc_tag_trace_key` stays always unset.
> >
>
> nit: s/Nore/Note/ s/enabl/enable
>
Ack.
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >  MAINTAINERS                      |   1 +
> >  include/linux/alloc_tag.h        |  57 ++++++++++++---
> >  include/trace/events/alloc_tag.h | 122 +++++++++++++++++++++++++++++++
> >  mm/alloc_tag.c                   |  28 +++++++
> >  4 files changed, 196 insertions(+), 12 deletions(-)
> >  create mode 100644 include/trace/events/alloc_tag.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 24420a8c06d0..29e1f7915cb9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17096,6 +17096,7 @@ S:    Maintained
> >  F:   Documentation/mm/allocation-profiling.rst
> >  F:   include/linux/alloc_tag.h
> >  F:   include/linux/pgalloc_tag.h
> > +F:   include/trace/events/alloc_tag.h
> >  F:   include/uapi/linux/alloc_tag.h
> >  F:   mm/alloc_tag.c
> >  F:   tools/testing/selftests/alloc_tag/
> > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> > index 7f2d80a59792..2994934cf44a 100644
> > --- a/include/linux/alloc_tag.h
> > +++ b/include/linux/alloc_tag.h
> > @@ -128,12 +128,33 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _share=
d_alloc_tag);
> >  DECLARE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=
,
> >                       mem_alloc_profiling_key);
> >
> > +DECLARE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> > +
> >  static inline bool mem_alloc_profiling_enabled(void)
> >  {
> >       return static_branch_maybe(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_=
DEFAULT,
> >                                  &mem_alloc_profiling_key);
> >  }
> >
> > +static inline bool alloc_tag_trace_enabled(const struct alloc_tag *tag=
)
> > +{
> > +     return static_branch_unlikely(&alloc_tag_trace_key);
> > +}
> > +
>
> The tag parameter is unused here. Let's remove it for now and add it back=
 when needed,
> to avoid the -Wno=E2=80=91unused=E2=80=91parameter warning.
> Some CI bots go through each patch one=E2=80=91by=E2=80=91one, so we can'=
t leave warnings in
> intermediate commits.
>
Ack.
> One other thought: what about adding a sysctl knob here?
> It would let users grab all alloc=E2=80=91tag tracked allocations within =
a time window?
>
You mean to enable the static key? With the following patches, it
would mean that the state of the static key would change by writing to
sysctl and through IOCTLs. I am not sure if letting the static key be
controlled by two mechanism is a good idea. I'd like to get Suren's
thoughts on this.

> Thanks
> Best Regards
> Hao
>
> > +void alloc_tag_trace_mem_alloc(union codetag_ref *ref, struct alloc_ta=
g *tag,
> > +                           size_t bytes);
> > +
> > +void alloc_tag_trace_mem_free(union codetag_ref *ref, struct alloc_tag=
 *tag,
> > +                          size_t bytes);
> > +
> > +void __alloc_tag_trace_hit(struct alloc_tag *tag);
> > +
> > +static inline void alloc_tag_trace_hit(struct alloc_tag *tag)
> > +{
> > +     if (alloc_tag_trace_enabled(tag))
> > +             __alloc_tag_trace_hit(tag);
> > +}
> > +
> >  bool mem_alloc_profiling_permanently_disabled(void);
> >
> >  static inline struct alloc_tag_counters alloc_tag_read(struct alloc_ta=
g *tag)
> > @@ -200,8 +221,13 @@ static inline bool alloc_tag_ref_set(union codetag=
_ref *ref, struct alloc_tag *t
> >
> >  static inline void alloc_tag_add(union codetag_ref *ref, struct alloc_=
tag *tag, size_t bytes)
> >  {
> > -     if (likely(alloc_tag_ref_set(ref, tag)))
> > +     if (likely(alloc_tag_ref_set(ref, tag))) {
> >               this_cpu_add(tag->counters->bytes, bytes);
> > +
> > +             if (alloc_tag_trace_enabled(tag))
> > +                     /* Trace successful allocs with their unique ref =
*/
> > +                     alloc_tag_trace_mem_alloc(ref, tag, bytes);
> > +     }
> >  }
> >
> >  static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)
> > @@ -222,6 +248,10 @@ static inline void alloc_tag_sub(union codetag_ref=
 *ref, size_t bytes)
> >       this_cpu_sub(tag->counters->bytes, bytes);
> >       this_cpu_dec(tag->counters->calls);
> >
> > +     if (alloc_tag_trace_enabled(tag))
> > +             /* Trace frees with their unique ref */
> > +             alloc_tag_trace_mem_free(ref, tag, bytes);
> > +
> >       ref->ct =3D NULL;
> >  }
> >
> > @@ -247,21 +277,24 @@ static inline void alloc_tag_add(union codetag_re=
f *ref, struct alloc_tag *tag,
> >  static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)=
 {}
> >  static inline void alloc_tag_set_inaccurate(struct alloc_tag *tag) {}
> >  static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag) { re=
turn false; }
> > +#define alloc_tag_trace_hit(_tag)    /* NOOP */
> >  #define alloc_tag_record(p)  do {} while (0)
> >
> >  #endif /* CONFIG_MEM_ALLOC_PROFILING */
> >
> > -#define alloc_hooks_tag(_tag, _do_alloc)                             \
> > -({                                                                   \
> > -     typeof(_do_alloc) _res;                                         \
> > -     if (mem_alloc_profiling_enabled()) {                            \
> > -             struct alloc_tag * __maybe_unused _old;                 \
> > -             _old =3D alloc_tag_save(_tag);                           =
 \
> > -             _res =3D _do_alloc;                                      =
 \
> > -             alloc_tag_restore(_tag, _old);                          \
> > -     } else                                                          \
> > -             _res =3D _do_alloc;                                      =
 \
> > -     _res;                                                           \
> > +#define alloc_hooks_tag(_tag, _do_alloc)                              =
       \
> > +({                                                                    =
       \
> > +     typeof(_do_alloc) _res;                                          =
       \
> > +     if (mem_alloc_profiling_enabled()) {                             =
       \
> > +             struct alloc_tag * __maybe_unused _old;                  =
       \
> > +             /* Fired here to cleanly capture the caller's stack trace=
 */    \
> > +             alloc_tag_trace_hit(_tag);                               =
       \
> > +             _old =3D alloc_tag_save(_tag);                           =
         \
> > +             _res =3D _do_alloc;                                      =
         \
> > +             alloc_tag_restore(_tag, _old);                           =
       \
> > +     } else                                                           =
       \
> > +             _res =3D _do_alloc;                                      =
         \
> > +     _res;                                                            =
       \
> >  })
> >
> >  #define alloc_hooks(_do_alloc)                                        =
       \
> > diff --git a/include/trace/events/alloc_tag.h b/include/trace/events/al=
loc_tag.h
> > new file mode 100644
> > index 000000000000..af2182501864
> > --- /dev/null
> > +++ b/include/trace/events/alloc_tag.h
> > @@ -0,0 +1,122 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM alloc_tag
> > +
> > +#if !defined(_TRACE_ALLOC_TAG_H) || defined(TRACE_HEADER_MULTI_READ)
> > +#define _TRACE_ALLOC_TAG_H
> > +
> > +#include <linux/tracepoint.h>
> > +
> > +/*
> > + * alloc_tag_hit is generated at the exact allocation call site and ca=
n be
> > + * used to capture a clean stack trace.
> > + *
> > + * To link this stack trace to the actual allocated memory chunk, tool=
s must
> > + * correlate this event with the resulting alloc_tag_mem_alloced event=
. Since
> > + * multiple threads can hit the same tag simultaneously, tools must ma=
tch BOTH
> > + * the `tag` field and the implicitly recorded PID provided by the cor=
e
> > + * tracing subsystem.
> > + */
> > +TRACE_EVENT(alloc_tag_hit,
> > +
> > +     TP_PROTO(struct alloc_tag *tag),
> > +
> > +     TP_ARGS(tag),
> > +
> > +     TP_STRUCT__entry(
> > +             __field(struct alloc_tag *, tag)
> > +             __string(modname, tag->ct.modname ? tag->ct.modname : "NO=
NE")
> > +             __string(filename, tag->ct.filename)
> > +             __string(function, tag->ct.function)
> > +             __field(unsigned int, lineno)
> > +     ),
> > +
> > +     TP_fast_assign(
> > +             __entry->tag =3D tag;
> > +             __assign_str(modname);
> > +             __assign_str(filename);
> > +             __assign_str(function);
> > +             __entry->lineno =3D tag->ct.lineno;
> > +     ),
> > +
> > +     TP_printk("tag %p, module: %s, filename: %s, function %s, lineno =
%u",
> > +             __entry->tag,
> > +             __get_str(modname),
> > +             __get_str(filename),
> > +             __get_str(function),
> > +             __entry->lineno
> > +     )
> > +);
> > +
> > +/*
> > + * alloc_tag_mem_alloced is generated after memory is successfully all=
ocated.
> > + * It captures the exact byte size.
> > + *
> > + * The `ref` pointer identifies the memory chunk for tracking its life=
cycle
> > + * (e.g., matching it with alloc_tag_mem_freed).
> > + *
> > + * Because the kernel isolates active allocations within the task stru=
ct
> > + * (current->alloc_tag), this even will always share the same implicit=
 PID as
> > + * its corresponding alloc_tag_hit event. Tools should use the combina=
tion
> > + * PID + `tag` to correlate them.
> > + */
> > +TRACE_EVENT(alloc_tag_mem_alloced,
> > +
> > +     TP_PROTO(union codetag_ref *ref, struct alloc_tag *tag, size_t by=
tes),
> > +
> > +     TP_ARGS(ref, tag, bytes),
> > +
> > +     TP_STRUCT__entry(
> > +             __field(union codetag_ref *, ref)
> > +             __field(struct alloc_tag *, tag)
> > +             __field(size_t, bytes)
> > +     ),
> > +
> > +     TP_fast_assign(
> > +             __entry->ref =3D ref;
> > +             __entry->tag =3D tag;
> > +             __entry->bytes =3D bytes;
> > +     ),
> > +
> > +     TP_printk("reference %p, tag %p, bytes %zu",
> > +             __entry->ref,
> > +             __entry->tag,
> > +             __entry->bytes
> > +     )
> > +);
> > +
> > +/*
> > + * alloc_tag_mem_freed event is generated immediately before memory is
> > + * freed. The `ref` pointer matches the one emitted during allocation,
> > + * allowing tools to match it to it's corresponding allocation and
> > + * call stack.
> > + */
> > +TRACE_EVENT(alloc_tag_mem_freed,
> > +
> > +     TP_PROTO(union codetag_ref *ref, struct alloc_tag *tag, size_t by=
tes),
> > +
> > +     TP_ARGS(ref, tag, bytes),
> > +
> > +     TP_STRUCT__entry(
> > +             __field(union codetag_ref *, ref)
> > +             __field(struct alloc_tag *, tag)
> > +             __field(size_t, bytes)
> > +     ),
> > +
> > +     TP_fast_assign(
> > +             __entry->ref =3D ref;
> > +             __entry->tag =3D tag;
> > +             __entry->bytes =3D bytes;
> > +     ),
> > +
> > +     TP_printk("reference %p, tag %p, bytes %zu",
> > +             __entry->ref,
> > +             __entry->tag,
> > +             __entry->bytes
> > +     )
> > +);
> > +
> > +#endif /* _TRACE_ALLOC_TAG_H */
> > +
> > +/* This part must be outside protection */
> > +#include <trace/define_trace.h>
> > diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > index f30ef8dd24c7..a5339767efd5 100644
> > --- a/mm/alloc_tag.c
> > +++ b/mm/alloc_tag.c
> > @@ -19,6 +19,9 @@
> >  #include <linux/kmemleak.h>
> >  #include <uapi/linux/alloc_tag.h>
> >
> > +#define CREATE_TRACE_POINTS
> > +#include <trace/events/alloc_tag.h>
> > +
> >  #include "internal.h"
> >  #include "page_alloc.h"
> >
> > @@ -55,6 +58,9 @@ EXPORT_SYMBOL(mem_alloc_profiling_key);
> >
> >  DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed);
> >
> > +DEFINE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> > +EXPORT_SYMBOL(alloc_tag_trace_key);
> > +
> >  struct alloc_tag_kernel_section kernel_tags =3D { NULL, 0 };
> >  unsigned long alloc_tag_ref_mask;
> >  int alloc_tag_ref_offs;
> > @@ -485,6 +491,28 @@ static const struct proc_ops allocinfo_proc_ops =
=3D {
> >  #endif
> >  };
> >
> > +void __alloc_tag_trace_hit(struct alloc_tag *tag)
> > +{
> > +     if (unlikely(!tag))
> > +             return;
> > +     trace_alloc_tag_hit(tag);
> > +}
> > +EXPORT_SYMBOL(__alloc_tag_trace_hit);
> > +
> > +void alloc_tag_trace_mem_alloc(union codetag_ref *ref, struct alloc_ta=
g *tag,
> > +                           size_t bytes)
> > +{
> > +     trace_alloc_tag_mem_alloced(ref, tag, bytes);
> > +}
> > +EXPORT_SYMBOL(alloc_tag_trace_mem_alloc);
> > +
> > +void alloc_tag_trace_mem_free(union codetag_ref *ref, struct alloc_tag=
 *tag,
> > +                          size_t bytes)
> > +{
> > +     trace_alloc_tag_mem_freed(ref, tag, bytes);
> > +}
> > +EXPORT_SYMBOL(alloc_tag_trace_mem_free);
> > +
> >  size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, b=
ool can_sleep)
> >  {
> >       struct codetag_iterator iter;
