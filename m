Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C34137B2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340746; cv=pass; b=aal22vOmlDK4CZQa503L/6RKL6riYPQq5XnWMTCMC/u7znqU86S1abuygCtmu1vzkdY8AknJd3YCI+F7uIut9Qt3hde3eLsNAvNt5t9riusEAH3JvgbWnzmGFU1ESHaYBbT2LAQCGfSTcRGMMpQV0dXxJkOadlJnizZSLmI/iIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340746; c=relaxed/simple;
	bh=eDdI7kb9rYHWeWJphr+48URA7otzpjTVs5yq3zmmPlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Op0FrgxH/hpB35mAEf91J9kEQAcCAm9XYfAqhhpqwaSWIfqMagTmNDB1lNIBIZJUYJ7DcRKcLRx7/U3v7i7oSvm3I85jJGDlJztgOtTUYREMROrJCqM/PgBcxMjd9zpkkeBpIgTiAQpWNQT4LgLuQ8XwYhrW4oZgbxZYf8yRBYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti6qrbUo; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti6qrbUo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso11402275e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788340743; cv=none;
        d=google.com; s=arc-20260327;
        b=pC2V1dlNBvvd6NM5Yhy2bHgaJkPXXN3fleynocAsRbWYqD1Pi62Kwd48YX3PvQjt7D
         4SfpB5eCu1lMm4wXb1bX50vGtRW57rfOi2M8QhxZjhMpfkQVoQmJDSdMnjyTem38iQJL
         s0b4beqdpnfo38kbeZWrcmx/1PNoEC6aHHhANanp93BX772s3yzchad3wP5S+i3uPz/F
         PIvvNkjr0MaE0ZaCjFJNEg9FPhmQdXVIbs6PGvjVtU/2kUCrRI0U9aJSa+dOMqzhOqP7
         Ve1Jc8J8usuP6/ic9ryijGOhXIYL/YjTiV7mg5SksXWCahwYj6GARMK3hqg/Ztn4PqzB
         LUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hcMVnJ0MPEnl0dw1WvCWplZ0EWqlilumUc/YSuk4s3k=;
        fh=4Zy2A32pdfFCgFQB4xqUBxE/eiSNtGCx6C54iilLZto=;
        b=Alqr7oR/9l3VRRnUHhR6kQDZeV3NN3eJZXCRP0b0kMvGYTm6c6tjdc8tG3n8q5jIfj
         6w4rB12gstsZLYNlohz3p7BrIASnyzRPuCPJggSbRKKlMjXdIL+CpxNkR/6zIUSkJi3R
         /mdknLxazI79/GdbZxSVtEO/Nk6Gcac+Z37VR3CjhAVRcKoDAU10+LB9kYkUMzfaSSE3
         vvSm/YzIy6RK3eBYpWblN28cy8Eb5jwUKwcDVTgW7b6R9d4hXknxIwSb9l3l9VEcDJfN
         c5z04TmS7JMeu2ArpQEZHPHkjRBAy55rSMRJ1K2xxv6B9bGH4do7BJnSrJQMPEp/9zoM
         w8hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788340743; x=1788945543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hcMVnJ0MPEnl0dw1WvCWplZ0EWqlilumUc/YSuk4s3k=;
        b=Ti6qrbUoOIQhQycrrrf7BXBu8Zkb//ZuG3PyyQomVwOs2tezKEwGAYH2nH8I7efsPg
         u6KfcKn4sRMcz2a9PohgtL5SbAYrPKuzsjJF82wpuf8/Zp/djKgov2xWOuEmaCPjEYrj
         MlzJNJ1YIpVsvqOjytjVjyaX+kTxuIY8ZtEC/rW/eNT/R6Nz/5cC6Xoq5X67O2ED5cC3
         PtxNofN8QmkQsFkRhe85xTX6ro9wrO9Si3ww5CBvWAEYr59+RoJdA58wDcFgRcrTwvVX
         SSL7zeWu95lDmGXnglnL71wso72cGyPhG8DcHZIsTW6664uHgGPGU6huYSjJxeX9hv91
         A/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788340743; x=1788945543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcMVnJ0MPEnl0dw1WvCWplZ0EWqlilumUc/YSuk4s3k=;
        b=ke6F4oFa9hM8ErsDzS7DWxOrGKbtWcTwZ3SVOkcvy3CzrRt2qTN0pqkYQDbdAKQFNd
         yJ4jGt7LFEFlikxScR3c/CjMt03r91gsjGJvq6O32BEuMPUQqttFpzQEVF5cFD0o3/s/
         NRRbxkRwYc94l+J09a1YMzAdF66yXjoVXbjhoyIzillyJ3+HGqxgdxbJ5yCmUReg6fPI
         bB1IKcNjZPRWVm4sIjj9guGBGVdVVOZU2+iKCIrHMPBrPv2mILZrR/A55PHr0dixNZGo
         licAESPr5b2trg/hsEq8fCLHWrkEX71snMq4e1ceK30Vjj9rDhjNTdGSbQlUwbr+YgYu
         p/Hg==
