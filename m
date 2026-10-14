Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE4F5349B5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986811; cv=pass; b=uaq1FvlI6/708hsK7wPhSaENzN1tOhF000n8euTC8Usgrqe8hwCbERSlqjyIacqTTuWTMzLpZS6PBtPTRx6cjYkTiZqPzYha+kkemb+Xcck/KjfZN403HXmA6YwY+oHsw1h6gLSMm18rkHi8eh1xacDbrzxDCtjnYIyqIbknAqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986811; c=relaxed/simple;
	bh=0LcwAlWWK0AFCf1TILkUnxNzteLJZfEicsPDrj8s9Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3DEEltc8HYxIzQARTZh5pK9cvCVis2RwoXqs0so5Qx4tfe0ociyPBr78Yk8XIf+1qp/z2ZRKYs95+br8J5qXsMhCK+UTI5Zc/TcosnVn8gx8XWyFb5GybJCxBOiIs8tcyimIlEx5gd08Dq9NRBLLqcbFP1ct7+BjtC1vOYZUoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=eNe1DuNO; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="eNe1DuNO"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48e94879f02so1258752fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791986807; cv=none;
        d=google.com; s=arc-20260327;
        b=WCfVBJDJtdr4OPHtj7wtU6MusjqnkdBAfyYM7wg7lEZB+WLEUH2IHIDJ5g5aOM7mge
         hiacnUs+ap88OzzhOt+/a4Z7uaWz40NHJ+jC8HLucCq8/M8AbcrUeLYfB+WGZdullSKC
         scjXRjNzs8Z4IcrO7pFySNDKl7/ISVUoCFf3qO1GE5tPWHNfdLQX2JrO6MkzYh1qCccw
         HvtSi+m5v6OVri3/nX2cnvez03j9jgbru6fXJtCecxf/QnutP0DS+VhDVfgf5kn5U3CM
         PXGqSUZ96C5EE5cjmLvR+kB7aSjhI7rTLel6R1zDc5NKcMrtqbJJi7fSJbZj26x7cVzs
         OtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        fh=1p2Jz8yx163MlXaRIE9P/yQD58And/8+/rAIqn/ICuc=;
        b=h+Ar8PCYjBy/E0itX4+byzvdelr/1AaAjpV4T31XAVMpN8M9h8xR3PrBaToxeWbHFj
         0v95xI9Itlrgb5oqCqEuhKz4TzUFUwpC8N4BCMHqmLlUWt7hR8G0tod9Cuvp85iWJEy5
         p1aMPch95lfUgPHviCI0Eiht0dSKq3Xj7cvJpZ6MUnsqIhavvPWj0gxy/MrFx/axuzq1
         k+vYdk4m+XlkPoouCyZLMdREG3Kz8kS4TaRKcluINeuSRxAsfv2QVSn5C/OMpP+12yV6
         JcUe+Qh321Fu7O50b7e7XTz/k1enSFLp2JyuMyzgznWRHhsWjnpMk9xz5SgeEaGidRvU
         piNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791986807; x=1792591607; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        b=eNe1DuNODth6IsJInnlNhfk876kXkB83E4SamZQQVGKZeHYyBu+7NWSd2RP3rMgvbq
         yqeA2SSB3+ImWPbUiy9WBxk/iFnY5urRw3sNLUaXzn/np+H7eaOQ6j0R3nbjmNayBcLi
         xHXnX8IcR+Zpe4Hxi6XIPEBoKRKl+kKGWDccRlrJOnbadtwH5l7LjSoUh2PCF80T2VIg
         CfqYGx/wlP+1IzZdBoWD3KQTvXTKZuAXFzy6DOgiGldW6mcoPweGZUKkrPXOwEa45puE
         r1wAkx0UyjCKQCuQ9fRovXQ0+ayQxZHz4wXr4JzIAcdyYkELld9L2417nSgHWDP2IVIN
         NSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986807; x=1792591607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        b=hFNiXooMBs5Ya/J1Q7TskyyRAl2VMPlpVfe3J5EFgdZ08Im3uqDLKwXkvohxRJx0i+
         22oDTrvcsjyC/vXGX0QBI94IHLEC1FYdCLS4IBbKUDEJe1eKnjbp9lyU9t5UuGjTRnqV
         94/s0BRIfRMAqgX+tLL3RsmOAcRWJso0FAUbBd67grtchpBTH2+ofMNrSIaC2JlOtBNZ
         JXYXsrCHoDoeUNlWGrC1VTzRfwWtW6sn4kELh3pt+rYRblFIQ2qrA4MfaSOQeHG1HWyC
         B0SqUrhbyiOZA8LJ+iXEtdrqrcUasnqMQcxOnSxIti8MuL+TZRHx1o3kif7GAQNRWhg5
         63Mg==
