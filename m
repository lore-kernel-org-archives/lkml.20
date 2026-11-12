Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501640;
	b=Iafkdw4qBGP8FgVvOQJWzWql94mvBvUhXvBpI0f9X/R/Ogt4VpR/pmKXWOVHPViGEzED
	 gXau4o6qB+WUDEd5Zzt+5Z5B05pjimSOdAEPCtMYKKWf+mP/jFnhOyvuFhW1qyEM1TTX8
	 hD8Y59CW/4kEmDwGmztS+uhR6a8VFK++biqQuoPQtbpgYMujP19IXozOAvYCigvMl3yBN
	 sPgkkqHq6WVgPfxYUNYKE7NVZwpJWC6XnQw1KvAvm52jJmil4y88QC9nZ6ersjffnCkfJ
	 xqdo4PIdzK0tXe5hQaV6+0ZEMW4YhYRTWeIZCu+lAeTol15pQpDF6+5CJncQLKHJCTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
	b=rAms9jHAXF3aIg5DeSiXe5fQWiU6YDE7L0E7BOpYSCC0XBafeC+uZpJwRvce6mIPibTv
	 4uM9gJvF1NCmRCXfWryDBtU682lavvDZUmxlHiQySw5EZ4uSwTWo9VdYMYHAhZYwEoZhw
	 XWu48vOHIVlwG/Lt2qrmWjwUjPy/FnlukwEP5pRNVxRARRaLWnkSE4lO0QaCy6i4WvzXL
	 vghvo4Td4FXHtgtA69OnV860C0jrJUl1et3R2MfyU3f8dO7kIpqEg5gP4pEE+GhnGmOhP
	 Em/06bNv4jUqonUC87aiqbwNlgq6AwX08CMT4sUv+B1L7w7lldRLaSMxI+ELx5U6wcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSTRe6bc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B6E606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B6E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSTRe6bc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso48426815e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501638; cv=none;
        d=google.com; s=arc-20260327;
        b=UBIlPLjdk9EZqnqi1O+SJEPnn/WNJE994nk5c63oR3JGo76BMrXUdeDYSPs0GT8fxH
         ZQIhudkkXALrMjeS3Db2NyqqJZ8jP8xe0ttxtyQ5iEySSMwwAGHZoc2CIOkzbkRk0ehW
         LyQJJgDGrOfCe5kHHjDis0o1zkoNDSFNdtVJKPNKZjw5nkzc0TfyfZ4eI94Om5xCpIw+
         HX1+Pd7MNLGF85rb4hMO9VjwSkOZmtnLTMwc3Tttyr7O4KYQ05uFGkHUpwDSgMbpQZrm
         imdpii47XTtLoU42P+gtPql6XRZOTGyblMZiQh03ZtFBaEwDjazNE3AX1mUYFXuJ49r3
         48tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        fh=fwKIGoIAhMdbT6KZ6GktrQJ22BQmKtzHYjK7vOFil+I=;
        b=D9zILalmBdw9ei9RK+r8uXS9cv/4fQipqXK5srRMJsnMWHYCPneqcvQYxh0j2nBWEs
         CZfaP2jZLAZr/PKYJYSrGK1E9MIvWJysfU0LUuslmRqc5HirFKoU8KRVc93WOsfYr7bi
         Du/JCu1q6sXdg/0yywFOuYGmrH9XM+IcSuiVcQJpw+jRIJ4xFxsGjngguXlxqR87Bi4x
         rrUPAqne37s5vs/WXPfqQvs5IkgQz4DnYEtddbXH2UuNpD/44iRLIq728+gf5RjPOTOt
         PMfiY0huVBV+KgdAjEck3MdRnd2aoV1yAYq7QbcLkBF8OnGVyE9mpLxai85q5Y7MYchK
         63oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501638; x=1795106438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        b=zSTRe6bcpEP0F6lRzme7StvyYeoHX4QkB0ipadH2vg/pjnjMLNyV84pDO0l2RsL4H3
         NiX5YYkTTQo/IbG4eKCM7ptmaQ7zGd87omyitWEWk9Uc22tWQeokvwrzEQNpPng/1/q7
         6dCDIJplhjRVyLU1DCWjS7MRw508izhA0NS80M8HAyxabXNSFR8WN7lUgm3kFRC8+KaD
         1XhAMA9Ko6pvCIAMy3pI/Up75av8t8te2PBEBGEp81c2fFIvgWYmvp0hmfWL1IjpwGdM
         B9+VZv/tm6Qk1JOFPsr5Ff1pp1Irdji+Tv8WvUcoiFhNurMwnW+zyuHax8WBwILRnr8K
         jDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501638; x=1795106438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        b=eHGpsQe1HJe130SKWfIPDeUzMa56tdpwrym/Z0+NRvjIXAuOs3R2MYi2lfEpohfO7n
         ddbx0iNS7uI8namhmyYz2hGEk03v7ydvcEWWoBpLPsWrRLGCZZaSBvVIIFj9fszRh52r
         68HMadCPg2iccN93UagsVKuZTeAuD89x3NdWzdJ1spJDPLAWGDTSjanNvVrYmP18biFk
         VxE2bPvfpKbsiAH3Q5s2sptj3y9y/pqM1i6/XEuDBlAj18OMidiMmd3WQ0ybpLsxvh82
         +tnHoRV4DwM1P+dmuB//mWjMNrIPnTY3YaMY+Xg9b34sUU43sWQyRrq5clkVZCYK1Fe7
         QbZw==
