Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D82175A6D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 03:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790998828; cv=pass; b=iI8Z8V5l5Xyws0MppmwrD+qPkRgZz3fPuxsY8ULc7P7QHJU+TrLO6dkmAjEGeFIygqj8RmNecfG7xJXA7j63xxv3EOP6H3YtnTHGF9AIpO8qao67y1RMkDahvam64vHTr8UJTRS625nWofOO8IswPP45OqFywd9TUdeu4iibbl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790998828; c=relaxed/simple;
	bh=56Ju5c4rE+eDZOxMiy1S3QzO18pX2QSnoknCAsNk8gs=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrBDHkooejqALyyOXEUXE5kvC/kcrzdeFmRfscDnjKLJxXY7VWbmQV9BCemqHAhlC9HSV+0LDC6RgrJgirI+CDkkXLoif+r3idlhvwZ5aMBkroeRe4b2VapzA10z1Rv2wBGjyVlaucwHbIDBHZdkNjh3TcS89CeHQ5ESUexfu6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQ03OeER; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQ03OeER"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5350c1b9e0dso2875751cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 20:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790998824; cv=none;
        d=google.com; s=arc-20260327;
        b=cJeWuvCDbZDubQslNtrOeOM+F6Grvpr4obA6yvI2n/LC+/6mF2c9Wn37KwRAWOU0FL
         rgvV1xd5HrjOA20YOMKRHpzH2/nu3F1jJ3lx9LH09seS8zLFuFYntmtJEgwWPt6vGKWl
         ABH2hL4lwEq+sp2oh/CjooKYNYNNQHHN4Pd0pm+JVSkeRsUPn6tSg9go9UDKXXGpZoAM
         +/qZP5y1ww5mBXDSvbr76RyFYvW2lhBAL1yckuNqcbZ5+m10fKcMwAOpbAT6Czb9OO8z
         iQWvFPvkaMJYgptYxZRxc8h7Bke1xjVmRV/mP3DVkcoAJyNk2Qo29xHA+SrV4EkLEx1K
         2RaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=J4boZ6mnkdtNUHfrhdI/T74LSEGfKO1z7d+Kl6GSoTQ=;
        fh=ZygkF7/vXADa66pkA+SFMzLwPl04YyMi71GBt8E9/EE=;
        b=Wa4XQJ7jWzc0NBgqGOMyVVgK05+88IxC9ap2nt3iiwgRtn2YOyRYxhpA7cKjxBopXn
         hJLbwxCh7csOx++SwXjzc9kMpwtrtPxD7oXYE8TD+LP/SCHMr/hKldQ5E7AcbD6NyaOf
         Q9NtK6Z71zJJs3FU3KpQGqnAGXnJBzwEPk310tRb46L+rSC7Wf1wzwBUWRB9OEGQ6b/w
         VZiiSF/48VUUOIkqIsnAY/zMNTMtXXHjRhBrFMta+eJ7ep/xtscUh8kHn31IWaRxZXbW
         z31SxKHwe8S9L+j+wbrnHpAFqdRjRLJdKJGF14Sj/Za9+T4RD+QFrj1mstCyLUawwdhS
         GO3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790998824; x=1791603624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4boZ6mnkdtNUHfrhdI/T74LSEGfKO1z7d+Kl6GSoTQ=;
        b=MQ03OeERoNofRakEN7eMrSs5tZmSRfVTBCgjf4nDf5U8fCWCMjDkq4aXvWGYKnVUr9
         9BKFQuSjJhDCWucnIVrXr8qIhV6VppOSP/A+xegTkgyLAJUB0Y6N4Xrr06CETuEjVb6h
         16hTmq1Zq0LgyReBfautZfBi6BF3+UCcz6ZMT9QgGSQ4YR7lahkUOOMNEKPWStgjmdEO
         cKFbYO1/BOlSUEV12Sh1+RcosES3ZDCAgQ3yxLOJLujV/+F4rrVFyrZQq1DYt08UXl2N
         TDizJI3omD93xh7iZruhvS+25N9/a3juYvyXFs+k+x6OmYdN5PAHyes7xnG6FbLexZva
         kifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790998824; x=1791603624;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J4boZ6mnkdtNUHfrhdI/T74LSEGfKO1z7d+Kl6GSoTQ=;
        b=dXWYcmRfK4uR0dAx4lK7tkxjVHHDmpDlfbaCV9LR3dINaAsP3SaLnTKiMmrWtLdVIo
         BSkOky5daJN12+hMOHgKS8Emh+3BHvhnDvkHrBbiZy3kKC5VSNav0bk+DOo6wK8aVX8u
         Y/SQAut01w+9krN0dEt1qRRL+vUYX1X1tsLbgqPjSlpU4mAM8UJ2ir0xSLGl7jO1sbjm
         fs3mwuK+b5h3Z9cAHRih5MKCZ5rARVoHx/KLfcePzY58YHc0yeZd5JvSsXfbYF2RKoKE
         UWiOCeqLLIkRIRD5xLABADsOGaVQZYp5SB4+tPv4YGN5ToXz9xgmbGo3Z//lj2FeFK8w
         nd0A==
