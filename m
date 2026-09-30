Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D233438A9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756266; cv=pass; b=IfBbowkpS3dG5YPcJRvcKyC+Y/ISzQADZytWAGzQRMZUMoFDD4D53EGQKgM6YZHGGKI/VWVjj/JJezT/Wl7NaPTugU7Wqb77B/dU4Z/PLFcHnuoaMYn4jZLRohjuJCkS+qb/0y36peaNSCLi8P5Fwo+8bt3Qt0W440rITPJGnAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756266; c=relaxed/simple;
	bh=XVGRDCgGlEVHw3DV2q2hmB845D3Rxr6e6D3xhaRfM90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hit6Bai9nF3kNRdJrxKsbOLAfTo2PhkxPTg2lOcYabg2vveuujtQEPp5Iu4X9AHY3HNtAvLq43Q9GndpDrYyZszdjdu+kWCOapsRNMjccXFjN9CBgT8qaSYX7tas7YIIQpYNBhxq8GBnPSmBvsUZ3q60DgAzWGBjNa6N1HInVHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QpOn1mJo; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QpOn1mJo"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-67408b109e3so2206252d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790756263; cv=none;
        d=google.com; s=arc-20260327;
        b=A5M2m/JWpZ5xCpNZ7g89hMhoflYPNaAmxbYZ6MFhDEmIAlgcDQCDlSgTy396vC5P2N
         2xzwBYEX7NcfoAJprRapsl+J45gGHOJs9Ti5/gdn8flEdxvyCAbaFleIFlNjKtoXck6G
         NBCrPaHMvTa46EUZNv/7B9SyUsXmjr9dDbSHk4TtbWNPQoAZKr0+kQ25ticET+yJGydy
         EMmpOBeiICBfd7hie3Y2Qq0KNhs68Ju5ttvfDt0DqFSXzPmx2KMk0XpBhgKuRgF8cROE
         dS45O5Eqx8xbeXpVtiTus5BN+6oAK0IIDpPYkG44erwLCJODoqbK3kyIn6pmGnlJmM1w
         qjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRcKtZdHFiy0cgyAQBIRvb56t4wOCvKeqqa65x2mOhk=;
        fh=opkEnXv+m90w499fv7rY7nU8Mn31BfJ50vSUVWDyMs4=;
        b=N30FFltr/iisYUEHcMcAc2aZpHgp+6a7shuBXY+ba4p1d2OdaRmCGHCFhSrA7jlIcs
         S9NEC9DQPmk9nyTtFVtRB/c+8jQXUSbHsiDfxZsbav/SF8gompD70lk7JxicjUdJH4sd
         S/LemKVEbNwpZf0sJL7LrFgq2Qr+i/UsXVF7xY2eWUt/SICuY/MGGLjLmCKkYlAD16wd
         F4rBo6+jrLS8XKknd2ZsSFz2+sNhc2QqROIbTVmgZtWi4iNExmPxE79S1R0wwbZRiIlb
         hvTsPJ7VWcaz8QS1A4E1g73BaFhojXQtv8dihrrcvzfI7/PkeG7cps1uYRBj2I2lQyWS
         n8zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790756263; x=1791361063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mRcKtZdHFiy0cgyAQBIRvb56t4wOCvKeqqa65x2mOhk=;
        b=QpOn1mJoCrrJyhop/CbtcUS/GJWhAhcJk1b+M53nFwdtDEpfOVwrveF399yUZKszeW
         VfixfT9eIvpKgzoRWnQpaCKzEjEm0VzQzDSMW+6Rid4BbR7kZoXz4VwRaMrmoFGFu6z1
         nL20zUM+u0XjZbB3Nv71o7b+ka2IqiFmlL97w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756263; x=1791361063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRcKtZdHFiy0cgyAQBIRvb56t4wOCvKeqqa65x2mOhk=;
        b=vu1dFMScRDw4ECgiTFfeTZR5wvLIrPjfPDQUeIhdUBXot0gRrfvVK42O0l6yLFDx0k
         Ln/GOweLqAO9C7yTJhGeZ3Mii21DQ7ELOxoK6lMV8aYJdDu+akr+1ykMMzTnXQNHTysK
         dGCgJzjaWa8T5xn3clY0S8r4swWoVx4+4/7bB8M1JZBMmdNkGPN0dDcVgN3x30ZcDFKS
         BsDjvtzTs/Fnh5nnNqgz8Id3+8ut5AG+E7StEdmLnFkUqqyNeHPp1LzjxEaUrjtsK5UG
         Sr8Z4bUZ4KpK2z7UIDQ5LzVrg1+2ro0/q3D56XlaEdZSSNf9bDmgZPc3JX46E026atFu
         0xYg==
