Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC69207A20
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287452; cv=pass; b=jFgfP5u5/5fncZ2SVzK3/iMDqxVU2VPEzb9nnlKettpkyWoyQ+2naxB8XlzRmxpfBTO9vo6xgJ4oN3nGFXEiEOP5B3f82QLdT1hODAPsojgB0BsOj35y2927eUtCwRmTsJ+lQIQb3fxM7DDlfgMNAFo354U/FsaJJwvwsmXMvdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287452; c=relaxed/simple;
	bh=UCPWykPSeFLhhECC9JKMywpS2K7qYEIBFzqJhcYbxZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gN+h0FwWUVhXuMXFUX5+IUByJVpEhA2A466eJB0GJgEOI0tDXbb/jrIJiAFaj3EeJ075xx+6rPq798odrmM13jLdDw4VpHPlB70yjCiO2JdLwCoe7yvZqWZ7e8efmUyWleDwmF05nn0SD2DdLkqVBgomghJ4wZ1/lMna3di3dOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/cVNg8J; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/cVNg8J"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f0b20so35242366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790287449; cv=none;
        d=google.com; s=arc-20260327;
        b=qTiMK7Ex9Bnku1gmRKubKG85IToGheyRKm7IlBUSFXl7ViNECmt/MhaUVQhU5z3hgi
         oOhwQ2ClEpCBVNR7n5kp5DctN6Sv2Hv+Lcs0tIh+xyS6QiOe9lrs5kxRM+rbkFhuJvxy
         mSR0An7yCJ3BdCyf52fK1zrTVgxw43VuxdyLFVNsqS0YGS53DpdzEcEFi2XMUeghdbi1
         FwDzGvEyBYpLNNZ32MzJyfzuzm/wX3wpcqmOoYTMUFGjsZytlvIka46VPnBpuV8DXjT8
         +8KZ9TnaNbBBwBqIaSKURBKt48AGaovg863ck+DhEX0Nn6R16aVyqYREEBf7eloPz7DA
         TrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cr7dYgudHu+YtLQISezbH81OFiuDdMrq+aTJZsl4PNA=;
        fh=/2As9PfQ/8hCAXaPBdQPnGT+tV6WuKWeLxWTIBwo4bQ=;
        b=oyJbYdq2Uh/WnwWpskJlTTj2pkj0vOnPwQFsfXAQBQ+8DEwe8EeZ0lEO1SoltO5xeP
         2FbSOCyZMClfoU/dJd0s4RjWDtWA8gaYUKBdWyw4Gr5lqsgmcxrPzGYmzhRv54hf3d7s
         XzcgJKVLsVjfBOSblqUseINYLU1wvi4DhDaSlxwFTYpZEPf4Oh5I2T9TnXkxO+803o9O
         Y/H6d1ZjCLlJcK+yDZxxcNyyTSH4NiewHTw6rESohSm/eDsmTyJSNZ58y7M37I6Wixwn
         4Z77VazvhqElvnk99XZvKDRSiSEN8jAUGEVXckFih4pG5pHCf7gDMAuLrhl0u5SHk5CH
         BA4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790287449; x=1790892249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cr7dYgudHu+YtLQISezbH81OFiuDdMrq+aTJZsl4PNA=;
        b=n/cVNg8J+epaVSps6OF98mAXo5jr3knHjQ9tRVUxTC2B9B2DF/M3GSwgoILbtK0UJJ
         5djh9J0j67a5TVAiUIqIV/C1VUfz3WOqo2oy+OFAxO5vkS/B6arzzI9+NTLSxKX90Xt6
         XCz5EkEdEs7Xa+9sG7MBGstBWay0s46s0vkOncoP2zO2QM2P8Y7kVm/zCi1NV5bnprt/
         iGTDJQbj0i/8heqBkxyjA5XD2gYZP2mavSLM7NKnrLKz0ZJHEJTBN5c+zgP37wq1ugDm
         VeJgRqmvETYwYVkwTMPEKm1ZhI6gDxOH6OVQrdYb0aTQMP49MSDSAvyj7mrM4DKBY8il
         UqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287449; x=1790892249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cr7dYgudHu+YtLQISezbH81OFiuDdMrq+aTJZsl4PNA=;
        b=lmp+CUb72NdeXm0I1MSSVLNzBdsueR1856LLgrutE0Q8F5lyKqaHSNNQhdeOECWIBt
         sFm8yD8+o8njr9gVvxdcIydkqhh43I3wjkQZTu1/+tm/03y70I2eWiNPBPFnerF7Uhlb
         sgqltkC4M0ykG9dErM3vvss0yooc9Wv7P9x486t/0rNX6ECrwszFUxe8WtWa18Hnnb4/
         b5F7Z8YYGRWgjvNOGj78PX+XZK1dsq9sfmJotwZ0nrK4/P1taQQdMk5NrP9D0iKoHIPi
         Fzdf5w5pMLW2li+wg6g+xqikavYhq//GSzptg0QbfAeN0KxCFQbqPu0rq0Jzk0H8vI2r
         S0CA==