X-Forwarded-Encrypted: i=1; AKwUvByCbhSvr1CDh+Lh627BJfGwlMNQzWw7W/foLbAiaCuC3FZtrhxBGiN2tkntk4dE9MHmMMVDfHxYyETrdFk=@vger.kernel.org
X-Gm-Message-State: AFuF++lUZGp1vUoH/bwUu+qmiUBCol8tstQS4FGdjchTSxnh/wa0vEhC
	tC/czZDamwMUoTcnLRffJIXSDjEeR7h+E8cRv3befNx8mJlb6WPLt494nzBp61P08zd6/h6yimE
	ey7aDzH03OjpAwGwbbOxvtoluOFIi7p0=
X-Gm-Gg: AYBFou1q4eG3rhFSmWI/eUkZ7zmxe0nWVUaGg3EdbHjObOPsvk4ta4oP1nAD0Q/9IGn
	UGyJnmNwF9D9pWcyogSeNqv9hSdkmOSWS2g4Qrlvn/zABFqkNYSqvrf0nQE9HVNgmUO2KPs4wIz
	iwTMe2i5u5Le34MCtyoYeYDAAXbTrQwWrlZ1MCsl0vOqWdAXyEJRizt+/uJr3T1+QP+1Zhe0Bnt
	PYWXfpvSz649CxUgocCci/4ZVyxhGqsS9mzjIxEwqTnGq5FHbW+B7TTE56Osc86AdHJplhLbKt9
	RiHOSeMLSXkfbExtmIjU0Uqz7gVKpCwt3B1nErxXGfEMurh4YImO/zp9pxCP+T+1nnGr8U/V473
	lpE/aa5E=
X-Received: by 2002:ac8:5f8e:0:b0:530:de54:ff67 with SMTP id
 d75a77b69052e-53511f3344amr22796971cf.50.1790998823994; Fri, 02 Oct 2026
 20:40:23 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 23:40:22 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 23:40:22 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rickey Bartlett <subtexel@gmail.com>
In-Reply-To: <20261001170816.GA2702295@bhelgaas>
References: <20261001170816.GA2702295@bhelgaas>
Date: Fri, 2 Oct 2026 23:40:22 -0400
X-Gm-Features: AclHuK8QecrGNoDRvgFGqFvnErH9sertkbDrzqInAClkQJ7nW6sm7MxDppHLCEo
Message-ID: <CAAqcVzyiXr3GvzgpL_Cwh9W5EwLOZTowa-Fj5=7LGGiyhnY6yQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: vmd: Flush initiator posted writes before demuxing
 interrupts on Meteor Lake
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczynski <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Keith Busch <kbusch@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Bjorn,

Thanks for catching that. The September 3 patch you linked is the intended
reference for [1]. The message ID in my original link was incorrect.

Please use these references in the commit message:

[1] https://lore.kernel.org/all/20240903025544.286223-1-kai.heng.feng@canonical.com/

[2] https://lore.kernel.org/all/20240913111142.4cgrmirofhhgrbqm@thinkpad/

I'll use lore.kernel.org links going forward.

Thanks,
Rickey


