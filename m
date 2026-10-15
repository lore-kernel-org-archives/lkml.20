Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633274D7D4D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061332; cv=pass; b=Y9XQl+I3FZ9eUSsv3DQIRhT6B5DSJML1hzrbMqSMkrjE0eOL85wb3nYS5n1AhhK4Sd9hD5ovk+h9szTrviZUO/VYpcHLj3C6zPcDnUOPAo2lP1oKo7nYRvu53Ac6cWTop6YNRhPv1S0E0ocJ+uLfiLAerKgieZF2uHMPeryYbXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061332; c=relaxed/simple;
	bh=FmmRZ608D4C2zUwqRQSrC5bNE6F6es2uQjBujj5jDeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEgdloMRMHZOhHB/iiL/0L6fBA16gIjxokY2VmXvPH1fg9FrM2xWlk91FnkhjqCuWVFGStojHEMitw4jraaJ0zVd8GyvlNUiC9D6cqwzWrbJnT2tkfb3i1nSUVjOUcR/wO2Eodl/QSlannqFaHoKnNRfeLPJdy39Ie/ogdOLuII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGHY4KRj; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGHY4KRj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso3764751f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792061328; cv=none;
        d=google.com; s=arc-20260327;
        b=gSABmay3O6k3DMyMnGjHuntspBGYH/pqHuFql78JqjR8Rh81dNKqEOlOQfPHu+alHn
         e2OSG1zRY/QfJXJXqV0H8R9/9oQef1y1TERrcaLaLFVJzXcwnfLh2nOPHvI7B6mNZCTb
         M49OaBcZgOi/+6ECZn8HNecU6sZPwukFrIaye21jV5X7OJ5adwnlS7XcrqCAVbPR0R0P
         TpmJLI+gyuAR8qaySUZCq1cQ/9uVakLEJMoWuKUoCyYv2SF82aeJKUjINdQNbVPVdOdV
         BAwcEPptzVj2VfEmEbg4TVrctOAew48qwskySYj+7bywavB3f3ZaZFwDGmn3Q+4FjfMJ
         tjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8Bpe0WzfKNt750+YudJl1Zs2RvA8+Qnb6B1KoIdGiE=;
        fh=5yqd02rHLma8ao5u1M8Vk2ThklzI2jUPd+iosD4VLDw=;
        b=Cw/iGEKm/85DOFF5ff0Qny36Tmb6Iw0fVwMnql0iRP25PoCfNeJpxFnUtVmnEpXM6L
         TwUMmbv3u2AoyLJlx81MrNBAfg+Nz9/0FoLkpz1LneJrSlObfQakqc9ZfPpWzIq9LYaL
         tfesaBVN62XyiK8TB5G01EUe9qqWmsx1r77bS0uNdAtSS3ykE0TL67siSkafcBaTA6BI
         yDPh7xBvAepCPXsxXLAEljRoQCHm72Nlvi71a5w6J1+AxRycmqVH/Vfk3l4XXgP+8Kpb
         HCANHL92QmOWBf0hErbTLfWtOL458EWPZP5c6nFM5e+Z6E4Vrd7KFfrR5DNfmxU7PG7e
         qAug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792061328; x=1792666128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8Bpe0WzfKNt750+YudJl1Zs2RvA8+Qnb6B1KoIdGiE=;
        b=HGHY4KRjFFixMp8LxPY4W3sl6Fm2iSsRXws7p5amThHrS1bIMSDbzUcJsNhVHSSSkc
         vpnNNCGYFQbntsLd1GE47O4adACIyeRq2DalBo3fGycYeghLHa3mtfdd3qsuyz0nFAaW
         2vPK87O6CwFiW3efiCeV6a4apP+vsoIe2IbsQ3D4FTIf4NUUQkZa4kuwJVQddzSUlDJJ
         lCRMqyX1xuV5bJQl5pSFtMD2GbL0inp/SlPPmbq08jAJmjCbMIayUjGZWeDrjGeLiU3q
         uMMyguf1Ewiy3k94edtnPsZrMx+7Th1M635N8HKSf1SJkhMr4Tc3ntl5kNofpTjMnxil
         9UNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061328; x=1792666128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8Bpe0WzfKNt750+YudJl1Zs2RvA8+Qnb6B1KoIdGiE=;
        b=WY+nz4WEJgHjX5POMY5HtRZTGZ1NfqMe5yP1zF2G+9QS2DtBRvU6VIYFkmeXi2ZWwY
         jSMV9SLj4oZT41CTi82Qi9J6DO9U+Q5haytK2QQABZv6B4DzZHoYhdRdMYlotEoq9qxs
         oi+CmCvkjyHV8szDgGgqGGjarovHv5C4BSI443qpk2DPxXMM7fyrz7WzvacqyEfDiiCZ
         tL4qQ93mJ4S0T1ykUEgNwBUZoh7yK9SRKiUNw5R4xD7j/7kns7GX0vMsTL+vlhMExshr
         CmH+/ysyoeJ9FDL7RkHfreNcAqIigPv0B2FHGR6tp7ze1xv+X2GfXdkfztZ5kr6HflWS
         K1HA==
