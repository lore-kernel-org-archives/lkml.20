Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E36396D2C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412206; cv=pass; b=Pcjx+VChf6u/oq/SvW/t95p+o+ZfCv05EIUIpvCK8y+WYRbewyhxI9/qMeSgdvD9dPKWswbs4Q0cwBDGNKie7c4nat0tHdBy7AwomNEomcTqykcGZv+cEZt9ZI1CqUFef+73GYGd5mCfLYA/44dd8XZDw5YjoaejG6EEhpndYio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412206; c=relaxed/simple;
	bh=TtfncmH80mrck36+bgc7vP1BFutRtUXi6yzpcoGC5lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TY7vdkJRhvURcwMlc58e6V/YoV4fc+nD1eA4Ny1cLj3EE4RWBo/k8QoEQJmu6twK+smUH3WqTgnREXZtYpt3dDj7vnZqayhRDbaml9gw0PmTcSUR5lOG1zPT8eK2mK11MbnBNT5Dhyyu2qozob2caOx0sA7czeoC0nSPCC8X9lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4iNEEQi; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4iNEEQi"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c25420fe973so625446566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789412203; cv=none;
        d=google.com; s=arc-20260327;
        b=RYUUNkEBnH70kbl3z+Mz+v1M/3hmzgLesSO1FPmA+54h+mVzNIpZnMZbgc9oBvPMVd
         K2LfRX+Iv/1q7nfscLcx9uK0u/VIeB3BR3X2hJODvyuDAxywkfxQPo2YcVZW88dgeHDN
         7fGPhE/sP0RfWtyJyXErszIbEv/I0Ja9Idyo3blN8laRfEmTkZFPprNC4faVhOuZ54Qy
         ol8hf9YFX8WYAivFAt5WGHIBnTxPYzcR9HzI4LT1Opp0xBXjb46prQ0XLgxnYPBFpj0W
         DVcauphHlgvymTXWzc2wq8Nxg4TnCteC7rZcjLLy39YAVRP+fLsUMZ2lUMHlLlifDfO1
         Njpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=InVDDjxxDJpVrdg9GAOJRRP06/ftdzYITwk4z/cEu+o=;
        fh=m5N/mAb6ip4EoOBgCGfKAUz9ryzHcJXasO8iF9f67tk=;
        b=JBA/KHnvwuTPYdhwGDH6LuXtjyCjnLt05BCHtg/kBaqww65ggYy3zJBD/NatdGfVPE
         8nd0fQV2wrg3Cp735IYeT/xk+crukZMO9/zd1YqOLsxPQQ0ZrkH2qQfktGWuK2Uj/t2m
         jvbIGc2iZyZxT8z6tFzGfvNW2gd3u1wer7GIR/AKJSFpUrW/PUzAdSyQmASNSg2IOdYq
         n8VgZjpUueKAG6zRIPW4h/erLVvdzUlSSu2pmggBcyfQl+cHj3l0ghA1tyav0pPkml2R
         uCKztcusU7zB047d2D/S8C+c5OBIM/1qxUlxvOy6/3wJGexlaIGwwz+EP+GMSwS7Kh2n
         Ta9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789412203; x=1790017003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=InVDDjxxDJpVrdg9GAOJRRP06/ftdzYITwk4z/cEu+o=;
        b=S4iNEEQiSuFQb4NtHSswPNABERr1P5gn1h/gS9bHd0/Op6XdJ+oAZNtPJA8eBSTJna
         YRx4St9x1rpS/H/A6Oasj6vk7hDQh/M4PZfY96Hh2vxfF5zAVUXAnUQFVxwHGx+xvfRJ
         CW+oB6LFw5ZD03N820P910krQW0FnnPgnqukZV+Aqec3xJwCyurjmq+cmBn+kMzsgYxR
         9xMoRoZnYw8Erq4uXJv5PS8iPB8eMdyeuULxjUC1pVckUnvvAVHLaZnDDWYcKHHWtcZp
         PZOPBD3UmtPqSOLcE1VGknq0Cv/hT2ckLfXm9anV6gB8vG6lX6il/On9UFPsJOD9Nulj
         edSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789412203; x=1790017003;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InVDDjxxDJpVrdg9GAOJRRP06/ftdzYITwk4z/cEu+o=;
        b=VKJsjeJrW32h74OzS63GIY3ahgtxxOgnUL5eoexMSnv7lJKRSAzxykxd8GLxT2XxuV
         7gjmlRzLFfMfEhIzNKPxcUaj3+lXlCRYsK6pKIPzHVmCtcNogNRFz8sZULiQuqscgWQA
         jEgbAxTy4BazAI11kDSpQ8xrBsLAeKaQ6aJwFzhQ61IrzI+ROHLE6wkfF++6KGHPsO8v
         X3z+I4nhNDwMjEkVx7//HYiu/Q0nd7KvquY8RbOYfYHdy5PWveA7ASUnNdw5oFKd7CDS
         uZZAnqzE0KlmQALky98AqG9PmvhDtc4AVcqTK4+moheB2kH6BrqXKGSMwKyIaGVE/o2R
         F5bA==
