Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE295435AAA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989863; cv=pass; b=KyRx5aZRedVFWTB+6w6SK5dzkajBHMit7WPxNGTgeJnDAJjPV0RDVS+CP19CGN2MpynmBviAUc2T+nP3HJ+PS5IoNHM3uj/Nwk4TUlbwj5lQnqANgsw7JBboXIjB22OXQCjzSXs/FaRobseIDtsrjcSVhXyxsZVlaRTSf1CXr2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989863; c=relaxed/simple;
	bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4EDOkh27ULh2+WKRRO1ZKO6kBCpiNWaDWQ8ZfCuyGjl/3cjB+TjCWFA3lMJFPiulBAglu4T2Iaj9CijU+32n1gJf009OMK1uegO6GzowkplwqtbgbDMK6WVyieqNst9HXodewey+rNCGo7W53ids8IYOVsXyAcge+gZiyBGXkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThX742iP; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThX742iP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso2356141f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989856; cv=none;
        d=google.com; s=arc-20260327;
        b=GxZDnRoeI+Z7FEBcTFtFGtVB44SUilXi3vIAsoqfvj55SnZOMlrZZdSC6KjV/Jb+qG
         CazmeaZnNewX9RLRRVf04IYDTjerBMUny1Nxa+gv2pLcT+AvlNYGrd2tgkkMD3vhROLx
         aUNcocdxlh+3SHqtB74qXdpqeest38ee6HDdYB/vDr7DmcQX35xN6CaU/O6ctqOHz6bG
         Xf+iipNiQHTjQ2k5QavsEti8prVWmpf2gE5/ED8bZCBZUP61g5XnO9scKAOyAiGNTpr8
         HKbqDEIrS9mwFOqujZ1z/hZIpf8CNUmuuu6SLj+jrCKMktNEqGoVIzV0OXVrl6QzRYVE
         qFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        fh=pnT46sYXZCfedv0TQY2PF+t3GkqTECFjB88W2icTlU8=;
        b=lpe8cThtlPFVgJI8mZUPyyWsbu2zRQNrmxdG5X9hYSBvvxoUbbca2fMY9DUYUNmXJc
         6Mh4rvnOYn4LKOIfDC+z32RudixFqU8SAO2SVkCE/6whlPlCznDpdcNGFHpHO6qdJcUV
         aXi46GwQSQG4F1P9EZ2oxzZqO+A0cbFu714W4JJcky42C364czoSSUCL2fVU/NwgRXV5
         d0oduzR7yz33bFv7LWY8qXDtvn895ymzg8qetHfoZlIOGZV4BpajzRq9YSGsWijVCQzF
         HKwaVm1Vqu6NzyQVJHUcjuVORnM1GAYwrTRnidMxdwr8gyA9kjUDORdG9mTiwnqZojWz
         p2gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989856; x=1790594656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        b=ThX742iPETQukFX3BBlsPPA+JqXvvRIUi3buvYb6DHUJ8uhywR7FkPybPC3WtdM2td
         cw+JZn2MXPLxNJkU1hv/HjhYQbCExqead52s5CZSES4onYM6ZeFng/l1dI4W2aCJ070z
         sGUIx8WWnCBUSgqZw2OQGQDhU4eYseFbxWM7XOZhjmsVd9hw+zaQJd17FyC+lmjZlng7
         YrB893St+30OJ3wABghrgJytAqkSKr044EIXFeyfBUmZZurPVJoA7+OODterBi/HYktB
         K+y+DZZjHv2NV80Cj+p5ANMayWnacg6V/RlXynE4nq+plf2w/FGel/B+E5JwiNU9VlO6
         LP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989856; x=1790594656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        b=abtDa+D1gAmkc4uVUzuA+sAptJL/F8RxoRSFKXc0Ypl2jBs1ZgPIgW2qOTWS0/9MTz
         RROCQxInAAElMFNUfKHHEJo/aHb5jaLrpW7oqDracgdRmdobmjU/cJpEQhLG6Yffk49E
         nxzunTUSXGtDFWeYcBf9c6DEJj8tHpBgwnC56cPWyJj2bcluF/P+mZt33BmbO5Xz9dCa
         63auzVdEy0nZTgBR0uY1M3UGOzbo6jtRaUbkfb6BX+sLPKjLAMMfhr3WRfLHSSMYuyev
         gSc/OvwYVb5DnxWtwhMsjPmCnDdjQmIffCnMs1Xv3mnFmBujJB6cW1bK8zy8o8aQL7nN
         mHjg==