X-Forwarded-Encrypted: i=1; AKwUvBxTQXGSagA+J7f+/2fDZ8K7DFeYboDvvToudj3/2wF/kGO1bn2n06ar30b/64OJfFJkS46AK6LL8yALzVo=@vger.kernel.org
X-Gm-Message-State: AFuF++nCZnKaA+djMSIW4aq2W+qjovJ2NeRZcbeWuLlMmZF4qi4EsDQz
	ULmbTPDi4yj9jnmiP07sutCCLMuGkSNKGhibBHaiW9NcuM1qLiWE4selLn29Ot6r/cHsCqCpxDG
	1HVsg708sxVQJDaJeYzCDkKLnq4xiPQ==
X-Gm-Gg: AYBFou00dpo4RW9FBtlm/xYrrWsfiKmB7ygKco8XMkhTSmZ/WidLwl0zq7nRWfsFLq3
	jKZqusqQEP+kc/XH7/r4KKgQGug78vMgc5doCVQOCTKnIhXaC6QxM5v4FUOnYAMHz4qH7s8axAA
	W5vl6L2Z9RsLbVQ7rDVer1WJJpzlLN/y+x4HUzCZXTeOf6BiRQmjOOaPfmQuTw9iPiHXrga3zci
	ne+1XVmHm2GAdZh4hecc1RoAgXlDZyhkhd2FV9Y1OB7tpocPBg1f7Rt7U8jLkNG3UIJscve8RP9
	4APrgYDAsvosk16dok0Ni8tZK2caCH5widjexKbZdfXnNSVZRVgqTpNdn6WZETbRIcZN4YSKJ/k
	xeWTasvGoK+mt4hnYuupc7yXZ8bvb6uKgfsBqJL1qMNiB3pzsJsMm2Zij4FOMMP83gQJO
X-Received: by 2002:a17:907:9306:b0:c29:f5d8:9c7b with SMTP id
 a640c23a62f3a-c2ac22ca80dmr360018666b.42.1790287448555; Thu, 24 Sep 2026
 15:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923030641.992569-1-mhun512@gmail.com> <arOc2HZm3JCf5tjJ@opensource.cirrus.com>
In-Reply-To: <arOc2HZm3JCf5tjJ@opensource.cirrus.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 18:03:56 -0400
X-Gm-Features: AclHuK_4Jp1hMYF-kdtO3xj5KB7MKhICx974fvLTFZOhQYR63pYwwCIBr3cBE7Q
Message-ID: <CAGEsz8HN81_F5h3oDzJvyiF5FidOfUYGnwH+JsbLNQ6GY+_Lfw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wm8962: Stop IRQ from requeuing mic_work on remove
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Charles. You're right that the jack check duplicates the
existing IRQ mask handling.

I'll update wm8962_mic_detect() to mask the microphone interrupts,
wait for any running IRQ handler, and cancel mic_work before changing
the jack pointer. I'll call it from wm8962_remove() and keep the IRQ
registered for the other interrupt sources.

