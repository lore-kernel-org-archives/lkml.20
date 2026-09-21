Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A197499F0B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993905; cv=none; b=MVPcz0XSeEFQ2W0pEuTI/MnfZ0LkWnodMgDsccTb6O5nrSptDvMhfQIr1Nwq4E7FWelNis8x8VfrUyfbwCgALx5wzsou+bT9lZMy8LwkmaNKJzr9voWvvjSJSlGYL8ntXKs3EDX6Sgm+M9XPGxWr+iYArvKEb2IPlkq7kaFt/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993905; c=relaxed/simple;
	bh=SGvA9NKI3LhkUtgFg259g3mM1LRdIuBdN8zWX5kHUmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXVVmKol4nFOSsPEBApMJ2KD7ztRCxDUuhG9HORPmn5+VV1eDNCOTaCq6Cnn4uhVtRka0GMv7/8sxAQV/Pyo7xMz8FtD8lXekWNgsGY34fNR+jzBriQhP452aRJC13JoaQ5Rjy8iXwBvLbWxX9Nbf/Xrag1w0YpaprBM18V5jhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso3341608a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993902; x=1790598702;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SIzJLq+3/3KF6yVvXrlV6434jsREi7AOdKjY7WjwTi8=;
        b=ghGnbN3z/jnGrHsAtjoqjx/LlFNqMtBM3UsmQVvEvD71m+JyDdO0GKO0FPcDmT7w1Z
         ELYokUdHovBrqSe7bZLtMSSOXU5itLNnN6EocYT9msupDrTLK1Y35pbNs1r4H3jM6ghn
         1LH6VXCgzAqbOiWqVDZxFeJ7nwg2CqVhYXXJUd8lDW6ly3H+bZV7YiVHmLKL9v1d4GUK
         s1EaArRuFylXSktVjNQAfhWKQPk2lor0Y8sbeg5rzjKpnJ08zumd4WOzGQzGRKI62m1s
         nwp++Q3Om2sfqMrjF7qh4lEGvD1aq8Sp/THrRGhWo2mXx/IWqYT7qqqAa+kqHd0CPGU2
         qRvw==
X-Forwarded-Encrypted: i=1; AKwUvBwmavp/j3aMJNHu/ASBy7BcA/qXSCcr4v2suABXo1AZU5CUmVP+VlMVG10eLjdOulWwDzSlqarqAaM1h1c=@vger.kernel.org
X-Gm-Message-State: AFuF++kszU83cUlrg/uTOFCjmYgDMwCHYugxhq0YN3t6LqFRu/glsR89
	pA5p/BUEbkB54IRjafyGHo0MAceIoHEPPdIxmieQ0gcVxm4IE3Qlku8f5VJnzI1xCWs=
X-Gm-Gg: AYBFou1PcCSXut31Jraz2N5aK5ZpsLzVMMHTYDtjXwwehlBTIzCbeyOYbeYpmatMY3w
	PAROts6i2rRemHTzf83APxJSh+jX3tNtb/NsosUvoFZWSKZ06y5HwyN+DjE7xoMh/1tRAHP1/z7
	adMAFWkaDLCO+OhUWSZrYPGlqzO3RexwkUCLi8JwFFn8fFDrZXhk+59CvPzLPth5eqwJLUlp3yB
	jcRTCz/ur68FrvjUVqbUURQ2ZdRXUGcfqOADlzIQCKId8zQ7/ZbaPsB6nX0c5XMetpuSFjuNhIE
	cNzaw/O3uCEYb+7v7x+HI7P8dg1kcoHdIbeFrWFanae3c7oSaUSc1M0ktKVM9Uy+zpNQHwgNh8J
	Jm+PCzHt76X/OMD01ZPEwEsURs7hnTm+BZu3QUsKeg0ccLVnakYkk/uCmMoQSIvw4SGAum3pM0V
	DmSvv865pX6OhOyx2m6vTOkl4PQp4ZjT/agJFpvkIAy0cf7MfuE88839Dlra4Ph0J/g2Y9xX3pc
	fPCgapucs698aBidniBuFiDVbdm/DErPqBwPS2ljKLSPKht2g==
X-Received: by 2002:a05:6402:23d1:b0:6a5:f4eb:df3 with SMTP id 4fb4d7f45d1cf-6aa577f543emr9063913a12.2.1789993901528;
        Mon, 21 Sep 2026 05:31:41 -0700 (PDT)
Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com. [74.125.228.168])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d817bdsm4211869a12.6.2026.09.21.05.31.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:31:40 -0700 (PDT)
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso333261266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:31:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzY+YcPBbpu7H2+o34UwU/npFdS7Flrjzz6AftbuHi9G3iD7YizMdv/V3VWhirbfpKL656voJVhGGLlsJ4=@vger.kernel.org
X-Received: by 2002:a17:907:3e02:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c2a1584621cmr808752466b.38.1789993900306; Mon, 21 Sep 2026
 05:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <arD_c9iP63WLOI1b@tom-desktop>
In-Reply-To: <arD_c9iP63WLOI1b@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 14:31:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
X-Gm-Features: AcwNN1X_gHFTAUEKRMyjIGa8lhYNHtyWicHqoXl3HQpq9G7xY0N2gFZj17u90js
Message-ID: <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add USB2.0 support for RZ/G3E
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 21 Sept 2026 at 11:57, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Sep 09, 2026 at 10:54:57AM +0200, Tommaso Merciai wrote:
> > This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
> > enables it on the RZ/G3E SMARK II board.
> >
> > Kind regards,
> > Tommaso
> >
> > v2->v3:
> >  - No changes just rebased on top of next-20260908.
> >
> > v1->v2:
> >  - Included PATCH v7 7/9 and PATCH v7 6/9 from
> >    v7: https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
> >  - Drop placeholder patch
> >  - PATCH 4/4: Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts.
> >    Update commit body, and improved usb20_pins, usb21_pins comments.
> >
> > Biju Das (2):
> >   arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
> >   arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
> >
> > Tommaso Merciai (2):
> >   arm64: dts: renesas: r9a09g047: Add USB2.0 support
> >   arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
>
> RZ/G3L USB2.0 binding patch is not queued.
> Shall I send a new version without RZ/G3L patches ie, using placeholders [1] ?

That might be a good idea, to unblock mainlining of RZ/G3E USB.

However, it looks like the only missing piece is DT bindings for
"renesas,r9a08g046-usbphy-ctrl"? How come we ended up with
a driver in linux-next without bindings?

> [1] https://lore.kernel.org/all/aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
