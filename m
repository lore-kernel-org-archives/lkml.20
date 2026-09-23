Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920A62DEA8C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127251; cv=none; b=TTbQHjthmmjlAhAq9PvEsv3tc/wUPgiz0LBzXyfMAGJv0ABZ2bTgeO8QqRQGJ5/zlsviS/JyTQxqVRtGA/iUxfRIVo2QveszLNVM7KdD7iuLXArVN5Nbdo5cAdGVZlCNECoh2o7wdsE67Qr6Kn2+ZpTemd+oiDbVzuwqJuZhV5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127251; c=relaxed/simple;
	bh=8d80LJ96vgZrN81BXxGjr986A48EXWNTby2ICNKL14s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/GaCEaEuR1ZJeGLuuTW2xfeM/TJL5r4vOzGeQH6875Vag4oOzNaBqm6LGSawAronKK+ZhNnT5Nce31n0pI3R4W0zlJzsn9LrRc2+2s9/062B/y/XVVsfDbHXnBB7xzZL8CIdzz6Z/3PhOGaMnfs5R/AtyvrCV8lNwblI3neYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ATf+/ljO; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ATf+/ljO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790127246; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ju8/8hlgVD7koLs0Ca8D1iyAWrg9qc7MYYjxWgNuOVs=;
	b=ATf+/ljO1xNImK5YPSFsldSq0wMhcnL4jAD8FjT8PVdQSxLrQRCb6uya/oRATHWX6YBmZ28P+Tv6E1nA/MzgpcyYoazsHA965J1KimiZbE7zBn3Ia1Fl9XFaOQP8w0ckTuw2osEG7WiWMBQe5qO7hJXpFvQ3HZEdXLGwsfhXl4A=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XBVICt._1790127243;
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBVICt._1790127243 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 09:34:04 +0800
Message-ID: <1619fbdf-9d68-43ef-afa6-66dbe3e61c77@linux.alibaba.com>
Date: Wed, 23 Sep 2026 09:34:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/shmem: don't release a swapin-error marker as a swap
 entry
To: David CARLIER <devnexen@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 kasong@tencent.com, bhe@redhat.com, chrisl@kernel.org, baohua@kernel.org,
 nphamcs@gmail.com, shikemeng@huaweicloud.com, hughd@google.com,
 syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
References: <20260920155002.1030454-1-devnexen@gmail.com>
 <fe49c311-582b-4ee2-8d17-42a758351570@linux.alibaba.com>
 <CA+XhMqy_0UPL5HfPYhPHeJ-ZngG4DRzme_a32sLSYd2VGSjo3g@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CA+XhMqy_0UPL5HfPYhPHeJ-ZngG4DRzme_a32sLSYd2VGSjo3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/26 5:03 AM, David CARLIER wrote:
> On Mon, 21 Sept 2026 at 03:45, Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 9/20/26 11:50 PM, David Carlier wrote:
>>> A failed shmem swapin frees the swap slot and leaves a PTE_MARKER_POISONED
>>> entry in the page cache. On truncate or eviction shmem_free_swap() passes
>>> that marker to swap_put_entries_direct(), which warns because it is not a
>>> swap entry. There is nothing left to release either way.
>>>
>>> Skip the release for non-swap entries, as every other caller already does.
>>>
>>> Reported-by: syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=23b25ba3c6bf971f9c57
>>> Fixes: ac2d3268284b ("mm/swapfile.c: remove the unneeded checking")
>>> Signed-off-by: David Carlier <devnexen@gmail.com>
>>> ---
>>>    mm/shmem.c | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>> index b572c60f2af8..94f2c59c8cfc 100644
>>> --- a/mm/shmem.c
>>> +++ b/mm/shmem.c
>>> @@ -1184,6 +1184,7 @@ static long shmem_free_swap(struct address_space *mapping,
>>>                            pgoff_t index, pgoff_t end, void *radswap)
>>>    {
>>>        XA_STATE(xas, &mapping->i_pages, index);
>>> +     const softleaf_t swp = radix_to_swp_entry(radswap);
>>>        unsigned int nr_pages = 0;
>>>        pgoff_t base;
>>>        void *entry;
>>> @@ -1200,8 +1201,9 @@ static long shmem_free_swap(struct address_space *mapping,
>>>        }
>>>        xas_unlock_irq(&xas);
>>>
>>> -     if (nr_pages)
>>> -             swap_put_entries_direct(radix_to_swp_entry(radswap), nr_pages);
>>> +     /* A swapin-error marker holds no swap slot, so just drop it. */
>>> +     if (nr_pages && softleaf_is_swap(swp))
>>> +             swap_put_entries_direct(swp, nr_pages);
>>>
>>>        return nr_pages;
>>>    }
>>
>> Makes sense to me.
>>
>> But another issue caught my eye. Since we already call
>> shmem_recalc_inode() to decrement 'info->swapped' when handling poisoned
>> entries in shmem_set_folio_swapin_error(), shmem_free_swap() still
>> returning 'nr_pages' for poisoned entries would cause a second call to
>> shmem_recalc_inode(inode, 0, -nr_swaps_freed), thus triggerring
>> WARN_ON(i_blocks) in shmem_evict_inode().
>>
>> I'm not sure if you've observed this warning. IIUC, shmem_free_swap()
>> should return 0 for poisoned entries.
> 
> Hi Baolin,
> 
> Thanks for the review.
> 
> I think returning nr_pages is needed. shmem_set_folio_swapin_error()
> decrements both alloced and swapped, so shmem_recalc_inode() sees
> nothing freed and the block stays accounted. The second decrement in
> shmem_undo_range() is what finally releases it. Returning 0 there
> would leave i_blocks non-zero at evict time.

Yes, you are right. My memory is coming back :). So,

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
