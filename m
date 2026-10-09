Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B448A8D3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539993; cv=pass; b=gfY3+zYfHItRY/lx0BmesOkZCYstSNPm5s5nk6+gUwq3SKgv+C5mTFSCwFF/izAhGwW8xrTKGYniUoD12o/HX3RQKyyOzgLmOID5lqhUM/1ZfK3H0zBsFXjLcm674+fLGF+NOf9EojldGUL9QEVT4v4m72b5KeDzDWF07arLcx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539993; c=relaxed/simple;
	bh=i7++zG8AWQ/7X1mmcKKFhfNKYOrusr69yRalwyg4/cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VihUm2KVJx8eMwnq72y2twoTFZiLaAMfZQwWn8jIyvuBPAqAn7FJCe4it142ClRu6wJuaNdzKHwjROvY9AZ+mmXaSumVEL4NBnqyeNzJDrP0FnnWx4Fqc8n6JMSDFMERluJqycL8dbcfL4wh4iTcjVPGIy9GCxDrpZNuKqM10Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvCv2CsO; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvCv2CsO"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so70819705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791539989; cv=none;
        d=google.com; s=arc-20260327;
        b=IQ7gX2iK0dDRfsjDrBznjQiC2IvZHvAJTMaW+K05o5EZTx1G/fpJqX7pLGmBNUAQSX
         Qa90Wmj2dQnrRTowVyA+ohLv2rgVRCtFS/9b1TmfYsC7JFkbvb98ddn8JblH70k2RP9o
         SHBLru1Epx9KExsrf3Ws6rvwh+0tg0FJKuvvBR8D2efzwC1gyiwVsX7nRcU0RFe3mpAG
         jG+zEFNBje1GZZLuejYRc+UPcWK0tpYchWYvqxkZAZ9G4KRmkNViIINSdu1EB1AGsWg9
         Z0B9davEhKNEgeOtgz8kD2KsBzeo6HY5LCUzRAblcBg5oBLYFg+TaYfPXxSB6+xe80Y2
         Ey3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DP8waD2qmyevQkHk4p1Bx+MKMco6/5BSdUOLT/BBidw=;
        fh=oJWGld9E4yyXBiL3s2RBIZNF3AeQSv0APu8WsZqQFhg=;
        b=T8s28Y+qb5x57elQDJKk1mgY5s0OW4tIwOVeIqfGtO1t4VY+djxK3gEVydwCSdiOvY
         FtnAmbKpzSQjvFwDXemzqgJOEhYhFvj3cW8mkIuqtoLcdE78DtiadAn7UGwrS5QqPhDx
         9XjxAgRRaryBLymYZtLlXdndj4h4cFXuXkTdrUmzKgGmgkPUQxPGn882gzUNz7g1v+vH
         j8qiwga5s6MBcTHDx/HUlw9M4jDPvZVd+mpEhF7TQSCQlDeXA5GaFuujFyeJxcKXpKbG
         zryZkCBNM9jUvAlaBCuJGHIhgVmDhBDrHPzcjwLcGYz251aLvC1tYKC9uFucK8RG2Ar9
         l3jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539989; x=1792144789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DP8waD2qmyevQkHk4p1Bx+MKMco6/5BSdUOLT/BBidw=;
        b=fvCv2CsOwtAvcyKKRWNfjyCHHmI1iPWsTfH3EawSfSC10aG+ygccxRARgXoVva+/yf
         37OPSQaoOLgIOxIs1YgOjWvcA8B2daciBl4kN/jO2A4WsJyHEYrDcVx/mIZUwaz1Ac9Y
         HKRXnu5YYbTQ13q+9I2BtD0vgCdbNFWDHiTXLmyv1aI4dFzjiMIUWaKpLZFgVVZqaAIc
         PqbAw7bqmjsgP/QRoiCEATXLtRC/LYHq8IQHkyvCsUtI2d7f5V9fEtgT2Vr0bRFIjddA
         EaAU1wHKUfKRqF/3oU/Mrrat26aDZt6AgnHZN2D8V8A+b7qgDbXCAZ9ojb4RrQuiVLzV
         dQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539989; x=1792144789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DP8waD2qmyevQkHk4p1Bx+MKMco6/5BSdUOLT/BBidw=;
        b=mf6Jm0WdDvtaWqEvnYb3ZhklsfnGkLHa/HTG7x8/Min2EfVmAyVq7wHt9BjrIj5US1
         rZGHMvAEFbFaIFKPGEJX3VYW2sPZDvi/MOvXwlq4DHGxRW692Flyb7770wUqx07qPSWr
         VvmWJOsrNlyIfWfR9nNldbOn0JbI/+MXsIOLpz2yakoALBMAK1Dii/Hf1fbe3UV8UBhX
         EfoHqoAsQfJz5e1QmDKuS6qQAvhbxsdwZ95dqAOmGdX/+TmbWvnert5SQ+FfC7SETEbi
         Gd8s9m4WT+TtgbLzJ6nCUqZ7fMsHzmlP5QEXw/juTFXGePCkYc+z5E6dLiOq9V97eyZF
         99wg==
