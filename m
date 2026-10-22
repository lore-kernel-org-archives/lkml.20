Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792675892;
	b=qI7e3AHtxnQ7GjbBtdevyGSRLnjPKjdIlA3c1F33PxkY2vV7+bpLJFsouFxSVO2mfz6q
	 6l7FzaIC6bUIaEIlnA0LB7OQp2OlBT4QEOu02XKejPa3K6m8YMxE5qwm1WRjxixrk1lnm
	 /nQgW9fCGJPXOLFKMJoOnR3kzvwUQKnLDJrYI6Yj0BYBZXYkderWX4URPfQ4I+aNtC/+a
	 fjhKqSHoSCnJeLs5akp6CTj2zXMTv28MF74G5Q8Q5rLYZ3KXb7ti5G1UU4jmUPIILPW1M
	 sivNJQUP6OEegvP/tjRatwkP7sZSIxUH7pH6X5J9wHb5dQY/StinxExPjeT79NNEhig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1dyFlEOzHZvgDDT6c3tPjGMmyBItbCbZHbGAW6EMEPw=;
	b=XOxK7FgvQIfVkxvNIO/cec2K1OA6AwUlXd+WilCA/EBGD9UyOb26yzeER3w4A2LY5frW
	 2I8p9s/Gt/Qp1rOJqTU0wyqM/m86q/rVKAy1Vu+paYobh6hUWwHRuLkapXNokpFdNuAqR
	 YKZ0gz/1YuL0OIdgMdckYH3/TcDZ/ck5mqcOq9uB1hXxQy1ckQvcWMmwBU0OgCfyItkL+
	 Rdd2x/a+i86UVlwlC6MX2IWr5H/86mYvMn8xs1YSDSbxDVsUJ4pmESfKqUCYYHt+8tjTj
	 lt/DqEWKgas+67t7sGqvC9/wReXSDd+uP/Mco4vVuKv1pt3CrwGX2g6w63bEOmJCJTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AswKpepm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D21606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17D21606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AswKpepm
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2acc1e170cso268033766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792675890; cv=none;
        d=google.com; s=arc-20260327;
        b=rE5x5yUaPDCmVs1w77cPWQYupvOadoo5K5bgZGVnkbGfx3g7rCbsN4eyffDUM2KmNb
         n/RRnFg4Lwp+8I3m6hz4FAhA3P37rKBEZeVuRMhrfav5uavyn6qiEmumbuKj12m4A1O6
         6BQtPU5cgOK43VxgwRpP58CYOg4lFCtwB+j2Wx0DB/pEoQ8D6G9G5c7ep6E9WaodXYV1
         NBktqUrivQFf3qIPyOOqYjj2IYLBBD2A9CF/TgFH2MS9NFubkNYFhZLM364ILnAl2ZbD
         9G8yZShLak/HHRAPymw/ez6OXxCGlhVVqex0HvRkOsSQij4JSVjOtIXIDn9mBjHGCpbQ
         TE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1dyFlEOzHZvgDDT6c3tPjGMmyBItbCbZHbGAW6EMEPw=;
        fh=s1187S7oJqxV4TFVkPbqBklNAcow2UtSghJjEQRNMo8=;
        b=AkgqlIyyJmzTYq3XZ2xcZQ2+eCf4SB7kWZJUbRlpg6Hu82OTGferhWajOsSdwUPFAc
         fbSktpaut31JBYiAoTAkuQwM3Kz2Q+KPYAaFmbO3pN+uajO7MpQknljQOLQHxgxeatd7
         i7sVFym2OVjH7cFI9PSDjj2FVlcLc3GELrYujYx1tk8of2WeCjJuN+hfxbdlnKz4hOz8
         LemYbJ76vq+jz+QXX3JpGXcP7DO1odH8p9V2Tyd2c1AJTqkLw44T/dJ/lhkN4SQqD8Uu
         fc5SgpwIhe4oKrnTcUkdlOiVHskWUVckZYtdmjqcWai/KdMlkxg4X0Ewm46PIGg/70cU
         9Xxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675890; x=1793280690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1dyFlEOzHZvgDDT6c3tPjGMmyBItbCbZHbGAW6EMEPw=;
        b=AswKpepmR0cNCfFefTZ1OdzV2lT16TFK6vCm8XMjrPIWaWVdK2Mv/iEAYWZ4HQfKsT
         db4ywv8Ppld3ZP6h5YfcGlAG2P+T9AEoFPAuE4JSTGJIqb2UNbrV0AFRR8hz4LtLfOuD
         pLndjRHuPHX10gc5wCHo8CEj4eX6xkVBVjp3uOy6krxA+P9uKghB93n5aEMWri5FG39B
         vgEk2QRYm/w/VlV3N67ZzakCXV5foD0qLnaAUzzgIHyDurq8OJarVvqFBUjYpBJr4a4q
         PXESPAEuxb3D82RA1rbDjsJaVMnKGy+kuUU0gVGIuaZRCJRjbT1pnyuIfup+pI8UwmC7
         tUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675890; x=1793280690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dyFlEOzHZvgDDT6c3tPjGMmyBItbCbZHbGAW6EMEPw=;
        b=fzxvzY4D3xTcVdaQVrx0NEmIwRgWWr549JhdIb9tRp6wbWDtuuAw3chga4yNLPN8WW
         OLMwi1bUpvFq1o/1/oKgrGqGkHCNz93oINGtBFnMaIbk7ipgKvriQTAunLZOIv/QcZxH
         erziI2de8o+x20YreXiuXzn9Vm8Upva4Ig01a2XhnnvgKAVSRRetGikbUJCctphbAEVE
         fMVVKDbmdY6MVib6GBNjb82JQydKLy1oybkDmovSJn9IESCwOaQm09V2gZs2XyBVFUXH
         dmGNUWknQ5WYcuf2K9W0Skl3SdSP5XkZFx0vEa3koStix2DcS3BPScZvF9DswcqZQ7qe
         ddZg==
