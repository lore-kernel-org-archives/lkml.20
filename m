Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873544;
	b=ScPlJvkoBMEiFMatiJ7PcrDUayC4mYRtBj+cAedP4VaQCqBNL9A/tphY1T97UJi+bgmV
	 rnexMoZek/iXKux2KNVyh5GEyFh9I0TuqN37fQ6og6eUhijHIXHv3xYr8Mn5HE5nkGJuj
	 QuVXeiPzS4rlfetvlEdUjHPSr2nbcWROVTCyEy6U4Hj4XUxumTEBZ2Gd7DQjIgt7x0+90
	 Sl+XtReiPRCA30CGO8c/jyhyP7gKqupeoJEghVib/Dwf1/+LVhuSuFOg+Yi5V1IYW+x70
	 1B3NDHZARnZ7bRRPhaY76idl48dY8hRUGOL/F2ls/vBMKXFRdau07M6EFdUTyFaMBZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873544;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mSadUDURgH4Lbi9nZMvmw3ahEKdleuYDWzgA7XRD34U=;
	b=BH09N+0fSdlR/jV2hjr4m495uPsUX5AzcjndMQTGJutcDMmW3dEtIUAjoQj/ovYARjrR
	 Ad1jsBtYCjaFzluz/gsJcoyW/WGHVZjJWi9563QK5SEh+LafevBFaW45/Ff5uZ4d4hHvy
	 /7IT4Bjb235+0c6l6H9o0A8qeH89dtWum3sS1Z4NLRIuWQY2E78izoQDXn3ibPUkYce2c
	 lKJP8q5Q/jKNfYYctmPzZMLYOdlKLLXFQqvQ1PzZkJxpsgQyL5Bp9re1RrYDbZ5clb52U
	 8yxsWcNvscwm/yDWs3lAas8cDxIOZcHUfoUaCyflZj6pxxwKfCMX8FFc4ehlovQLpsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kEOtxs0p;
	arc=none smtp.remote-ip=95.215.58.230
Received: from mta1.migadu.com (out-230.mta1.migadu.com [95.215.58.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B70606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B70606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kEOtxs0p
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CPjJNVI09qZx5LOZ+4kHkEmqRQ/X0wQlgwCOQWXvOUc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794873541; v=1; x=1795478341;
 b=kEOtxs0pudHCQuaacseSJKyPu3XjHI/5t42rL6p4z57hnKJNiIEmS/iIy+Qb5djq4jqhbUAO
 pEa/nnXaz8DYdJJUgewj4ILnJVEqrmDGqArfTOyDJL5c/BAuUH4he2BcdIUtMZM0PkCVjTltXOX
 U0n4qeKL1cLWGN+L+2FD1kv4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2198a1f1efd9a491;
	Mon, 16 Nov 2026 23:59:01 +0000
X-Mizu-Trace-ID: 2198a1f1efd9a491
X-Migadu-Flow: FLOW_OUT
Message-ID: <8375728d-c1e7-4033-8096-5d98d1bc36e9@linux.dev>
Date: Mon, 16 Nov 2026 16:58:55 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm/ksm: prevent zero-page remapping during
 ksmd-triggered THP splits
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
 <20261025-b4-ksm_fixv2-v2-2-8b61ad0491f1@linux.dev>
 <b4a82805-5b13-46d7-bdb6-0ad2eb70f148@kernel.org>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <b4a82805-5b13-46d7-bdb6-0ad2eb70f148@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/26 3:21 PM, David Hildenbrand (Arm) wrote:
> On 10/25/26 18:39, Nico Pache (Red Hat) wrote:
>> Since commit b1f202060afe ("mm: remap unused subpages to shared zeropage
>> when splitting isolated thp"), splitting an anonymous THP remaps all
>> zero-filled subpages to the shared zeropage via TTU_USE_SHARED_ZEROPAGE.
>> This flag is set unconditionally for every anonymous folio split,
>> including splits triggered by KSM.
>>
>> When KSM is enabled with THP=always, this causes two regressions:
>>
>> 1. use_zero_pages=1: KSM calls try_to_merge_one_page() which triggers
>>     split_huge_page(). The split remaps all 512 zero-filled subpages to
>>     the shared zeropage at once, freeing the entire 2MB THP when KSM only
>>     intended to process a single 4KB page. This bypasses KSM's
>>     pages_to_scan rate limiting, causing ~1GB to be freed almost
>>     instantly.
>>
>> 2. use_zero_pages=0: The same split side-effect occurs through the
>>     stable/unstable tree merge paths. Each pages_to_scan iteration
>>     triggers an expensive split_huge_page() that silently frees 2MB,
>>     while the scanner wastes cycles on tree searches for zero-filled
>>     pages that were already freed as a side-effect.
>>
>> Introduce current_is_ksmd(), which uses kthread_func() to check whether
>> the current task is the KSM scanning thread, and use it in
>> try_to_map_unused_to_zeropage() to skip zero-page remapping when the
>> split is triggered by ksmd.
>>
>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
>> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
>> ---
> 
> [...]
> 
>>   static bool __ksm_should_add_vma(const struct file *file, vma_flags_t vma_flags)
>>   {
>>   	if (vma_flags_test(&vma_flags, VMA_MERGEABLE_BIT))
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 7bdcdb57652f..c33ae3fa1043 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -305,6 +305,9 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
>>   	if (PageCompound(page) || PageHWPoison(page))
>>   		return false;
>>   
> 
> This really needs a comment like:
> 
> /*
>   * When the split is triggered by KSM, let it take care of scanning-for and
>   * de-duplicating the shared zeropage.
>   */

Ack! ill wait a day or two before sending a fixup in case others review.
> 
>> +	if (current_is_ksmd())
>> +		return false;
>> +
>>   	VM_BUG_ON_PAGE(!PageAnon(page), page);
>>   	VM_BUG_ON_PAGE(!PageLocked(page), page);
>>   	VM_BUG_ON_PAGE(pte_present(old_pte), page);
>>
> 
> I'm still a bit unclear of what happens when the split is triggered by something
> else in the system just before we walk into this THP.
> 
> Like, imagine the deferred shrinker scans for 0-filled pages and splits under
> memory pressure. Then KSM scans and essentially skips the (now-split) THP?

IIUC, we dont skip the (now-split) THP (ksm works by page, not folio), 
we would only skip over the parts that were remapped to the zeropage. 
and because the shrinker already split the folio, it wont end up even 
needing to split it.

Inversely, if ksm does run into a large folio, it splits it, but doesnt 
do the remapping. Which KSM will either eventually deduplicate itself 
(and in the case of use_zero_page=1, it will also do the zeropage 
remapping).

I asked our robot overlords if im missing anything and it did find this 
potential issue:

KSM could trigger alloc/reclaim that would then prevent the zero-page 
remapping for any reclaim done under the daemon.

It did suggest this fix `current_is_ksmd() && !current->reclaim_state` 
basically check if we are in reclaim and ksm. This would close the gap.

Or we could go back to adding a flag to split function (but i believe 
this is still somewhat cleaner and doesnt complicate the already messy 
split code).

Cheers,
-- Nico





> 

