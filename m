Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119247;
	b=LHfh16/5Hub76o2uFC+39x08j36D4Rude4FPNPmrKWbi5uTQblnViuT5iPktavkh4UB/
	 D1C+rpuWWyDggOYD++FG6Eq+0+NZqUX86oFIqqcFb6XcyVdc6d12dCP4aawcLeWt2TRyY
	 u9AQog17kKGy0z+fJ3m2Z1HaOhRWdA6Wbtcyq4R7E++Y/1ZzMwIorUrmd5Q7Pb+VGSKme
	 V1BpIpqq4MybiaEjIT8PID2p4MjNfxq7a3/OyXjJo16hGOft8zfZrbkNsp5HKnl+w6Orj
	 X/MhJdAs9Op/z71dz+GTNtXERK98yy4qxW2LNQp1g/GmLXswD21Yq1qYCaD+AKRJA4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G64J3My5E4LHAZytVY99BN0a3iynkD/Y4fMqy8a7CDc=;
	b=3hfW4iFU6VkKaRPGVqfImEhz9UVdRSgsCQN6iKouTCVFaFs5DQTxUW1NgmJqbIgDJGSp
	 iOXlaQcsb7JqFrH5fLRNDS1SFfKHIVKZLGtNKSzyWfwzryGZEpA4MrV2XfKTwEBcz0qAT
	 /G9AMJgxzRMvgiIeYcvPGmqMnlX3QTZuLZpPj9gcyWbze/h7geP2AbqQCWyJmXumXDlk5
	 a+S03ZeaJEhhqOVMCpYpY36/VCMogfRMikw4wPvjKrxUTZTVN7jI9B9dq03V3/L5a2KGU
	 NYPSJSWJI0OpTKbANcuX/q3IZarN5myMMqm9wrLJMzWBeqLgxNNiQ2uye6HamhvPHeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihnwKcxC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E8606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19E8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihnwKcxC
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b05bf699easo41480297b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119246; cv=none;
        d=google.com; s=arc-20260327;
        b=TUC75Hp+W9sZ3WYJkEmREDLNSTw50kDqdeJqUHGsz8pjEYlxJn5TRdhSdvUfC90nVN
         huRVmJ2bJRuUcDzCUQh1Lg5r1j/+rEj2ZjJBirHExcCFB5MTIQKU2xwln6+drgLgY0rC
         Sx2ZHVsxaLcpyXjjCkJjCkX4l0dzna61tq+pLc7jdidMOctf7LjgMKMz4QF5Ppv1okv4
         ptd4Tq0lSh3hwztYZi3coitGQ/WF1UqhRJP3VrvO4OVPNXTqxuqZEIB6N4aq8TuYz3o6
         Za/cufoe9m0aqhDI4M2Kt0+YzkQxYhmu9OMNA6Xii5RoTmFtWWj8vtc2sHzZeh0DT9ou
         uJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G64J3My5E4LHAZytVY99BN0a3iynkD/Y4fMqy8a7CDc=;
        fh=oeN0Usw+UafQ4nnOtEuXybZObh/vZ2Hk7NhTGwP0JYI=;
        b=Ay9mjIGoHJBD3yWIChOWjxsE6KEXflE3sxBm3rQYgQoacO2W59erWDiGrqXwtwwpE5
         BX0ZrBltTyZBjzqI6bbDUhFb2YpsUvaMVB3swDEctDSkPWBwjUMoSsm6Rwi7MFTHK7Hq
         b9NM6o3OeDwTZkKgawSgvd034QvelKxHX60Zmw3qFT9FoNsDhaNfsaeaT2JCKpmkwQT1
         ofDzCIh3KLiQ5YYj1frOrIKexEnQiahkmkB1ifKlVFThjdphyQi8AXrTlLv7kesKpKjH
         T6mExVWfPEpAdk6bo+MKqy4MZvOk5SQQ09OnNdcQ5arXF2jNyV8DwkyyY4yUS68bOiz9
         81hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119246; x=1793724046; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G64J3My5E4LHAZytVY99BN0a3iynkD/Y4fMqy8a7CDc=;
        b=ihnwKcxCTJLEgMsjfIVumhb6S0IfEmdzQwZEYEoTXBg7l0yUs2viibcjKq+iTQidF7
         O8BcOsQKRMPh7AN3jfl0F2oF53nmB+3HME49sCtOa+NCR0k5I/pOikZg5PMEAHF1m5MB
         DsCDOtERRjqVO7qZcevvzlSuJm/9UMMioLJ0KaULaLQz73rO6imX9JcHOV9Kl6pzy2RA
         vwgi5QTkqwNg+tR1HhAf3J5jZH4PXC0cjj9FxDdmzqllqgoik6ahJ+uvCoP+kNlazJwQ
         43GMbCFUXNmWl7PDNmflZTBVJ0V0UCzZnEa7ewGeG8IsKFI4VvRs3TA3PDS38FpaVmBp
         Cf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119246; x=1793724046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G64J3My5E4LHAZytVY99BN0a3iynkD/Y4fMqy8a7CDc=;
        b=KOBO6nUc/uU7Y8Zx9rGJEErrQze0BKcpn+KrhbG5o7LLYg4HBwp1qQdYcTIs7KJd7b
         NFxz3ncDQzEVnvRmGKFj5+wEUog8OW4jnafN3bBFXufU8ap9WvBSVmDsBcdyhe+5RSdO
         65u/CTY/gcCnRebdxY8u8YX7o5Nof8aOo4sVUlUOLDSMip+GLREDnHsfTm0GIPOhfvco
         GHMuTuMQ4jXnMTBn3qDf9cHlMRpVtUnoL67q7YalQQEsXPzY7eFHoYlo+Z3ayVOQIjJP
         3MNbJ5iufBNC/nRt0EvZZraBys/wXz1Sr2R0THo5Urqi96I3OskHrAdct1JoDtT1/KfS
         lS+A==
