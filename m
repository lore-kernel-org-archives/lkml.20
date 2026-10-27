Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110130;
	b=OsPDwtWUQLAUTdBCQANXlMkZEz8SL0890pwkmILN1SDSM4bR0Ou5EdU0K0uRGmjpeouH
	 37quNauv/V0XBfAEe5HIRC7ZeLByJ5jQ7H8Xxy62LGryITv607OA6fpU5ZPLxPQ1svDSB
	 64Pxbo5JBUXwBwMQoddjQOUuf3jErecs9CaIuXZCMEBBNQMp+vfnZbgHdACSuwmqYhMuG
	 t0oR/rWVtJmiTkhEcW65lCMMeP84XvnMShjvrFSEf4cGuaMkZ9av9++hT4wLmQIjIkv8s
	 0XaX9w/gD3DOowOImH9+mWG/4VZ289haml1eLON2rYj3mISQTDGs3Y78f9x+HzwXxsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110130;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pJDcTOL3vwPjyTTZ32hN77pZkCa+SzNVB78DIO/TIG0=;
	b=xPJcZEJjqqEWj/p9MP8WSGd9Nufxnw2e+/mviQkbH7tyj+YvZ0/jds64lgjztajUk/jY
	 E/AP2CkhPkCECvXCSvHDig8s8vnS81xMcE5lB6p5xe8jc6cBVzYLR97jsiY8AiJ6ZhvW7
	 afFRN4vjjM0MV/e7aqmDlYcHKd9J/IARkBxVl9fKRnF5iNLtls9ID6y5oeZtnhSsN3FUB
	 sAbyDXdn//n8DbakLir1WhnSrDP4J8gRoxCblVfJ+N4ELyxkIJJmbkBwfkPrEpcQD0TBO
	 Yb907ZgwQ6BHIJdwSwzU48Q19HJU88eLZTn6tgSBqnI82kv5g3Ah/joOCz6y8xlmApA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="H/BZTSpt";
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB804606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB804606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=H/BZTSpt
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793110124; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=pJDcTOL3vwPjyTTZ32hN77pZkCa+SzNVB78DIO/TIG0=;
	b=H/BZTSptoUgDinYmUHQrchSEoEVA1mMub92K1HGKkXPC4rX6mlZTTOY1vcG8pRf0Ib0DKCgrUd+TgeEMBKGCfySd2FkNtLcNMalgMlZXOVqpJn0HQBsd66D1WzklFpgJnylY/IgE2iCsRzZ3ti5LaCvMxH246c3wOnJKE4rtHbY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XDe7Dwu_1793110121;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDe7Dwu_1793110121 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 22:08:42 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	gsh517025@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
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
Date: Tue, 27 Oct 2026 22:08:37 +0800
Message-Id: <20261027140837.84112-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261026080604.184574-1-gong.shuai@sanechips.com.cn>
References: <20261026080604.184574-1-gong.shuai@sanechips.com.cn>
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

>Hi Fangyu,
>
>> >Andrew has moved well past a v3
>> >
>> >I shouldn't be seeing code in iommu or irq drivers directly mapping into
>> >domains. That doesn't work, Andrew's latest series don't do this.
>> >
>> >It still needs to use the SW_MSI mechanism and related.
>> >
>>
>> Andrew has posted two patch series in the community: one is the
>> MSI remap v6 series[1], and another is the IRQ bypass v3 series[2].
>> I think you are referring to the MSI remap v6 series. My patch was
>> based on the IRQ bypass v3 series, and I added this patch on top
>> of it.
>>
>> [1] https://lore.kernel.org/linux-iommu/179209292714.4133959.5997128071302263244.b4-review@b4/T/#t
>> [2] https://lore.kernel.org/linux-riscv/20260928143113.49838-1-andrew.jones@oss.qualcomm.com/
>>
>> >Nothing in the commit messages clearly explained what this is actually for
>> >without having to go dig up the riscv manuals again. Please explain how the
>> >interrupt translation works and what actual user visible problem this is
>> >trying to solve is.
>> >
>>
>> The interrupt translation is based on Andrew's irq bypass patch
>> description.
>>
>> RISC-V IOMMU defines an optional MSI page table feature, which can
>> be used to implement irq bypass by translating the vIMSIC GPA to
>> the pIMSIC HPA.
>>
>> My patch complements that design. If the RISC-V IOMMU hardware does
>> not implement the MSI page table, then the second-stage page table
>> can be used instead to map vIMSIC GPA to pIMSIC HPA.
>
>Using the regular stage-2 page table to translate MSI target
>addresses seems reasonable to me as a fallback for hardware without
>MSI_FLAT.
>
>I would like to share my personal understanding of Jason's review.
>Please correct me if I missed his point.
>
>His concern seems to be about who owns and maintains these mappings.
>When the RISC-V IOMMU driver calls iommu_map directly on a paging
>domain managed by iommufd, the mappings are not visible to the domain
>owner. This makes it difficult to handle mapping lifetime and
>hardware page table replacement correctly.
>

Hi Shuai,

Thanks for the review.

Before going further, I want to make sure I answer the actual
question. If the concern is about who owns and maintains these
mappings, I address that below.

The iommu_map() and replace_leaf() calls are not a separate
mapping facility added next to the forwarding code. They are
two steps in the existing interrupt-forwarding state machine
driven from iommu-ir.c:

  - first FORWARD:      flat -> MSIPTE written /
                        noflat -> S2 PTE installed
  - UPDATE_TARGET:      flat -> MSIPTE updated /
                        noflat -> replace_leaf()
                         (only if the VS-file page moved)
  - last unforward:     flat -> MSI table deactivated /
                        noflat -> S2 PTE removed

So the lifetime of the S2 mapping matches the lifetime of the
forwarding session, which is the same rule the MSI page table
already follows. The driver is the only layer that sees both
the forwarding session (device <-> vCPU) and the paging domain
used to translate guest MSI writes, so it is also the only
layer that can maintain this mapping.

Note that the noflat column of the last row is not in v2: v2
only frees the bookkeeping when the domain is torn down. In
v3, I revoke the S2 entries both when the last forwarded IRQ
in the domain is released and at domain free, so the entry
lifetime becomes identical to the MSIPTE lifetime.

Thanks,
Fangyu

>The current SW_MSI support does not appear to cover this use case
>directly. It allocates IOVAs for host MSI pages and records the
>resulting mappings. Guest forwarding instead requires mappings at
>fixed guest GPAs, with their target HPAs changing when vCPUs migrate.
>Supporting this through SW_MSI would therefore seem to require a
>nontrivial extension.
>
>Best regards,
>Shuai
>
>>
>> Thanks,
>> Fangyu
>>
>> >--
>> >Jason
>>
