Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434100;
	b=ZhkxdfHCQHL5kjanrsGB//nMf9nwWNHrJeU5BTjLi8HmE24Xuj4HOmsEfD0BFZM2LWYS
	 EwBIKUlSI6MGXNX/oNsYu2bGF5QG0ZBz3DX1Vpi83KDlyRs+pIQ5+9Dzw84STuMrhjAvQ
	 6a6bQc69NnFUkmAbHF6Gxbv1UzFEIvYQeiJo89l0/stFSPqvu46R7Y6JvsSHAcouxzuXg
	 ybEQVTE5WMoZnkKZb5yg2X9OQKbCxDwP0mnJeofV1UzhOp0OHbrEQk6IBbY0nc1oaxNiM
	 m1DICJo2CYq1GQGoo6YSU9PpdokjCLyZnnjj1QIZZgMIz8jS/RnW0TI2NUO4zeNrjtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=At01zq40L8WYV+a1tGSZt7rlYbzh9kAo03/fegRRcAc=;
	b=P171eHRhVJGxW8F8tglQLILuqh1hqAuylXlknEisXkDvWpU+8DQUU8WrwRVmLJMGvB8k
	 BPJlU4VeKsxGTPZPqzVZ+dU72R77tdP2ARHlIMAxAxf6ZR6Z7HU7E8fqIk7EKkG+7pSpE
	 W6+aXB/H5SimJ5X9YebtUErfmksuvsXeh4lntNP3da2z4yzTtCPporNz3BQL0w2oiZQ7G
	 YUnCXAxqLt3+eeYbYnCbEsZknRDx6MEqULPJLnZv4SlsjDyOfI/rm6ES2q7qeZiFcAih+
	 1pg/CU2aGoJhRSRnP1QlWC3hshcPYWwP1IVuKaNJg7WJzJonpDU6OS/0JdvYcaGLETQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CXIbmCaW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E77606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CXIbmCaW
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db33db4de9so8715ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792434099; cv=none;
        d=google.com; s=arc-20260327;
        b=o/HMN6/n2CCr7AoGlBqJgl/nKn1C3ncG3Bu17oTNlw10lC4S4ljMSknUxu4OV4AzC2
         PjbzgYSaF015UvyQbaYWanp1s2HnFmdd37fntWnB6vcJmt7RBqcmO/eIpqvTqc+/PzH5
         c2Jk7kwd4g2iWXkFTkubssp/yLl6JW7zPQXHeGlP++nWPNJR5fdLAvN9xK94o40iySkG
         MujZQVtlkndFlPODuTRkzOZSZvFPNSpGVSNxGHnSSzRF7vJDKGjPG4JlMRl+PYyHOipF
         BjnD6ZzLdp9xNccQMzmdlNeWoHGdB5brzIMEi4E0f7Ky+bNsTI85mvwCYV6EPRP5bxfp
         xXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=At01zq40L8WYV+a1tGSZt7rlYbzh9kAo03/fegRRcAc=;
        fh=5sc9GmJyDs/aOUDBkc3P8L8jwM5N63m/Fehq+HFWnYw=;
        b=PqAm7BAlJw88SXPCNckm0hLh38iM9xDtUZR1xElLOx1Ewl+YQ88n0p4OswwAMC/VoR
         4aTwG3oZIs4uJzi6fxBpu97wSHzKadSwRr7IWmKhT3OAmgvFpm3wgSG2G4qQ7QI3ogNw
         xQhreBJf3V3ymqBDUbOthBPYIK9gtld/f05rXdRHviS9m040fPvq5XtLdekIPt2M1d3w
         qqPgFjtKvzRKfm36v25DEr9slgdXpjgYNhFfMmCrswyiuzgXAhSf6ivMOb0xGSMLa8MN
         42ByQBK1f3kiy3oBBb10qEBEjKGff7lATRB/3T/ha0FCVwgUcjeYH4xLM/6nfj3FxZz0
         X1Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792434099; x=1793038899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=At01zq40L8WYV+a1tGSZt7rlYbzh9kAo03/fegRRcAc=;
        b=CXIbmCaWhq9MZtvtrpUGosGBeW9v812uDcfmp6SsLdogn9kpjuCrsPYSRVLI2kFH/6
         7CD4egVNsDLXwThipOBPRhxZFe8X/49dDBnQKrFTX3K9z3uCusBUOkCqyj30MY+ZIE0O
         8kWIFBAcuHXbRIla6hQJsS8TpA96qaBp4D5x2TUPJPKjXGYcpSF54riVjSTHImCinZhj
         EVHjmO94urITsTXdVxFoCSVK7IpDep57ZqalEQPgATiXGJ/Ev38KpV59mbT4f6PGw7pe
         eMoCkVjBo3PSe4Q1NwBiF40RUuCK+xG/BDhhOXrl22AQambnWLN7+hoSf/bnT33wuK3n
         hKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434099; x=1793038899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=At01zq40L8WYV+a1tGSZt7rlYbzh9kAo03/fegRRcAc=;
        b=RFmlAA0Li10uSjeroBKrAlWs325eWMbNlAPp567MDE6MMOwa7NIkdxh6AAb5M1czqn
         2exyMufP6aiktT16SPkh+y5gHcB36oocuHb8HDSc3z/7LeoatbLJwxUHTC517JNoYvAc
         UHken5B5h4Rs2LtmBTCTGfAqqntFEWjv1152iHgeyBSRtF9H/DJXVoV+QiihKonv+ObN
         jRPJ48uneRlhTAvaA1eETAO668k9hYddzK9g6EjCpZ5gaqg/mwAbmF3++ER9noQHmyaN
         TV5roh6R/eRMOUQSK2E400cf5i+MNyypeeS3RLEUmLcDf2Mns+ebDbnr0ddEoCqgGErZ
         JARQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6O5OP6GsRPauIO/5Ow10YqZ1hU8r9Wb2CfrkLfjo3XLAJmCEuFfjBos14GF9vVa1Jz4pQmJGijFSSTys=@vger.kernel.org
