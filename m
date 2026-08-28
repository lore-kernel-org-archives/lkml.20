Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3953377563
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937438; cv=none; b=OrIT/6CUJZ3CSWN90zHhak5A3qsUYf2Ioz2cGnf6aNnQWlQEsxn/DqpkE3x/kKGFlyKTjZkxMBgR2fbFgGdFDovuaY0od9TjxxhDgFYuXo7qPXbp82fCbBfLWodGv7a5+UTPdM/550r9RMTei0KdJE7SGvcEq3vyXLnQc6aHqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937438; c=relaxed/simple;
	bh=n+VYlEwI6ctI3pyKixI8TWm6nE2Lv/uB0QABZm26g/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBBTgJedJmjzhkTEwAm6RXaKSIMHSoia2y8RJhILjaSdCKiKBmyueILj6Rx2Onw3Eg/bMTBlQXuhFBLcU+F8MY7QDttdzR9+3gGlDP/lPAYMob9jqGAXQz3qfM/ZFYvUs1m7AbZjYIqj8FPBj+9yVFwXRXucfqL9Z6FkXwm5fvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7841b831381so274942137.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937435; x=1788542235;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJwmn2u3yEvtirjEY/Sfkzcv2VJy3izJDZbrh31Q+TM=;
        b=iV6QRK039lSlTzqXL3Z/7zOs93nNuRNxYiCTkXuLW6qsgwGnsyqzVmmSCGuTPR8U7n
         NeC57W+Ux92rgZh+VtaJiVUwTcpJ1h/hWFMtx/YR3pd3a7XgzlbSTSzGlGauqFFFfmYI
         rJz6C1CbqUKeVmkMRtsphy654JebqyJFLpneLWrE4LAmEL4+qguAnEf9Lt0yVZhPKlBY
         LngzSnnzRQByVbjapdTZSALZtFx5IwOlw95yfvWW054gn40OmFqzmgxwhx9BYcQajpdw
         FmT+/KPEFFkEUT/FfXQFcfJkys9WKDHkWi5e8OGhczbTDJQqIFhZhWIX5zU9SxtqJ7yP
         waaA==
X-Forwarded-Encrypted: i=1; AHgh+RpmxOinpQHGtuLpqEJjN1GrLz6y6Z/jnr9KQeKFt9GPMsqIM1btlRzE4qVF0li0OcZPx3RB9RpOe7uN688=@vger.kernel.org
X-Gm-Message-State: AFuF++mvK3TznpE38BezrCtCYrGEjWznnH57uYS22DbBQExYkLe4trbM
	NKZXywpjdFkqbya+mTx6Ko0d1yAkoQoeai6BoOKb9YjQnxePEk6js0BtA3ZWxyXT
X-Gm-Gg: AR+sD13cyaJolv9Nf/2QZwF110G1A0vGwAOHh9/0K8KmwYWydAAZmnsvb+pbf8PFirF
	twcYY66s4cDoV7B59wyPPKXAHG4deKvTEKhMDv+S4ER1vabpgk8rV3noVC7ecWmXP1+GNwiB7HK
	PDOIWrLUn4b39d03y8B9l9oiUpZbrjl9nDKJkeFgLYQzX063Zc6p3xgvvxaGmEe8tuzJMEiELzj
	xSxjdUDZhw6McgiQvhiEpYCnoiYG6MsoZOxp6xFiWPYlIc1qaqHXts6DhuCcA08MMK2aNdtqSiH
	WqVM4GdBtQVYd1ck82cj1NpA8zEnQi+xcOpxUeI6XMrUVuo367rldW71lFGNb85qoFmkDqjJ0N7
	xD0c25B0OBgopb8JU3S6yUzlhe7oPcHddJsUcFhxxHysE4zKetC91B5ix/Y1uv2TLYOyN45she5
	PWbIofZNfJBMeoKeB0l07KyeunLHWt8SdxXRRKgkYZhLvazPpNWJPOM/g+Rfw+2vbr4jx0hw6lK
	XweB/cumI6MtP297b2Bd1U6wA==
X-Received: by 2002:a05:6102:5128:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-7859822155fmr2332010137.1.1787937434761;
        Fri, 28 Aug 2026 10:17:14 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e849d72b8sm1669756241.2.2026.08.28.10.17.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:17:13 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7868ca1f0d2so176665137.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:17:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro68LaF5YFuSKXjkUhGBBulMKocg28MG9/Mbs9nukIc8eX6x1YNio7p+GHve2OLJAqxXk7FeKbslaEs4OU=@vger.kernel.org
X-Received: by 2002:a05:6102:5128:b0:780:7e65:f0ab with SMTP id
 ada2fe7eead31-7859822155fmr2331935137.1.1787937432929; Fri, 28 Aug 2026
 10:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828145943.2077589-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260828145943.2077589-8-cosmin-gabriel.tanislav.xa@renesas.com> <20260828-stoppable-clone-db6c2fefe0fd@spud>
In-Reply-To: <20260828-stoppable-clone-db6c2fefe0fd@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Aug 2026 19:17:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUryFJFQ+NWRzXWTzhW5yWvUsXc9y1=wTS13BGOaKg+5w@mail.gmail.com>
X-Gm-Features: AcwNN1Ug-iBgmO0xBVDQC1ANygzOTknsYPhMGIIdZDUDE0bFwxADxDj-zP0M5Nk
Message-ID: <CAMuHMdUryFJFQ+NWRzXWTzhW5yWvUsXc9y1=wTS13BGOaKg+5w@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: iio: adc: renesas,r9a09g077-adc:
 document DMA support
To: Conor Dooley <conor@kernel.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Fri, 28 Aug 2026 at 18:21, Conor Dooley <conor@kernel.org> wrote:
> On Fri, Aug 28, 2026 at 05:59:40PM +0300, Cosmin Tanislav wrote:
> > The ADC can transfer conversion results to memory over DMA.
> >
> > Allow up to three DMA specifiers, as the ADC conversion DMA request can
> > be routed to any of the SoC's three DMA controllers.
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > --- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> > @@ -57,6 +57,18 @@ properties:
> >        - const: adclk
> >        - const: pclk
> >
> > +  dmas:
> > +    minItems: 1
> > +    maxItems: 3
> > +    description:
> > +      Must contain a list of references to DMA RX specifiers.
> > +
> > +  dma-names:
> > +    minItems: 1
> > +    maxItems: 3
> > +    items:
> > +      const: rx
>
> How does this make any sense?

Each entry provides the same functionality; the DMA core picks one that
is available.  This was one of the design requirements when support
for DMACs was added to DT.

> If the device can make use of three DMA controllers at once, you need 3
> names. If it cannot, then just limit this to 1.

How do you expect that to work with multiple (the number is not fixed)
different names?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