X-Forwarded-Encrypted: i=1; AKwUvBx9cclFUCGp2vSAhsTUZozyULX9XRBsdj+QPBne5uS7MopSEm5y1EhAZ9BVbrVKCUfVlmDjR0CaLJ0OVes=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVEyd6VaCfGwq0wGmWZpPeEPE3JEHC8ZfgYOBUhU3cDPddlQnT
	IKTHo+2ZeaFOX89WBbwjGc+2guznvxfLtTDJv/0mwRERohWxpkKi1E58MWjkmyIM1xAWcN0S21m
	1HxRhm3gZZsCLndHioKnWpGrQLEHl7KsPrdtyAQTZqw==
X-Gm-Gg: AYBFou11rKf1S1ychiTsnWslKeYuhexm72fw2fCBhfGsRt9aMHEq+JBR7snztYfsBVp
	1YTT30MKbdAL+9PLdrEKRjXxzD9ZRE2h5b2bUjKPExCu0pGi4Vw7ZIvKlNPVhUIrNtov43d+gQu
	+xVNEbEpZjXWxggt03+1mXqHbh6bHvUB9vkvD4sW2Y2qG4P1hf57ZmnzzQjN1bzBgQxQnsS1SvH
	xyYgCAZPty4++Q4DPKr/vebLCxmvDZekR+5X+KNHvfjpTXOCrISE0xX5o8ZYfLoEdVg1ZgFHOUn
	3VYPHj/p1s8xlj7hnmheEaGXfXuHu2HTJLS7q+jMpr/oDEYuJIXvVXY8r7evgAxtYfgdnfDCLj8
	weT5xMYUZIZzI0PXltOjPUmNvhPS+90xGMCuwbVDnzQgD5wiySC8bGJ2prG0eZMQZBxKt2A4=
X-Received: by 2002:a05:6870:c454:20b0:4a6:9884:df32 with SMTP id
 586e51a60fabf-4a69884e90bmr5145882fac.30.1791986806999; Wed, 14 Oct 2026
 07:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
 <20261013-media-starvis2-v2-13-3670722d250a@raspberrypi.com> <179198580881.2512054.3955199510169892039@freya>
In-Reply-To: <179198580881.2512054.3955199510169892039@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 15:06:30 +0100
X-Gm-Features: AclHuK8ciYOFPl8qXkuGtN5q6F621BPykoHgivZ0NylfNaoIYKBd2rEh12LHy8w
Message-ID: <CAPY8ntCjTWTtVn-EyvYYnMdgH4DFtf6eDbJOdhh4s_ZYfiNADw@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] media: sony-starvis2: Add support for IMX585
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Wed, 14 Oct 2026 at 14:50, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the series.
>
> Quoting Dave Stevenson (2026-10-13 20:47:12)
> > IMX585 is an 8MPix Starvis 2 sensor, so add support for it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/sony-starvis2.c | 302 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 302 insertions(+)
> >
> > diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
> > index 1ce2b86c57ac..c9a3dd4fe529 100644
> > --- a/drivers/media/i2c/sony-starvis2.c
> > +++ b/drivers/media/i2c/sony-starvis2.c
> [...]
> > +const struct starvis2_variant imx585_variant_def = {
> > +     .name = "imx585",
> > +     .id_reg = CCI_REG16_LE(0x5a1d),
> > +     .id_mask = 0x3ff,
> > +     .id_value = 0x259,
> > +     .active_area = {
> > +             .top = 0,
> > +             .left = 0,
> > +             .width = 3857,
> > +             .height = 2201,
> > +     },
>
> s/.active_area/.native_area
>
> Apologies for the drive-by comment, I just spotted this and thought it
> might result in a painful debug session.

Indeed.
Sashiko had already picked up on that and a couple of other things,
and Krzysztof has made comments on the binding patch, so I'm hoping to
get a v3 out today or tomorrow addressing them.
As mentioned on libcamera-devel earlier, there are a couple of other
changes required for imx585, so that may hold me up.

https://sashiko.dev/#/patchset/20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com

> I'll do a proper review for the series, hopefully within this week :-)

Hold off for the v3, but that would be great.

Thanks
  Dave

> Thanks,
> Jai
>
> > +     .active_area = {
> > +             .top = 20,
> > +             .left = 0,
> > +             .width = 3856,
> > +             .height = 2180,
> > +     },
> > +     .pixel_rate = 594000000,
> > +     .pix_per_clk = 8,
> > +     .common_regs = imx585_common_regs,
> > +     .num_common_regs = ARRAY_SIZE(imx585_common_regs),
> > +     .vmax_default = 2250,
> > +     .hmax_min_link_freq = imx585_min_hmax_2lane,
> > +     .hmax_min_pixel_array = 550,
> > +};
> > +
>
> [...]
