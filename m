Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA3495037
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791461305; cv=none; b=tFp4ZEokKm51SCYi9A4CNuLUNhH3zEHYY+xrBHFlNumPz4S1WnasnohiVEfwZfMxTBWNycG15IHtDx+jHtknY/f81ZgiP6H48nbybWeBYmPgKJBFOlXM8oWxrM8Sd3izFUVqvPuqdulG721neSeKdvLj5j+bi30sKYOCyEceB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791461305; c=relaxed/simple;
	bh=Z1xj7D+e7YKXwF6vmPxEyVxZKFzkeC4NIZVqtbh5QJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYZUG/mYLTFbCWwp8YWJ1XKpDOmosj8CPJEnQNJUjJxERRRPwZ8pOsdkF1D7zEWl3xLbjGF3BTQi/BYpU2R3rGfkoMF3UeF+tDQ0c6W3FO6Fg1CZliIOwnLj3INoITyXNr/hFouBP6naVUFL36oqkuK/3NvWgfXIutM0+aCbkcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A/lkUaDI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A/lkUaDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791461302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uI+XtiazTVe8pG8BiMyn92RVBJ4I25dozIom7amZQ6c=;
	b=A/lkUaDIEN7sdtItQ93DNmKpS/57zGQ2ZCuT2JSdIB5HaxEjsyV3XP2FAhwjOhmTSX/T26
	c+HH8VF39ZOzHInP4tE5bqQwhiEJQdyp4/Fipt21a1kD2ZL5MuAmEyTqRp/LWmys4wKxLY
	BzvB7QMRzPmMkwFYCbC1vZRqTQMMTsI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-tU8k3cEIP5acmdqo8-tToA-1; Thu, 08 Oct 2026 08:08:21 -0400
X-MC-Unique: tU8k3cEIP5acmdqo8-tToA-1
X-Mimecast-MFC-AGG-ID: tU8k3cEIP5acmdqo8-tToA_1791461301
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53522c265f1so94385801cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 05:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791461301; x=1792066101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uI+XtiazTVe8pG8BiMyn92RVBJ4I25dozIom7amZQ6c=;
        b=PiheWmU3RFZ2grKlCZngXM3yiB2cAcEltEFmG8XkFEzONWBd/2LLsNbO2kKKFW7B4k
         wzeGFR3Xhd+v8RJ1hfFGRQuD2SkoAG1C9PJvjXHcvC/cZMz71iSVveEXo0wz30JjNtE/
         6RL2BqmQY4eJMxNNcUxbKZvuyDqwZZ8Qth+m0W+oy2IiQqw/6/F7V/b4Ghoj53XCPS8u
         xSyW24WlE7zNd7GQPYzN9+nCazrdXhAvUbjnqaqnH15FIX9EPT2wcjjzF6JFdMG1jNWk
         nmBW855T7xKiheZ8La43lZU4F4zag1SgpOH1akD88XCdinA+l7pdsEIuRh1Zm4ZQgBCe
         o26A==
X-Forwarded-Encrypted: i=1; AKwUvBz1jzVFw/Et05INMayxi9SvnzXokt+32oYU9Z66uGbjci2MER7QbTnAnZHsNJYxVcntt4bT6QCErVzf4ds=@vger.kernel.org
X-Gm-Message-State: AFuF++nS++QEIX4jJXLd01EEnlIrdY6zrQDfDCATw+ZzXe7o8r7D/9ae
	3S3h4FM6+KF9GDNPKnsZ5FxMj3GLa4qO2b3/Oi4gADWPLEcVaKK0jOg/vcnmx0dHczFsq7NPkmo
	xyU1tlLd8aZOtZeeGoHVeWMav/54GHxzJL/O58/SgVS3meWXuUkLivWWOXWoGTy818A==
X-Gm-Gg: AYBFou1GSom3ReI1da/UrHs+42yvXuGmW2CQzWZICW4Gw/NALi1b2H7Kgc4eV24d2at
	4SGGcsslvPwFpsABDB52YB5x/2PPeFlLbO0Hg9pVMiw6J3r6xXpvl6an9Bae9iewgCK7+U7cPZI
	QwIHMD4AQxFF1vm/pD3JHHT8oIUp5XN16kMOWzpmxdvKYMq0bUVNMVBkDYdf9SonoVoPTHmCxgd
	svbwgrwykrRWNSOUQVrsDzWyVbSQdGsoXw0nnETSxILTJsbcP2o51EAOOnJxTi7V1jehLI0QGt5
	dFJlv2IHXcDNZIMRDrnXiQJ61SXhoOEQhTekqJk8dXQ38f4VvyhNr3W2MpfRv2BgHz6aJAphAlZ
	xkio=
X-Received: by 2002:a05:622a:508:b0:530:e1b1:eaeb with SMTP id d75a77b69052e-5357552d4bbmr98471361cf.21.1791461300643;
        Thu, 08 Oct 2026 05:08:20 -0700 (PDT)
X-Received: by 2002:a05:622a:508:b0:530:e1b1:eaeb with SMTP id d75a77b69052e-5357552d4bbmr98470711cf.21.1791461299930;
        Thu, 08 Oct 2026 05:08:19 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996d20ae5sm44432586d6.27.2026.10.08.05.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 05:08:19 -0700 (PDT)
