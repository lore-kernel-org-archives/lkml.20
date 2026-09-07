Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B494156DA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767598; cv=none; b=mHvdPMctJCMTTQa31N4RITfwZzEtBwFBdR8FHSI36Zr6lAXNty1wvNM0PZWJH3ZRmS1RemsxaTrEZivdBDm0m6/YQr3+Ra2tTb4xTeF0mP6DC9mxzaiaqDW2Xe0I8jSOH3d9sT8jYABAwf0CD4V2izEAnZ1QOPaVxBMu0VQ+dWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767598; c=relaxed/simple;
	bh=smhBSOCgTJhbT/0tl4vdE8GcuFKDdQa/HesmddcZaEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/HLZbBfwY5GKnKNXyOI3sID04FzrcpX1szC6j/474zKNLl5f4eMmfd60P/EaWMUyvjJ9bcsmwgB8mNqha/C8G3vHbJPiVAjq0NBDZLwrPzP4zGO1aBZZx9jEogfNz3qMbFdh/jjT5NurkehhoWL0X5U5mdf9opn1ZiyleP/nFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ca74bd6e0so609193241.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767595; x=1789372395;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xuQ9W/PlY4yeKBUrhKIeC1+yJYAlbcdcEFZm5XOVUho=;
        b=VLVAPTCLvHgZ55MUdcE+V5KIIoouLEmYCapLq1t86YPSZSf0Ro7825mcGGQ10HYgDK
         0IT2tS5PPtD9SIOBCQz8wVERZ2bdPQII2z+kww4N2JEVbQ4YEQFYhcT1mY8RsXiUuW0j
         fEwMm31A0J+EUtz1h/+mzNfJ4h+SbgLKxu7T0l3xUFqipejtJ0Th0GyvyaQoQSWy3868
         dSSR1KA1CVuZZojGIEVEWrYjg7yoZAH9bL0z8nohss/dg1p5mGJrdlUJTAPieKNUd+xG
         uScqNwwt/mFFst0xcUwSa9NOB9BzvwMaLRpaiuuY//WGxGfRbrgzv9Ss/6R3Dkd10RiU
         +9pw==
X-Forwarded-Encrypted: i=1; AKwUvBxe/s5eArgRNOhDBx6Dej7/U4Co3VFepk3wcLmODdZdpNcg/4FwIXNugOhy2GjVjks9PQxY/Tf5V5CW2BI=@vger.kernel.org
X-Gm-Message-State: AFuF++kTr7BcaULAy0trEseVwcFVMX7kW7KjNGUxdBSrmxwspZQyQ1lZ
	0BTmiMV4W8he/r+BVdQiAHMkBQe1oU1P4td7ixaHbUP2FGecONrRHsei50z3WldA
X-Gm-Gg: AYBFou0j9Ar0/79sGTpjP6YUvltP3Dq00YLudQjIKE0wrYlpxu4Nd0kw/uRHSZfa20m
	Ob+ep/Rj9ZRDazzPWRcohFwiI2Vis2MWeUVl+aP8mVUknBLERd4ZcDCCWt0MTQMym1ph9Ba3VSH
	H9bhZbuRZCSe4arhiHYJscdeRwh+Q+ce+0K4mTSNrl85hfHVdmzP/+xsYQeiDE2GFh1b13l4enH
	G8uJnFajq/fsyHqtI1kI6gYQVRr8hRsV21cIkMxUxyaTfG5zFCVDmRuMlHe8FfBNEbzhtpcZgSW
	hBkKy62R1JT51zNtixp9DewgvEpFmSl+akKhrRrP2w+CPC/gS8INCMhZWIwYY3LCcuwEwk59BNu
	0prAG1i4HTBPCszoI0m8jpPKLNbS2duDJwezTktKtKy1TrSiqB4geN9QwykHxibjuLOSUHR57az
	phB503UB62+Sxy2SlwUkrEz534EsPfmec/d56CqVXMnlTw4mY5jrx/3DWaLHJzDq5TkSy5/VY9k
	FLnDFgiK8XV3hE3SvtH0sovIg==
