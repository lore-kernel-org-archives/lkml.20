Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1928364925
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790735006; cv=pass; b=u/7rbER2zCgHcVVtwBa0xcYFVp3neVdj3MiWzib4cD+OyBLrn7mLEZq91OeGgEqUZUl1cnNrISvUI1jTjR1BkhqOva1fS/RB5wgT3Lljudfp8HPRVJXwhRhCsQZROm567535C9pZtEcv6rxSSyCInxUkTtiG9uWFH14vJ5QKWy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790735006; c=relaxed/simple;
	bh=hhItzGKzo6m0aRj0thBrCOSGPss5rCl3yeh2VKTGzCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzzzbE5oEPjfp9I3toNNrykwt1yJaJFch7jZ1rsTmeZkcnNstFbekDwphZUaDSQUb3XlM7CLk9Sk6GNWr20beLPCtDs3QrmK15u4aPqo3NcGWwAg/UKajlp9Iz/pdABJE9YUejuzRnL7D2hkEiAKLrpvNz2BHeIDxqpJhf5hhiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UAlDtr2h; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UAlDtr2h"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53328262efbso134881cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790735003; cv=none;
        d=google.com; s=arc-20260327;
        b=g2b6Q6VPahqzbZL8AHod8iSwCCqEVEw+FScfKR4PM+TFH5CYdBF9vlF4E7DmlMXA+V
         g4dNMdJeRVy0vxsr4G191FRGBZRYWhxhyV0bl1J5WZOq/fARiWkaAZ1zo/pFFzsHUEvh
         d6o5toBAT5yHUNbVHA0w0q5MM9a0OBWH6ZMZiV1abHns19aKavn7hTEtijRDZqWOcuxp
         U3ZShLw9teHB2It7vZhgC320+YZENq9ajiGB2l9Zs4/KZ8kk4p6l49Lv1yaKbLaxuDb5
         UC3twr+vFHC+xm1mCs96KPVVi1iyLGl02Kp3a0YPODrQLHnXXgkKfeBheMEROO6RMPyy
         daQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vLlhqAX656UZF2DVlvNl7Xv9KAC8IQur7PXVrqRRyc=;
        fh=Hd269L6hb62aqRhHrq23mPkZjSd3JScgvX7X+foEJqY=;
        b=mylf2NkrHCvtNEfd7akbf0ndaDR2f1Me4ojH1+FZf0hAvZVujCQO4sQPKJiEQxkao7
         WWKhBWnogUwp/zxBAtxHhsH/DppBU9Nq57eevnq+fFdvHrn0NZEWxM0EUGPNKhpFoVYY
         bV1bQtNYXyIq3ElwiDT5GOrJGmPU5twVHgekFLsdZ4Sc/zpGOOImzqVybdq5WIg13C4Q
         42AAuck8xixW+ZGDI6ZcibSRMsAWspfFNCH08UZU+sXyriciIXze2rQ9vrj23l/wSDpM
         N8Kgy9i43knEppFfuvSQp5v0NRbRqOmnIQck7/A5lXNza2GSIJPHSzDiHfi9z4REEq0r
         njQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790735003; x=1791339803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+vLlhqAX656UZF2DVlvNl7Xv9KAC8IQur7PXVrqRRyc=;
        b=UAlDtr2hAVzBy+8z8srHu0PRcQCz4vnRwlR0/rgMTzo1oGUsOO0owdL75xwqZGw5/K
         SQ2EvbO+5ooTkW8dhFRFvNvKEJqGREFYoHjxRJdki6tZsezMTeEHMtT+VSI9vaqD6klh
         51ZuCRSMcJI56SV+lO75cFQTX+Cn1alNcDRv+BDARaWcbuu2qRwdwN7POdxUoOacnwHd
         +Y7Hbui5xdzO7lKWaODkk0sHlFG6TAVNMIZtVO9oa5hqxt2hnjqlNIMmtFHmslljB4AW
         vhxwBbidpnq53GbbhUAmPlMBNGU+1kUXP32UBkZTjd9GKNbB8uWbVCjgXKCxTV6/bxwa
         VXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790735003; x=1791339803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vLlhqAX656UZF2DVlvNl7Xv9KAC8IQur7PXVrqRRyc=;
        b=yJ/KsWp1L6y4noOv/wkrHGyd/7d01NaR0G9abwc50b/an1HYhaWe+Y/jEaZz1TxRan
         W3zFhqjcClMT9pU0aHpDgpXwKTh3kZgEJBt4Ovzlmq5upV8ZclVQ5lOYk0VIJcxaNaHH
         JpyK/oyfMQg7h09qOju9qXzWfJ5XhVkBuFpXHeq7WpXx6mBWsmp+zOB9k4OD7NyT7wHD
         uKHTTDfN/A17aJTWlAtoFu3cxEIwahdIJ0yp2Ncnq8WjencgEp1rAdHTK2ztC01vIW9V
         Fvvz3vEeMxzfk9YWgyOyHKtsqR2WX/S+lpCiw4/HusViSGgoXiXiRUpFdtCU/zptiyx4
         LlMw==