X-Forwarded-Encrypted: i=1; AHgh+RoL8MuBWWD3W9Hfo5+ZTKxEicMskqYW25B6UGTtbbRPJPCEIJTCVrKhszcvLhCy8/51h28+jQNJNA4V4fE=@vger.kernel.org
X-Gm-Message-State: AFuF++l1u3Og4whexkvXNKe+QdDvi/RfRDGSGPAhR6lk6ERHgRQiIoYM
	H0+2fHhZY8AKfRFJa2mKNUgnd9ckXunMxs3LeqlKcmdw67TA8Tqk2YmYjXCiuECEqlWEdEvuR+y
	6qPcfH+yG2rw57MI/um3f6vWgjTk5+bY=
X-Gm-Gg: AR+sD12TlLZiIpe+qrXPFPcZeOr1StIGLjTeBb8y9XXnsAgS3opQoI6VMDfZdgyyggI
	gJVdil7yCJbJHRJrl97uhk+giy95YNYGXsb67Qbk75/SsIglV/YkX8El3nTohlwQ65s30CWe+iD
	vJjvsAPoxZWZwGitWgPEQ3Yt5r97NK8nTBCp1cVigasoE1mq6lTztVyf8jcKlE2i9p097LYwXdX
	wOkhv2R/fbymvEbeM2Kjnpt9PaO3icjHJjDZW5W5lw5FDFZJ8DCPaI3EZ3fGhpzQlOqH/Y1cd9c
	iSRgfPnmfYNTGki34Rw/jsF9Oo+/h1jOe4PO6i7LGc5GRXU/mmFn8/5V6ATWit883QividrQdv9
	Ar+A=
X-Received: by 2002:a05:600c:6296:b0:499:621a:2ec2 with SMTP id
 5b1f17b1804b1-49ce581635bmr62953555e9.3.1788340742125; Wed, 02 Sep 2026
 02:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901074815.3145037-1-kunwu.chan@linux.dev> <d991297a-9bd4-4da2-89cd-002b6f2a3305@paulmck-laptop>
In-Reply-To: <d991297a-9bd4-4da2-89cd-002b6f2a3305@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 2 Sep 2026 17:18:50 +0800
X-Gm-Features: AcwNN1VWxMi68XrHmbYjnT12bLzvr38iujyJVXNF6dN9XU4E4ljwjU-fKuImwbU
Message-ID: <CAN_Opa81BaWxkdRyoHQBcMLbOt-n7f-4cUmxxstage1MSOu1Hw@mail.gmail.com>
Subject: Re: [PATCH] srcutiny: Enable atomic SRCU flavor tracking
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:11=E2=80=AFAM Paul E. McKenney <paulmck@kernel.org=
> wrote:
>
> On Tue, Sep 01, 2026 at 03:48:15PM +0800, Kunwu Chan wrote:
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > Set srcu_reader_flavor to SRCU_READ_FLAVOR_ATOMIC in the Tiny SRCU
> > atomic initialization paths, so that the entry-point checks added by
> > the previous commit can identify atomic SRCU domains.
> >
> > For static initialization, add a flavor parameter to
> > __SRCU_STRUCT_INIT() and pass SRCU_READ_FLAVOR_ATOMIC through
> > DEFINE_SRCU_ATOMIC() and DEFINE_STATIC_SRCU_ATOMIC().
> >
> > For dynamic initialization, initialize srcu_reader_flavor to zero in
> > init_srcu_struct_fields() for the generic initialization path, and
> > set it to SRCU_READ_FLAVOR_ATOMIC in init_srcu_struct_atomic().
> > Handle both CONFIG_DEBUG_LOCK_ALLOC and non-debug initialization paths.
> >
> > Enable srcu_check_read_flavor() for Tiny SRCU, matching the Tree SRCU
> > behavior, so that readers can verify that the requested flavor matches
> > the SRCU domain.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> Much better!  Please see below for additional questions and comments.

