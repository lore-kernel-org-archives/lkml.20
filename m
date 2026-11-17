Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794883202;
	b=sJbSIEBjAnZH7Eri+Y7e6kh45sT3uxNK1/NTAvyGnpTJH+0ub2zvC3g5xoR9n1INic9R
	 AHoj7u8z+KB+T5BHdGzizPAz6zw3ZnOkpRy1VKGwWcJtVxuMtAkvHOSxie+xiFxURiVGF
	 l+JzBmzcJOgkfU9lvHVA5TDr1p2DWcd2IJatO1kuVfmh5JdolygDjjvhcnhwuxep7p/jQ
	 B0MVemQsKKQwXFwMC1aey+BmW/5bwsK31wwPLMTunFdiOMUqBbNqH5JL1+xEc/CM6rOo5
	 +1fnSr6nLGJNY6rKl+ytoTZOIg0j5/0MLNLbFFeLfrx1qIod7Tg9yq8aAsY4FsvI6cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LMBbatKuFXiOiiKhIDdtLoJOCz6eVaYMtmr54QH3Bd4=;
	b=Mo0vjL5DuNUDd3DmCURKX0IFqLad60T4r/ZebP+UDixuqHV7OHBd8N1xQ+sUMRN4ejJl
	 FcMKGRtSLoaHrqAShS7/jr7bYapqJ7nGsS6dEoySIgYBkwMSzxYr5pjqzDgiN1/MnU4dJ
	 J7QjtoIUmkCftQwBWmPJqsfrJi+q6upQxYq65rRP162GXhsyK7vFL8F39hef2vvDZAW2n
	 YODN2Scm16124KSxulBZhjhzOzOmVpYIf7oSJCekdPFWiTvI5vr/G7Zs2rv3F7kxrjML6
	 FLeI0pYPP3cawkUvGc6MLXV0J9nVnJn+T5UHJ4G1WW/y4ys+RGhnoj9bGGdQGurYNFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nearthlab.com;
	spf=pass smtp.mailfrom=nearthlab.com;
	dkim=pass header.d=nearthlab.com header.i=@nearthlab.com header.a=rsa-sha256 header.s=google header.b=HhBujmfA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261B606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D261B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nearthlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nearthlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nearthlab.com header.i=@nearthlab.com header.a=rsa-sha256 header.s=google header.b=HhBujmfA
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e946155442so43407985ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794883201; cv=none;
        d=google.com; s=arc-20260327;
        b=Hhy53pXSVgWYXSLHoxwlaHMTwea6DUcPN/fTgsW2M4Vt/3aevS5q9qEIwaew4kXQkY
         JnAYgCbUbS6Vgayyg9tpNysNfCkw1A/TuFZM7izdKXSuIoKX/F+XIsog5y6UfT/LssdZ
         6XPHQZidKxza3BC3BLudL5CR2AqsmKsL1wKFqT3Rzb9Ud/zziosUqFFt7OLbPXOMZFVB
         fDE71TJ1s5Sh+xWiDO2MGadid8Y9aZbxUQgSbVy5mJ2BeFtREU2XijPOOQGFdUpgO6jk
         Cr6XKJWXpUW6ChVI6ncYNUSO2o8XcAG0SzcZgf5eHxgp7lBpr+OywqftRPfBGQ+8RvbV
         +VPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LMBbatKuFXiOiiKhIDdtLoJOCz6eVaYMtmr54QH3Bd4=;
        fh=UTwryLbL8ORuSalvI7kWuLwsEabr1jfeokya3Cmq6mo=;
        b=fuwQv0dTkveR6UdMpyzCqe8Zvi5UaOxsoMByG8guZTe5hi1Raa6wIFH94jr30tF/+I
         N2KM3dcCy/lX39d+Vz1qaqhePZq4d2TNZbR1O4U3tU6grnbmCzOXdqMg0XNiDsx4nDYp
         S1sm2I7HcHrVQsrHtGD5QA67o4HodlCGowt30bnAfIBaKZVYbVoe2I2b/Yk2pYbwlwuf
         9f8F/AGP47c4O+0mbIv0/uqRK6bqAJOh96dd2nWKQiZH+z6szm/1hJUSc/P7Z6J23fAc
         UFBb+2PweGvW2dhi4bxGvW0tPTwHLVDdgFrtHfNbgTZUPhhh47DP47yqbDrunOS2MUe0
         ZDTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1794883201; x=1795488001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LMBbatKuFXiOiiKhIDdtLoJOCz6eVaYMtmr54QH3Bd4=;
        b=HhBujmfAkwMRQPr6nu+rDwFTlb3C2lDsC/PbkZ5x6Q3r4SpH9XihfhnQ5o8GQ892RZ
         v7SFk6yn3bgqLWfPyrNLQ79zSSszAiVMB21uZchlwagfq4i695kp0G+OfR8WD9p7Yy97
         t6h4iwTQ3XHOser8e5nWrEyOEPQcxsktVq/ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883201; x=1795488001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMBbatKuFXiOiiKhIDdtLoJOCz6eVaYMtmr54QH3Bd4=;
        b=tt4G/HO2TtevqXd2M37zzfT0isRFo0qdOnMjzqb+R5bY33IvjwoTwST7xGwZq+l8sv
         3SMG+sIwVlDqCqtYtHLZTtoFsAjFfa8h/y2LmKK/Zt15CbuiSDEHUyVlapv9DRM8wBL+
         nFcFhIkkf8lffk1BdA92Qi88bqmzuiBjJNVnnpEG61Gru317JUtNxMDT9gZfES7p5Xic
         m1H4m+Sk4fg/3k8fQYVf5OLjdiedI6ZUGS3X3GbWMHfpEx+YnJWRhiyYQYYFVJZjesQx
         v3a7u8NKTGQPG0I94Ol7nnaPnc5nQ3K+2SzQN2zm9D9TXKikiefyFmp1XwZPcrqmMY9x
         cIvw==