X-Gm-Message-State: AFq9FYK78N5ekJOAxPb1AJ5/jSOnEO02AIdiV4rMkrXNyukyMTZwZM6c
	U9sr0jyHgVMDFk0l2W6Kg3W3NlGcGczBvS6wUBdnDo4PrS/0/aaG23aAkY36b+l5gJHMq+jjAqj
	p+uvL90sOLntd+nfypYVPjqxivIKq43ayI5SOQ5Mo
X-Gm-Gg: AYBFou3CSdwpuj09MXKcRFy91tmqhHEr6R3+RZPzj6XdDyE/3Ey0xlF4vmSMn3tTSZG
	e30Tsej5/9kyK5x/BW30V/JHwdVoGS/KbxbqbzXd875CgcK0e7spdTkL5OIEuJYigawodsANUBh
	OaDmTAyJ/LWhI/6ZANdq+DsC9lk+C/y0re60sVhrH+JDXw026phF5sWdwKAw/QIZLrJZ+JSQvrx
	IOr8zNy4MZOLBPkv97ihQsCBXrZUs2rucUI7mJgUvw8yMEhkhBpXG5XVri6ZFCHt7kgz+L093Hs
	HsLbzRvXWFot2LAiG6ltooNUfzbZFGkluOBg+jO304n6jxDl/XEchCOSKQbm96qU75VEBR7pVLg
	P+k7SPyZg+g==
X-Received: by 2002:a17:902:ecd0:b0:2e5:4604:c37a with SMTP id
 d9443c01a7336-2e9b32caf76mr1609025ad.18.1792434097753; Mon, 19 Oct 2026
 11:21:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791410885.git.abhishekbapat@google.com>
 <ba9bee624103492dde1c8bf57943b691b4f1596b.1791410886.git.abhishekbapat@google.com>
 <39c3cf3f-4b3c-4c80-9210-279e2bf2f5c0@linux.dev> <CAJuCfpEbt-_TBjDJTNKtFTGCvPRvnAf8qewo+ppxKywORWrOpQ@mail.gmail.com>
