Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091AB27FB37
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981521; cv=pass; b=VajgMQ1yOmO9r4F1uRc6g6KXxar3J9cfIcBDByU5blTYV6dVcLCWuDhRUsz/0h7GlOrdAxA7SORp62dq5ephcwIcZblR/ZPnc3K9CbBX4JEME91naf2imbdwvHvtAAFSHeg+Wiwx36Uxl96pfqFS6dX7iiW2pbTjGKoH+MpEJgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981521; c=relaxed/simple;
	bh=7oibe3yf4Od9OHwVEriZj8jSngUfqx45BDj+zMuFzCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jECQ/hFGHClBWrbiJZhO35jrxDcKpPjBgkajUq7rsu44TvgmGIiySI+AheJlr5fPKzisXEtWBTH9NkoBe7td2Mw2uws8dS+bEn4u6soHCU27VocWYo9I24HZ2vTacOQxCbpzDnhqCN3u7oDYg54E3nWSxE8N0+7JVQKLiLDCHWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nearthlab.com; spf=pass smtp.mailfrom=nearthlab.com; dkim=pass (1024-bit key) header.d=nearthlab.com header.i=@nearthlab.com header.b=Zb8DTAaw; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nearthlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nearthlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nearthlab.com header.i=@nearthlab.com header.b="Zb8DTAaw"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c5so2222582b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789981519; cv=none;
        d=google.com; s=arc-20260327;
        b=DW3YXpKBHr8PoZWwmmorPH6UH6iJTbXFvtmbfcHxiFLJ8l82vuBZECAdXExfS4ZA9d
         wpEMQEOImn+Lk2nOs0JFuraJ/TYkG3KoQ4r8ZRMawtU/ysAPAtwgnGJ3EsyuJH106JSP
         T/pT0KN8atZvGVCPsFdODo+b0aHfWsZ5zxXvonN2YOH9AD2+aky+DFBP4crOLBh4FWnO
         yQdZdsVZo/p+pbD6YyiFjIJhYE5SjvdYfH8Qc2RGztC6AYN3zhXgmUUZkUPnh3xCmnig
         e7AD5c/dlOcJNgVJL9wXYzwm68g3eEVfuqlaV0aCaTQWlDu7334bNJxE6IfpxAQB9WNY
         3Z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8X/5deMM6cMfCPfio5kUdEFewo5cSW2r2DWxfpdO5fk=;
        fh=TrnKSf296l3/7tJ17mKV9kClxHHcP3//zy0c3iPnGVQ=;
        b=gDo5CghWg0GMvFH4wCR5wP7wcJoTEAQ91y0Ro5ahF1VfnYua0/Nk38NrXNFngZB+0n
         869BoyOrgCcs1OQs1kQi6kFlgLTc8fgsPiPH8ij76Zu21pA6MK2jC71KjWQYl5CDQqjK
         nDxu87dZKKcyB6TDdi+sHz9t2zBX8dN4zGZZkthUfLqQ9g0dS2YC6bK1ju/olngsMclg
         6Y0Fc4yYvkrxY89aCuP1uhzN8HR5YNXDNmXX4t8XxFF4CF6FkvucirjVYIkahZ83ngmP
         sxYOxtPyBE68kakw8QLaoAlTH//mrKm0quRhzWUNEeIy+EE7nKZaAjPjGmCzZVBvkt0k
         wixA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1789981519; x=1790586319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8X/5deMM6cMfCPfio5kUdEFewo5cSW2r2DWxfpdO5fk=;
        b=Zb8DTAawHfxAOgy76F7O3pu2/UdI1Fp+kpz1oTzphE3zw+/R2a4q3i2ZbExmHNZdk1
         HOd5vk9QEef6x2WR5U/AvxHV+UV/cC4W5JzKZJIRnlCQbLU2e7FCp2sCJpnZ6O1vUnTy
         VOAOQEZ/FkDg6p3s8dDz33bJHQxvx03O91Ny8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981519; x=1790586319;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8X/5deMM6cMfCPfio5kUdEFewo5cSW2r2DWxfpdO5fk=;
        b=cvmJq8yWtDl9bXcGfZouued1So8cW87iGtIDMtYD/YYxPYPoDl8RgwSoVl88Zm+Z7H
         lMj+vxgItkXEC0ZXAn5wU1HxpG3ZACzQ2jfF8V2j6neDsSu3IVp4E0klvesfBqaKC73C
         f/sEXeX11cQEjEvGQF+qa2Awwksk5mmG58THQ+ZP5N2qeIojd2YZhdiEHCpMp9CZrDDD
         jqjuQJKW5WWAsv01Iy+wFVBSviyLd1W2Zn90kksJHm4LSovsFG9oSXUjmFJ0GJvPY5Aj
         nG1qYFB7RCTJy+fYCrX4ZB1KleuagNqi4UGrX9shGb4GQJ7PCLp2M1isBshPSAoLLQMz
         PHiw==
