Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFD340A7F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790734184; cv=pass; b=HIXeM5XxAvW/H8hWQB4/p6UNQiHfWGgu7AA45pxDVgyvb6+3Zs7VRUYfCzxd1Orku4aESNulbBOpHXzxZcre6lacmpXRafZFS5V3/tqU+0KeAuhXWTPsxuRp3nN2TlZwWyKHfZTMRJuX+fgF0t3SsSi23gNkR5aHyU43fSJAW34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790734184; c=relaxed/simple;
	bh=i8oqo05OXq+psP0UUhK9jPbzsk/S2w8aEz0BY7MvHa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAc24clGpmoa/pX7MBy+Yv19s6T3HB/OWBzWFr4+WTnEWnBdRFGyvZU8Wa8C/FfyQ82R1C2bSdf0s0CzQDSwlqCUAJdEVbrHST+iF7lPe/zfXLdBu+I84dYExoyQ4uCfVOaiCubOg+U7MdMakyAUpvb0UB9nZ12ZYFD+t9atZIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iyOah8Rw; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iyOah8Rw"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53328262efbso132811cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790734181; cv=none;
        d=google.com; s=arc-20260327;
        b=C5NxWKwSehevjevf3TJMjwSWjoxruDEiBoiPt7r4o3zrwuTSynvXfjdwm8WuQy+MQ0
         EQceTGrdCEd4kI8KudL+HC+8Ie9gePsUEme0sH4S8oxKm06TSNupTu10UfyPHEsvb3N4
         o5hJhPGtSfS6YP4hNsf1lpm1vQOznJ0gPis+t7DU3INJauZ6BA7713EKeM2rWY0Z3v7y
         7FsHTyJoKaTnsvOSPpphSt9rOE8wtldA8hVVdVlWPTSUjVW+mjQO7JYyraJsnu1yHApO
         NqLqRoIJGRoWiFotQfwLeY0E9b5GVRp0XRYxPV9cRCZrsa3zBHqZjcnB1ELFANrtwRl5
         mG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bnXc90n36ZIr4au7lhU3XU/h1VRC1NVUGpl8Sh2Wm8=;
        fh=ONK+HKTWE7admcknIWH4jWu3q47e1X5pVYZpQUhgExo=;
        b=jv6oDiZ0GmmUQ0hu+UaYaCinvouUsEDImCfvy8DcyKHfXwW/OEyMXLcjY79dL8tL70
         rZ7TtL9DiXSCr3f9JoeGV7f7NyXFgAsGW0TFU7VBpEsqMb6dkIS0JN1VB0a3d6ZXmpX3
         ZLPgj3o1aIJF1f6mp0OV3QL1f1KzQFNelCS7/HbZcFCC8nnZ/KNHgXoF7oc3ivcoYaqC
         qVvSnn6v4MgtMPQ9l5GL50MbSelPEt9xQnKtQAVdbb0wUsc2FuaKO0XqsWIOnw3V2p1c
         8zVvEnBIXSFkWyngBYefkTfQNNmZ/AJyISQdhL9zO0O/lsIucPPxgrx/ActJDifIk4+Q
         GxlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790734181; x=1791338981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bnXc90n36ZIr4au7lhU3XU/h1VRC1NVUGpl8Sh2Wm8=;
        b=iyOah8RwndxVdWDBEF2VFJUAeWckSRfY+qfcDbohbz7ORTG2+pBTjuyHEAJxJuwehp
         tIOasZj6bFtz4Tim3snj34qX7uUCqS80iv677sYi6eLrDOOhplnbGFIIAIVXXhJDVyiV
         p919TWQAEkQYIt2JXUDZh2GELjlwwSAmh5rsQDPGm+trmCvW5ICmSocY2TASAHB/SnpI
         ufVb0evgdGL9uqk3A8hBdmdQbI6K1nZMDBTuuMnz0kgMvnmrxR8hoz8+M6b8RXbtsECe
         dNI1BnmLjufkDTHt6kOKYJN3xihBaQBkWk2StGnCmaKWz9Hh7V290MLWu4f0jl3muZ0j
         9rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790734181; x=1791338981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bnXc90n36ZIr4au7lhU3XU/h1VRC1NVUGpl8Sh2Wm8=;
        b=EDpVsfDNDJFR4ayAUPsVorr2Hzq7pxLfQJwsKubyNQhTeFuTCb98W2hMmBb9DaAqT7
         rVtHl8tHlW6qV+QrLzLa3v+WVS7h1HBXeBYp5TOGdVjgyye2xM37Z5Gzyc7v5iuq8AZi
         HLtL/o88AOMbkUEccstKEcT6WhaMa2vJiXK1KQSukWUMJLoc/cuX5pGABg/e22in+XgR
         ONnRjRe2f1kF/VrOMjxRnpvDo5F6jyfkqTcqoqsY1AIia6o3Ob6GV/rW1jukuM9s6y3c
         P1G0YRIvOkXWbaScyyIuDqMKa9cTDno5guG8PHZZOdzJm0EOtoSjXDuSVsZZJtA9b6Fj
         r7hg==