X-Forwarded-Encrypted: i=1; AKwUvBxmeS5q0bSLErx3DMTc5wCHNq0qRCctdVr4hVOKl6udeIU9L7mOsrIfKUbBENv+RDUYp+CwNjRJLpcHEjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYs2XqksWu159ineGb/mEeJEati4sSz1oDg6QfTXgjahO2k+gB
	cspyxh4GU9+ZR6R8TJBKL6rOeiqbW5fB2/1x2zshDnPcMZrZE1SpJ9vLH8rxIv9doQtlHW6Cyq6
	5pgjw4sWGrdbD00qJIDpvnZjThtIzBJI=
X-Gm-Gg: AYBFou25dmtMQTzPFyInvnf19L1eKrhdA1srcX6xG12Bv3hzN874RedLyLjea/5m7rg
	oNI6GZMd/ohS64zhb5I/s6w19f12PLzDwbu2c+ZJ2hPA42ZrZP+v40f8TjjBTGCd8s5OfbINkyj
	O94mFDggJx0I5xDygsuMzaRETu7dH61XiYgOk0LPkwkh0sOKBaeeYfme4rEWD2iHnq9suP1hHcf
	svBFkgYP4A1HmLZzA8gJxdRlVzQv6iIpx3htg3UWYkif13lBYRxh41Ln5g9gLU5WcwKlFwJWGJW
	DSdLpBSe3Vi+9+2mJbOykii8Hqgdm+RzCKCERDkyccGV2WRAYt1GEJ8SeTgB0luYwKoyj8myyX4
	tdx++XuAy6kuJIT9OTvpzxWFBBhOuL+euNqUi1WrOjF4OsqpduX6+wE41nwgeGUKKnYXmuSGsUh
	o0B1Z0s2eZ
X-Received: by 2002:a05:6000:4305:b0:48d:f2a3:3a4 with SMTP id
 ffacd0b85a97d-48df2a3048amr4041591f8f.16.1792061328335; Thu, 15 Oct 2026
 03:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009165710.1320233-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMRc=Met2DuvMz4fZjSn4as56uaKaN4K3Nt_ub=4BjaLQe5nmw@mail.gmail.com>
In-Reply-To: <CAMRc=Met2DuvMz4fZjSn4as56uaKaN4K3Nt_ub=4BjaLQe5nmw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Oct 2026 11:48:21 +0100
X-Gm-Features: AclHuK9GL7dcegAHXj9a4i5LIQhbxiG32N7YkVxCBuH5SJV_-Wy1REjdRCS5iRg
Message-ID: <CA+V-a8toBu8SkOft-LHxgR0OEy0pz8sMGMze3GCG5z6n-YuZgQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY
 for RZ/V2H and RZ/V2N
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

On Thu, Oct 15, 2026 at 10:45=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, 9 Oct 2026 18:57:10 +0200, Prabhakar <prabhakar.csengg@gmail.com>=
 said:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/V2H and RZ/V2N SYSC drivers register auxiliary devices for
> > power sequencing, which require the pwrseq-renesas-pwrrdy driver to bin=
d
> > to them.
> >
> > Select POWER_SEQUENCING and POWER_SEQUENCING_RENESAS_PWRRDY from the
> > RZ/V2H and RZ/V2N SYSC configurations so the power sequencer driver is
> > built whenever SYSC support for these SoCs is enabled.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - No change
> > ---
> >  drivers/soc/renesas/Kconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> > index b7abca4559df..32cd0d9c8758 100644
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -517,9 +517,13 @@ config SYS_R9A09G047
> >  config SYS_R9A09G056
> >       bool "Renesas System controller support for R9A09G056 (RZ/V2N)" i=
f COMPILE_TEST
> >       select SYSC_RZ
> > +     select POWER_SEQUENCING
>
> That's implied by the symbol below though?
>
POWER_SEQUENCING_RENESAS_PWRRDY will only be visible when
POWER_SEQUENCING is enabled. If dropped, randconfig might generate the
following warning:

$ make menuconfig

WARNING: unmet direct dependencies detected for POWER_SEQUENCING_RENESAS_PW=
RRDY
  Depends on [n]: POWER_SEQUENCING [=3Dn] && (SYSC_RZ [=3Dy] || COMPILE_TES=
T [=3Dy])
  Selected by [y]:
  - SYS_R9A09G056 [=3Dy] && SOC_RENESAS [=3Dy]

Cheers,
Prabhakar

> Bart
>
> > +     select POWER_SEQUENCING_RENESAS_PWRRDY
> >
> >  config SYS_R9A09G057
> >       bool "Renesas System controller support for R9A09G057 (RZ/V2H)" i=
f COMPILE_TEST
> >       select SYSC_RZ
> > +     select POWER_SEQUENCING
> > +     select POWER_SEQUENCING_RENESAS_PWRRDY
> >
> >  endif # SOC_RENESAS
> > --
> > 2.55.0
> >
> >