X-Forwarded-Encrypted: i=1; AKwUvBzkA17Hx6frsNiG2iOsMjU8b1Bw+gwIwjsYPL9LUcaZGX39A9ETQIwB62b7o19ZfnlSXYS+HKyuwdWZ374=@vger.kernel.org
X-Gm-Message-State: AFq9FYITODpaDpoXyF1lPASI3zpDYLE3fKCJOccl9ImTBHRIDgLk1M+J
	mARTmerm5VAfr1tw4r2kcALiR7WU32r+aJhw1IYtrSBZjpkOzDJXAiojFAEywNG8W5sv9ARaTp6
	pzeUvcYm7LHl1djxeFIJXkuhL0+Jl8J4K/quYr04F
X-Gm-Gg: AYBFou1ohs/UYM8AGX0XEAYG0zVzfv7U/hFb9m9/IIMQmE8tNXN0igFbpanVhs82k8T
	rhpQ1BLAq13yaZIWj8O1u1yjh/n/3ITeYi/5dbB6c3FMUqNdbFwe0Xr4sPGjMpORlk0tqtjW+Xb
	PbF8xKOPNONhjdIMqAZlbfaN7nieudHEcRWGg+5JMoRM+NaktRf00robX2Y/pUuNx3UI6TBKVnn
	1s1v2S0XNe+ym6qUmQ3/nJzaROAo095KeIalbbeg/V4wHjXBLqTMrM4Sc9tJxUzYM1FEXfMnKC5
	iM7NCnPi/BZLbAqujXKjT4jvtwNHW1FMYtvPpKRpGGJP+CMBgpdkCm7lXH/BOAgSRSLLocEdHTD
	T+wAHfJiVpXIymWAoNEEbu4Yo9bYSKz8=
X-Received: by 2002:a05:690e:138e:b0:676:88ca:2799 with SMTP id
 956f58d0204a3-67688ca33c7mr12124d50.0.1790756263029; Wed, 30 Sep 2026
 01:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
In-Reply-To: <20260930080609.dnK1-Uta@linutronix.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Sep 2026 16:17:31 +0800
X-Gm-Features: AclHuK94rH4mX8n1W8Ppf4V2xglhOfwH81bL1d3SpkI1GiY_ngCECHUlOisIdXY
Message-ID: <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:06=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-09-29 12:57:51 [-0500], Ryan Brue wrote:
> > The EINT irq_chip emulates both-edge interrupts by reading the pin's
> > level through mtk_gpio_get() and the pinctrl regmap. It does so from it=
s
> > unmask and set_type callbacks, under the raw irq_desc lock, and from th=
e
> > chained handler, in hard interrupt context. The regmap comes from sysco=
n
> > and locks with a spinlock_t, which may sleep on PREEMPT_RT. With
> > CONFIG_PROVE_LOCKING, the first request of a both-edge EINT prints
> > "[ BUG: Invalid wait context ]" and turns lockdep off for the rest of
> > the boot.
>
> This duplicates syscon node and creates a new one with the
> .use_raw_spinlock=3Dtrue attribute. Now, syscon is always low-level acces=
s
> with MMIO access, right?
>
> I've been wondering if we could make drivers/mfd/syscon.c use the
> raw_spintlock_t instead making this sort of change for every driver that
> has this "requirement".
>
> If this is all MMIO reads/ writes then it should work. I'm not sure why
> we have the lock to begin with. Probably due to the cache/ async writes.
> Cache wise just the flat-cache works since the other (like rbtree)
> allocates memory on write under the lock. So this does not work.
> What I am bit worried about are the bulk_write and multi_reg_write where
> multiple writes happen under the lock.

AFAIK the lock is primarily there to serialize concurrent MMIO access,
especially read-modify-write patterns in regmap_*_bits().

