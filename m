Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792638861;
	b=0zzBMdlDWGQBzlCNVQkvdzYBcb0Lb/vp74ln/lFcETGY/MUyepANaX2ma7OtHj/Tw6qX
	 hgyXlpEnPA0J8WqJVkYN5/jw9gVSo9MMnZiHc9auXQIslei/xN8hgRV3ehZnqNr1I90uU
	 FF2FaTrN+m1+vYSS9p1gS2AmHIllnpgENXRD2DHXHybqIQDnW7rvheHeSGnUGCNtYWT/D
	 CZIxkeUzLzuTybsAXNQfhGRsOK/GKtjmas/eLeOxjbg/hWwL3Nig58b+YGZC5qrRcSDoF
	 WI73xEF0uhlG4Z0jzRZUs6HzMyHxBN0LbT1upmg1TojHrYrthwUVoiio4xAv5FWqltQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792638861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6kVLnv2hV2zrpGw9FDH2/8id0hh//8Wt7wb7DvFNPdE=;
	b=CDvv37tqOmVxEHuEyJFcxd90zClEwUFkZA1jQuY7CEiktJtJflVsLVDhj3f3XKljj26z
	 X1RKyRoNiIqZ/13x3G7a4MtA11fvoZROa7ruufTqdHIYsL7s1SGwUU92gExlGl+sNv2es
	 cVn+3fyNxiFoPfhUpAcA5tZ5+oLo32ahtHjUXjIUYPUKVknenMEDVBPPuptlNvUD33aQg
	 tzOQoWLocdfx7CjZWI0aiBrQCoKlEkqiu7PuVRwuy8uI1KEsvWNgOQOHHpd9MAQOMKBb2
	 Qu3BCQ6oiaYi6OLE7zsGNUMCsE/kIqHFsr9zq1ShjGeExz1mowtcEKLnb630gnvW+IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="NFtU/2u2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4368606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4368606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NFtU/2u2
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so888153a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792638860; cv=none;
        d=google.com; s=arc-20260327;
        b=HCCo4+QmXtyfmieQvkZGVzaga+LZWghSfxf3AYD+uRlQm55/CGSR/PZInlfq8jX+DL
         l2StMvHQPQiDY8b05DAi6zsjkJ5lJKNxrCj5orCsn062SqPOwf3K1nqnWhOvvuZsUPm7
         83upQjsgvZ+uZt8kK+qHnY7bui49pd6FLOIHCGm8eIkbOGL0o+M8WHrHOroBQ0OO7Bz1
         vVfs7xg7NF5SHbahJIMN3dUp3HYaD9soW0KOoXEbW9YLmoSKVfcaWDXUssdJ0hYRq47u
         PAv1rH1u7HoRh3q3N9EkV54tUc5rkTJ30ekZYOSqmRNf0Y9FCLUSMzLJdiEZbwZKRQnr
         yKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kVLnv2hV2zrpGw9FDH2/8id0hh//8Wt7wb7DvFNPdE=;
        fh=nkugprToAvtnL0ZWviqU6EpvmwHBtW8Sy/dLY5b4CS8=;
        b=kuAp2DQBoAvvu2MA9aPpCihbOY/MnyqSQgPcoKCrP0l/x2mn8qZrNVkIdwvwc+HXO/
         NVHnXOBdDVexQaBn8qRGopMSuMtkcpjADn1O9QECX98kTxZi91zPTLVZNzXDmZhiQosw
         7OjoIyVS1sZzseAeaYQE7TCXZdWCBQz8ebLQp9rrE+v48vAyRQ9GgVBDOutfKCbcqNcA
         vr9yp8CDpwViP0pGOeqVdTLsrSvbd/UT1qMwPn53yBe2W5cAl6O1rQipDXBUpCk9vYJH
         QEJT1zdOBBWvUZEx+LjV2pPP7+eDAMjx3Q/Om+Y8i3uF0An/0xqncalop4SMLav4OF5Y
         wEmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792638860; x=1793243660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kVLnv2hV2zrpGw9FDH2/8id0hh//8Wt7wb7DvFNPdE=;
        b=NFtU/2u2whrkYq8TuTSKDhVqo5DrwX+WwoRv1dB6Is8F7p3kv9Pwclhv08UQxzsVCJ
         iVkYEqKoYmn20NMOXxp17XzPCvCsAOyF8gF9ZWiyrhgm0GV2NlOglol+MRfSoQlJ/493
         sjpzTSLZRDeXzlifuVfR0BWVmO4xcVRrTA7sPUsUPRBMWAfNth2adbNFMNXXXZwZvKN5
         Z+hgr2nB33r4ToUnbYMsN135LBAXJLN0vQkpr5SNx3ND0WLGxO3c6kBwUmBGxy3nMMVS
         D/gLswDqEiOvxM7ZkrwJlivY1Ry8vF1QnFWN8F3MPhuzmegaBwj6Atk2R94MPkv+9His
         M+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792638860; x=1793243660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kVLnv2hV2zrpGw9FDH2/8id0hh//8Wt7wb7DvFNPdE=;
        b=Wbz5baCA3DRwuuEBmZx8zdg9hV4IntTdTD8ImbJLdniyYYI1fYYBruvfineNwDKfGt
         VQx43NVcuTnmdHPLMGhXS2j88gN7Dn35Vb8553nffJCMWyqLhrqx3DeW9KsRjg3evd/G
         MuxSsdLzApEhu67E/CBbXeqApY5P4losz/KxUCCBa5QIl5SRAvkMdl8nE9j6lCsSbKlQ
         inPs8xe/UmokeWe6iWzhGoEVP3yqFqQUIYqYoeHVMRvKoBvQcDk5N2dNDr9aiTCJ6XCV
         G0js0t5NlQq5MCWdYTeGG03foQt6AbwlQBP01Pn8rqJM46CUXf58gtxluMW7VsVIYhYm
         1IiA==