X-Forwarded-Encrypted: i=1; AKwUvBxvLbC6XgyQeRDzUnELzlnK3GhW909Z+RuRklncbWQGGH38SlFPAATqtXApmbw7zUTbS4kzV91RD1otBkY=@vger.kernel.org
X-Gm-Message-State: AFuF++lznRle9Lep35wIYfFTKD5tt97Yoe7lT/2M80yibc8ww5sPjEDV
	D16VyuQYwHOIVUyC442oec6LZHSO1s+RkNqiG0Xsn9aPbnhHKiCGoJQpa2yNtCs5XzxGmmLQVhV
	DrY5GFEJYWwZXFHh3KXtmPCGc8x+97fkffWdn9LxPAA==
X-Gm-Gg: AYBFou26m3RiLS1bYBsPO7Hu4xPkbL5Vcf18ozu2PgIXwqEu2Dbk3epYg5X1wVpCaVP
	uQhpg7U/POe0LLjtfWjuPneULdFURTWdLKcrEGhRp8wAUk0SyoOkozSI9j7SqO5JBfLpZZ4SFM6
	uYeHRcD0x1uTFwZ/yOPLhcbggWVzDYdCQNUOIpZUTZAgZi3jB31UXqJfxvj+05lo2XHWbgmhQtJ
	c+DVRgePEtFO+0gDJ4tDs4P6GsdDQ6XzlSbG1mSHwuBsMeTpZVN7I4XSvl5I0fRSORv+1baWGTA
	wr75XdaBlBbHfghXKnGCudtJB9awYUqzRbt4RzDBxefscuO/gAXef+X3
X-Received: by 2002:aa7:8883:0:b0:84e:d5e6:a085 with SMTP id
 d2e1a72fcca58-874d84a92bemr14325682b3a.0.1789981519125; Mon, 21 Sep 2026
 02:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cxuo3fl9.ffs@fw13> <20260916231029.GA988000@bhelgaas>
In-Reply-To: <20260916231029.GA988000@bhelgaas>
From: =?UTF-8?B?SGFuIC8g7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Date: Mon, 21 Sep 2026 18:05:07 +0900
X-Gm-Features: AcwNN1UY_p08SHSW4zqTzU8BM9IzyWZV-P37VhRnSz8vgq1qfIqIDCSUy-MEUFs
Message-ID: <CAFg7d9bJJjR7JEMXanttGVcGisa4x3uLYPR43Te4+JKMzHBkfQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, jim2101024@gmail.com, florian.fainelli@broadcom.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, bcm-kernel-feedback-list@broadcom.com, robh@kernel.org, 
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

Sorry for the delay in testing this.

I tested Thomas's patch on the same hardware setup with the 5-vector
MSI endpoint. The patch was applied as posted on top of 6.12.93
(rpi-6.12.y).

With the patch applied:

- The MSI base hwirq remained at 0x8 across 200 driver reload cycles.
- The driver got all 5 requested vectors on every cycle, with no
single-MSI fallback. Multiple Message Enable remained at 8.
- The brcmstb inner-domain mapping returned to baseline after each
unload/reload, with 12 mapped while the driver was loaded and 4 after
unload.
- A kprobe showed one allocation of 8 vectors followed by eight
single-vector frees, with nothing left over.

The MSI vector exhaustion issue I originally observed no longer
reproduces with the patch.

I also observed a KASAN report with managed affinity. Using a small
out-of-tree test module bound to the same endpoint and requesting 1..3
vectors with PCI_IRQ_MSI | PCI_IRQ_AFFINITY, a request for 3 vectors
resulted in:

BUG: KASAN: slab-out-of-bounds in __irq_alloc_descs+0x158/0x460

Requests for 5 and 7 vectors were capped to 4 on this 4-CPU system and
did not trigger the report. I have not checked this against the
unpatched kernel yet, so I cannot tell whether it is related to the
patch.

Best regards,
Sangwoo