Thanks Paul for the detailed reply.

>
> > ---
> >  include/linux/srcutiny.h | 39 +++++++++++++++++++++++++++++----------
> >  kernel/rcu/srcutiny.c    |  1 +
> >  2 files changed, 30 insertions(+), 10 deletions(-)
> >
> > diff --git a/include/linux/srcutiny.h b/include/linux/srcutiny.h
> > index 2b293336525a..9dce4b5aa084 100644
> > --- a/include/linux/srcutiny.h
> > +++ b/include/linux/srcutiny.h
> > @@ -40,7 +40,7 @@ void srcu_drive_gp(struct work_struct *wp);
> >  void srcu_tiny_irq_work(struct irq_work *irq_work);
> >  void srcu_defer_drain(struct irq_work *irq_work);
> >
> > -#define __SRCU_STRUCT_INIT(name, __ignored, ___ignored, ____ignored) \
> > +#define __SRCU_STRUCT_INIT(name, __ignored, ___ignored, flavor)       =
       \
> >  {                                                                    \
> >       .srcu_wq =3D __SWAIT_QUEUE_HEAD_INITIALIZER(name.srcu_wq),       =
 \
> >       .srcu_cb_tail =3D &name.srcu_cb_head,                            =
 \
> > @@ -49,6 +49,7 @@ void srcu_defer_drain(struct irq_work *irq_work);
> >       .defer_cbs =3D LLIST_HEAD_INIT(name.defer_cbs),                  =
 \
> >       .defer_iw =3D { .node =3D { .u_flags =3D IRQ_WORK_HARD_IRQ },    =
     \
> >                     .func =3D srcu_defer_drain },                      =
 \
> > +     .srcu_reader_flavor =3D flavor,                                  =
 \
>
> Don't we also need to define srcu_reader_flavor?  Or is this patch
> supposed to be applied on top of your previous one?

Yes, this is intended to be applied on top of the previous one [1].
[1] https://lore.kernel.org/rcu/20260831074937.2380914-1-kunwu.chan@linux.d=
ev/

>
> >       __SRCU_DEP_MAP_INIT(name)                                       \
> >  }
> >
> > @@ -57,29 +58,43 @@ void srcu_defer_drain(struct irq_work *irq_work);
> >   * Tree SRCU, which needs some per-CPU data.
> >   */
> >  #define DEFINE_SRCU(name) \
> > -     struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name, name, =
name)
> > +     struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name, name, =
0)
> >  #define DEFINE_STATIC_SRCU(name) \
> > -     static struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name,=
 name, name)
> > +     static struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name,=
 name, 0)
> >  #define DEFINE_SRCU_FAST(name) DEFINE_SRCU(name)
> >  #define DEFINE_STATIC_SRCU_FAST(name) \
> > -     static struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name,=
 name, name)
> > +     static struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name,=
 name, 0)
> >  #define DEFINE_SRCU_FAST_UPDOWN(name) DEFINE_SRCU(name)
> >  #define DEFINE_STATIC_SRCU_FAST_UPDOWN(name) \
> > -     static struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name,=
 name, name)
> > -#define DEFINE_SRCU_ATOMIC(name) DEFINE_SRCU(name)
> > +     static struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name,=
 name, 0)
> > +#define DEFINE_SRCU_ATOMIC(name) \
> > +     struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name, name, =
SRCU_READ_FLAVOR_ATOMIC)
> >  #define DEFINE_STATIC_SRCU_ATOMIC(name) \
> > -     static struct srcu_struct name =3D __SRCU_STRUCT_INIT(name, name,=
 name, name)
