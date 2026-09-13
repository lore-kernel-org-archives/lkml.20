Received: from mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28E30AAD8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789276915; cv=none; b=D+Nidnbih7kxSTCoe4ry00gN62uJgJ/h9lq0bT/RJO5nphmVi+rHOGj/kwvgu+AFOHsrVOlZ2NcbfkPYCU6BWUDBszDvu+YDadmav0uhzwjNhAKtSeMnHJ0Tzx5XewEez3fXX7EdjVK5misqaJG6bgD8I3a+C/kyVsHsTFkSXB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789276915; c=relaxed/simple;
	bh=RKmcLz7tqw9BoAn8ncge1YXquNNNISh1dupWXKD795U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nac929JTIA+6c5Qp9A+wbIbsfJKq2PH5PLznC8JQFDHVRSsdqEvkObd4sNitISAC15DLnw6guMLtHrNO1tWe94VxbB/LW/rYeIWcdDVVgpChtXW3/aBIJOq/b9kfnSYAxckHSOm75O0ZEz7rnwCICXlI4/ARgzN9ZwO3Cr6XDN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CB/xRpGq; arc=none smtp.client-ip=91.218.175.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CB/xRpGq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RKmcLz7tqw9BoAn8ncge1YXquNNNISh1dupWXKD795U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789276911; v=1; x=1789881711;
 b=CB/xRpGqoCSpRxco6zev68F1o832sH5JYz6qf01yJJnISdcr0zpFAqczIM3ZnXssJacHdwLa
 RMCl4VCaXKIeiwv9Xon6rxzySloQpUyLV4PxycxQCocuHCQHgfCdePODcm/PW3UcL8XaDgm4L+D
 stxS9/G70hcMDoLzIpb3B8FY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4087794f270a1a0a;
	Sun, 13 Sep 2026 05:21:51 +0000
X-Mizu-Trace-ID: 4087794f270a1a0a
X-Migadu-Flow: FLOW_OUT
Message-ID: <afafcdd7-3854-4860-a12d-35498a007106@linux.dev>
Date: Sun, 13 Sep 2026 13:21:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/9] mm/huge_memory: use
 normal_or_softleaf_folio_pmd() in the PMD split path
To: yintirui@gmail.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org,
 ljs@kernel.org, dev.jain@arm.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, baohua@kernel.org, ryan.roberts@arm.com,
 nico.pache@linux.dev, usama.arif@linux.dev, liam@infradead.org,
 wangkefeng.wang@huawei.com, chenjun102@huawei.com,
 linux-kernel@vger.kernel.org
References: <efae5222ad43f749c40aaca9b759b41844fdded8.1787941780.git.yintirui@gmail.com>
 <20260912073755.8403-1-lance.yang@linux.dev>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260912073755.8403-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/12 15:37, Lance Yang wrote:
> 
> On Sat, Aug 29, 2026 at 02:33:14AM +0800, Yin Tirui wrote:
>> Get the folio once with normal_or_softleaf_folio_pmd() and decide the
>> deposit once with has_deposited_pgtable(), as zap_huge_pmd() does. That
>> makes split and zap classify an entry the same way, and drops
>> vma_is_special_huge() from this path.
>>
>> Behaviour changes only where the entry and the VMA flags disagree, which no
>> in-tree path produces.
>>
>> Signed-off-by: Yin Tirui <yintirui@gmail.com>
>> ---
>> mm/huge_memory.c | 21 ++++++++++++---------
>> 1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index aefd62827139..b2ede9a6ae5d 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3172,7 +3172,7 @@ static void unmap_huge_pmd_entry(struct vm_area_struct *vma,
>> 	 * We are going to unmap this huge page. So
>> 	 * just go ahead and zap it
>> 	 */
>> -	if (arch_needs_pgtable_deposit())
>> +	if (has_deposited_pgtable(vma, old_pmd, folio))
>> 		zap_deposited_table(mm, pmd);
> 
> Staring at this ... I think we're missing raw PFN mappings of the huge
> zero folio ...
> 
> static bool has_deposited_pgtable(struct vm_area_struct *vma, pmd_t pmdval,
> 		struct folio *folio)
> {
> 	/* Some architectures require unconditional depositing. */
> 	if (arch_needs_pgtable_deposit())
> 		return true;
> 
> ...
> 	if (is_huge_zero_pmd(pmdval))
> 		return !vma_is_dax(vma);
> 
> ...
> 	return folio && folio_test_anon(folio);
> }
> 
> If a non-DAX raw PFN mapping on x86 (say, via mshv_vtl_low) matches
> huge_zero_pfn, vmf_insert_pfn_pmd() won't deposit a page table, but
> has_deposited_pgtable() will return true ...
> 
> Before this patch, arch_needs_pgtable_deposit() skips withdrawal when
> splitting this mapping on x86. The new check would instead reach
> pgtable_trans_huge_withdraw() and dereference NULL through pgtable->lru
> if pmd_huge_pte(mm, pmd) is NULL.
> 
> The helper already causes the same bug in zap_huge_pmd(), but extending
> it to split is a regression introduced by this patch. I'll send a separate
> fix, and we need it landed first :D

https://lore.kernel.org/linux-mm/20260913051942.40889-1-lance.yang@linux.dev/T/#u

