Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D44302FC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362757; cv=none; b=KmHgosa+eu4d7ao1eby/qh4SwKiLVaxaU/7B1gzpq0i0EOockcgU+fW8lAdw+fP2gpZ8nNTZRR08kUsC1QKMnMZ+MqQR+P1KfzTEl0xlmk8mzA/YC1hcsysJ6qLHshrxPP2fqoAPyQ8xUumXmQJm6Z2BCqpT6JKRo93xP46gdiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362757; c=relaxed/simple;
	bh=4pn8PEDtARUzteaCZc2M2V636q0Tc3MYo4DsXAYTX+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOyXH30xmdELmliqTuts37g977bmKVqdpDrnwwDELRu6wK2PFrVbeBPSzHp6pbbQoH87GVPH9zyzXt8rhJxNH67GOw0YbZdiGuP4P3ZPlvcVR5HGjoz4Lqb3+uv74wXTUZH3rJt07BunNGO+lPTrfUWEyGW4y7Vz5x9TflUPwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B8jH9bye; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B8jH9bye"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so385ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790362755; x=1790967555; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ryWXjYMx77NDaQsPP9QlmEYj6eVxrasAG766hpzWjdA=;
        b=B8jH9byeOlr9pEaRfTGFnzaL9je9oIytbWkr6DjOQiO8b/dUsTUXV8hwuXGzM7bmrD
         CAS8XbsIOxHQSQTL+Q4BDdW+kOgxyLh3seBuXTi0ZxsqDjWhFal1SrGbjaAmIMV2Y7ip
         EGmx31Ik7NeJD4qphGzPoj9cK1c579e60gdTcUoO7p3ZyLb13JRzxunZMeMaUIz5XYMI
         IZC70mpvChev6BaUck6kcdS+jN13I4YlKPgjp4iS7FsdE7mmc/+0JxO/io1sL6u0gg4k
         WZiwbYshd8L5VC7d5c7J8f/jKJKuMymwv+aTluv0jVIWVzC6sp+qWQKTl7KkZMW5nRpd
         bwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790362755; x=1790967555;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ryWXjYMx77NDaQsPP9QlmEYj6eVxrasAG766hpzWjdA=;
        b=hZNcQCo9+Q1yPk0612dl+2l4ALd3jKfhGRCnXXJWMCmD74dYfVQUK2DS5czvQW5bhm
         otjNOu8n6MrK+yKcvWY4VDy5G2i3glMLIMa2wZ8Xpe2vZwxBZU0yGY8rg3okfqpXklwW
         P+d/R8PMnLp3ZDo8TxuYOx3COQMR+4Kkek4wWE1WJ9kMWmyvR6BAMhWoDa0+f7fZoF4m
         lfktKnzVYGwq2DoZY7o+tohLhYP/wBsZaCIEuIwRFhrhBtZvJTcjVxTqxHZ5UY9PrL7Y
         LFcICWhccOeiA5gG6KFu8TyLSduMrsq6WA9HaMqC8cB66VPV9L/3Koa3ivQmHYgSeZzh
         LbvA==
X-Forwarded-Encrypted: i=1; AKwUvBwcrALHrm07WrJu8E0l5lEibHd61vB3fXARQNjfOWomWe4xdU8HutQNxuo2+iSHldOZUxlV2idZLK4sx60=@vger.kernel.org
X-Gm-Message-State: AFuF++meo0WdUOypKydIa564GzSY+p1ZY/PooDPtALi2GPOQ/MNpu9eo
	0idk6FSqj0nhbedmLuwekIzxI1S/tZOWOxMf9ZiNtnr5Xp3e8TklvqKKC3eLdkqrPQ==
X-Gm-Gg: AYBFou3HdqzDtY22hFJ3iymnfZuN/fkPrbFlWa97M2gWW1a2LXdnRYU0cgqAjorny9e
	DsNGj2DF5C2rDiq38b4qJkgevFo9OHxaAvfUCvCmDPSEyV2JiP3dHRFtbCzYopuYZvNjIAYIpp/
	HjO+9MdT05UmvNjXTrNkO/r7u29YDV9L2iQRTyW1q5CDs+mwXUFSk4NiCeEOwXFAOHd/OwWfgAZ
	vutyAiSp4kmP0RUUzGTKxq+igL44mckLjravPmNAxFhZr8CJ+sjNm91Y0jCJQn+pm00EdQfISxW
	I2Q6/LAy7ORYTZbm0p2BZm7n+mC2BuXS3xwBwKwqE3tcxnNmHBknyX57LfGQku8ULJvcZGGIom9
	5jvkPZSDLnCrdeWsqTucq+jm/3h5Ra50XtBhkYZnnpeFUsfJnQC4m71bkLVed/UTgVqLzALuvdm
	rgZT18IuXLiPFKpADQOKzUKQa/w8v7lUxJVNQU9wgkls7k+2HkZ/5AXkXYkSkxvqZ1xwOw4t7wB
	uPjGENDJei28wyoaNYTSzsM4DdsuSHgmhR7YjckM2qCH0oS9QJwR7rZ+3Ey9lu9mSGmFJUYD7Ui
	p04Z