> > +     static struct srcu_struct name =3D \
> > +             __SRCU_STRUCT_INIT(name, name, name, SRCU_READ_FLAVOR_ATO=
MIC)
> >
> >  // Dummy structure for srcu_notifier_head.
> >  struct srcu_usage { };
> >  #define __SRCU_USAGE_INIT(name) { }
> >  #define __init_srcu_struct_fast __init_srcu_struct
> >  #define __init_srcu_struct_fast_updown __init_srcu_struct
> > -#define __init_srcu_struct_atomic __init_srcu_struct
> > +#define __init_srcu_struct_atomic(ssp, name, key) \
> > +({ \
> > +     int __ret =3D __init_srcu_struct(ssp, name, key); \
> > +     if (!__ret) \
> > +             (ssp)->srcu_reader_flavor =3D SRCU_READ_FLAVOR_ATOMIC; \
> > +     __ret; \
> > +})
> >  #ifndef CONFIG_DEBUG_LOCK_ALLOC
> >  #define init_srcu_struct_fast init_srcu_struct
> >  #define init_srcu_struct_fast_updown init_srcu_struct
> > -#define init_srcu_struct_atomic init_srcu_struct
> > +#define init_srcu_struct_atomic(ssp)                                 \
> > +     ({                                                              \
> > +             int __ret =3D init_srcu_struct(ssp);                     =
 \
> > +             if (!__ret)                                             \
> > +                     (ssp)->srcu_reader_flavor =3D SRCU_READ_FLAVOR_AT=
OMIC;\
> > +             __ret;                                                  \
> > +     })
> >  #endif // #ifndef CONFIG_DEBUG_LOCK_ALLOC
> >
> >  void synchronize_srcu(struct srcu_struct *ssp);
> > @@ -148,7 +163,11 @@ static inline void synchronize_srcu_expedited(stru=
ct srcu_struct *ssp)
> >  void srcu_barrier(struct srcu_struct *ssp);
> >
> >  static inline void srcu_expedite_current(struct srcu_struct *ssp) { }
> > -#define srcu_check_read_flavor(ssp, read_flavor) do { } while (0)
> > +#define srcu_check_read_flavor(ssp, read_flavor) \
> > +     ({ \
> > +             u8 __f =3D (ssp)->srcu_reader_flavor; \
> > +             WARN_ON_ONCE(__f && !(__f & (read_flavor))); \
> > +     })
>
> Why not make this a static inline function, along with
> __init_srcu_struct_atomic() and init_srcu_struct_atomic() above?
> That should simplify the code.

Thanks. I=E2=80=99ll rework the initialization helpers as static inline
functions as suggested.

>
> >  /* Defined here to avoid size increase for non-torture kernels. */
> >  static inline void srcu_torture_stats_print(struct srcu_struct *ssp,
> > diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
> > index 22f7716cbb0e..873b30ccf563 100644
> > --- a/kernel/rcu/srcutiny.c
> > +++ b/kernel/rcu/srcutiny.c
> > @@ -42,6 +42,7 @@ static int init_srcu_struct_fields(struct srcu_struct=
 *ssp)
> >       ssp->srcu_gp_running =3D false;
> >       ssp->srcu_gp_waiting =3D false;
> >       ssp->srcu_atomic_gp_flag =3D 0;
> > +     ssp->srcu_reader_flavor =3D 0;
> >       ssp->srcu_idx =3D 0;
> >       ssp->srcu_idx_max =3D 0;
> >       INIT_WORK(&ssp->srcu_work, srcu_drive_gp);
> > --
> > 2.43.0
>
> One of the purposes of Tiny SRCU is to be tiny, and one could argue
> that Tiny SRCU already has too much diagnostic code.  Should we include
> these patches at all?  If we should, shouldn't they be under something
> like CONFIG_PROVE_RCU?  Should some of the existing Tiny SRCU debugging
> code also be under something like CONFIG_PROVE_RCU?
>
> Thoughts?

I agree that Tiny SRCU should keep its core as small as possible, so I thin=
k
it is worth reconsidering how much diagnostic machinery we want to add here=
.

For srcu_reader_flavor, I did have some hesitation when adding it.
Tiny SRCU did not previously have the concept of a reader flavor; I
mainly added it
to distinguish Tiny Atomic SRCU, following the approach used by Tree
SRCU. If we still
need state for this purpose, perhaps a one-bit flag would be sufficient.

One question is whether the flavor checking really needs to be part of
srcutiny.c.
I think there are two somewhat different cases:
1: checking for invalid API usage, where the purpose is to detect or
stop misuse;
2: defensive handling of an invalid call, where we redirect to a safe
implementation,
    like in synchronize_srcu.

The first case seems more like diagnostic functionality and could
potentially be handled
in the common SRCU API layer under CONFIG_PROVE_RCU. The second case affect=
s
runtime behavior and should remain independent of CONFIG_PROVE_RCU.

This makes me wonder whether the common flavor validation could live in src=
u.h,
as part of the common SRCU interface, rather than adding more checking
logic to srcutiny.c.
That could centralize the validation and keep the Tiny SRCU
implementation easier to follow,
although it would add another wrapper layer, such as a macro or static inli=
ne.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
