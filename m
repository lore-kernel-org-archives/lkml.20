Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79282449ED7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371734; cv=pass; b=s2QMrRJn0lF4tcUTszIdpoN8XNqe3zgiZhIlX8QGTBfJZf5km5iLyK8rQTyOVnOtojSQ3vd+XU+597l2q2DT3k1O6Wj9Zmr7Q6eStD3mcFjI8eggyIevnKGsknsgpoFUvQBVrlX1X/B2iULXgkbhbvnem1V3mF+RuFeV93kmBso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371734; c=relaxed/simple;
	bh=VYTP4/teMW+7T4ZgN8RVnqc5ZLyIguWoIpBn2lkm4pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyycQ4CwiKpq/VBFvvbBNkTRLX8tqyN+WhPG3Bf6xcUY9MzZkIc8LgFZntq5E3nicwFmGaq0zk1Q/MBiSFR9ETE8W06cGwBIwGosPCyBfD0tzxxZGewsfwfad1Y6QMz3lkuaPUmwVgoTVSkYgytJrSdtX0FTdf/5UXQ7mgLH9Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYSZUpiL; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYSZUpiL"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db33db4de9so24215ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790371732; cv=none;
        d=google.com; s=arc-20260327;
        b=TT9Rbls1NPf8Zmrfq838XVyHo8ZAzZQ/Gw3LvZQUWSztjEsi9QqCT4Wo6to2cAstpP
         HCqpkXiGgRuiffnw2VfhkMyJPakydIaPmHlNac0TarzjZLZ/XtzVTjGfLCxcee0N2aIl
         AN0Ce3am2AGRGPhRb/Bi+9qIdYdTxZkeJ4ChbEwAyEENEW7Xkxag+yVtU26gVxHCxvij
         W2RwCYGPvKt3sqCpoyFbjEc5xnWdulyxmuiip0vOL/yJQdqKeDirYhbpzGy4KSnZWidP
         D77Xy5ZAaGIa+FM+K4mvacyeQiwCCF4mAT1B/B+dvuU/hgDfTeHYqtSdGo30qAhbU7aB
         3tLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NbMRl28CfB9DT6gF9ur53jbkl2XPiQfbSX+1iQMn930=;
        fh=ryqcOLJPYMUESaxuvTwV0sDMbA1E2iLBbyHZkt/7FAQ=;
        b=HzEA5zJxzduX1t8gkLnUXpi6wuuDq5R9i803Ebzn9i1Xez6gVzc2iSIJ55ipT342ci
         s8MDfZkdJfK6FhShx4ParCuEDFd3cP9xuQhYplGJF+Iv6X5KBMvJa5g7gKEiFplVkGqJ
         hqhAENlP3Hp50J9Yl7IHmqv+baNhHGrBKZyQchc7YsuLCrrIRDyrIA7kxjZgL6SOvZAi
         jKqLI4C6BbtgIVu0WlwN7A6/dXrWI34GjbX3iaIzp89K71qU/idaIg4E2srVDe5lN16N
         GorY69QIPau/AzUuUMcj4tRlJ40g7PAG7CV1slT4w1/jx7m/v50aHuOHZe79euKbdMi4
         dMgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790371732; x=1790976532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbMRl28CfB9DT6gF9ur53jbkl2XPiQfbSX+1iQMn930=;
        b=bYSZUpiL5C6+a1vXz+GvrWJO4Jg9qTFR2sS0Pt2QlWPssUnCxKVCZCfsykMDOQ3SrR
         zS8QxBpFWf3s36VqsmHpOtFDUpvWtDbD/iVqT60gjx7R7HeUqxoTrryOzQu35fVKWOBj
         9A5f/yADIj6BZyvBILYF18CjWgpF+nwLw6clxkFtcRQu1c07b/X0vafJygcQFPNYIviH
         KJZCjtRnRmalgJUhFb21PJdrjRLxBRJBzICOvKJPh6fkxd9vZGN9IXGWjKbscMBVEbBa
         50cD2rEglCBNMZF+1wwq499TOaiKBRuX8aNLWImoxRDC18qbccFVrLYCBOc6DXMrydpg
         M7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371732; x=1790976532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbMRl28CfB9DT6gF9ur53jbkl2XPiQfbSX+1iQMn930=;
        b=oOyyYnBNf/oYFRGqm2mBz6r3zB/geRpzsR4KKTO1m6O1FaaXnWXVjvLKPvnqrgZmX3
         +8PrXCu1to3XDbqSuiqQ5L0pKS2qI5EjX1gxwZlkUrxKi56Xoy3K1Oub3WU0OLWw9Wqf
         zz89jSnM5LqVlVgUABy9JDfWin3aI/+CuYlx4CzOqEBg9gbqVn6n5DzapPP6EzYxTGDP
         jsVQ7XqwNBJISfwN3VbGNjJYl8ZG7VTs3UeWc9FO8e6VpuUY6yU+a/MEnVUKd3A++9i9
         ihqtYT821Au2NCzJlFN3tuT4EvZnODOWcTemeIoHJcnEZa5V1qPi1HqKU+AfFOMGz4Me
         odhw==
