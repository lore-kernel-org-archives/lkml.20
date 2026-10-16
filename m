Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9D381EB9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165437; cv=none; b=bHFNvqDG+PiK78faCZyiubmlO8J7zUl9NXW+U/GhAS4gBuSjB9t8Aql0Cx1B85NwqFtB8JkI0rqPggGjh96YchGTYpYQ6ruQSqXc49ILykI3OwICU3p5Kp3ViUF9S8UMJfg/gJJLMJP64oN5w/STN9YkXkjLHTmFJAqCi4RVtRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165437; c=relaxed/simple;
	bh=74rKIlxgrRlJgR/t85SrsshrUgXIRHxay9Odnbdgk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hUSg0E1KuMU+T5Ki1bVrVxBhvobZHwPTXv+l5cWqVm5e9RGmEYD0JaPnqqU+9bawrqfD2DymLksrHOmL7rUpsD2wKzFC5TW5myqghbSV6hmAWtJ37AV5N+FBUr3+JrxVi3hkDE1Ujz6gG0Jkf7PuAYQ0FykZzQVTjLdcezLo2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vxnDC9zU; arc=none smtp.client-ip=95.215.58.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vxnDC9zU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=74rKIlxgrRlJgR/t85SrsshrUgXIRHxay9Odnbdgk5Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792165430; v=1; x=1792770230;
 b=vxnDC9zUUKPiBmAOIM0L+miPOrd+53bTqqQl4vMZfV6uML9mlJFKqqMkSpZj2w5cqPxhX6Iv
 iM56fiUM5AWOJsalqf+MUL7ktKZqBN4XJrHfHV9Pl+Mo5S6yXDFLen71WwwMl9f6NPOBnemeevt
 K6HAfcIvgfnqxkMLSGSqturI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 988393ee6a1b987b;
	Fri, 16 Oct 2026 15:43:50 +0000
X-Mizu-Trace-ID: 988393ee6a1b987b
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: baolin.wang@linux.alibaba.com,
	pfalcato@suse.de
Cc: lance.yang@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	kas@kernel.org,
	jack@suse.cz,
	djwong@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com,
	ngocthang2710.1999@gmail.com,
	willy@infradead.org,
	rppt@kernel.org,
	ljs@kernel.org
Subject: Re: [PATCH v3 1/1] khugepaged: fix readahead lock inversion in collapse_file()
Date: Fri, 16 Oct 2026 23:43:42 +0800
Message-ID: <20261016154342.31940-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <27e5aadc-2d68-428f-a958-308e4a75c058@linux.alibaba.com>
References: <27e5aadc-2d68-428f-a958-308e4a75c058@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+Cc: Pedro

On Fri, Oct 16, 2026 at 05:57:48PM +0800, Baolin Wang wrote:
>
>
>On 10/16/26 2:59 PM, Lance Yang wrote:
>> collapse_file() can end up calling page_cache_sync_readahead() with
>> source folios from earlier in the range still locked. If truncate already
>> holds mapping->invalidate_lock exclusively and is waiting for one of
>> those folios, readahead blocks on the same invalidate_lock and neither
>> side can make progress.
>> 
>> Do readahead in a separate pass before we start holding source folios
>> locked for collapse. Keep page_cache_sync_readahead() and its existing
>> policy, and drop each folio's lock and reference after checking that it
>> is uptodate. If truncate or reclaim removes a folio between the two
>> passes, roll back instead of doing readahead again with source folios
>> locked.
>> 
>> Shmem handles swapin and fallocated folios through shmem_get_folio()
>> without taking mapping->invalidate_lock, so it isn't affected by this
>> lock inversion.
>> 
>> Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
>> Fixes: 730633f0b7f9 ("mm: Protect operations adding pages to page cache with invalidate_lock")
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>> ---
>
>Thanks for the fix.

Cheers!