X-Forwarded-Encrypted: i=1; AKwUvBwXkZNn5xl5id0043TDlt6T4nuDNFkCCbEEgZ3aEbTDAz+ds0Qi8tFSKVYvHcysKcyJcZ5TJJuO9mzXgsg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMCBn06A2HFknCfzLlGL+aIcTaMJmarAN1oNYRSs92v/hivtmp
	+j/xWRtLb0G+IwMf8SEI1s8mSnWqhnGKJk5kpGMJh0GFocb4MdpNG/SuSixNX8GvWJjLL5VhOnU
	A3vrO+QcEqhb5AE47OcDIH0+Sb0jFqq8=
X-Gm-Gg: AYBFou0szoS2xh+BJRG9o9TWTYjJWcYIFeF5/Kplb33fBINN6vustqhKH/aBUwR28qF
	SYpxfhNUDPqL7dB6wPnOp98OQFBzg1h5rQk/i6gnGvKfbe98eVakyxBBTeSwZynDFHXZgKk1Kt4
	8gduBfoUbu8VLZiTJd1SICgAhNPi76SPRKURLoETiS+tgiIfGEFpL1MBR5+L0rPtWqzjctC5rzR
	izJ10fzPz5LKizgTeD0mfmw91K7QAYQfUzNO9q9Zeo4siV6JW+vzo/jXDFy5z6VvuX8RqNZ742D
	dnqDPBNATGcsFbwWHM/hWS+MnvmALdz/MKpo7H9TUJV3EFY+A7Y4izH8LCmXavLlwiK10EXYnfo
	JJiS19CUlnCJmg6Q6BJOdCz4HvCwuC54wF0ShZzvgoxLxDneHtrk7ThCTx6U=
X-Received: by 2002:a17:907:7f9f:b0:c2e:4292:d27e with SMTP id
 a640c23a62f3a-c467968e9a1mr516404766b.22.1792675890038; Thu, 22 Oct 2026
 06:31:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
 <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de> <CAA+D8AMQ+yExGtpRkTpL0g1AQ-tarF_fUsNj5HsghmF+nGNhzQ@mail.gmail.com>
