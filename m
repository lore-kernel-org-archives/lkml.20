Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F52282F34
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690629; cv=pass; b=H4gYEWWWgRmSZjiZG2egcnOI8hC5YGZqy8OBjJXvsHtoCz+XBvjY/LYhZ9azk/kSCvmXGdNQWOyveegcC/sx6cGjMkRgq6JjB6FZEKU2HFYksVPqWkzIIG1Eg4RssJmgmzz2p2PN0v2wbdncy2QuiiNz0Rq+rd3S8Jy+2+kBLGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690629; c=relaxed/simple;
	bh=iPmYogC2cUlzk8Ru2DegBseBVmJiBiFq8NEyI/Hn6EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELeT23tfWoFHy7ylPPLY0elxYj+k21Ay0Wo6Z7O244OSMm+mb7I47qtft4+us19rYVTyTrcyvPFtoLs+iolYbYZtqwt04j1qpTv1sPvIHb234Ow55i+BbYuCJPh13tp7hn1g8u/wxvg4zJx2YZqYfs6pc4DVY1l2/o+O9NnmLnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldnNMzjl; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldnNMzjl"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso259830a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789690619; cv=none;
        d=google.com; s=arc-20260327;
        b=I+gDndEbuy2Fku1uezojuwfLShfDlZwT3bOyHsSXI55wcwGAzllo3B0aySgOgL8Jly
         UsE/bx45yctpbg/1ELdAiSv2FTUw+pamYImYy0D8Y7rYWn2ea1kw3WSmCBje/dyV7CpS
         Wueylle6P4fQ6NwZiqq+ZKYrVSJKTGDix8nZAeQ50JyFGSRJdc7BgIK9S+Bfz68WHYQm
         +bBd/m8a3xcRZjZIPf38F13NpFUr0s6z0L763MygSM/25OyjbjtZh4f3YLGyOFvhB/u+
         yRe+tL1rt3nqhRFR8glb3Flr4gIWADbLvK3zzSCrPr/VZ/cuzGqRLJGriAK47bSOAQ91
         ATag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThLt5oXN6ToF4YKkt6FpXYxeDHP+cqmJLsZgthH2NCI=;
        fh=2w8/pNYENnBt9ZTNy3fVUMMxAfgO7XtDFvlTEu5Z2sg=;
        b=b6AMTlWf7610Nvy0iF3jiSMYsD8HdNbEtW12dMv1UiGFajfLil7tEEcALxVPjteBTT
         96VYHk0ZH5Cau0uP/UBiyt+5PBNNgrZqrKt6C9H1h02wMeAvw+kFeqTksG2i7uOndgLf
         6mFRO/FudTKc4k9ud6qr26XIw76pzXBw6UVf0aVg3OAQJWk4Ui9lQJRO6AZFsOd9xbeP
         0yc/bkddPbheKd2OOd9HOyZiqiM5eivpb8W6dqCek+fmp8UNMqEZLsggD74ltYl4y0wi
         oihabMAD7vNaQOhQ8cMwAMD0XIBcHITI5WMB0m7PLCBNvMi0jVhksDlXWFe0baDU+zE7
         t7rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789690619; x=1790295419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThLt5oXN6ToF4YKkt6FpXYxeDHP+cqmJLsZgthH2NCI=;
        b=ldnNMzjlGXKFlynLYDbAT/9gprv5e867VZGHhov2dMqDI2Cs99ssr+6f85+AYV6pbd
         b9imISbvZmVrdP0IqZUIMAhT9q5vAUa4gJguGZllex7atfqA3RZUZrlvlKQbhlu0tpIB
         dRCU52QuiSlsd+taWTOMHjOmbqECxH7cW1WEnpMzxSpjdMvuA/52mQKs9Wa57keeduXl
         emSEDkTLj8O7ETUR6kMc76qehvsbuevuj/RkcGivkH+CpRUj/E6RwsT1rwbMfD5B1EjE
         IP2+8YRauOnXIn7FNUqutTwdZXJl9B2JDUIYCBSWi6kH6EecsYUhSK7AaG4q/ws6WfY3
         QIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690619; x=1790295419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThLt5oXN6ToF4YKkt6FpXYxeDHP+cqmJLsZgthH2NCI=;
        b=Lr+gKvoE/84ME6BuLuFp1oJDF5Z/dtlh0qHAsHxYqFSOA00Cwij8+9i0F4vNqGb5hg
         Oe3qj5GIVGrUtipWtNf8D3+LXBPoQ4pkJfkatzZJyuCdUPSetkgAhXOY/qQZZ4d4tX+l
         J14VIT0IpMS3rzJXs2YIP2E0x8rUBYwsPdHhGn9KBf4j15ha7oDaJsyS8NdOf8sEGCFi
         Rtm6t6g+jTWs74v3lD7ju4d22wMA02gpSbiyxyAHCNSlQAtL+8JnwBEtvaDto6aynQWf
         mcTli4+XESOIgBjWw12/AXTdttSdAdt4mEIdmlxangPUgLJftB9J2cGV9yZ2V8X1uKLk
         SYzg==