X-Forwarded-Encrypted: i=1; AKwUvBy7cYCGATaypX6ctaYfrzL0xLMQGiVwQYe9az9Ctrr7g9LPHtnVr601QhgE/gSNGBCB4l0BgDUAIYdxvR8=@vger.kernel.org
X-Gm-Message-State: AFuF++kSARxzDTEQfPHCE1AmrI4HTWEU5kWXkt5RXDO8/qnIeOGn9UWq
	nA5yVwxUyBCYxyRNzELtCdkLg6CZnw/9jCrgHp0iksuSOnzxXFtFDNnsY276V0P6UptznDgcQrj
	BMs1b9xESfYQx2VEbObIkkNKB6i/efOQ=
X-Gm-Gg: AYBFou2dG2FFpiBMAkNhFeuyWmmDs/4hU4GfLVhPAZ9N4nxpk8zEGaA302eVndtiHoJ
	OW54c/ST4T9zzTXBOr2r4Inqw2RQhD9gbp9BEjuF8F5ItheNkMU9g5Kj+MUrlG7BquhcQWV4Rim
	9IFr5t9Ktez2l1S4ruhx4vFWWDNVeI7LFDxvzryOyOlPGiO4spyGkCJWLKOVhmcaWnSyqPUK6hW
	W7a63NF2o3Ie3PEUUwswW0Ef+P3P40s6XWmWmnPPRk/dhl4tvte3dH/joOhI3a/FipZO1FXrfxm
	/OH9miQDZg4d6Aq5AmMc1wQBU8x5aHhAwjKug+x6IBqIhkWFBPneP4rWXp6nlgd+VD2AVzIqNVK
	5b+SK67Gb26Y2yBQ8fuelYadHQFKKOr+syRW7x5saoBWtBBjcRATRvCUyD3186TKY/rxARGmz
X-Received: by 2002:a5d:5d03:0:b0:487:8ef:5303 with SMTP id
 ffacd0b85a97d-4871e394d18mr16926933f8f.34.1789989855856; Mon, 21 Sep 2026
 04:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87577cdb-7f1d-4a9f-8a61-ff1f272234d9@roeck-us.net> <CA+V-a8vVtjALarck6PE3it1si2hNbveZWoGjTaTUW68Q6yYjcQ@mail.gmail.com>
 <a73c5d5d-dd64-4061-83cd-0a1cdcc2db4d@roeck-us.net>
In-Reply-To: <a73c5d5d-dd64-4061-83cd-0a1cdcc2db4d@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Sep 2026 12:23:49 +0100
X-Gm-Features: AcwNN1VFoJ0rwe68Hi1fMS8HP9OtdClqcRaDuoUukIno7KtW8dqa4XMt5T_ytyQ
Message-ID: <CA+V-a8tugekX_ykWWMzVkHbEo4huviGYdJuECEfuYVZo6dY5wQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Fri, Sep 18, 2026 at 6:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi,
>
> On 9/18/26 08:18, Lad, Prabhakar wrote:
> > Hi Guenter,
> >
> > On Thu, Sep 17, 2026 at 2:12=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, Aug 17, 2026 at 08:25:38PM +0100, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) re=
sides
> >>> in the second register region of the CPG/MSSR block. Since this
> >>> multi-function block is shared with other peripherals, it is exposed =
via a
> >>> syscon regmap interface.
> >>>
> >>> Look up the SYSC regmap using the optional "renesas,sysc" property an=
d
> >>> derive the WDTDCR offset from the watchdog instance index.
> >>>
> >>> Retain the existing MMIO-based access method when the "renesas,sysc"
> >>> property is absent to preserve compatibility with existing DT's.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >> Can I apply this patch without the other patches of the series ?
> >>
> > I posted the v5 series here addressing Sashiko's comments.
> >
>
> Sorry, I was getting confused. I somehow thought they are different serie=
s.
>
> Do you plan to send v6 to address the issues reported in v5 ?
>
Yes I do plan to post a v6.

> Note that Sashiko no longer reports pre-existing issues in public,
> so those will be out of scope.
>
Thanks for the note.

Cheers,
Prabhakar