X-Forwarded-Encrypted: i=1; AKwUvBy+rqusv0/xRcGng4sKbHTZ4nRPIff5BiFAGwLJy8WKjf0lIY1zZjbsE6edHPDBd4YRlYfycN83MfoPkMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIteQ/KL6EY2sNNJSvuaWZp3D2d4SzqWI/VZyaec1999wq7d8i
	lK4nfDhw0Od+2qgR1DPYLi0yuqFCMYNnMOSAPg+iWJgrdqZfDaZt2g815bXhJS8lHQF0S8rTZ6P
	satLzTftZESic46ZJU8HbhT4D2ytvhro=
X-Gm-Gg: AYBFou2hSrUodjJ7ccUl7QHgpaSMRNzP+yrbOmxqsrkb0TS1p4AGCbRMPfViC4cEsAp
	+2FdOW4g2risfARATBRbUX7tLG944Q2dmHyIgeuyubIlKGl7xxqxO95fboPnBsdZyUJMSb0rv4D
	KNy+iTNoB9pEdQsXouoQfMz8eMnnGMSQ/RGJ+S6K8O7Mmda6tbDj7WAbAPosfzTQm9NXjojUQng
	iEfUFIBMrRceNw35iyld/zreSO33yurHHU+VOgnL3vgKHeKv6ktE7poiTwjm75v5fWlXsiNuYH1
	jZDjEEk247vnkUuVbko5i2jDsdM1VFVr4TuAiH8CO8EZFfUzxXwtWNR5C0AxuXPOgnyotlx77/H
	AZ3QIE/t51rmtLH4qAzbENS5IOFOy2/nc2sJF
X-Received: by 2002:a17:90b:2249:b0:3a0:8050:2ec9 with SMTP id
 98e67ed59e1d1-3ad86e9ece1mr3258080a91.16.1792638860114; Wed, 21 Oct 2026
 20:14:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com> <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