X-Forwarded-Encrypted: i=1; AKwUvBzt90pACwshrb7OvzH0R5hvT7gdSlRSTTjyoHzt0E2FKIC6zGta/jZCc7E4KGglQMOYJCjeDlkqjsZakTM=@vger.kernel.org
X-Gm-Message-State: AFuF++m8QUg93GlKnuVMmzW06S+bBA+vVHSmuAONJW2j32WCSTu7Gp7y
	QXFajPfM0teWdOu2R2Hkp6I0Gd//u7V+L12Rv+bNKxAvmEzLPbIoPIRidvSczz3SdlthqpVf4LG
	0tdvaGpaq0AWr76tIiQwoEEbwCE0BAozg9M3ugTtq
X-Gm-Gg: AYBFou1O+1o4sLKnAU2wxZQr8ZxQ8+zjLkF7ouQGJ7KAs6FoRoPowyApcnmZeVmDkoX
	z20xZ2L9Ig6lL9rcdGkdj0fYlHkqBN95tujozM3Kr4dYZqa6EARfntXziCjPMys2kpp3e8as6DL
	yTo9hfaylbK13LE08lELKhrFhGXhD12ELKVL9zb00jRFNM4gRRdJ1/m+VvDxL/o5DVTrO+J/PCR
	L8CqJuOItGnKQ21L8hPsa0OZdubKettxjOudybRQ/S5iHjhhV6JHydpJULF+O4x1/Kw9LT10zvG
	f1bGL5rbTHZyAuNwdQh0j9peORIfFvTHL8fVFDc3+mMTk+60Tub44Us6ByfzUpNQYvL2uudHzFv
	7jE2rger4atcj/b+tNQ==
X-Received: by 2002:a05:622a:4c08:b0:532:a17b:9581 with SMTP id
 d75a77b69052e-53373ea61eamr1028981cf.3.1790735001796; Tue, 29 Sep 2026
 19:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790025465.git.abhishekbapat@google.com>
 <06c3a9b52785e6968ea15709a55365b2342c7a15.1790025465.git.abhishekbapat@google.com>
 <cb229e38-3e52-4309-9594-0d3947c1a81c@linux.dev> <CAJuCfpGZf+HDj8B2vV2WB68P2JMyqctF5CPvV0R6x=WU7+nwvQ@mail.gmail.com>
 <cf6ff2bf-1b3c-4575-b981-fc3c65625d5d@linux.dev> <CAL41Mv4nqEWkFZajL-Z3ny_gx-9zyBY041AXvYL4K+FUUQ5gzA@mail.gmail.com>
