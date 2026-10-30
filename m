Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793365167;
	b=2q2PLYXNwIiHYggUqRS9dWfdJgCLijL0OWjirqtjO24bfI0cpdcpAkCEquM/mBJyZYQ/
	 /eQX9Gg5d8VyTTjgYv8v7afYS583ATuegdMdMhFulallt2/2emi5fWbFqxggLgEosiTO9
	 1DgQe6z1PpAJV2ZyTAblrjd8g6rMruAh1RKrTfg+TYPkIp0zVOWMxEKf/uOnpTqSwKYFp
	 9xJ1OPO6UIpyVJDqosDOcsdUGQrGPnzIx0B3h0XD80mlHKLNXZ1z8+tqy8sUUqG09a28R
	 /ioCvcOtlL1LT1iptQv4YM54CE1FxgecX7P9ZrpuDuWIA0fEXIj7O9WRr+PvQ7dyVVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p6R90zdJgmEJTfYgbyUUxOPzWcHXkQ+Gzj39UPrsQEU=;
	b=EFkDzm7eP4Dcf337KPUoA9bdz/QT08jNKP9mkLIDiEc0KpcwEHXjekW3utx+Rw+AEsbc
	 vJxiRme3U4DzP0vzxVgnmA4Dl2DJAW58Nqk0AJXkS45lq2k5aD/ZUvzxqZxe6TvQzSlVv
	 PFcWLYLOxNd9Ap8lQX+WnB66e5wmvPcDm2tW4jiij+mb54Ue+D4chYBguCehMrzhE5Aqt
	 R7Fmf7lJDX21R0zA2w2zco71/B8uPy33J353+VufSygWz6lQT7MSN/Wz3y+KPhyM8Mzfc
	 cXm3cjW0M+KYT3cuiV1/kmmuhdzHGeXpdPZQqsuG5HqjXrtVaiTDG7qguwp/FQSNYyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nearthlab.com;
	spf=pass smtp.mailfrom=nearthlab.com;
	dkim=pass header.d=nearthlab.com header.i=@nearthlab.com header.a=rsa-sha256 header.s=google header.b=jcg5JOa2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693D7606A332
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693D7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nearthlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nearthlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nearthlab.com header.i=@nearthlab.com header.a=rsa-sha256 header.s=google header.b=jcg5JOa2
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9f6a16aedso4181095ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365162; cv=none;
        d=google.com; s=arc-20260327;
        b=kT1ya11C5LAVyYAi5Vg2f608jkmxQ9c6ceJekvZkAF6YD4kpILS6ym7p9hQ2aWV0yr
         t+eWmtoo9S7qH7jyRm0ED8pJGK0NX8E3PibRL29CargISYo8V/oGNiVoYEokMUwBui89
         37xsi3MQ60RXbRYlIBgBLQLQG9gU6mAeDL6ubVRa8cgU+MvBBQsAM2mKXbCTTjGFVQuv
         ukdE1uUQQkhnYb31kkqf/S/M1gG1Pa7TM3+HxNnQ8zAJ5T18r6WhAG/sIbUNkfwHDJuT
         a/O2oTmRAdJj5e2hu5/JEKHXEhGQ/Yqvc2DwVFOoxwqOWrAdJcrQRxOuE5yXqfAat9IJ
         5ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p6R90zdJgmEJTfYgbyUUxOPzWcHXkQ+Gzj39UPrsQEU=;
        fh=BfpT4zh/NdVSEfvtHzBouMGfgb+ROpSqqRn/4RVkZGE=;
        b=r/FtDw1KEAR38beScpCbhQ7H2hclnNfq5OdVUrhSBaAeEFdricyQMWyMphucNCjUTn
         Cguc3pYjf2yFp0OypVTx9hVfpqPhBCjfzSWQwIvZrAgtQkSzeoJ2yJKXStll7ccXoPpR
         WkEuAp9kZ0gV7vy/RB4zFyaW8xxrh/dIj0dHrhb+dGkQDua4vneUwPKngafMrEyqqOor
         5fqvliTm68IbBkTEx1GRo1LJ842+DVpBzOX/VciRF8xUcOcDBrR+ExevUfFK9ZmU3JSC
         6noCzju4vGiIRqVPhfZ43WNp26Ur3ozcV47Mtdet0LPtIwpgtcuP0kgzJ9H/kmegKzv9
         tI+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nearthlab.com; s=google; t=1793365162; x=1793969962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p6R90zdJgmEJTfYgbyUUxOPzWcHXkQ+Gzj39UPrsQEU=;
        b=jcg5JOa2QriZQ122t9TVaXV1GB6tc/Tw3QkYBp32vfK1VOe4EICNbvzmKRTwP6xHiu
         zr9k9DuEeYHeZ3N4kv1BCoKPOrA6GGTwq4L149qoXSIaeftBk1dfXjx6IsmWAxLBr9Mb
         YVSdAd9khtSVrY6bIJxNGfUP6bSJ0KFI9KPBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365162; x=1793969962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6R90zdJgmEJTfYgbyUUxOPzWcHXkQ+Gzj39UPrsQEU=;
        b=TCnvEDxHOAHt8eguMeJnFbAPn3//eNFYCuK6Z7JnHptT5/LAqpfYkY1vkltAbTq07r
         lrke9n/23zYfkbVvukqQdt/ufyzVRU0P4uFVRZDDioFvoyO4iJuFG7kaqsv3qhQxAPsQ
         PCBla9amt55kA2ci8Ii4nhYXXl8UtjhRvoCqUCUS5c8zYtCJstM4MnfGC9BrPF4Yiick
         EdKu1ojUaRJsuh3VQbyk73X/cxPzbrhcI65JrifAWFkvSGQwHID+JjNOnYH9yFegBag4
         UFaY980cwg6W/2pM9mZHZTB+Kkl+3nZJCX1jx0+v6dsbhX8JNER2a5++kU3qhKA/BPG8
         lEGw==
