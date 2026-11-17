Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794935740;
	b=HH5krszq8aARsT4qjt83kmZR4V2bkXnVcu6y/BAbxk3USfL1Oe+lUdcQ/XQuuh45ibW4
	 b6xi/32JVmkI/KqQPVNNcDnPAHlpxUm6rlPdbGkBQ5lsVw5PMhvVzIsrs5kVB/SmAOrWL
	 bzj1Oxrh+EueYni/PDK7wHjw7sA/hWyOQ8jy5Om8PM81nCallR8h4NwHQBAgx7RKZrb0e
	 p0gDUpM7oA0/WEFFxYnIrm4m+tw2titsGk9xtd5TOXzptnlLMXl8+fPk92wJ+LhBhz/oc
	 GLeaphEyMWihNSOU26hAFTirIDdPbrs7yL6bn3pNUnB8JtKPeTie63GL9bFUfnT0NgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
	b=03GtILExINDlVbI51zcyTSTX1kWsBe+oI8PEl990cN1G33xHVOHTUBa7kSBi/iaWm+PX
	 nAhl09psdXoybchVN2S5Mcag8YjLfQ3+GZhCbKVbljhhKFEZz9KtkImZjbmAtXitVdATw
	 /L6hybaYRgKz27Owc5rkX3UAtBZzcYIqFBbrOWaxoODOHayl4y49cYSwqp+ARCoifpsRq
	 NGzJiT4lxu2utm9Ir2IrwwfmEhrNmHgLHpJEs2AcGkI3PVAYvmCd2hPSixDt0Xkwup+5l
	 u2WS5iZugcE1eS4nCe8MVz6+J0Tae8I6VE/g7xxvO8f1CO5yyYq5BoDDMUPcdDA2YFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Y76Ifj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772B5606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772B5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Y76Ifj8
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so116123a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:15:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794935739; cv=none;
        d=google.com; s=arc-20260327;
        b=Bfp7gy0TK/FrHDD7BQtnG3EH5uPN1AqUgmwCTvcqOSMxHl/0owpk7Ng1se6I7LGYTl
         yyGNyJHdPQsH7bj60P+nZD9okhULi4YsVO7q6cnN8Ng168/S+0rvLoo7AeucLwdxPWBO
         Wc6HemME3BLYCskAGTE0dhCCKy3+SVsdcUgD1zWfC3uTAG/Z2YMyiJhl8aWuDHF3KESh
         /GK49i11D/YN2mHT2XKntjGvrjuPSA/VbX/NhNjaokcFZhtgZFUy2Ez/MBXie3gppSRw
         rQe2nxyCh2DccYOQzI/6wTMMpz+Yc3VWyvpXmon+gt3XA2+Vehtmk2iQ6j37YCwx27EQ
         3slA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        fh=BbstfhKKxNA0Qskqh/XHQV9cKp7FPOHpb3gadm6qbPc=;
        b=odnU9pFjfbMas/pxaKia7NEQmMB1SCrt7K2apbwgnzc1ic2Xkj0MtN8R0ENaBSINEG
         jLuCGFevJFPQkavdhThnpk3CSMo0IdSclt/tWcmHZznFJDoN/VU2MD91v3l5IA2/e/+u
         jjW/LfXfRpa0QYV+UO632utW8iQniPV3vJ6vjcwAaKTo24SheZZRNSVUMF5atakVo58C
         aY9q30QQjFbNCPqVx/1HjYJ1Y4golRDgjBc0J2dQlVeU0G/zkXzfaY+arVFiiUmM//sA
         aaLaXMofaL7MedtXb83HiCVP03pxlPH590q561LPYlYAM85w8dUG/5MvwL7ju8mDHMWA
         O/nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935739; x=1795540539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        b=0Y76Ifj8d0i/HievOD+S/vLbshO8yiCsFsY1cg0g2oVP0cooU21euS6mvQFEHc3qd3
         Iapj8n4Yx7i/NWXzCUxZcq2lrb5Vev4VOMQtniN6TxwVp8WPYgW0yNp3l7kedussZYzF
         qcXmHM+4/yDOcZtzBg8zXkDF4HCm8Jtc6s6CS+p57usGGBT4CVCDcoYX0D5/LDlEQ6Q8
         lRF+jjb3HMeHLmvNLtxoKK1f5X8bvTsFKAYwH5+vZ7nftrzqoOMKRObc+uPnHmouEHEh
         KwFhXMQ95I6R2na1XzIfN4mrBJi67rUeDzPwcUuBFu9FU5VtcUrK9V3cijnCkydyduXE
         8Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935739; x=1795540539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycZWOvsMh7FrRoAyBZL4w1avdQvDxeeSgNXhZZJtJFc=;
        b=FkCf3uIqsOKwolPE/CaEbubifDoFjejkN2FY3wZ4AED/WID+Kokvb7AXaZNDSHJqF0
         5a1YLyWU1vEFlF9iyWZ2q8howftoiwqgnQvR0n4F7nwrvnv267b7FXEtwxHrvkRSUDyO
         1D5xBMEmPfGpLCGLNTnkDLqJ8xk5ja+kBdgKg5VS5qyo3zI/thaVzpoj4xe+ZX/2JBTV
         9pRB+uH+ctDPy3vF4Lay6ko3tgjCDhuggW7MVaY1aJCpYyS784udlRwQ/Kb7GazuuJk1
         u86l4apGZAbAD+dwRqQ1k+TBUyYu3qmhciq1/YskyHbglbMRM7Zh3dPnWaIp5nqYqUw7
         fs2Q==