X-Forwarded-Encrypted: i=1; AKwUvByEqw3wqZTVSexDJ6vGKeOhxvnZ3Z1qT8b/u4N13XOQrTRXszTxNrNvnf7TrR0Q/0A5JavxVG4tc8LZ1yw=@vger.kernel.org
X-Gm-Message-State: AFuF++laCP6OPxAC3vyQXc50ao+0YIQgT8N5vfJy0nRGYaWMroVdJVSq
	/9yQ1YxPo26Vhw16laIazqlzyR3R/UyL86svRsrf1MN+rO9MM2JLbOMwPpkL3DxrrZYekipzx/m
	rjySb+ubEgXv/p7RddNIJhX03QWAQY8amF1tp2JAY
X-Gm-Gg: AYBFou0NRSa7pJBBa02VwujJsb+SH3L/mHUfZeN0Ilpyd40GcnS68+EgHrsPWeW2P+S
	PnGejARXCUaFiEGf/4B5O5LErRpywIMaIoQvJdszTbV4gGANW73TADm/KvO7sHrdzdycs8kjssT
	sDUV0N1B6ocE82Nva74zfo+zfxXMqF6kQeDa4P/KTE2hnjUSjUmJrs7EY2FG2FpUe9JXT3J3DrC
	0sKte8zeoagL4tzT9A3pNPYbrN1OY3mNRANCyIoqA6ZjqRwZEy5eU8DoIj30bcnfKG7TGFCphFw
	U9s1xyp7iBRzVOi1lSClw2IhCpr0COAJS7MGE8Jpe+y34aLYgLoMcVOzMr5l3FSvVGHKu9qIH11
	jqltxP4vWHw==
X-Received: by 2002:a17:902:db02:b0:2df:8e28:661a with SMTP id
 d9443c01a7336-2dfa6263bc5mr1212555ad.16.1790371731056; Fri, 25 Sep 2026
 14:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790025465.git.abhishekbapat@google.com>
 <95bf63d2b9ef14f6610d6543b6892d266e4dc5c6.1790025465.git.abhishekbapat@google.com>
 <0e2db0a0-663e-45fc-b073-126b8e80b625@linux.dev> <CAJuCfpFXky7Rj5ghPXGuL59PtG-cmXQywK3ttOHWx_v-pSSN9w@mail.gmail.com>
 <CAL41Mv5REKRLUwSZ9ViTKpBwtEEaE-A3VOK-A0pDTORVNQjeVg@mail.gmail.com>