X-Forwarded-Encrypted: i=1; AKwUvBxYBUa5ebJMg8rooymt3KWaIPkZW50r+6JByHSD1W+F3iOK+5se1YaMM4jxFMm/CGqrtFSPmEATBXPfdFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzsMx7GfRIuUW3cEcots4FJYPJ2iwVZfrWmw9XONmuUnvhsD23
	MKwYNpuPVsUBd3az3xShA13lMrRu3MjBV4AwEjPFr9jnM/nqkCg4/6CheANe//f8dGa059b8hw/
	M4owhKASVCNTFF+0zsyHxtFDOPrYqc4HJr5z+95wJIw==
X-Gm-Gg: AYBFou3KOHcrLw0A/h0LM9WbRJVz8A5WZxR6lbJhKTGYmXQfl+wHG9n307tjfATm9QD
	pO/pYYYsJknmZDcY5KzLPVfK8cUoZLEIW2yY9reDPH9FoXcMrsfl2DjATs+NTnjufYWK6b4nAhf
	Fc3wZ6yz9qTRijuz86GZGXPyQRhOUnEkcKU7W+guQImRXza+rCV4BlxienpTDYt6E2VpefbSpl4
	3UTN1sDIq12/toCR1vdKxSxrjJBXzse7ZR9erZAYkGETkcyfiLwZLSAlxh4CfMDsUEeoZXKnB7v
	sjEgcYRfszUJYI1bd3l8o+JaDd9hz2edB4nTnvED62s+gCbtxUFHp1Zg2QSRAmg9j34aSxpMn9/
	jqB8pHmaQdw8XjdyHRZq4tVdzFuI8gyh3Z4hrqg==
X-Received: by 2002:a17:90b:570c:b0:3ab:e588:c288 with SMTP id
 98e67ed59e1d1-3ae897ccb52mr1922463a91.11.1793365161515; Fri, 30 Oct 2026
 05:59:21 -0700 (PDT)
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
 <20261013160612.GA1522005@bhelgaas>
In-Reply-To: <20261013160612.GA1522005@bhelgaas>
From: =?UTF-8?B?SGFuIC8g7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Date: Fri, 30 Oct 2026 21:59:10 +0900
X-Gm-Features: AclHuK_9LSEza9FeIN4_POSl6PnQiLI9XlH_CpYxxAsTk82lmVZT6Y9umW1SJXE
Message-ID: <CAFg7d9a2p2jtGyThS1M=2ZFDX0y5rpSK3H34ZuTz09R5r_ff0A@mail.gmail.com>
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

Hi Thomas,

On Thu, Oct 01 2026 at 21:29, Thomas Gleixner wrote:
> Good. Can you please retest with the updated patch?
[...]
> Any updates on that? Also please provide the source for that test.

The 5-vector endpoint I used before is no longer available to me, so I
tested on the same BCM2712 board with a similar endpoint that
advertises a single MSI vector. Since I did not have time to write a
test driver for it myself, I used an AI-generated virtual driver to
make the kernel see Multiple Message Capable =3D 4 and request 3 vectors.
I cannot vouch for its quality, as I had little time to review it.

