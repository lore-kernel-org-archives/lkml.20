Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3AD3F164C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352738; cv=pass; b=J6P1+llbf3D18KTrrNERctvcftF7tKYyLKhfyMa/LDbYEcFl2eSMgQnnqu3dMsqMkpIgaDoJ00nwe46ckqEF7qCEv8ElFIS5y9Ho00GoUHhbuA964RA46MnZ6/hJanlSaRRuRpiLmWeSvwIVnlJi3IyXeEBEXpUkQ3I30XdReQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352738; c=relaxed/simple;
	bh=egWNEyrcah0jamvRkd2t3iPlF/zp1CsncVLF5ZQhZ7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjRK79Fhqv7WcLvVLY33MFreI1JZZZCCca2znrrLfllLx3FH74Sme8upT9wY20OSYarw09LxvxQ+P+4GHvKVosd/Gi5W0MaqxE4X7s2lHFrGLiYL3xMzMwqVUQWvdQVH5zADONWMFacP6L+n0bZad6HO8pRg8JyL4jOhCu+fArU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niY9qG1p; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niY9qG1p"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e576377715so18194685ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791352736; cv=none;
        d=google.com; s=arc-20260327;
        b=Al87Mzt7pOBJqB6s1sx98/WEr8G+ZjTnHaDwElPuY+sGYQeWTBjUEA3OOxGtwqbHp1
         mLipR5gcSvJSQxqBZN2ZY3mdM7eeHw6BhqYQU2QasbSPbnz/HddEjaNq6wvUxrpBt4zF
         yHqpDB3PqCXV23YBPGPaLtVn3+LDeZE0cRclKu5TiS8idFF8aB/YctsVuT93a/VP1IrG
         4f8h1HYzZ+GGGqoJSqurNPx4MW3qF2WqfdBZn90VEJq6HNTvpLVK2h0niFqV+fV7yViM
         so/GHPN2963L1BY+B72Tfaq5aojGiBd2GredRdiQ+mXps25plzr1SZ5QWzjFHoZfxlcT
         jH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        fh=XLSxnO/1TLuNA0cuG7THwBQz1dKFjJsyLg33ZwesRM4=;
        b=oStcJLAMuMrlaSyju9OdlT5kiK6J742aD9JJ3aiYJmT4oOdZnh4msvGLLBOkD/6xci
         EVzkpiHm6bt0fXO+y4x16ECyXpeysmHAzgluoWG42PtdFNpmYTjD5dGSxdCLA2yEC8A2
         4R5NsqqU8uHTEiRLuz6B9QA/Gyy/3HuJvg/v8bo4uBWuvQ/g7akZUt2Bhvz2uW2RvXal
         mqsHl81/1qgdQxpxXCmVPkU68bmHzNRiOu2QUaA+FDc4HbYdX9XpiuPsLokcU4PoJX9t
         qdYOdUbbZBXxcGYuTNHJyWu+ZYuqDhIW/kOMoH+6TNTyomQwaC7kYjCXlE7ZUU99/do8
         k0Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352736; x=1791957536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        b=niY9qG1p64ghyWuaPLnACfNJft/Ut11dV/yx3JRfF9lgH7Hfvwp0iClP/vh4Fcq6GK
         PnG+bqnwfd995Oj9pnohjEIV9t5//HDnI2//PUwKaUilrfqfkifCJ3LH63Q6jUnOSUtE
         1/WbYHVoZLgVsaJ9vZy1KO0RN2MnagVeiK0fnMb4pC/2WqcrrzgU0Hc/BFdMPKX0pGSr
         TeOoKSElrUDQDwVN3Hol5e6CHtmpzCqSFv/U1eZQwRp9jceITF5ISozaTpR/d83fsqkK
         6rTyVFn0ycdGA64xRX2OYGOjYGxE1S1hAImFVC5Yj4hyFpGuOYz7aQmOz6eUTLFlzw2R
         Npig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352736; x=1791957536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        b=vKaDewvGe272JA/+scm0AU9HQcJw2n4eix6/wiNy+/pK6CF4uGeI4mjB3WjUdtQua2
         2+P6hF8rympw6pU95Uz4k9X42WqZSMQB2UexUr//P2aJAuwt5h1NIjdL5s9Lz7ottIbK
         77a5Q4PHrh6pY86p5BT7kw9UhtaDuy6J3ZET+nRjDu4X221Q4GCy9OCVttk7PDl1fhIn
         a0CJPZ81IXj0tcz9/uNQ0FzxOJFN/SBxM+0Az3dJXdKeDChRj9/u+oeBeQ4mRhwBI0Bm
         rkd8c/R0cxxCX7APq0IjEaG6hhxDwe/g+AfBBY+MoxxtIdqR4seO46aECiK6yMYT7gtL
         gr2w==
