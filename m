Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9062D289E13
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467664; cv=pass; b=dLk+HOhGmmVKSF+fZxmSWa0xgUkNh281LvQXSXcDLLEQ5/+jjW50G0rkXF1B6YZWuAKdiXXpVMzVyhduApk5kYrNnf8A/fNGxTzMi/YAtJiNYG4U9yQQsN+i6PSwdtK+YgdQlCP25RgCGDYaul/xpb2Dc1lcodopcnXqBcyeBGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467664; c=relaxed/simple;
	bh=bAMY2+7NdBpknX1b/bKDfSqfa/q33zIYR9kunz/gZ3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBjhsvo6zJloBWhtYyT/jIQeU7PRdQRZvIW5KO3MJYTJm/LNgny3dxtdrxdGdxAq94qUjbVIm+ocgnXdRMtrPfascVM5KPAI/HD0cAKWYot1uyVcm9yG2gl/5XU4S81AOMBEjKE7pbnSfetsjZhgqxXyiWD4Avdv8CiXUwEztq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jefw9ECK; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jefw9ECK"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso276441a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788467652; cv=none;
        d=google.com; s=arc-20260327;
        b=TrLAyYWncwSkKcoys1pGas4fo9gpA3q1cRV+Ehx+KT0SWqUu2qc9jCq6/aXgoGbYIV
         pYvPI71F8EbXuzx0WwbWBk3rJWdiuQ7bCOtQNT8ssWqV4HzXzH1HUY7XSiyoDRkKfC8I
         VgZkEEOYYeFEMQeqRf00jdQbHa+27prqPC8mcB2HeQ3Vn3jczeuFtZP7bTuoBA0WDDAm
         EoUSQ2ZBMbyjgR2TWNQSBxmkQgskpdzQ2SZJp3MdKE1Qjc0PZOENa41Bn0CWZe5u8ZJL
         lm6MFpJy3CYRuqMbvnqPYV5+OsRe0W0lCpJGFUzio/c+7Cgia4t9NZ/WF8fcfIf7n7sR
         OwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wn8+JYMlq4Rx5lFf5+2VtE/KYFJo5A7LJlgeoB0knyI=;
        fh=Q1v2jIndBKOImPadM6AgHwwVZhMegQe2oQMtHixm4IU=;
        b=WItJ6LUpelmM0v62vDXXRIRdk2HB8bGYcQnwJ795vWCOlwIwOkyaE4m+rTTLDo13a4
         hfY7zm4Bu6vPK5MbQsySfwOiJuhVbfqYeJ/HCyZa4YGKM+eiXovKrsMElFUfY5rnrZ4k
         T/iI97N0VqP3788evzsWNDKgPeJQZCEsOZQ0awexQZDdIYgl5qpg0DMTMJXwOApibS+r
         +pFnPatcTn38B0dDvxAfMBILe1qsNU1cHKAn82mVyYLMN4gbq45xuh0GWL3loMdi0Bzt
         MylKyixgMl5Z+XJ8u4+/NVNd+3Q2uIiX4/cW5DxxG65/WGeWJRpf8QhCqkpNgh3xoprb
         pJxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467652; x=1789072452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wn8+JYMlq4Rx5lFf5+2VtE/KYFJo5A7LJlgeoB0knyI=;
        b=Jefw9ECK+CH+02BPOIbcnpLCxriIX6IDkkMbH6SABfrb5EtHYcrbGNuWxOGXB4aHiH
         GYOedHsBdKaPn9U28RPjmMXj0akfeItye40o/44Kt2d3a41Q1N/64+MpSQ8ZX2OGKzMh
         fSjwuqOWnERzIUwohzMvuiMoo57Xp60C0tIGkYNk6lI+hJPGPTdUH9DLHhYFD+PYHlUP
         U5f1lTF5YUWhd/nNutL/iqF+LWXB1nWi0p1hWWI0BJbiZkKaiGcO8PkI4QbZHSz9Q++1
         MBp9lzNR+x/rfCzmoAcQznnKDTk/w3DWOUwrlw7odYoX0dTW4gh1fjH6RAkP15Axh6JG
         etJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467652; x=1789072452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wn8+JYMlq4Rx5lFf5+2VtE/KYFJo5A7LJlgeoB0knyI=;
        b=nNjdP14ppAKTNLHwU2j17Q80qGmQS2k9XOyoHQwZ9sOK/Yv87/9+za0ljTKq3Q8KBC
         tYL/dl7Oq5pxaI/kPlkRGQFrzr2gETTXzbJJHyrnX1cUAr0bLkvl6F8MfWnBcsjIv50s
         SnvfxP+2kDjPcCDe7SU8skb7gsH2lQM5ar97On9O1tIEDUcxdbIQCW91TKU4dhxTpMRM
         HeD4iLbcij/Fmr9g4hks71KO2f7hbF1ObQXVopmRAMQtt0mV4rvfm0n+uEAh6rgPfOp7
         WYxi39GhOv462Hrz1BXSmBgv+ONz1RQrwQ+fP4L5ZShHozlQS75iZkAI1JsJGWnAJE2w
         Mm3g==