In-Reply-To: <CAJuCfpEbt-_TBjDJTNKtFTGCvPRvnAf8qewo+ppxKywORWrOpQ@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 19 Oct 2026 11:21:25 -0700
X-Gm-Features: AclHuK8gpExDZCd6MCgvv5VbRdlzCknhl-7S3sJKkFAgZuKouO4DyWA0u0A9CVs
Message-ID: <CAL41Mv5GM2H3CCcPzJQaGEb436eN6J1OrVaf+F8hJ0XU2DBbvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] alloc_tag: Add trace events for tracing allocations
To: Suren Baghdasaryan <surenb@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 5:33=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Oct 13, 2026 at 10:12=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Abhishek
> >
> >
> >
> > On 2026/10/8 06:39, Abhishek Bapat wrote:
> > > The memory allocation profiling framework intercepts allocations acro=
ss
> > > the core subsystems, but currently lacks runtime tracing hooks for
> > > standard observability tools to dynamically track the context (stack
> > > traces and lifecycles of the individual memory chunks) of the
> > > allocations made.
> > >
> > > Introduce three standard trace events to allow this tracking:
> > >
> > > 1. `alloc_tag_hit`: Fired at the exact call site. This allows userspa=
ce
> > >    tools to trigger and capture a call stack.
> > > 2. `alloc_tag_mem_alloced`: Fired in alloc_tag_add upon successful
> > >    allocation. It records the allocated size, the tag, and the unique=
ly
> > >    generated `ptr` value which is `codetag_ref` for slab and percpu
> > >    allocators and the pointer to the head `struct page` for the page
> > >    allocator.
> > > 3. `alloc_tag_mem_freed`: Fired in alloc_tag_sub right before memory =
is
> > >    freed, yielding the same `ptr` value to allow tracing tools to fin=
d
> > >    the corresponding allocation.
> > >
> > > Because the introduced trace events occur at different stages in the
> > > call stack, userspace tracing tools must stitch them together to form=
 a
> > > complete picture of a buffer's lifetime. Here's an example of how
> > > userspace correlates these three events:
> > >
> > > 1. On `alloc_tag_hit`: The tool captures the stack trace and caches i=
t,
> > >    keyed by the combination of the current thread's PID and the `tag`=
.
> > > 2. On `alloc_tag_mem_alloced`: The tool extracts the PID and `tag` fr=
om
> > >    the event and looks up the stack trace cached in step 1. It create=
s a
> > >    new active allocation record, mapping the new provided `ptr` value
> > >    to this cached stack trace and the newly returned allocation size.
> > > 3. On `alloc_tag_mem_freed`: When the memory is freed, the event yiel=
ds
> > >    the same `ptr` value. The tool uses this reference to look up the
> > >    original allocation record, correlates the free, and safely retire=
s
> > >    the tracking entry.
> > >
> > > Modify `alloc_tag_add()` and `alloc_tag_sub()` with a `ptr` argument =
to
> > > map frees to allocations in the trace events. Slab and percpu pass th=
e
> > > address of the object's `codetag_ref`. The page allocator passes the
> > > head `struct page` because its `codetag_ref` is a temporary copy on t=
he
> > > stack.
> > >
> > > Also, introduce `alloc_tag_trace_key` static key to minimize the
> > > overhead when no tags are being traced (the usual case). Once tracing
> > > for any tag is requested, the key is set, opening the path to check
> > > whether tracing is enabled for the current tag.
> > > Note that the mechanism to enable tag tracing is implemented in the n=
ext
> > > patch, therefore for now, `alloc_tag_trace_key` stays always unset.
> > >
> > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> >
> > Acked-by: Hao Ge <hao.ge@linux.dev>
>
> Acked-by: Suren Baghdasaryan <surenb@google.com>
>
> >
> > > ---
> > >  Documentation/mm/allocation-profiling.rst |  53 ++++++++++
> > >  MAINTAINERS                               |   1 +
> > >  include/linux/alloc_tag.h                 |  67 +++++++++---
> > >  include/trace/events/alloc_tag.h          | 122 ++++++++++++++++++++=
++
> > >  mm/alloc_tag.c                            |  28 +++++
> > >  mm/page_alloc.c                           |   4 +-
> > >  mm/percpu.c                               |  12 ++-
> > >  mm/slub.c                                 |   6 +-
> > >  8 files changed, 269 insertions(+), 24 deletions(-)
> > >  create mode 100644 include/trace/events/alloc_tag.h
> > >
> > > diff --git a/Documentation/mm/allocation-profiling.rst b/Documentatio=
n/mm/allocation-profiling.rst
> > > index b11ea77c0673..b241450394df 100644
> > > --- a/Documentation/mm/allocation-profiling.rst
> > > +++ b/Documentation/mm/allocation-profiling.rst
> > > @@ -129,6 +129,59 @@ To do so:
> > >  - Then, use the following form for your allocations:
> > >    alloc_hooks_tag(ht->your_saved_tag, kmalloc_noprof(...))
> > >
> > > +Tracing
> > > +=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Three trace events are available under `/sys/kernel/tracing/events/a=
lloc_tag` to
> > > +expose the full call stack and the lifetime of individual allocation=
s:
> > > +
> > > +- `alloc_tag_hit`: Fired at the exact call site, before the allocati=
on happens.
> > > +  Can be used to capture the call stack of the caller.
> > > +
> > > +- `alloc_tag_mem_alloced`: Fired once the allocation succeeds. Carri=
es the `ptr`,
> > > +  `tag` and `bytes` for each allocation.
> > > +
> > > +- `alloc_tag_mem_freed`: Fired before memory is freed. Carries the s=
ame
> > > +  `ptr`, `tag` and `bytes` as the matching alloc event.
> > > +
> > > +`ptr` identifies the allocation, and its meaning depends on the allo=
cator:
> > > +
> > > +- slab and percpu: the address of the object's `codetag_ref`
> > > +- page allocator: the `struct page` pointer of the head page
> > > +
> > > +Correlating the events
> > > +----------------------
> > > +
> > > +`alloc_tag_hit` and `alloc_tag_mem_alloced` come from different poin=
ts in the
> > > +call stack, so they have to be stitched together by the user consumi=
ng the
> > > +events. Here's a typical flow:
> > > +
> > > +1. On `alloc_tag_hit`: Capture the stack trace and cache it keyed by=
 `(pid, tag)`.