I'll send v3 with these changes shortly.

Thanks,
Myeonghun

2026=EB=85=84 9=EC=9B=94 23=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 5:33, C=
harles Keepax <ckeepax@opensource.cirrus.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> On Tue, Sep 22, 2026 at 11:06:41PM -0400, Myeonghun Pak wrote:
> > --- a/sound/soc/codecs/wm8962.c
> > +++ b/sound/soc/codecs/wm8962.c
> > @@ -3115,7 +3115,7 @@ static void wm8962_mic_work(struct work_struct *w=
ork)
> >
> >       wm8962->mic_status =3D status;
> >
> > -     snd_soc_jack_report(wm8962->jack, status,
> > +     snd_soc_jack_report(READ_ONCE(wm8962->jack), status,
> >                           SND_JACK_MICROPHONE | SND_JACK_BTN_0);
> >
> >       snd_soc_component_update_bits(component, WM8962_MICINT_SOURCE_POL=
,
> > @@ -3203,9 +3203,14 @@ static irqreturn_t wm8962_irq(int irq, void *dat=
a)
> >
> >               pm_wakeup_event(dev, 300);
> >
> > -             queue_delayed_work(system_power_efficient_wq,
> > -                                &wm8962->mic_work,
> > -                                msecs_to_jiffies(250));
> > +             /*
> > +              * mic_work reports this jack.  Removal clears it before
> > +              * synchronize_irq(), so do not queue once it is gone.
> > +              */
> > +             if (READ_ONCE(wm8962->jack))
>
> This feels a bit like its duplicating the mask check above, I
> think it would be nicer to ensure that works as intended than
> adding a second layer of filtering.
>
> > +                     queue_delayed_work(system_power_efficient_wq,
> > +                                        &wm8962->mic_work,
> > +                                        msecs_to_jiffies(250));
> >       }
> >
> >       pm_runtime_put(dev);
> > @@ -3232,7 +3237,7 @@ int wm8962_mic_detect(struct snd_soc_component *c=
omponent, struct snd_soc_jack *
> >       struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(c=
omponent);
> >       int irq_mask, enable;
> >
> > -     wm8962->jack =3D jack;
> > +     WRITE_ONCE(wm8962->jack, jack);
> >       if (jack) {
> >               irq_mask =3D 0;
> >               enable =3D WM8962_MICDET_ENA;
> > @@ -3247,7 +3252,7 @@ int wm8962_mic_detect(struct snd_soc_component *c=
omponent, struct snd_soc_jack *
> >                           WM8962_MICDET_ENA, enable);
> >
> >       /* Send an initial empty report */
> > -     snd_soc_jack_report(wm8962->jack, 0,
> > +     snd_soc_jack_report(jack, 0,
> >                           SND_JACK_MICROPHONE | SND_JACK_BTN_0);
> >
> >       snd_soc_dapm_mutex_lock(dapm);
> > @@ -3594,6 +3599,15 @@ static void wm8962_remove(struct snd_soc_compone=
nt *component)
> >  {
> >       struct wm8962_priv *wm8962 =3D snd_soc_component_get_drvdata(comp=
onent);
> >
> > +     /*
> > +      * The IRQ stays registered for the I2C device, including across
> > +      * card unbind.  It is the only producer of mic_work.  Clear the
> > +      * jack first so a new handler does not queue, wait out a handler
> > +      * that already loaded the old pointer, then drain the work.
> > +      */
> > +     WRITE_ONCE(wm8962->jack, NULL);
>
> So probably calling wm8962_mic_detect() here. Although
> granted that probably needs some small fixups as there are a
> couple races, probably also makes sense to move the mic_work
> sync in there too.
>
> > +     if (wm8962->irq)
> > +             synchronize_irq(wm8962->irq);
> >       cancel_delayed_work_sync(&wm8962->mic_work);
> >
> >       wm8962_free_gpio(component);
> > base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> > --
> > 2.53.0
>
> Thanks,
> Charles