In-Reply-To: <CAL41Mv5REKRLUwSZ9ViTKpBwtEEaE-A3VOK-A0pDTORVNQjeVg@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Fri, 25 Sep 2026 14:28:38 -0700
X-Gm-Features: AclHuK-rlu7lCPpgcOe11vshDOR2IoynhR9zVT0TuUEQB2hYbYOMSEF_McF7A2Y
Message-ID: <CAL41Mv6aGMHPyATA9h1dY_cThXW9PyKQsVdLCaNXOBsQKv9_Qw@mail.gmail.com>
Subject: Re: [PATCH 2/4] alloc_tag: Introduce IOCTLs to toggle allocation tracepoints
To: Suren Baghdasaryan <surenb@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 2:25=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> On Thu, Sep 24, 2026 at 11:18=E2=80=AFPM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> >
> > On Thu, Sep 24, 2026 at 1:16=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote=
:
> > >
> > > Hi Abhishek
> > >
> > > On 2026/9/22 05:26, Abhishek Bapat wrote:
> > > > Introduce a new IOCTL (`ALLOCINFO_IOC_TOGGLE_TRACE`) to selectively
> > > > toggle tracing on exact allocation call sites. Userspace tools can
> > > > use the existing filtering mechanism to specify the set of tags to
> > > > toggle tracing for.
> > > >
> > > > To facilitate low overhead execution for non-targeted call sites, a=
dd a
> > > > new `CODETAG_FLAG_TRACE_ON` flag to `struct codetag` to track per-s=
ite
> > > > activation. Protect these conditional branch evaluations using a gl=
obal
> > > > `alloc_tag_trace_key` static branch and an inline static key check
> > > > pattern in the allocator hooks (`alloc_tag_add`, `alloc_tag_sub`, e=
tc).
> > > > This ensures that the trace events are entirely skipped when no
> > > > allocation call sites are being actively traced, leaving only a NOP=
 on
