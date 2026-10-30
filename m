Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355625;
	b=XvGcv66+P9Q2SSNu7eL6Vpd+wv8Kt9LFxUX/Pa9ul0oHluGYA6JahectixsMuUjTt+HU
	 3G/MATD6skWy1QSi14G2uN7knS3EReH48NZK016OVQi39bwfOzpCpt3zQtHAmKl885G/O
	 Hx3D4NFJmtxeXCdIr7DnnxIiWN9vxGxxq37w1otQbFTi7C4jTkgztJ+zFjldP0AWrJD3Q
	 heduztZtJKc9x8D0rkhvl9EMbkXLScQ5AO4ZSewbW63iPd+0QW5FiPkHOxz4nVYnb/KA6
	 yHT0LgIZoEil46xP+BvOJhFwtJqtNCNpaJTsQa/fNlq6B1wjLFku8uDwH1ZEdfO2wXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=47HRSEMYaHZPzJWzqw3IojT1EDL4QQpT831/3j+yFnA=;
	b=enP3Qa3Rg6uSnmvUb2F24IIcF8ZYrkfeEVgzj3Rxd6+bXNEc1pN8uYXAu9lJOvbfCyNC
	 jq8X8PLZcYXZ8Ye5i7XVhr+G7YEEvQWAaIXhHrSBq3EU8F8xSOzfvdNaXqY/ca3fbmSCz
	 XBo9BWOkxbv0LsxUWIwI1TnKXnebAIOm0w+OT105uQxZsU1SGz0+4bn5kWrA9DHsUr+BK
	 QSrCC1rP4oYNCO6KtMKtVNpg0BXNuUjiquOBLgWP99GUaX7l7Tgd7C13rrl/1hAO8vIMV
	 EEDevqd48a+XT+eyaSg7pZfV0bbpCa2T2ui/NbwWSMEfQOWBbyf4LvzUPrajdhz6BCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+kranZz;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DCB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76DCB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+kranZz
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35c76e9614aso873963eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355624; x=1793960424; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=47HRSEMYaHZPzJWzqw3IojT1EDL4QQpT831/3j+yFnA=;
        b=i+kranZz3+N3wrwCi0QJX6kfOFtU1BA7n46lgt/nrdQWfr3++/a6bOCuDIPHAB3rwv
         45da1JxdxmrGPnFyyX+VvrkauWCq70BTYEn8LtvarUb35uEOCb+NlpunwmTzCw9dGxi3
         ly3HBY3p38TptshfHIA0f/4VhpWiALVZl/fWc5a9GZSPIMQFgCwoak/jMaUJA4qjxKmm
         akjJGrwbh80aHsbLie19fCpqpxwrrkAqaa++Py/dMFwyK9AbZ4ibbhzFwxosDxFRSByO
         adueFdMWqmIRCdpVsK4OMuEPVbWPkoAu4G1zo5bPWuummXU2ZXfttkZ9iWf+NAE6G/mB
         5MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355624; x=1793960424;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47HRSEMYaHZPzJWzqw3IojT1EDL4QQpT831/3j+yFnA=;
        b=n9SVrE4mXeIgbQ2mY84YlR5eAJjd7FYwV9xxjWqd98Zi2BxQXTQXkJw39EfxFs3+QI
         9dMjAjeu48LNHYx+9Bj9b538VcS1nv3eULPZq7H8aEmLLS+FemzI33dizupYuV9eY7ds
         4CptzpruBcjGSyQHmvbiT5C1igFwXH1dJDqPVNlQynS+tigC5yse9B8JB1BtejGeMNPG
         54dTMGHPaSjTt7aKVIMx/pDzsk29L9Do5yFRKkgvepcFXMJSS7aBpQrsramCsjsflOI7
         a0YDO+Q764OBuUe6CDlpMIRJvw4IcYwncdmU1epMbW5R3jsHYlQUuZWLQA21nsrolOgR
         lPgg==
X-Forwarded-Encrypted: i=1; AKwUvBzL58lrnvNC6zZB6ambE6SkSCWIxQ3hqqHMmFsYSvcnrYwss7lsVhFaTNZRV60fHddQXQz3YOh7O8EjoCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNzC3I3c1a6DOKT+So0IXG4U8rTik06HOjkagEKOJIqWIMUcaB
	BtHpW2VzzikPYmRnLXM7ZEpK0Ro/ckyBNLYK6u9H2PF6niQFT7hEnTid
X-Gm-Gg: AYBFou17E8Qsu4z68ESacsAZYjuX73/IW1oKMJjsgk4tskzNt1H+vZp93TQCbEg4h23
	BFI1ZIOlsPcG+F7Mag0k5T+SO3O9PsmMkeqiU37yI+w4TqA7qHepG/DdIIg48wDPXQow0SlTzMx
	ofzXZ4fTSjwXPW5EpGG/EGxwiqNWxPovwCTVBcgfN3EjjSqrm6PaRiJvrNOGcd7G92ZUqtpkrSY
	QR+rXAjk0IwU92tPog+UcMPPb18pquekZH4tY1KHRuYY9pMAsSc/o+DaDahZwZOGgL7b9XgNpCe
	0MxwLcvA7lkX4t7OZqGar1TIuZYMqBmgX9j5hv6sbtJS2mN7avxMpG4P29eTi8EYXx4sn3LI4Ab
	owEwW4T3NLwBpJVGTiZyl24JCOAU9Nnjrbi2h39q/LTKuEzf7rLqz10TIijAyE9aFsIwb+sAwhf
	ZgQIlWzAIvW93f4ppObA+EHbdZs4gWHJ9JoyOsg5SSLe5iJ9lL4lkMrpqL0Pu/xShuVjT2Voba9
	HI5oFNqQu4bm8rUy/hYbtHNBEjVipDzD78dm4wOFExJFmdimhu0ULDx2j+FCO4Pwiq8+37aRQks
	C0aNo1t2yNNW6uVhR2q9iPYMsWc=
X-Received: by 2002:a05:7300:c00f:10b0:36a:1470:da0e with SMTP id 5a478bee46e88-36a423bececmr3563726eec.29.1793355624408;
        Fri, 30 Oct 2026 03:20:24 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm7607181eec.2.2026.10.30.03.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:20:23 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Pavithra <pavrampu@linux.ibm.com>
Subject: Re: [PATCHv2] mm/huge_memory: set the mmu_gather page size in zap_huge_pud()
In-Reply-To: <19012a9f-7a8d-4eb2-a441-cdb04184890b@kernel.org>
Date: Fri, 30 Oct 2026 15:45:04 +0530
Message-ID: <cxsrwl3r.ritesh.list@gmail.com>
References: <8b853e5f9f16145859407b28af654b0f79e12642.1793318297.git.ritesh.list@gmail.com> <19012a9f-7a8d-4eb2-a441-cdb04184890b@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 10/30/26 01:07, Ritesh Harjani (IBM) wrote:
>> Unmapping a device-dax mapping with 1G alignment on powerpc radix kernel
>> built with CONFIG_DEBUG_VM triggers this warning on every munmap:
>> 
>>     WARNING: mm/mmu_gather.c:176 at __tlb_remove_folio_pages_size+0x38/0x230
>>     NIP [c00000000063d508] __tlb_remove_folio_pages_size+0x38/0x230
>>     LR [c0000000006fb688] zap_huge_pud+0x1b8/0x2d0
>>     Call Trace:
>>      zap_huge_pud+0x170/0x2d0 (unreliable)
>>      __zap_vma_range+0x1604/0x1e20
>>      unmap_vmas+0xa0/0x1f0
>>      unmap_region+0xb0/0x130
>>      vms_complete_munmap_vmas+0x120/0x310
>>      do_vmi_align_munmap+0x1ec/0x240
>>      __vm_munmap+0x148/0x220
>>      sys_munmap+0x28/0x40
>> 
>> To trigger this - it is enough to mmap() /dev/dax0.0, touch the first
>> byte so that the whole 1G is mapped by a single PUD and then munmap()
>> it.
>> 
>> PowerPC needs MMU_GATHER_PAGE_SIZE in which mmu_gather needs to record
>> the page size for which tlb flush is needed. zap_huge_pmd(),
>> zap_pte_range(), change_huge_pud() etc all do this already. However,
>> since commit:
>>   dbe54153296d ("mm/huge_memory: add vmf_insert_folio_pud()")
>> 
>> a device-dax PUD maps a real folio and zap_huge_pud() now hands it to
>> tlb_remove_page_size(tlb, page, HPAGE_PUD_SIZE). At that point
>> tlb->page_size is still whatever the previous user left behind, which is
>> 0 for the fresh gather set up by munmap() and so the check fires.
>> 
>> Fix this in the same way like how other similar paths do.
>> 
>> Fixes: dbe54153296d0 ("mm/huge_memory: add vmf_insert_folio_pud()")
>> Reported-by: Pavithra <pavrampu@linux.ibm.com>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>> [v1]->v2:
>> =========
>> - Split the 2 part patch series. Patch-1 is now superseded by a different patch
>>   from Muchun which he already posted [2].
>> - No difference in this patch from v1.
>> 
>> [v1]: https://lore.kernel.org/all/97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com/
>> [2]: https://lore.kernel.org/all/20261029063601.1961415-1-songmuchun@bytedance.com/
>> 
>>  mm/huge_memory.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index bd44d58e8684..7e589a2fb02d 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3040,6 +3040,8 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>  	spinlock_t *ptl;
>>  	pud_t orig_pud;
>> 
>> +	tlb_change_page_size(tlb, HPAGE_PUD_SIZE);
>> +
>>  	ptl = __pud_trans_huge_lock(pud, vma);
>>  	if (!ptl)
>>  		return 0;
>> --
>> 2.39.5
>> 
>
>
> Matches zap_huge_pmd().
>
> I will wait a bit  and then queue this shortly.
>

Thanks David, however, looks like Andrew might have queued this up in
his mm tree [1], right?

[1]: https://lore.kernel.org/all/20261030021905.2DCA71F000C1@smtp.kernel.org/

> This sounds like stable material?
>

Sorry, my bad. Yes, we should have this Cc: stable@vger.kernel.org.

Kindly let me know if I should update the tag and send v3, or can it be
taken care? Thanks!

-ritesh
