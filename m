Received: from mta1.migadu.com (out-102.mta1.migadu.com [95.215.58.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7146E01D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986564; cv=none; b=LCGxvS3Y7Qas6fariuFgqs1aurw8yyOKZ0/9in1VYsb3oFvXWSNnGtohMrwaf6TCmUcYjByiZC5fZr/96kdmSCLSdcCn3hnokTHKvjfaBmphqiDYYwndtyEfskeknHyZPhCHblwKoWGUr4eJd1jhrtkYIxMc2BO12JYwitEE4Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986564; c=relaxed/simple;
	bh=mRSWnr+OOpF102n8uPqPG+ragjzLlcjBl6k7tY/W1dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNqp5i5PgfQmhNfBzq7QQz6t3zjW4PJ7WH0CS028lL9PfUoKTMJdvX/WgFoMAWb5DJFm6OUCK5IkhZBWzyqdKZxkVA7Na1whcku+L1XGeKRirpKOIEEGT4gLaMDhYvHq1x5xWkJ1pITZlcmZJRFhUyG4x8IEAXnDYE5uKIikCVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p15ilvz9; arc=none smtp.client-ip=95.215.58.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p15ilvz9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mRSWnr+OOpF102n8uPqPG+ragjzLlcjBl6k7tY/W1dE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789986558; v=1; x=1790591358;
 b=p15ilvz9caQovSjp6/c1x4Twv+yxP4bEPVMjdRpz3eDU388u3QAaO/RU0KyXfhrTzaW4icZS
 sZ2WKOnwufbU3OYghTibc7bvUbISTP5ZwopV2Sq1ZeYQIBheu2+WofE11kYqEuGmsYQWyBkySOw
 h3xalsV2F2NqQRB029Bqtzq0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 58aaa6d2d129fc08;
	Mon, 21 Sep 2026 10:29:18 +0000
X-Mizu-Trace-ID: 58aaa6d2d129fc08
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	lance.yang@linux.dev,
	corbet@lwn.net,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hughd@google.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	yintirui@huawei.com,
	dev.jain@arm.com
Subject: Re: [PATCH v8 14/14] mm: thp: always enable mTHP support
Date: Mon, 21 Sep 2026 03:29:12 -0700
Message-ID: <20260921102913.2970139-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 21:45:35 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:

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
>  - Drop the pgtable_has_pmd_leaves() check so that mTHP sizes are
>    considered
>  - Filter out PMD and PUD orders from allowable orders when
>    PMD-sized pages are not supported by the CPU
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>  mm/huge_memory.c | 25 ++++++++++++++++++++-----
>  mm/shmem.c       | 14 +++++++++-----
>  2 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index a06025b87e7c..a2d6de3ea988 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -189,6 +189,15 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  	else
>  		supported_orders = THP_ORDERS_ALL_FILE_DEFAULT;
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
>  	orders &= supported_orders;
>  	if (!orders)
>  		return 0;
> @@ -196,7 +205,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>  	if (!vma->vm_mm)		/* vdso */
>  		return 0;
>  
> -	if (!pgtable_has_pmd_leaves() || vma_thp_disabled(vma, vm_flags, forced_collapse))
> +	if (vma_thp_disabled(vma, vm_flags, forced_collapse))
>  		return 0;
>  
>  	/* khugepaged doesn't collapse DAX vma, but page fault is fine. */
> @@ -979,7 +988,7 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>  	 * disable all other sizes. powerpc's PMD_ORDER isn't a compile-time
>  	 * constant so we have to do this here.
>  	 */
> -	if (!anon_orders_configured)
> +	if (!anon_orders_configured && pgtable_has_pmd_leaves())
>  		huge_anon_orders_inherit = BIT(PMD_ORDER);
>  
>  	*hugepage_kobj = kobject_create_and_add("transparent_hugepage", mm_kobj);
> @@ -1001,6 +1010,15 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>  	}
>  
>  	orders = THP_ORDERS_ALL_ANON | THP_ORDERS_ALL_FILE_DEFAULT;
> +	if (!pgtable_has_pmd_leaves()) {
> +		/*
> +		 * If the CPU does not support PMD leaves, assume for
> +		 * now that it does not support PUD leaves and disable
> +		 * both folio orders.
> +		 */
> +		orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
> +	}
> +
>  	order = highest_order(orders);
>  	while (orders) {
>  		thpsize = thpsize_create(order, *hugepage_kobj);
> @@ -1091,9 +1109,6 @@ static int __init hugepage_init(void)
>  	int err;
>  	struct kobject *hugepage_kobj;
>  
> -	if (!pgtable_has_pmd_leaves())
> -		return -EINVAL;
> -

Removing this guard lets start_stop_khugepaged() run on a system
without PMD leaves. All mTHP orders default to never, but the global always
or madvise flag still makes hugepage_enabled() return true.

That starts an idle khugepaged thread and can unnecessarily raise
min_free_kbytes. Could hugepage_enabled() instead test whether
an enabled order remains after masking PMD_ORDER when
pgtable_has_pmd_leaves() is false?

>  	/*
>  	 * hugepages can't be allocated by the buddy allocator
>  	 */
> diff --git a/mm/shmem.c b/mm/shmem.c
> index bc2de3a7c1ea..8c0f7e3efeeb 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2046,11 +2046,14 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>  	unsigned long mask = READ_ONCE(huge_shmem_orders_always);
>  	unsigned long within_size_orders = READ_ONCE(huge_shmem_orders_within_size);
>  	vm_flags_t vm_flags = vma ? vma->vm_flags : 0;
> -	unsigned int global_orders;
> +	unsigned int global_orders, disabled_orders = 0;
>  
> -	if (!pgtable_has_pmd_leaves() || (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force)))
> +	if (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force))
>  		return 0;
>  
> +	if (!pgtable_has_pmd_leaves())
> +		disabled_orders = BIT(PMD_ORDER);
> +
>  	global_orders = shmem_huge_global_enabled(inode, index, write_end,
>  						  shmem_huge_force, vma, vm_flags);
>  	/*
> @@ -2058,7 +2061,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>  	 * sysfs configs.
>  	 */
>  	if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
> -		return global_orders;
> +		return global_orders & ~disabled_orders;
>  
>  	/*
>  	 * Following the 'deny' semantics of the top level, force the huge
> @@ -2072,7 +2075,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>  	 * means non-PMD sized THP can not override 'huge' mount option now.
>  	 */
>  	if (shmem_huge == SHMEM_HUGE_FORCE)
> -		return READ_ONCE(huge_shmem_orders_inherit);
> +		return READ_ONCE(huge_shmem_orders_inherit) & ~disabled_orders;
>  
>  	/* Allow mTHP that will be fully within i_size. */
>  	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
> @@ -2083,6 +2086,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>  	if (global_orders > 0)
>  		mask |= READ_ONCE(huge_shmem_orders_inherit);
>  
> +	mask &= ~disabled_orders;
>  	return THP_ORDERS_ALL_FILE_DEFAULT & mask;
>  }
>  
> @@ -5630,7 +5634,7 @@ void __init shmem_init(void)
>  	 * Default to setting PMD-sized THP to inherit the global setting and
>  	 * disable all other multi-size THPs.
>  	 */
> -	if (!shmem_orders_configured)
> +	if (!shmem_orders_configured && pgtable_has_pmd_leaves())
>  		huge_shmem_orders_inherit = BIT(HPAGE_PMD_ORDER);
>  #endif
>  	return;
> -- 
> 2.55.0
> 
> 
