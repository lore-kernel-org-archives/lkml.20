Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACE73385A7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853803; cv=none; b=mw3KBY9pdz397vzmEvRfsLpVFglnncgfI+aK9t3dxqy8sWZDUsuWL2MZ0pkOtRS/lCk3GYOADd204Oc7yNvU7si2Zrqnxow5jFsh7bNlqNj0zpYOTla3Ju1BUqkNJt/QEOMLA9vkar1pbv2/92vb/hZpwIAzMgmD5fWUlnBv41s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853803; c=relaxed/simple;
	bh=aVJvper34EDrUAZdd4lOfHj1wCc4uQDuLNlXgq1p1YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCftx8qJqz5ROBUzXLq9OmauA/jRYEYTSevvjxqS4PZDpgKGtgRG+HGa0I5RtA8rXsJ+YGYXd87R5T7GYX3aLlEEtZpXhaLaBVHYi5J0dQkiyIlgqQrT1TveFwkC69rppbK+sC+1PVZ2Qx2Q50kOAkDpjd4Bttt/HxsxIMi0+Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bqa79GVU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bqa79GVU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cede6375caso14635ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787853801; x=1788458601; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KoGSjfHeCXk5ZMZawIjFrD2nA/EHJWwuQY/vd3YWCZ4=;
        b=Bqa79GVUVZJc0oroeM3AzdPpJtHhs/mwHewHAduY4gHIDgkKtR2k/3ddHratw1HBEG
         Vq3zGH2ZX/RVdNd+UnMBwgcXUaiOxYcB9BZ0IyPUoQJ7GZq7vKezITaTgjeUmX5JBgfJ
         /bP7jDiI005+pXBl05eUtrrxwkzQlje/NUedUcXi81pQfP+vqT8ONA/3RheQ1+7EZlCD
         rhUvjC7vuox2dgeyODGH/EspWiSnShrEFB5zDdcaUggUVbdLAWAny3OQ6HDXZP/cwW0c
         gb/pDPsJTjdB02SoN3WKXzbxPD0CFnSEtLzcGgCyUGaEow+9zJc1TmOLaZttfqv6ADuY
         Z14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853801; x=1788458601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KoGSjfHeCXk5ZMZawIjFrD2nA/EHJWwuQY/vd3YWCZ4=;
        b=qSIyG1JPWwYLJuOWqzLmTrTEg8M/uRRo9LxQqrJbEWr0lDd/Oqr8qco2/kDpgP9hEn
         af6C0FRUTcxDeXskmNkgy/BWPKl3tx/eWdHHRrfhLCAqYyiJMBgMr0v0NzqJ6X41n2m7
         SNpfeB26bM15jF7T7V5FE9ujVAGCy68UPX3WOi+8wnXVv1UAM3yIUE1A5exgkngcQ0E7
         M2WpzCOFSwTtZ3L3M4XLnfiZPpBmKsSNPvEQUEvEJsRIXJ1DDqscwNfpB1LdZebf7Pwy
         IeTp3GpenhnfSIT9R/8SMynC2JwXrkpC9WPl/fENs/ZknS7XgmGqmuIinTw93IYxTgcv
         RPSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBijQO64Sgxtj1BvHAn+tN73CBH/uzqrw7ysf2Tui7yR17dDvbidyxcToZ9+edXRlxYQH8cqB4eSodk88=@vger.kernel.org
X-Gm-Message-State: AFuF++mhggVIT8UBmU+1CxLEUWpI9nquFdo2OzrDR952Tdm90mutmOE9
	Jzwm+pc1fDHoUD5drr6YgDCiD/Iv44o13CrOSAPU9Yof+FD9qj4s+5iu0cvby0zTeA==
X-Gm-Gg: AR+sD115s5y3/BO/XPsRULIPavuSGyf5cTJWTA/T6a5pRg6ZqdfDi8t+LPOR5fP/kMC
	UrRMewITI/nCQRyt/Dj2oac8M5lx3DzfBe8loij2IOe5v/EFnrlIK1/E3qb6Y5Qf47iRxSAA+pb
	orJeAoE5Xi3MxVmPjz3d2SYuvu8hTkRbR5vJPJgSqnylq469A/85WSmzDGQDXQfACN5+XxDfdcS
	4+Wbh0I66k2uVuY0A3prc3FXxTUPP26VtAZKLMqY6pY7tGwrrdc6oSFqjfftk0toc4yoo9y9KQs
	rxMII8ANbyfpvFS4CWhIEajmvCqz1b1wU6B6yRfVIrRbyAFYUYBnz4XbcPyRi3uGp5t6xqpcTCb
	Ds3l/S6cwkO284HjAKZZaqSgNOVH6NcFmhjmgBC+/qrnGy7aUizlVJYM5C1YeALBlWVCuz1Oi0i
	SNYYf5p6ep4LiqcbB2grBjxjHCAnIQCaNhvykPncQHB/7kAlT00lXdT5g+aIhykiwHy88JO4+sI
	kWem5XtHiIFCt0+HQAjc8L2hjzsrQsNet4hl6em1Ost6WtE8iyidQRkiYA=
