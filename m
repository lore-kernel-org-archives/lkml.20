Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A14B0C82
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266381; cv=none; b=g64AW+Ppi+nM70UgGZgzPRNkIxwXRprS4anTMo03Kg4T7XEIzFBZU3qhwvVXRZNJ4ZbcaealCTDHr0HnaCLD4AOYkyhRnwqshmpCQJVEcv3RENGo7fAQzEHBKO1TECqlaJp2l9Ou53+CA8OAx7R0TECCcrrp87inX0YaKRJRadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266381; c=relaxed/simple;
	bh=1ohFjSCIUwpH5qBdu4MdlkXa39XLJc1SPyL+HjcbYJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXnNlqGxoCRwx469jtrytCfm7xSyuyUoG9tR51Zi7Sm9mHUe9AUAuZOGZzs+qMJp6Ig8gb5DfSVlkwJZY7NhicTu1Yjcz3WVwxb1WrjPd9xeZO5jMcmi/rU4hsRtKYZQLtTmWNOdgbnyEIE/duzmr0Qi09HPfKfISrAJvCd6TdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vvuyppw0; arc=none smtp.client-ip=91.218.175.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vvuyppw0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1ohFjSCIUwpH5qBdu4MdlkXa39XLJc1SPyL+HjcbYJw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790266371; v=1; x=1790871171;
 b=vvuyppw0Z2r0+Rq8/SGGRepA0ks9dB6StSfiBceiUGvawrL0E1Nx+BW222xWQ8Vod/E2OhdO
 AOIufS4fmNtDB3O272S9QoLdcic7AVc5A79YYpO/y3+9CPY85/o1HdtLeFcqev0J0xJjlG2fpJG
 efzA09dt6K09VdcF+TImFDJo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 87c44c435beead6e;
	Thu, 24 Sep 2026 16:12:51 +0000
X-Mizu-Trace-ID: 87c44c435beead6e
X-Migadu-Flow: FLOW_OUT
Message-ID: <0f5d22fd-24f2-4235-92f5-3dc065e0f153@linux.dev>
Date: Thu, 24 Sep 2026 17:12:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 10/29] mm: make PMD migration-entry splitting explicit
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-11-usama.arif@linux.dev>
 <a8ff997a-2d09-44f4-85c3-322927f75d1d@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <a8ff997a-2d09-44f4-85c3-322927f75d1d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23/09/2026 12:04, David Hildenbrand (Arm) wrote:
> Having another look ...
> 
> 
>> +
>> +/*
>> + * Split a present PMD into PTE migration entries, for the rmap migration
>> + * walker.  
> 
> I assume pmd_is_device_private_entry() is also allowed?
> 
> "present or device-private PMDs"
> 

Yes, ack.

> 
>> Like split_huge_pmd_locked(), the caller must hold the PMD lock and
>> + * must already be inside an mmu_notifier invalidate range.
>> + */
>> +void split_pmd_to_migration_entries(struct vm_area_struct *vma,
>> +				    unsigned long address, pmd_t *pmd)
>> +{
>> +	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>> +	if (pmd_trans_huge(*pmd) || pmd_is_valid_softleaf(*pmd))
> 
> pmd_is_valid_softleaf() would include migration entries and swap entries?
> 
> I'd assume that try_to_migrate_one() will never call us with something that is
> not a present or device-private PMD?
> 
> Shouldn't we instead just
> 
> 
> VM_WARN_ON_ONCE(!pmd_present(*pmd) && !pmd_is_device_private_entry(*pmd));
> __split_huge_pmd_locked(vma, pmd, address, true);
> 
> And not offer some weird fallback where we silently don't split?


Yes, that sounds much better. The function right now is:


/**
 * split_pmd_to_migration_entries() - Split a present or device private PMD into
 * PTE migration entries.
 * @vma: The VMA containing the PMD.
 * @address: The PMD-aligned address the PMD maps.
 * @pmd: A pointer to the leaf PMD entry.
 *
 * For the rmap migration walker, which only ever hands back those two entry
 * types.  Like split_huge_pmd_locked(), the caller must hold the PMD lock and
 * must already be inside an mmu_notifier invalidate range.
 */
void split_pmd_to_migration_entries(struct vm_area_struct *vma,
		unsigned long address, pmd_t *pmd)
{
	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
	VM_WARN_ON_ONCE(!pmd_present(*pmd) &&
			!pmd_is_device_private_entry(*pmd));
	__split_huge_pmd_locked(vma, pmd, address, true);
}

> 
>> +		__split_huge_pmd_locked(vma, pmd, address, true);
>>  }
> 

