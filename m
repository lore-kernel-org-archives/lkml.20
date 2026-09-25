Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C8360EC3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317140; cv=pass; b=oOHkMmWi7gL9W5CrHXuk4BS0yDAs0ElNbNXDqv41OTBDTxWG8aOyijYqO7RnHV3++ZaUiZ66eG4GBdJfpdHEu9JF87vFmLXFF0sV843nZFZ5fN2KhpM32BKYM56VTml1GAxXeP98yeF8kxofFJ4vm4PO4HJzGXM403VHXCk/x7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317140; c=relaxed/simple;
	bh=n6HLh0CFfAs2ryup96GyxlI4RIC98UjQgtemrPDa+FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKrXASJwA1Qz+iMaUSGDPiU+wTTUE7Am/8bZ3m1lQjxwUIIR2+qR8rw+nwSJNU8NmtTN6tOIwTyUbCu3WSoZbL6h4ockxm4+bqVFqkzfnhWvvTsYlgAsWno+Ol3pbBaqxGxJQ/S6XcR8nxH0A7kpvtPQwLRRv9TDuMJsKbMvxl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k0E6Yw3/; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k0E6Yw3/"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-530e8c6fb80so124031cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790317138; cv=none;
        d=google.com; s=arc-20260327;
        b=gKYl/gOlha/4At+ajTDmgEYH8AoOz3eY8UqzixOPqFvrIzeSAcVhhL6N5EtdomjcAz
         rP/zizCyVbqJ5P2CyS/l7Pe/kAGx4x28haYoBwFq15EZa86MQu+I6ZhI5kfxRlqYifdZ
         3lzVdMgELb4LzrgZDimtT1cLjBT0Qcii3e78MsR8bepHxE4NAc5dF0swMhzlLfqxNJVZ
         HrPi7G5W2jvCjXglWJX9dVq2T6vzyUcjlD9ULXA1FPrXhHMsL7ONjkeGTq/aSEn1+Ld4
         yhC6Vymf//1FZu/LLIi+Sg6gN1WX35PWrSycClZuC57PFc2oCneFGBfC0pGabrp6FAf5
         OXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kz9tB2z3S3sCyejswcJCnUBTJ7VXWxVMWAfpYTY4kkk=;
        fh=Ae53gJE/iwzpdU8XZpn6qk3xeCEB8NER9TElyX8Zjb8=;
        b=O8mYhH5EWz6h/azNR5ggVcwW+yy1qJzyM8FcUW4G1QEV/HarxMwBJ8+6zibT9dW3ce
         s/bI3Ah0vv9BsWYgZdTBMhSgG3j3XZMWQKT/ecEVTjj1xtXOgmB5xM+rmFcF//LNrJkB
         P28bzMyUvCLeJ6d22Qxjx/fSbF6LOZ3e5vHHuoibFTzvAYS31VFuIRGjYsw69ndds1pj
         Y4nrF5/6O+hGfV+fRkz4MW/TF7q+zdp1iJR5XLeFtNYuqtKPdGC5JaucjMIKOYOs3Jil
         p1G1XWlge4icDZF31ZmPpDgrRfIwQUcBv7JIMCUnpPfby3TpLH3df0ZR0Q0wOJvX9B4L
         eQaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790317138; x=1790921938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kz9tB2z3S3sCyejswcJCnUBTJ7VXWxVMWAfpYTY4kkk=;
        b=k0E6Yw3/0D7Sc46KYc5fOmGGQBfwaEpOhT4O3rkyIL3BXwo+SLKUuDS6rcxFRmXllR
         KdoCkmDuK4oZ/MNwvSzHTLh9SJEGYRKO/RxyEdsWFnUIwSWv3i3TkVUGU7Lgv/RgAmpz
         lgfXvqp3lflMwvV7UeQcRD4W1F4NViqIK1trBZXcEnz0DNtuOaqAJU5EApuwFzRiNUyU
         oaY+ZZE1z5WBvxW5Se6cuKeqjVoNT4XwxCz2JPRMRFmzRhBm4snOgRe0JlC5KobARSRx
         MGet0hiMaWQjzuxjOZ3ml8xuSMXyPk/QS3KTq2Za1Om6yhPyor7vN5nNMCVauGf/CEfs
         AVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790317138; x=1790921938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kz9tB2z3S3sCyejswcJCnUBTJ7VXWxVMWAfpYTY4kkk=;
        b=NM2zvDYBfQZvBDeKv2cS4eqWmopBJU/uTN4vUga/KEJoL/HfIh10buPD6RSuLsCCaE
         Duc6HICnwo422y+dEwcF12Jv2KiAx5+bsamZYXE++T4FfJ40ZldBiiY777x1LkBlmeIp
         acCEnkw2TDX7GxCkXd1QFrgzBPng7wYFAYSy+LDhuvStREOedYRKa3qU9eshT/Nrdbc3
         vrFbjoLbLMc+Jwo73xntD4zMoK26ZxImHR+EnJbLYUPT2zqeP6v42s7CBUwtQrg6ihGa
         qcoIJo9u3ZppVxQZGB+bauIRyFY9NWCQZUD01Fvs/f66z3U7Dfzs1razaU89qozClUm6
         qo0A==