X-Forwarded-Encrypted: i=1; AL+hErHmW51KY4OGxr2d+feDThr9pgfIJQhm03lty2l9u1Mb/2qCdbMTDXFleVQs0Q93ud++8zEmsvstEW+kyBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+araGXKgGY6sAa6nKXoEShAGlcG9IqnU/cHn5RGayXEAmgzxmU
	Hgl3grQTRKbfkKinj6M7UdeL5gsXx8RLSCHzAn4U6wNTyjnFEqCgD4kuZKxwd+OgrxYoHtVi8/Y
	tE3DYz5WpSO3EZqH9f09raCtW45IiwSs=
X-Gm-Gg: AYBFou0Z8IMPQheN7fhrD97BmBU1MZpVq/kmg7ZklWO781z4mXWZ47n5yHmt+jBSOzl
	ba08pd2rWy8vzUOTKrMvcChWShf8NSslQTw6L0HZMgx+kADNGQOXaOqBmPGDsVIICqbfepH4zDb
	KaEI3gSudrnb31ZT1ysfrvfQfTptMcPJGF2qFvWSqYt5fkc8wHlunsJJJ2J7oimCA/JmunH4gFy
	JQVxMz9avsfKnyzF5rRhyXj2Jyo2AqtIGo0Nz5jVXu0KEBPSNss5mYu13qQh/WWr3GI08zACOaN
	gA0VHBhUWVX7NqPLOQnCY1EX9272nK8+QhqqidbwdlwS2T8GEDb+D0oNU1nlR8PCas6F9KeQne6
	uoncjTBZ5EY4Xudp8qw5ZmFViJQhU+lh2wg6HKQIDIAIjatWgNtMZeEzlnK1c9H1IdFLgKXdjXv
	X6wQPZXf06/ztqHXCMKSQ75uuNGYz1X5gFfwLfC9nkbQ+s6/ovl9g8mt3YRRHYPhTCBbDW+LbTX
	ortQEMdpc6OmPl4j5imhwSihgVWhw==