X-Forwarded-Encrypted: i=1; AKwUvBypv4DQ2RR2EBWXP9fthwcyMB2JLLd5GkgHGc8Fc4fBBl6waeX0cjDXGk6FuB4xPpJN94Y4fmYIPLr6XQA=@vger.kernel.org
X-Gm-Message-State: AFuF++nlQobjXNlMvRyGjEcSNpBlPVqRG2y+6jRIFMbBCHwn3QIYCjJE
	IIlkVbOJ4TTNGqR4xOU0aunv4meE7WwWqXU9fRcs35AGWvVUz4C78ypu6JsZID3hQl1X2w/6PeW
	rjqhCWX/bHjQYFXK2kc7eQ6hwsmy9uBI=
X-Gm-Gg: AYBFou1TbREHXQ+bXb+mamoOeg+kMLEOw84o5dB0WWDUlH1lLM2QTfMLpigX71+9lCM
	KFY8cyLzuYpSE5xJqvDT2BP0JqeAoLxdQ2/VzMC5C+jEs8e96xd3Cq2CDWLQwOGrX4IX/4qFfxB
	KufIVoml2lXvlrMvD9Zv9SQN1P9OmBpKztLcwHqG1rpDnBqyHYvXLGP3uu1FkteXMJDuWI3YBJ5
	71Pw86JBvhi5MGw2fe8LW0zn5VaT2bM6F31lNt7aZLDu2ptFCSDNwvqSkNeHIuK4RERMzGdTnOm
	96+AUDtFV3bqQSDLaryA47CcSRa/W/UK3P3owiZ2XbEWF9e8s7qNF4J01vg4djhYQrNE1b5o50p
	29HvyAKtxgNkFR7XzJFDZAag7jMpGC7/OtN2yi8om+W3jr5gZf3dnQ5osKatRQHmSiB0Z8KKOEw
	==
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id
 5b1f17b1804b1-4a18e4a4f2amr24783385e9.6.1791539988785; Fri, 09 Oct 2026
 02:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929122407.219448-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMRc=MckUuLsgqjphOs=fiyz3wCaGbGWpt_fPKStZRAroPkE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MckUuLsgqjphOs=fiyz3wCaGbGWpt_fPKStZRAroPkE3Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Oct 2026 10:59:22 +0100
X-Gm-Features: AclHuK8v8wJ0xixm3ryTG5vUqFvUu0_BpBhVKHGRmBMB2paMCe66RtJNZrKZm2Y
Message-ID: <CA+V-a8tV1uoBuRLyZHE_tqL9zU2hzZ9BNkwVMABL4aAEGEFQeA@mail.gmail.com>
Subject: Re: [PATCH 4/5] power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and
 RZ/V2N A/D converter support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

Thank you for the review.

