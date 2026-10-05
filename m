Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203443AB476
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191042; cv=none; b=q145xm4dMDwa09D9xsdfeP7euZ3dmA6zKn5R9kDnvK8Ji8A/xc2deLol/5sXrzNpQ3AcAk217SIba/dWL741pvYxReBEeBA3y0NislMyw5tTyO/kA/ZhhyxPiW0kI1aNaQHjmWhLg620agoXMVOuN3Ar/Hb0TspvJpwYkcbnA4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191042; c=relaxed/simple;
	bh=/9IavnXlYV+SONlG7zCUUKiL8FXLiXpUhlC0PZd2v7E=;
	h=In-Reply-To:To:References:Cc:Date:Message-Id:Content-Type:From:
	 Mime-Version:Subject; b=TBDMK5yk3M7lca1IvjISUswAxdsqq8/3DpjN3jIkPIfT/Tsl2YB/2Qx/V6UO9p78iztXCjaP+NVV5WXs5ApOPgNo5gDKqc1tHigTicp720ZQuL+Y5IgRjUlQAVBm5o8zeG3OS9gU/4Erxb4UEtWc3lG/Snp7SOyFXLzynCoGTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UgIMrKyp; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UgIMrKyp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791191028; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=lg3JTsD4Fv1cl+EWpET5q4ztDTVbrGh6J6Dc7vTY9rk=;
 b=UgIMrKypWcATpv6vSBbvAAFYmMdYtrXSLSlI0Galx+1zzASPvGO5DERI8DbYJRyBPNH8GZ
 bpz5/XnP+RhKLeaJJzLs8eVBLDeviS5tlQypC0yq/w2Na2sxgYIv7pyJWYdyH0JiHz5Xcl
 LK0jwSbJ+0OwkksE/ShQO3eUYfDa8MWHniW5CMcj/APA9BCIcx3Za7GKU5IJy5rAjSfoCj
 ZaNQURmTluHXspwnZJRDAu4KEyFKuCn7A6SF2GBUSnrlNqXfgaObYRm3aCj3Q7OkpIXCVt
 byyMqMiF6XIXSXmZ7WLIqqkoyuneADCLChQwNbQANU4eIGgHVHGWvSkAxeVPWA==
In-Reply-To: <arzVaC2IYkqSb0_U@gmail.com>
X-Lms-Return-Path: <lba+26ac367f2+d69f34+vger.kernel.org+lizhe.67@bytedance.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
References: <20260930064308.58159-1-lizhe.67@bytedance.com> <arzVaC2IYkqSb0_U@gmail.com>
Cc: <akpm@linux-foundation.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <david@kernel.org>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>
Date: Mon, 5 Oct 2026 17:03:28 +0800
Message-Id: <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com>
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
From: "Li Zhe" <lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing

On 9/30/26 5:31 PM, Jose A. Perez de Azpillaga wrote:
> On Wed, Sep 30, 2026 at 02:43:08PM +0800, Li Zhe wrote:
>> huge_pmd_share() always takes i_mmap_rwsem for read before looking for a
>> shareable PMD page table.
>>
>> That is unsafe for callers that already hold the same mapping lock for
>> write.  In particular, move_hugetlb_page_tables() takes i_mmap_rwsem for
>> write to prevent truncation races, then calls huge_pte_alloc() for the
>> destination address.  If the destination PUD is empty and PMD sharing is
>> possible, huge_pte_alloc() can call huge_pmd_share(), which then tries to
>> take the same rwsem for read and can deadlock on itself.
>>
>> PMD sharing is only an optimization.  If the read side of i_mmap_rwsem
>> cannot be acquired immediately, fall back to allocating a private PMD
>> table instead of blocking in the sharing path.
>>
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> ---
>>   mm/hugetlb.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index cea25773a6c95..75631101a6807 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -6995,7 +6995,15 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
>>   	pte_t *spte = NULL;
>>   	pte_t *pte;
>>
>> -	i_mmap_lock_read(mapping);
>> +	/*
>> +	 * Some callers already hold i_mmap_rwsem for write, for example
>> +	 * move_hugetlb_page_tables(). PMD sharing is only an optimization, so
>> +	 * fall back to a private PMD table instead of blocking on the same
>> +	 * rwsem in read mode.
>> +	 */
>> +	if (!i_mmap_trylock_read(mapping))
>> +		goto alloc;
> try deadlock is not a fallback here. both callers already hold the write
> lock, and that is enough for the walk, so sharing is never attempted on
> these paths.
>
> hugetlb_change_protection() does thr same thing on the uffd-wp path and
> is not in the changelog.
>
> and no Fixes tag either. does this want Cc: stable?


Thanks for the review.

I agree that holding the write lock should be enough for the walk, and
that avoiding PMD sharing on these paths is not the right direction.

David mentioned that Oscar was planning to send a proper fix for this
issue, so I will wait for that patch instead of moving forward with this
trylock fallback approach.

Thanks,
Zhe

>
>>   	mapping_rmap_tree_foreach(svma, mapping, idx, idx) {
>>   		if (svma == vma)
>>   			continue;
>> @@ -7024,8 +7032,10 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
>>   	}
>>   	spin_unlock(&mm->page_table_lock);
>>   out:
>> -	pte = (pte_t *)pmd_alloc(mm, pud, addr);
>>   	i_mmap_unlock_read(mapping);
>> +
>> +alloc:
>> +	pte = (pte_t *)pmd_alloc(mm, pud, addr);
>>   	return pte;
>>   }
>>
>> --
>> 2.20.1
>>
> --
> cheers,
> jose a. p-a