X-Forwarded-Encrypted: i=1; AKwUvBxRtCUZEN4X+1EAivoiNSmxzKwJZmYdJYDCURCDXAWUOY0PRxg30v11GzaQi9kwYNpxn/NoLAPd9fxzCXk=@vger.kernel.org
X-Gm-Message-State: AFuF++nHXzwiy5OJ21bs2L8LqdCWSDonG0RlquyppEx1/M7k5FLDy5NA
	D/WmoPrUVTYHlTOWGPcDF9NPD/ZYwSwiDozGpDxq0AaJiVUOwhAdDszD7fYa4CYX45Spss1fXx0
	7e73vcjvThOqgfD9RqbEz+p2e8sQU1b0Lcs2nVWT1
X-Gm-Gg: AYBFou38tJiX6Fxxf8fmQdRLx5uqWBA2WTfntgYPMMqMtkg8vypfAk8Cm73Taoe5V2+
	zp7sE5YsjiTNGtAO6IWieQu4NEkyu1Ve+D6XOD3DKKu1ShpIKZeIsWgEP9Yy5SsUgYNqcXrPoAU
	y2fL9IJW4diL5z5WtAStjFQh7bUpjX/FYDZGzT3BFQ98Y2GxjcXWc998Dv+2ZpxnchZXCMmhNd0
	dVyQS5Vh2g8LaUk382do0yRQ6qQdh4G7o5AcZwmS1iD3JrO9WO2HZt7DKxTR6Qb/ByEaQ3tB2rO
	drQ4MMwraOUbSF6w6U3LnGFJcLf2jCV8UzDFVUVJTvm3JNNAsuG1LA==
X-Received: by 2002:a05:622a:d3:b0:532:c8ca:5ae9 with SMTP id
 d75a77b69052e-5330e14c38bmr7182801cf.11.1790317137111; Thu, 24 Sep 2026
 23:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790025465.git.abhishekbapat@google.com>
 <95bf63d2b9ef14f6610d6543b6892d266e4dc5c6.1790025465.git.abhishekbapat@google.com>
 <0e2db0a0-663e-45fc-b073-126b8e80b625@linux.dev>