In-Reply-To: <CAA+D8AMQ+yExGtpRkTpL0g1AQ-tarF_fUsNj5HsghmF+nGNhzQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 22 Oct 2026 21:31:07 +0800
X-Gm-Features: AclHuK-o8mFSEOn5UNNwJz3rX61ho8fho7shI97aU9Fcg4Z0GVBO8HCnZ70_LvA
Message-ID: <CAA+D8ANcekkPnB-N_uH12NYxz7omxciAgMW+NL4uakXdGc13ww@mail.gmail.com>
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, alvin.sipraga@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 11:14=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
>
> On Wed, Oct 21, 2026 at 9:31=E2=80=AFPM Philipp Zabel <p.zabel@pengutroni=
x.de> wrote:
> >
> > On Mi, 2026-10-21 at 11:09 +0800, shengjiu.wang@oss.nxp.com wrote:
> > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >
> > > reset_control_deassert() and reset_control_reset() are documented to
> > > guarantee that the reset line has been deasserted, respectively that =
a
> > > reset pulse has been issued, by the time they return.
> > >
> > > For a shared reset only the first caller runs the hardware op; the ot=
her
> > > callers just bump the refcount and return. When the op can sleep this
> > > breaks the guarantee: a second caller can observe the bumped refcount=
 and
