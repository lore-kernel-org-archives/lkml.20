Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E96D48BD3C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407770; cv=none; b=cOmRmVzo4+FpIP1VSM3Y67eHqfJqrDL8tAc0fsl1/gAnANzvU0xr+0YzHk7SbUx+bCKddu5PK5xDNoDUvdMaz4dd348mLtrqXanVeQ0PR6er/nur6fj4ZcB9p8+e7Ne0jjX9WmF4c8culFYaCsa1FvZHV9wT3vNYEe/I8VWCMd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407770; c=relaxed/simple;
	bh=+izH8riELWSAMprbT5C678K1jl8pB7zXElojauJucHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHwPeg63OI1NaDs19KhopWc2LjgUoXh+S50uc9fG/bZO03OWc06gkvKgt5zFgzVcL4/ubZbxmoimfHXbnbUVH6Nh6R0UkAHONvH9NqCQC+0S1W8BoQXwNSD2mi82vcLjr1R/ii6hRSW5fgCKD7A12aRfhCxu9xyJa6quUuzPk2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id ada2fe7eead31-7954fbd0ffaso663163137.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407768; x=1790012568;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gjfZXacAwr82/eq+UL7cs88Dit/YxtI5ifxFAg8Xa84=;
        b=BTIfpw0ROwjQchrXtjL/jvfn3gzVuTQ4GDPlzK5oSJoqyIDuz9DR9X+zLu+GiwT8cZ
         AorHPf7HBjyiOlO1ZInz6ujE70XqR3xyAO1TlbS06e/NiJ5JdkNULU8YLAk0/JzXhUBZ
         AwV1i7tFnJ584tkE7sufUA/tL0qxWnFf7/Zc2tNYb6/sM3Vr4TTLppOc5zrqqPzEkJ/X
         8Q0CaoGNRCICdTLuuZ8eQdTb59Rw47B2wRIIKPvvcmhcRi6xM32d8Acyed3mVV9GdK+O
         izqscv5+iMr32tZDZrg4au39XDd3V0G+vdhETwrQNpIQxzSsQt1qFwf/rg3lAufgnuey
         B+Og==
X-Forwarded-Encrypted: i=1; AKwUvBykpaSqLMbr4gRhzRicq3GJDfoGSzaWdFacrh/uv+bFtUZs8g45cDO1pdLF9pNHq8Uth26xSPO5N3cT3fY=@vger.kernel.org
X-Gm-Message-State: AFuF++lh2kE4t5xJTUYSTchVyIg1cSEJSEKmLVOBI+OTYPlTYeBRanls
	Hv8vaMXDf2SBYtJUBRjodFLw4St0LSMKJetlr1QjIy8JG0oLRGWyrdR1KdukJRe0
X-Gm-Gg: AYBFou3PnZoqUgZll3LvK4MEFS87P4eP820C+d9OvKrm3Fu2kHsTqDqmVPSicznmaAU
	CZvs9if8CR7L2bhe4V2g0lGKpaYDqcYoprhUoGv09X94+qRVwmB8yRcB0fONOjU8IbdGj/p1JkD
	vth6LmJqkJB+qzSqKDL62osTJBiVHF4FP1ejDVUlXb9EhYbL5kaPBWcGAyQfZjdHEJyELi/z8/7
	IVi6I9o/crMl2j36SpQV9nh1fpmDeLCa3RO1inT+nFddWo6euLEJPrmYZE0qt9LpWkOVJjCQ3Hs
	z5FgpJ5GeNnG0HS5NIaN4ODCNyJt2PVKzAM/I3pCUCYlDTfBSrQ8+SE0J7pIr1A0drqfttgeM5V
	faIkeJ5CdHqPWODDt4yklgWlZJY3eO9EBxqXuL37fTfVut5opvORJYHfYj4TfYBav/hF9MA+AH8
	I7b4fGhlXB5/dItHkH2rxW+Bu5D5aoWNHqSc35OG7lByRUqR0RnZbs/JZ2S+8T54XhrYoh0dQnJ
	TZlDipRflwBLwQCB9zlrp9GPaaYrCP7MuNmlw==
X-Received: by 2002:a05:6102:864c:20b0:79b:a93c:145 with SMTP id ada2fe7eead31-79ba93c04a9mr3759709137.10.1789407767683;
        Mon, 14 Sep 2026 10:42:47 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c84716a167sm13189939e0c.18.2026.09.14.10.42.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:42:46 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785643199baso752462137.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw2Jx80wD8NzHDvjgRboH7Oe68yKhaRsqHSyQa2yRWEHz8JZk0f4RKLb30SNxIGp5It08y/ukWxMkCvxM0=@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-79b579b0d38mr4032527137.4.1789407765732; Mon, 14 Sep 2026
 10:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <34a6d23e309aab5fbf369132d75794222097396d.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <34a6d23e309aab5fbf369132d75794222097396d.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:42:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYC2m3YgayTrCvZHoTVkj4v+7a5cvO1g=UFxR+6dJiJw@mail.gmail.com>
X-Gm-Features: AcwNN1XJ1dIjrp16s-r0VgwKaAicGc_4VU9cyLbRu-FG27nHPGFdbzVolc0-zaM
Message-ID: <CAMuHMdUYC2m3YgayTrCvZHoTVkj4v+7a5cvO1g=UFxR+6dJiJw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
> USB5_4_HOST connectors support host operation only, while USB0_OTG
> supports both host and peripheral operation.
>
> renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
> Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
> EVK, so disable the common USB2.0 nodes in its board DTS until proper
> support is added.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -298,6 +298,28 @@ sd1-data {
>                 };
>         };
>
> +       usb20_pins: usb20 {
> +               ovc {
> +                       pinmux = <RZG3E_PORT_PINMUX(0, 0, 12)>; /* USB20_OVRCURN */
> +                       bias-pull-up;
> +               };
> +
> +               vbus {
> +                       pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* USB20_VBUSEN */
> +               };
> +       };
> +
> +       usb21_pins: usb21 {
> +               ovc {
> +                       pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* USB21_OVRCURN */
> +                       bias-pull-up;
> +               };
> +
> +               vbus {
> +                       pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* USB21_VBUSEN */
> +               };

While these two signals are wired to the SLG46108, which generates
USB1_EN_OC# from that, the latter does not seem to be wired on the
carrier board (SMARC_MODULE_CN P67)?

> +       };
> +
>         usb3_pins: usb3 {
>                 pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
>                          <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