X-Forwarded-Encrypted: i=1; AKwUvBx7F2w5GXtBxXEBeeL5Dy1+lChfbX8VrA1al/Fcgtphq098V2pXca6AFny2g/rJH1wH1jhz7vsVw2Z0kaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nWqNExW6Us4J+qyZYlL4hlmBUaHhTtEE+KhduH1HphAmDMizU2
	NBudiTPHTqsDRE+By0A2muzAIqFT+QAHFa9TtBBa1ojYZKUDP9vb9Hp2Zg3c31P9NoPePkI8PVc
	pZvCVaFoM6syGkKI0zFeuGny7Rs5+Co4=
X-Gm-Gg: AYBFou3vMRu67oUHCQn8D6XrfJwHt4ww4p0v2NjcuXjbvGUivJCoMT16EQdYxAstPfb
	D8ekJck6PxS/3fWDjcTpkVut8X7QJ1+ek7SJxwGhnBCp/zeJ3Q4GONntiWPTfj7O8SLauCDNmkd
	kPglwB2Yk8fTPDYOueJPJlDNTFK7EUaBzhqqmCcxCmQpGXajfVSpNW3qJnY0Ye1uLYXQr4FVS27
	MetLKgMaHCDtQ36mem94M1rWFnPwvvmpn5FK2/ONLt2lM4kzzPpMUORH7J9qwhnt3D0VrYf8YWu
	ww1VMxRS4jgXVsW0QfczlRmCb/5xrD09u8aSN9dsDxA7yDYi3/vMbKGfrX6VxIRSYZS8ZwwymJV
	lZghbm4QCjniEh9/sFmSDqG7/y7JQu6e1OijYb+dDHOnG2JXpiKT2ydhjkxn+4lB3spk6RHDmnS
	5UrXrsQTO3iThi9c3AfUJZgumsjvnmEDXHfTIlFMxa4UAie4+4Z2PfIOmHKCO6P+EzGg==
X-Received: by 2002:a17:907:3e0f:b0:c27:420b:7c90 with SMTP id
 a640c23a62f3a-c2a1588651fmr79357066b.48.1789690618982; Thu, 17 Sep 2026
 17:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916224156.276511-1-rosenp@gmail.com> <aqtdmOzJSIawqKQq@SMW015318>