X-Received: by 2002:a17:903:8c5:b0:2d5:db3d:1a44 with SMTP id d9443c01a7336-2d74f6efb5bmr432895ad.17.1787853800262;
        Thu, 27 Aug 2026 11:03:20 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39675867f73sm3108022a91.4.2026.08.27.11.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:03:19 -0700 (PDT)
Date: Thu, 27 Aug 2026 18:03:15 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, Alex Williamson <alex@shazbot.org>, 
	Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Robin Murphy <robin.murphy@arm.com>, jrhilke@google.com, 
	tatashin@google.com, Will Deacon <will@kernel.org>, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] vfio: circular locking dependency in
 pci_dev_reset_iommu_prepare()
Message-ID: <apB6tsN6cHz9Iuv3@google.com>
References: <20260821193502.92431-1-vipinsh@google.com>
 <ao3nr1-t0DxANAyC@google.com>
 <CALzav=f5wUUt4mKZn0tvQez6_1iYPcb8eX5q-XjabTNy03JiNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=f5wUUt4mKZn0tvQez6_1iYPcb8eX5q-XjabTNy03JiNg@mail.gmail.com>

On Wed, Aug 26, 2026 at 01:27:20PM -0700, David Matlack wrote:
>On Tue, Aug 25, 2026 at 12:06 PM David Matlack <dmatlack@google.com> wrote:
>>
>> On 2026-08-21 12:35 PM, Vipin Sharma wrote:
>>
>> > ================================================================================
>> > Potential Solutions Suggested by AI
>> > ================================================================================
>> >
>> > 1. Decouple iommu_setup_dma_ops() from group->mutex in drivers/iommu/iommu.c:
>> >    iommu_setup_dma_ops() only requires struct device * and the domain pointer
>> >    (group->default_domain); it does not mutate any fields in struct iommu_group.
>> >    Moving the iommu_setup_dma_ops() calls after mutex_unlock(&group->mutex) in
>> >    iommu_probe_device(), bus_iommu_probe(), and iommu_group_store_type() breaks
>> >    the initial &group->mutex -> cpu_hotplug_lock dependency.

The group->mutex is needed here also since it sets up the dma_ops on the
default_domain that is currently attached to the device. And those
attachments are protected with group->mutex.
>>
>> Are there any other code paths that rely on group->mutex -->
>> mm->mmap_lock ordering? If so fixing this one case wouldn't help.
>>
>> > 2. Avoid holding down_write(&vdev->memory_lock) across pci_try_reset_function()
>> >    in VFIO:
>> >    vfio-pci could zap active BAR mappings under memory_lock and set a state
>> >    flag / disable memory decoding, drop memory_lock before calling
>> >    pci_try_reset_function(), and then re-acquire memory_lock to re-enable
>> >    memory. While resetting, any concurrent user fault will see the memory
>> >    disabled condition and return VM_FAULT_SIGBUS safely.
>>
>> This would change the userspace-visible behavior of faulting on a VFIO
>> device BAR from "block until reset is done and the succeed" to "fail
>> with SIGBUS". And it would allow VFIO to access VFIO device BARs during
>> the reset through vfio_pci_core_iowrite*().
>>
>> But I think we can extend this idea to solve those problems by
>> introducing a wait queue for tasks to sit on while a device is being
>> reset.
>>
>> e.g. Something like this (completely untested and partially written by AI):
>>
>> From: David Matlack <dmatlack@google.com>
>> Date: Tue, 25 Aug 2026 18:37:52 +0000
>> Subject: [PATCH] vfio/pci: Avoid circular locking dependency during device reset
>>
>> Avoid a circular locking dependency during VFIO device reset by dropping
>> vdev->memory_lock prior to calling PCI reset functions
>> (pci_try_reset_function() and pci_reset_bus()). Introduce an explicit reset
>> state flag (vdev->resetting) and wait queue (vdev->reset_done_wq) to stall
>> concurrent BAR page faults and MMIO accesses during reset without holding
>> vdev->memory_lock across PCI reset operations.
>...
>
>This approach does not look ideal. The implementation has a bug where
>concurrent resets can lead to vdev->resetting being cleared too early.
>And from a maintainability perspective, there are more call sites that
>currently take memory_lock that would probably also have to be updated
>to wait for vdev->resetting to become false.
>
>> >
>> > 3. Refine synchronization in pci_dev_reset_iommu_prepare():
>> >    Evaluate if attaching to the blocking domain and pausing ATS during device
>> >    reset can be protected using more fine-grained locking or atomic state
>> >    flags without holding the coarse &group->mutex.

This might not work as reset_iommu_prepare() changes the domain of the
device being reset and those things protected by the group->mutex.
>>
>> I don't know enough about this part of the kernel to say, but this would
>> directly address the new lock ordering dependency vdev->memory_lock -->
>> group->mutex introduced by commit f5b16b802174 ("PCI: Suspend iommu function
>> prior to resetting a device"), which is what led to this lockdep error.

Thanks,
Sami