>> Thanks to Nguyen Ngoc Thang for v2. David asked for volunteers, so I'm
>> happy to take this over.
>> 
>> Some older stable trees lack the folio infrastructure used here, and the
>> code will differ for each stable tree, so each backport will need quite a
>> bit of rework and its own review. I'm not sure whether to Cc stable here.
>> Once we agree on the fix, I'll send a separate backport for each maintained
>> stable tree except 5.10, which isn't affected.
>> 
>> v2 -> v3:
>>   - Replace the scan-wide invalidate_lock and page_cache_ra_unbounded() with
>>     a preparation pass using page_cache_sync_readahead().
>>   - Roll back on a new page cache miss during collapse.
>>   - https://lore.kernel.org/all/20260913163644.122133-1-ngocthang2710.1999@gmail.com/
>> 
>>   mm/khugepaged.c | 42 +++++++++++++++++++++++++++++++-----------
>>   1 file changed, 31 insertions(+), 11 deletions(-)
>> 
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index ef5cd6fda34f..b3f67617caf0 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -2262,6 +2262,34 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>>   	new_folio->index = start;
>>   	new_folio->mapping = mapping;
>>   
>> +	if (!is_shmem) {
>> +		/*
>> +		 * Populate the range before accumulating locked source folios:
>> +		 * readahead may block on invalidate_lock.
>> +		 */
>> +		for (index = start; index < end;) {
>
>why drop xas_unlock_irq()?

Hmm ... we haven't taken the lock here yet, so there's just nothing to
unlock, no?

>> +			folio = filemap_lock_folio(mapping, index);
>> +			if (IS_ERR(folio)) {
>> +				page_cache_sync_readahead(mapping, &file->f_ra,
>> +							  file, index, end - index);
>> +				folio = filemap_lock_folio(mapping, index);
>> +				if (IS_ERR(folio)) {
>> +					result = SCAN_FAIL;
>> +					goto rollback;
>> +				}
>> +			}
>> +			if (!folio_test_uptodate(folio))
>> +				result = SCAN_FAIL;
>
>Do we need to check PG_uptodate after locking the folio? If we 
>successfully lock the folio, doesn't that mean the read I/O has 
>completed? The following code also checks the writeback flag, so the 
>uptodate check seems unnecessary to me.

IIRC, the folio gets unlocked even if the read fails. I just wanted to
catch read errors early. And yeah, we already check uptodate later,
so this one can go, thanks!

>> +			index = folio_next_index(folio);
>> +			folio_unlock(folio);
>> +			folio_put(folio);
>> +			if (result != SCAN_SUCCEED)
>> +				goto rollback;
>> +		}
>> +		/* drain lru cache to help folio_isolate_lru() */
>> +		lru_add_drain();
>> +	}
>
>Could we factor this code out into a small helper?

Okay, let me play with it a bit :) Might pull it out if it reads cleaner.

Thanks, Lance

>> +
>>   	/*
>>   	 * Ensure we have slots for all the pages in the range.  This is
>>   	 * almost certainly a no-op because most of the pages must be present
>> @@ -2320,17 +2348,9 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>>   			}
>>   		} else {	/* !is_shmem */
>>   			if (!folio || xa_is_value(folio)) {
>> -				xas_unlock_irq(&xas);
>> -				page_cache_sync_readahead(mapping, &file->f_ra,
>> -							  file, index,
>> -							  end - index);
>> -				/* drain lru cache to help folio_isolate_lru() */
>> -				lru_add_drain();
>> -				folio = filemap_lock_folio(mapping, index);
>> -				if (IS_ERR(folio)) {
>> -					result = SCAN_FAIL;
>> -					goto xa_unlocked;
>> -				}
>> +				/* The range changed after the preparation pass. */
>> +				result = SCAN_PAGE_LOCK;
>> +				goto xa_locked;
>>   			} else if (folio_test_dirty(folio)) {
>>   				/*
>>   				 * This page is dirty because it hasn't
>
>