X-Forwarded-Encrypted: i=1; AL+hErFm949KBphKf0ULSAQenjwg9aS4Fj4kiHBZCxc6zoHIjblOXPrkF7EwFGc21sxUKbH08xPp4k2Ql64tOPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MuifbTXMQd9jtZVWevxhmx6mF6Dp+Gj7ND2oMDx/986BViBOr
	XiAzs9ib5tqWhiqrxcQ/vnQ6Ou3AVwvyy+SlihVLGZz9QQKPZ8GDgMNcvfAYAbHJquClju31CVR
	+nQcqnt1EjaFTybPOrKXOgqnfW5U8/yP9ktq26xe8CQ==
X-Gm-Gg: AZFdTZdNv9izUrHcEbKQ+pgnDIXs8mF9mojleBL8hi/+7lTk1TGMh2tDyt6v2xoBnJN
	XKt35VpU5r1SMwpbUKdoPQPiAy5gRgbi2kF5AIlrAfpUuB62s4YnacwjRjl1aY1nOk5xiS+oQyo
	FNPQN3FcraYQKBdUk+K4A5EvAlqIibXbzsFEDl8CiBOaDW4rL2zqJ2o+yj2hK7nTKDXWLNY9fsS
	CNqCkERw3Jcat0C+k9fosVpnVH73AdaHxQbDLZlxiX6BZFLQMVEvjxqziNcK48E4OLVBAS9LVG7
	izCIv/3n3fFwN9CCGzM5+5NXfZa+yx6Zb65PoKGMT35D6NBrqm2gpUKtsSPopty8OCeHlD7pC0X
	73XsucxImw8llgOIquNtEskV9wu3ixNrM86xCHQ==
X-Received: by 2002:a17:902:c942:b0:2dd:b795:9cb6 with SMTP id
 d9443c01a7336-2ee0daa43eamr121018955ad.21.1794883201054; Mon, 16 Nov 2026
 18:40:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFg7d9becn9_=ZzNwQ7bSBBNid28t_RnofL-Vb1cZVHVHxS9fw@mail.gmail.com>
 <20261013160612.GA1522005@bhelgaas> <CAFg7d9a2p2jtGyThS1M=2ZFDX0y5rpSK3H34ZuTz09R5r_ff0A@mail.gmail.com>
 <87h5i3xael.ffs@fw13> <87fqxbwla2.ffs@fw13>
In-Reply-To: <87fqxbwla2.ffs@fw13>
From: =?UTF-8?B?SGFuIC8g7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Date: Tue, 17 Nov 2026 11:39:49 +0900
X-Gm-Features: AclHuK_Q986uTw7GVWmW0pPbL64Jb6Aqx4x9deC_Y4lkDrtjuDN2ErRNHLdvq1g
Message-ID: <CAFg7d9bXZEy78HqxyJ9J103FvRZLQ_jyDWUimDrHfEAQtNWDfw@mail.gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
To: Thomas Gleixner <tglx@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, jim2101024@gmail.com, florian.fainelli@broadcom.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, bcm-kernel-feedback-list@broadcom.com, robh@kernel.org, 
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you for the updated patch.

I will test it on the BCM2712 with the same setup as before and report
back within November.