X-Gm-Message-State: AFuF++kati+eGqdLEao8qbg/WgfxGKJv/jX83+e+yFMLSiUojr0EQst0
	DzkSmzixJZlHT8QZuZjwu/5sce0sUNfQZJvG5BL4Qh6rhtVURTdTKxDNhzsmbrOdgCPMIJliDKh
	g4kKPzWOX/M2Rx2L8zfnmcrOzB2wXDHg=
X-Gm-Gg: AYBFou0RgCfS0UZC2KGDWoCNGzeDVrDSycjqY1ZQY7QiP/Cu6/WfF42xIvjN6Is2nm5
	Od49UjK+cbVMa7KgR4ImyB9ihEeP3WfwQqzSczzQwM5CImZbobbajwhmJb0eVVcjlf3FBLVQXSF
	O0EMzZ7DEUHQkH8rpRkxcXCb2Wcy+3PSLVbSRxtTxbQ8Vwr43RIW5HkjfkMPaceFNoew2yWA4GD
	BQAvB/zKVpXBA7Bc2BgMvZRIohcavxZAPrnNdAGQMM57w8Nr23S79oH4cjQZvQNVCTW+dSHt0GG
	9rEyQLGcb8p4pDeB8jkBAdke0y230nzhjpWCdHAyWFG8JBDJCG7HvRoTQGrSmre9cnrJMXJhRIZ
	5b8lRz9/A3dt4ZzfR6NTEAk6FMWZEQupDs/Ejbbx0P8fkIXWDbH5Yg+HHmqKxiLxXGs3sxMqzHY
	GBivtquFgwPGm8KuSiJNLW5Q1rIpJSOi2TpaVN8cx9eDdXHHiqWHD2n40=
X-Received: by 2002:a05:6402:325a:b0:6a6:1a05:8b30 with SMTP id
 4fb4d7f45d1cf-6a7e8d53f89mr309649a12.6.1788467651992; Thu, 03 Sep 2026
 13:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430221123.79947-1-rosenp@gmail.com> <20260903174710.yxgdfqjt5neryhjh@earshot>