> > > return before the first caller's op has finished, and then touch hard=
ware
> > > that is still in reset.
> > >
> > > Add a reset_controller_dev::can_sleep flag that a provider sets when =
its
> > > reset ops may sleep. When it is set, serialize the shared refcount up=
date
> > > and the hardware op in reset_control_reset() and reset_control_deasse=
rt()
> > > under a new per-control mutex, taken inside the SRCU read-side critic=
al
> > > section. Providers that leave the flag clear keep the existing lockle=
ss
> > > path, so callers in atomic context are unaffected.
> >
> > I think this paragraph should go first.
>
> Ok, will move this to be first.
> >
> > > Set can_sleep in the reset-gpio driver, which drives the line with
> > > gpiod_set_value_cansleep() and may therefore sleep. Other providers w=
hose
> > > reset ops may sleep still need to opt in.
> >
> > Please split this out into a separate patch.
>
> Ok. will split them.
>
> >
> > > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> >
> > This is a partial fix for an issue introduced by 0b52297f2288, but only
> > for reset-gpio, which didn't exist back then.
> >
> > On the other hand, the patch doesn't apply before commit 8c91302a29bc1
> > ("reset: protect struct reset_control with its own mutex"), which only
> > allows this to be trivially backported to v7.1, with adjustments needed
> > for older kernels.
> >
> > The commit this is supposed to fix, 8a0de73cf9dc ("ASoC: ak4458: add
> > optional reset control to instead of gpio"), is in v6.2. I'm not sure
> > if something changed between v6.2 and now that exposed this issue for
> > ak4458?
>
> I could not find a specific change between v6.2 and now that newly expose=
d
> this for ak4458; the window looks like it has always been there and just
> became observable with async probe / SMP timing on the boards we hit it o=
n.
>
> >
> > In short, do you have an opinion how (far) this should be backported,
> > and does this warrant some Cc:stable tag?
>
> You are right that this is only a partial fix for 0b52297f2288, and that
> reset-gpio did not exist back then. Since the race is latent - it is only
> reachable once a shared provider whose ops sleep exists (reset-gpio being
> the first) - and since the patch would not apply before 8c91302a29bc1
> ("reset: protect struct reset_control with its own mutex", v7.1) anyway, =
I
> would like to drop the Fixes: tag and Cc: stable for v4 and present this =
as
> a correctness improvement to the shared-reset locking. Anyone hitting it =
on
> an older kernel can backport by hand. But let me know if this is acceptab=
le.

Hi Philipp

Do you think is it ok to drop the fixes tag?

Best regards
shengjiu Wang

>
>
> >
> > > Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Assisted-by: Anthropic:claude-opus-4-8
> >
> > Drop, see 1e035297ffda ("docs: remove Assisted-by references").
>
> Ok.
>
> >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > > ---
> > > Changes in v3:
> > > - Drop the reset_control_reset_atomic()/reset_control_deassert_atomic=
()
> > >   variants and their reset.h declarations/stubs; gate the mutex on
> > >   rcdev->can_sleep instead, so non-sleeping controllers keep the lock=
less
> > >   path and need no new API.
> > > - Use a dedicated rstc->shared_lock taken inside the SRCU read-side s=
ection
> > >   instead of reusing rstc->lock before SRCU.
> > > - Set can_sleep in reset-gpio; no other provider is converted.
> > > - Drop the lockdep_assert_not_held() additions and the reset.rst / ke=
rneldoc
> > >   text about sleeping-vs-atomic variants.
> > >
> > > Changes in v2:
> > > - Serialize only the shared may-sleep path under rstc->lock (taken be=
fore
> > >   SRCU to match reset_control_acquire()'s order); exclusive path stay=
s
> > >   lockless, and reset_control_assert() is left unchanged.
> > > - Add lockless reset_control_reset_atomic()/reset_control_deassert_at=
omic()
> > >   for atomic callers; gate the mutex on can_sleep so no shared consum=
er is
> > >   regressed and so it works on all configs.
> > > - Factor the body into __reset_control_*()/__reset_control_*_locked()
> > >   helpers, and lockdep_assert_not_held() at each lock site to catch a
> > >   controller op re-entering the API on the same control.
> > > - Declare the new variants and stubs in reset.h, and document the sle=
eping
> > >   vs atomic variants in the kerneldoc and reset.rst.
> > >
> > >  drivers/reset/core.c             | 125 +++++++++++++++++++++--------=
--
> > >  drivers/reset/reset-gpio.c       |   1 +
> > >  include/linux/reset-controller.h |   3 +
> > >  3 files changed, 89 insertions(+), 40 deletions(-)
> > >
> > > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > > index 38e189d04d09..dd6e47163f6c 100644
> > > --- a/drivers/reset/core.c
> > > +++ b/drivers/reset/core.c
> > > @@ -52,6 +52,9 @@ static DEFINE_IDA(reset_gpio_ida);
> > >   *                   only used for shared resets, which means that t=
he value
> > >   *                   will be either 0 or 1.
> > >   * @lock: serializes the internals of reset_control_acquire()
> > > + * @shared_lock: serializes the shared refcount update and the hardw=
are op for
> > > + *               controllers whose ops may sleep (rcdev->can_sleep);=
 taken only
> > > + *               inside the SRCU read-side critical section
> > >   */
> > >  struct reset_control {
> > >       struct reset_controller_dev __rcu *rcdev;
> > > @@ -65,6 +68,8 @@ struct reset_control {
> > >       atomic_t deassert_count;
> > >       atomic_t triggered_count;
> > >       struct mutex lock;
> > > +     /* serializes the shared refcount update with its hardware op *=
/
> > > +     struct mutex shared_lock;
> > >  };
> > >
> > >  /**
> > > @@ -355,6 +360,32 @@ static inline bool reset_control_is_array(struct=
 reset_control *rstc)
> > >       return rstc->array;
> > >  }
> > >
> > > +static int __reset_control_reset(struct reset_control *rstc,
> > > +                              struct reset_controller_dev *rcdev)
> > > +{
> > > +     int ret;
> > > +
> > > +     if (!rcdev->ops->reset)
> > > +             return -ENOTSUPP;
> > > +
> > > +     if (rstc->shared) {
> > > +             if (WARN_ON(atomic_read(&rstc->deassert_count) !=3D 0))
> > > +                     return -EINVAL;
> > > +
> > > +             if (atomic_inc_return(&rstc->triggered_count) !=3D 1)
> > > +                     return 0;
> > > +     } else {
> > > +             if (!rstc->acquired)
> > > +                     return -EPERM;
> > > +     }
> > > +
> > > +     ret =3D rcdev->ops->reset(rcdev, rstc->id);
> > > +     if (rstc->shared && ret)
> > > +             atomic_dec(&rstc->triggered_count);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > >  /**
> > >   * reset_control_reset - reset the controlled device
> > >   * @rstc: reset controller
> > > @@ -362,6 +393,9 @@ static inline bool reset_control_is_array(struct =
reset_control *rstc)
> > >   * On a shared reset line the actual reset pulse is only triggered o=
nce for the
> > >   * lifetime of the reset_control instance: for all but the first cal=
ler this is
> > >   * a no-op.
> > > + *
> > > + * After calling this function, the reset is guaranteed to have seen=
 a reset
> >
> > s/reset/reset line/
>
> Ok.
>
> >
> > The sashiko bot constructed an unlikely but theoretically possible
> > scenario that requires to lock _assert() after all:
> >
> > https://sashiko.dev/#/patchset/20261021030925.3543841-1-shengjiu.wang%4=
0oss.nxp.com
> >
> > Disregard the other issue, deassert_count leaking on ops->deassert()
> > errors. It is pre-existing and can't be as easily fixed because
> > consumers adapted to it.
>
> Ok,  will update the _assert().
>
> best regards
> Shengjiu Wang