X-Forwarded-Encrypted: i=1; AL+hErGCJ6H4YIEsJUDjsWCbOWcgrRK+l0CVaRK+hF4WpWZ0e/bQoCcOQfwJCQUgOZW/mkwXMyAwL/ifMOzjxRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9DIb/S9mtohfnEPKg10tWAxamvHFt2+izXEFMiomVyzoR/f+F
	yHZPZwlXrRnjZGioz1j8v6xE62gNkxkBkrgQivBCC4VCnRn3JgSYjlLs4QbyHiCfeZQcyKiDfCg
	glNuCpglGh5Kbv8FkFjtEudjLLvXDjyk=
X-Gm-Gg: AYBFou1se5NvIsCgbAjGyZXiN/iphFfrNZ1vlTZX99cfbMrL0OnbyfLKBtdf5zUzyhP
	mc1ieNkXrRZkf2I2r948KWLhviCFt52kamHUzRw33eViAEZNacWKCy8HW4T9VPwc51js7Nly9hv
	ZkML+WN6qiLPdGt2MrUw1WrbRJnKd/5F7loqt00DgLD8nTyzx2EV85QCr2yMH9Vd0ZgTfmSczKq
	0y6RGNh27IEektNANyNe6/RUg4cLsEY+r3XzYzFjtE3NcuqJNP8gvJVjiYwdVRR/SBVD/Ry6i61
	GPAYpctsd/GU+WVBMjKTCjqBslQcC2FaSJtvf11Meb7BpclkFPSxzlXylnSNEPWecsotQY35zWP
	MO0lFmNMVQ5Msn2YRyVaefY3W11Pj9bm3HpmngE/RvaJDmLZ6CEoJw35stUBeuqVa+Uvccw==
X-Received: by 2002:a05:600c:354a:b0:4a2:1050:aff with SMTP id
 5b1f17b1804b1-4ba0939cc9cmr116023935e9.6.1794501637516; Thu, 12 Nov 2026
 08:40:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-24-kunwu.chan@gmail.com> <c4f84631-5805-4750-a7bb-3fd5a24bbb62@paulmck-laptop>