X-Received: by 2002:a05:6402:42cb:b0:6b1:d439:5c5 with SMTP id
 4fb4d7f45d1cf-6b7c088fadfmr11109937a12.3.1794935738608; Tue, 17 Nov 2026
 09:15:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
 <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-50-556b1d7c6221@gmail.com>
 <edb4f1ae93fff1bea9380dc7fb1d2c8f2570bb67.camel@crapouillou.net>
In-Reply-To: <edb4f1ae93fff1bea9380dc7fb1d2c8f2570bb67.camel@crapouillou.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 10:15:24 -0700
X-Gm-Features: AclHuK9KT8grAZrRLLebF-am9hX1f-i-TowuArJi-sKzS1G3iCSB2RVcRvk6uKs
Message-ID: <CADvTj4qJXb5sUQbDrAj5uY+VDYcP9HOGHuy4j3iA0dQEDF3amw@mail.gmail.com>
Subject: Re: [PATCH v4 50/58] mtd: rawnand: ingenic: retain chip state across removal
To: Paul Cercueil <paul@crapouillou.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:29=E2=80=AFAM Paul Cercueil <paul@crapouillou.net=
> wrote:
>
> Hi James,
>
> I tried to apply on top of mtd/next but it does not apply cleanly.
> So what base are you using?

For v4, I used NAND next at
30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85, plus the separately posted
fixes listed as prerequisite-patch-id entries in the cover letter.
The Ingenic patch also depends on the earlier core changes in the
series.

With released b4, shazam -H uses the declared base and retrieves those
prerequisites before applying the series. Provided that base commit is
available locally, this reconstructs the tree for review:

b4 shazam -H -v 4 \
  20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gma=
il.com
git switch -c nand-lifetime-v4-review FETCH_HEAD

For b4 0.17-dev, add --merge-base _specified, since its default base
selection changed.

I verified that all 16 prerequisites and 58 patches apply cleanly on
that base, and the resulting tree matches the sent v4.