Kernels: rpi-6.12.y (6.12.93) with KASAN, built with no patch, your
first patch (v1) and the updated one (v2). I ran five loads with
PCI_IRQ_AFFINITY and five without, both with the port's MSIs on the
brcmstb MSI controller and on the BCM2712 MIP, which is an MSI parent
on this tree:

                                 no patch   v1         v2
  brcmstb MSI controller
    KASAN report                 no         yes        yes
    allocs OK, affinity          5/5        1/5        2/5
    allocs OK, no affinity       2/5 (*)    5/5        5/5
    free calls to the parent     3 x nr=3D1   4 x nr=3D1   4 x nr=3D1
  BCM2712 MIP
    KASAN report                 (**)       yes        yes
    allocs OK, affinity                     1/5        2/5
    allocs OK, no affinity                  5/5        5/5
    free calls to the parent                4 x nr=3D1   1 x nr=3D4

  (*)  the original brcmstb leak
  (**) not run

  BUG: KASAN: slab-out-of-bounds in __irq_alloc_descs+0x158/0x460
  Read of size 8 at addr ffff8000053a68b0 by task insmod/599
  ...
  Allocated by task 599:
  ...
   kmemdup_array+0x50/0x88
   msi_alloc_desc+0x88/0xd0
  ...
  The buggy address is located 0 bytes to the right of
   allocated 48-byte region [ffff8000053a6880, ffff8000053a68b0)

The report is caused by the patch. __msi_domain_alloc_irqs() passes
nvec_aligned (4) to __irq_domain_alloc_irqs() together with
desc->affinity, which has only nvec_used (3) entries. alloc_descs()
then reads all 4 entries. The fourth entry is read past the end of
the array. If the data there has no CPU set, the allocation fails
with -ENOSPC. Without PCI_IRQ_AFFINITY, desc->affinity is NULL, so
this read does not happen.

On the brcmstb path, v2 still frees one vector at a time because
brcmstb on this tree uses pci_msi_create_irq_domain(), and neither
IRQ_DOMAIN_FLAG_MSI_DEVICE nor IRQ_DOMAIN_FLAG_MSI_PARENT is set.
The MIP behind this port has 8 vectors, while the switch ports use 4.
Therefore, the MIP path works for this 4-vector block but not for the
original 5-vector endpoint, which is rounded up to 8.

The test module from my earlier report is below. I bound it using
driver_override and loaded it with min_nvec=3D1 nvec=3D3 affinity=3D1.

// SPDX-License-Identifier: GPL-2.0
// TEST-ONLY Multi-MSI exerciser. Bind to a PCI device via
// driver_override and request a parametrized MSI vector count to probe
// brcmstb/core accounting. nvec: max vectors, min_nvec: floor,
// affinity: add PCI_IRQ_AFFINITY (triggers the managed-affinity path),
// request: request_irq the granted vectors.
#include <linux/module.h>
#include <linux/pci.h>
#include <linux/interrupt.h>
#include <linux/irq.h>

static int nvec =3D 5;
module_param(nvec, int, 0644);
static int min_nvec =3D 1;
module_param(min_nvec, int, 0644);
static int affinity;
module_param(affinity, int, 0644);
static int request;
module_param(request, int, 0644);

static irqreturn_t msi_exer_isr(int irq, void *data)
{
        return IRQ_HANDLED;
}

static int msi_exer_probe(struct pci_dev *pdev,
                          const struct pci_device_id *id)
{
        unsigned int flags =3D PCI_IRQ_MSI;
        int ret, i, n;

        ret =3D pci_enable_device(pdev);
        if (ret)
                return ret;
        pci_set_master(pdev);

        if (affinity)
                flags |=3D PCI_IRQ_AFFINITY;

        n =3D pci_alloc_irq_vectors(pdev, min_nvec, nvec, flags);
        if (n < 0) {
                dev_info(&pdev->dev,
                         "msi_exer: alloc(%d..%d,aff=3D%d) FAILED %d\n",
                         min_nvec, nvec, affinity, n);
                pci_disable_device(pdev);
                return n;
        }
        dev_info(&pdev->dev,
                 "msi_exer: req %d..%d aff=3D%d -> got=3D%d base_irq=3D%d\n=
",
                 min_nvec, nvec, affinity, n, pci_irq_vector(pdev, 0));
        for (i =3D 0; i < n; i++) {
                int irq =3D pci_irq_vector(pdev, i);
                struct irq_data *d =3D irq_get_irq_data(irq);

                dev_info(&pdev->dev,
                         "msi_exer:   vec %d irq %d hwirq 0x%lx\n", i, irq,
                         d ? (unsigned long)irqd_to_hwirq(d) : 0UL);
                if (request && request_irq(irq, msi_exer_isr, 0,
                                                   "msi_exer", pdev))
                        dev_info(&pdev->dev,
                                 "msi_exer:   request_irq %d failed\n",
                                 irq);
        }
        pci_set_drvdata(pdev, (void *)(long)n);
        return 0;
}