In-Reply-To: <0e2db0a0-663e-45fc-b073-126b8e80b625@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 24 Sep 2026 23:18:45 -0700
X-Gm-Features: AclHuK_ZMIjs94XXM1H9Vt6cVAryVPQqpcapIKbaCuH8lPzF3a3BVfOmnnxKix8
Message-ID: <CAJuCfpFXky7Rj5ghPXGuL59PtG-cmXQywK3ttOHWx_v-pSSN9w@mail.gmail.com>
Subject: Re: [PATCH 2/4] alloc_tag: Introduce IOCTLs to toggle allocation tracepoints
To: Hao Ge <hao.ge@linux.dev>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 1:16=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
> On 2026/9/22 05:26, Abhishek Bapat wrote:
> > Introduce a new IOCTL (`ALLOCINFO_IOC_TOGGLE_TRACE`) to selectively
> > toggle tracing on exact allocation call sites. Userspace tools can
> > use the existing filtering mechanism to specify the set of tags to
> > toggle tracing for.
> >
> > To facilitate low overhead execution for non-targeted call sites, add a
> > new `CODETAG_FLAG_TRACE_ON` flag to `struct codetag` to track per-site
> > activation. Protect these conditional branch evaluations using a global
> > `alloc_tag_trace_key` static branch and an inline static key check
> > pattern in the allocator hooks (`alloc_tag_add`, `alloc_tag_sub`, etc).
> > This ensures that the trace events are entirely skipped when no
> > allocation call sites are being actively traced, leaving only a NOP on
> > the allocation fast path.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >  include/linux/alloc_tag.h      |  39 ++++++++----
> >  include/linux/codetag.h        |   5 +-
> >  include/uapi/linux/alloc_tag.h |   9 +++
> >  mm/alloc_tag.c                 | 110 ++++++++++++++++++++++++++++++++-
> >  4 files changed, 147 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> > index 2994934cf44a..dc86f8997476 100644
> > --- a/include/linux/alloc_tag.h
> > +++ b/include/linux/alloc_tag.h
> > @@ -136,9 +136,36 @@ static inline bool mem_alloc_profiling_enabled(voi=
d)
> >                                  &mem_alloc_profiling_key);
> >  }
> >
> > +static inline void alloc_tag_set_inaccurate(struct alloc_tag *tag)
> > +{
> > +     atomic_or(CODETAG_FLAG_INACCURATE, &tag->ct.flags);
> > +}
> > +
> > +static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag)
> > +{
> > +     return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_INACCURATE);
> > +}
> > +
> > +static inline void alloc_tag_set_traced(struct alloc_tag *tag)
> > +{
> > +     atomic_or(CODETAG_FLAG_TRACE_ON, &tag->ct.flags);
> > +}
> > +
> > +static inline void alloc_tag_clear_traced(struct alloc_tag *tag)
> > +{
> > +     atomic_andnot(CODETAG_FLAG_TRACE_ON, &tag->ct.flags);
> > +}
> > +
> > +static inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
> > +{
> > +     return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_TRACE_ON);
> > +}
> > +
> >  static inline bool alloc_tag_trace_enabled(const struct alloc_tag *tag=
)
> >  {
> > -     return static_branch_unlikely(&alloc_tag_trace_key);
> > +     if (static_branch_unlikely(&alloc_tag_trace_key))
> > +             return tag && alloc_tag_is_traced(tag);
> > +     return false;
> >  }
> >
> >  void alloc_tag_trace_mem_alloc(union codetag_ref *ref, struct alloc_ta=
g *tag,
> > @@ -255,16 +282,6 @@ static inline void alloc_tag_sub(union codetag_ref=
 *ref, size_t bytes)
> >       ref->ct =3D NULL;
> >  }
> >
> > -static inline void alloc_tag_set_inaccurate(struct alloc_tag *tag)
> > -{
> > -     tag->ct.flags |=3D CODETAG_FLAG_INACCURATE;
> > -}
> > -
> > -static inline bool alloc_tag_is_inaccurate(struct alloc_tag *tag)
> > -{
> > -     return !!(tag->ct.flags & CODETAG_FLAG_INACCURATE);
> > -}
> > -
> >  #define alloc_tag_record(p)  ((p) =3D current->alloc_tag)
> >
> >  #else /* CONFIG_MEM_ALLOC_PROFILING */
> > diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> > index a25a085c2df1..f728295d50c0 100644
> > --- a/include/linux/codetag.h
> > +++ b/include/linux/codetag.h
> > @@ -18,6 +18,7 @@ struct module;
> >
> >  /* codetag flags */
> >  #define CODETAG_FLAG_INACCURATE      (1 << 0)
> > +#define CODETAG_FLAG_TRACE_ON        (1 << 1)
> >
> >  /*
> >   * An instance of this structure is created in a special ELF section a=
t every
> > @@ -25,7 +26,7 @@ struct module;
> >   * an array of these.
> >   */
> >  struct codetag {
> > -     unsigned int flags;
> > +     atomic_t flags;
> >       unsigned int lineno;
> >       const char *modname;
> >       const char *function;
> > @@ -71,7 +72,7 @@ struct codetag_iterator {
> >       .function       =3D __func__,                     \
> >       .filename       =3D __FILE__,                     \
> >       .lineno         =3D __LINE__,                     \
> > -     .flags          =3D 0,                            \
> > +     .flags          =3D ATOMIC_INIT(0),               \
> >  }
> >
> >  void codetag_lock_module_list(struct codetag_type *cttype);
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > index 7d4618bea043..069ab8341e87 100644
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -85,9 +85,16 @@ struct allocinfo_get_at {
> >       struct allocinfo_tag_data data;
> >  };
> >
> > +struct allocinfo_toggle_traces {
> > +     /* inputs */
> > +     struct allocinfo_tag fields;
> > +     __u64 enable;
> > +};
> > +
> >  #define _ALLOCINFO_IOC_CONTENT_ID    0
> >  #define _ALLOCINFO_IOC_GET_AT                1
> >  #define _ALLOCINFO_IOC_GET_NEXT              2
> > +#define _ALLOCINFO_IOC_TOGGLE_TRACE  3
> >
> >  #define ALLOCINFO_IOC_BASE           0xA6
> >  #define ALLOCINFO_IOC_CONTENT_ID     _IOR(ALLOCINFO_IOC_BASE, _ALLOCIN=
FO_IOC_CONTENT_ID,     \
> > @@ -96,5 +103,7 @@ struct allocinfo_get_at {
> >                                             struct allocinfo_get_at)
> >  #define ALLOCINFO_IOC_GET_NEXT               _IOR(ALLOCINFO_IOC_BASE, =
_ALLOCINFO_IOC_GET_NEXT,       \
> >                                            struct allocinfo_tag_data)
> > +#define ALLOCINFO_IOC_TOGGLE_TRACE   _IOW(ALLOCINFO_IOC_BASE, _ALLOCIN=
FO_IOC_TOGGLE_TRACE,   \
> > +                                         struct allocinfo_toggle_trace=
s)
> >
> >  #endif /* _UAPI_ALLOC_TAG_H */
> > diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> > index a5339767efd5..fb179321a2a1 100644
> > --- a/mm/alloc_tag.c
> > +++ b/mm/alloc_tag.c
> > @@ -61,6 +61,15 @@ DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed);
> >  DEFINE_STATIC_KEY_FALSE(alloc_tag_trace_key);
> >  EXPORT_SYMBOL(alloc_tag_trace_key);
> >
> > +static atomic_t alloc_tag_trace_cnt =3D ATOMIC_INIT(0);
> > +
> > +/*
> > + * As `codetag_lock_module_list` is a read lock, we need an additional=
 mutex
> > + * to protect against the race conditions involved in the alloc tag tr=
ace
> > + * toggle path.
> > + */
> > +static DEFINE_MUTEX(alloc_tag_trace_mutex);
> > +
> >  struct alloc_tag_kernel_section kernel_tags =3D { NULL, 0 };
> >  unsigned long alloc_tag_ref_mask;
> >  int alloc_tag_ref_offs;
> > @@ -297,7 +306,7 @@ static bool matches_filter(struct codetag *ct, stru=
ct allocinfo_filter *filter,
> >               return false;
> >
> >       if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> > -             inaccurate =3D !!(ct->flags & CODETAG_FLAG_INACCURATE);
> > +             inaccurate =3D alloc_tag_is_inaccurate(ct_to_alloc_tag(ct=
));
> >               if (inaccurate !=3D !!(filter->inaccurate))
> >                       return false;
> >       }
> > @@ -444,6 +453,81 @@ static int allocinfo_ioctl_get_next(struct seq_fil=
e *m, void __user *arg)
> >       return ret;
> >  }
> >
> > +static bool alloc_tag_trace_toggle(struct alloc_tag *tag, bool enable)
> > +{
> > +     if (enable) {
> > +             if (alloc_tag_is_traced(tag))
> > +                     return false;
> > +
> > +             alloc_tag_set_traced(tag);
> > +             if (atomic_fetch_inc(&alloc_tag_trace_cnt) =3D=3D 0)
> > +                     static_branch_enable(&alloc_tag_trace_key);
> > +     } else {
> > +             if (!alloc_tag_is_traced(tag))
> > +                     return false;
> > +
> > +             alloc_tag_clear_traced(tag);
> > +             if (atomic_dec_and_test(&alloc_tag_trace_cnt))
> > +                     static_branch_disable(&alloc_tag_trace_key);
> > +     }
> > +
> > +     return true;
> > +}
> > +
> > +/*
> > + * Toggles context capture for a specified allocation.
> > + */
> > +static int allocinfo_ioctl_toggle_trace(struct seq_file *m, void __use=
r *arg)
> > +{
> > +     struct allocinfo_toggle_traces params;
> > +     struct codetag_iterator iter;
> > +     struct codetag *ct;
> > +     int matches =3D 0, successes =3D 0, ret;
> > +
> > +     if (!capable(CAP_SYS_ADMIN))
> > +             return -EPERM;
> > +
> > +     if (copy_from_user(&params, arg, sizeof(params)))
> > +             return -EFAULT;
> > +
> > +     codetag_lock_module_list(alloc_tag_cttype);
> > +
> > +     struct allocinfo_filter filter =3D {
> > +             .mask =3D ALLOCINFO_FILTER_MASK_MODNAME |
> > +                    ALLOCINFO_FILTER_MASK_FUNCTION |
> > +                    ALLOCINFO_FILTER_MASK_FILENAME |
> > +                    ALLOCINFO_FILTER_MASK_LINENO,
> > +             .fields =3D params.fields,
> > +     };
> > +
> > +     iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > +
> > +     /* Toggle tracing on all codetags that match */
> > +     while ((ct =3D codetag_next_ct(&iter))) {
> > +             if (matches_filter(ct, &filter, NULL, NULL)) {
> > +                     matches++;
> > +
> > +                     mutex_lock(&alloc_tag_trace_mutex);
> > +                     if (alloc_tag_trace_toggle(ct_to_alloc_tag(ct), !=
!params.enable))
> > +                             successes++;
> > +                     mutex_unlock(&alloc_tag_trace_mutex);
> > +             }
> > +     }
> > +
> > +     if (matches =3D=3D 0)
> > +             /* Nothing matched the filter */
> > +             ret =3D -ENOENT;
> > +     else if (successes =3D=3D 0)
> > +             /* Items matched, but were already in the requested state=
 */
> > +             ret =3D -EINVAL;
>
> Why do we return -EINVAL in this path?
> -EINVAL can mislead users into thinking their arguments are wrong.
> That's not the case; the trace request they want is already active.
> Maybe -EEXIST ?

Or even 0 since the configuration already matches what the user requested.

>
> Thanks
> Best Regards
> Hao
>
> > +     else
> > +             ret =3D 0;
> > +
> > +     codetag_unlock_module_list(alloc_tag_cttype);
> > +
> > +     return ret;
> > +}
> > +
> >  /*
> >   * Entry point ioctl function for /proc/allocinfo routing requests to =
fetch the
> >   * layout content ID, seek to a specific tag, or read sequential tags.
> > @@ -464,6 +548,9 @@ static long allocinfo_ioctl(struct file *file, unsi=
gned int cmd,
> >       case ALLOCINFO_IOC_GET_NEXT:
> >               ret =3D allocinfo_ioctl_get_next(file->private_data, arg)=
;
> >               break;
> > +     case ALLOCINFO_IOC_TOGGLE_TRACE:
> > +             ret =3D allocinfo_ioctl_toggle_trace(file->private_data, =
arg);
> > +             break;
> >       default:
> >               ret =3D -ENOIOCTLCMD;
> >               break;
> > @@ -493,8 +580,6 @@ static const struct proc_ops allocinfo_proc_ops =3D=
 {
> >
> >  void __alloc_tag_trace_hit(struct alloc_tag *tag)
> >  {
> > -     if (unlikely(!tag))
> > -             return;
> >       trace_alloc_tag_hit(tag);
> >  }
> >  EXPORT_SYMBOL(__alloc_tag_trace_hit);
> > @@ -1043,6 +1128,24 @@ static int load_module(struct module *mod, struc=
t codetag *start, struct codetag
> >       return 0;
> >  }
> >
> > +static void unload_module(struct module *mod, struct codetag *start, s=
truct codetag *stop)
> > +{
> > +     struct alloc_tag *start_tag =3D ct_to_alloc_tag(start);
> > +     struct alloc_tag *stop_tag =3D ct_to_alloc_tag(stop);
> > +     struct alloc_tag *tag;
> > +
> > +     /*
> > +      * Turn tracing off for the tags of the module being unloaded. Wi=
thout
> > +      * this, `alloc_tag_trace_cnt` would never reach zero and tracing=
 would
> > +      * stay enabled forever.
> > +      *
> > +      * `alloc_tag_trace_mutex` is not needed here as this code path i=
s
> > +      * protected by a `down_write(&cttype->mod_lock)`.
> > +      */
> > +     for (tag =3D start_tag; tag < stop_tag; tag++)
> > +             alloc_tag_trace_toggle(tag, false);
> > +}
> > +
> >  static void replace_module(struct module *mod, struct module *new_mod)
> >  {
> >       MA_STATE(mas, &mod_area_mt, 0, module_tags.size);
> > @@ -1369,6 +1472,7 @@ static int __init alloc_tag_init(void)
> >               .alloc_section_mem      =3D reserve_module_tags,
> >               .free_section_mem       =3D release_module_tags,
> >               .module_load            =3D load_module,
> > +             .module_unload          =3D unload_module,
> >               .module_replaced        =3D replace_module,
> >  #endif
> >       };
