Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E1651DDEF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076881; cv=none; b=ZA70rZJarRXseVMrJ7iy76FCLPMk1OAY7priIpKauXzwVXTRyfGcmGJosKYl03vOjuEfkmM7inoh7DRc3he2yNVgs6uC2rsQFyJ0ysQU4FvnZdIvAGQyMbyDymPFUltDlNGXvXJdTpzbErJ3FD7GF/Y1lfIKe/FysxXbF0ChwoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076881; c=relaxed/simple;
	bh=NN747W62S3d/5Yjf441AnlRml7ayVS4UCAQNtupGVWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEuSP5ah19K25mmEK5quARQzC2kqdmndLI3P1yVvvJlapnhH2a+rvw+DLr+s44Fw5KDWovUIygI9AXWck6GG3R0KYRdLPmse4ggrJOmzyBvO2JlW3rBa7gnjCHON4tyzk2vR1m/p+4i2H5i/MZrTnk/MU0FtbI4fM12ZoT0mwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iszbwzU8; arc=none smtp.client-ip=91.218.175.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iszbwzU8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NN747W62S3d/5Yjf441AnlRml7ayVS4UCAQNtupGVWY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790076874; v=1; x=1790681674;
 b=iszbwzU8dZcsypAXPI3zPdjeKIPiMr10POceGbHGsf/NitbJtDrA4jvc15WwpjpVFzBU30xy
 DzaucNqCt5UsnmWLhkLZN6zcUaaZCrf4J3JqUXnGs9so0cOhbtSbK9o494u7NxAsNRj8m65frT5
 BJti3IGuPu6c89KmF+fMlolc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 29b45f507b2da17a;
	Tue, 22 Sep 2026 11:34:24 +0000
X-Mizu-Trace-ID: 29b45f507b2da17a
X-Migadu-Flow: FLOW_OUT
Message-ID: <9ac5cba5-0044-4f57-9ec0-d5631b7b178c@linux.dev>
Date: Tue, 22 Sep 2026 19:34:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mm/sparse-vmemmap: support device DAX in common
 vmemmap path
To: Qi Zheng <qi.zheng@linux.dev>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-3-songmuchun@bytedance.com>
 <dad55fc6-56ff-4375-893b-938404238ca8@linux.dev>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <dad55fc6-56ff-4375-893b-938404238ca8@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/9/22 16:02, Qi Zheng wrote:
