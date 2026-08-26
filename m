Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA014766AB
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776072; cv=pass; b=iCJ8TEXJXQqglLUpseBlEtxqpo9VqODtKAxoWHfn4rq8LQ0bGhHiBnoApLLXvVXYvLRZJpOMTyT/U1/5hCmpAWit0UvC7g6tKHhE3kbQwMDSEG7sI+4ncdivts8B0SgnLzoYWHN8F7hJFrixRd5L3rukGQO4u1pEHtzwAHXFCws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776072; c=relaxed/simple;
	bh=KB5Dt4NITSpAROcFBDNP6TJCJRL/uGFl7mc5zMZ6rbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7/5Of28aDhGcX6nvXpi/x4hYLIQQsb6Mwb4ZQirK3u0qt9Q/qbMIEG38fGJ2lsbJ0BQKppHzi6mFTo4pC8dvjBRH5UCIhkHqnhDX1MhY1zlWMQVC3R+IOHstMTKgw5HiKk8LktqpXMGT6jWjd6foE+mR1e7IcZZaDhET5r8UVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h6oyIj26; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h6oyIj26"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2055573c8cso210957866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787776069; cv=none;
        d=google.com; s=arc-20260327;
        b=XJz+ROoSK4jKnn7XdY0Xsve7uAU99aEway6+kk8gFC2cWws70kDVCFSGr7jnVcaZXu
         uIigHzq2KW5mfNXIXjqp3AsyQYIqRp2pOxWPbo8FKoJKgkXGe++zx4PEU+FG98fAzmtq
         WuEZSOgwC6lS5RWkG9QQZYXwF9EgtMVNT5m0+h96XPmIPOPI1hGjH3z5FJ2t0p9KuL6u
         aEBJnikGQtspLggPm9ExRElaqT63Y7u2TxkxPE56HPJyRvlnJAAJhoxkqByyc2DkjWs7
         BhpN9YWdRoAiczJjlH05Hq55TcQDaVwRT4Ozf4qaFAcEYucaILLS56Onhabdj2rw7WH8
         ioHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PWGOH1354ZX/vY0l9xaAPBv85Hq+rgIf24RYb5RW08c=;
        fh=B89RU01sPb3cBK2lfz2RQmNso0ao0+HIiEFCcLzxtlg=;
        b=B1jo3S1TsXJSpTgO2Ec8aE7wRUEN1gaDVPfG3vddKHN6nIQWjDpYOFQVHGmD7vMu5F
         c+l0CbkUrvjXyGm2sCzhc1wIhw1Y/K9weEIqTJ/5Lw9/Tx1wNJ2T7lqecvLPawlol3BH
         Fzfw8YA1D6tmA2cx/97Of65wF2HwmbL97ckOGlhU5SU0Vq+y+mltORiuoh9nBlPDRleM
         mZ41M89SQicczF1ZUWC7lWgaRXYmPv7oG749LRwyLW1DfdFo1MZJmxB9mS2Kzb45L0Y+
         hVrd7CSWjiy4Twu1p0bGG6kWEmLpweANZs3pVFwY4NGEoZBBVjdm+CfpE2yxyCUH5YTr
         Mw9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787776069; x=1788380869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWGOH1354ZX/vY0l9xaAPBv85Hq+rgIf24RYb5RW08c=;
        b=h6oyIj26GbmIfCQagr/L5fQJb+1DKw/sinD4UuYVLMxXTInVgjycwM4K3xH5RlKdMH
         eNE+/FsCeFAcHDwdIb49GH6zNKF0wc4zyNYSXpPiwe0HUyhMo/jf5YYPsusQQH0PAh1n
         P2GIwWcjY/6ZD5UxT5xDVX0P7mexxlYBmlkas7MsHb/nLaTEj/GeBg6P0TM1k354aCr8
         CALtJv+9zLGAeL/d4ln4a8ipYN1ekmvMVCgGeUQ9j+fqBFFfcSLKXFl8oKxvEnMcD8kX
         VDw4eK4gQZJq5pOqrqVkVmdSgD0kAE3Y6GDLTf1aKxWk+fk/0hPffS6DfjF52efmj66p
         2dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787776069; x=1788380869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWGOH1354ZX/vY0l9xaAPBv85Hq+rgIf24RYb5RW08c=;
        b=ppblAq1jSd9DPZklnDsF1FZ6Vc1keIJdodXvZbMXUdGgrEcFiwk8I9sDP3iB4MsTdA
         RbNCZvzzVKbuETj/yQnlNmDzcpytFoy12lsAToPYNkr5HJhPZMTrgsYyjorrLgAY+8ql
         cEzRVVqR+xW6Osd3YOh0TMbF1OCGXi2PmiCQTdTP+ZVb7/jK5FtxoHZtReHa7maFw+2L
         MVe7ZYjhqmBX7YEL7+maExPIVU4WjREh2AukjoWUQa4Rz411c4q3DOJb+qR2aiLb/FoZ
         iswKK6+unQog2JJBEKD85S+CSuEgJeHoOebdEXSDjQWtr7KauKQtS9PdkehoZWR5BES+
         GVzA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6tgQIwVCqwb+0Cu0C1qt7gJkxjzGsDfF/tip1d9pS1xCXODAj4AlZos3rQ+I1Y7DRGXKdnyquWyA1JBU=@vger.kernel.org
