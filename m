Received: from mta0.migadu.com (out-155.mta0.migadu.com [91.218.175.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D054917BB21
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970706; cv=none; b=kGKeXnZAPAxr9Er7JtOOz5YFZvddJTMvBtcThq84QJ46IFUZK2ysoKx+pl4nY6NkZqlf4NTIFPYjRcmz3RBqxDC/ukxFo/q6yFyhoYVH4YOPIvvCvwhLzt0c+oQB4ZkRfaSfkEa2XSYrxICNTDHIaFf97O8ZuDErink7/t+nc0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970706; c=relaxed/simple;
	bh=JKNlOfm2sJQD+Fasu1nejxoblPL/n9RwFvgZgcZ9rjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKG5vJbIpItH0h+uGmgxDai2WJZ712pR6lNMrnh0vfXm3touNlcuXHM8Nqs3HyGDKj5m8qYE9REQZ3U8s1vleIdof9miY705VBDLrC92MFULd6xSTo0cPzNVLSFwwx1cJpkE00P6LTeBOLAHDmVM2Y2W0UU6XRpEEINjHloxzS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X67TVo1G; arc=none smtp.client-ip=91.218.175.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X67TVo1G"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JKNlOfm2sJQD+Fasu1nejxoblPL/n9RwFvgZgcZ9rjQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789970702; v=1; x=1790575502;
 b=X67TVo1G4oP6xSq4gKrUdNH0CFz1mleqg2cJgU1Q0LT32xcTky75T7teXkYcE/y9YwdfTAq3
 OleIRYMU8vUfNXUF814VAhHbb78l+DbHspz62v9hmgKdKq9nwmN6TgSPOdqEZymH5cI3TtWxhgO
 JL6oZBfN3cjo5R+JxQUMtPWA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a1f83f1d62af5fad;
	Mon, 21 Sep 2026 06:05:01 +0000
X-Mizu-Trace-ID: a1f83f1d62af5fad
X-Migadu-Flow: FLOW_OUT
Message-ID: <2e878fe2-473e-4dc1-a669-7e2e37894d6e@linux.dev>
Date: Mon, 21 Sep 2026 14:04:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new v2] mm: vmscan: put rotation-missed folios at the
 LRU tail
To: Barry Song <baohua@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Kairui Song <kasong@tencent.com>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20260920132519.3369946-1-ridong.chen@linux.dev>
 <CAGsJ_4zCADpQDqVj=BFipOztctBMBhw9Wcj+FLVcj-d8e=0bow@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4zCADpQDqVj=BFipOztctBMBhw9Wcj+FLVcj-d8e=0bow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/21/2026 5:31 AM, Barry Song wrote:
> On Sun, Sep 20, 2026 at 9:25 PM Ridong Chen <ridong.chen@linux.dev> wrote:
>>
> [...]
>>
>>   mm/vmscan.c | 24 ++++++++++++++++++------
>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index e200ce3eb056..91295070ca33 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -1971,7 +1971,7 @@ static bool too_many_isolated(struct pglist_data *pgdat, int file,
>>    *
>>    * Note: The caller must not hold any lruvec lock.
>>    */
>> -static unsigned int move_folios_to_lru(struct list_head *list)
>> +static unsigned int move_folios_to_lru(struct list_head *list, bool do_rotate)
>>   {
>>          int nr_pages, nr_moved = 0;
>>          struct lruvec *lruvec = NULL;
>> @@ -2018,7 +2018,19 @@ static unsigned int move_folios_to_lru(struct list_head *list)
>>                          continue;
>>                  }
>>
>> -               lruvec_add_folio(lruvec, folio);
>> +               /*
>> +                * Put clean, unreferenced and unpinned folios that may have
>> +                * missed folio_rotate_reclaimable() at the tail to avoid
>> +                * cold/hot inversion.
>> +                */
>> +               if (do_rotate && !folio_test_active(folio) && !folio_mapped(folio) &&
>> +                   !folio_test_dirty(folio) && !folio_test_writeback(folio) &&
>> +                   !folio_test_referenced(folio) &&
>> +                   folio_ref_count(folio) == folio_expected_ref_count(folio))
> 
> 
> I guess this is wrong. We hold an extra reference while isolating
> the folio, so I think this should be:
> 
> `folio_ref_count(folio) == folio_expected_ref_count(folio) + 1`
> 
> Am I missing something here?
> 
Hi Barry,

Thank you for your review.

The folios we want to check have the following lifecycle:

1. In isolate_lru_folios, we take an extra reference (i.e., +1).

2. In __remove_mapping, the folio can only be frozen successfully when refcount 
== 1 + folio_nr_pages(folio). We need to exclude folios whose refcount is not 1 
+ folio_nr_pages(folio) (e.g., those pinned by GUP), as reported by Sashiko.

```
	...
	refcount = 1 + folio_nr_pages(folio);
	if (!folio_ref_freeze(folio, refcount))
		goto cannot_free;
	...
``` 	

3. In move_folios_to_lru, we drop the extra reference and move the folio back to 
the lruvec.

```
...
		if (unlikely(folio_put_testzero(folio))) {
			__folio_clear_lru_flags(folio);
...
		}

		if (do_rotate && !folio_test_active(folio) && !folio_mapped(folio) &&
		    !folio_test_dirty(folio) && !folio_test_writeback(folio) &&
		    !folio_test_referenced(folio) &&
		    folio_ref_count(folio) == folio_expected_ref_count(folio))
			lruvec_add_folio_tail(lruvec, folio);
		else
			lruvec_add_folio(lruvec, folio);
```

The refcount check is added after the extra reference has been dropped.

Therefore, I believe it should be 'folio_ref_count(folio) == 
folio_expected_ref_count(folio)', not 'folio_ref_count(folio) == 
folio_expected_ref_count(folio) + 1'.

-- 
Best regards
Ridong

