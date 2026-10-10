Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A013803D9
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601028; cv=none; b=S7z11koFL2lRMZg60hyyAprYmcL1fJmBfr4nvYxlBNjFJpZz7AgfvtbIsawKJfftcheg4FjUccA6Sm07WpRHY8e6AJztsG9SY6m7F+/d0RjBqz9B6q+EDBTJ+5O4xq2WAFObL8yLhQ9Zp/3t3X0xqCLdtpQiVSjuf0q358Q7kjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601028; c=relaxed/simple;
	bh=VbDWiND07LsavhXKS1M5AE1Nywf5rTqKFpKy3ATgyyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkA5uQLCE75py7+0OsQ2raCjKT99AfvjJzcJYv2Ju17E7T3E9gPm/hldYyVYyYtPp/wGt3Qcvau9mU9qFAjMbadNzb0ktG0wDv/EdmlgYPggO87CXIRn5D2jsclvgxZuCr91yf2G+40wGmTBMlqmufF8yRcX6JzHVIdwx5eXTFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PQEji/w7; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PQEji/w7"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791601022; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=j5jEa26nyH8IslPvDz7idIbI8zvRhCKMtempuPJaz6w=;
	b=PQEji/w7DSgAG36obwRmf9IKVOG3SDwaYgP5QqVQQRKTpdUl7JrMrxn2cM0xdReyU/ciuGzsvpK1Lk6hHa3m5lVuZoDRL9Fe4Lw+2AzSoL1QKDip90N8H6l3Ti/piJDTQ9EGmAJjmUla/97IC/P/i/cT/MdNwdc/euDDru+lkwk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XCUyC8C_1791601020;
Received: from 30.74.144.133(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCUyC8C_1791601020 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 10 Oct 2026 10:57:01 +0800
Message-ID: <1b77c2d7-acc6-476a-b5cd-547471a46409@linux.alibaba.com>
Date: Sat, 10 Oct 2026 10:56:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: memory: fix truncation removing mapped folios
To: Pedro Falcato <pfalcato@suse.de>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, akpm@linux-foundation.org,
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <0d2a1809fa1cfc22ad3df26ec28b2d30e5cdf3bd.1791540483.git.baolin.wang@linux.alibaba.com>
 <asjXJZap53yJWMYi@gremlin> <asjr2zCp1BVtfpTV@pedro-suse.tail5790ac.ts.net>
 <62e0ce97-1016-4f82-af38-7703c8cffefa@linux.alibaba.com>
 <askdZgd5P986OSMx@pedro-suse.tail5790ac.ts.net>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <askdZgd5P986OSMx@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/10/26 1:01 AM, Pedro Falcato wrote:
> On Fri, Oct 09, 2026 at 09:53:55PM +0800, Baolin Wang wrote:
>>
>>
>> On 10/9/26 9:36 PM, Pedro Falcato wrote:
>>> On Fri, Oct 09, 2026 at 01:00:52PM +0100, Lorenzo Stoakes (ARM) wrote:
>>>> On Fri, Oct 09, 2026 at 06:12:03PM +0800, Baolin Wang wrote:
>>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>>> index 1f5d5f7d39cd..0272217ad7b0 100644
>>>>> --- a/mm/memory.c
>>>>> +++ b/mm/memory.c
>>>>
>>>>> @@ -2044,16 +2053,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>>>>>    	 * to ensure they are still none, thereby preventing the pte entries
>>>>>    	 * from being repopulated by another thread.
>>>>>    	 */
>>>>> -	if (can_reclaim_pt && direct_reclaim && addr == end)
>>>>> +	if (can_reclaim_pt && direct_reclaim && addr == end) {
>>>>> +		/* rmap changes need to be observed before e.g PTEs get zapped. */
>>>>> +		smp_wmb();
>>>>
>>>> What does this pair with? You should always say what in the comment.
>>>
>>> Yep, this is missing a rmb to pair with. The diff I posted at
>>> https://lore.kernel.org/linux-mm/asigKktcrSY80A_2@pedro-suse.tail5790ac.ts.net/
>>> had one in zap_pmd_range(), which admittedly isn't the greatest. I'm not sure if
>>> there's a better way to do this.
>>
>> I don't think we need an rmb to pair with. This is because the
>> folio_mapped() check in __filemap_remove_folio() cannot be reordered
>> (guarded by spinlock) with the pmd_none() check in zap_pmd_range().
> 
> Why? spin_lock has ACQUIRE semantics, which are one-way permeable. Earlier
> loads and stores do not necessarily happen-before anything after the ACQUIRE.
> Unless you mean something else. 
A simplified view of the memory access logic on CPU 0 is as follows:

down_read() -> Acquire A1
pmd_none(): read pmd
up_read() -> Release R1

spin_lock() -> Acquire A2
folio_mapped(): read mapcount
spin_unlock -> Release R2

Initially I thought the read to folio_mapped() could not be reordered 
into the preceding acquire/release section, but after re-reading the 
memory-barriers.txt documentation, I realized that it actually can.

“
  (3) ACQUIRE vs ACQUIRE implication:
      All ACQUIRE operations issued before another ACQUIRE operation will be
      completed before that ACQUIRE operation.

  (4) ACQUIRE vs RELEASE implication:
      All ACQUIRE operations issued before a RELEASE operation will be
      completed before the RELEASE operation.
”

A possible out-of-order access sequence is:
A1 → A2 → read mapcount → read pmd → R1 → R2

So yes, you are right. I'll add an rmb barrier in v2.

Thanks to both of you for the review.