Thanks,
Sangwoo

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 9:38, T=
homas Gleixner <tglx@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Oct 30 2026 at 20:20, Thomas Gleixner wrote:
> > On Fri, Oct 30 2026 at 21:59, Han wrote:
> >> On Thu, Oct 01 2026 at 21:29, Thomas Gleixner wrote:
> >>   The buggy address is located 0 bytes to the right of
> >>    allocated 48-byte region [ffff8000053a6880, ffff8000053a68b0)
> >>
> >> The report is caused by the patch. __msi_domain_alloc_irqs() passes
> >> nvec_aligned (4) to __irq_domain_alloc_irqs() together with
> >> desc->affinity, which has only nvec_used (3) entries. alloc_descs()
> >> then reads all 4 entries. The fourth entry is read past the end of
> >> the array. If the data there has no CPU set, the allocation fails
> >> with -ENOSPC. Without PCI_IRQ_AFFINITY, desc->affinity is NULL, so
> >> this read does not happen.
> >
> > Ah. I missed that detail. I'll look at it on Monday.
>
> The updated patch below should handle that situation too.
>
> Thanks,
>
>         tglx
> ---
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -421,7 +421,7 @@ int devm_platform_get_irqs_affinity(stru
>                 ptr->irq[i] =3D irq;
>         }
>
> -       desc =3D irq_create_affinity_masks(nvec, affd);
> +       desc =3D irq_create_affinity_masks(nvec, nvec, affd);
>         if (!desc) {
>                 ret =3D -ENOMEM;
>                 goto err_free_devres;
> --- a/drivers/pci/msi/api.c
> +++ b/drivers/pci/msi/api.c
> @@ -286,7 +286,7 @@ int pci_alloc_irq_vectors_affinity(struc
>                          * for the single interrupt case.
>                          */
>                         if (affd)
> -                               irq_create_affinity_masks(1, affd);
> +                               irq_create_affinity_masks(1, 1, affd);
>                         pci_intx(dev, 1);
>                         return 1;
>                 }
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -414,8 +414,14 @@ static int msi_capability_init(struct pc
>          */
>         pci_msi_set_enable(dev, 0);
>
> +       /*
> +        * Make sure a MULTI-MSI allocation is power of two even if the
> +        * requested number of vectors (@nvec) is not.
> +        */
> +       unsigned int nvec_aligned =3D roundup_pow_of_two(nvec);
> +
>         struct irq_affinity_desc *masks __free(kfree) =3D
> -               affd ? irq_create_affinity_masks(nvec, affd) : NULL;
> +               affd ? irq_create_affinity_masks(nvec, nvec_aligned, affd=
) : NULL;
>
>         guard(msi_descs_lock)(&dev->dev);
>         return __msi_capability_init(dev, nvec, masks);
> @@ -704,7 +710,7 @@ static int msix_setup_interrupts(struct
>                                  int nvec, struct irq_affinity *affd)
>  {
>         struct irq_affinity_desc *masks __free(kfree) =3D
> -               affd ? irq_create_affinity_masks(nvec, affd) : NULL;
> +               affd ? irq_create_affinity_masks(nvec, nvec, affd) : NULL=
;
>
>         guard(msi_descs_lock)(&dev->dev);
>         return __msix_setup_interrupts(dev, entries, nvec, masks);
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -370,7 +370,7 @@ extern int
>  irq_set_affinity_notifier(unsigned int irq, struct irq_affinity_notify *=
notify);
>
>  struct irq_affinity_desc *
> -irq_create_affinity_masks(unsigned int nvec, struct irq_affinity *affd);
> +irq_create_affinity_masks(unsigned int nvec, unsigned int totvec, struct=
 irq_affinity *affd);
>
>  unsigned int irq_calc_affinity_vectors(unsigned int minvec, unsigned int=
 maxvec,
>                                        const struct irq_affinity *affd);
> @@ -425,7 +425,7 @@ irq_set_affinity_notifier(unsigned int i
>  }
>
>  static inline struct irq_affinity_desc *
> -irq_create_affinity_masks(unsigned int nvec, struct irq_affinity *affd)
> +irq_create_affinity_masks(unsigned int nvec, unsigned int totvec, struct=
 irq_affinity *affd)
>  {
>         return NULL;
>  }
> --- a/kernel/irq/affinity.c
> +++ b/kernel/irq/affinity.c
> @@ -17,13 +17,17 @@ static void default_calc_sets(struct irq
>
>  /**
>   * irq_create_affinity_masks - Create affinity masks for multiqueue spre=
ading
> - * @nvecs:     The total number of vectors
> + * @nvecs:     The number of active vectors for which affinity spreading=
 is required
> + * @totvecs:   The total number of required descriptors to handle the ov=
er
> + *             allocation for PCI/MSI which requires power of two even i=
f @nvec is
> + *             not power of two. The extra descriptors are filled with d=
efault
> + *             affinity and not relevant for the spreading calcuations.
>   * @affd:      Description of the affinity requirements
>   *
>   * Returns the irq_affinity_desc pointer or NULL if allocation failed.
>   */
>  struct irq_affinity_desc *
> -irq_create_affinity_masks(unsigned int nvecs, struct irq_affinity *affd)
> +irq_create_affinity_masks(unsigned int nvecs, unsigned int totvecs, stru=
ct irq_affinity *affd)
>  {
>         unsigned int affvecs, curvec, usedvecs, i;
>         struct irq_affinity_desc *masks =3D NULL;
> @@ -56,7 +60,7 @@ irq_create_affinity_masks(unsigned int n
>         if (!affvecs)
>                 return NULL;
>
> -       masks =3D kzalloc_objs(*masks, nvecs);
> +       masks =3D kzalloc_objs(*masks, totvecs);
>         if (!masks)
>                 return NULL;
>
> @@ -90,7 +94,7 @@ irq_create_affinity_masks(unsigned int n
>                 curvec =3D affd->pre_vectors + affvecs;
>         else
>                 curvec =3D affd->pre_vectors + usedvecs;
> -       for (; curvec < nvecs; curvec++)
> +       for (; curvec < totvecs; curvec++)
>                 cpumask_copy(&masks[curvec].mask, irq_default_affinity);
>
>         /* Mark the managed interrupts */
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1611,6 +1611,17 @@ static void irq_domain_free_irqs_hierarc
>         if (!domain->ops->free)
>                 return;
>
> +       /*
> +        * MSI device domains are capable of bulk free.
> +        *
> +        * CHECKME: Are all MSI parent domains capable?
> +        */
> +       if (domain->flags & (IRQ_DOMAIN_FLAG_MSI_DEVICE | IRQ_DOMAIN_FLAG=
_MSI_PARENT)) {
> +               if (irq_domain_get_irq_data(domain, irq_base))
> +                       domain->ops->free(domain, irq_base, nr_irqs);
> +               return;
> +       }
> +
>         for (i =3D 0; i < nr_irqs; i++) {
>                 if (irq_domain_get_irq_data(domain, irq_base + i))
>                         domain->ops->free(domain, irq_base + i, 1);
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -1333,20 +1333,28 @@ static int __msi_domain_alloc_irqs(struc
>
>                 ops->set_desc(&arg, desc);
>
> -               virq =3D __irq_domain_alloc_irqs(domain, -1, desc->nvec_u=
sed,
> +               /* Make sure a MULTI-MSI allocation is power of two */
> +               unsigned int nvec_aligned =3D roundup_pow_of_two(desc->nv=
ec_used);
> +
> +               virq =3D __irq_domain_alloc_irqs(domain, -1, nvec_aligned=
,
>                                                dev_to_node(dev), &arg, fa=
lse,
>                                                desc->affinity);
>                 if (virq < 0)
>                         return msi_handle_pci_fail(domain, desc, allocate=
d);
>
> -               for (i =3D 0; i < desc->nvec_used; i++) {
> +               for (i =3D 0; i < nvec_aligned; i++) {
>                         irq_set_msi_desc_off(virq, i, desc);
>                         irq_debugfs_copy_devname(virq + i, dev);
>                         ret =3D msi_init_virq(domain, virq + i, vflags);
>                         if (ret)
>                                 return ret;
>                 }
> +
>                 if (info->flags & MSI_FLAG_DEV_SYSFS) {
> +                       /*
> +                        * This only exposes desc->nvec_used and ignores =
the
> +                        * overallocated MULTI-MSI ones.
> +                        */
>                         ret =3D msi_sysfs_populate_desc(dev, desc);
>                         if (ret)
>                                 return ret;
> @@ -1610,13 +1618,15 @@ static void __msi_domain_free_irqs(struc
>                         continue;
>
>                 /* Make sure all interrupts are deactivated */
> -               for (i =3D 0; i < desc->nvec_used; i++) {
> +               unsigned int nvec_aligned =3D roundup_pow_of_two(desc->nv=
ec_used);
> +
> +               for (i =3D 0; i < nvec_aligned; i++) {
>                         irqd =3D irq_domain_get_irq_data(domain, desc->ir=
q + i);
>                         if (irqd && irqd_is_activated(irqd))
>                                 irq_domain_deactivate_irq(irqd);
>                 }
>
> -               irq_domain_free_irqs(desc->irq, desc->nvec_used);
> +               irq_domain_free_irqs(desc->irq, nvec_aligned);
>                 if (info->flags & MSI_FLAG_DEV_SYSFS)
>                         msi_sysfs_remove_desc(dev, desc);
>                 desc->irq =3D 0;