On Thu, Oct 8, 2026 at 11:10=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 29 Sep 2026 14:24:06 +0200, Prabhakar <prabhakar.csengg@gmail.com=
> said:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On RZ/V2H(P) and RZ/V2N, the SYS_ADC_CFG.SY_MSTP_ADA bit controls
> > A/D converter power-down. RZ/V2H(P) has a single A/D converter unit,
> > while RZ/V2N has three units sharing the same bit.
> >
> > Add an "adc" power sequencing target for these SoCs and match it to the
> > RZ/V2H(P) ADC compatible, which is also used as the fallback compatible
> > by RZ/V2N.
> >
> > Clear SY_MSTP_ADA when the first A/D converter unit is enabled and set =
it
> > again when the last unit is disabled. Wait 20 us after clearing the bit
> > before allowing conversion to start, ensuring ADCLK has been running fo=
r
> > the required time.
> >
> > Bind the power sequencer to the RZ/V2H(P) and RZ/V2N auxiliary devices
> > created by the SYS driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 84 +++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers=
/power/sequencing/pwrseq-renesas-pwrrdy.c
> > index 0190e53913bf..ab20b7ba9b83 100644
> > --- a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
> > +++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
> > @@ -5,6 +5,7 @@
> >   */
> >
> >  #include <linux/auxiliary_bus.h>
> > +#include <linux/delay.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/pwrseq/provider.h>
> > @@ -15,11 +16,68 @@
> >  #define SYS_PWRRDY_N_DSI_MASK        BIT(1)
> >  #define SYS_PWRRDY_N_CSI_MASK        BIT(2)
> >
> > +#define RZV2H_SYS_ADC_CFG            0x1600
> > +#define RZV2H_SYS_ADC_CFG_SY_MSTP_ADA        BIT(0)
> > +/* Minimum time with ADCLK running after leaving power-down mode */
> > +#define RZV2H_ADC_POWER_UP_US                20
> > +
> >  struct pwrseq_rz_info {
> >       int (*probe)(struct auxiliary_device *adev,
> >                    const struct auxiliary_device_id *id);
> >  };
> >
> > +static int pwrseq_rzv2h_adc_enable(struct pwrseq_device *pwrseq)
> > +{
> > +     struct regmap *regmap =3D pwrseq_device_get_drvdata(pwrseq);
> > +     int ret;
> > +
> > +     ret =3D regmap_clear_bits(regmap, RZV2H_SYS_ADC_CFG,
> > +                             RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
> > +     if (ret)
> > +             return ret;
> > +
> > +     fsleep(RZV2H_ADC_POWER_UP_US);
> > +
> > +     return 0;
> > +}
> > +
> > +static int pwrseq_rzv2h_adc_disable(struct pwrseq_device *pwrseq)
> > +{
> > +     struct regmap *regmap =3D pwrseq_device_get_drvdata(pwrseq);
> > +
> > +     return regmap_set_bits(regmap, RZV2H_SYS_ADC_CFG,
> > +                            RZV2H_SYS_ADC_CFG_SY_MSTP_ADA);
> > +}
> > +
> > +static const struct pwrseq_unit_data pwrseq_rzv2h_adc_unit =3D {
> > +     .name =3D "adc-power-sequence",
> > +     .enable =3D pwrseq_rzv2h_adc_enable,
> > +     .disable =3D pwrseq_rzv2h_adc_disable,
> > +};
> > +
> > +static const struct pwrseq_target_data pwrseq_rzv2h_adc_target =3D {
> > +     .name =3D "adc-power",
> > +     .unit =3D &pwrseq_rzv2h_adc_unit,
> > +};
> > +
> > +static const struct pwrseq_target_data *pwrseq_rzv2h_targets[] =3D {
> > +     &pwrseq_rzv2h_adc_target,
> > +     NULL
> > +};
> > +
> > +static const char * const pwrseq_rzv2h_compats[] =3D {
> > +     "renesas,r9a09g057-adc",
> > +     NULL
> > +};
> > +
> > +static int pwrseq_rzv2h_match(struct pwrseq_device *pwrseq, struct dev=
ice *dev)
> > +{
> > +     if (of_device_compatible_match(dev->of_node, pwrseq_rzv2h_compats=
))
> > +             return PWRSEQ_MATCH_OK;
> > +
> > +     return PWRSEQ_NO_MATCH;
> > +}
> > +
> >  static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 m=
ask,
> >                                  bool val)
> >  {
> > @@ -127,6 +185,20 @@ static int pwrseq_rzg3l_pwrrdy_probe(struct auxili=
ary_device *adev,
> >       return PTR_ERR_OR_ZERO(devm_pwrseq_device_register(&adev->dev, &c=
onfig));
> >  }
> >
> > +static int pwrseq_rzv2h_probe(struct auxiliary_device *adev,
> > +                           const struct auxiliary_device_id *id)
> > +{
> > +     struct pwrseq_config config =3D {
> > +             .parent =3D &adev->dev,
> > +             .owner =3D THIS_MODULE,
> > +             .drvdata =3D adev->dev.platform_data,
> > +             .match =3D pwrseq_rzv2h_match,
> > +             .targets =3D pwrseq_rzv2h_targets,
> > +     };
> > +
> > +     return PTR_ERR_OR_ZERO(devm_pwrseq_device_register(&adev->dev, &c=
onfig));
> > +}
>
> This probe variant looks almost exactly the same as pwrseq_rzg3l_pwrrdy_p=
robe().
> Can't you not just store the match and targets pointers in OF match
> data and keep
> the same code in top-level probe()?
>
Ok I will switch to the proposed approach and send a v2.

Cheers,
Prabhakar