X-Forwarded-Encrypted: i=1; AKwUvBywi9u4QlIT2ak891o8LV+GdkFhAKJ+mB251jEUJWc39+4boZDGQhTnHS4yAYG157xpjuqPj40ofqh1IvM=@vger.kernel.org
X-Gm-Message-State: AFuF++nzM6tq99A4Oxs7txZOFF+niNdG/j1EdxnvzGUwvCmCKIXB/z0d
	BDB1Cs9ixjuXEx58m06eSweMFZYMBzU3yoWtpuUiNv8Q+LLlmOWKjZl9mRdWT6KSu7z8A9a2mFy
	0VlXSaVk1c0+nZW59Fxhkmi1hBZTzFgI=
X-Gm-Gg: AYBFou0CIggwkzsYMqaBH7Gmab4bp+X4E77ilmqvS5sKl0Ix813rcfaHBSnr+WvW+18
	RsmAM7e+XFFAU/FvHCwTngXo3K7qBMTOrZX28oM7w+RsEik1EX/RctcJRkm3WE90VvhPnBveRbQ
	bCbbMs1R0XzGBE7iSvAloCc5W9m+siEMWtNg8tH2JEbKG8NdqTRv5kAgej6p8jFxYOjDenAMDiF
	w5Ahn9tCatVB3f7PB4H7ocXstul6saxs52r2x8etqihAAck62CgZBp5YtHleDfUj5E/111LCNYp
	ntuXu7iv9QcmdVHnrKuQhzoeMTZ8PnWz2NN0Egny8k0VI6Zlf03Kb6/Di1XEgDx2JUfF9/t84dx
	YGEXX/AADfVsEdEZFsghRVd4eJmZd/u/sKrLCN/vIjpwHMk2PbD4qZNlMO72WmYXx25YYUU4yJv
	WZlzMVOWymiW6OOZb7nrIYcCR6pIUZrQZXF1Avq29rFegs3jribFsKyaIl4gh9LwoY/g==
X-Received: by 2002:a17:907:f497:b0:c26:19de:912c with SMTP id
 a640c23a62f3a-c29b86f1102mr253024066b.31.1789412202869; Mon, 14 Sep 2026
 11:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911220640.178074-1-rosenp@gmail.com> <aqgYKc5ViiWynzqS@SMW015318>