In-Reply-To: <20260903174710.yxgdfqjt5neryhjh@earshot>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 3 Sep 2026 13:34:00 -0700
X-Gm-Features: AcwNN1Wq1MudK6v4ccG3OImr33tv_HzVEyKSy5_QXdishgADNjxCPkVzxaiaNbI
Message-ID: <CAKxU2N_SPEoxJ2jE_Dm2AtYW5vxU-Cx66knCDL21bPGdbpHhCw@mail.gmail.com>
Subject: Re: [PATCH] firmware: ti_sci: simplify resource allocation
To: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:48=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 15:11-20260430, Rosen Penev wrote:
> > Use a flexible array member to combine allocations.
> >
> > Add __counted_by for extra runtime analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/firmware/ti_sci.c              | 7 +------
> >  include/linux/soc/ti/ti_sci_protocol.h | 2 +-
> >  2 files changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> > index e027a2bd8f26..04d99c1fafa1 100644
> > --- a/drivers/firmware/ti_sci.c
> > +++ b/drivers/firmware/ti_sci.c
> > @@ -3574,16 +3574,11 @@ devm_ti_sci_get_resource_sets(const struct ti_s=
ci_handle *handle,
> >       bool valid_set =3D false;
> >       int i, ret, res_count;
> >
> > -     res =3D devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
> > +     res =3D devm_kzalloc(dev, struct_size(res, desc, sets), GFP_KERNE=
L);
> >       if (!res)
> >               return ERR_PTR(-ENOMEM);
> >
> >       res->sets =3D sets;
> > -     res->desc =3D devm_kcalloc(dev, res->sets, sizeof(*res->desc),
> > -                              GFP_KERNEL);
> > -     if (!res->desc)
> > -             return ERR_PTR(-ENOMEM);
> > -
> >       for (i =3D 0; i < res->sets; i++) {
> >               ret =3D handle->ops.rm_core_ops.get_range(handle, dev_id,
> >                                                       sub_types[i],
> > diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc=
/ti/ti_sci_protocol.h
> > index fd104b666836..7632bb11c862 100644
> > --- a/include/linux/soc/ti/ti_sci_protocol.h
> > +++ b/include/linux/soc/ti/ti_sci_protocol.h
> > @@ -599,7 +599,7 @@ struct ti_sci_handle {
> >  struct ti_sci_resource {
> >       u16 sets;
> >       raw_spinlock_t lock;
> > -     struct ti_sci_resource_desc *desc;
> > +     struct ti_sci_resource_desc desc[] __counted_by(sets);
> >  };
> >
> >  #if IS_ENABLED(CONFIG_TI_SCI_PROTOCOL)
> > --
> > 2.54.0
> >
>
> drivers/dma/ti/k3-udma.c: In function 'udma_setup_resources':
> drivers/dma/ti/k3-udma.c:4689:22: error: invalid use of flexible array me=
mber
>  4689 |         irq_res.desc =3D kzalloc_objs(*irq_res.desc, irq_res.sets=
);
>       |                      ^
> drivers/dma/ti/k3-udma.c:4690:13: warning: the comparison will always eva=
luate as 'true' for the address of 'desc' will never be NULL [-Waddress]
>  4690 |         if (!irq_res.desc)
>       |             ^
> In file included from drivers/dma/ti/k3-udma.c:27:
> ./include/linux/soc/ti/ti_sci_protocol.h:602:37: note: 'desc' declared he=
re
>   602 |         struct ti_sci_resource_desc desc[] __counted_by(sets);
>       |                                     ^~~~
> drivers/dma/ti/k3-udma.c: In function 'bcdma_setup_resources':
> drivers/dma/ti/k3-udma.c:4881:22: error: invalid use of flexible array me=
mber
>  4881 |         irq_res.desc =3D kzalloc_objs(*irq_res.desc, irq_res.sets=
);
>       |                      ^
> drivers/dma/ti/k3-udma.c:4882:13: warning: the comparison will always eva=
luate as 'true' for the address of 'desc' will never be NULL [-Waddress]
>  4882 |         if (!irq_res.desc)
>       |             ^
> ./include/linux/soc/ti/ti_sci_protocol.h:602:37: note: 'desc' declared he=
re
>   602 |         struct ti_sci_resource_desc desc[] __counted_by(sets);
>       |                                     ^~~~
> drivers/dma/ti/k3-udma.c: In function 'pktdma_setup_resources':
> drivers/dma/ti/k3-udma.c:5083:22: error: invalid use of flexible array me=
mber
>  5083 |         irq_res.desc =3D kzalloc_objs(*irq_res.desc, irq_res.sets=
);
>       |                      ^
> drivers/dma/ti/k3-udma.c:5084:13: warning: the comparison will always eva=
luate as 'true' for the address of 'desc' will never be NULL [-Waddress]
>  5084 |         if (!irq_res.desc)
>       |             ^
> ./include/linux/soc/ti/ti_sci_protocol.h:602:37: note: 'desc' declared he=
re
>   602 |         struct ti_sci_resource_desc desc[] __counted_by(sets);
>       |                                     ^~~~
> drivers/dma/ti/k3-udma.c: At top level:
> drivers/dma/ti/k3-udma.c:53:9: warning: macro "UDMA_RFLOW_DSTTAG_FLOW_ID"=
 is not used [-Wunused-macros]
>    53 | #define UDMA_RFLOW_DSTTAG_FLOW_ID       2
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/dma/ti/k3-udma.c:52:9: warning: macro "UDMA_RFLOW_DSTTAG_CFG_TAG"=
 is not used [-Wunused-macros]
>    52 | #define UDMA_RFLOW_DSTTAG_CFG_TAG       1
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/dma/ti/k3-udma.c:48:9: warning: macro "UDMA_RFLOW_SRCTAG_FLOW_ID"=
 is not used [-Wunused-macros]
>    48 | #define UDMA_RFLOW_SRCTAG_FLOW_ID       2
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/dma/ti/k3-udma.c:51:9: warning: macro "UDMA_RFLOW_DSTTAG_NONE" is=
 not used [-Wunused-macros]
>    51 | #define UDMA_RFLOW_DSTTAG_NONE          0
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> drivers/dma/ti/k3-udma.c:47:9: warning: macro "UDMA_RFLOW_SRCTAG_CFG_TAG"=
 is not used [-Wunused-macros]
>    47 | #define UDMA_RFLOW_SRCTAG_CFG_TAG       1
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:290: drivers/dma/ti/k3-udma.o] Error=
 1
> make[4]: *** [scripts/Makefile.build:551: drivers/dma/ti] Error 2
> make[3]: *** [scripts/Makefile.build:551: drivers/dma] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:551: drivers] Error 2
> make[1]: *** [/workdir/Makefile:2232: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
>
> If I am not mistaken, k3-udma.c and k3-ringacc.c will be impacted. can
> you check and update the patch?
Just the former.
>
>
> Additionally, please CC LAKML.
linux-arm-kernel@lists.infradead.org is already in CC.
>
> --
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource
