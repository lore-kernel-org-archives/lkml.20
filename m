Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B507D4432F6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554045; cv=none; b=DFDIatp0nD20KNKCluSDidx8F9xVf0pzMSqZxitn6va9Vis977/7Km0gfbry6Lt+xxbs8pFO/baxUBDQtkdRauc69TmfUNSgTtGjN42LHhNwqQmHdoPk0VfQSGSzC4aPOyn4gs0EoDxXjMIdj6HDPENFG4kHyc9acIo2Bq+lbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554045; c=relaxed/simple;
	bh=QoqZ4zq/fm/LDsiieEAU9VPyTdxO94Ke33VsDsqLmqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WSy5u5XuS3Jm2T7TPj1qEh7Yq0JteSPGQ2N8ZskqxdJoeoB32ZhmV/1rRQ3XFKIQGswnmFRJo1QuPStY0OLE62yXU7r0a0MJ5ULearhLEnHT64+Sbqgr3389AVmJwXXPgygIPnBNaQUPdI8bUOS0DJtHTEkaYTFFeCVjK95aP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=EDXiZDX7; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="EDXiZDX7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791554039; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=71p5uQAWJGojknJOSBYU8KuAs5ErvcQvTNDLjcQGm74=;
	b=EDXiZDX7+fWEtsOKVSWrY4lgWVt2eC+RjfYSDbYUa6P7A75wOtaN9iC8fFsFKDb6GgpGiMgadgvCWOPxRqE9Y7+xP259EhkKZPS6Li1C/OQq4REJ3eJMXqAR3v9Iy4BlneZK1Sl7uxHC2pT/fYmyMoOV7aaiQSXja0eH4tXpqcE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XCTcWz3_1791554036;
Received: from 30.42.72.158(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCTcWz3_1791554036 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 21:53:57 +0800
Message-ID: <62e0ce97-1016-4f82-af38-7703c8cffefa@linux.alibaba.com>
Date: Fri, 9 Oct 2026 21:53:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: memory: fix truncation removing mapped folios
To: Pedro Falcato <pfalcato@suse.de>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 qi.zheng@linux.dev, jack@suse.cz, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <0d2a1809fa1cfc22ad3df26ec28b2d30e5cdf3bd.1791540483.git.baolin.wang@linux.alibaba.com>
 <asjXJZap53yJWMYi@gremlin> <asjr2zCp1BVtfpTV@pedro-suse.tail5790ac.ts.net>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <asjr2zCp1BVtfpTV@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/26 9:36 PM, Pedro Falcato wrote:
> On Fri, Oct 09, 2026 at 01:00:52PM +0100, Lorenzo Stoakes (ARM) wrote:
>> On Fri, Oct 09, 2026 at 06:12:03PM +0800, Baolin Wang wrote:
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index 1f5d5f7d39cd..0272217ad7b0 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>
>>> @@ -2044,16 +2053,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>>>   	 * to ensure they are still none, thereby preventing the pte entries
>>>   	 * from being repopulated by another thread.
>>>   	 */
>>> -	if (can_reclaim_pt && direct_reclaim && addr == end)
>>> +	if (can_reclaim_pt && direct_reclaim && addr == end) {
>>> +		/* rmap changes need to be observed before e.g PTEs get zapped. */
>>> +		smp_wmb();
>>
>> What does this pair with? You should always say what in the comment.
> 
> Yep, this is missing a rmb to pair with. The diff I posted at
> https://lore.kernel.org/linux-mm/asigKktcrSY80A_2@pedro-suse.tail5790ac.ts.net/
> had one in zap_pmd_range(), which admittedly isn't the greatest. I'm not sure if
> there's a better way to do this.

I don't think we need an rmb to pair with. This is because the 
folio_mapped() check in __filemap_remove_folio() cannot be reordered 
(guarded by spinlock) with the pmd_none() check in zap_pmd_range().

We just need to guarantee that when we find a pmd_none(), the removal of 
the folio's mapping (via tlb_flush_rmaps()) is already observed.


>> rmb/wmb are generally not needed vs. acquire/release. Are you sure a wmb is
>> right here?
> 
> I don't think that works, because __folio_remove_rmap has a ton of stuff going
> on, some implying full ordering, others not. Plus you'd need to switch the pmd
> dereference to something like an smp_load_acquire().

Agree.
