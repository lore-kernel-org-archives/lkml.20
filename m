Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF16335067
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117156; cv=none; b=oKu86IFqY4kYP0mVJ0fRzo1n9GRXIii63gHwKG5ESCKQYy0InpO2cCwJ2YrmsbjocgeOH3azpWK1uVVe4lKjrBtS3xClBiYLGMEAt1My1z2wAoT5RPPUX2bOkK88r2FCJHhIUNfFRZkcCdD6PVCRWFTOHin+iB7cPTzrDwyFdDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117156; c=relaxed/simple;
	bh=17KKcw8hwoNEkFzjNMvkidkGWg1lqcGVBB0m+8zSDac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FywVgjn+UV0p1iCQAjIC/4rI8rvBUj3s+Ckz3Edti7dmA+B8YKcOA5cwnv0gO18xJnqOX8/quhAJy0ot1HOTKICSYUiZqKbr65QuuhX+qcRONPH7RC86sMqoaN6KnoVrA7hDbs1ucoDqeCb8O7/X0GUG3E/bgo2eBsZegbi1Ls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K5SXbDaE; arc=none smtp.client-ip=95.215.58.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K5SXbDaE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=17KKcw8hwoNEkFzjNMvkidkGWg1lqcGVBB0m+8zSDac=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792117151; v=1; x=1792721951;
 b=K5SXbDaET/LyArJ2C9dEuB81ecVrFVauvXZTm7dejxYoy9gLFAYVMj2i40zYmbFS/7jefZPo
 vqqjsDtFZa0IlrTyQEPC8HJe8xC7NvfjmEZEWIBDOS7RiCy1HKPRQ1ACEta7GXD+1i1o3ekQvdF
 V+p/6S7K7b4OZ9AeJ72CcRQ8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9117b98bd5139204;
	Fri, 16 Oct 2026 02:19:10 +0000
X-Mizu-Trace-ID: 9117b98bd5139204
X-Migadu-Flow: FLOW_OUT
Message-ID: <37f1af42-9788-4552-86a4-516299241ee8@linux.dev>
Date: Fri, 16 Oct 2026 10:19:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/swap: fix swap_cache_get_folio() returning a folio
 that left the swap cache
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
References: <20261015060528.302634-1-jiayuan.chen@linux.dev>
 <20261015190619.deccb92624e356bf81084a24@linux-foundation.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261015190619.deccb92624e356bf81084a24@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 10/16/26 10:06 AM, Andrew Morton wrote:
> On Thu, 15 Oct 2026 14:05:27 +0800 Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>
>> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>>
>> swap_cache_get_folio() reads the folio from the swap table and takes a
>> reference with folio_try_get(), without any lock. If the folio is
>> removed from the swap cache and freed in between, and its memory gets
>> reused, folio_try_get() still succeeds and we return a page that has
>> nothing to do with the swap entry:
>>
>>    CPU 0                                  CPU 1
>>    do_swap_page()
>>      swap_cache_get_folio()
>>        swp_tb = swap_table_get()
>>        folio = swp_tb_to_folio(swp_tb)
>>                                           madvise(MADV_DONTNEED)
>>                                             zap_nonpresent_ptes()
>>                                               swap_put_entries_direct()
>>                                                 swap_put_entries_cluster()
>>                                                   __try_to_reclaim_swap()
>>                                                     swap_cache_del_folio()
>>                                                     folio_put()   <- freed
>>                                           page reused, e.g. as an anon
>>                                           folio of another task
>>        folio_try_get(folio)               <- succeeds
>>        return folio
>>      swap_update_readahead()              <- may clear PG_readahead on it
>>      folio_lock_or_retry()                <- locks it
>>      folio_matches_swap_entry() fails, unlock and put
>>
>> filemap_get_entry() does the same lockless lookup for the page cache,
>> and after folio_try_get() it rechecks the xarray, because the folio may
>> have been freed and reused in between. swap_cache_get_folio() lost
>> that recheck when the swap cache moved to the swap table.
>>
>> So CPU 0 writes to a folio it doesn't own: it may clear PG_readahead and
>> takes the folio lock of someone else's page, before
>> folio_matches_swap_entry() finds out the folio is not ours.
>>
>> Recheck the slot after folio_try_get() and retry if it no longer holds
>> this folio.
> LLM says to me:
>
> : The original folio could conceivably be freed, its physical page
> : reused, and the same PFN inserted into the same swap-table slot before
> : the second lookup.  That would pass the check.  However, the returned
> : reference would then belong to the newly inserted folio, and the later
> : swap-entry validation would still be required.  I don't see that as
> : invalidating this fix.



I had the same worry at first, data corruption or something worse, but
after thinking it through I agree. Passing the check there is fine:
the folio we return is the one currently in the slot, which is what
the function promises, and callers still check folio_matches_swap_entry()
under the folio lock before using it. That's why I didn't mention it in 
the changelog.


>> --- a/mm/swap_state.c
>> +++ b/mm/swap_state.c
>> @@ -92,17 +92,27 @@ void show_swap_cache_info(void)
>>    */
>>   struct folio *swap_cache_get_folio(swp_entry_t entry)
>>   {
>> +	struct swap_cluster_info *ci = __swap_entry_to_cluster(entry);
>> +	unsigned int ci_off = swp_cluster_offset(entry);
>>   	unsigned long swp_tb;
>>   	struct folio *folio;
>>   
>>   	for (;;) {
>> -		swp_tb = swap_table_get(__swap_entry_to_cluster(entry),
>> -					swp_cluster_offset(entry));
>> +		swp_tb = swap_table_get(ci, ci_off);
>>   		if (!swp_tb_is_folio(swp_tb))
>>   			return NULL;
>>   		folio = swp_tb_to_folio(swp_tb);
>> -		if (likely(folio_try_get(folio)))
>> +		if (!folio_try_get(folio))
>> +			continue;
>> +		/*
>> +		 * The folio may have been freed and its memory reused before
>> +		 * we got the reference. Make sure it is still in the slot.
>> +		 */
>> +		swp_tb = swap_table_get(ci, ci_off);
>> +		if (likely(swp_tb_is_folio(swp_tb) &&
>> +			   swp_tb_to_folio(swp_tb) == folio))
>>   			return folio;
>> +		folio_put(folio);
>>   	}
>>   
>>   	return NULL;
> This return is now unreachable...


Right, and it never was reachable, the loop has no break. It should have 
been dropped earlier...