> > > > the allocation fast path.
> > > >
> > > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > > ---
> > > >  include/linux/alloc_tag.h      |  39 ++++++++----
> > > >  include/linux/codetag.h        |   5 +-
> > > >  include/uapi/linux/alloc_tag.h |   9 +++
> > > >  mm/alloc_tag.c                 | 110 +++++++++++++++++++++++++++++=
+++-
> > > >  4 files changed, 147 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> > > > index 2994934cf44a..dc86f8997476 100644
> > > > --- a/include/linux/alloc_tag.h
> > > > +++ b/include/linux/alloc_tag.h
> > > > @@ -136,9 +136,36 @@ static inline bool mem_alloc_profiling_enabled=
(void)
> > > >                                  &mem_alloc_profiling_key);
> > > >  }
> > > >
> > > > +static inline void alloc_tag_set_inaccurate(struct alloc_tag *tag)
> > > > +{
> > > > +     atomic_or(CODETAG_FLAG_INACCURATE, &tag->ct.flags);
> > > > +}
> > > > +
> > > > +static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag)
> > > > +{
> > > > +     return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_INACCURA=
TE);
> > > > +}
> > > > +
> > > > +static inline void alloc_tag_set_traced(struct alloc_tag *tag)
> > > > +{
> > > > +     atomic_or(CODETAG_FLAG_TRACE_ON, &tag->ct.flags);
> > > > +}
> > > > +
> > > > +static inline void alloc_tag_clear_traced(struct alloc_tag *tag)
> > > > +{
> > > > +     atomic_andnot(CODETAG_FLAG_TRACE_ON, &tag->ct.flags);
> > > > +}
> > > > +
> > > > +static inline bool alloc_tag_is_traced(const struct alloc_tag *tag=
)
> > > > +{
> > > > +     return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_TRACE_ON=
);
> > > > +}
> > > > +
> > > >  static inline bool alloc_tag_trace_enabled(const struct alloc_tag =
*tag)
> > > >  {
> > > > -     return static_branch_unlikely(&alloc_tag_trace_key);
> > > > +     if (static_branch_unlikely(&alloc_tag_trace_key))
> > > > +             return tag && alloc_tag_is_traced(tag);
> > > > +     return false;
> > > >  }
> > > >
> > > >  void alloc_tag_trace_mem_alloc(union codetag_ref *ref, struct allo=
c_tag *tag,
> > > > @@ -255,16 +282,6 @@ static inline void alloc_tag_sub(union codetag=
_ref *ref, size_t bytes)
> > > >       ref->ct =3D NULL;
> > > >  }
> > > >
> > > > -static inline void alloc_tag_set_inaccurate(struct alloc_tag *tag)
> > > > -{
> > > > -     tag->ct.flags |=3D CODETAG_FLAG_INACCURATE;
> > > > -}
> > > > -
> > > > -static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag)
> > > > -{
> > > > -     return !!(tag->ct.flags & CODETAG_FLAG_INACCURATE);
> > > > -}
> > > > -
> > > >  #define alloc_tag_record(p)  ((p) =3D current->alloc_tag)
> > > >
> > > >  #else /* CONFIG_MEM_ALLOC_PROFILING */
> > > > diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> > > > index a25a085c2df1..f728295d50c0 100644
> > > > --- a/include/linux/codetag.h
> > > > +++ b/include/linux/codetag.h
> > > > @@ -18,6 +18,7 @@ struct module;
> > > >
> > > >  /* codetag flags */
> > > >  #define CODETAG_FLAG_INACCURATE      (1 << 0)
> > > > +#define CODETAG_FLAG_TRACE_ON        (1 << 1)
> > > >
> > > >  /*
> > > >   * An instance of this structure is created in a special ELF secti=
on at every
> > > > @@ -25,7 +26,7 @@ struct module;
> > > >   * an array of these.
> > > >   */
> > > >  struct codetag {
> > > > -     unsigned int flags;
> > > > +     atomic_t flags;
> > > >       unsigned int lineno;
> > > >       const char *modname;
> > > >       const char *function;
> > > > @@ -71,7 +72,7 @@ struct codetag_iterator {
> > > >       .function       =3D __func__,                     \
> > > >       .filename       =3D __FILE__,                     \
> > > >       .lineno         =3D __LINE__,                     \
> > > > -     .flags          =3D 0,                            \
> > > > +     .flags          =3D ATOMIC_INIT(0),               \
> > > >  }
> > > >
> > > >  void codetag_lock_module_list(struct codetag_type *cttype);
> > > > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/al=
loc_tag.h
> > > > index 7d4618bea043..069ab8341e87 100644
> > > > --- a/include/uapi/linux/alloc_tag.h
> > > > +++ b/include/uapi/linux/alloc_tag.h
> > > > @@ -85,9 +85,16 @@ struct allocinfo_get_at {
> > > >       struct allocinfo_tag_data data;
> > > >  };
> > > >
> > > > +struct allocinfo_toggle_traces {
> > > > +     /* inputs */
> > > > +     struct allocinfo_tag fields;
> > > > +     __u64 enable;
> > > > +};
> > > > +
> > > >  #define _ALLOCINFO_IOC_CONTENT_ID    0
> > > >  #define _ALLOCINFO_IOC_GET_AT                1
> > > >  #define _ALLOCINFO_IOC_GET_NEXT              2
> > > > +#define _ALLOCINFO_IOC_TOGGLE_TRACE  3
> > > >
> > > >  #define ALLOCINFO_IOC_BASE           0xA6
> > > >  #define ALLOCINFO_IOC_CONTENT_ID     _IOR(ALLOCINFO_IOC_BASE, _ALL=
OCINFO_IOC_CONTENT_ID,     \
> > > > @@ -96,5 +103,7 @@ struct allocinfo_get_at {
> > > >                                             struct allocinfo_get_at=
)
> > > >  #define ALLOCINFO_IOC_GET_NEXT               _IOR(ALLOCINFO_IOC_BA=
SE, _ALLOCINFO_IOC_GET_NEXT,       \
> > > >                                            struct allocinfo_tag_dat=
a)
> > > > +#define ALLOCINFO_IOC_TOGGLE_TRACE   _IOW(ALLOCINFO_IOC_BASE, _ALL=
OCINFO_IOC_TOGGLE_TRACE,   \
> > > > +                                         struct allocinfo_toggle_t=
races)
> > > >
> > > >  #endif /* _UAPI_ALLOC_TAG_H */
> > > > diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > > > index a5339767efd5..fb179321a2a1 100644
> > > > --- a/mm/alloc_tag.c
> > > > +++ b/mm/alloc_tag.c
> > > > @@ -61,6 +61,15 @@ DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed=
);
> > > >  DEFINE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> > > >  EXPORT_SYMBOL(alloc_tag_trace_key);
> > > >
> > > > +static atomic_t alloc_tag_trace_cnt =3D ATOMIC_INIT(0);
> > > > +
> > > > +/*
> > > > + * As `codetag_lock_module_list` is a read lock, we need an additi=
onal mutex
> > > > + * to protect against the race conditions involved in the alloc ta=
g trace
> > > > + * toggle path.
> > > > + */
> > > > +static DEFINE_MUTEX(alloc_tag_trace_mutex);
> > > > +
> > > >  struct alloc_tag_kernel_section kernel_tags =3D { NULL, 0 };
> > > >  unsigned long alloc_tag_ref_mask;
> > > >  int alloc_tag_ref_offs;
> > > > @@ -297,7 +306,7 @@ static bool matches_filter(struct codetag *ct, =
struct allocinfo_filter *filter,
> > > >               return false;
> > > >
> > > >       if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> > > > -             inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE=
);
> > > > +             inaccurate =3D alloc_tag_is_inaccurate(ct_to_alloc_ta=
g(ct));
> > > >               if (inaccurate !=3D !!(filter->inaccurate))
> > > >                       return false;
> > > >       }
> > > > @@ -444,6 +453,81 @@ static int allocinfo_ioctl_get_next(struct seq=
_file *m, void __user *arg)
> > > >       return ret;
> > > >  }
> > > >
> > > > +static bool alloc_tag_trace_toggle(struct alloc_tag *tag, bool ena=
ble)
> > > > +{
> > > > +     if (enable) {
> > > > +             if (alloc_tag_is_traced(tag))
> > > > +                     return false;
> > > > +
> > > > +             alloc_tag_set_traced(tag);
> > > > +             if (atomic_fetch_inc(&alloc_tag_trace_cnt) =3D=3D 0)
> > > > +                     static_branch_enable(&alloc_tag_trace_key);
> > > > +     } else {
> > > > +             if (!alloc_tag_is_traced(tag))
> > > > +                     return false;
> > > > +
> > > > +             alloc_tag_clear_traced(tag);
> > > > +             if (atomic_dec_and_test(&alloc_tag_trace_cnt))
> > > > +                     static_branch_disable(&alloc_tag_trace_key);
> > > > +     }
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Toggles context capture for a specified allocation.
> > > > + */
> > > > +static int allocinfo_ioctl_toggle_trace(struct seq_file *m, void _=
_user *arg)
> > > > +{
> > > > +     struct allocinfo_toggle_traces params;
> > > > +     struct codetag_iterator iter;
> > > > +     struct codetag *ct;
> > > > +     int matches =3D 0, successes =3D 0, ret;
> > > > +
> > > > +     if (!capable(CAP_SYS_ADMIN))
> > > > +             return -EPERM;
> > > > +
> > > > +     if (copy_from_user(&params, arg, sizeof(params)))
> > > > +             return -EFAULT;
> > > > +
> > > > +     codetag_lock_module_list(alloc_tag_cttype);
> > > > +
> > > > +     struct allocinfo_filter filter =3D {
> > > > +             .mask =3D ALLOCINFO_FILTER_MASK_MODNAME |
> > > > +                    ALLOCINFO_FILTER_MASK_FUNCTION |
> > > > +                    ALLOCINFO_FILTER_MASK_FILENAME |
> > > > +                    ALLOCINFO_FILTER_MASK_LINENO,
> > > > +             .fields =3D params.fields,
> > > > +     };

Also Suren, I wanted to get your thoughts on this filter. Here, these
filters ensure that only one allocation site matches the user's
request. Should I remove the masks here so the user can choose to
toggle tracing on multiple allocation sites in one IOCTL?

> > > > +
> > > > +     iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > > > +
> > > > +     /* Toggle tracing on all codetags that match */
> > > > +     while ((ct =3D codetag_next_ct(&iter))) {
> > > > +             if (matches_filter(ct, &filter, NULL, NULL)) {
> > > > +                     matches++;
> > > > +
> > > > +                     mutex_lock(&alloc_tag_trace_mutex);
> > > > +                     if (alloc_tag_trace_toggle(ct_to_alloc_tag(ct=
), !!params.enable))
> > > > +                             successes++;
> > > > +                     mutex_unlock(&alloc_tag_trace_mutex);
> > > > +             }
> > > > +     }
> > > > +
> > > > +     if (matches =3D=3D 0)
> > > > +             /* Nothing matched the filter */
> > > > +             ret =3D -ENOENT;
> > > > +     else if (successes =3D=3D 0)
> > > > +             /* Items matched, but were already in the requested s=
tate */
> > > > +             ret =3D -EINVAL;
> > >
> > > Why do we return -EINVAL in this path?
> > > -EINVAL can mislead users into thinking their arguments are wrong.
> > > That's not the case; the trace request they want is already active.
> > > Maybe -EEXIST ?
> >
> > Or even 0 since the configuration already matches what the user request=
ed.
> >
> Ack, will modify in v2.
> > >
> > > Thanks
> > > Best Regards
> > > Hao
> > >
> > > > +     else
> > > > +             ret =3D 0;
> > > > +
> > > > +     codetag_unlock_module_list(alloc_tag_cttype);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  /*
> > > >   * Entry point ioctl function for /proc/allocinfo routing requests=
 to fetch the
> > > >   * layout content ID, seek to a specific tag, or read sequential t=
ags.
> > > > @@ -464,6 +548,9 @@ static long allocinfo_ioctl(struct file *file, =
unsigned int cmd,
> > > >       case ALLOCINFO_IOC_GET_NEXT:
> > > >               ret =3D allocinfo_ioctl_get_next(file->private_data, =
arg);
> > > >               break;
> > > > +     case ALLOCINFO_IOC_TOGGLE_TRACE:
> > > > +             ret =3D allocinfo_ioctl_toggle_trace(file->private_da=
ta, arg);
> > > > +             break;
> > > >       default:
> > > >               ret =3D -ENOIOCTLCMD;
> > > >               break;
> > > > @@ -493,8 +580,6 @@ static const struct proc_ops allocinfo_proc_ops=
 =3D {
> > > >
> > > >  void __alloc_tag_trace_hit(struct alloc_tag *tag)
> > > >  {
> > > > -     if (unlikely(!tag))
> > > > -             return;
> > > >       trace_alloc_tag_hit(tag);
> > > >  }
> > > >  EXPORT_SYMBOL(__alloc_tag_trace_hit);
> > > > @@ -1043,6 +1128,24 @@ static int load_module(struct module *mod, s=
truct codetag *start, struct codetag
> > > >       return 0;
> > > >  }
> > > >
> > > > +static void unload_module(struct module *mod, struct codetag *star=
t, struct codetag *stop)
> > > > +{
> > > > +     struct alloc_tag *start_tag =3D ct_to_alloc_tag(start);
> > > > +     struct alloc_tag *stop_tag =3D ct_to_alloc_tag(stop);
> > > > +     struct alloc_tag *tag;
> > > > +
> > > > +     /*
> > > > +      * Turn tracing off for the tags of the module being unloaded=
. Without
> > > > +      * this, `alloc_tag_trace_cnt` would never reach zero and tra=
cing would
> > > > +      * stay enabled forever.
> > > > +      *
> > > > +      * `alloc_tag_trace_mutex` is not needed here as this code pa=
th is
> > > > +      * protected by a `down_write(&cttype->mod_lock)`.
> > > > +      */
> > > > +     for (tag =3D start_tag; tag < stop_tag; tag++)
> > > > +             alloc_tag_trace_toggle(tag, false);
> > > > +}
> > > > +
> > > >  static void replace_module(struct module *mod, struct module *new_=
mod)
> > > >  {
> > > >       MA_STATE(mas, &mod_area_mt, 0, module_tags.size);
> > > > @@ -1369,6 +1472,7 @@ static int __init alloc_tag_init(void)
> > > >               .alloc_section_mem      =3D reserve_module_tags,
> > > >               .free_section_mem       =3D release_module_tags,
> > > >               .module_load            =3D load_module,
> > > > +             .module_unload          =3D unload_module,
> > > >               .module_replaced        =3D replace_module,
> > > >  #endif
> > > >       };
