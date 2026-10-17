Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAC38E8B4
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 05:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792215820; cv=none; b=cA0jx1Rv0BcU/Xc8TW+JA9i/DUcD4CwWicmdGpixBpznxOJaiF+Ve9ELIv+9Y3Bqlpv7MRm7URH4IS5Rq7BXJ2692RuIh30kx5nYjv14L441wbaGYH2Jx7qXJyLM89yPTh0TukOfzSpwc5gciQ6yav+PXzFXle6gtOCxibSFYVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792215820; c=relaxed/simple;
	bh=ukDYy32ORfJGPl2W3fDYbW46UYRmceiEfPmdkjdbq4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdWBD3Q9HgAndRmIokGEQZMVKdczOBkmuORBo5GBSeDbpnxYEq7eYGKO6PWPqJspkghAf8Cz+rH0BIIMWTTycwilni47giwGIkqlXIQ/86oHGmeMfBLGeS/n/vpcMt5UoLqNQ2tIdn9IwXWZV/2xGQC5DmFkgEEoDKWADFZcX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=N32TcfAt; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="N32TcfAt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792215808; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7NzrDCYoAPXZ3QXhbNS3e0GZIh1YHAHXFMXaEZ1z778=;
	b=N32TcfAtSW1cRzMDQX4PO2qg/QGUEaAglHCyTsNdr1ptE1Hp/SF8BTHeHKQVtMlWNDuU4IhptJWhqUrkg4ymlJT9pXqY+IXwPnZzda2fI2C2mykvzC7MpfkUJEmIWLHZCsrU7+rllC4UjMPC9kTMagmmTcvTAXxaBQlTGwPFAwY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XCwbfOi_1792215805;
Received: from 30.42.72.158(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCwbfOi_1792215805 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 17 Oct 2026 13:43:26 +0800
Message-ID: <6a005d89-df5b-4524-a4b9-c637cb15f1ee@linux.alibaba.com>
Date: Sat, 17 Oct 2026 13:43:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] khugepaged: fix readahead lock inversion in
 collapse_file()
To: Pedro Falcato <pfalcato@suse.de>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 david@kernel.org, ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 usama.arif@linux.dev, kas@kernel.org, jack@suse.cz, djwong@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, hch@lst.de,
 syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com,
 ngocthang2710.1999@gmail.com, willy@infradead.org, rppt@kernel.org,
 ljs@kernel.org
References: <20261016065920.4153-1-lance.yang@linux.dev>
 <27e5aadc-2d68-428f-a958-308e4a75c058@linux.alibaba.com>
 <atICp2NL8j2z7UFM@pedro-suse.tail5790ac.ts.net>
 <atIiR1NWNssDvgt6@pedro-suse.tail5790ac.ts.net>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <atIiR1NWNssDvgt6@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 9:18 PM, Pedro Falcato wrote:
> On Fri, Oct 16, 2026 at 12:00:24PM +0100, Pedro Falcato wrote:
>> On Fri, Oct 16, 2026 at 05:57:48PM +0800, Baolin Wang wrote:
>>>
>>>
>>> On 10/16/26 2:59 PM, Lance Yang wrote:
>>>> collapse_file() can end up calling page_cache_sync_readahead() with
>>>> source folios from earlier in the range still locked. If truncate already
>>>> holds mapping->invalidate_lock exclusively and is waiting for one of
>>>> those folios, readahead blocks on the same invalidate_lock and neither
>>>> side can make progress.
>>>>
>>>> Do readahead in a separate pass before we start holding source folios
>>>> locked for collapse. Keep page_cache_sync_readahead() and its existing
>>>> policy, and drop each folio's lock and reference after checking that it
>>>> is uptodate. If truncate or reclaim removes a folio between the two
>>>> passes, roll back instead of doing readahead again with source folios
>>>> locked.
>>>>
>>>> Shmem handles swapin and fallocated folios through shmem_get_folio()
>>>> without taking mapping->invalidate_lock, so it isn't affected by this
>>>> lock inversion.
>>>>
>>>> Reported-by: syzbot+16bf7cd0ebeb1de93aa5@syzkaller.appspotmail.com
>>>> Closes: https://syzkaller.appspot.com/bug?extid=16bf7cd0ebeb1de93aa5
>>>> Fixes: 730633f0b7f9 ("mm: Protect operations adding pages to page cache with invalidate_lock")
>>>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>>>> ---
>>>
>>> Thanks for the fix.
>>>
>>>> Thanks to Nguyen Ngoc Thang for v2. David asked for volunteers, so I'm
>>>> happy to take this over.
>>>>
>>>> Some older stable trees lack the folio infrastructure used here, and the
>>>> code will differ for each stable tree, so each backport will need quite a
>>>> bit of rework and its own review. I'm not sure whether to Cc stable here.
>>>> Once we agree on the fix, I'll send a separate backport for each maintained
>>>> stable tree except 5.10, which isn't affected.
>>>>
>>>> v2 -> v3:
>>>>    - Replace the scan-wide invalidate_lock and page_cache_ra_unbounded() with
>>>>      a preparation pass using page_cache_sync_readahead().
>>>>    - Roll back on a new page cache miss during collapse.
>>>>    - https://lore.kernel.org/all/20260913163644.122133-1-ngocthang2710.1999@gmail.com/
>>>>
>>>>    mm/khugepaged.c | 42 +++++++++++++++++++++++++++++++-----------
>>>>    1 file changed, 31 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index ef5cd6fda34f..b3f67617caf0 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -2262,6 +2262,34 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>>>>    	new_folio->index = start;
>>>>    	new_folio->mapping = mapping;
>>>> +	if (!is_shmem) {
>>>> +		/*
>>>> +		 * Populate the range before accumulating locked source folios:
>>>> +		 * readahead may block on invalidate_lock.
>>>> +		 */
>>>> +		for (index = start; index < end;) {
>>>
>>> why drop xas_unlock_irq()?
>>>
>>>> +			folio = filemap_lock_folio(mapping, index);
>>>> +			if (IS_ERR(folio)) {
>>>> +				page_cache_sync_readahead(mapping, &file->f_ra,
>>>> +							  file, index, end - index);
>>>> +				folio = filemap_lock_folio(mapping, index);
>>>> +				if (IS_ERR(folio)) {
>>>> +					result = SCAN_FAIL;
>>>> +					goto rollback;
>>>> +				}
>>>> +			}
>>>> +			if (!folio_test_uptodate(folio))
>>>> +				result = SCAN_FAIL;
>>>
>>> Do we need to check PG_uptodate after locking the folio? If we successfully
>>> lock the folio, doesn't that mean the read I/O has completed? The following
>>
>> Yes, you do; a read can "complete" without the IO having completed successfully,
>> and in those cases PG_uptodate is not set, but the folio is unlocked.

OK.

>> Either way, why are we checking for uptodate here? We only care for starting readahead.
>> Anyway, I would possibly recommend we do this as post-processing, not pre-processing.
>> The current loop is a little overhead-happy.
> 
> To clarify: I would do this kind of RA as an error path if isolation failed.

Sounds good.

> Namely, at the end of rollback, after unlocking folios. It doesn't make sense
> to me to do this kind of checking upfront. I don't think it's particularly
> realistic that, starting RA upfront, you'd see uptodate completed folio reads
> when doing the actual isolation.

But why not add RA logic in collapse_pmd(), as we do for 
SCAN_PAGE_DIRTY_OR_WRITEBACK? There's already retry logic there, and 
this would also simplify the long collapse_file().