> > > +
> > > +2. On `alloc_tag_mem_alloced`: Look up the cached stack trace by `(p=
id, tag)`,
> > > +   then create an active allocation record keyed by `ptr` that holds=
 the stack
> > > +   trace and `bytes`.
> > > +
> > > +3. On `alloc_tag_mem_freed`: Look up the record by `ptr` and retire =
it.
> > > +
> > > +Limitations
> > > +-----------
> > > +
> > > +- For the page allocator, events are generated for the original allo=
cation and
> > > +  the free only. If the tag reference is split or moved to another f=
olio in
> > > +  between, no event is generated for that. As a result:
> > > +
> > > +  - a free event may carry a `ptr` that never appeared in an alloc e=
vent;
> > > +  - `bytes` in a free event may be smaller than in the matching allo=
c event.
> > > +
> > > +  Tools should correlate on `ptr` but must not assume that freed byt=
es equal
> > > +  allocated bytes, or that every free has a matching alloc.
> > > +
> > > +- Freeing a non-compound high-order page with `__free_pages()` while=
 another CPU
> > > +  holds a reference frees the tail pages immediately and the head pa=
ge later when
> > > +  the reference is dropped. The free event is emitted at the second =
point and
> > > +  reports `PAGE_SIZE` rather than the full size.
> > > +
> > >  Notes
> > >  =3D=3D=3D=3D=3D
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 5c38da7090db..751ce786a378 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -17100,6 +17100,7 @@ S:    Maintained
> > >  F:   Documentation/mm/allocation-profiling.rst
> > >  F:   include/linux/alloc_tag.h
> > >  F:   include/linux/pgalloc_tag.h
> > > +F:   include/trace/events/alloc_tag.h
> > >  F:   include/uapi/linux/alloc_tag.h
> > >  F:   mm/alloc_tag.c
> > >  F:   tools/testing/selftests/alloc_tag/
> > > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> > > index 7f2d80a59792..49825177d8c8 100644
> > > --- a/include/linux/alloc_tag.h
> > > +++ b/include/linux/alloc_tag.h
> > > @@ -128,12 +128,33 @@ DECLARE_PER_CPU(struct alloc_tag_counters, _sha=
red_alloc_tag);
> > >  DECLARE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAU=
LT,
> > >                       mem_alloc_profiling_key);
> > >
> > > +DECLARE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> > > +
> > >  static inline bool mem_alloc_profiling_enabled(void)
> > >  {
> > >       return static_branch_maybe(CONFIG_MEM_ALLOC_PROFILING_ENABLED_B=
Y_DEFAULT,
> > >                                  &mem_alloc_profiling_key);
> > >  }
> > >
> > > +static inline bool alloc_tag_trace_enabled(void)
> > > +{
> > > +     return static_branch_unlikely(&alloc_tag_trace_key);
> > > +}
> > > +
> > > +void alloc_tag_trace_mem_alloc(const void *ptr, struct alloc_tag *ta=
g,
> > > +                            size_t bytes);
> > > +
> > > +void alloc_tag_trace_mem_free(const void *ptr, struct alloc_tag *tag=
,
> > > +                           size_t bytes);
> > > +
> > > +void __alloc_tag_trace_hit(struct alloc_tag *tag);
> > > +
> > > +static __always_inline void alloc_tag_trace_hit(struct alloc_tag *ta=
g)
> > > +{
> > > +     if (alloc_tag_trace_enabled())
> > > +             __alloc_tag_trace_hit(tag);
> > > +}
> > > +
> > >  bool mem_alloc_profiling_permanently_disabled(void);
> > >
> > >  static inline struct alloc_tag_counters alloc_tag_read(struct alloc_=
tag *tag)
> > > @@ -198,13 +219,19 @@ static inline bool alloc_tag_ref_set(union code=
tag_ref *ref, struct alloc_tag *t
> > >       return true;
> > >  }
> > >
> > > -static inline void alloc_tag_add(union codetag_ref *ref, struct allo=
c_tag *tag, size_t bytes)
> > > +static inline void alloc_tag_add(union codetag_ref *ref, struct allo=
c_tag *tag, size_t bytes,
> > > +                              const void *ptr)
> > >  {
> > > -     if (likely(alloc_tag_ref_set(ref, tag)))
> > > +     if (likely(alloc_tag_ref_set(ref, tag))) {
> > >               this_cpu_add(tag->counters->bytes, bytes);
> > > +
> > > +             if (alloc_tag_trace_enabled())
> > > +                     /* Trace successful allocs with their unique pt=
r */
> > > +                     alloc_tag_trace_mem_alloc(ptr, tag, bytes);
> > > +     }
> > >  }
> > >
> > > -static inline void alloc_tag_sub(union codetag_ref *ref, size_t byte=
s)
> > > +static inline void alloc_tag_sub(union codetag_ref *ref, size_t byte=
s, const void *ptr)
> > >  {
> > >       struct alloc_tag *tag;
> > >
> > > @@ -222,6 +249,10 @@ static inline void alloc_tag_sub(union codetag_r=
ef *ref, size_t bytes)
> > >       this_cpu_sub(tag->counters->bytes, bytes);
> > >       this_cpu_dec(tag->counters->calls);
> > >
> > > +     if (alloc_tag_trace_enabled())
> > > +             /* Trace frees with their unique ptr */
> > > +             alloc_tag_trace_mem_free(ptr, tag, bytes);
> > > +
> > >       ref->ct =3D NULL;
> > >  }
> > >
> > > @@ -243,25 +274,29 @@ static inline bool alloc_tag_is_inaccurate(stru=
ct alloc_tag *tag)
> > >  static inline bool mem_alloc_profiling_enabled(void) { return false;=
 }
