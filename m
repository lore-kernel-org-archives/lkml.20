Received: from out199-18.us.a.mail.aliyun.com (out199-18.us.a.mail.aliyun.com [47.90.199.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8251799F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424231; cv=none; b=tbVWOLSdFzO4Q/Lh+kWLVhzOnOTGLZ9h9hLSktB6EYNEnbH4HyAgECVPB8oPmB7d+4eJgZut2DUQ3/h5MSuHMqwOd7ZA5CQZyqAzSf10qDS0hg9jHnl7TOfhuJAwQpSvUgHAzAe6UkuvyB97erIYRbZ+3+s9DD5H35VRmWd6H3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424231; c=relaxed/simple;
	bh=6D1LPXX+dxoadjWWVq8Vuh93ftcDDRwfiXTSaDYmC4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1utXglDvnC4wKAgKsAZv+mJkFZbvhyxhBivRJqHN7pCXnlryGF/WzPjmf9ZiwUdLY2z41824db0ZByY3Aar2TuBpC0TnJ2D/vYt4Ivhx2szrtw18Bu3AMTjGlfkWqT16SzmhrUDyiOLnMD96Y9akwEDHOxk6wXTSDXnYxAvyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lcu90nEA; arc=none smtp.client-ip=47.90.199.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lcu90nEA"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791424211; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=zxvr0RhVyqkVNwZlzTLbBqT6dNG/BVYIaMV3U/7dCnQ=;
	b=lcu90nEA2d9uF2CR3K9U3f4L1oYvt70acnhZzdl7Dc9psbfgU0M6DbVtXW0LCeXhC513BSne0dySVHWNUpfkOYDR446tCxJ+FKuca5b3AuJ1Ygqd3PANCqMX0riUsnX39b90b18F5FML35x+Uh8HFOUQ4I72NtsNzIndUfdBlok=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XCIIuQW_1791424207;
Received: from 30.74.144.149(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCIIuQW_1791424207 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Oct 2026 09:50:09 +0800
Message-ID: <a14c2287-8d7f-468d-b0d4-1d445d2be277@linux.alibaba.com>
Date: Thu, 8 Oct 2026 09:50:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/14] mm: shmem: allow THP support determination at
 folio allocation time
To: Luiz Capitulino <luizcap@redhat.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ziy@nvidia.com, lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <f74ada750d1910f8ea7e55955eb0c330747b93d4.1789695931.git.luizcap@redhat.com>
 <b63f546b-ee92-46c3-85bd-bc64dbaae367@kernel.org>
 <0162d0f5-8e75-458b-a0a1-6071f46d4b35@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <0162d0f5-8e75-458b-a0a1-6071f46d4b35@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/3/26 11:09 PM, Luiz Capitulino wrote:
> 
> 
> On 10/2/26 3:23 PM, David Hildenbrand (Arm) wrote:
>> On 9/18/26 03:45, Luiz Capitulino wrote:
>>> In order to enable THP support in shmem today, besides the user
>>> configuration required, the CPU must support PMD-sized pages. This
>>> is the case because of the following has_transparent_hugepage()
>>> usage:
>>>
>>> - shmem_parse_one() and shmem_parse_huge(): Check if THP is built-in and
>>>    if the CPU supports PMD-sized pages
>>>
>>> - shmem_init(): Since the CONFIG_TRANSPARENT_HUGEPAGE guard is outside
>>>    the code block calling has_transparent_hugepage(), the
>>>    has_transparent_hugepage() call is exclusively checking if the CPU
>>>    supports PMD-sized pages
>>>
>>> While it's necessary to check if CONFIG_TRANSPARENT_HUGEPAGE is enabled
>>> in all cases, shmem can determine THP size support at folio allocation
>>> time. Therefore, drop the has_transparent_hugepage() usage listed above
>>> while keeping the CONFIG_TRANSPARENT_HUGEPAGE checks.
>>>
>>> Additionally, we need to check if PMD size order is supported in
>>> shmem_getattr(). Use pgtable_has_pmd_leaves() for that.
>>>
>>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
>>> ---
>>>   mm/shmem.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>> index 776dff8a848e..930657d05375 100644
>>> --- a/mm/shmem.c
>>> +++ b/mm/shmem.c
>>> @@ -690,7 +690,7 @@ static int shmem_parse_huge(const char *str)
>>>       else
>>>           return -EINVAL;
>>> -    if (!has_transparent_hugepage() &&
>>> +    if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
>>>           huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
>>>           return -EINVAL;
>>> @@ -1524,6 +1524,8 @@ static int shmem_getattr(struct mnt_idmap *idmap,
>>>       generic_fillattr(idmap, request_mask, inode, stat);
>>>       orders = shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0);
>>
>> I'm curious: why is that not handled inside 
>> shmem_huge_global_enabled() ? If PMD
>> order is impossible (well, okay, it is possible, but we simply cannot 
>> map these
>> things through PMDs), I would expect that we never list them as 
>> "enabled".
> 
> Yes, you're right. What about renaming current 
> shmem_huge_global_enabled() to
> __shmem_huge_global_enabled() and then having:
> 
> static unsigned int shmem_huge_global_enabled(struct inode *inode, 
> pgoff_t index,
>                            loff_t write_end, bool shmem_huge_force,
>                            struct vm_area_struct *vma,
>                            vm_flags_t vm_flags)
> {
>      unsigned int orders;
> 
>      orders = __shmem_huge_global_enabled(inode, index, write_end,
>                           shmem_huge_force, vma, vm_flags);
>      if (!pgtable_has_pmd_leaves())
>          orders &= ~BIT(PMD_ORDER);
> 
>      return orders;
> }
> 
> Would this be acceptable?

Not a fan of re-adding the wrapper. I think you could refer to the 
changes to shmem_allowable_huge_orders() in patch 14 and filter out the 
'disabled_orders' in shmem_huge_global_enabled() directly.