In-Reply-To: <aqgYKc5ViiWynzqS@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 14 Sep 2026 11:56:31 -0700
X-Gm-Features: AcwNN1XNYfhRZ9JwjZrSRRHjJV50DydZSSuGetocf8Q2opC6iByS3BkPVP-6b1o
Message-ID: <CAKxU2N-uY2_ToL5ivHxdu2WijN9zA1O3PCoiLw1pr52nsSJ2VA@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: ppc4xx: use devm_platform_ioremap_resource()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 8:52=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Fri, Sep 11, 2026 at 03:06:40PM -0700, Rosen Penev wrote:
> > Replace the open-coded sequence of of_address_to_resource(),
> > request_mem_region(), and ioremap() with devm_platform_ioremap_resource=
().
> > This eliminates error-path cleanup for both the memory region and the
> > ioremap.
> >
> > The two separate initcodes PPC_ADMA_INIT_MEMRES and PPC_ADMA_INIT_MEMRE=
G
> > are collapsed into PPC_ADMA_INIT_MEMRES since the combined call covers
> > both steps.
> >
> > Also emove unused PPC_ADMA_INIT_MEMREG enum value
>
> emove?  can you bound all ppc4xx patches to one patch serial to avoid
> pick up conflict between these patches.
I sent the ones that have none.
>
> Frank
>
> >
> > The PPC_ADMA_INIT_MEMREG error code is no longer used after converting
> > to devm_platform_ioremap_resource().  Remove it from the enum and the
> > corresponding error string.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: cut some stuff from description
> >  drivers/dma/ppc4xx/adma.c | 46 +++++----------------------------------
> >  1 file changed, 6 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
> > index 39498779e241..17b60704a702 100644
> > --- a/drivers/dma/ppc4xx/adma.c
> > +++ b/drivers/dma/ppc4xx/adma.c
> > @@ -37,7 +37,6 @@
> >  enum ppc_adma_init_code {
> >       PPC_ADMA_INIT_OK =3D 0,
> >       PPC_ADMA_INIT_MEMRES,
> > -     PPC_ADMA_INIT_MEMREG,
> >       PPC_ADMA_INIT_ALLOC,
> >       PPC_ADMA_INIT_COHERENT,
> >       PPC_ADMA_INIT_CHANNEL,
> > @@ -49,7 +48,6 @@ enum ppc_adma_init_code {
> >  static char *ppc_adma_errors[] =3D {
> >       [PPC_ADMA_INIT_OK] =3D "ok",
> >       [PPC_ADMA_INIT_MEMRES] =3D "failed to get memory resource",
> > -     [PPC_ADMA_INIT_MEMREG] =3D "failed to request memory region",
> >       [PPC_ADMA_INIT_ALLOC] =3D "failed to allocate memory for adev "
> >                               "structure",
> >       [PPC_ADMA_INIT_COHERENT] =3D "failed to allocate coherent memory =
for "
> > @@ -3997,7 +3995,6 @@ static void ppc440spe_adma_release_irqs(struct pp=
c440spe_adma_device *adev,
> >  static int ppc440spe_adma_probe(struct platform_device *ofdev)
> >  {
> >       struct device_node *np =3D ofdev->dev.of_node;
> > -     struct resource res;
> >       struct ppc440spe_adma_device *adev;
> >       struct ppc440spe_adma_chan *chan;
> >       struct ppc_dma_chan_ref *ref, *_ref;
> > @@ -4040,28 +4037,12 @@ static int ppc440spe_adma_probe(struct platform=
_device *ofdev)
> >               pool_size <<=3D 2;
> >       }
> >
> > -     if (of_address_to_resource(np, 0, &res)) {
> > -             dev_err(&ofdev->dev, "failed to get memory resource\n");
> > -             initcode =3D PPC_ADMA_INIT_MEMRES;
> > -             ret =3D -ENODEV;
> > -             goto out;
> > -     }
> > -
> > -     if (!request_mem_region(res.start, resource_size(&res),
> > -                             dev_driver_string(&ofdev->dev))) {
> > -             dev_err(&ofdev->dev, "failed to request memory region %pR=
\n",
> > -                     &res);
> > -             initcode =3D PPC_ADMA_INIT_MEMREG;
> > -             ret =3D -EBUSY;
> > -             goto out;
> > -     }
> > -
> >       /* create a device */
> >       adev =3D kzalloc_obj(*adev);
> >       if (!adev) {
> >               initcode =3D PPC_ADMA_INIT_ALLOC;
> >               ret =3D -ENOMEM;
> > -             goto err_adev_alloc;
> > +             goto out;
> >       }
> >
> >       adev->id =3D id;
> > @@ -4081,10 +4062,10 @@ static int ppc440spe_adma_probe(struct platform=
_device *ofdev)
> >       dev_dbg(&ofdev->dev, "allocated descriptor pool virt 0x%p phys 0x=
%llx\n",
> >               adev->dma_desc_pool_virt, (u64)adev->dma_desc_pool);
> >
> > -     regs =3D ioremap(res.start, resource_size(&res));
> > -     if (!regs) {
> > -             dev_err(&ofdev->dev, "failed to ioremap regs!\n");
> > -             ret =3D -ENOMEM;
> > +     regs =3D devm_platform_ioremap_resource(ofdev, 0);
> > +     if (IS_ERR(regs)) {
> > +             ret =3D PTR_ERR(regs);
> > +             initcode =3D PPC_ADMA_INIT_MEMRES;
> >               goto err_regs_alloc;
> >       }
> >
> > @@ -4121,7 +4102,7 @@ static int ppc440spe_adma_probe(struct platform_d=
evice *ofdev)
> >       if (!chan) {
> >               initcode =3D PPC_ADMA_INIT_CHANNEL;
> >               ret =3D -ENOMEM;
> > -             goto err_chan_alloc;
> > +             goto err_regs_alloc;
> >       }
> >
> >       spin_lock_init(&chan->lock);
> > @@ -4214,19 +4195,12 @@ static int ppc440spe_adma_probe(struct platform=
_device *ofdev)
> >       }
> >  err_page_alloc:
> >       kfree(chan);
> > -err_chan_alloc:
> > -     if (adev->id =3D=3D PPC440SPE_XOR_ID)
> > -             iounmap(adev->xor_reg);
> > -     else
> > -             iounmap(adev->dma_reg);
> >  err_regs_alloc:
> >       dma_free_coherent(&ofdev->dev, adev->pool_size,
> >                         adev->dma_desc_pool_virt,
> >                         adev->dma_desc_pool);
> >  err_dma_alloc:
> >       kfree(adev);
> > -err_adev_alloc:
> > -     release_mem_region(res.start, resource_size(&res));
> >  out:
> >       if (id < PPC440SPE_ADMA_ENGINES_NUM)
> >               ppc440spe_adma_devices[id] =3D initcode;
> > @@ -4240,8 +4214,6 @@ static int ppc440spe_adma_probe(struct platform_d=
evice *ofdev)
> >  static void ppc440spe_adma_remove(struct platform_device *ofdev)
> >  {
> >       struct ppc440spe_adma_device *adev =3D platform_get_drvdata(ofdev=
);
> > -     struct device_node *np =3D ofdev->dev.of_node;
> > -     struct resource res;
> >       struct dma_chan *chan, *_chan;
> >       struct ppc_dma_chan_ref *ref, *_ref;
> >       struct ppc440spe_adma_chan *ppc440spe_chan;
> > @@ -4278,12 +4250,6 @@ static void ppc440spe_adma_remove(struct platfor=
m_device *ofdev)
> >
> >       dma_free_coherent(adev->dev, adev->pool_size,
> >                         adev->dma_desc_pool_virt, adev->dma_desc_pool);
> > -     if (adev->id =3D=3D PPC440SPE_XOR_ID)
> > -             iounmap(adev->xor_reg);
> > -     else
> > -             iounmap(adev->dma_reg);
> > -     of_address_to_resource(np, 0, &res);
> > -     release_mem_region(res.start, resource_size(&res));
> >       kfree(adev);
> >  }
> >
> > --
> > 2.55.0
> >
