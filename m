Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280891;
	b=eX4yirkkZbsf6JZHYAT5BFcQfix57l++AOC5goIaQ9iI81rBqqcHTaJU9Tcetr6mcyC5
	 DesmVmUUBKxTgHYb52QTq7xfCLBBlPp2D+Q/TAl9BsPKqIV93ec067iJUVHrGjI4FQ3an
	 BEPZBeKGDOR7y/ipivIcfXq+BCIk+Aj2v4j6Tn892iEvVRcyPi0hHzdiSmnrWanqJxMxr
	 PQaRGE+uQYZpqidLPh65KYZibAYl+ZfJLnnGw6UxP3GJdFM7yUgf2FnqtF1NDZk1DcbAM
	 8mLWh1DQGCtheGQuxwsjA3GvhT3PSrp8HxuRsEvnCaMPg8ECMNqlhHdcn6AitJt82rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280891;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YVcuR3dE8fIuUWwIxvchcOUadKxVHUF5SCVKnZ/WJfI=;
	b=4OkwVtbO0HU86uicId/IrRWtIbxJ7IzE6iyMvahoYBKExRnuTQdDQMaEx3N/DDqrrIZJ
	 mdCzU2EH0bYIn+UovO0XBHkrsVnYW6mo55A2mZY0Ju5hPvr2lbDhPcsBlveH4I4ztKB/s
	 qKJkucq8GdIbZOcFamRV0a5s+hSvZIFlSd5qECBOnWBfHV7/02u+1dLnveIUGP4Ytw3TJ
	 N5Z7AGAgRjP8wCGYQ8Ukovu8V2/BFAnGZQDCnJANJo6n+Yl5ckMxjmRgnrsdm+1BOu/JW
	 HqGD5JGx7AaFqM/tgBttWDGzUl4UhqL/+QmOlJO9k7YwJfsJIuehZZTFsp3h2JCkGiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=jG7cqPNm;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCED606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCED606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=jG7cqPNm
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793280886; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=YVcuR3dE8fIuUWwIxvchcOUadKxVHUF5SCVKnZ/WJfI=;
	b=jG7cqPNmLh/0NlJkCKQzX6KYZwDXcHMLsjkxQH1cg8DPNpSsaOh7Jyfr+kAhgL0pKw2HJjONCo4ZhopcsP0pNDRleR/3COx6eM8mxdA1ci4ncAEEc3sRb0QSj3SngHbwbDBQn5RQk1e88GOjKkKUJMsecCBw0aRRKOshmpfwcgY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XDjURmL_1793280883;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDjURmL_1793280883 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 21:34:44 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@nvidia.com
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	gsh517025@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	jroedel@suse.de,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v2 3/4] iommu/riscv: Add guest IMSIC GPA mapping helpers  
Date: Thu, 29 Oct 2026 21:34:42 +0800
Message-Id: <20261029133442.82962-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261027141300.GB2338330@nvidia.com>
References: <20261027141300.GB2338330@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> >His concern seems to be about who owns and maintains these mappings.
>> >When the RISC-V IOMMU driver calls iommu_map directly on a paging
>> >domain managed by iommufd, the mappings are not visible to the domain
>> >owner. This makes it difficult to handle mapping lifetime and
>> >hardware page table replacement correctly.
>> >
>>
>> Hi Shuai,
>>
>> Thanks for the review.
>>
>> Before going further, I want to make sure I answer the actual
>> question. If the concern is about who owns and maintains these
>> mappings, I address that below.
>>
>> The iommu_map() and replace_leaf() calls are not a separate
>> mapping facility added next to the forwarding code. They are
>> two steps in the existing interrupt-forwarding state machine
>> driven from iommu-ir.c:
>>
>>   - first FORWARD:      flat -> MSIPTE written /
>>                         noflat -> S2 PTE installed
>>   - UPDATE_TARGET:      flat -> MSIPTE updated /
>>                         noflat -> replace_leaf()
>>                          (only if the VS-file page moved)
>>   - last unforward:     flat -> MSI table deactivated /
>>                         noflat -> S2 PTE removed
>>
>> So the lifetime of the S2 mapping matches the lifetime of the
>> forwarding session, which is the same rule the MSI page table
>> already follows. The driver is the only layer that sees both
>> the forwarding session (device <-> vCPU) and the paging domain
>> used to translate guest MSI writes, so it is also the only
>> layer that can maintain this mapping.
>>
>> Note that the noflat column of the last row is not in v2: v2
>> only frees the bookkeeping when the domain is torn down. In
>> v3, I revoke the S2 entries both when the last forwarded IRQ
>> in the domain is released and at domain free, so the entry
>> lifetime becomes identical to the MSIPTE lifetime.
>
>The big point is interrupt code has to live in an irq_domain, not in
>the iommu driver, and the IOVA allocator is not part of either irq or
>iommu drivers.
>

Hi Jason,

Thanks, I agree that interrupt routing belongs in irq_domain, and IOVA
allocation belongs in dma-iommu/iommufd, not in the irq or iommu
drivers.

This series does not invent the interrupt-remapping structure; it
builds on Andrew's RISC-V IOMMU irqbypass v3 series:

  https://lore.kernel.org/linux-iommu/20260928143113.49838-1-
  andrew.jones@oss.qualcomm.com/

That series creates a DOMAIN_BUS_MSI_REMAP irq_domain under the MSI
parent, with an irq_chip whose .irq_set_vcpu_affinity is the
forwarding entry point. Our noflat support hooks into the same
callback and does not touch the DMA path in iommu.c.

There is no IOVA allocator involved in the noflat path. The mapped
address is the guest IMSIC GPA, a reserved guest MMIO window, and
what we install is a stage-2 translation from that GPA to the host
VS-file HPA. The IOMMU driver already owns the stage-2 tables for
this domain, so the update happens through the same irq_chip callback
used by the flat MSI case.

If you have a cleaner layering in mind, I'd be happy to discuss it.
For example, should irq_domain own a reserved S2 window and ask the
IOMMU driver for a primitive like "map GPA X to HPA Y in this
domain's S2"?

Thanks,
Fangyu

>So you have to layer this properly if you are going to even attempt
>it. It sounds complicated.
>
>Jason
>
