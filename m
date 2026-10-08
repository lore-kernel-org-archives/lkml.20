Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588CB1E520A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425290; cv=none; b=huIDatPc5XL7ZgEdGhKCSckp1iKhpG+YhS/SC/mI3ptVMzWPktDMkNTjqp63A634HaEekGmtAwA23SgolEIMTNfKq4Cktwv6a26tQVqmDSq125THMb2eZCMZitRR2yQAsN2u9wNd9mnM/L67M6VfMY7IY997yRs2qMWME3Fyw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425290; c=relaxed/simple;
	bh=vqTFX+JYbuXr/EHlmJH8RY0+qPOMgiNPl66ttW+XRbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ABITBOhLwKPf2+4NYcouu5HlwV/19ledNgAKQHPl5owrgVd7b//VD+my93hp4RTwn3Vgsv1/Vv/XNAtiHFQndyYsLMz336qDb6j7F2QvSHCI+G0oM73VxoC/Iz5WKQnLQm97AUU1KKwjGAEgSmAE3wJcRtu8sK5GUvU7C1YavN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=f+CUJzz8; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="f+CUJzz8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791425279; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ODRL+vWaVDz42U2hwyZZZW2Lci6L6eJHWxbCTbwo0Bg=;
	b=f+CUJzz8a3do2c6s9gQaX44Cbq47dj+lZ+S5rnwXzVNMHy2+wntTYpt+2zr2llr7uDnooGTSV1EluEwsZATJuuH3s3fVjHQ52nOe3L/A2w34P/mgMkvwRrC3f5YkkI/ZzJSo91CSJuAB029xoubOPxbl9kgf5oet6hgbmOAcTyE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XCIdo11_1791425276;
Received: from 30.74.144.149(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCIdo11_1791425276 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Oct 2026 10:07:57 +0800
Message-ID: <4db5fdee-4bca-43bf-8ded-2fd8808ac289@linux.alibaba.com>
Date: Thu, 8 Oct 2026 10:07:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/14] mm: thp: always enable mTHP support
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, david@kernel.org, ziy@nvidia.com, lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/18/26 9:45 AM, Luiz Capitulino wrote:
> If PMD-sized pages are not supported on an architecture (ie. the
> arch implements arch_has_pmd_leaves() and it returns false) then the
> current code disables all THP, including mTHP.
> 
> This commit fixes this by allowing mTHP to be always enabled for all
> archs. When PMD-sized pages are not supported, its sysfs entry won't be
> created and their mapping will be disallowed at page-fault time.
> 
> Similarly, this commit implements the following changes for shmem in
> shmem_allowable_huge_orders():
> 
>   - Drop the pgtable_has_pmd_leaves() check so that mTHP sizes are
>     considered
>   - Filter out PMD and PUD orders from allowable orders when
>     PMD-sized pages are not supported by the CPU
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>   mm/huge_memory.c | 25 ++++++++++++++++++++-----
>   mm/shmem.c       | 14 +++++++++-----
>   2 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index a06025b87e7c..a2d6de3ea988 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -189,6 +189,15 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>   	else
>   		supported_orders = THP_ORDERS_ALL_FILE_DEFAULT;
>   
> +	if (!pgtable_has_pmd_leaves()) {
> +		/*
> +		 * If the CPU does not support PMD leaves, assume for
> +		 * now that it does not support PUD leaves and disable
> +		 * both folio orders.
> +		 */
> +		supported_orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
> +	}
> +
>   	orders &= supported_orders;
>   	if (!orders)
>   		return 0;
> @@ -196,7 +205,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>   	if (!vma->vm_mm)		/* vdso */
>   		return 0;
>   
> -	if (!pgtable_has_pmd_leaves() || vma_thp_disabled(vma, vm_flags, forced_collapse))
> +	if (vma_thp_disabled(vma, vm_flags, forced_collapse))
>   		return 0;
>   
>   	/* khugepaged doesn't collapse DAX vma, but page fault is fine. */
> @@ -979,7 +988,7 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>   	 * disable all other sizes. powerpc's PMD_ORDER isn't a compile-time
>   	 * constant so we have to do this here.
>   	 */
> -	if (!anon_orders_configured)
> +	if (!anon_orders_configured && pgtable_has_pmd_leaves())
>   		huge_anon_orders_inherit = BIT(PMD_ORDER);
>   
>   	*hugepage_kobj = kobject_create_and_add("transparent_hugepage", mm_kobj);
> @@ -1001,6 +1010,15 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>   	}
>   
>   	orders = THP_ORDERS_ALL_ANON | THP_ORDERS_ALL_FILE_DEFAULT;
> +	if (!pgtable_has_pmd_leaves()) {
> +		/*
> +		 * If the CPU does not support PMD leaves, assume for
> +		 * now that it does not support PUD leaves and disable
> +		 * both folio orders.
> +		 */
> +		orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
> +	}
> +
>   	order = highest_order(orders);
>   	while (orders) {
>   		thpsize = thpsize_create(order, *hugepage_kobj);
> @@ -1091,9 +1109,6 @@ static int __init hugepage_init(void)
>   	int err;
>   	struct kobject *hugepage_kobj;
>   
> -	if (!pgtable_has_pmd_leaves())
> -		return -EINVAL;
> -
>   	/*
>   	 * hugepages can't be allocated by the buddy allocator
>   	 */
> diff --git a/mm/shmem.c b/mm/shmem.c
> index bc2de3a7c1ea..8c0f7e3efeeb 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2046,11 +2046,14 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>   	unsigned long mask = READ_ONCE(huge_shmem_orders_always);
>   	unsigned long within_size_orders = READ_ONCE(huge_shmem_orders_within_size);
>   	vm_flags_t vm_flags = vma ? vma->vm_flags : 0;
> -	unsigned int global_orders;
> +	unsigned int global_orders, disabled_orders = 0;
>   
> -	if (!pgtable_has_pmd_leaves() || (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force)))
> +	if (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force))
>   		return 0;
>   
> +	if (!pgtable_has_pmd_leaves())
> +		disabled_orders = BIT(PMD_ORDER);
> +
>   	global_orders = shmem_huge_global_enabled(inode, index, write_end,
>   						  shmem_huge_force, vma, vm_flags);
>   	/*
> @@ -2058,7 +2061,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>   	 * sysfs configs.
>   	 */
>   	if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
> -		return global_orders;
> +		return global_orders & ~disabled_orders;

If you move the 'disabled_orders' filtering logic into 
shmem_huge_global_enabled(), as I mentioned in patch 8, then this change 
can be removed.

>   	/*
>   	 * Following the 'deny' semantics of the top level, force the huge
> @@ -2072,7 +2075,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>   	 * means non-PMD sized THP can not override 'huge' mount option now.
>   	 */
>   	if (shmem_huge == SHMEM_HUGE_FORCE)
> -		return READ_ONCE(huge_shmem_orders_inherit);
> +		return READ_ONCE(huge_shmem_orders_inherit) & ~disabled_orders;

Since you've already disabled PMD-sized and PUD-sized orders for the 
'shmem_enabled' interface in hugepage_init_sysfs(), this change can also 
be dropped.

>   	/* Allow mTHP that will be fully within i_size. */
>   	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
> @@ -2083,6 +2086,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>   	if (global_orders > 0)
>   		mask |= READ_ONCE(huge_shmem_orders_inherit);
>   
> +	mask &= ~disabled_orders;

Ditto.

>   	return THP_ORDERS_ALL_FILE_DEFAULT & mask;
>   }