X-Forwarded-Encrypted: i=1; AKwUvBzsvnI5qeqGvsKILbRwTatpSt319+FIxSSD5e4dtjFdKBzhUS/5B915dgtOSp7Y5S8sRfSq1lnteRPFBK0=@vger.kernel.org
X-Gm-Message-State: AFuF++n1j59znaa2NU+GOMtxtdKrHg2nYmLoY9zDAdA8K+nzsJnihlkE
	sh65QrUdGm7eBgjZiyM0tAWDZGHybXqBh6LSWhhVbtkr0OlY/ovpZqxx3djdOGPz7fk3gOd3ef9
	8tNOIAJwfHyFuw/FAbunnB40iPCq33dyvMzB3OV9j
X-Gm-Gg: AYBFou3OQGhwBnpVB8MhN24EuO06vLrjPDSN6k51mxvIhg0gjwv9c/Xl/I625ixh3K7
	IGR+nLNhp6N3+HReWJqEhY4ysGAxta9hmjz3jyA4fqbYm96Px9LbleYK3cZFCJw8pywubGRltER
	CnxKpuT2Q0YF1j+gDvGhIiGFyqsHLyyvsyih5wAmmdZrGwQu6HMwXIB3fWJBOnDMpcYYtWEcpWL
	CYFWXp2d1pf7SCtiFH1q6mqlNqABAFZIWvOhHv/0OybigOmlP0PB/W7Sul82DApnxc31aqElrDw
	N4baXI+/x5WCGmqnpZJY/EJCGRyJ2luDeYL+1vLOXpQHWghAaKDqX40XRXSLlGTxEiTKv9yv/xw
	O8jZq1Vc=
X-Received: by 2002:a05:622a:1b8e:b0:532:858d:e791 with SMTP id
 d75a77b69052e-533741135dbmr679911cf.8.1790734180537; Tue, 29 Sep 2026
 19:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790025465.git.abhishekbapat@google.com>
 <95bf63d2b9ef14f6610d6543b6892d266e4dc5c6.1790025465.git.abhishekbapat@google.com>
 <0e2db0a0-663e-45fc-b073-126b8e80b625@linux.dev> <CAJuCfpFXky7Rj5ghPXGuL59PtG-cmXQywK3ttOHWx_v-pSSN9w@mail.gmail.com>
 <CAL41Mv5REKRLUwSZ9ViTKpBwtEEaE-A3VOK-A0pDTORVNQjeVg@mail.gmail.com> <CAL41Mv6aGMHPyATA9h1dY_cThXW9PyKQsVdLCaNXOBsQKv9_Qw@mail.gmail.com>
In-Reply-To: <CAL41Mv6aGMHPyATA9h1dY_cThXW9PyKQsVdLCaNXOBsQKv9_Qw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 30 Sep 2026 02:09:29 +0000
X-Gm-Features: AclHuK-H5IaGn1Jz87Ij4Vf-NWvu4hsgwRsxJg7vN0btxVQq4HPUJqSYakTiQ8I
Message-ID: <CAJuCfpGZoCz1c29hM6puPVtVmkypcPL97dmGyQoLpP4yN_aegw@mail.gmail.com>
Subject: Re: [PATCH 2/4] alloc_tag: Introduce IOCTLs to toggle allocation tracepoints
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:28=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> On Fri, Sep 25, 2026 at 2:25=E2=80=AFPM Abhishek Bapat <abhishekbapat@goo=
gle.com> wrote:
> >
> > On Thu, Sep 24, 2026 at 11:18=E2=80=AFPM Suren Baghdasaryan <surenb@goo=
gle.com> wrote:
> > >
> > > On Thu, Sep 24, 2026 at 1:16=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wro=
te:
> > > >
> > > > Hi Abhishek
> > > >
> > > > On 2026/9/22 05:26, Abhishek Bapat wrote:
> > > > > Introduce a new IOCTL (`ALLOCINFO_IOC_TOGGLE_TRACE`) to selective=
ly
> > > > > toggle tracing on exact allocation call sites. Userspace tools ca=
n
> > > > > use the existing filtering mechanism to specify the set of tags t=
o
> > > > > toggle tracing for.
> > > > >
> > > > > To facilitate low overhead execution for non-targeted call sites,=
 add a