> > >  static inline bool mem_alloc_profiling_permanently_disabled(void) { =
return true; }
> > >  static inline void alloc_tag_add(union codetag_ref *ref, struct allo=
c_tag *tag,
> > > -                              size_t bytes) {}
> > > -static inline void alloc_tag_sub(union codetag_ref *ref, size_t byte=
s) {}
> > > +                              size_t bytes, const void *ptr) {}
> > > +static inline void alloc_tag_sub(union codetag_ref *ref, size_t byte=
s,
> > > +                              const void *ptr) {}
> > >  static inline void alloc_tag_set_inaccurate(struct alloc_tag *tag) {=
}
> > >  static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag) { =
return false; }
> > > +#define alloc_tag_trace_hit(_tag)    /* NOOP */
> > >  #define alloc_tag_record(p)  do {} while (0)
> > >
> > >  #endif /* CONFIG_MEM_ALLOC_PROFILING */
> > >
> > > -#define alloc_hooks_tag(_tag, _do_alloc)                            =
 \
> > > -({                                                                  =
 \
> > > -     typeof(_do_alloc) _res;                                        =
 \
> > > -     if (mem_alloc_profiling_enabled()) {                           =
 \
> > > -             struct alloc_tag * __maybe_unused _old;                =
 \
> > > -             _old =3D alloc_tag_save(_tag);                         =
   \
> > > -             _res =3D _do_alloc;                                    =
   \
> > > -             alloc_tag_restore(_tag, _old);                         =
 \
> > > -     } else                                                         =
 \
> > > -             _res =3D _do_alloc;                                    =
   \
> > > -     _res;                                                          =
 \
> > > +#define alloc_hooks_tag(_tag, _do_alloc)                            =
         \
> > > +({                                                                  =
         \
> > > +     typeof(_do_alloc) _res;                                        =
         \
> > > +     if (mem_alloc_profiling_enabled()) {                           =
         \
> > > +             struct alloc_tag * __maybe_unused _old;                =
         \
> > > +             /* Fired here to cleanly capture the caller's stack tra=
ce */    \
> > > +             alloc_tag_trace_hit(_tag);                             =
         \
> > > +             _old =3D alloc_tag_save(_tag);                         =
           \
> > > +             _res =3D _do_alloc;                                    =
           \
> > > +             alloc_tag_restore(_tag, _old);                         =
         \
> > > +     } else                                                         =
         \
> > > +             _res =3D _do_alloc;                                    =
           \
> > > +     _res;                                                          =
         \
> > >  })
> > >
> > >  #define alloc_hooks(_do_alloc)                                      =
         \
> > > diff --git a/include/trace/events/alloc_tag.h b/include/trace/events/=
alloc_tag.h
> > > new file mode 100644
> > > index 000000000000..b79efb7dd25c
> > > --- /dev/null
> > > +++ b/include/trace/events/alloc_tag.h
> > > @@ -0,0 +1,122 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#undef TRACE_SYSTEM
> > > +#define TRACE_SYSTEM alloc_tag
> > > +
> > > +#if !defined(_TRACE_ALLOC_TAG_H) || defined(TRACE_HEADER_MULTI_READ)
> > > +#define _TRACE_ALLOC_TAG_H
> > > +
> > > +#include <linux/tracepoint.h>
> > > +
> > > +/*
> > > + * alloc_tag_hit is generated at the exact allocation call site and =
can be
> > > + * used to capture a clean stack trace.
> > > + *
> > > + * To link this stack trace to the actual allocated memory chunk, to=
ols must
> > > + * correlate this event with the resulting alloc_tag_mem_alloced eve=
nt. Since
> > > + * multiple threads can hit the same tag simultaneously, tools must =
match BOTH
> > > + * the `tag` field and the implicitly recorded PID provided by the c=
ore
> > > + * tracing subsystem.
> > > + */
> > > +TRACE_EVENT(alloc_tag_hit,
> > > +     TP_PROTO(struct alloc_tag *tag),
> > > +
> > > +     TP_ARGS(tag),
> > > +
> > > +     TP_STRUCT__entry(__field(struct alloc_tag *, tag)
> > > +                      __string(modname, tag->ct.modname ? tag->ct.mo=
dname : "NONE")
> > > +                      __string(filename, tag->ct.filename)
> > > +                      __string(function, tag->ct.function)
> > > +                      __field(unsigned int, lineno)
> > > +     ),
> > > +
> > > +     TP_fast_assign(__entry->tag =3D tag;
> > > +                    __assign_str(modname);
> > > +                    __assign_str(filename);
> > > +                    __assign_str(function);
> > > +                    __entry->lineno =3D tag->ct.lineno;
> > > +     ),
> > > +
> > > +     TP_printk("tag %p, module: %s, filename: %s, function %s, linen=
o %u",
> > > +               __entry->tag,
> > > +               __get_str(modname),
> > > +               __get_str(filename),
> > > +               __get_str(function),
> > > +               __entry->lineno
> > > +     )
> > > +);
> > > +
> > > +/*
> > > + * alloc_tag_mem_alloced is generated after memory is successfully a=
llocated.
> > > + * It captures the exact byte size.
> > > + *
> > > + * The `ptr` value identifies the memory chunk for tracking its life=
cycle
> > > + * (e.g., matching it with alloc_tag_mem_freed).
> > > + * - slab and percpu allocators: address of the object's codetag_ref
> > > + * - page allocator: the head struct page of the allocation
> > > + *
> > > + * Because the kernel isolates active allocations within the task st=
ruct
> > > + * (current->alloc_tag), this event will always share the same impli=
cit PID as
> > > + * its corresponding alloc_tag_hit event. Tools should use the combi=
nation
> > > + * PID + `tag` to correlate them.
> > > + */
> > > +TRACE_EVENT(alloc_tag_mem_alloced,
> > > +     TP_PROTO(const void *ptr, struct alloc_tag *tag, size_t bytes),
> > > +
> > > +     TP_ARGS(ptr, tag, bytes),
> > > +
> > > +     TP_STRUCT__entry(__field(const void *, ptr)
> > > +                      __field(struct alloc_tag *, tag)
> > > +                      __field(size_t, bytes)
> > > +     ),
> > > +
> > > +     TP_fast_assign(__entry->ptr =3D ptr;
> > > +                    __entry->tag =3D tag;
> > > +                    __entry->bytes =3D bytes;
> > > +     ),
> > > +
> > > +     TP_printk("ptr %p, tag %p, bytes %zu",
> > > +               __entry->ptr,
> > > +               __entry->tag,
> > > +               __entry->bytes
> > > +     )
> > > +);
> > > +
> > > +/*
> > > + * alloc_tag_mem_freed event is generated immediately before memory =
is
> > > + * freed. The `ptr` value matches the one emitted during allocation,
> > > + * allowing tools to match it to its corresponding allocation and
> > > + * call stack.
> > > + *
> > > + * Page allocator caveat: Pages can be split or moved to another fol=
io
> > > + * after the alloc event with no new events generated for that. As a
> > > + * result, a free event may carry a `ptr` that never appeared in an
> > > + * alloc event, and the `bytes` may be smaller than in the matching
> > > + * alloc event. Tools must not assume alloc bytes =3D=3D free bytes,=
 nor
> > > + * that every free has a matching alloc.
> > > + */
> > > +TRACE_EVENT(alloc_tag_mem_freed,
> > > +     TP_PROTO(const void *ptr, struct alloc_tag *tag, size_t bytes),
> > > +
> > > +     TP_ARGS(ptr, tag, bytes),
> > > +
> > > +     TP_STRUCT__entry(__field(const void *, ptr)
> > > +                      __field(struct alloc_tag *, tag)
> > > +                      __field(size_t, bytes)
> > > +     ),
> > > +
> > > +     TP_fast_assign(__entry->ptr =3D ptr;
> > > +                    __entry->tag =3D tag;
> > > +                    __entry->bytes =3D bytes;
> > > +     ),
> > > +
> > > +     TP_printk("ptr %p, tag %p, bytes %zu",
> > > +               __entry->ptr,
> > > +               __entry->tag,
> > > +               __entry->bytes
> > > +     )
> > > +);
> > > +
> > > +#endif /* _TRACE_ALLOC_TAG_H */
> > > +
> > > +/* This part must be outside protection */
> > > +#include <trace/define_trace.h>
> > > diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > > index 82e2c3448dcf..ca2412a67312 100644
> > > --- a/mm/alloc_tag.c
> > > +++ b/mm/alloc_tag.c
> > > @@ -18,6 +18,9 @@
> > >  #include <linux/kmemleak.h>
> > >  #include <uapi/linux/alloc_tag.h>
> > >
> > > +#define CREATE_TRACE_POINTS
> > > +#include <trace/events/alloc_tag.h>
> > > +
> > >  #include "internal.h"
> > >  #include "page_alloc.h"
> > >
> > > @@ -54,6 +57,9 @@ EXPORT_SYMBOL(mem_alloc_profiling_key);
> > >
> > >  DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed);
> > >
> > > +DEFINE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> > > +EXPORT_SYMBOL(alloc_tag_trace_key);
> > > +
> > >  struct alloc_tag_kernel_section kernel_tags =3D { NULL, 0 };
> > >  unsigned long alloc_tag_ref_mask;
> > >  int alloc_tag_ref_offs;
> > > @@ -484,6 +490,28 @@ static const struct proc_ops allocinfo_proc_ops =
=3D {
> > >  #endif
> > >  };
> > >
> > > +void __alloc_tag_trace_hit(struct alloc_tag *tag)
> > > +{
> > > +     if (unlikely(!tag))
>
> nit: Is there a case when we pass tag=3DNULL here?
>

Yes, sashiko brought this up during my local review before I sent the
patch. If MAP CONFIG option is enabled but the kernel is booted with
the sysctl set to 0, rhashtable_init() eventually calls
alloc_hooks_tag(). mem_alloc_profiling_enabled() returns false and
alloc_tag_save() is skipped leaving ht->alloc_tag to NULL. If the
sysctl value is later enabled, alloc_hooks_tag() will be called with
ht->alloc_tag set =3D NULL leading to a NULL pointer exception in
alloc_tag_trace_hit(). Which is why the NULL check is required.

> > > +             return;
> > > +     trace_alloc_tag_hit(tag);
> > > +}
> > > +EXPORT_SYMBOL(__alloc_tag_trace_hit);
> > > +
> > > +void alloc_tag_trace_mem_alloc(const void *ptr, struct alloc_tag *ta=
g,
> > > +                            size_t bytes)
> > > +{
> > > +     trace_alloc_tag_mem_alloced(ptr, tag, bytes);
> > > +}
> > > +EXPORT_SYMBOL(alloc_tag_trace_mem_alloc);
> > > +
> > > +void alloc_tag_trace_mem_free(const void *ptr, struct alloc_tag *tag=
,
> > > +                           size_t bytes)
> > > +{
> > > +     trace_alloc_tag_mem_freed(ptr, tag, bytes);
> > > +}
> > > +EXPORT_SYMBOL(alloc_tag_trace_mem_free);
> > > +
> > >  size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count,=
 bool can_sleep)