In-Reply-To: <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 22 Oct 2026 11:14:00 +0800
X-Gm-Features: AclHuK92YzMRqe3nbcAuvsEDtl0iTLHAU4KdEya1SiUN05LrVGuOLEhQ5DJxyHo
Message-ID: <CAA+D8AMQ+yExGtpRkTpL0g1AQ-tarF_fUsNj5HsghmF+nGNhzQ@mail.gmail.com>
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, alvin.sipraga@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:31=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Mi, 2026-10-21 at 11:09 +0800, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > reset_control_deassert() and reset_control_reset() are documented to
> > guarantee that the reset line has been deasserted, respectively that a
> > reset pulse has been issued, by the time they return.
> >
> > For a shared reset only the first caller runs the hardware op; the othe=
r
> > callers just bump the refcount and return. When the op can sleep this
> > breaks the guarantee: a second caller can observe the bumped refcount a=
nd
> > return before the first caller's op has finished, and then touch hardwa=
re
> > that is still in reset.
> >
> > Add a reset_controller_dev::can_sleep flag that a provider sets when it=
s
> > reset ops may sleep. When it is set, serialize the shared refcount upda=
te
> > and the hardware op in reset_control_reset() and reset_control_deassert=
()
> > under a new per-control mutex, taken inside the SRCU read-side critical
> > section. Providers that leave the flag clear keep the existing lockless
> > path, so callers in atomic context are unaffected.
>
> I think this paragraph should go first.

Ok, will move this to be first.
>
> > Set can_sleep in the reset-gpio driver, which drives the line with
> > gpiod_set_value_cansleep() and may therefore sleep. Other providers who=
se
> > reset ops may sleep still need to opt in.
>
> Please split this out into a separate patch.

Ok. will split them.