> > > > > new `CODETAG_FLAG_TRACE_ON` flag to `struct codetag` to track per=
-site
> > > > > activation. Protect these conditional branch evaluations using a =
global
> > > > > `alloc_tag_trace_key` static branch and an inline static key chec=
k
> > > > > pattern in the allocator hooks (`alloc_tag_add`, `alloc_tag_sub`,=
 etc).
> > > > > This ensures that the trace events are entirely skipped when no
> > > > > allocation call sites are being actively traced, leaving only a N=
OP on
> > > > > the allocation fast path.
> > > > >
> > > > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > > > ---
> > > > >  include/linux/alloc_tag.h      |  39 ++++++++----
> > > > >  include/linux/codetag.h        |   5 +-
> > > > >  include/uapi/linux/alloc_tag.h |   9 +++
> > > > >  mm/alloc_tag.c                 | 110 +++++++++++++++++++++++++++=
+++++-
> > > > >  4 files changed, 147 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.=
h
> > > > > index 2994934cf44a..dc86f8997476 100644
> > > > > --- a/include/linux/alloc_tag.h
> > > > > +++ b/include/linux/alloc_tag.h
> > > > > @@ -136,9 +136,36 @@ static inline bool mem_alloc_profiling_enabl=
ed(void)
> > > > >                                  &mem_alloc_profiling_key);
> > > > >  }
> > > > >
> > > > > +static inline void alloc_tag_set_inaccurate(struct alloc_tag *ta=
g)
> > > > > +{
> > > > > +     atomic_or(CODETAG_FLAG_INACCURATE, &tag->ct.flags);
> > > > > +}
> > > > > +
> > > > > +static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag=
)
> > > > > +{
> > > > > +     return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_INACCU=
RATE);
> > > > > +}
> > > > > +
> > > > > +static inline void alloc_tag_set_traced(struct alloc_tag *tag)
> > > > > +{
> > > > > +     atomic_or(CODETAG_FLAG_TRACE_ON, &tag->ct.flags);
> > > > > +}
> > > > > +
> > > > > +static inline void alloc_tag_clear_traced(struct alloc_tag *tag)
> > > > > +{
> > > > > +     atomic_andnot(CODETAG_FLAG_TRACE_ON, &tag->ct.flags);
> > > > > +}
> > > > > +
> > > > > +static inline bool alloc_tag_is_traced(const struct alloc_tag *t=
ag)
> > > > > +{
> > > > > +     return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_TRACE_=
ON);
> > > > > +}
> > > > > +
> > > > >  static inline bool alloc_tag_trace_enabled(const struct alloc_ta=
g *tag)
> > > > >  {
> > > > > -     return static_branch_unlikely(&alloc_tag_trace_key);
> > > > > +     if (static_branch_unlikely(&alloc_tag_trace_key))
> > > > > +             return tag && alloc_tag_is_traced(tag);
> > > > > +     return false;
> > > > >  }
> > > > >
> > > > >  void alloc_tag_trace_mem_alloc(union codetag_ref *ref, struct al=
loc_tag *tag,
> > > > > @@ -255,16 +282,6 @@ static inline void alloc_tag_sub(union codet=
ag_ref *ref, size_t bytes)
> > > > >       ref->ct =3D NULL;
> > > > >  }
> > > > >
> > > > > -static inline void alloc_tag_set_inaccurate(struct alloc_tag *ta=
g)
> > > > > -{
> > > > > -     tag->ct.flags |=3D CODETAG_FLAG_INACCURATE;
> > > > > -}
> > > > > -
> > > > > -static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag=
)
> > > > > -{
> > > > > -     return !!(tag->ct.flags & CODETAG_FLAG_INACCURATE);
> > > > > -}
> > > > > -
> > > > >  #define alloc_tag_record(p)  ((p) =3D current->alloc_tag)
> > > > >
> > > > >  #else /* CONFIG_MEM_ALLOC_PROFILING */
> > > > > diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> > > > > index a25a085c2df1..f728295d50c0 100644
> > > > > --- a/include/linux/codetag.h
> > > > > +++ b/include/linux/codetag.h
> > > > > @@ -18,6 +18,7 @@ struct module;
> > > > >
> > > > >  /* codetag flags */
> > > > >  #define CODETAG_FLAG_INACCURATE      (1 << 0)
> > > > > +#define CODETAG_FLAG_TRACE_ON        (1 << 1)
> > > > >
> > > > >  /*
> > > > >   * An instance of this structure is created in a special ELF sec=
tion at every
> > > > > @@ -25,7 +26,7 @@ struct module;
> > > > >   * an array of these.
> > > > >   */
> > > > >  struct codetag {
> > > > > -     unsigned int flags;
> > > > > +     atomic_t flags;
> > > > >       unsigned int lineno;
> > > > >       const char *modname;
> > > > >       const char *function;
> > > > > @@ -71,7 +72,7 @@ struct codetag_iterator {
> > > > >       .function       =3D __func__,                     \
> > > > >       .filename       =3D __FILE__,                     \
> > > > >       .lineno         =3D __LINE__,                     \
> > > > > -     .flags          =3D 0,                            \
> > > > > +     .flags          =3D ATOMIC_INIT(0),               \
> > > > >  }
> > > > >
> > > > >  void codetag_lock_module_list(struct codetag_type *cttype);
> > > > > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/=
alloc_tag.h
> > > > > index 7d4618bea043..069ab8341e87 100644
> > > > > --- a/include/uapi/linux/alloc_tag.h
> > > > > +++ b/include/uapi/linux/alloc_tag.h
> > > > > @@ -85,9 +85,16 @@ struct allocinfo_get_at {
> > > > >       struct allocinfo_tag_data data;
> > > > >  };
> > > > >
> > > > > +struct allocinfo_toggle_traces {
> > > > > +     /* inputs */
> > > > > +     struct allocinfo_tag fields;
> > > > > +     __u64 enable;
> > > > > +};
> > > > > +
> > > > >  #define _ALLOCINFO_IOC_CONTENT_ID    0
> > > > >  #define _ALLOCINFO_IOC_GET_AT                1
> > > > >  #define _ALLOCINFO_IOC_GET_NEXT              2
> > > > > +#define _ALLOCINFO_IOC_TOGGLE_TRACE  3
> > > > >
> > > > >  #define ALLOCINFO_IOC_BASE           0xA6
> > > > >  #define ALLOCINFO_IOC_CONTENT_ID     _IOR(ALLOCINFO_IOC_BASE, _A=
LLOCINFO_IOC_CONTENT_ID,     \
> > > > > @@ -96,5 +103,7 @@ struct allocinfo_get_at {
> > > > >                                             struct allocinfo_get_=
at)
> > > > >  #define ALLOCINFO_IOC_GET_NEXT               _IOR(ALLOCINFO_IOC_=
BASE, _ALLOCINFO_IOC_GET_NEXT,       \
> > > > >                                            struct allocinfo_tag_d=
ata)
> > > > > +#define ALLOCINFO_IOC_TOGGLE_TRACE   _IOW(ALLOCINFO_IOC_BASE, _A=
LLOCINFO_IOC_TOGGLE_TRACE,   \
> > > > > +                                         struct allocinfo_toggle=
_traces)
> > > > >
> > > > >  #endif /* _UAPI_ALLOC_TAG_H */
> > > > > diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > > > > index a5339767efd5..fb179321a2a1 100644
> > > > > --- a/mm/alloc_tag.c
> > > > > +++ b/mm/alloc_tag.c
> > > > > @@ -61,6 +61,15 @@ DEFINE_STATIC_KEY_FALSE(mem_profiling_compress=
ed);
> > > > >  DEFINE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> > > > >  EXPORT_SYMBOL(alloc_tag_trace_key);
> > > > >
> > > > > +static atomic_t alloc_tag_trace_cnt =3D ATOMIC_INIT(0);
> > > > > +
> > > > > +/*
> > > > > + * As `codetag_lock_module_list` is a read lock, we need an addi=
tional mutex
> > > > > + * to protect against the race conditions involved in the alloc =
tag trace
> > > > > + * toggle path.
> > > > > + */
> > > > > +static DEFINE_MUTEX(alloc_tag_trace_mutex);
> > > > > +
> > > > >  struct alloc_tag_kernel_section kernel_tags =3D { NULL, 0 };
> > > > >  unsigned long alloc_tag_ref_mask;
> > > > >  int alloc_tag_ref_offs;
> > > > > @@ -297,7 +306,7 @@ static bool matches_filter(struct codetag *ct=
, struct allocinfo_filter *filter,
> > > > >               return false;
> > > > >
> > > > >       if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> > > > > -             inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURA=
TE);
> > > > > +             inaccurate =3D alloc_tag_is_inaccurate(ct_to_alloc_=
tag(ct));
> > > > >               if (inaccurate !=3D !!(filter->inaccurate))
> > > > >                       return false;
> > > > >       }
> > > > > @@ -444,6 +453,81 @@ static int allocinfo_ioctl_get_next(struct s=
eq_file *m, void __user *arg)
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > +static bool alloc_tag_trace_toggle(struct alloc_tag *tag, bool e=
nable)
> > > > > +{
> > > > > +     if (enable) {
> > > > > +             if (alloc_tag_is_traced(tag))
> > > > > +                     return false;
> > > > > +
> > > > > +             alloc_tag_set_traced(tag);
> > > > > +             if (atomic_fetch_inc(&alloc_tag_trace_cnt) =3D=3D 0=
)
> > > > > +                     static_branch_enable(&alloc_tag_trace_key);
> > > > > +     } else {
> > > > > +             if (!alloc_tag_is_traced(tag))
> > > > > +                     return false;
> > > > > +
> > > > > +             alloc_tag_clear_traced(tag);
> > > > > +             if (atomic_dec_and_test(&alloc_tag_trace_cnt))
> > > > > +                     static_branch_disable(&alloc_tag_trace_key)=
;
> > > > > +     }
> > > > > +
> > > > > +     return true;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * Toggles context capture for a specified allocation.
> > > > > + */
> > > > > +static int allocinfo_ioctl_toggle_trace(struct seq_file *m, void=
 __user *arg)
> > > > > +{
> > > > > +     struct allocinfo_toggle_traces params;
> > > > > +     struct codetag_iterator iter;
> > > > > +     struct codetag *ct;
> > > > > +     int matches =3D 0, successes =3D 0, ret;
> > > > > +
> > > > > +     if (!capable(CAP_SYS_ADMIN))
> > > > > +             return -EPERM;
> > > > > +
> > > > > +     if (copy_from_user(&params, arg, sizeof(params)))
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     codetag_lock_module_list(alloc_tag_cttype);
> > > > > +
> > > > > +     struct allocinfo_filter filter =3D {
> > > > > +             .mask =3D ALLOCINFO_FILTER_MASK_MODNAME |
> > > > > +                    ALLOCINFO_FILTER_MASK_FUNCTION |
> > > > > +                    ALLOCINFO_FILTER_MASK_FILENAME |
> > > > > +                    ALLOCINFO_FILTER_MASK_LINENO,
> > > > > +             .fields =3D params.fields,
> > > > > +     };
>
> Also Suren, I wanted to get your thoughts on this filter. Here, these
> filters ensure that only one allocation site matches the user's
> request. Should I remove the masks here so the user can choose to
> toggle tracing on multiple allocation sites in one IOCTL?

Absolutely. I see no reason why we should not support enabling tracing
for multiple tags.

>
> > > > > +
> > > > > +     iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > > > > +
> > > > > +     /* Toggle tracing on all codetags that match */
> > > > > +     while ((ct =3D codetag_next_ct(&iter))) {
> > > > > +             if (matches_filter(ct, &filter, NULL, NULL)) {
> > > > > +                     matches++;
> > > > > +
> > > > > +                     mutex_lock(&alloc_tag_trace_mutex);
> > > > > +                     if (alloc_tag_trace_toggle(ct_to_alloc_tag(=
ct), !!params.enable))
> > > > > +                             successes++;
> > > > > +                     mutex_unlock(&alloc_tag_trace_mutex);
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     if (matches =3D=3D 0)
> > > > > +             /* Nothing matched the filter */
> > > > > +             ret =3D -ENOENT;
> > > > > +     else if (successes =3D=3D 0)
> > > > > +             /* Items matched, but were already in the requested=
 state */
> > > > > +             ret =3D -EINVAL;
> > > >
> > > > Why do we return -EINVAL in this path?
> > > > -EINVAL can mislead users into thinking their arguments are wrong.
> > > > That's not the case; the trace request they want is already active.
> > > > Maybe -EEXIST ?
> > >
> > > Or even 0 since the configuration already matches what the user reque=
sted.
> > >
> > Ack, will modify in v2.
> > > >
> > > > Thanks
> > > > Best Regards
> > > > Hao
> > > >
> > > > > +     else
> > > > > +             ret =3D 0;
> > > > > +
> > > > > +     codetag_unlock_module_list(alloc_tag_cttype);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > >  /*
> > > > >   * Entry point ioctl function for /proc/allocinfo routing reques=
ts to fetch the
> > > > >   * layout content ID, seek to a specific tag, or read sequential=
 tags.
> > > > > @@ -464,6 +548,9 @@ static long allocinfo_ioctl(struct file *file=
, unsigned int cmd,
> > > > >       case ALLOCINFO_IOC_GET_NEXT:
> > > > >               ret =3D allocinfo_ioctl_get_next(file->private_data=
, arg);
> > > > >               break;
> > > > > +     case ALLOCINFO_IOC_TOGGLE_TRACE:
> > > > > +             ret =3D allocinfo_ioctl_toggle_trace(file->private_=
data, arg);
> > > > > +             break;
> > > > >       default:
> > > > >               ret =3D -ENOIOCTLCMD;
> > > > >               break;
> > > > > @@ -493,8 +580,6 @@ static const struct proc_ops allocinfo_proc_o=
ps =3D {
> > > > >
> > > > >  void __alloc_tag_trace_hit(struct alloc_tag *tag)
> > > > >  {
> > > > > -     if (unlikely(!tag))
> > > > > -             return;
> > > > >       trace_alloc_tag_hit(tag);
> > > > >  }
> > > > >  EXPORT_SYMBOL(__alloc_tag_trace_hit);
> > > > > @@ -1043,6 +1128,24 @@ static int load_module(struct module *mod,=
 struct codetag *start, struct codetag
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > +static void unload_module(struct module *mod, struct codetag *st=
art, struct codetag *stop)
> > > > > +{
> > > > > +     struct alloc_tag *start_tag =3D ct_to_alloc_tag(start);
> > > > > +     struct alloc_tag *stop_tag =3D ct_to_alloc_tag(stop);
> > > > > +     struct alloc_tag *tag;
> > > > > +
> > > > > +     /*
> > > > > +      * Turn tracing off for the tags of the module being unload=
ed. Without
> > > > > +      * this, `alloc_tag_trace_cnt` would never reach zero and t=
racing would
> > > > > +      * stay enabled forever.
> > > > > +      *
> > > > > +      * `alloc_tag_trace_mutex` is not needed here as this code =
path is
> > > > > +      * protected by a `down_write(&cttype->mod_lock)`.
> > > > > +      */
> > > > > +     for (tag =3D start_tag; tag < stop_tag; tag++)
> > > > > +             alloc_tag_trace_toggle(tag, false);
> > > > > +}
> > > > > +
> > > > >  static void replace_module(struct module *mod, struct module *ne=
w_mod)
> > > > >  {
> > > > >       MA_STATE(mas, &mod_area_mt, 0, module_tags.size);
> > > > > @@ -1369,6 +1472,7 @@ static int __init alloc_tag_init(void)
> > > > >               .alloc_section_mem      =3D reserve_module_tags,
> > > > >               .free_section_mem       =3D release_module_tags,
> > > > >               .module_load            =3D load_module,
> > > > > +             .module_unload          =3D unload_module,
> > > > >               .module_replaced        =3D replace_module,
> > > > >  #endif
> > > > >       };