> > >  {
> > >       struct codetag_iterator iter;
> > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > index 7682aecc2c07..5e3e411d4ffe 100644
> > > --- a/mm/page_alloc.c
> > > +++ b/mm/page_alloc.c
> > > @@ -1239,7 +1239,7 @@ void __pgalloc_tag_add(struct page *page, struc=
t task_struct *task,
> > >       union codetag_ref ref;
> > >
> > >       if (likely(get_page_tag_ref(page, &ref, &handle))) {
> > > -             alloc_tag_add(&ref, task->alloc_tag, PAGE_SIZE * nr);
> > > +             alloc_tag_add(&ref, task->alloc_tag, PAGE_SIZE * nr, pa=
ge);
> > >               update_page_tag_ref(handle, &ref);
> > >               put_page_tag_ref(handle);
> > >       } else {
> > > @@ -1268,7 +1268,7 @@ void __pgalloc_tag_sub(struct page *page, unsig=
ned int nr)
> > >       union codetag_ref ref;
> > >
> > >       if (get_page_tag_ref(page, &ref, &handle)) {
> > > -             alloc_tag_sub(&ref, PAGE_SIZE * nr);
> > > +             alloc_tag_sub(&ref, PAGE_SIZE * nr, page);
> > >               update_page_tag_ref(handle, &ref);
> > >               put_page_tag_ref(handle);
> > >       }
> > > diff --git a/mm/percpu.c b/mm/percpu.c
> > > index 3eff382e565a..12b6c97d1596 100644
> > > --- a/mm/percpu.c
> > > +++ b/mm/percpu.c
> > > @@ -1695,15 +1695,19 @@ static void pcpu_alloc_tag_alloc_hook(struct =
pcpu_chunk *chunk, int off,
> > >                                     size_t size)
> > >  {
> > >       if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts)) {
> > > -             alloc_tag_add(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SH=
IFT].tag,
> > > -                           current->alloc_tag, size);
> > > +             union codetag_ref *ref =3D &chunk->obj_exts[off >> PCPU=
_MIN_ALLOC_SHIFT].tag;
> > > +
> > > +             alloc_tag_add(ref, current->alloc_tag, size, ref);
> > >       }
> > >  }
> > >
> > >  static void pcpu_alloc_tag_free_hook(struct pcpu_chunk *chunk, int o=
ff, size_t size)
> > >  {
> > > -     if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts))
> > > -             alloc_tag_sub(&chunk->obj_exts[off >> PCPU_MIN_ALLOC_SH=
IFT].tag, size);
> > > +     if (mem_alloc_profiling_enabled() && likely(chunk->obj_exts)) {
> > > +             union codetag_ref *ref =3D &chunk->obj_exts[off >> PCPU=
_MIN_ALLOC_SHIFT].tag;
> > > +
> > > +             alloc_tag_sub(ref, size, ref);
> > > +     }
> > >  }
> > >  #else
> > >  static void pcpu_alloc_tag_alloc_hook(struct pcpu_chunk *chunk, int =
off,
> > > diff --git a/mm/slub.c b/mm/slub.c
> > > index 544cff39762c..a866576ccb98 100644
> > > --- a/mm/slub.c
> > > +++ b/mm/slub.c
> > > @@ -2404,7 +2404,7 @@ __alloc_tagging_slab_alloc_hook(struct kmem_cac=
he *s, void *object, gfp_t flags,
> > >               obj_ext =3D slab_obj_ext(s, slab, obj_exts, object);
> > >               ref =3D slab_obj_ext_codetag_ref(slab, obj_ext);
> > >
> > > -             alloc_tag_add(ref, current->alloc_tag, s->size);
> > > +             alloc_tag_add(ref, current->alloc_tag, s->size, ref);
> > >
> > >               put_slab_obj_exts(obj_exts);
> > >       } else {
> > > @@ -2444,9 +2444,11 @@ __alloc_tagging_slab_free_hook(struct kmem_cac=
he *s, struct slab *slab, void **p
> > >       get_slab_obj_exts(obj_exts);
> > >       for (int i =3D 0; i < objects; i++) {
> > >               struct slabobj_ext *ext;
> > > +             union codetag_ref *ref;
> > >
> > >               ext =3D slab_obj_ext(s, slab, obj_exts, p[i]);
> > > -             alloc_tag_sub(slab_obj_ext_codetag_ref(slab, ext), s->s=
ize);
> > > +             ref =3D slab_obj_ext_codetag_ref(slab, ext);
> > > +             alloc_tag_sub(ref, s->size, ref);
> > >       }
> > >       put_slab_obj_exts(obj_exts);
> > >  }