>
> > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
>
> This is a partial fix for an issue introduced by 0b52297f2288, but only
> for reset-gpio, which didn't exist back then.
>
> On the other hand, the patch doesn't apply before commit 8c91302a29bc1
> ("reset: protect struct reset_control with its own mutex"), which only
> allows this to be trivially backported to v7.1, with adjustments needed
> for older kernels.
>
> The commit this is supposed to fix, 8a0de73cf9dc ("ASoC: ak4458: add
> optional reset control to instead of gpio"), is in v6.2. I'm not sure
> if something changed between v6.2 and now that exposed this issue for
> ak4458?

I could not find a specific change between v6.2 and now that newly exposed
this for ak4458; the window looks like it has always been there and just
became observable with async probe / SMP timing on the boards we hit it on.

>
> In short, do you have an opinion how (far) this should be backported,
> and does this warrant some Cc:stable tag?

You are right that this is only a partial fix for 0b52297f2288, and that
reset-gpio did not exist back then. Since the race is latent - it is only
reachable once a shared provider whose ops sleep exists (reset-gpio being
the first) - and since the patch would not apply before 8c91302a29bc1
("reset: protect struct reset_control with its own mutex", v7.1) anyway, I
would like to drop the Fixes: tag and Cc: stable for v4 and present this as
a correctness improvement to the shared-reset locking. Anyone hitting it on
an older kernel can backport by hand. But let me know if this is acceptable=
.


>
> > Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Assisted-by: Anthropic:claude-opus-4-8
>
> Drop, see 1e035297ffda ("docs: remove Assisted-by references").

Ok.

>
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > ---
> > Changes in v3:
> > - Drop the reset_control_reset_atomic()/reset_control_deassert_atomic()
> >   variants and their reset.h declarations/stubs; gate the mutex on
> >   rcdev->can_sleep instead, so non-sleeping controllers keep the lockle=
ss
> >   path and need no new API.
> > - Use a dedicated rstc->shared_lock taken inside the SRCU read-side sec=
tion
> >   instead of reusing rstc->lock before SRCU.
> > - Set can_sleep in reset-gpio; no other provider is converted.
> > - Drop the lockdep_assert_not_held() additions and the reset.rst / kern=
eldoc
> >   text about sleeping-vs-atomic variants.
> >
> > Changes in v2:
> > - Serialize only the shared may-sleep path under rstc->lock (taken befo=
re
> >   SRCU to match reset_control_acquire()'s order); exclusive path stays
> >   lockless, and reset_control_assert() is left unchanged.
> > - Add lockless reset_control_reset_atomic()/reset_control_deassert_atom=
ic()
> >   for atomic callers; gate the mutex on can_sleep so no shared consumer=
 is
> >   regressed and so it works on all configs.
> > - Factor the body into __reset_control_*()/__reset_control_*_locked()
> >   helpers, and lockdep_assert_not_held() at each lock site to catch a
> >   controller op re-entering the API on the same control.
> > - Declare the new variants and stubs in reset.h, and document the sleep=
ing
> >   vs atomic variants in the kerneldoc and reset.rst.
> >
> >  drivers/reset/core.c             | 125 +++++++++++++++++++++----------
> >  drivers/reset/reset-gpio.c       |   1 +
> >  include/linux/reset-controller.h |   3 +
> >  3 files changed, 89 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 38e189d04d09..dd6e47163f6c 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -52,6 +52,9 @@ static DEFINE_IDA(reset_gpio_ida);
> >   *                   only used for shared resets, which means that the=
 value
> >   *                   will be either 0 or 1.
> >   * @lock: serializes the internals of reset_control_acquire()
> > + * @shared_lock: serializes the shared refcount update and the hardwar=
e op for
> > + *               controllers whose ops may sleep (rcdev->can_sleep); t=
aken only
> > + *               inside the SRCU read-side critical section
> >   */
> >  struct reset_control {
> >       struct reset_controller_dev __rcu *rcdev;
> > @@ -65,6 +68,8 @@ struct reset_control {
> >       atomic_t deassert_count;
> >       atomic_t triggered_count;
> >       struct mutex lock;
> > +     /* serializes the shared refcount update with its hardware op */
> > +     struct mutex shared_lock;
> >  };
> >
> >  /**
> > @@ -355,6 +360,32 @@ static inline bool reset_control_is_array(struct r=
eset_control *rstc)
> >       return rstc->array;
> >  }
> >
> > +static int __reset_control_reset(struct reset_control *rstc,
> > +                              struct reset_controller_dev *rcdev)
> > +{
> > +     int ret;
> > +
> > +     if (!rcdev->ops->reset)
> > +             return -ENOTSUPP;
> > +
> > +     if (rstc->shared) {
> > +             if (WARN_ON(atomic_read(&rstc->deassert_count) !=3D 0))
> > +                     return -EINVAL;
> > +
> > +             if (atomic_inc_return(&rstc->triggered_count) !=3D 1)
> > +                     return 0;
> > +     } else {
> > +             if (!rstc->acquired)
> > +                     return -EPERM;
> > +     }
> > +
> > +     ret =3D rcdev->ops->reset(rcdev, rstc->id);
> > +     if (rstc->shared && ret)
> > +             atomic_dec(&rstc->triggered_count);
> > +
> > +     return ret;
> > +}
> > +
> >  /**
> >   * reset_control_reset - reset the controlled device
> >   * @rstc: reset controller
> > @@ -362,6 +393,9 @@ static inline bool reset_control_is_array(struct re=
set_control *rstc)
> >   * On a shared reset line the actual reset pulse is only triggered onc=
e for the
> >   * lifetime of the reset_control instance: for all but the first calle=
r this is
> >   * a no-op.
> > + *
> > + * After calling this function, the reset is guaranteed to have seen a=
 reset
>
> s/reset/reset line/

Ok.

>
> The sashiko bot constructed an unlikely but theoretically possible
> scenario that requires to lock _assert() after all:
>
> https://sashiko.dev/#/patchset/20261021030925.3543841-1-shengjiu.wang%40o=
ss.nxp.com
>
> Disregard the other issue, deassert_count leaking on ops->deassert()
> errors. It is pre-existing and can't be as easily fixed because
> consumers adapted to it.

Ok,  will update the _assert().

best regards
Shengjiu Wang