In-Reply-To: <c4f84631-5805-4750-a7bb-3fd5a24bbb62@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:40:24 +0800
X-Gm-Features: AclHuK9v_Y77arVgZcVVGwgCPDnh2ZgjQdSu0zI-cG-aALJ_JZ_d5zP_ayWkNKk
Message-ID: <CAN_Opa-z5mmmw-OB7bU3xuKJAHp0L4Tp8a9A7tjqiaY4s9V5+A@mail.gmail.com>
Subject: Re: [PATCH 23/28] rcuscale: Add hazptr scale type
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:45=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:41AM +0800, Kunwu Chan wrote:
> > Add a hazptr scale type for per-writer hazptr_synchronize()
> > cost and per-reader hazptr_acquire()/hazptr_release() overhead.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/rcuscale.c | 67 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
> > index 5659eaebc5c0..6e3e3f296f85 100644
> > --- a/kernel/rcu/rcuscale.c
> > +++ b/kernel/rcu/rcuscale.c
> > @@ -40,6 +40,7 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/rcupdate_trace.h>
> >  #include <linux/sched/debug.h>
> > +#include <linux/hazptr.h>
> >
> >  #include "rcu.h"
> >
> > @@ -460,6 +461,71 @@ static struct rcu_scale_ops tasks_tracing_ops =3D =
{
> >
> >  #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
> >
> > +#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
>
> Ah, maybe this is why you want hazptrtorture and rcuscale to be built
> into the same kernel.
>
> But what you really want is hazard pointers to be built in, right?
> As opposed to the torture test?  But this patch will be on top of the
> patches providing unconditional hazard-pointer support in the kernel,
> so you can just omit the above #ifdef.
>
> The reason for the CONFIG_HAZPTR_TORTURE_TEST #ifdef is that it is
> possible to build kernels that do not support Tasks Trace RCU.
>

Hi Paul,

Yes, that guard is what led me to enable hazptrtorture for the
rcuscale runs in patch 26. rcuscale only needs the hazptr core,
which is available unconditionally at this point in the series.

I'll remove the guard and add &hazptr_scale_ops directly to
scale_ops[]. This also removes the need for the torture_type=3Dnone
workaround.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > +#define HAZPTR_SCALE_NR_OBJS 8
> > +static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
> > +static atomic_t hazptr_scale_sync_idx =3D ATOMIC_INIT(0);
> > +
> > +struct hazptr_scale_state {
> > +     struct hazptr_ctx ctx;
> > +     void *addr;
> > +};
> > +static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
> > +
> > +static int hazptr_scale_read_lock(void)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +     int idx =3D smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
> > +     void *ptr =3D &hazptr_scale_obj[idx];
> > +
> > +     state->addr =3D hazptr_acquire(&state->ctx, &ptr);
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_read_unlock(int idx)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +
> > +     hazptr_release(&state->ctx, state->addr);
> > +}
> > +
> > +static unsigned long hazptr_scale_completed(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_sync(void)
> > +{
> > +     int idx =3D atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCA=
LE_NR_OBJS;
> > +
> > +     hazptr_synchronize(&hazptr_scale_obj[idx]);
> > +}
> > +
> > +static void hazptr_scale_sync_exp(void)
> > +{
> > +     int idx =3D atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCA=
LE_NR_OBJS;
> > +
> > +     hazptr_synchronize(&hazptr_scale_obj[idx]);
> > +}
> > +
> > +static struct rcu_scale_ops hazptr_scale_ops =3D {
> > +     .ptype          =3D 0,
> > +     .readlock       =3D hazptr_scale_read_lock,
> > +     .readunlock     =3D hazptr_scale_read_unlock,
> > +     .get_gp_seq     =3D hazptr_scale_completed,
> > +     .gp_diff        =3D NULL,
> > +     .exp_completed  =3D hazptr_scale_completed,
> > +     .sync           =3D hazptr_scale_sync,
> > +     .exp_sync       =3D hazptr_scale_sync_exp,
> > +     .name           =3D "hazptr",
> > +};
> > +
> > +#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
> > +#else
> > +#define HAZPTR_SCALE_OPS
> > +#endif
> > +
> >  static unsigned long rcuscale_seq_diff(unsigned long new, unsigned lon=
g old)
> >  {
> >       if (!cur_ops->gp_diff)
> > @@ -1140,6 +1206,7 @@ rcu_scale_init(void)
> >       static struct rcu_scale_ops *scale_ops[] =3D {
> >               &rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
> >               TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
> > +             HAZPTR_SCALE_OPS
> >       };
> >
> >       if (!torture_init_begin(scale_type, verbose))
> > --
> > 2.43.0
> >
