Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8EA472F7D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983147; cv=none; b=SQLNmDqylJ4IOSmCPqCfrcwTIvmpAVfZBcEW/A/fZVOqyb2JfkV0HWKClqYuim6zhExqQmcirwSj8EYevyKJUpPZ+h6yitgyYmihYQhEk6WN57CN3YCk2+YetJEOR2KU6nLyVgi3hLi/uobPB/P38JPKiQQzCQ+kw8Q9fh7uB04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983147; c=relaxed/simple;
	bh=A+FpwmEdcgLkNBmXKcsH5Ari5n1zAVt4M/rru0icHo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyKxvtU5nMyZFAt6cs3ApUOmAdA/0x3PVJ3w9SOrsEhO2hRfMmpQwNMq7/xojany9Uxm6CMrSOsRrH/6mXn71om9uUkWJsMwemM0WlORkA0MfmOyM7QlsD6zlH2S/sVerlZeKcwEkZNBZ0oz5s+H7fNbr1Eba+QI5a7/YKxOuIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiR2ktE5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiR2ktE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04791F000FF;
	Mon, 21 Sep 2026 09:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789983145;
	bh=YYR5qVSNGypuoPk4MWOVXb7SNwRU6tu0qAlYq1SIKq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EiR2ktE5bWvCWZK2xZovGpxWGGzeb+rPS5X4wbkKw1+lhJsvN+ZhauW30Gmk+VICF
	 B6WsjoFZiPQlJm6zYFnispjSdhqDgBrA83GqOYc9yPLoKD22vhubSfV+6zO/wd8vWI
	 K6ymAsrEO0K3o7WtIvhTWCCfxjaC3L3v1df2ifYXlUI8kAtMZgqT65Tb39EwSrmiEJ
	 XhoNLIW67BTaDDljGDfoArCWVzZkUtAUqWXrXnvVXuHSyIburK7teC1/ioEipBlbR7
	 1kEp5/WaQQwSk9l1q29y72XL8jMs3WHfAYYJQWYj5+zg0viR/PHATQwjo7HtFjGTN5
	 8ddCwV2uNcG7g==
Message-ID: <80925c1f-73c2-45df-ac26-fdcc96ffe764@kernel.org>
Date: Mon, 21 Sep 2026 11:32:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/gup: honour FOLL_PIN in NOMMU
 __get_user_pages_locked()
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, jgg@ziepe.ca, jhubbard@nvidia.com,
 gregkh@linuxfoundation.org, peterx@redhat.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260919-nommu_gup_pin-v3-1-3660a8851243@kernel.org>
 <20260921024914.12819-1-lance.yang@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260921024914.12819-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/26 04:49, Lance Yang wrote:
> 
> On Sat, Sep 19, 2026 at 12:04:36PM +0200, David Hildenbrand (arm) wrote:
>> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> The !CONFIG_MMU implementation of __get_user_pages_locked() takes a bare
>> get_page() reference for each page regardless of foll_flags:
>> 	if (pages[i])
>> 		get_page(pages[i]);
>>
>> This is reached from pin_user_pages*() with FOLL_PIN set.
>> unpin_user_page() is shared between MMU and NOMMU configurations and
>> unconditionally calls gup_put_folio(..., FOLL_PIN), which subtracts
>> GUP_PIN_COUNTING_BIAS (1024) from the folio refcount.
>>
>> This means that pin adds 1, and then unpin will subtract 1024.
>>
>> If a user maps a page (refcount 1), registers it 1023 times as an
>> io_uring fixed buffer (1023 pin_user_pages calls -> refcount 1024), then
>> unregisters: the first unpin_user_page subtracts 1024, refcount hits 0,
>> the page is freed and returned to the buddy allocator.  The remaining
>> 1022 unpins write into whatever was reallocated, and the user's VMA
>> still maps the freed page (NOMMU has no MMU to invalidate it).
>> Reallocating the page for an io_uring pbuf_ring then lets userspace
>> corrupt the new owner's data through the stale mapping.
>>
>> Use try_grab_folio() which adds GUP_PIN_COUNTING_BIAS for FOLL_PIN and 1
>> for FOLL_GET, mirroring the CONFIG_MMU path so pin and unpin are
>> symmetric. Keep supporting the traditional behavior where users specify
>> a pages array but don't set FOLL_GET.
>>
>> While at it, don't return NULL pointers in the page array,
>> as this is really not expected for GUP users; instead, just fail and return
>> -EFAULT.
>>
>> [ david: support traditional behavior with no FOLL_GET, extend
>>  description ]
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: John Hubbard <jhubbard@nvidia.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Reported-by: Anthropic
>> Fixes: 3faa52c03f44 ("mm/gup: track FOLL_PIN pages")
>> Assisted-by: gkh_clanker_t1000
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>> I added a best-guess fixes tag. Given that this has been around for a
>> while ... and it's nommu, I think this is fine just going into the next
>> merge window. In that case, I will pick this up myself. If we want this
>> as a hotfix, Andrew please pick it up.
>> ---
>> mm/gup.c | 17 ++++++++++++++---
>> 1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index eb898ea1ee22e..1681bea8eed7e 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1659,6 +1659,10 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>> 	if (!nr_pages)
>> 		return 0;
>>
>> +	/* See the MMU variant: support the traditional behavior. */
>> +	if (pages && !(flags & FOLL_PIN))
>> +		flags |= FOLL_GET;
>> +
> 
> Wait ... isn't this the wrong __get_user_pages_locked()? The MMU version
> already does this a few lines below ...
> 

Yes, Sashiko complained as well. Will fix it up and send a v2. Lesson learned:
don't work on nommu patches on Saturday ;)

> Shouldn't the NOMMU version get the check instead, using foll_flags?

Yes, I'll fix that up and send a v2.

-- 
Cheers,

David