In-Reply-To: <CAL41Mv4nqEWkFZajL-Z3ny_gx-9zyBY041AXvYL4K+FUUQ5gzA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 30 Sep 2026 02:23:09 +0000
X-Gm-Features: AclHuK959LWtb1m_P2LehkKgue8YG78_Wups34zqyQysIiDzelee7Jt6Cpd8fgY
Message-ID: <CAJuCfpGEBZce3_QzA_Zbqs-YtT5zG2tQdkrufo-qDyRc4fuG9w@mail.gmail.com>
Subject: Re: [PATCH 1/4] alloc_tag: Add trace events for tracing allocations
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 5:32=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> On Sun, Sep 27, 2026 at 7:10=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Suren
> >
> > On 2026/9/25 14:14, Suren Baghdasaryan wrote:
> > > On Thu, Sep 24, 2026 at 12:21=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wr=
ote:
> > >>
> > >> Hi Abhishek
> > >>
> > >> Sorry, I merged and tested your patches today and found a few detail=
s,
> > >> so I've started a separate mail thread for this review.
> > >>
> > >> On 2026/9/22 05:26, Abhishek Bapat wrote:
> > >>> The memory allocation profiling framework intercepts allocations ac=
ross
> > >>> the core subsystems, but currently lacks runtime tracing hooks for
> > >>> standard observability tools to dynamically track the context (stac=
k
> > >>> traces and lifecycles of the individual memory chunks) of the
> > >>> allocations made.
> > >>>
> > >>> Introduce three standard trace events to allow this tracking:
> > >>>
> > >>> 1. `alloc_tag_hit`: Fired at the exact call site. This allows users=
pace
> > >>>    tools to trigger and capture a call stack.
> > >>> 2. `alloc_tag_mem_alloced`: Fired in alloc_tag_add upon successful
> > >>>    allocation. It records the allocated size, the tag, and the uniq=
uely
> > >>>    generated codetag_ref metadata pointer.
> > >>> 3. `alloc_tag_mem_freed`: Fired in alloc_tag_sub right before memor=
y is
> > >>>    freed, yielding the same codetag_ref to allow tracing tools to f=
ind
> > >>>    the corresponding allocation.
> > >>>
> > >>> Because the introduced trace events occur at different stages in th=
e
> > >>> call stack, userspace tracing tools must stitch them together to fo=
rm a
> > >>> complete picture of a buffer's lifetime. Here's an example of how
> > >>> userspace correlates these three events:
> > >>>
> > >>> 1. On `alloc_tag_hit`: The tool captures the stack trace and caches=
 it,