Message-ID: <4f7273ea-aec3-4a3e-8c83-927adfe6e17f@redhat.com>
Date: Thu, 8 Oct 2026 08:08:18 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/14] mm: thp: always enable mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org,
 ziy@nvidia.com, lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
 <4db5fdee-4bca-43bf-8ded-2fd8808ac289@linux.alibaba.com>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <4db5fdee-4bca-43bf-8ded-2fd8808ac289@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/7/26 10:07 PM, Baolin Wang wrote:
> 
> 
> On 9/18/26 9:45 AM, Luiz Capitulino wrote:
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
>>       else
>>           supported_orders = THP_ORDERS_ALL_FILE_DEFAULT;
>> +    if (!pgtable_has_pmd_leaves()) {
>> +        /*
>> +         * If the CPU does not support PMD leaves, assume for
>> +         * now that it does not support PUD leaves and disable
>> +         * both folio orders.
>> +         */
>> +        supported_orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
>> +    }
>> +
>>       orders &= supported_orders;
>>       if (!orders)
>>           return 0;
>> @@ -196,7 +205,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>       if (!vma->vm_mm)        /* vdso */
>>           return 0;
>> -    if (!pgtable_has_pmd_leaves() || vma_thp_disabled(vma, vm_flags, forced_collapse))
>> +    if (vma_thp_disabled(vma, vm_flags, forced_collapse))
>>           return 0;
>>       /* khugepaged doesn't collapse DAX vma, but page fault is fine. */
>> @@ -979,7 +988,7 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>>        * disable all other sizes. powerpc's PMD_ORDER isn't a compile-time
>>        * constant so we have to do this here.
>>        */
>> -    if (!anon_orders_configured)
>> +    if (!anon_orders_configured && pgtable_has_pmd_leaves())
>>           huge_anon_orders_inherit = BIT(PMD_ORDER);
>>       *hugepage_kobj = kobject_create_and_add("transparent_hugepage", mm_kobj);
>> @@ -1001,6 +1010,15 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
>>       }
>>       orders = THP_ORDERS_ALL_ANON | THP_ORDERS_ALL_FILE_DEFAULT;
>> +    if (!pgtable_has_pmd_leaves()) {
>> +        /*
>> +         * If the CPU does not support PMD leaves, assume for
>> +         * now that it does not support PUD leaves and disable
>> +         * both folio orders.
>> +         */
>> +        orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
>> +    }
>> +
>>       order = highest_order(orders);
>>       while (orders) {
>>           thpsize = thpsize_create(order, *hugepage_kobj);
>> @@ -1091,9 +1109,6 @@ static int __init hugepage_init(void)
>>       int err;
>>       struct kobject *hugepage_kobj;
>> -    if (!pgtable_has_pmd_leaves())
>> -        return -EINVAL;
>> -
>>       /*
>>        * hugepages can't be allocated by the buddy allocator
>>        */
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index bc2de3a7c1ea..8c0f7e3efeeb 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -2046,11 +2046,14 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>       unsigned long mask = READ_ONCE(huge_shmem_orders_always);
>>       unsigned long within_size_orders = READ_ONCE(huge_shmem_orders_within_size);
>>       vm_flags_t vm_flags = vma ? vma->vm_flags : 0;
>> -    unsigned int global_orders;
>> +    unsigned int global_orders, disabled_orders = 0;
>> -    if (!pgtable_has_pmd_leaves() || (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force)))
>> +    if (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force))
>>           return 0;
>> +    if (!pgtable_has_pmd_leaves())
>> +        disabled_orders = BIT(PMD_ORDER);
>> +
>>       global_orders = shmem_huge_global_enabled(inode, index, write_end,
>>                             shmem_huge_force, vma, vm_flags);
>>       /*
>> @@ -2058,7 +2061,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>        * sysfs configs.
>>        */
>>       if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
>> -        return global_orders;
>> +        return global_orders & ~disabled_orders;
> 
> If you move the 'disabled_orders' filtering logic into shmem_huge_global_enabled(), as I mentioned in patch 8, then this change can be removed.
> 
>>       /*
>>        * Following the 'deny' semantics of the top level, force the huge
>> @@ -2072,7 +2075,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>        * means non-PMD sized THP can not override 'huge' mount option now.
>>        */
>>       if (shmem_huge == SHMEM_HUGE_FORCE)
>> -        return READ_ONCE(huge_shmem_orders_inherit);
>> +        return READ_ONCE(huge_shmem_orders_inherit) & ~disabled_orders;
> 
> Since you've already disabled PMD-sized and PUD-sized orders for the 'shmem_enabled' interface in hugepage_init_sysfs(), this change can also be dropped.
> 
>>       /* Allow mTHP that will be fully within i_size. */
>>       mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
>> @@ -2083,6 +2086,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>>       if (global_orders > 0)
>>           mask |= READ_ONCE(huge_shmem_orders_inherit);
>> +    mask &= ~disabled_orders;
> 
> Ditto.

Yes, I'll look into implementing your suggestions for the next version.

> 
>>       return THP_ORDERS_ALL_FILE_DEFAULT & mask;
>>   }
> 

