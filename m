Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF165447803
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852217; cv=pass; b=rM9qz/Z+3+11/GCH0aU2skOWuIx4pCluIHEY7+pjmkHwbCi5lfNQ1Yd9utFAkF+MJfyPgxNr5MRAz2HwRUXDSETmG+sG7lmASr1Er7bhd4DUWLQbYlOPE/64hUW1ZMrfRLpYnpkUYLXpreF8++RRPCjuFFu6TiB7PuzOp0xR4KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852217; c=relaxed/simple;
	bh=zx9m3UJWLQKbi0/pNDNNX6lZqJj4z+ajiJa/RVGEIzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQRDTf5VB8+g1rWMpWumU/EWhmaflS+RFoBvXuYCoqnpZ6pXmfRrxsOewr84Svohb5U1zE7a0Hbir4DtKbS8nj6sStRi6jUEd7E54yMOibwE0AeQZ6N6kBJk8YHItpAB4NPcVa4VrtLFrt6AOmTBw7Aj4gXvWYuH4SYxYGd3YbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U+xla7h8; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U+xla7h8"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c207cb16cf5so19883466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852214; cv=none;
        d=google.com; s=arc-20260327;
        b=Zhwh1KxDD1QkfI7i6c7fxwijgiy0wLtSwZ1PLCXFNTIcF2v1wqciQS6VwuCZNFiTnc
         r1Q1RCMsw0vQPl40PMf8npBOnjwkKY8j0HF9SdcQUR+nSDq36abzdKy30GoPYpqVwMfW
         xI3NmGaQOFpcy3cuZho1+7daNquPcj7+vTMNp/l+17TNNJQOftyB1xzeLQhL1607PkoA
         XTtSdz45DeT3CbZ/LoXDBMPZisuauANvuMOek//35EIvz/DjMsXGd0bA7TGKDx/Vzsn5
         b2D2bszzlBjaLECoyCy/slzpGHbR2ReUrYHTnFO3rDOFP5f5pgi4epMx3rJoMlNfN9mt
         ZriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cU2IdGj8HYn85rF2dapXdYr5omVVmX8wN53COGpvOpk=;
        fh=cmxL2PK3lXBRwJSDm1EjEjlmRXm0g/m6YZcTOEzhhx0=;
        b=rsXof6BHGVofd77ilDqncFdSV4JbmhCCqDxm/yYAACvDxvW+1oy9CpZgs6vtF8h9+A
         P1SLGETy7xnrzukgj6PJRtE6+ivj5HAWq/9Rs7L6zXcBHjgsF01R5kJbY6lHhMuECNkx
         6TFOCg9rmdtvG7k3ztYr3uSczwWHRblyARb3zQKgqjnS2tAQ/WpLYWXtzIdY3D7p2X0Q
         9BzghkkabZlSPxl6T5alvaXVNlsp5+du3DL06s+U2OQxH74SuMO7T7Bu+byQkKNqhGHq
         lfMSq3H5Cdm+1dOaI0htpUi/eSTDstmhAtMb/MGA+3vy3VrBSD7gS3Epq2cACT9WfUTt
         yFPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787852214; x=1788457014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cU2IdGj8HYn85rF2dapXdYr5omVVmX8wN53COGpvOpk=;
        b=U+xla7h8Ps5Awr0Q4pOzTefLwg0sL6LhPl5rt1akFAS1W5K2Mr66/1cW9oZ63whvHF
         /oFsZbExUUJjfkPTrmY3LjtatTvOBH0B0enpey5hQEkpv++yw4fbLUk7V+Dk3inzOP1w
         0QX1MjO3ITThr8PJg3SZ9Aoh3kPlnGM11iICYIVu7rDnuGkGQau2mn6Mxp0J1A+t6D0o
         Vklsj4LR+LqXoTPtJG5nPlGDlmwDDniLu8YfX532ZeS0XlIiiJXicDjHiII5A0G68dU6
         uqXv0+SDPg2sageLB/Sf3QnMTjfwLV6TTuKBYDC9sw+Qbr48LL5hYMpMJK9SteXlMyjK
         Hd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852214; x=1788457014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cU2IdGj8HYn85rF2dapXdYr5omVVmX8wN53COGpvOpk=;
        b=ThmD6CRVnrd3ABshZZ9YIqvovxCv8jQGPUCfPa73L0J16dJz7Oagx71CKy6XMjnlew
         rJy6kUqxGd+dwaT5EauDSXROz2y/1LZjNXwNVekrdEau2T0VIzfS5YBhxlMuaPKC55m8
         6YtGfQQk6WhHSC1r39mRnZ2dxA9VnUnJNWW9qBLRTzM8XOtKRJ4xv/Nnvbb5xitPP4zI
         EcIMKeT6F5kObcLRSuFMM7fTaZ0T/IaAM2Va6lrzZuKO5s+2gSQlZJ5bEp7H1qm8Rx5C
         HwaEynBrOPWqYb8oFEfaFNeBxR7lluD6nOuGfd2+n7FwL50zrOJF3R4QFvbWWwlC0RNV
         R4Ug==
X-Forwarded-Encrypted: i=1; AHgh+RodTE6wT4z8tGhFC2muzxNfiMoxhr2Tqnr6uBysGiUdLZMF1Xpm6rbJInyAChvlqwj1dPCdf7ZzyT2dra8=@vger.kernel.org
X-Gm-Message-State: AFuF++l6/iCtzhxH0qNpKup2grdcCEInjvnu0GpneAMVWa6r306pWpdv
	04mFVvWAOQj/s/V+nwAanm/xJh+vi4IjMZmHADgVsnq6f5RT8R3QQgA9JKJTSDXp1MKVRtZLmg8
	JBuibuQvW4xrzf4W27V5elGNrPs+qfTWqkURLfgb2
