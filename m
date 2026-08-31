Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88F63D4127
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166383; cv=none; b=dEk1Pjqu+FLinMHJFMzNI+/4Wi7fmfD7f4M6S9hDOXTHiYNHC7+Merf9cOzK+1UWqQbt0+yjN8SMBHgVEzKpw/+/dZQ4xBCLd3fodyMvgI/w2kDan/SJE+M/sdoUkXiwsEYPqkNknHcfJkTx/z6gO0y/tNLH+Aq98GFbyX8Ydik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166383; c=relaxed/simple;
	bh=xPdQHWjgwgg/eQBmHvwF39umxz+MACq1R6bAcjPr4kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fS6jNlX+9Z0G7He5Z1gjeBvFv7/afTTcCSEI60etZ3+KrJnBGNINgZIFG3vqoi4R0Y35OP462UQo2a4GnlIQQFbuJUOPNy4syCp1mooPA8sQRppebsjyVWRAF/PQtfkcHfPmp5cwAn6P8e+spMBxoOuUUKrxwHoD6oaLSrPNIm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Fnr4No4J; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Fnr4No4J"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788166377; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TZYb7qeuDeUdbF6Gzt4VmWbSRmjddUQtr9AFQa/PBJc=;
	b=Fnr4No4Js1ojWUx/Fbc0ANQOn9xJtZS99ZFz1wbEBqws2/lRE2VXS04z+shyg+uA+Ia4WfD15ydUMNQrQ1Tl5Z6IeAryQnE4x4XACB6O2CUKm+7qni7mDx0edwH8ZK45yH9xuevXEhmPH80pcPXb4VjXlmuR9P+bDqRrCvkxHoo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0X9wFnwG_1788166376;
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9wFnwG_1788166376 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Aug 2026 16:52:57 +0800
Message-ID: <8ba99027-7ee0-4459-9eeb-acc15769b2c0@linux.alibaba.com>
Date: Mon, 31 Aug 2026 16:52:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] mm/mglru: introduce helpers for manipulating gen
 and refs flags
To: Kairui Song <ryncsn@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20260826-mglru-flags-cleanup-v3-0-d9f1c75549c8@tencent.com>
 <20260826-mglru-flags-cleanup-v3-2-d9f1c75549c8@tencent.com>
 <fbb40ab7-6942-4983-9621-ab8d5d50474f@linux.alibaba.com>
 <apRx-xd0csgBU4sL@KASONG-MC4>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <apRx-xd0csgBU4sL@KASONG-MC4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/26 2:12 AM, Kairui Song wrote:
> On Thu, Aug 27, 2026 at 03:32:18PM +0800, Baolin Wang wrote:
>>
>>
>> On 8/26/26 1:53 AM, Kairui Song via B4 Relay wrote:
>>> From: Kairui Song <kasong@tencent.com>
>>>
>>> Instead of doing bit ops on folio->flags.f, introduce helpers for
>>> adjusting a folio's refs and generation info, making the code easier
>>> to debug and understand.
>>>
>>> No functional change is intended: some combined atomic operations are
>>> split into two, which only creates harmless transient states. There is
>>> no measurable performance impact, and some paths even look slightly
>>> better in the generated assembly.
>>>
>>> Signed-off-by: Kairui Song <kasong@tencent.com>
>>> ---
>>>    include/linux/mm_inline.h | 76 ++++++++++++++++++++++++++++++++++++++++++-----
>>>    include/linux/mmzone.h    |  1 +
>>>    mm/folio.c                | 19 +++++++-----
>>>    mm/vmscan.c               | 61 ++++++++++++++++++++-----------------
>>>    4 files changed, 114 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/mm/folio.c b/mm/folio.c
>>> index c02dcea9c03c..a932059057ac 100644
>>> --- a/mm/folio.c
>>> +++ b/mm/folio.c
>>> @@ -353,26 +353,28 @@ static void __lru_cache_activate_folio(struct folio *folio)
>>>    static void lru_gen_inc_refs(struct folio *folio)
>>>    {
>>> -	unsigned long new_flags, old_flags = READ_ONCE(folio->flags.f);
>>> +	unsigned long new_flags, old_flags = READ_ONCE(*folio_flags(folio, 0));
>>> +	int refs;
>>>    	if (folio_test_unevictable(folio))
>>>    		return;
>>>    	/* see the comment on LRU_REFS_FLAGS */
>>> -	if (!folio_test_referenced(folio)) {
>>> -		set_mask_bits(&folio->flags.f, LRU_REFS_MASK, BIT(PG_referenced));
>>> +	if (!folio_lru_refs(folio)) {
>>> +		folio_set_lru_refs(folio, 1);
>>>    		return;
>>>    	}
>>>    	do {
>>> -		if ((old_flags & LRU_REFS_MASK) == LRU_REFS_MASK) {
>>> +		new_flags = old_flags;
>>> +		refs = lru_refs_from_flags(old_flags);
>>> +		if (refs == LRU_REFS_MAX) {
>>>    			if (!folio_test_workingset(folio))
>>>    				folio_set_workingset(folio);
>>>    			return;
>>>    		}
>>> -
>>> -		new_flags = old_flags + BIT(LRU_REFS_PGOFF);
>>> -	} while (!try_cmpxchg(&folio->flags.f, &old_flags, new_flags));
>>> +		lru_refs_set_flags(&new_flags, refs + 1);
>>> +	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
>>>    }
>>>    static bool lru_gen_clear_refs(struct folio *folio)
>>> @@ -384,7 +386,8 @@ static bool lru_gen_clear_refs(struct folio *folio)
>>>    	if (gen < 0)
>>>    		return true;
>>> -	set_mask_bits(&folio->flags.f, LRU_REFS_FLAGS | BIT(PG_workingset), 0);
>>> +	folio_set_lru_refs(folio, 0);
>>
>> Actually this clears the folio's refs counter. Would it be more readable to
>> introduce a folio_clear_lru_refs(folio) helper and use it for all the other
>> folio_set_lru_refs(folio, 0) calls too?
> 
> Thanks for the review! And yeah, that's right. But a standalone
> folio_clear_lru_refs seems a bit bloated? I'll add some comment on the
> relationship of refs and PG_referenced for the helpers first, that
> might be helpful enough I guess?

OK, I'm fine with that.