X-Received: by 2002:a17:902:868a:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2dfa649041dmr428155ad.5.1790362754409;
        Fri, 25 Sep 2026 11:59:14 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea18ebb7sm1635695b3a.18.2026.09.25.11.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:59:13 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:59:07 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v9 00/13] PCI: liveupdate: PCI core support for Live
 Update
Message-ID: <aratPy2p33MObulT@google.com>
References: <20260918200640.887030-1-dmatlack@google.com>
 <2e88b92a-d3f2-41f7-bdbe-11fd71690606@linux.dev>
 <CALzav=eJU+fnPr-QN4s7gY_Lj8Pc3T6KXfC9kiQQ=g4rPEDMuA@mail.gmail.com>
 <b1a845c3-3720-4ef6-8c97-8a40ee7bd286@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1a845c3-3720-4ef6-8c97-8a40ee7bd286@linux.dev>

On Thu, Sep 24, 2026 at 09:47:03PM -0700, Zhu Yanjun wrote:
>
>在 2026/9/22 11:53, David Matlack 写道:
>>On Tue, Sep 22, 2026 at 11:36 AM Zhu Yanjun <yanjun.zhu@linux.dev> wrote:
>>>在 2026/9/18 13:06, David Matlack 写道:
>>>>Future Work
>>>>-----------
>>>>
>>>>Following this series, we expect to make further improvements to the PCI
>>>>core support for Live Update:
>>>>
>>>>    - Allow P2P across Live Update by avoiding resizing or moving
>>>>      preserved device BARs and preserving all upstream bridge windows.
>>>>
>>>>    - Support preserving Virtual Functions by preserving SR-IOV
>>>>      configuration on PFs and enumerating VFs after Live Update.
>>>Preserving the PCIe topology, bus numbers, ACS, and Bus Mastering across
>>>kexec is a foundational step for minimizing downtime.
>>>
>>>As we look toward complete end-to-end support for DMA preservation
>>>across Live Update—especially for VFIO device passthrough and dma-buf
>>>sharing scenarios—IOMMU table/domain preservation becomes crucial to
>>>prevent IOMMU page faults when devices continue performing DMA during kexec.
>>>
>>>I would like to ask about the current status and roadmap regarding IOMMU
>>>Live Update / KHO (Kexec Handover) support:
>>>
>>>Is there an ongoing effort or RFC series for IOMMU handover / page-table
>>>preservation currently in development or under discussion?
>>>
>>>How is the coordination between the PCI core Live Update mechanisms and
>>>the IOMMU subsystem being envisioned for preserving IOVA mappings (e.g.,
>>>restoring domains or handing over root tables)?
>>>
>>>Any pointers to active discussion threads, RFCs, or future plans
>>>regarding IOMMU participation in Live Update would be greatly appreciated.
>>The first IOMMU series to support Live update, can be found here:
>>
>>   https://lore.kernel.org/linux-iommu/20260921004834.2601285-1-skhawaja@google.com/
>
>After cloning the source code from samikhawaja/linux, branch 
>iommu/phase1-v5, I tested the VFIO live update functionality in my 
>local KVM environment and encountered the following issue.
>
>When I run the following commands to verify that VFIO live update 
>works correctly, I get the output shown below.
>
>I am currently testing with VFIO v5 and PCI core v9, and I am not sure 
>whether this behavior is expected.
>
>Interestingly, when I revert the following commit:
>
>vfio/pci: Preserve the iommufd state of the vfio cdev
>
>the issue disappears.
>
>Could you please let me know whether this is expected behavior, or 
>whether it indicates a problem with the current VFIO live update 
>implementation?
>
>"
>
>echo "vfio-pci" > /sys/bus/pci/devices/0000:00:04.0/driver_override
>
>echo "0000:00:04.0" > /sys/bus/pci/drivers/vfio-pci/bind
>Preserving device in session
>vfio_pci_liveupdate_kexec_test.c:122: Assertion Failure
>
>  Expression: ret == 0
>  Observed: 0xffffffffffffffea == 0
>  [errno: 22 - Invalid argument]
>"

Hi Yanjun,

Thanks for testing this.

This is expected. With "vfio/pci: Preserve the iommufd state of the vfio
cdev", preserving a vfio cdev depends on the preservation of its
associated iommufd. Since the vfio_pci_liveupdate_kexec_test does not
preserve the associated iommufd, it fails with -EINVAL.

Note that the IOMMU persistence series does not update the
vfio_pci_liveupdate_kexec_test, with those extra bits, as it would
regress after_kexec() part of the test because the retrieval of iommufd
is not supported in phase1.

Please use tools/testing/selftests/iommu/iommufd_liveupdate_kexec_test
added in the last patch of the series, it sets up the iommufd and HWPT
preservation before preserving the vfio cdev.

The wip phase2 can be found here if you are interested.
https://github.com/samikhawaja/linux/tree/iommu/phase2-v1-wip

Thanks,
Sami

>
>Thanks a lot.
>
>Yanjun Zhu
>
>>
>>The IOMMU series builds on top of the PCI core support (this series)
>>and the VFIO series linked further up in the cover letter.
>
>-- 
>Best Regards,
>Yanjun.Zhu
>