> > Create the regmap for the "mediatek,pctl-regmap" nodes here instead,
> > with use_raw_spinlock set, and register it with syscon so that other
> > users of a node, such as the ethernet on MT2701 and MT7623, share its
> > lock. If the node already has a syscon regmap, keep using it. Select
> > REGMAP_MMIO, which the driver now uses directly.
> >
> > Fixes: 3221f40b7631 ("pinctrl: mediatek: emulate GPIO interrupt on both=
-edges")
> > Assisted-by: LLM
> > Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> > ---
> > Found on the Amazon Fire HD 10 (2017), an MT8173 tablet that is not
> > upstream yet, where usb_extcon_probe() requests the USB ID pin's
> > both-edge EINT. With this patch lockdep stays on through boot, CPU
> > hotplug, suspend to RAM, and lid open/close edges on the hall sensor's
> > both-edge EINT. Only MT8173 was tested. Nothing else uses the node
> > there, so the -EEXIST fallback was not exercised.
> >
> > checkpatch warns that the regmap_config should be const. It is copied
> > per node to set name and max_register, as syscon does.
> > ---
> >  drivers/pinctrl/mediatek/Kconfig              |  1 +
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 59 +++++++++++++++++++=
+++++++-
> >  2 files changed, 58 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediate=
k/Kconfig
> > index 30ef3dc5dfb1..764256901d6a 100644
> > --- a/drivers/pinctrl/mediatek/Kconfig
> > +++ b/drivers/pinctrl/mediatek/Kconfig
> > @@ -17,6 +17,7 @@ config PINCTRL_MTK
> >       select GENERIC_PINCONF
> >       select GPIOLIB
> >       select EINT_MTK
> > +     select REGMAP_MMIO
> >
> >  config PINCTRL_MTK_V2
> >       tristate
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pi=
nctrl/mediatek/pinctrl-mtk-common.c
> > index 1a977acd6883..65b1e3096183 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/gpio/driver.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/pinctrl/machine.h>
> > @@ -1057,6 +1058,60 @@ static int mtk_eint_init(struct mtk_pinctrl *pct=
l, struct platform_device *pdev)
> >       return mtk_eint_do_init(pctl->eint, NULL);
> >  }
> >
> > +static const struct regmap_config mtk_pctrl_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .use_raw_spinlock =3D true,
> > +};
> > +
> > +/*
> > + * The EINT irq_chip reads a pin's level through this regmap from call=
backs
> > + * that run under the raw irq_desc lock, so the regmap has to use a ra=
w
> > + * spinlock too, which syscon's own does not. Register one with syscon=
 for the
> > + * node instead, so that any other user of the node shares its lock.
> > + */
> > +static struct regmap *mtk_pctrl_syscon_regmap(struct device_node *np)
> > +{
> > +     struct regmap_config config =3D mtk_pctrl_regmap_config;
> > +     struct regmap *regmap;
> > +     struct resource res;
> > +     void __iomem *base;
> > +     int ret;
> > +
> > +     ret =3D of_address_to_resource(np, 0, &res);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     base =3D ioremap(res.start, resource_size(&res));
> > +     if (!base)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     config.name =3D kasprintf(GFP_KERNEL, "%pOFn@%pa", np, &res.start=
);
> > +     if (!config.name) {
> > +             iounmap(base);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     config.max_register =3D resource_size(&res) - config.reg_stride;
> > +     regmap =3D regmap_init_mmio(NULL, base, &config);
> > +     kfree(config.name);
> > +     if (IS_ERR(regmap)) {
> > +             iounmap(base);
> > +             return regmap;
> > +     }
> > +
> > +     ret =3D of_syscon_register_regmap(np, regmap);
> > +     if (ret) {
> > +             regmap_exit(regmap);
> > +             iounmap(base);
> > +             /* An earlier probe, or another user of the node, got the=
re first. */
> > +             return ret =3D=3D -EEXIST ? syscon_node_to_regmap(np) : E=
RR_PTR(ret);
> > +     }
> > +
> > +     return regmap;
> > +}

This defeats the purpose of having a phandle to a syscon node. Now you
have two regmaps that don't share locking, so both could end up touching
the same register in a read-modify-write operation and overwrite one or
the other.

The syscon node is the provider of the regmap. You need to fix it there,
not duplicate it in the consumer.


ChenYu

> > +
> >  /* This is used as a common probe function */
> >  int mtk_pctrl_init(struct platform_device *pdev,
> >               const struct mtk_pinctrl_devdata *data,
> > @@ -1076,7 +1131,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
> >
> >       node =3D of_parse_phandle(np, "mediatek,pctl-regmap", 0);
> >       if (node) {
> > -             pctl->regmap1 =3D syscon_node_to_regmap(node);
> > +             pctl->regmap1 =3D mtk_pctrl_syscon_regmap(node);
> >               of_node_put(node);
> >               if (IS_ERR(pctl->regmap1))
> >                       return PTR_ERR(pctl->regmap1);
> > @@ -1089,7 +1144,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
> >       /* Only 8135 has two base addr, other SoCs have only one. */
> >       node =3D of_parse_phandle(np, "mediatek,pctl-regmap", 1);
> >       if (node) {
> > -             pctl->regmap2 =3D syscon_node_to_regmap(node);
> > +             pctl->regmap2 =3D mtk_pctrl_syscon_regmap(node);
> >               of_node_put(node);
> >               if (IS_ERR(pctl->regmap2))
> >                       return PTR_ERR(pctl->regmap2);
> >
> > ---
> > base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> > change-id: 20260925-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-154d6=
225b977
> >
> > Best regards,
>
> Sebastian
>
