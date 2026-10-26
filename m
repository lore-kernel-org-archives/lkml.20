Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792982115;
	b=KmKHIqt35M3bIEo6fuC0Km7MP1Vqb7Gdd0s7SOCcqBluN1jh5WeoTcuuWnqFywyhqgX6
	 ELZnRIfof65FHX/Bn71X9DVhkVJ7nZ/ncDRE/d6J7+Ao65VnK7hiMG4GP7uOo8ELYi/wO
	 tG8X67qkaWM65y6qdIyrWJH3ooyEmOZZLpKzzHZSNBe/yGd9gGnkzl2dbO+srIiIsMG0x
	 rnRbE44fV550+FY1CTZkRICD7stVGR1lINknKE3XPtVsKCLh7a3NXMZ+7tUoiv5A66tK2
	 Z1ryefMjV56JkWC640VG9laeEH8yRYpl0FgWX/4pyITFsiRpXTc4et3tEJpplTBQQpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SVVTsCxlO9RTIRg4DXefXj5kmUOCXBODmILe7eWM7i0=;
	b=XXI2WFo77z/8uRmpcSgnznOL0EXdgNn1QIsUPHoUQS6ozUroVXIdkchMe+htn64ZEpUf
	 06EPdV08rARY7/HzfZpM6Fqfk3M7H08/yNBzOcydutwEfLf291FUA1n4wjzUdA1tskVLL
	 p6Hd1gVn5YnmKWz+EqmmUJbCbvzZkFgQNh2ARt+yZodN3E8B2XoPVh1x+Gz2Ma341fYNC
	 FVXB9rJ2m7zeABt+KB+ibcNL/N1gaT1Sb3vHNtRh9pjKRFShpkFRyXgse403Xu1mV3VKz
	 v0aaE92KByrxRwKVVqEpBjNU/upvCPOfhnk4h07RB/qVft1VuvrFLM7flcbE2KA4I7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K2phesg/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19614606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19614606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K2phesg/
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16885035e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792982113; cv=none;
        d=google.com; s=arc-20260327;
        b=YB57gqQYQrbe3Z5n23zfORtXCZ/X1QKx05ONv00Y7JOOkslmLjkKlEfJqgZ+8fJPWT
         e4za+Gimv+DJYCxOGvv7SFFQ3RKTji6/S1AsKvZw5M55gJ7mcmhr4lgrZgukBaP1Zx7X
         bsQQWuSNNYorX0p+Nt76Qbx5UHQQmrYu7oc+vuwnPwTIRIUoqbHUmqBT3NsD5EFEHfYd
         o9jUfc+jicORGV+tGgpLazPc0HHvOSd/r1rRRg4O+504jnVEtchqleaDrOt/ElkM9d4n
         o1sK6k4aajmniEAZMwA4ChPEtxWRrI9KTcnV0QWfzzhcEbZAsLKoN9BlRY8igkqvav+g
         54Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SVVTsCxlO9RTIRg4DXefXj5kmUOCXBODmILe7eWM7i0=;
        fh=8R+GGyQkCTrYO5DTuaG2D+TWEZoO55FUozECLpZefig=;
        b=ehl7FLUkQTniI289NV1ld885hHrWGHWZsle+9e+gXQjwZxL6wSa40hyKoKIjX9Bvtq
         1mzQkRTpH3ec3NLj2ecLUfblGdgpkrbOLDNjyFHECtF3PCvNS9XOhxhJrHwlSOiCJVbp
         tqamNnB1vMSrSACAgx6iYY6PTlG7e5uSwxf5rVedQzmxJM50WszpN3ceCWrHnyMYZKJW
         Xc6Np8mpsTwfNTXIxu6V3xntGiIWTUVfRisE2CB/D3SDaW7dWGyQfOIaLn8t/7/u88Mj
         ZaHOYPBVz8STI2bMOxL6aUNtx/YKdjRLRtedLp8aCikxjnGbO+Z3bof9PjaYGjmcbhl9
         jfaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792982113; x=1793586913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SVVTsCxlO9RTIRg4DXefXj5kmUOCXBODmILe7eWM7i0=;
        b=K2phesg/sIZN0vhIj2yBJgZ5baiYagV0AXyQr8gt3yKJjDeRGPKYPTWbkakh6U1u5O
         7qZi8PQZpyg/YkRWfJ98dIUpWt8Fji/QBHBE06Pr46OyUEOaIpvOL25vbTjc+huLB2yT
         N1fronMppT4dscAAZ2RCVymeRF4U+UnlFidG3lFGkNOxWPAKxJUnpK1QhHOSwzKf5wgL
         NjACE1cPoZt4mC950Pkf2t+5jSXBkFWrOhxqJtLofW6mWTk1eqf+pKWupTXkGO3gHVex
         oyO0QY+kTsDnuS1SPUxX++xDPUOtnftHvYsD+JNe8fNxACrGw50tDHAL7o7GZKWvFSfy
         +f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792982113; x=1793586913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVVTsCxlO9RTIRg4DXefXj5kmUOCXBODmILe7eWM7i0=;
        b=DAxmvh4SOzrKdKFhey/OmpYz+uDgBgQKjS1ZVI/hwY4yqHk9iuyhhcTGITci2ep1yM
         /Gh0u9jRZsPsC7zqPi0aT0eBC9tEI2A648Zqaz18z8ElCa9pjXP1K3B/FdxfxsVq19Lb
         VPL+fvoPZfEM/XJGjjuW0N1Mbnt/1YlaaQBSEKM5/iD5KlQSeF5a90i9MeGQey0Nm2b7
         t1pqnUq1GXvMTFf/ByxAL6oZ3Dyxu3sBo2r4ZVYfltg0Ka6Ymu7l7Rn00J687a0FPZMt
         Q68wSrQB1wEfrB3+F1OKYbx89+eClwvYKQ0Ea7FXpFzZQFQ2IF77h8iCex8/Zr5IIf/h
         BT1A==
X-Forwarded-Encrypted: i=1; AKwUvBw7EMI7EoerKEyTTQDsuI51zHgCkz/Jb58oGu38y6210+w3pwwukjwZH8gSVS/qdFq/r4Q1Vnyeyog1q8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8xR7dS84xTQRwBZHDxBf0TOubn02uo7yi+Vs6izDbC5Dylz+M
	OSbHhpDqp7O10r3+sYoqgxrcmqjfM18GMcn2dogmVyFkI07oLjmLBJzixkjR03YmBwPQzm/AeHx
	44RjenXxnHQuutk6YkcjJl6QX1BHMc00=
X-Gm-Gg: AYBFou2j1A1IGDiPE6ONI3Qm8aIT2pWuPw98/shIxDyDLU2//KHouyK2AG46Aq3ImuB
	rHma74WWrsA3hdCrd+Zd0bGTWlL41BSQhB1NAJ7qXIZiN6/vioziAN2tjgSmqJlvFh6bWDyOxfB
	WAzH3Qw0yJIpQ5TcGFPCVJDFxNRG6nk+x9MsGhqDXVeM2gc66gq7iV6BG2vFHNH2lkw6ZyJJqdI
	BOwgbPt+G9woHfWy8PLcsOn/o5RrvLedqK/HVgJO8xXNPeG1YSYvgprNP5CgkFWV4Ap9AAbrrH5
	zsZtZG+gGcekmWLVLI40zUjntJSWtOS0v/NXRpMb2pn2eo87l1rJSub+MjS1C/uoI42KQFpGpZ7
	Jtd3rdWCYOJgzjdyyUI4et6bL8OBx3lsVevLGwNcEZzirlh1BkO6rDauKxB3gSVfMWyZFcQ==
X-Received: by 2002:a05:600c:4746:b0:4a3:59c9:a744 with SMTP id
 5b1f17b1804b1-4a35ac8bb3fmr104333465e9.7.1792982113228; Sun, 25 Oct 2026
 19:35:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023101841.2910719-1-kunwu.chan@gmail.com>
 <20261023101841.2910719-8-kunwu.chan@gmail.com> <60e6148e-b7e1-4f2f-a665-24567305956f@paulmck-laptop>
 <b5c84b27-5e66-44f1-b95a-d7c1655df69d@paulmck-laptop>
In-Reply-To: <b5c84b27-5e66-44f1-b95a-d7c1655df69d@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 26 Oct 2026 10:35:02 +0800
X-Gm-Features: AclHuK9c9zrzG9Nt-ZVNvTMCRDudA2gvPQD-2SIBWE5m7zqo9uzPr4bzScrDxIY
Message-ID: <CAN_Opa9MvTvLemY5DYNHu-yXy9xZvJJiLXigknP-qM=bK0Xw7w@mail.gmail.com>
Subject: Re: [PATCH 7/9] srcu: Detect duplicate callback enqueue at registration
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, work@onurozkan.dev, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, 
	boqun@kernel.org, urezki@gmail.com, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, qiang.zhang@linux.dev, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Paul for the detailed review.

On Sat, Oct 24, 2026 at 3:38=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Fri, Oct 23, 2026 at 12:30:57PM -0700, Paul E. McKenney wrote:
> > On Fri, Oct 23, 2026 at 06:18:39PM +0800, Kunwu Chan wrote:
> > > Move the duplicate-callback check from srcu_do_enqueue() to
> > > __call_srcu() entry so that detected duplicate registrations
> > > are rejected before they reach the deferred-list enqueue path.
> > > Report the callback address, function symbol, and object
> > > information, rate-limited to the first three occurrences.
> > >
> > > Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> >
> > Getting the stackof the call_srcu() once double-enqueue is detected
> > would be a very good thing!
> >

I'm also working on the rcutorture support and will send it out separately.

> > One question below.
> >
> > > ---
> > >  kernel/rcu/srcutree.c | 20 ++++++++++++++------
> > >  1 file changed, 14 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > > index 1993ddbdb828..3838d9fdf532 100644
> > > --- a/kernel/rcu/srcutree.c
> > > +++ b/kernel/rcu/srcutree.c
> > > @@ -27,6 +27,7 @@
> > >  #include <linux/smp.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/module.h>
> > > +#include <linux/mm.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/srcu.h>
> > >
> > > @@ -1511,12 +1512,6 @@ static unsigned long srcu_gp_start_if_needed(s=
truct srcu_struct *ssp,
> > >  static void srcu_do_enqueue(struct srcu_struct *ssp, struct rcu_head=
 *rhp,
> > >                         rcu_callback_t func, bool do_norm)
> > >  {
> > > -   if (debug_rcu_head_queue(rhp)) {
> > > -           /* Probable double call_srcu(), so leak the callback. */
> > > -           WRITE_ONCE(rhp->func, srcu_leak_callback);
> > > -           WARN_ONCE(1, "call_srcu(): Leaked duplicate callback\n");
> > > -           return;
> > > -   }
> > >     rhp->func =3D func;
> > >     (void)srcu_gp_start_if_needed(ssp, rhp, do_norm);
> > >  }
> > > @@ -1529,6 +1524,8 @@ static void srcu_do_enqueue(struct srcu_struct =
*ssp, struct rcu_head *rhp,
> > >  static void __call_srcu(struct srcu_struct *ssp, struct rcu_head *rh=
p,
> > >                     rcu_callback_t func, bool do_norm)
> > >  {
> > > +   static atomic_t doublefrees;
> > > +
> > >     /* Misaligned rcu_head! */
> > >     WARN_ON_ONCE((unsigned long)rhp & (sizeof(void *) - 1));
> > >
> > > @@ -1539,6 +1536,16 @@ static void __call_srcu(struct srcu_struct *ss=
p, struct rcu_head *rhp,
> > >     if (WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_=
ATOMIC))
> > >             return; // Leak the callback rather than corrupt SRCU sta=
te.
> > >
> > > +   if (debug_rcu_head_queue(rhp)) {
> > > +           if (atomic_inc_return(&doublefrees) < 4) {
> >
> > Why this hard-coded 4?  Why not 3 or 5?  Should this be adjustable via
> > Kconfig or kernel boot parameter?  Or, alternatively, should the below
> > pr_err() instead be pr_err_ratelimited()?

Regarding the hard-coded limit, I followed the existing code in tree.c when
choosing 4. Thanks for pointing this out. I'll switch to pr_err_ratelimited=
()
in v2 and make the same change in tree.c as well, so the two paths are
consistent.
> >
> > > +                   pr_err("%s(): Duplicate call_srcu() CB %p->%pS()\=
n",
> > > +                          __func__, rhp, rhp->func);
> > > +                   mem_dump_obj(rhp);
> >
> > Does any of this automatically dump out the stack that was recorded
> > in earlier patches in this series?
>

I'll also add dump_stack() to all three duplicate-enqueue patches
to capture the current stack when a duplicate is detected.

> As in shouldn't there be a kasan_print_aux_stacks() in there somewhere?
> I did not see an call from mem_dump_obj(), but I could easily have
> missed it.
>

As for kasan_print_aux_stacks(), as mentioned in my reply to patch 1,
it is called by the existing KASAN report path, which prints the auxiliary
stack recorded by patches 1-3. It does not need to be called directly
from these patches.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > > +           }
> > > +           WRITE_ONCE(rhp->func, srcu_leak_callback);
> > > +           return;
> > > +   }
> > > +
> > >     /* Record the caller: the irq_work's stack says nothing about it.=
 */
> > >     kasan_record_aux_stack(rhp);
> > >
> > > @@ -1554,6 +1561,7 @@ static void __call_srcu(struct srcu_struct *ssp=
, struct rcu_head *rhp,
> > >             if (READ_ONCE(sndp->draining) && !in_nmi()) {
> > >                     WARN_ONCE(IS_ENABLED(CONFIG_PROVE_RCU),
> > >                               "call_srcu() re-entered during callback=
 drain; leaking callback\n");
> > > +                   debug_rcu_head_unqueue(rhp);
> > >                     return;
> > >             }
> > >             sdp =3D this_cpu_ptr(ssp->sda);
> > > --
> > > 2.43.0
> > >
