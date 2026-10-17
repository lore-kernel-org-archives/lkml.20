Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64BB3955EC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792214777; cv=none; b=Bv43/NOs7fsDKhRg7GWJAZufMjoh2Jt+lwfHMsYsbqNLtf4pbkRZTuK7lzR81Ue2W7XldyZE1zEB8JoHvirzx3vkGQlfSbTl823JEXPJmSBHMCpNzyup0vZplUbl1nK3nSFMjc0S6DeRFGVy/4RBrLYRa6pAIUmhkza3Rh4UA84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792214777; c=relaxed/simple;
	bh=m9hKpSrHK+hO1alsflf0Nqz99b/yusPaCW6Fq+Ekkb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4K7+tblD72sdjHosY2dJQhD0177tpUm4LCeo31xBCF6BPJDQd25ooNNOShomfWfOKAwt//Bm+wcqGIePV872pYum5Ex4ePzf/U9vYf6dxE8ripg033HNgMNCAaN10EytppCj5amYi2rzRAz/tZkP7T57/DL1K6nBnyOHZ/O45U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uKiTq+hb; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uKiTq+hb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792214770; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=l3GgPGTx3643lXfeM9v6MzNcAxFHDhjpDZHTgMJtQGg=;
	b=uKiTq+hbcEe1dl4bd+7J8ngU6kzPOiOui/JCNp/7y4nVj+AUVHYTSFAE3bGVZuaEAtAxIzx+dtdICvdbrgwGNU6VE1FXumlIl1ylp8Tmeo4Axn/486xEUO4ePo42e9HX9j9FHbKS40zLehqRwFwAagcie16Ib5pFo/DVfW1imbI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XCwX9so_1792214768;
Received: from 30.42.72.158(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCwX9so_1792214768 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 Oct 2026 13:26:09 +0800
Message-ID: <5b8d5b3b-9308-40d1-91f5-8c6ea045c596@linux.alibaba.com>
Date: Sat, 17 Oct 2026 13:26:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] khugepaged: fix readahead lock inversion in
 collapse_file()
To: Lance Yang <lance.yang@linux.dev>, pfalcato@suse.de
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com,
 liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org,
 jack@suse.cz, djwong@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hch@lst.de,
 syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com,
 ngocthang2710.1999@gmail.com, willy@infradead.org, rppt@kernel.org,
 ljs@kernel.org
References: <27e5aadc-2d68-428f-a958-308e4a75c058@linux.alibaba.com>
 <20261016154342.31940-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261016154342.31940-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 11:43 PM, Lance Yang wrote:
> +Cc: Pedro
> 
> On Fri, Oct 16, 2026 at 05:57:48PM +0800, Baolin Wang wrote:
>>
>>
>> On 10/16/26 2:59 PM, Lance Yang wrote:
>>> collapse_file() can end up calling page_cache_sync_readahead() with
>>> source folios from earlier in the range still locked. If truncate already
>>> holds mapping->invalidate_lock exclusively and is waiting for one of
>>> those folios, readahead blocks on the same invalidate_lock and neither
>>> side can make progress.
>>>
>>> Do readahead in a separate pass before we start holding source folios
>>> locked for collapse. Keep page_cache_sync_readahead() and its existing
>>> policy, and drop each folio's lock and reference after checking that it
>>> is uptodate. If truncate or reclaim removes a folio between the two
>>> passes, roll back instead of doing readahead again with source folios
>>> locked.
>>>
>>> Shmem handles swapin and fallocated folios through shmem_get_folio()
>>> without taking mapping->invalidate_lock, so it isn't affected by this
>>> lock inversion.
>>>
>>> Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
>>> Fixes: 730633f0b7f9 ("mm: Protect operations adding pages to page cache with invalidate_lock")
>>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>>> ---
>>
>> Thanks for the fix.
> 
> Cheers!
> 
>>> Thanks to Nguyen Ngoc Thang for v2. David asked for volunteers, so I'm
>>> happy to take this over.
>>>
>>> Some older stable trees lack the folio infrastructure used here, and the
>>> code will differ for each stable tree, so each backport will need quite a
>>> bit of rework and its own review. I'm not sure whether to Cc stable here.
>>> Once we agree on the fix, I'll send a separate backport for each maintained
>>> stable tree except 5.10, which isn't affected.
>>>
>>> v2 -> v3:
>>>    - Replace the scan-wide invalidate_lock and page_cache_ra_unbounded() with
>>>      a preparation pass using page_cache_sync_readahead().
>>>    - Roll back on a new page cache miss during collapse.
>>>    - https://lore.kernel.org/all/20260913163644.122133-1-ngocthang2710.1999@gmail.com/
>>>
>>>    mm/khugepaged.c | 42 +++++++++++++++++++++++++++++++-----------
>>>    1 file changed, 31 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index ef5cd6fda34f..b3f67617caf0 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -2262,6 +2262,34 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>>>    	new_folio->index = start;
>>>    	new_folio->mapping = mapping;
>>>    
>>> +	if (!is_shmem) {
>>> +		/*
>>> +		 * Populate the range before accumulating locked source folios:
>>> +		 * readahead may block on invalidate_lock.
>>> +		 */
>>> +		for (index = start; index < end;) {
>>
>> why drop xas_unlock_irq()?
> 
> Hmm ... we haven't taken the lock here yet, so there's just nothing to
> unlock, no?

Ah, yes, I misread the diff. Sorry for noise:) .

>>> +			folio = filemap_lock_folio(mapping, index);
>>> +			if (IS_ERR(folio)) {
>>> +				page_cache_sync_readahead(mapping, &file->f_ra,
>>> +							  file, index, end - index);
>>> +				folio = filemap_lock_folio(mapping, index);
>>> +				if (IS_ERR(folio)) {
>>> +					result = SCAN_FAIL;
>>> +					goto rollback;
>>> +				}
>>> +			}
>>> +			if (!folio_test_uptodate(folio))
>>> +				result = SCAN_FAIL;
>>
>> Do we need to check PG_uptodate after locking the folio? If we
>> successfully lock the folio, doesn't that mean the read I/O has
>> completed? The following code also checks the writeback flag, so the
>> uptodate check seems unnecessary to me.
> 
> IIRC, the folio gets unlocked even if the read fails. I just wanted to
> catch read errors early. And yeah, we already check uptodate later,
> so this one can go, thanks!
> 
>>> +			index = folio_next_index(folio);
>>> +			folio_unlock(folio);
>>> +			folio_put(folio);
>>> +			if (result != SCAN_SUCCEED)
>>> +				goto rollback;
>>> +		}
>>> +		/* drain lru cache to help folio_isolate_lru() */
>>> +		lru_add_drain();
>>> +	}
>>
>> Could we factor this code out into a small helper?
> 
> Okay, let me play with it a bit :) Might pull it out if it reads cleaner.

Thanks. Because collapse_file() is already too long.