X-Gm-Gg: AR+sD108pW4DLGNjx6p1sxoUz0PBUh5UPz1HyiIzJO7ZYMuNJ/Tczvi50qQAXxBCW8p
	OnSyvCxHQFdYfjm+HEbuIVeAUNaRrKaSp/NqQXQ0YnuaOnFW+v4mdQyGPUOHL4iOK6ajAOw45Ej
	AYwKkhScihiRiWu6I/iNWglbwQeLStyIzbHLoyEQUDkb5HgpVGOL19THgjp7kNqdQujW8DhEOqF
	6woi+Bv3kI7LDkOhovgDe23kbn7VxGJEikE5V5lliYXcUd1RU750PP6RPCt4Fw8WnwW+gaZfkcH
	yT/xgaB1x8hEXPzbD8tpoY0Xxc3nvGrUlGRwCSoCy9p8Kg==
X-Received: by 2002:a17:906:628b:b0:c1f:8021:deef with SMTP id
 a640c23a62f3a-c2556c61defmr29002166b.10.1787852213404; Thu, 27 Aug 2026
 10:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821193502.92431-1-vipinsh@google.com> <ao3nr1-t0DxANAyC@google.com>
 <CALzav=f5wUUt4mKZn0tvQez6_1iYPcb8eX5q-XjabTNy03JiNg@mail.gmail.com>
In-Reply-To: <CALzav=f5wUUt4mKZn0tvQez6_1iYPcb8eX5q-XjabTNy03JiNg@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 27 Aug 2026 10:36:25 -0700
X-Gm-Features: AcwNN1XNPft5Ueou-qlSyAtHB2c_Ktuq8wp3SGgI-T0tZ93zrinbZgmtLF9T5Xs
Message-ID: <CALzav=cEmjnYAZDS8Le_FkaZW1xE+pP1B+mks0Of85YWG-3_vg@mail.gmail.com>
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

On Wed, Aug 26, 2026 at 1:27=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Tue, Aug 25, 2026 at 12:06=E2=80=AFPM David Matlack <dmatlack@google.c=
om> wrote:
> >
> > On 2026-08-21 12:35 PM, Vipin Sharma wrote:
> >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > Potential Solutions Suggested by AI
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > >
> > > 1. Decouple iommu_setup_dma_ops() from group->mutex in drivers/iommu/=
iommu.c:
> > >    iommu_setup_dma_ops() only requires struct device * and the domain=
 pointer
> > >    (group->default_domain); it does not mutate any fields in struct i=
ommu_group.
> > >    Moving the iommu_setup_dma_ops() calls after mutex_unlock(&group->=
mutex) in
> > >    iommu_probe_device(), bus_iommu_probe(), and iommu_group_store_typ=
e() breaks
> > >    the initial &group->mutex -> cpu_hotplug_lock dependency.
> >
> > Are there any other code paths that rely on group->mutex -->
> > mm->mmap_lock ordering? If so fixing this one case wouldn't help.
> >
> > > 2. Avoid holding down_write(&vdev->memory_lock) across pci_try_reset_=
function()
> > >    in VFIO:
> > >    vfio-pci could zap active BAR mappings under memory_lock and set a=
 state
> > >    flag / disable memory decoding, drop memory_lock before calling
> > >    pci_try_reset_function(), and then re-acquire memory_lock to re-en=
able
> > >    memory. While resetting, any concurrent user fault will see the me=
mory
> > >    disabled condition and return VM_FAULT_SIGBUS safely.
> >
> > This would change the userspace-visible behavior of faulting on a VFIO
> > device BAR from "block until reset is done and the succeed" to "fail
> > with SIGBUS". And it would allow VFIO to access VFIO device BARs during
> > the reset through vfio_pci_core_iowrite*().
> >
> > But I think we can extend this idea to solve those problems by
> > introducing a wait queue for tasks to sit on while a device is being
> > reset.
> >
> > e.g. Something like this (completely untested and partially written by =
AI):
> >
> > From: David Matlack <dmatlack@google.com>
> > Date: Tue, 25 Aug 2026 18:37:52 +0000
> > Subject: [PATCH] vfio/pci: Avoid circular locking dependency during dev=
ice reset
> >
> > Avoid a circular locking dependency during VFIO device reset by droppin=
g
> > vdev->memory_lock prior to calling PCI reset functions
> > (pci_try_reset_function() and pci_reset_bus()). Introduce an explicit r=
eset
> > state flag (vdev->resetting) and wait queue (vdev->reset_done_wq) to st=
all
> > concurrent BAR page faults and MMIO accesses during reset without holdi=
ng
> > vdev->memory_lock across PCI reset operations.
> ...
>
> This approach does not look ideal. The implementation has a bug where
> concurrent resets can lead to vdev->resetting being cleared too early.
> And from a maintainability perspective, there are more call sites that
> currently take memory_lock that would probably also have to be updated
> to wait for vdev->resetting to become false.
>
> > >
> > > 3. Refine synchronization in pci_dev_reset_iommu_prepare():
> > >    Evaluate if attaching to the blocking domain and pausing ATS durin=
g device
> > >    reset can be protected using more fine-grained locking or atomic s=
tate
> > >    flags without holding the coarse &group->mutex.
> >
> > I don't know enough about this part of the kernel to say, but this woul=
d
> > directly address the new lock ordering dependency vdev->memory_lock -->
> > group->mutex introduced by commit f5b16b802174 ("PCI: Suspend iommu fun=
ction
> > prior to resetting a device"), which is what led to this lockdep error.

I sent a proposed fix that takes this approach here:

  https://lore.kernel.org/linux-iommu/20260827173511.2322549-1-dmatlack@goo=
gle.com/