>
> Le vendredi 13 novembre 2026 =C3=A0 11:15 -0700, James Hilliard a =C3=A9c=
rit :
> > Unregister and disconnect all chips before releasing the ECC provider.
> > Retain each chip and its shared controller until the final MTD put,
> > while releasing hardware resources during device removal.
> >
> > Run NAND cleanup during disconnection; the final core-owned put only
> > releases retained allocation and layout data.
> >
> > Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> > Cc: linux-mips@vger.kernel.org
> > Cc: Paul Cercueil <paul@crapouillou.net>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 39 +++++++++++++++++=
-------
> > -
> >  1 file changed, 27 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > index bdda06ae0d72..2818ffe76796 100644
> > --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> > @@ -368,7 +368,7 @@ static int ingenic_nand_init_chip(struct platform_d=
evice
> > *pdev,
> >       if (IS_ERR(cs->base))
> >               return PTR_ERR(cs->base);
> >
> > -     nand =3D devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
> > +     nand =3D kzalloc_obj(*nand);
> >       if (!nand)
> >               return -ENOMEM;
> >
> > @@ -377,7 +377,7 @@ static int ingenic_nand_init_chip(struct platform_d=
evice
> > *pdev,
> >       if (IS_ERR(nand->busy_gpio)) {
> >               ret =3D PTR_ERR(nand->busy_gpio);
> >               dev_err(dev, "failed to request busy GPIO: %d\n", ret);
> > -             return ret;
> > +             goto free_chip;
> >       }
> >
> >       nand->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LO=
W);
> > @@ -385,15 +385,17 @@ static int ingenic_nand_init_chip(struct platform=
_device
> > *pdev,
> >       if (IS_ERR(nand->wp_gpio)) {
> >               ret =3D PTR_ERR(nand->wp_gpio);
> >               dev_err(dev, "failed to request WP GPIO: %d\n", ret);
> > -             return ret;
> > +             goto free_chip;
> >       }
> >
> >       chip =3D &nand->chip;
> >       mtd =3D nand_to_mtd(chip);
> >       mtd->name =3D devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(d=
ev),
> >                                  cs->bank);
> > -     if (!mtd->name)
> > -             return -ENOMEM;
> > +     if (!mtd->name) {
> > +             ret =3D -ENOMEM;
> > +             goto free_chip;
> > +     }
> >       mtd->parent_dev =3D dev;
> >
> >       chip->options =3D NAND_NO_SUBPAGE_WRITE;
> > @@ -404,17 +406,27 @@ static int ingenic_nand_init_chip(struct platform=
_device
> > *pdev,
> >       chip->controller->ops =3D &ingenic_nand_controller_ops;
> >       ret =3D nand_scan(chip, 1);
> >       if (ret)
> > -             return ret;
> > +             goto free_chip;
>
> Blank line here
>
> > +     ret =3D nand_set_lifetime(chip, to_ingenic_nand(nand_to_mtd(chip)=
));
>
> This is quite convoluted, just do nand_set_lifetime(chip, nand);
>
> > +     if (ret) {
> > +             nand_cleanup(chip);
> > +             goto free_chip;
> > +     }
> >
> >       ret =3D mtd_device_register(mtd, NULL, 0);
> >       if (ret) {
> > -             nand_cleanup(chip);
> > +             nand_disconnect(chip);
> > +             mtd_put_master(mtd);
> >               return ret;
> >       }
> >
> >       list_add_tail(&nand->chip_list, &nfc->chips);
> >
> >       return 0;
> > +
> > +free_chip:
> > +     kfree(nand);
> > +     return ret;
> >  }
> >
> >  static void ingenic_nand_cleanup_chips(struct ingenic_nfc *nfc)
> > @@ -429,8 +441,9 @@ static void ingenic_nand_cleanup_chips(struct ingen=
ic_nfc
> > *nfc)
> >               chip =3D &ingenic_chip->chip;
> >               ret =3D mtd_device_unregister(nand_to_mtd(chip));
> >               WARN_ON(ret);
> > -             nand_cleanup(chip);
> > +             nand_disconnect(chip);
> >               list_del(&ingenic_chip->chip_list);
> > +             mtd_put_master(nand_to_mtd(chip));
> >       }
> >  }
> >
> > @@ -474,9 +487,12 @@ static int ingenic_nand_probe(struct platform_devi=
ce
> > *pdev)
> >               return -ENODEV;
> >       }
> >
> > -     nfc =3D devm_kzalloc(dev, struct_size(nfc, cs, num_banks), GFP_KE=
RNEL);
> > +     nfc =3D kzalloc(struct_size(nfc, cs, num_banks), GFP_KERNEL);
> >       if (!nfc)
> >               return -ENOMEM;
>
> Blank line here.
>
> Cheers,
> -Paul
>
> > +     ret =3D devm_nand_controller_init(dev, &nfc->controller, nfc);
> > +     if (ret)
> > +             return ret;
> >
> >       nfc->soc_info =3D device_get_match_data(dev);
> >       if (!nfc->soc_info)
> > @@ -493,7 +509,6 @@ static int ingenic_nand_probe(struct platform_devic=
e
> > *pdev)
> >       nfc->dev =3D dev;
> >       nfc->num_banks =3D num_banks;
> >
> > -     nand_controller_init(&nfc->controller);
> >       INIT_LIST_HEAD(&nfc->chips);
> >
> >       ret =3D ingenic_nand_init_chips(nfc, pdev);
> > @@ -511,10 +526,10 @@ static void ingenic_nand_remove(struct platform_d=
evice
> > *pdev)
> >  {
> >       struct ingenic_nfc *nfc =3D platform_get_drvdata(pdev);
> >
> > +     ingenic_nand_cleanup_chips(nfc);
> > +
> >       if (nfc->ecc)
> >               ingenic_ecc_release(nfc->ecc);
> > -
> > -     ingenic_nand_cleanup_chips(nfc);
> >  }
> >
> >  static const struct jz_soc_info jz4740_soc_info =3D {