> > >>>    keyed by the combination of the current thread's PID and the `ta=
g`.
> > >>> 2. On `alloc_tag_mem_alloced`: The tool extracts the PID and `tag` =
from
> > >>>    the event and looks up the stack trace cached in step 1. It crea=
tes a
> > >>>    new active allocation record, mapping the new provided `codetag_=
ref`
> > >>>    to this cached stack trace and the newly returned allocation siz=
e.
> > >>> 3. On `alloc_tag_mem_freed`: When the memory is freed, the event yi=
elds
> > >>>    the same `codetag_ref`. The tool uses this reference to look up =
the
> > >>>    original allocation record, correlates the free, and safely reti=
res
> > >>>    the tracking entry.
> > >>>
> > >>> Also, introduce `alloc_tag_trace_key` static key to minimize the
> > >>> overhead when no tags are being traced (the usual case). Once traci=
ng
> > >>> for any tag is requested, the key is set, opening the path to check
> > >>> whether tracing is enabled for the current tag.
> > >>> Nore that the mechanism to enabl tag tracing is implemented in the =
next
> > >>> patch, therefore for now, `alloc_tag_trace_key` stays always unset.
> > >>>
> > >>> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > >>> ---
> > >>>  MAINTAINERS                      |   1 +
> > >>>  include/linux/alloc_tag.h        |  57 ++++++++++++---
> > >>>  include/trace/events/alloc_tag.h | 122 +++++++++++++++++++++++++++=
++++
> > >>>  mm/alloc_tag.c                   |  28 +++++++
> > >>>  4 files changed, 196 insertions(+), 12 deletions(-)
> > >>>  create mode 100644 include/trace/events/alloc_tag.h
> > >>>
> > >>> diff --git a/MAINTAINERS b/MAINTAINERS
> > >>> index 24420a8c06d0..29e1f7915cb9 100644
> > >>> --- a/MAINTAINERS
> > >>> +++ b/MAINTAINERS
> > >>> @@ -17096,6 +17096,7 @@ S:    Maintained
> > >>>  F:   Documentation/mm/allocation-profiling.rst
> > >>>  F:   include/linux/alloc_tag.h
> > >>>  F:   include/linux/pgalloc_tag.h
> > >>> +F:   include/trace/events/alloc_tag.h
> > >>>  F:   include/uapi/linux/alloc_tag.h
> > >>>  F:   mm/alloc_tag.c
> > >>>  F:   tools/testing/selftests/alloc_tag/
> > >>> diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> > >>> index 7f2d80a59792..2994934cf44a 100644
> > >>> --- a/include/linux/alloc_tag.h
> > >>> +++ b/include/linux/alloc_tag.h
> > >>> @@ -128,12 +128,33 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _s=
hared_alloc_tag);
> > >>>  DECLARE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEF=
AULT,
> > >>>                       mem_alloc_profiling_key);
> > >>>
> > >>> +DECLARE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> > >>> +
> > >>>  static inline bool mem_alloc_profiling_enabled(void)
> > >>>  {
> > >>>       return static_branch_maybe(CONFIG_MEM_ALLOC_PROFILING_ENABLED=
_BY_DEFAULT,
> > >>>                                  &mem_alloc_profiling_key);
> > >>>  }
> > >>>
> > >>> +static inline bool alloc_tag_trace_enabled(const struct alloc_tag =
*tag)
> > >>> +{
> > >>> +     return static_branch_unlikely(&alloc_tag_trace_key);
> > >>> +}
> > >>> +
> > >>> +void alloc_tag_trace_mem_alloc(union codetag_ref *ref, struct allo=
c_tag *tag,
> > >>> +                           size_t bytes);
> > >>> +
> > >>> +void alloc_tag_trace_mem_free(union codetag_ref *ref, struct alloc=
_tag *tag,
> > >>> +                          size_t bytes);
> > >>> +
> > >>> +void __alloc_tag_trace_hit(struct alloc_tag *tag);
> > >>> +
> > >>> +static inline void alloc_tag_trace_hit(struct alloc_tag *tag)
> > >>> +{
> > >>> +     if (alloc_tag_trace_enabled(tag))
> > >>> +             __alloc_tag_trace_hit(tag);
> > >>> +}
> > >>> +
> > >>>  bool mem_alloc_profiling_permanently_disabled(void);
> > >>>
> > >>>  static inline struct alloc_tag_counters alloc_tag_read(struct allo=
c_tag *tag)
> > >>> @@ -200,8 +221,13 @@ static inline bool alloc_tag_ref_set(union cod=
etag_ref *ref, struct alloc_tag *t
> > >>>
> > >>>  static inline void alloc_tag_add(union codetag_ref *ref, struct al=
loc_tag *tag, size_t bytes)
> > >>>  {
> > >>> -     if (likely(alloc_tag_ref_set(ref, tag)))
> > >>> +     if (likely(alloc_tag_ref_set(ref, tag))) {
> > >>>               this_cpu_add(tag->counters->bytes, bytes);
> > >>> +
> > >>> +             if (alloc_tag_trace_enabled(tag))
> > >>> +                     /* Trace successful allocs with their unique =
ref */
> > >>> +                     alloc_tag_trace_mem_alloc(ref, tag, bytes);
> > >>> +     }
> > >>>  }
> > >>>
> > >>>  static inline void alloc_tag_sub(union codetag_ref *ref, size_t by=
tes)
> > >>> @@ -222,6 +248,10 @@ static inline void alloc_tag_sub(union codetag=
_ref *ref, size_t bytes)
> > >>>       this_cpu_sub(tag->counters->bytes, bytes);
> > >>>       this_cpu_dec(tag->counters->calls);
> > >>>
> > >>> +     if (alloc_tag_trace_enabled(tag))
> > >>> +             /* Trace frees with their unique ref */
> > >>> +             alloc_tag_trace_mem_free(ref, tag, bytes);
> > >>> +
> > >>>       ref->ct =3D NULL;
> > >>>  }
> > >>>
> > >>> @@ -247,21 +277,24 @@ static inline void alloc_tag_add(union codeta=
g_ref *ref, struct alloc_tag *tag,
> > >>>  static inline void alloc_tag_sub(union codetag_ref *ref, size_t by=
tes) {}
> > >>>  static inline void alloc_tag_set_inaccurate(struct alloc_tag *tag)=
 {}
> > >>>  static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag) =
{ return false; }
> > >>> +#define alloc_tag_trace_hit(_tag)    /* NOOP */
> > >>
> > >> I'd prefer we use `do {} while (0)` here, following the same pattern
> > >> as alloc_tag_record.
> > >>
> > >>>  #define alloc_tag_record(p)  do {} while (0)
> > >>>
> > >>>  #endif /* CONFIG_MEM_ALLOC_PROFILING */
> > >>>
> > >>> -#define alloc_hooks_tag(_tag, _do_alloc)                          =
   \
> > >>> -({                                                                =
   \
> > >>> -     typeof(_do_alloc) _res;                                      =
   \
> > >>> -     if (mem_alloc_profiling_enabled()) {                         =
   \
> > >>> -             struct alloc_tag * __maybe_unused _old;              =
   \
> > >>> -             _old =3D alloc_tag_save(_tag);                       =
     \
> > >>> -             _res =3D _do_alloc;                                  =
     \
> > >>> -             alloc_tag_restore(_tag, _old);                       =
   \
> > >>> -     } else                                                       =
   \
> > >>> -             _res =3D _do_alloc;                                  =
     \
> > >>> -     _res;                                                        =
   \
> > >>> +#define alloc_hooks_tag(_tag, _do_alloc)                          =
           \
> > >>> +({                                                                =
           \
> > >>> +     typeof(_do_alloc) _res;                                      =
           \
> > >>> +     if (mem_alloc_profiling_enabled()) {                         =
           \
> > >>> +             struct alloc_tag * __maybe_unused _old;              =
           \
> > >>> +             /* Fired here to cleanly capture the caller's stack t=
race */    \
> > >>> +             alloc_tag_trace_hit(_tag);                           =
           \
> > >>> +             _old =3D alloc_tag_save(_tag);                       =
             \
> > >>> +             _res =3D _do_alloc;                                  =
             \
> > >>> +             alloc_tag_restore(_tag, _old);                       =
           \
> > >>> +     } else                                                       =
           \
> > >>> +             _res =3D _do_alloc;                                  =
             \
> > >>> +     _res;                                                        =
           \
> > >>>  })
> > >>>
> > >>>  #define alloc_hooks(_do_alloc)                                    =
           \
> > >>> diff --git a/include/trace/events/alloc_tag.h b/include/trace/event=
s/alloc_tag.h
> > >>> new file mode 100644
> > >>> index 000000000000..af2182501864
> > >>> --- /dev/null
> > >>> +++ b/include/trace/events/alloc_tag.h
> > >>> @@ -0,0 +1,122 @@
> > >>> +/* SPDX-License-Identifier: GPL-2.0 */
> > >>> +#undef TRACE_SYSTEM
> > >>> +#define TRACE_SYSTEM alloc_tag
> > >>> +
> > >>> +#if !defined(_TRACE_ALLOC_TAG_H) || defined(TRACE_HEADER_MULTI_REA=
D)
> > >>> +#define _TRACE_ALLOC_TAG_H
> > >>> +
> > >>> +#include <linux/tracepoint.h>
> > >>> +
> > >>> +/*
> > >>> + * alloc_tag_hit is generated at the exact allocation call site an=
d can be
> > >>> + * used to capture a clean stack trace.
> > >>> + *
> > >>> + * To link this stack trace to the actual allocated memory chunk, =
tools must
> > >>> + * correlate this event with the resulting alloc_tag_mem_alloced e=
vent. Since
> > >>> + * multiple threads can hit the same tag simultaneously, tools mus=
t match BOTH
> > >>> + * the `tag` field and the implicitly recorded PID provided by the=
 core
> > >>> + * tracing subsystem.
> > >>> + */
> > >>> +TRACE_EVENT(alloc_tag_hit,
> > >>> +
> > >>> +     TP_PROTO(struct alloc_tag *tag),
> > >>> +
> > >>> +     TP_ARGS(tag),
> > >>> +
> > >>> +     TP_STRUCT__entry(
> > >>> +             __field(struct alloc_tag *, tag)
> > >>> +             __string(modname, tag->ct.modname ? tag->ct.modname :=
 "NONE")
> > >>> +             __string(filename, tag->ct.filename)
> > >>> +             __string(function, tag->ct.function)
> > >>> +             __field(unsigned int, lineno)
> > >>> +     ),
> > >>> +
> > >>> +     TP_fast_assign(
> > >>> +             __entry->tag =3D tag;
> > >>> +             __assign_str(modname);
> > >>> +             __assign_str(filename);
> > >>> +             __assign_str(function);
> > >>> +             __entry->lineno =3D tag->ct.lineno;
> > >>> +     ),
> > >>> +
> > >>> +     TP_printk("tag %p, module: %s, filename: %s, function %s, lin=
eno %u",
> > >>> +             __entry->tag,
> > >>> +             __get_str(modname),
> > >>> +             __get_str(filename),
> > >>> +             __get_str(function),
> > >>> +             __entry->lineno
> > >>> +     )
> > >>> +);
> > >>>
> > >>
> > >> When I trace an interface provided by a kernel build-in such as shme=
m,
> > >> this is what I see in the trace:
> > >>
> > >> trig-6838    [004] .....  1309.321906: alloc_tag_hit: tag 0000000078=
74a2c9, module: NONE, filename: mm/shmem.c, function shmem_alloc_folio, lin=
eno 2138
> > >>
> > >> The module field shows NONE, which looks a bit odd.
> > >>
> > >>> +/*
> > >>> + * alloc_tag_mem_alloced is generated after memory is successfully=
 allocated.
> > >>> + * It captures the exact byte size.
> > >>> + *
> > >>> + * The `ref` pointer identifies the memory chunk for tracking its =
lifecycle
> > >>> + * (e.g., matching it with alloc_tag_mem_freed).
> > >>> + *
> > >>> + * Because the kernel isolates active allocations within the task =
struct
> > >>> + * (current->alloc_tag), this even will always share the same impl=
icit PID as
> > >>> + * its corresponding alloc_tag_hit event. Tools should use the com=
bination
> > >>> + * PID + `tag` to correlate them.
> > >>> + */
> > >>> +TRACE_EVENT(alloc_tag_mem_alloced,
> > >>> +
> > >>> +     TP_PROTO(union codetag_ref *ref, struct alloc_tag *tag, size_=
t bytes),
> > >>> +
> > >>> +     TP_ARGS(ref, tag, bytes),
> > >>> +
> > >>> +     TP_STRUCT__entry(
> > >>> +             __field(union codetag_ref *, ref)
> > >>> +             __field(struct alloc_tag *, tag)
> > >>> +             __field(size_t, bytes)
> > >>> +     ),
> > >>> +
> > >>> +     TP_fast_assign(
> > >>> +             __entry->ref =3D ref;
> > >>> +             __entry->tag =3D tag;
> > >>> +             __entry->bytes =3D bytes;
> > >>> +     ),
> > >>> +
> > >>> +     TP_printk("reference %p, tag %p, bytes %zu",
> > >>> +             __entry->ref,
> > >>> +             __entry->tag,
> > >>> +             __entry->bytes
> > >>> +     )
> > >>> +);
> > >>> +
> > >>> +/*
> > >>> + * alloc_tag_mem_freed event is generated immediately before memor=
y is
> > >>> + * freed. The `ref` pointer matches the one emitted during allocat=
ion,
> > >>> + * allowing tools to match it to it's corresponding allocation and
> > >>> + * call stack.
> > >>> + */
> > >>
> > >> But the thread for allocation and free may not be the same.
> > >> For example, memory allocated in thread A could be freed by kswapd.
> > >> In this case, would the ref fail to match and falsely report a memor=
y leak?
> > >
> > > No, ref is unique within the system, so even if alloc and free happen
> > > in different threads it still can be used to match them. The
> > > thread+tag is used only when matching alloc_tag_hit with
> > > alloc_tag_mem_alloced because at the time of alloc_tag_hit we don't
> > > yet have the ref.
> > >
> >
> > "The ref is unique within the system" is true of the obj_ext/page_ext s=
lot,
> > but for page allocations the event does not carry the slot's address,
> > it carries the address of a stack temporary.
> >
> > /* Should be called only if mem_alloc_profiling_enabled() */
> > static noinline
> > void __pgalloc_tag_add(struct page *page, struct task_struct *task,
> >                        unsigned int nr, unsigned int alloc_flags)
> > {
> >         union pgtag_ref_handle handle;
> >         union codetag_ref ref;  <- stack temporary
> >
> >         if (likely(get_page_tag_ref(page, &ref, &handle))) {
> >                 alloc_tag_add(&ref, task->alloc_tag, PAGE_SIZE * nr);
> >                 update_page_tag_ref(handle, &ref);
> >                 put_page_tag_ref(handle);
> >         } else {
> >                 ......
> >         }
> > }
> >
> > /* Should be called only if mem_alloc_profiling_enabled() */
> > static noinline
> > void __pgalloc_tag_sub(struct page *page, unsigned int nr)
> > {
> >         union pgtag_ref_handle handle;
> >         union codetag_ref ref; <- stack temporary
> >
> >         if (get_page_tag_ref(page, &ref, &handle)) {
> >                 alloc_tag_sub(&ref, PAGE_SIZE * nr);
> >                 update_page_tag_ref(handle, &ref);
> >                 put_page_tag_ref(handle);
> >         }
> > }
> >
> > Or am I missing / confusing something here?
> >
>
> This is a legitimate concern, I went through the code again, the
> codetag_ref pointer approach works for percpu and slab allocators but
> don't work for the page allocator.

Ugh! You are absolutely correct. I'm still thinking in terms of
pre-alloctag compression, before we started storing codetag references
in the page flags.

>
> Suren, Hao, I could potentially pass in the struct page * to
> __alloc_tag_add and __alloc_tag_sub from the page allocator and keep
> the codepath for the percpu and slab allocators the same. What do you
> think? I think that should solve this concern.

Yes, that should solve this ambiguity and I think it would be the
simplest approach here.

>
> > Thanks
> > Best Regards
> > Hao
> >
> > >>
> > >> Thanks
> > >> Best Regards
> > >> Hao
> > >>
> > >>> +TRACE_EVENT(alloc_tag_mem_freed,
> > >>> +
> > >>> +     TP_PROTO(union codetag_ref *ref, struct alloc_tag *tag, size_=
t bytes),
> > >>> +
> > >>> +     TP_ARGS(ref, tag, bytes),
> > >>> +
> > >>> +     TP_STRUCT__entry(
> > >>> +             __field(union codetag_ref *, ref)
> > >>> +             __field(struct alloc_tag *, tag)
> > >>> +             __field(size_t, bytes)
> > >>> +     ),
> > >>> +
> > >>> +     TP_fast_assign(
> > >>> +             __entry->ref =3D ref;
> > >>> +             __entry->tag =3D tag;
> > >>> +             __entry->bytes =3D bytes;
> > >>> +     ),
> > >>> +
> > >>> +     TP_printk("reference %p, tag %p, bytes %zu",
> > >>> +             __entry->ref,
> > >>> +             __entry->tag,
> > >>> +             __entry->bytes
> > >>> +     )
> > >>> +);
> > >>> +
> > >>> +#endif /* _TRACE_ALLOC_TAG_H */
> > >>> +
> > >>> +/* This part must be outside protection */
> > >>> +#include <trace/define_trace.h>
> > >>> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > >>> index f30ef8dd24c7..a5339767efd5 100644
> > >>> --- a/mm/alloc_tag.c
> > >>> +++ b/mm/alloc_tag.c
> > >>> @@ -19,6 +19,9 @@
> > >>>  #include <linux/kmemleak.h>
> > >>>  #include <uapi/linux/alloc_tag.h>
> > >>>
> > >>> +#define CREATE_TRACE_POINTS
> > >>> +#include <trace/events/alloc_tag.h>
> > >>> +
> > >>>  #include "internal.h"
> > >>>  #include "page_alloc.h"
> > >>>
> > >>> @@ -55,6 +58,9 @@ EXPORT_SYMBOL(mem_alloc_profiling_key);
> > >>>
> > >>>  DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed);
> > >>>
> > >>> +DEFINE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> > >>> +EXPORT_SYMBOL(alloc_tag_trace_key);
> > >>> +
> > >>>  struct alloc_tag_kernel_section kernel_tags =3D { NULL, 0 };
> > >>>  unsigned long alloc_tag_ref_mask;
> > >>>  int alloc_tag_ref_offs;
> > >>> @@ -485,6 +491,28 @@ static const struct proc_ops allocinfo_proc_op=
s =3D {
> > >>>  #endif
> > >>>  };
> > >>>
> > >>> +void __alloc_tag_trace_hit(struct alloc_tag *tag)
> > >>> +{
> > >>> +     if (unlikely(!tag))
> > >>> +             return;
> > >>> +     trace_alloc_tag_hit(tag);
> > >>> +}
> > >>> +EXPORT_SYMBOL(__alloc_tag_trace_hit);
> > >>> +
> > >>> +void alloc_tag_trace_mem_alloc(union codetag_ref *ref, struct allo=
c_tag *tag,
> > >>> +                           size_t bytes)
> > >>> +{
> > >>> +     trace_alloc_tag_mem_alloced(ref, tag, bytes);
> > >>> +}
> > >>> +EXPORT_SYMBOL(alloc_tag_trace_mem_alloc);
> > >>> +
> > >>> +void alloc_tag_trace_mem_free(union codetag_ref *ref, struct alloc=
_tag *tag,
> > >>> +                          size_t bytes)
> > >>> +{
> > >>> +     trace_alloc_tag_mem_freed(ref, tag, bytes);
> > >>> +}
> > >>> +EXPORT_SYMBOL(alloc_tag_trace_mem_free);
> > >>> +
> > >>>  size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t coun=
t, bool can_sleep)
> > >>>  {
> > >>>       struct codetag_iterator iter;