X-Received: by 2002:a05:6102:41a9:b0:784:4d38:ef58 with SMTP id ada2fe7eead31-78a4a57f683mr6536415137.0.1788767595081;
        Mon, 07 Sep 2026 00:53:15 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76512sm6564499137.4.2026.09.07.00.53.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:53:14 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-785d603efdeso1049230137.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwHvg0M4w7RZ3JnKlR8Jsv8M3h0qscMbv+4oCJG/1x4ONzCcumqHfNbU9RXBYp/q+oKGcqCTGELrSsPfdM=@vger.kernel.org
X-Received: by 2002:a05:6102:160f:b0:781:210d:28aa with SMTP id
 ada2fe7eead31-78a4a8be7c5mr7302331137.2.1788767593777; Mon, 07 Sep 2026
 00:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMuHMdUapaP-8kkWT5cXtEO1h58aAzzm34XqO_mcrgbVSyXEwg@mail.gmail.com>
 <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org>
In-Reply-To: <b516bf77-fb15-41f2-80ac-b80c621fedd1@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 09:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
X-Gm-Features: AcwNN1WhmE54lrhOaJPOpMY7QFz8OZQIiZjO28-2Vei5FzrroiSGFpU4hWAgaFM
Message-ID: <CAMuHMdWb2Qk=heWhwFh4TsEggHOmzTd4Lj-vG6kXjRVMDDUG2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 5 Sept 2026 at 23:57, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/4/26 1:15 PM, Geert Uytterhoeven wrote:
> >> +++ b/drivers/gpio/gpio-rcar.c
> >
> >> @@ -65,14 +66,59 @@ struct gpio_rcar_priv {
> >>
> >>   #define RCAR_MAX_GPIO_PER_BANK         32
> >>
> >> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
> >
> > IMO passing a pointer to offs complicates the code.  Perhaps pass offs
> > by value, and return the adjusted offset or a negative error code?
>
> I want to avoid that, since if I only return error value, I can then do
> simple:
>
> ret = gpio_rcar_remap_offset(...);
> if (ret)
>    return ret;
>
> in gpio_rcar_read() and gpio_rcar_write(), which are the only two call
> sites of this function.

gpio_rcar_read() and gpio_rcar_write() do not return error codes.
I was thinking of

    offs = gpio_rcar_remap_offset(p, offs);
    if (offs < 0)
            return 0;

which is almost the same, but avoids passing offs by address.

> >> +{
> >> +       /* R-Car Gen4 and older do not need any offset remap. */
> >> +       if (!p->info.has_layout_gen5)
> >> +               return 0;
> >> +
> >> +       /*
> >> +        * R-Car Gen5 register layout is slightly different and the offsets
> >> +        * that have to be added to or subtracted from each register offset
> >> +        * can be divided into five groups, listed below.
> >> +        */
> >> +       switch (*offs) {
> >> +       case IOINTSEL...OUTDT:
> >> +               return 0;
> >> +       case INDT:
> >> +               *offs += 0x10;
> >> +               return 0;
> >> +       case INTDT...EDGLEVEL:
> >> +               fallthrough;
> >> +       case BOTHEDGE:
> >> +               *offs += 0x70;
> >> +               return 0;
> >> +       case OUTDTSEL:
> >> +               *offs -= 0x34;
> >> +               return 0;
> >> +       case INEN:
> >> +               *offs -= 0x38;
> >> +               return 0;
> >> +       default:
> >> +               /*
> >> +                * This here must never be reached, if this is reached, that
> >> +                * means there is a catastrophic failure in the driver. Skip
> >> +                * any IO read/write to prevent further damage.
> >> +                */
> >> +               WARN_ON(1);
> >
> > A build-time failure would be better.  I tried BUILD_BUG() instead,
> > but unfortunately gcc is not smart enough to notice this case is
> > never reached.  __always_inline doesn't seem to help either.
> I had one more idea -- how about we convert the driver to mmio regmap,
> use opaque register numbers throughout the driver to identify registers
> to the regmap (maybe not a great idea), and then implement .read/.write
> callbacks in the regmap_config which instead of doing plain
> readl()/writel() for register IO would instead do this remapping ?
> Regmap could validate that the opaque register numbers are only the
> expected register numbers and reject all the others. Maybe the opaque
> register numbers could instead of Gen4 register offsets. What do you think ?

That's similar (but more complex?) than the array look-up
in drivers/tty/serial/sh-sci.c I pointed to before.
drivers/i2c/busses/i2c-riic.c uses the same method.

I.e. just convert the existing register defines into an enum, and use
that to index a table with the family-specific offsets?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