X-Forwarded-Encrypted: i=1; AKwUvBwE8caZOkG+pwEqXsjVCi3N+pNO5d3lo6LufQxiN5PVrTd3pjxCNptOqCnS2fk5oJ1atrQn5tUdVjrnRw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUcRfSW0bLOgB0sffMeTMmy1O62f73geAuBdiejOvxMoMkGZGp
	NcwJLi5IPl+ZNQQh+TchZ7/ifTcHZOYOEtEZJ0/AAEbZxxTsfCmVkSTfdgp0JvtZwR+hsRt+TP9
	bRPIluN3oqP4sEwjje9HPwzVUQqPQREQ=
X-Gm-Gg: AYBFou1ri7jeS8RbgoYo9LqEGk6/bs9E7mEesougimwJWF4eLELji1jv/LRfv3PRuU3
	QSqMyH8nRuVkPg6FE5KbIGPA5HKUiAJq+SRRHEfs3VJI33JmIXQKlWtP6SK/ByIJ6wgGVk7NLk7
	UJY4urZl7c6GhQOIL1b19+JC1XrYjQw4KYsAqtD3bRBRWoLE9tSbNhmG1GgETLm6Go/MHZq6hEA
	7mlPPjA0yR29LY3Qi9y7PmumwPwP05VZymT0aPudG7kcY7sEg+1gsjt7+9aGcO2msHo6IW4+O2Z
	8OFqjHhFc4FjDpoWE3t1d8k/qbfxJcpH/+YZKBPohaEUkwArdC1x/i3kxI+6dkf2cOSzh6o=
X-Received: by 2002:a17:903:2c0f:b0:2e1:2ce5:677a with SMTP id
 d9443c01a7336-2e6003b5d0emr12356995ad.16.1791352736407; Tue, 06 Oct 2026
 22:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006210313.43163-1-pmazzini@gmail.com> <20261007012337.6765eae7@ryzen.lan>
In-Reply-To: <20261007012337.6765eae7@ryzen.lan>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 7 Oct 2026 06:58:40 +0100
X-Gm-Features: AclHuK9so5s6SVHKBrMxWd9wydw_PDXudCltTNho_5K9L0MuDF1LhfNqIbWLxW0
Message-ID: <CAAxh=jvd=dR4anQ9P=f=NtUePTfXY0SSR6PXxc8VvDcjP+ni2g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that's simpler, thanks. Will do that in v2.

On Wed, Oct 7, 2026 at 12:23=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue,  6 Oct 2026 22:03:13 +0100
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> Hi Pablo,
>
> > init_pins_table() adds to npins in the driver's static descriptor, so
> > after a probe deferral the count doubles and the next probe fails with
> > "pin 0 already registered". Count into a local instead.
>
> Can't we just initialise desc->npins to 0, at the beginning of
> init_pins_table? I think Sashiko suggested that even...
>
> Cheers,
> Andre
>
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl=
/sunxi/pinctrl-sunxi-dt.c
> > index 50a16f3bd131..1c1888394cf1 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> > @@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
> >                                             struct sunxi_pinctrl_desc *=
desc)
> >  {
> >       struct sunxi_desc_pin *pins, *cur_pin;
> > -     int name_size =3D 0;
> > +     int name_size =3D 0, npins =3D 0;
> >       int port_base =3D desc->pin_base / PINS_PER_BANK;
> >       char *pin_names, *cur_name;
> >       int i, j;
> > @@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
> >        * Also work out how much memory we need to store all the pin nam=
es.
> >        */
> >       for (i =3D 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
> > -             desc->npins +=3D pins_per_bank[i];
> > +             npins +=3D pins_per_bank[i];
> >               if (pins_per_bank[i] < 10) {
> >                       /* 4 bytes for "PXy\0" */
> >                       name_size +=3D pins_per_bank[i] * 4;
> > @@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struc=
t device *dev,
> >               }
> >       }
> >
> > -     if (desc->npins =3D=3D 0) {
> > +     if (npins =3D=3D 0) {
> >               dev_err(dev, "no ports defined\n");
> >               return ERR_PTR(-EINVAL);
> >       }
> >
> > -     pins =3D devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL=
);
> > +     desc->npins =3D npins;
> > +
> > +     pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> >       if (!pins)
> >               return ERR_PTR(-ENOMEM);
> >
>