X-Gm-Message-State: AFuF++kI7BR5C6NA65L37xpJgHFIESDwkUBt/BIDjx7U7EFfTsT1LgpP
	yG+60TA5foHlpHTVmeSPtCYKnXrIj0+4+yi2tWiWQR7Y7YraRyOXyzE4uIFvYlgOgA58ZUt2nqg
	fuIlvo+iCq+KHkJs0zAOA1aCsHE7G7hXqfHRJuK76
X-Gm-Gg: AR+sD12z+p1WUNWN40pJOiKsTLodf0BCSHuQ38LjdQsGlGNuTUKgAhlwxl5F6W+s7rL
	2LkUjXXA26On6x4/8LOy27nJ1oxuy9u5uGgI++aU2I+T5dTBf7YHWS/O5p3lAzs+3ky/Xa5D7Kj
	WrpBouUA4nke2dmHRzMf+wEuNb+Q33guWiuvqrivSQtEf8Gfpn7rk/AbEBy4F3zlTv1wiZFf6kE
	zcpaItEqWvilH3hGIQQilFz53lb26JMH5OfCOaoXDxLwR7EIUJ1ffgkZO17mO215chRJPaPjw3u
	bXxVS9X0/LB3qyl9kqqRgUub1JaR3IfTfy1Sp5gLb75/WA==
X-Received: by 2002:a17:906:2081:b0:c25:2e93:28a6 with SMTP id
 a640c23a62f3a-c252e932fe8mr551532366b.3.1787776068231; Wed, 26 Aug 2026
 13:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821193502.92431-1-vipinsh@google.com> <ao3nr1-t0DxANAyC@google.com>
In-Reply-To: <ao3nr1-t0DxANAyC@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 26 Aug 2026 13:27:20 -0700
X-Gm-Features: AcwNN1VJZs9sa1bllRivEAYyBKhodHBefcR6pQ8bKeL_D0Ssy2tWvugwTys94zA
Message-ID: <CALzav=f5wUUt4mKZn0tvQez6_1iYPcb8eX5q-XjabTNy03JiNg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] vfio: circular locking dependency in pci_dev_reset_iommu_prepare()
To: Vipin Sharma <vipinsh@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Joerg Roedel <joro@8bytes.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	jrhilke@google.com, skhawaja@google.com, tatashin@google.com, 
	Will Deacon <will@kernel.org>, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 12:06=E2=80=AFPM David Matlack <dmatlack@google.com=
> wrote:
>
> On 2026-08-21 12:35 PM, Vipin Sharma wrote:
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > Potential Solutions Suggested by AI
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >
> > 1. Decouple iommu_setup_dma_ops() from group->mutex in drivers/iommu/io=
mmu.c:
> >    iommu_setup_dma_ops() only requires struct device * and the domain p=
ointer
> >    (group->default_domain); it does not mutate any fields in struct iom=
mu_group.
> >    Moving the iommu_setup_dma_ops() calls after mutex_unlock(&group->mu=
tex) in
> >    iommu_probe_device(), bus_iommu_probe(), and iommu_group_store_type(=
) breaks
> >    the initial &group->mutex -> cpu_hotplug_lock dependency.
>
> Are there any other code paths that rely on group->mutex -->
> mm->mmap_lock ordering? If so fixing this one case wouldn't help.
>
> > 2. Avoid holding down_write(&vdev->memory_lock) across pci_try_reset_fu=
nction()
> >    in VFIO:
> >    vfio-pci could zap active BAR mappings under memory_lock and set a s=
tate
> >    flag / disable memory decoding, drop memory_lock before calling
> >    pci_try_reset_function(), and then re-acquire memory_lock to re-enab=
le
> >    memory. While resetting, any concurrent user fault will see the memo=
ry
> >    disabled condition and return VM_FAULT_SIGBUS safely.
>
> This would change the userspace-visible behavior of faulting on a VFIO
> device BAR from "block until reset is done and the succeed" to "fail
> with SIGBUS". And it would allow VFIO to access VFIO device BARs during
> the reset through vfio_pci_core_iowrite*().
>
> But I think we can extend this idea to solve those problems by
> introducing a wait queue for tasks to sit on while a device is being
> reset.
>
> e.g. Something like this (completely untested and partially written by AI=
):
>
> From: David Matlack <dmatlack@google.com>
> Date: Tue, 25 Aug 2026 18:37:52 +0000
> Subject: [PATCH] vfio/pci: Avoid circular locking dependency during devic=
e reset
>
> Avoid a circular locking dependency during VFIO device reset by dropping
> vdev->memory_lock prior to calling PCI reset functions
> (pci_try_reset_function() and pci_reset_bus()). Introduce an explicit res=
et
> state flag (vdev->resetting) and wait queue (vdev->reset_done_wq) to stal=
l
> concurrent BAR page faults and MMIO accesses during reset without holding
> vdev->memory_lock across PCI reset operations.
...

This approach does not look ideal. The implementation has a bug where
concurrent resets can lead to vdev->resetting being cleared too early.
And from a maintainability perspective, there are more call sites that
currently take memory_lock that would probably also have to be updated
to wait for vdev->resetting to become false.

> >
> > 3. Refine synchronization in pci_dev_reset_iommu_prepare():
> >    Evaluate if attaching to the blocking domain and pausing ATS during =
device
> >    reset can be protected using more fine-grained locking or atomic sta=
te
> >    flags without holding the coarse &group->mutex.
>
> I don't know enough about this part of the kernel to say, but this would
> directly address the new lock ordering dependency vdev->memory_lock -->
> group->mutex introduced by commit f5b16b802174 ("PCI: Suspend iommu funct=
ion
> prior to resetting a device"), which is what led to this lockdep error.