static void msi_exer_remove(struct pci_dev *pdev)
{
        int n =3D (int)(long)pci_get_drvdata(pdev);
        int i;

        if (request)
                for (i =3D 0; i < n; i++)
                        free_irq(pci_irq_vector(pdev, i), pdev);
        pci_free_irq_vectors(pdev);
        pci_disable_device(pdev);
        dev_info(&pdev->dev, "msi_exer: removed (freed %d)\n", n);
}

static const struct pci_device_id msi_exer_ids[] =3D { { 0 } };
MODULE_DEVICE_TABLE(pci, msi_exer_ids);

static struct pci_driver msi_exer_driver =3D {
        .name =3D "msi_exer",
        .id_table =3D msi_exer_ids,
        .probe =3D msi_exer_probe,
        .remove =3D msi_exer_remove,
};
module_pci_driver(msi_exer_driver);
MODULE_LICENSE("GPL");

Thanks,
Sangwoo


2026=EB=85=84 10=EC=9B=94 14=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 1:06, =
Bjorn Helgaas <helgaas@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Oct 13, 2026 at 05:47:49PM +0900, Han / =ED=95=9C=EC=83=81=EC=9A=
=B0Sangwoo wrote:
> > Hi Bjorn, Thomas,
> >
> > > > Good. Can you please retest with the updated patch?
> > >
> > > Sangwoo, any update on this?
> >
> > Sorry for the silence.
> >
> > I have not been able to retest yet. I have several work items on a
> > tight schedule right now, and I am currently working on a different
> > board for another project, so I cannot get to this at the moment.
> >
> > For the KASAN slab-out-of-bounds report, I will follow up within
> > October.
> >
> > For the retest with the updated patch, I cannot give a date right now.
> > I am sorry about that.
>
> No worries, just wanted to make sure we didn't drop this.  I have a
> note to follow up again later :)
>
> > 2026=EB=85=84 10=EC=9B=94 13=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 6:=
47, Bjorn Helgaas <helgaas@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
> > >
> > > On Thu, Oct 01, 2026 at 09:29:27PM +0200, Thomas Gleixner wrote:
> > > > On Mon, Sep 21 2026 at 18:05, Han / =ED=95=9C=EC=83=81=EC=9A=B0Sang=
woo wrote:
> > > > > I tested Thomas's patch on the same hardware setup with the 5-vec=
tor
> > > > > MSI endpoint. The patch was applied as posted on top of 6.12.93
> > > > > (rpi-6.12.y).
> > > > >
> > > > > With the patch applied:
> > > > >
> > > > > - The MSI base hwirq remained at 0x8 across 200 driver reload cyc=
les.
> > > > > - The driver got all 5 requested vectors on every cycle, with no
> > > > > single-MSI fallback. Multiple Message Enable remained at 8.
> > > > > - The brcmstb inner-domain mapping returned to baseline after eac=
h
> > > > > unload/reload, with 12 mapped while the driver was loaded and 4 a=
fter
> > > > > unload.
> > > > > - A kprobe showed one allocation of 8 vectors followed by eight
> > > > > single-vector frees, with nothing left over.
> > > >
> > > > 8 single vector frees?
> > > >
> > > > Seems I got something wrong there verus the bulk free. Updated patc=
h
> > > > below.
> > > >
> > > > > The MSI vector exhaustion issue I originally observed no longer
> > > > > reproduces with the patch.
> > > >
> > > > Good. Can you please retest with the updated patch?
> > >
> > > Sangwoo, any update on this?
> > >
> > > I don't see this patch in linux-next (next-20261012), so I don't thin=
k
> > > this will be fixed for v7.4 unless something moves it ahead.
> > >
> > > > > I also observed a KASAN report with managed affinity. Using a sma=
ll
> > > > > out-of-tree test module bound to the same endpoint and requesting=
 1..3