X-Forwarded-Encrypted: i=1; AKwUvBzGpfs3y0Q1pK2Q0GFJtuDQKbq12O9Ymu2Ohc6UDb8QaGGnEuFeB5PV4R8ULbhKF6Lpb+TGqiGqtCp1Bt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIIGKhE3OxqfkymQAgZLmwJLYnFmlFhTbPxvTkri/QIvQRUAni
	9/I0NSJ0rVrGb/y9agGPH9om7NFJaJuEJ1MzFpDvdB8LhyfD8Z8zBl4HgsUJTXeSby0OjT7r/W7
	9UEZ05k6avEkD9a7M/grDr2CwMpzHicQ=
X-Gm-Gg: AYBFou0yvauF2fbVqJa+eEpLIk9umiVBHjwQZayKYOOXUd80pL7Q5J/YZaXt2/N/I8w
	zJsiiDBYAalxK3Q9aM391TBzSnOkRA0rVuixhBWpn74KiLEiYifPNAR4+4o9wlx40Dhoqax1Rr1
	qye0wKwq06aAtYexGGGjCfJPSP6fR9tf3s/1lKZKQ2YMOuw6u0qhuRql+P6PO21xC4ngc+NcHze
	BpQSzmOpLhM+lppHtGd05IdMxryvTdYR3g3XpiVOs2xJsMI/dsRFZunsJqUcUqst70HQixeCiF0
	uv4OGCCyRe+4pEJz/+KyFPTv71uSW5a+Yy7ssP6QefmLigR1V5OGhlHW/xgcy4jhvN6v6VGMaBk
	XOPFYca7aalpRiXLu2AG+jOKQrw3SpFUsKwNV
X-Received: by 2002:a05:690e:21c9:b0:678:151:5218 with SMTP id
 956f58d0204a3-67a7bd81c3cmr32130d50.110.1793119245748; Tue, 27 Oct 2026
 09:40:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027032609.119226-1-lgs201920130244@gmail.com> <179310015976.2808517.13064510476219400398@kernel.org>
