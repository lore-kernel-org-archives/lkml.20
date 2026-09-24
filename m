Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87B3BB685
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275934; cv=none; b=masx1v+iUqFGSgt8iservwWrsgRExh5t7HlaRRZgGh1us7DSXcVmMpxqwa/L8eWi8qEeT0teoOiF0q5e3aMuiqpLaqFKotxLJZSVGC/+lHMA1vu4YrLqkwqy5PTniK6hn+6yp5lBg2NF/zVLH+mWQUkXfHRTgCylryeic+iC0Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275934; c=relaxed/simple;
	bh=uB7PBE+vNmeeUB+vdMvBt2A8VZS499IMcXGUO94mTWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNWJEdPqIo3lQ4rRodUlJw1U5VLKU5tF7Ea9xKyz+wtOtoykPrNr0+oDilJtDlH3tnDA3Bu3Z4HRDbDqmKYxcwa3IdcYnUhPnsNQLNHDFrMVrpLQHXGAVDIahIlkT8DQXXL862w/idPWsE2XXolaQImdmT3tZCX5tC9GLcoUlqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmKwra2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmKwra2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E851F00893;
	Thu, 24 Sep 2026 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790275924;
	bh=8fQuNmR+wyKKa/NE7gKqnglhXs6oXfwgf7LqT0NLqJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hmKwra2TGt4NKXHAA/TkRcGPes5yT9c5nvFOd+aZbIBb7FPyc7k5fI9FVjH9eU4GG
	 sODuhzOfxulRS+W1TQ3EiWAHBIdTotMlSZba1Zftbd3TRwCMVH/BoCBE0RnoxRtNik
	 oXOPyebbT1FC9GA19P4NRoEdFGMIwEzKIX/PEN4ZgpKlbbq7Wn06FFrvEdj9QL+WWx
	 MgKLgK3yz6RTLmkPgA8Xu6Vs+paDS02BGoGLXXkQew1Mxmq75NIxaodkh1HOvLTjr2
	 AOtX5ao831YTZLHT9N9YMT57zQXlry8BCfVNNahANt8tvX99YtRVHO8EYnTQok5MF+
	 50pdsWexQGSSQ==
Message-ID: <570cf649-a8bf-4073-be71-207fbb2bef40@kernel.org>
Date: Thu, 24 Sep 2026 20:51:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated
 bit
To: Ilya Gladyshev <ilya.gladyshev@linux.dev>, Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, andrew+netdev@lunn.ch, apopple@nvidia.com,
 artem.kuzin@huawei.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, edumazet@google.com, harry.yoo@oracle.com,
 hramamurthy@google.com, ivgorbunov@me.com, joshwash@google.com,
 kirill@shutemov.name, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
 pfalcato@suse.de, rppt@kernel.org, surenb@google.com,
 torvalds@linuxfoundation.org, vbabka@suse.cz, willy@infradead.org,
 yuzhao@google.com
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
 <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com>
 <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 19:34, Ilya Gladyshev wrote:
> September 15, 2026 at 5:42 AM, "Zi Yan" <ziy@nvidia.com mailto:ziy@nvidia.com?to=%22Zi%20Yan%22%20%3Cziy%40nvidia.com%3E > wrote:
> 
> 
>>
>> On Sat Sep 12, 2026 at 3:50 PM EDT, Ilya Gladyshev wrote:
>>
>>>
>>> The current page refcount implementation uses a single counter value
>>>  (zero) as dead. So, to prevent incrementing a dead refcount in
>>>  folio_try_get(), it fundamentally requires a CAS loop.
>>>
>>>  This CAS loop can act as a serialization point and can become a
>>>  significant bottleneck during high-frequency file read operations
>>>  [1][2].
>>>
>>>  This patch reallocates the refcount value range:
>>>
>>>  (1) refcount < 0 means dead refcount (uninit / frozen)
>>>  (2) refcount = 0 allowed only as a temporary state (see below)
>>>  (3) refcount > 0 is a regular reference count
>>>
>>>  In other words, refcount is now split into "dead bit" and a 31-bit
>>>  counter.
>>>
>>>  Refcount decrement now works as follows:
>>>  1. Counter decrement
>>>  2. If it is now zero, try to put it deep inside the dead zone
>>>  (CAS to INT_MIN). Or you can view it as "set up frozen bit and reset
>>>  counter".
>>>  3. This CAS can fail only if someone grabbed a reference in-between --
>>>  that's okay, this page is their problem now.
>>>
>> I am not sure this works. David raised a concern on V4[1], where if a
>> folio lands to page_frag_free()'s free_frozen_pages(), it will not be
>> properly handled. "this page is their problem" only works if every
>> folio/page free functions call a generic folio/page free function that
>> checks the page type and does the proper handling.
> 
>>> Refcount decrement now works as follows:
>>> 1. Counter decrement
>>> 2. If it is now zero, try to put it deep inside the dead zone
>>>     (CAS to INT_MIN). Or you can view it as "set up frozen bit and reset
>>>     counter".
>>> 3. This CAS can fail only if someone grabbed a reference in-between --
>>>     that's okay, this page is their problem now.
>>
>> I am not sure this works. David raised a concern on V4[1], where if a
>> folio lands to page_frag_free()'s free_frozen_pages(), it will not be
>> properly handled. "this page is their problem" only works if every
>> folio/page free functions call a generic folio/page free function that
>> checks the page type and does the proper handling.
> 
> After some thinking, this scenario is indeed possible and problematic. The
> complexity of the required setup give me hope that there are some implicit
> barriers, however I wasn't able to find them. But I am not an mm guru,
> so maybe I missed something :shrug:
> 
> -- Below is a minimal buggy scenario --
> 
> Thread A: network code that calls page_frag_free()
> Thread B: calls folio_try_get(). Maybe it is the DAMON paddr scanner,
>           maybe this folio was previously used in page cache
>           (however this noticeably complicates the scenario)
> Thread C: user of folio's reincarnation. It also requires destruction via
>           folio_put() and not via free_frozen_pages() -- for example hugetlb
>           or memcg charged folio.
> 
> Refcount operations as follows (FR = FROZEN):
> 
> A: DEC 1 -> 0  [ page_ref_dec_and_test() ]
> B: INC 0 -> 1  [ folio_try_get() ] => success
> B: DEC 1 -> 0  [ page_ref_dec_and_test() ]
> B: CAS 0 -> FR [ page_ref_dec_and_test() ]
> B: * deallocates via __folio_put() *
> 
> C: * re-allocates page *
> C: DEC 1 -> 0  [ page_ref_dec_and_test() ]
> A: CAS 0 -> FR [ page_ref_dec_and_test() ] => success
> A: * deallocates directly via free_frozen_pages() * => BUG
> 
> This can be fixed with a `s/page_frag_free/folio_put/`-style patch, however
> it seems unreasonable...

There needs to be a common page freeing function that dipatches stuff.

folio_put() is not the best future-proof thing, because not all pages will be
folios sooninsh.

-- 
Cheers,

David