In-Reply-To: <aqtdmOzJSIawqKQq@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 17:16:47 -0700
X-Gm-Features: AcwNN1WrOby4AFhx7As-4Zrve5ehCpdMlOHPijGBhqbyP_ojiIATGZuFFmx1ZbY
Message-ID: <CAKxU2N-gitgedS9ZJQ7wNV9Dma9PUwM+0NMY5yfVk2PvXOYASQ@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: bestcomm: use platform machinery to get irq
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>, 
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 8:25=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 03:41:56PM -0700, Rosen Penev wrote:
> > platform_get_irq() avoids having to explicitly map and dispose of an ir=
q
> > by having the platform_device machinery take care of it.
> >
> > This requires replacing the device_node with a platform_device in the
> > bcom_eng struct so that platform_get_irq() can use it.
> >
> > Conveniently, this also allows getting rid of of_node_get and
> > of_node_put as the platform_device machinery also handles that.
> >
> > Replace the open-coded resource lookup, request_mem_region, ioremap and
> > the manual iounmap/release_mem_region cleanup in probe/remove with the
> > managed devm_platform_get_and_ioremap_resource() helper. This removes t=
he
>
> update commit message, no devm_platform_get_and_ioremap_resource() in pat=
ch.
>
> > now-unused error-unmap/release paths and simplifies the driver.
> >
> > Adjust the goto labels in bcom_task_alloc to match what is being freed.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: resend.
>
> If resend, don't pump version.
>
> Frank
> >  drivers/dma/bestcomm/bestcomm.c            | 47 ++++++++--------------
> >  include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
> >  2 files changed, 18 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bes=
tcomm.c
> > index 241a91936fe8..1006030ff167 100644
> > --- a/drivers/dma/bestcomm/bestcomm.c
> > +++ b/drivers/dma/bestcomm/bestcomm.c
> > @@ -47,6 +47,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_s=
ize)
> >  {
> >       int i, tasknum =3D -1;
> >       struct bcom_task *tsk;
> > +     int irq;
> >
> >       /* Don't try to do anything if bestcomm init failed */
> >       if (!bcom_eng)
> > @@ -67,30 +68,32 @@ bcom_task_alloc(int bd_count, int bd_size, int priv=
_size)
> >       if (tasknum < 0)
> >               return NULL;
> >
> > +     irq =3D platform_get_irq(bcom_eng->pdev, tasknum);
> > +     if (irq < 0)
> > +             goto err1;
> > +
> >       /* Allocate our structure */
> >       tsk =3D kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL)=
;
> >       if (!tsk)
> > -             goto error;
> > +             goto err1;
> >
> >       tsk->tasknum =3D tasknum;
> >       if (priv_size)
> >               tsk->priv =3D (void*)tsk + sizeof(struct bcom_task);
> >
> >       /* Get IRQ of that task */
> > -     tsk->irq =3D irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum)=
;
> > -     if (!tsk->irq)
> > -             goto error;
> > +     tsk->irq =3D irq;
> >
> >       /* Init the BDs, if needed */
> >       if (bd_count) {
> >               tsk->cookie =3D kmalloc_array(bd_count, sizeof(void *),
> >                                           GFP_KERNEL);
> >               if (!tsk->cookie)
> > -                     goto error;
> > +                     goto err2;
> >
> >               tsk->bd =3D bcom_sram_alloc(bd_count * bd_size, 4, &tsk->=
bd_pa);
> >               if (!tsk->bd)
> > -                     goto error;
> > +                     goto err3;
> >               memset_io(tsk->bd, 0x00, bd_count * bd_size);
> >
> >               tsk->num_bd =3D bd_count;
> > @@ -99,17 +102,12 @@ bcom_task_alloc(int bd_count, int bd_size, int pri=
v_size)
> >
> >       return tsk;
> >
> > -error:
> > -     if (tsk) {
> > -             if (tsk->irq)
> > -                     irq_dispose_mapping(tsk->irq);
> > -             bcom_sram_free(tsk->bd);
> > -             kfree(tsk->cookie);
> > -             kfree(tsk);
> > -     }
> > -
> > +err3:
> > +     kfree(tsk->cookie);
> > +err2:
> > +     kfree(tsk);
> > +err1:
> >       bcom_eng->tdt[tasknum].stop =3D 0;
> > -
>
> avoid unnecesary change.
There's nothing unnecessary about this. irq_dispose_mapping goes away.
bcom_sram_free is a mistake here. It's not reachable after
bcom_sram_alloc. This is much clearer to look at.

Moving bcom_sram_free removal to its own commit is pointless churn.
>
> >       return NULL;
> >  }
> >  EXPORT_SYMBOL_GPL(bcom_task_alloc);
> > @@ -125,7 +123,6 @@ bcom_task_free(struct bcom_task *tsk)
> >       bcom_eng->tdt[tsk->tasknum].stop  =3D 0;
> >
> >       /* Free everything */
> > -     irq_dispose_mapping(tsk->irq);
> >       bcom_sram_free(tsk->bd);
> >       kfree(tsk->cookie);
> >       kfree(tsk);
> > @@ -377,16 +374,12 @@ static int mpc52xx_bcom_probe(struct platform_dev=
ice *op)
> >       if (IS_ERR(regs))
> >               return PTR_ERR(regs);
> >
> > -     /* Get the bestcomm node */
> > -     of_node_get(op->dev.of_node);
> > -
> >       /* Prepare SRAM */
> >       ofn_sram =3D of_find_matching_node(NULL, mpc52xx_sram_ids);
> >       if (!ofn_sram) {
> >               printk(KERN_ERR DRIVER_NAME ": "
> >                       "No SRAM found in device tree\n");
> > -             rv =3D -ENODEV;
> > -             goto error_ofput;
> > +             return -ENODEV;
> >       }
> >       rv =3D bcom_sram_init(ofn_sram, DRIVER_NAME);
> >       of_node_put(ofn_sram);
> > @@ -394,7 +387,7 @@ static int mpc52xx_bcom_probe(struct platform_devic=
e *op)
> >       if (rv) {
> >               printk(KERN_ERR DRIVER_NAME ": "
> >                       "Error in SRAM init\n");
> > -             goto error_ofput;
> > +             return rv;
> >       }
> >
> >       /* Get a clean struct */
> > @@ -405,8 +398,7 @@ static int mpc52xx_bcom_probe(struct platform_devic=
e *op)
> >       }
> >
> >       /* Save the node */
> > -     bcom_eng->ofnode =3D op->dev.of_node;
> > -
> > +     bcom_eng->pdev =3D op;
> >       bcom_eng->regs =3D regs;
> >       bcom_eng->regs_base =3D res_bcom->start;
> >
> > @@ -426,8 +418,6 @@ static int mpc52xx_bcom_probe(struct platform_devic=
e *op)
> >       kfree(bcom_eng);
> >       bcom_eng =3D NULL;
> >       bcom_sram_cleanup();
> > -error_ofput:
> > -     of_node_put(op->dev.of_node);
> >
> >       printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
> >
> > @@ -443,9 +433,6 @@ static void mpc52xx_bcom_remove(struct platform_dev=
ice *op)
> >       /* Cleanup SRAM */
> >       bcom_sram_cleanup();
> >
> > -     /* Release the node */
> > -     of_node_put(bcom_eng->ofnode);
> > -
> >       /* Release memory */
> >       kfree(bcom_eng);
> >       bcom_eng =3D NULL;
> > diff --git a/include/linux/fsl/bestcomm/bestcomm_priv.h b/include/linux=
/fsl/bestcomm/bestcomm_priv.h
> > index 3b52f3ffbdf8..cddde7c74cb5 100644
> > --- a/include/linux/fsl/bestcomm/bestcomm_priv.h
> > +++ b/include/linux/fsl/bestcomm/bestcomm_priv.h
> > @@ -66,7 +66,7 @@ struct bcom_tdt {
> >   * This holds all info needed globaly to handle the engine
> >   */
> >  struct bcom_engine {
> > -     struct device_node              *ofnode;
> > +     struct platform_device          *pdev;
> >       struct mpc52xx_sdma __iomem     *regs;
> >       phys_addr_t                      regs_base;
> >
> > --
> > 2.55.0
> >