In-Reply-To: <179310015976.2808517.13064510476219400398@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:40:33 +0800
X-Gm-Features: AclHuK8AK6dZaz6wgjS33W_jF3KCjGoJH6NgyB5biX1dQWpffjnyXhNOXiRNnyU
Message-ID: <CANUHTR8Ypwpm+Qqmk-fob1=e040rRH5QGTs7gN6MWRKQYyOdCw@mail.gmail.com>
Subject: Re: [PATCH] mfd: twl6040: fix IRQ action memory leaks during teardown
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, 
	Samuel Ortiz <sameo@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
	linux-omap@vger.kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

On Wed, 28 Oct 2026 at 00:26, Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 27 Oct 2026, Guangshuo Li wrote:
>
> > twl6040_remove() currently removes the regmap IRQ chip before
> > removing the MFD child devices. This destroys the IRQ mappings
> > before the child drivers can release their interrupt handlers.
> >
> > The parent driver also registers READY and thermal interrupt
> > handlers using devm_request_threaded_irq(). These handlers are
> > normally released by device-managed cleanup after remove returns,
> > when the corresponding IRQ descriptors have already been removed.
> >
> > Consequently, free_irq() cannot find the IRQ descriptors and the
> > allocated struct irqaction objects are not freed. The associated
> > IRQ threads also cannot be stopped through the normal cleanup path.
> >
> > The probe error paths have a similar issue, as they destroy the IRQ
> > chip before the device-managed IRQ handlers are released.
> >
> > Remove the MFD child devices first, then explicitly free the
> > parent's READY and thermal IRQ handlers using devm_free_irq()
> > before removing the regmap IRQ chip.
> >
> > Also update the probe error paths to release successfully requested
> > IRQs before destroying their mappings.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: ab7edb149c75 ("mfd: twl6040: Convert to use regmap_irq")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/twl6040.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
> > index 562a0f939f6e..7b05d21cd17d 100644
> > --- a/drivers/mfd/twl6040.c
> > +++ b/drivers/mfd/twl6040.c
> > @@ -745,7 +745,7 @@ static int twl6040_probe(struct i2c_client *client)
> >                                       "twl6040_irq_th", twl6040);
> >       if (ret) {
> >               dev_err(twl6040->dev, "Thermal IRQ request failed: %d\n", ret);
> > -             goto readyirq_err;
> > +             goto thirq_err;
> >       }
> >
> >       /*
> > @@ -791,10 +791,14 @@ static int twl6040_probe(struct i2c_client *client)
> >       ret = mfd_add_devices(&client->dev, -1, twl6040->cells, children,
> >                             NULL, 0, NULL);
> >       if (ret)
> > -             goto readyirq_err;
> > +             goto mfd_err;
> >
> >       return 0;
> >
> > +mfd_err:
> > +     devm_free_irq(twl6040->dev, twl6040->irq_th, twl6040);
> > +thirq_err:
> > +     devm_free_irq(twl6040->dev, twl6040->irq_ready, twl6040);
> >  readyirq_err:
> >       regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
> >  gpio_err:
> > @@ -809,9 +813,10 @@ static void twl6040_remove(struct i2c_client *client)
> >       if (twl6040->power_count)
> >               twl6040_power(twl6040, 0);
> >
> > -     regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
> > -
> >       mfd_remove_devices(&client->dev);
> > +     devm_free_irq(twl6040->dev, twl6040->irq_th, twl6040);
> > +     devm_free_irq(twl6040->dev, twl6040->irq_ready, twl6040);
> > +     regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
>
> Why not use more devm_*() handlers?
>
> devm_regmap_add_irq_chip()
>
> devm_free* eeks me out.  The point of devm_*() is that it's managed.
>
> >       regulator_bulk_disable(TWL6040_NUM_SUPPLIES, twl6040->supplies);
> >  }
> > --
> > 2.43.0
> >
>
> --
> Lee Jones

Thanks for your suggestion. I'll look into using devm_*() APIs in v2.

Would you prefer that I submit the twl6040 and hi655x-pmic fixes as a
single patch series in v2, or separately?

Best regards,
Guangshuo Li
