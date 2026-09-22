Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740C20459A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042784; cv=none; b=IpliVkAI5jy8MHPKd0989CT6y5F7IoMKZ7if3+de3gSL1aOEU47CcBIN19qBGaVKoalhJrOS2B60Kesu66x+7HMzkQE9H6divmB9DAEam2zdmgHM2hy0n/kmYTYCl/1zmUjrAOU6OBI2R1jlJ9mqhXZnXgq/QF00tcAbz2pBc7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042784; c=relaxed/simple;
	bh=9fpFhgwL3WUgIFn2zNBYCGulft4dWnP8bOvmZYj5Szk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uA3bSrOlpceGAiaZ+HbPluUTwINmDN6ZW/HjgeSXXJemdrwuFvQX5fxPHDQGyMFe3JH+QzQKc4LUQPfCpKZ8ECRwtO6re7yb/3eX4Dby0M2SK2L/9dsElmCVd2A/7w7TpP8C8YpKkc3OH6U0hKTjvY46l6uXEK7P5xDSVe5wAAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LN98Ar1m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LN98Ar1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790042780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZuDGqAfKWPU0et9rTdG+QCDRw+fAuzKjDCCj1PDWnM=;
	b=LN98Ar1mge7h9GxLbx/YwXn2I+Wy3AGHyeN1RzOzyQ/8F6fCW//vbu49MJNXimN7jLcEOI
	BLR0bbXPEHDPEci3mQ569yI29z7oddASTLuiTlQl0EK2t2I5HNMuZxwtih5YPKS6b6vPic
	FFLj2k6giaAV+cmAATrRx5YQ6TLYXXE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-Qc0WvMcyP4KNn1-Ai7GZiA-1; Mon, 21 Sep 2026 22:06:18 -0400
X-MC-Unique: Qc0WvMcyP4KNn1-Ai7GZiA-1
X-Mimecast-MFC-AGG-ID: Qc0WvMcyP4KNn1-Ai7GZiA_1790042778
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91213a1aa68so58012686d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042778; x=1790647578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZuDGqAfKWPU0et9rTdG+QCDRw+fAuzKjDCCj1PDWnM=;
        b=uo7f7rBNNtFYUjRounE7C/lVLImDblfUpFbxckCM98o5K8fhE/x+8u+eGhZo9D7SIl
         DmpdJIy4WA3jObp1yQ1gamNQMXG6knhKg+bZt+XpPrAZghg0e/a9m2flTDp7GalxLYA9
         ROy/PRKw/o/9MmShTWTNz+uD14KlkrCc/G3/Yhu+sFE0pRwTN9SKMlTvHQvjPxX1xJEO
         nwb1+4wIRUrFEiR54NWE6kdZcLq3cexejpkadZ+0zrAcOLsCOVQNzpQVh1fYLZCysZ7B
         m+wDAfJ1iMT4szMkxzgx04sipE4WvlCGjPCnKxCZYbDfPRkD9/TcGREtsMP11kdrAP5g
         nljQ==
X-Gm-Message-State: AFuF++nwkP4+PafTbnxKNqhblzOB3s8VtQhlFgC4xavJVZU3kN+Vtq5e
	uP/WvPSXjoK2bVKtOlR5E1WmPKyLRkOMTarpQRztf6AiN5QoGFtQKxdztI00TlLodJc1vARugmT
	HxPJ0P1neIQ3LQWU4JAB4WLfsbNmeaM7UQTrrZWoDH1IadoOsL+ar1zwoZ+1rFd6p0qFnMkhN7J
	T9aU8=
X-Gm-Gg: AYBFou3D2fwsaGRjfNh7ddWqeF2i22L8xBbuhwwjpisnCz9uFrddf7/+XTwpsapYo1r
	e51iLYsQxbQit8LBRpGhC1JpFTF+N7J56z5l6PdpdVYgzUPhaYN3WizpfNATlNeo9HfYIeDRdA9
	zd2jPKR2ZoL2SvCe0ht6V39vVjFoqEn7ey7nPn+9NMS3EzCRco8/P21bxsNcEVPTeAM8oHm3VwP
	Glo/xuZUQyXndBE3PjR3bhjyWPy31u/ZHnFo7KbQdxHXYj5/827WO47TkOQdr0SYQflepV3hytM
	MVLvhBDUFyM7ySTcgGLUPXFXAoaSdoWx2EmkDp8uQVBTHxy4w/9nGRLdpJPD+WRyn3epRT8I21j
	yXqE=