On Thu, 01 Oct 2026 12:08:16 -0500, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Mon, Aug 24, 2026 at 09:32:20PM -0700, Rickey Bartlett wrote:
> > Meteor Lake VMD (8086:7d0b) is affected by erratum MTL016: the VMD can
> > signal its MSI before the posted writes carrying a child device's DMA
> > data have landed in memory. vmd_irq() then demuxes to the child handler
> > while the child's completion queue is not yet coherent, so the handler
> > observes no completion and returns without consuming it. The I/O is
> > only recovered when the block layer timeout expires and polls the queue:
> >
> >   nvme nvme0: I/O tag 253 (50fd) QID 1 timeout, completion polled
> >
> > The practical effect is therefore not a lost I/O but a 30 second stall
> > of the entire storage stack, repeated under any sustained read load.
> >
> > This was originally diagnosed and fixed by Kai-Heng Feng in September
> > 2024 [1]. That patch used udelay(4); Keith Busch objected that the delay
> > is merely a side effect of the read, and that flushing the pending
> > device-to-host writes is what the erratum actually requires. Kai-Heng
> > agreed to respin with a dummy register read. The thread then stalled on
> > an open question from Manivannan Sadhasivam [2]: whether the read must
> > target the child device (the "MSI initiator" named by the erratum)
> > rather than the VMD, and whether the workaround belongs in the NVMe
> > driver instead. No revision followed, and the erratum has remained
> > unmitigated in mainline since.
> >
> > This implements the flush read Keith asked for, and answers the open
> > question empirically: the read MUST complete at the initiating child
> > device. A read of the VMD's own config BAR was tried first and does not
> > help - it terminates at the VMD and never traverses the downstream
> > link, so it does not order against the child's posted writes (measured:
> > timeout rate unchanged). Reading the initiator's config space does
> > order correctly: per PCIe ordering rules the read completion cannot
> > pass the device's earlier posted writes, so returning from the read
> > guarantees the completion queue entry is visible.
> >
> > The initiator's config address is captured per-IRQ at MSI allocation
> > time from the requesting device, so the hot path adds one config read
> > only on affected parts, and only for vectors owned by a child device.
> > The read is serialized with cfg_lock like all other VMD config access.
> > No NVMe driver change is needed.
> >
> > Measured on a Dell Pro Max 14 MC14250 (Meteor Lake, VMD 8086:7d0b,
> > KIOXIA BG6 512GB, 7.0.0-30-generic). The drive is healthy (46C, 0 media
> > errors, 2% used) and ASPM is disabled on the link with all L1 substates
> > off, so neither ASPM nor APST is involved.
> >
> > Dropping caches and reading 3000 shared libraries, measuring
> > /proc/pressure/io "full" (every task on the system blocked on I/O),
> > with nvme_core.io_timeout=5:
> >
> >   unpatched:      round 1  wall 37.4s   full I/O stall 32.6s   timeouts 0
> >                   round 2  wall 30.6s   full I/O stall 28.7s   timeouts 1
> >                   round 3  wall 30.3s   full I/O stall 27.4s   timeouts 1
> >
> >   VMD-BAR read:   round 1  wall 44.8s   full I/O stall 38.6s   timeouts 8
> >   (insufficient)  round 2  wall 234.8s  full I/O stall 207.9s  timeouts 37
> >                   round 3  wall 3.6s    full I/O stall 0.8s    timeouts 0
> >
> >   this patch:     round 1  wall 3.6s    full I/O stall 1.3s    timeouts 0
> >                   round 2  wall 3.6s    full I/O stall 1.3s    timeouts 0
> >                   round 3  wall 3.6s    full I/O stall 1.4s    timeouts 0
> >
> > Before any workaround, 208 seconds of total-system I/O stall
> > accumulated in the first 13 minutes of uptime, roughly 27% of wall
> > clock. Userspace experiences this as GUI applications taking 30-60+
> > seconds to start while throughput between stalls looks entirely normal
> > (1.9 GB/s QD1) - which is what makes the fault easy to misattribute to
> > ASPM or to the drive.
> >
> > [1] https://lore.kernel.org/all/20240909082657.19660-1-kai.heng.feng@canonical.com/
>
> This link doesn't work.  Do you have a corrected one?  Maybe it was a
> followup to this one:
>
>   https://lore.kernel.org/all/20240903025544.286223-1-kai.heng.feng@canonical.com/
>
> > [2] https://lkml.iu.edu/hypermail/linux/kernel/2409.1/08047.html
>
> And this appears to be the email at
> https://lore.kernel.org/all/20240913111142.4cgrmirofhhgrbqm@thinkpad/
>
> Prefer lore.kernel.org over lkml.iu.edu because lore doesn't depend on
> non-kernel.org resources.
>
> > Reported-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > Suggested-by: Keith Busch <kbusch@kernel.org>
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Rickey Bartlett <subtexel@gmail.com>
> > ---
> > This revives the MTL016 workaround that Kai-Heng Feng posted in September
> > 2024 [1]. To be clear about the provenance: the diagnosis and the fix are
> > his. Intel confirmed the silicon bug in that thread. What is new here is
> > the implementation Keith asked for, and the measurements needed to close
> > the question the thread ended on.
> >
> > That thread stalled on one unanswered point - whether the flush read has
> > to target the NVMe child device, the "MSI initiator" named in the erratum,
> > or whether the VMD's own register is enough, and whether the workaround
> > belongs in the NVMe driver at all. Nobody had hardware in front of them to
> > settle it, and the discussion stopped there. It has been two years, the
> > erratum is still unmitigated in mainline, and every affected machine has
> > been stalling that whole time.
> >
> > I have the hardware, so here is the answer: the read must complete at
> > the NVMe child device - the "MSI initiator" named in the erratum -
> > exactly as Manivannan suspected. I first tried reading the VMD's own
> > config BAR; it does not help (measured, numbers in the commit message:
> > timeout rate was unchanged). A read that terminates at the VMD never
> > traverses the downstream link, so PCIe ordering gives no guarantee
> > about the child's posted writes. Reading the initiator's config space
> > closes the race. The workaround still lives in the VMD driver rather
> > than the NVMe driver: the VMD is the broken component, the initiator
> > address is captured generically per-IRQ at MSI allocation time, and no
> > NVMe-specific knowledge is needed.
> >
> > Measurements are in the commit message.
> >
> >  drivers/pci/controller/vmd.c | 52 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 50 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> > index 241023e..e45ef8c 100644
> > --- a/drivers/pci/controller/vmd.c
> > +++ b/drivers/pci/controller/vmd.c
> > @@ -92,6 +92,22 @@ enum vmd_features {
> >  	 * referred to as MEMBAR2 or MSI-X BAR.
> >  	 */
> >  	VMD_FEAT_USE_BIOS_INFO		= (1 << 6),
> > +
> > +	/*
> > +	 * Meteor Lake VMD (device ID 0x7d0b) is affected by erratum MTL016:
> > +	 * the VMD may signal its MSI before the posted writes that carry the
> > +	 * child device's DMA data have landed in memory.  The demuxed handler
> > +	 * then runs against a not-yet-coherent completion queue and misses the
> > +	 * completion entirely, so the I/O is only recovered when the block
> > +	 * layer timeout fires and polls the queue ("timeout, completion
> > +	 * polled").  Intel's documented workaround is to issue a dummy read
> > +	 * to the MSI initiator (the child device) before handling the
> > +	 * interrupt: the read completion cannot pass the device's earlier
> > +	 * posted writes, so it pulls them into memory per PCIe ordering
> > +	 * rules.  A read that terminates at the VMD itself does not order
> > +	 * against the child's writes and is not sufficient (measured).
> > +	 */
> > +	VMD_FEAT_INTERRUPT_QUIRK	= (1 << 7),
> >  };
> >
> >  #define VMD_BIOS_PM_QUIRK_LTR	0x1003	/* 3145728 ns */
> > @@ -114,6 +130,9 @@ static DEFINE_RAW_SPINLOCK(list_lock);
> >   * @irq:	back pointer to parent.
> >   * @enabled:	true if driver enabled IRQ
> >   * @virq:	the virtual IRQ value provided to the requesting driver.
> > + * @flush_addr:	config space address of the initiating device, read before
> > + *		demuxing to flush its posted writes (MTL016); NULL if the
> > + *		VMD is not affected.
> >   *
> >   * Every MSI/MSI-X IRQ requested for a device in a VMD domain will be mapped to
> >   * a VMD IRQ using this structure.
> > @@ -123,8 +142,14 @@ struct vmd_irq {
> >  	struct vmd_irq_list	*irq;
> >  	bool			enabled;
> >  	unsigned int		virq;
> > +	void __iomem		*flush_addr;
> >  };
> >
> > +struct vmd_dev;
> > +
> > +static void __iomem *vmd_cfg_addr(struct vmd_dev *vmd, struct pci_bus *bus,
> > +				  unsigned int devfn, int reg, int len);
> > +
> >  /**
> >   * struct vmd_irq_list - list of driver requested IRQs mapping to a VMD vector
> >   * @irq_list:	the list of irq's the VMD one demuxes to.
> > @@ -132,12 +157,15 @@ struct vmd_irq {
> >   * @count:	number of child IRQs assigned to this vector; used to track
> >   *		sharing.
> >   * @virq:	The underlying VMD Linux interrupt number
> > + * @vmd:	back pointer to the owning VMD device; serializes the MTL016
> > + *		flush read against other config space access.
> >   */
> >  struct vmd_irq_list {
> >  	struct list_head	irq_list;
> >  	struct srcu_struct	srcu;
> >  	unsigned int		count;
> >  	unsigned int		virq;
> > +	struct vmd_dev		*vmd;
> >  };
> >
> >  struct vmd_dev {
> > @@ -295,6 +323,13 @@ static int vmd_msi_alloc(struct irq_domain *domain, unsigned int virq,
> >  		INIT_LIST_HEAD(&vmdirq->node);
> >  		vmdirq->irq = vmd_next_irq(vmd, desc);
> >  		vmdirq->virq = virq + i;
> > +		if (vmd->features & VMD_FEAT_INTERRUPT_QUIRK) {
> > +			struct pci_dev *pdev = msi_desc_to_pci_dev(desc);
> > +
> > +			vmdirq->flush_addr = vmd_cfg_addr(vmd, pdev->bus,
> > +							  pdev->devfn,
> > +							  PCI_VENDOR_ID, 2);
> > +		}
> >
> >  		irq_domain_set_info(domain, virq + i, vmdirq->irq->virq,
> >  				    &vmd_msi_controller, vmdirq,
> > @@ -756,8 +791,20 @@ static irqreturn_t vmd_irq(int irq, void *data)
> >  	int idx;
> >
> >  	idx = srcu_read_lock(&irqs->srcu);
> > -	list_for_each_entry_rcu(vmdirq, &irqs->irq_list, node)
> > +	list_for_each_entry_rcu(vmdirq, &irqs->irq_list, node) {
> > +		/*
> > +		 * MTL016: the MSI may have outrun the initiating device's
> > +		 * posted writes (e.g. its NVMe completion entry).  A read
> > +		 * that completes at the initiator flushes them, so the
> > +		 * demuxed handler observes a coherent completion queue.
> > +		 * The value is discarded; only the ordering matters.
> > +		 */
> > +		if (vmdirq->flush_addr) {
> > +			guard(raw_spinlock)(&irqs->vmd->cfg_lock);
> > +			readw(vmdirq->flush_addr);
> > +		}
> >  		generic_handle_irq(vmdirq->virq);
> > +	}
> >  	srcu_read_unlock(&irqs->srcu, idx);
> >
> >  	return IRQ_HANDLED;
> > @@ -788,6 +835,7 @@ static int vmd_alloc_irqs(struct vmd_dev *vmd)
> >  			return err;
> >
> >  		INIT_LIST_HEAD(&vmd->irqs[i].irq_list);
> > +		vmd->irqs[i].vmd = vmd;
> >  		vmd->irqs[i].virq = pci_irq_vector(dev, i);
> >  		err = devm_request_irq(&dev->dev, vmd->irqs[i].virq,
> >  				       vmd_irq, IRQF_NO_THREAD,
> > @@ -1250,7 +1298,7 @@ static const struct pci_device_id vmd_ids[] = {
> >  	{PCI_VDEVICE(INTEL, 0xa77f),
> >  		.driver_data = VMD_FEATS_CLIENT,},
> >  	{PCI_VDEVICE(INTEL, 0x7d0b),
> > -		.driver_data = VMD_FEATS_CLIENT,},
> > +		.driver_data = VMD_FEATS_CLIENT | VMD_FEAT_INTERRUPT_QUIRK,},
> >  	{PCI_VDEVICE(INTEL, 0xad0b),
> >  		.driver_data = VMD_FEATS_CLIENT,},
> >  	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_VMD_9A0B),
> > --
> > 2.53.0
> >