2026=EB=85=84 9=EC=9B=94 17=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 8:10, B=
jorn Helgaas <helgaas@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Sep 07, 2026 at 11:40:34PM +0200, Thomas Gleixner wrote:
> > On Mon, Sep 07 2026 at 11:34, Bjorn Helgaas wrote:
> > > [+cc Thomas, Inochi for MSI expertise]
> > >
> > > I want to revive this thread because I think there's a real problem
> > > here, and we should solve it for all the PCI controller drivers.
> > >
> > > There's nothing brcm-specific about the bitmap alloc/free except the
> > > size of the msi->used bitmap, so I don't want to copy/paste this sort
> > > of fix in all the affected drivers.
> > >
> > > I'd also like to avoid the extra align_mask and
> > > bitmap_find_next_zero_area() followed by manual bitmap_set().
> > > bitmap_find_free_region() already takes care of the alignment and
> > > setting the allocated bits.
> > >
> > > The MSI Multiple Message Enable situation of enabling more vectors in
> > > the device than the driver wants is generic to all devices that
> > > advertise Multiple Message Capable, and I don't think we should have
> > > to deal with this in every host controller driver.
> >
> > Correct.
> >
> > > If a driver requests 3 vectors, we have to enable 4 because MSI only
> > > supports power-of-two number of vectors.  This tells the device it is
> > > allowed to use all 4 vectors, and I think the PCI MSI core should
> > > assume they all *will* be used instead of relying on the driver's
> > > claim that it will only use 3.
> >
> > That's not really a good idea because e.g. the irq affinity stuff relie=
s
> > on the accurate number of interrupts the driver requested with the
> > minvec/maxvec range. We can't magically spread more interrupts than the
> > driver is able/willing to handle.
> >
> > But we can fix that without changing the consumer side (device drivers)
> > visible behaviour and handle it solely in the core code.
> >
> >  1) MSI interrupts are special because they have msi_desc::nvec_used >
> >     1, so the allocation and the free path can take care of the power o=
f
> >     two requirement. That just allocates more resources than the driver
> >     wants but they are just memory.
> >
> >  2) All MSI parent domain implementations should be able to handle
> >     domain_ops::free() with nr_irqs > 1. That's something which can be
> >     trivialy audited.
> >
> >     I really have no memories why the bulk remove function iterates the
> >     interrupts one by one instead of doing in one go, but this is also
> >     used by non MSI domains, which might have issues with a bulk remove=
.
> >
> >     If we establish that all MSI parent domain implementations can
> >     handle the free() callback with nr_irqs > 1, then
> >     irq_domain_free_irqs_hierarchy can check whether
> >     IRQ_DOMAIN_FLAG_MSI_PARENT is set in the domain_flags and avoid the
> >     loop for that case.
> >
> > Something like the completely untested below.
>
> Sangwoo, is there any chance you can test this and see whether it
> fixes the issue?
>
> If it does, I guess we'll have to ask Thomas to post it with the
> appropriate Signed-off-by, etc.
>
> > ---
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index 4fdcb6df5306..b3f6cc6ae2ce 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -1611,6 +1611,13 @@ static void irq_domain_free_irqs_hierarchy(struc=
t irq_domain *domain,
> >       if (!domain->ops->free)
> >               return;
> >
> > +     /* CHECKME: Are all MSI parent domains capable ? */
> > +     if (domain->flags & IRQ_DOMAIN_FLAG_MSI_PARENT) {
> > +             if (irq_domain_get_irq_data(domain, irq_base))
> > +                     domain->ops->free(domain, irq_base, nr_irqs);
> > +             return;
> > +     }
> > +
> >       for (i =3D 0; i < nr_irqs; i++) {
> >               if (irq_domain_get_irq_data(domain, irq_base + i))
> >                       domain->ops->free(domain, irq_base + i, 1);
> > diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> > index fb5f372215bf..2835b09899ea 100644
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -1333,20 +1333,28 @@ static int __msi_domain_alloc_irqs(struct devic=
e *dev, struct irq_domain *domain
> >
> >               ops->set_desc(&arg, desc);
> >
> > -             virq =3D __irq_domain_alloc_irqs(domain, -1, desc->nvec_u=
sed,
> > +             /* Make sure a MULTI-MSI allocation is power of two */
> > +             unsigned int nvec_aligned =3D roundup_pow_of_two(desc->nv=
ec_used);
> > +
> > +             virq =3D __irq_domain_alloc_irqs(domain, -1, nvec_aligned=
,
> >                                              dev_to_node(dev), &arg, fa=
lse,
> >                                              desc->affinity);
> >               if (virq < 0)
> >                       return msi_handle_pci_fail(domain, desc, allocate=
d);
> >
> > -             for (i =3D 0; i < desc->nvec_used; i++) {
> > +             for (i =3D 0; i < nvec_aligned; i++) {
> >                       irq_set_msi_desc_off(virq, i, desc);
> >                       irq_debugfs_copy_devname(virq + i, dev);
> >                       ret =3D msi_init_virq(domain, virq + i, vflags);
> >                       if (ret)
> >                               return ret;
> >               }
> > +
> >               if (info->flags & MSI_FLAG_DEV_SYSFS) {
> > +                     /*
> > +                      * This only exposes desc->nvec_used and ignores =
the
> > +                      * overallocated MULTI-MSI ones.
> > +                      */
> >                       ret =3D msi_sysfs_populate_desc(dev, desc);
> >                       if (ret)
> >                               return ret;
> > @@ -1610,13 +1618,15 @@ static void __msi_domain_free_irqs(struct devic=
e *dev, struct irq_domain *domain
> >                       continue;
> >
> >               /* Make sure all interrupts are deactivated */
> > -             for (i =3D 0; i < desc->nvec_used; i++) {
> > +             unsigned int nvec_aligned =3D roundup_pow_of_two(desc->nv=
ec_used);
> > +
> > +             for (i =3D 0; i < nvec_aligned; i++) {
> >                       irqd =3D irq_domain_get_irq_data(domain, desc->ir=
q + i);
> >                       if (irqd && irqd_is_activated(irqd))
> >                               irq_domain_deactivate_irq(irqd);
> >               }
> >
> > -             irq_domain_free_irqs(desc->irq, desc->nvec_used);
> > +             irq_domain_free_irqs(desc->irq, nvec_aligned);
> >               if (info->flags & MSI_FLAG_DEV_SYSFS)
> >                       msi_sysfs_remove_desc(dev, desc);
> >               desc->irq =3D 0;