X-Received: by 2002:a05:622a:1aaa:b0:532:9adc:639f with SMTP id d75a77b69052e-532d8e70943mr34418181cf.67.1790042777973;
        Mon, 21 Sep 2026 19:06:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1aaa:b0:532:9adc:639f with SMTP id d75a77b69052e-532d8e70943mr34417901cf.67.1790042777511;
        Mon, 21 Sep 2026 19:06:17 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e188cef8sm1366671cf.8.2026.09.21.19.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 19:06:17 -0700 (PDT)
Message-ID: <3772f64c-de5f-40b3-914d-48f5e0b0a72a@redhat.com>
Date: Mon, 21 Sep 2026 22:06:15 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/14] mm: thp: always enable mTHP support
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org,
 baolin.wang@linux.alibaba.com, ziy@nvidia.com, lance.yang@linux.dev,
 corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com
References: <20260921102913.2970139-1-usama.arif@linux.dev>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260921102913.2970139-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/26 6:29 AM, Usama Arif wrote:
> On Thu, 17 Sep 2026 21:45:35 -0400 Luiz Capitulino <luizcap@redhat.com> wrote:
> 
>> If PMD-sized pages are not supported on an architecture (ie. the
>> arch implements arch_has_pmd_leaves() and it returns false) then the
>> current code disables all THP, including mTHP.
>>
>> This commit fixes this by allowing mTHP to be always enabled for all
>> archs. When PMD-sized pages are not supported, its sysfs entry won't be
>> created and their mapping will be disallowed at page-fault time.
>>
>> Similarly, this commit implements the following changes for shmem in
>> shmem_allowable_huge_orders():
>>
>>   - Drop the pgtable_has_pmd_leaves() check so that mTHP sizes are
>>     considered
>>   - Filter out PMD and PUD orders from allowable orders when
>>     PMD-sized pages are not supported by the CPU
>>
>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>> ---
>>   mm/huge_memory.c | 25 ++++++++++++++++++++-----
>>   mm/shmem.c       | 14 +++++++++-----
>>   2 files changed, 29 insertions(+), 10 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index a06025b87e7c..a2d6de3ea988 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -189,6 +189,15 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>   	else
>>   		supported_orders = THP_ORDERS_ALL_FILE_DEFAULT;
>>   
>> +	if (!pgtable_has_pmd_leaves()) {
>> +		/*
>> +		 * If the CPU does not support PMD leaves, assume for
>> +		 * now that it does not support PUD leaves and disable
>> +		 * both folio orders.
>> +		 */
>> +		supported_orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
>> +	}
>> +
>>   	orders &= supported_orders;
>>   	if (!orders)
>>   		return 0;
>> @@ -196,7 +205,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>   	if (!vma->vm_mm)		/* vdso */
>>   		return 0;
>>   
>> -	if (!pgtable_has_pmd_leaves() || vma_thp_disabled(vma, vm_flags, forced_collapse))
>> +	if (vma_thp_disabled(vma, vm_flags, forced_collapse))
>>   		return 0;
>>   
>>   	/* khugepaged doesn't collapse DAX vma, but page fault is fine. */
>> @@ -979,7 +988,7 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>>   	 * disable all other sizes. powerpc's PMD_ORDER isn't a compile-time
>>   	 * constant so we have to do this here.
>>   	 */
>> -	if (!anon_orders_configured)
>> +	if (!anon_orders_configured && pgtable_has_pmd_leaves())
>>   		huge_anon_orders_inherit = BIT(PMD_ORDER);
>>   
>>   	*hugepage_kobj = kobject_create_and_add("transparent_hugepage", mm_kobj);
>> @@ -1001,6 +1010,15 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>>   	}
>>   
>>   	orders = THP_ORDERS_ALL_ANON | THP_ORDERS_ALL_FILE_DEFAULT;
>> +	if (!pgtable_has_pmd_leaves()) {
>> +		/*
>> +		 * If the CPU does not support PMD leaves, assume for
>> +		 * now that it does not support PUD leaves and disable
>> +		 * both folio orders.
>> +		 */
>> +		orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
>> +	}
>> +
>>   	order = highest_order(orders);
>>   	while (orders) {
>>   		thpsize = thpsize_create(order, *hugepage_kobj);
>> @@ -1091,9 +1109,6 @@ static int __init hugepage_init(void)
>>   	int err;
>>   	struct kobject *hugepage_kobj;
>>   
>> -	if (!pgtable_has_pmd_leaves())
>> -		return -EINVAL;
>> -
> 
> Removing this guard lets start_stop_khugepaged() run on a system
> without PMD leaves. All mTHP orders default to never, but the global always
> or madvise flag still makes hugepage_enabled() return true.
> 
> That starts an idle khugepaged thread and can unnecessarily raise
> min_free_kbytes. Could hugepage_enabled() instead test whether
> an enabled order remains after masking PMD_ORDER when
> pgtable_has_pmd_leaves() is false?

You're right about the issue. Before this series, checking the global
configuration was sufficient to determine if THP was "enabled" as PMD
leaves would always be available (otherwise THP would be shut down).
With this series, we also need to check pgtable_has_pmd_leaves().

I prefer the simple fix below over masking orders in hugepage_enabled():
it's simple and adds the check only in the call site that requires it.

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a3a9e4d93b46..175252a1d729 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -453,7 +453,7 @@ static bool hugepage_enabled(void)
  	 * Shmem pmd-sized hugepages are also determined by its pmd-size control,
  	 * except when the global shmem_huge is set to SHMEM_HUGE_DENY.
  	 */
-	if (hugepage_global_enabled())
+	if (hugepage_global_enabled() && pgtable_has_pmd_leaves())
  		return true;
  	if (anon_hpage_enabled())
  		return true;

> 
>>   	/*
>>   	 * hugepages can't be allocated by the buddy allocator
>>   	 */
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index bc2de3a7c1ea..8c0f7e3efeeb 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -2046,11 +2046,14 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>   	unsigned long mask = READ_ONCE(huge_shmem_orders_always);
>>   	unsigned long within_size_orders = READ_ONCE(huge_shmem_orders_within_size);
>>   	vm_flags_t vm_flags = vma ? vma->vm_flags : 0;
>> -	unsigned int global_orders;
>> +	unsigned int global_orders, disabled_orders = 0;
>>   
>> -	if (!pgtable_has_pmd_leaves() || (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force)))
>> +	if (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force))
>>   		return 0;
>>   
>> +	if (!pgtable_has_pmd_leaves())
>> +		disabled_orders = BIT(PMD_ORDER);
>> +
>>   	global_orders = shmem_huge_global_enabled(inode, index, write_end,
>>   						  shmem_huge_force, vma, vm_flags);
>>   	/*
>> @@ -2058,7 +2061,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>   	 * sysfs configs.
>>   	 */
>>   	if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
>> -		return global_orders;
>> +		return global_orders & ~disabled_orders;
>>   
>>   	/*
>>   	 * Following the 'deny' semantics of the top level, force the huge
>> @@ -2072,7 +2075,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>   	 * means non-PMD sized THP can not override 'huge' mount option now.
>>   	 */
>>   	if (shmem_huge == SHMEM_HUGE_FORCE)
>> -		return READ_ONCE(huge_shmem_orders_inherit);
>> +		return READ_ONCE(huge_shmem_orders_inherit) & ~disabled_orders;
>>   
>>   	/* Allow mTHP that will be fully within i_size. */
>>   	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
>> @@ -2083,6 +2086,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>   	if (global_orders > 0)
>>   		mask |= READ_ONCE(huge_shmem_orders_inherit);
>>   
>> +	mask &= ~disabled_orders;
>>   	return THP_ORDERS_ALL_FILE_DEFAULT & mask;
>>   }
>>   
>> @@ -5630,7 +5634,7 @@ void __init shmem_init(void)
>>   	 * Default to setting PMD-sized THP to inherit the global setting and
>>   	 * disable all other multi-size THPs.
>>   	 */
>> -	if (!shmem_orders_configured)
>> +	if (!shmem_orders_configured && pgtable_has_pmd_leaves())
>>   		huge_shmem_orders_inherit = BIT(HPAGE_PMD_ORDER);
>>   #endif
>>   	return;
>> -- 
>> 2.55.0
>>
>>
> 