> > > > > vectors with PCI_IRQ_MSI | PCI_IRQ_AFFINITY, a request for 3 vect=
ors
> > > > > resulted in:
> > > > >
> > > > > BUG: KASAN: slab-out-of-bounds in __irq_alloc_descs+0x158/0x460
> > > > >
> > > > > Requests for 5 and 7 vectors were capped to 4 on this 4-CPU syste=
m and
> > > > > did not trigger the report. I have not checked this against the
> > > > > unpatched kernel yet, so I cannot tell whether it is related to t=
he
> > > > > patch.
> > > >
> > > > Any updates on that? Also please provide the source for that test.
> > > >
> > > > Thanks,
> > > >
> > > >         tglx
> > > > ---
> > > > --- a/kernel/irq/irqdomain.c
> > > > +++ b/kernel/irq/irqdomain.c
> > > > @@ -1610,6 +1610,17 @@ static void irq_domain_free_irqs_hierarc
> > > >       if (!domain->ops->free)
> > > >               return;
> > > >
> > > > +     /*
> > > > +      * MSI device domains are capable of bulk free.
> > > > +      *
> > > > +      * CHECKME: Are all MSI parent domains capable?
> > > > +      */
> > > > +     if (domain->flags & (IRQ_DOMAIN_FLAG_MSI_DEVICE | IRQ_DOMAIN_=
FLAG_MSI_PARENT)) {
> > > > +             if (irq_domain_get_irq_data(domain, irq_base))
> > > > +                     domain->ops->free(domain, irq_base, nr_irqs);
> > > > +             return;
> > > > +     }
> > > > +
> > > >       for (i =3D 0; i < nr_irqs; i++) {
> > > >               if (irq_domain_get_irq_data(domain, irq_base + i))
> > > >                       domain->ops->free(domain, irq_base + i, 1);
> > > > --- a/kernel/irq/msi.c
> > > > +++ b/kernel/irq/msi.c
> > > > @@ -1333,20 +1333,28 @@ static int __msi_domain_alloc_irqs(struc
> > > >
> > > >               ops->set_desc(&arg, desc);
> > > >
> > > > -             virq =3D __irq_domain_alloc_irqs(domain, -1, desc->nv=
ec_used,
> > > > +             /* Make sure a MULTI-MSI allocation is power of two *=
/
> > > > +             unsigned int nvec_aligned =3D roundup_pow_of_two(desc=
->nvec_used);
> > > > +
> > > > +             virq =3D __irq_domain_alloc_irqs(domain, -1, nvec_ali=
gned,
> > > >                                              dev_to_node(dev), &arg=
, false,
> > > >                                              desc->affinity);
> > > >               if (virq < 0)
> > > >                       return msi_handle_pci_fail(domain, desc, allo=
cated);
> > > >
> > > > -             for (i =3D 0; i < desc->nvec_used; i++) {
> > > > +             for (i =3D 0; i < nvec_aligned; i++) {
> > > >                       irq_set_msi_desc_off(virq, i, desc);
> > > >                       irq_debugfs_copy_devname(virq + i, dev);
> > > >                       ret =3D msi_init_virq(domain, virq + i, vflag=
s);
> > > >                       if (ret)
> > > >                               return ret;
> > > >               }
> > > > +
> > > >               if (info->flags & MSI_FLAG_DEV_SYSFS) {
> > > > +                     /*
> > > > +                      * This only exposes desc->nvec_used and igno=
res the
> > > > +                      * overallocated MULTI-MSI ones.
> > > > +                      */
> > > >                       ret =3D msi_sysfs_populate_desc(dev, desc);
> > > >                       if (ret)
> > > >                               return ret;
> > > > @@ -1610,13 +1618,15 @@ static void __msi_domain_free_irqs(struc
> > > >                       continue;
> > > >
> > > >               /* Make sure all interrupts are deactivated */
> > > > -             for (i =3D 0; i < desc->nvec_used; i++) {
> > > > +             unsigned int nvec_aligned =3D roundup_pow_of_two(desc=
->nvec_used);
> > > > +
> > > > +             for (i =3D 0; i < nvec_aligned; i++) {
> > > >                       irqd =3D irq_domain_get_irq_data(domain, desc=
->irq + i);
> > > >                       if (irqd && irqd_is_activated(irqd))
> > > >                               irq_domain_deactivate_irq(irqd);
> > > >               }
> > > >
> > > > -             irq_domain_free_irqs(desc->irq, desc->nvec_used);
> > > > +             irq_domain_free_irqs(desc->irq, nvec_aligned);
> > > >               if (info->flags & MSI_FLAG_DEV_SYSFS)
> > > >                       msi_sysfs_remove_desc(dev, desc);
> > > >               desc->irq =3D 0;