>
>
> On 9/13/26 4:37 PM, Muchun Song wrote:
>> The common vmemmap population path cannot yet handle optimized Device 
>> DAX
>> mappings on its own. It uses pfn_to_zone() to find the shared tail page,
>> but Device DAX populates its vmemmap at runtime before the 
>> ZONE_DEVICE span
>> is initialized.
>>
>> Teach the common path to use device_zone() for runtime optimized vmemmap
>> population while retaining pfn_to_zone() for early boot. This allows the
>> same path to support both early boot mappings and Device DAX.
>>
>> The backing PFN supplied by the Device DAX-specific population path 
>> is no
>> longer used, allowing the redundant lookup and population code to be
>> removed later.
>>
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>   mm/sparse-vmemmap.c | 44 +++++++++++++++++++-------------------------
>>   1 file changed, 19 insertions(+), 25 deletions(-)
>>
>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index 878d29a4e862..e83821768c12 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -208,18 +208,27 @@ static __meminit void 
>> *vmemmap_alloc_pte(unsigned long pfn, int node,
>>       struct page *page;
>>       const unsigned int order = pfn_to_section_compound_order(pfn);
>>   -    /*
>> -     * Device DAX still relies on vmemmap_populate_compound_pages() for
>> -     * head/first-tail allocation and tail-page reuse.
>> -     */
>>       if (!vmemmap_optimizable_pfn(pfn))
>>           return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
>>   -    zone = pfn_to_zone(pfn, node);
>> +    /*
>> +     * At runtime (slab available), only ZONE_DEVICE pages trigger 
>> vmemmap
>> +     * optimization, so device_zone() suffices. Note that pfn_to_zone()
>> +     * cannot be used at runtime because the zone span is not set up 
>> now.
>> +     */
>> +    zone = slab_is_available() ? device_zone(node) : 
>> pfn_to_zone(pfn, node);
>>       page = vmemmap_shared_tail_page(order, zone);
>>       if (!page)
>>           return NULL;
>>   +    /*
>> +     * When a PTE entry is freed, a free_pages() call occurs. This 
>> get_page()
>> +     * pairs with put_page_testzero() on the freeing path. This can 
>> only occur
>> +     * when slab is available.
>> +     */
>> +    if (slab_is_available())
>
> Would it make sense to introduce a helper function that wraps
> slab_is_available() for better readability? Also, it might be worth
> adding a comment to the helper function as well.

Thanks for the suggestion. I considered introducing a helper, but the
two uses of slab_is_available() depend on different properties of the
same initialization boundary. One determines how the zone is obtained,
while the other determines whether the shared vmemmap backing page can
participate in page refcounting. Any helper name would therefore be
either too generic or specific to only one of these properties.

I would prefer to keep slab_is_available() explicit and expand the
comments at both call sites. The first comment explains why early
system RAM can use pfn_to_zone(), whereas ZONE_DEVICE population after
slab becomes available must use device_zone(). The second explains why
early shared backing pages, which are allocated from memblock, cannot
yet be refcounted. Once slab becomes available, shared backing pages
are allocated from the buddy allocator and can hold one reference for
each shared PTE mapping.

I will adopt the following revisions. Does this make sense to you?

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 5e0e30c77431..406d6f7918f7 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -212,9 +212,13 @@ static __meminit void *vmemmap_alloc_pte(unsigned 
long pfn, int node,
                 return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);

         /*
-        * At runtime (slab available), only ZONE_DEVICE pages trigger 
vmemmap
-        * optimization, so device_zone() suffices. Note that pfn_to_zone()
-        * cannot be used at runtime because the zone span is not set up 
now.
+        * Before slab is available, vmemmap optimization is used for early
+        * system RAM, whose zone can be determined from the PFN.
+        *
+        * Once slab is available, only ZONE_DEVICE memory reaches this
+        * optimized population path. Its zone span has not been initialized
+        * while its vmemmap is being populated, so pfn_to_zone() cannot be
+        * used. Obtain ZONE_DEVICE directly from the node instead.
          */
         zone = slab_is_available() ? device_zone(node) : 
pfn_to_zone(pfn, node);
         page = vmemmap_shared_tail_page(order, zone);
@@ -222,9 +226,17 @@ static __meminit void *vmemmap_alloc_pte(unsigned 
long pfn, int node,
                 return NULL;

         /*
-        * When a PTE entry is freed, a free_pages() call occurs. This 
get_page()
-        * pairs with put_page_testzero() on the freeing path. This can 
only occur
-        * when slab is available.
+        * During early vmemmap population, the shared tail vmemmap backing
+        * page is allocated from memblock before its struct page can safely
+        * participate in page refcounting. Therefore, no reference can be
+        * held for each shared PTE mapping, and the mappings must be 
unshared
+        * before the vmemmap is depopulated.
+        *
+        * Once slab is available, the shared backing page is allocated from
+        * the buddy allocator and can be refcounted. Hold one reference for
+        * each shared PTE mapping. The architecture vmemmap teardown drops
+        * the reference through __free_pages() when removing the mapping,
+        * preventing the backing page from being freed while it is shared.
          */
         if (slab_is_available())
                 get_page(page);

>
> At least for me, encountering this always causes a moment of confusion.
>
>> +        get_page(page);
>> +
>>       return page_address(page);
>>   }
>>   @@ -231,27 +240,12 @@ static pte_t * __meminit 
>> vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
>>         if (pte_none(ptep_get(pte))) {
>>           pte_t entry;
>> +        void *p = vmemmap_alloc_pte(pfn, node, altmap);
>>   -        if (ptpfn == (unsigned long)-1) {
>> -            void *p = vmemmap_alloc_pte(pfn, node, altmap);
>> -
>> -            if (!p)
>> -                return NULL;
>> -            ptpfn = PHYS_PFN(__pa(p));
>> -        } else {
>> -            /*
>> -             * When a PTE/PMD entry is freed from the init_mm
>> -             * there's a free_pages() call to this page allocated
>> -             * above. Thus this get_page() is paired with the
>> -             * put_page_testzero() on the freeing path.
>> -             * This can only called by certain ZONE_DEVICE path,
>> -             * and through vmemmap_populate_compound_pages() when
>> -             * slab is available.
>> -             */
>> -            if (slab_is_available())
>> -                get_page(pfn_to_page(ptpfn));
>> -        }
>> -        entry = pfn_pte(ptpfn, PAGE_KERNEL);
>> +        if (!p)
>> +            return NULL;
>> +
>> +        entry = pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
>>           set_pte_at(&init_mm, addr, pte, entry);
>>       } else if (WARN_ON_ONCE(vmemmap_optimizable_pfn(pfn)))
>>           return NULL;
>

