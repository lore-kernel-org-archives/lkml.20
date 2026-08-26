Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B83F58D9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748787; cv=none; b=FHaTdL+xeAybGhJRReHiDTTD6hhL7nYl8IOKc15SkPNw1yELgUCnEWktybjMvk/A+BAdP68LArWfln24+ISlXrvJkhCBlsl13Gm64Dh7oay4wiELThLH0q3jnFprMHzYdMyGt39/UsRYChJ3fgrQLSIbNtMNFWtxFL2SjsnToz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748787; c=relaxed/simple;
	bh=04gXcZAwaH85rMaDB7p3nP8mrq3e9lgm0ZaYRKBR9UM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqGZgYeMIhVgwQvopw4IXG48cWTm8E5TDtqXBR60CXQHdBbq3U5QUBWG31phGkTFItB4rCtI9m3F3RmNTdr4o12D4Rd1cAOij93bQMctVD7oEM8zGvFVw8TtxnGRZjEHMN/WVx4RIQVK7OaGpE1Vx6PG+NZPUNGY+hSknwKpQqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xW6t3YJZ; arc=none smtp.client-ip=91.218.175.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xW6t3YJZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=04gXcZAwaH85rMaDB7p3nP8mrq3e9lgm0ZaYRKBR9UM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787748781; v=1; x=1788353581;
 b=xW6t3YJZtqKo4kEILViETwX/+8oqAzrhsBMqCKH96dMyrHL2Jf2xv/plZ4k7TtF3bgZPQR5t
 7LfM8ey9/FuIxgl6XzsuUmewwbg5lZ+VBSWHDxZ7uyT2eo95+lhFMWgiNvwiggadGo+ZZZFDYEL
 MnIcnRWBsAFwpE9eC6pyCW6U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from [10.63.107.123] (14.29.108.92)
	by smtp.migadu.com with ESMTPS id 30d681f86186f6ca;
	Wed, 26 Aug 2026 12:53:01 +0000
X-Mizu-Trace-ID: 30d681f86186f6ca
X-Migadu-Flow: FLOW_OUT
Message-ID: <a718bc24-60ea-4d3d-b1b8-2d1f181fef66@linux.dev>
Date: Wed, 26 Aug 2026 20:52:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] mm/vmscan: honour node reclaim limits per type
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ridong Chen <chenridong@xiaomi.com>
References: <20260821081741.1340277-1-ridong.chen@linux.dev>
 <aogMyu5R_DZRqp2J@tiehlicka> <f45848da-9569-453f-b0c0-8aa984e1976d@linux.dev>
 <aogZZsXwCyOXISaw@tiehlicka> <bc9c3de9-17b9-4ba1-8065-3270bb455630@linux.dev>
 <aogwUac-sjfcs7Vi@tiehlicka> <dba83897-9bbb-4a44-9021-8f938bb6a12f@linux.dev>
 <aog0ch0u8BtkR-a1@tiehlicka> <de7d583e-bd9b-464f-9e28-73075c0211a4@linux.dev>
 <aowD7tUUIUbhjJQj@tiehlicka>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <aowD7tUUIUbhjJQj@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/24/2026 4:42 PM, Michal Hocko wrote:
> On Mon 24-08-26 11:24:46, Ridong Chen wrote:
>>
>>
>> On 8/21/2026 7:20 PM, Michal Hocko wrote:
>>> On Fri 21-08-26 19:10:45, Ridong Chen wrote:
>>>>>> Did you mean that min_slab_pages and min_unmapped_pages should influence
>>>>>> proactive per-node reclaim?
>>>>>
>>
>> I apologize for being incoherent in my last email, it was after a full day
>> of work. What I wanted to say is that min_slab_pages and min_unmapped_pages
>> should *not* influence proactive per-node reclaim.
>>
>>>>> Nope, exactly opposite
>>>>>
>>>>
>>>> I would really appreciate it if you could clarify this further. Sorry, I'm
>>>> not sure I fully understand what you meant.
>>>
>>> pro-active (userspace triggered) node reclaim should completely ignore
>>> all those historical node_reclaim tunables.
>>
>> Yeah, this matches my understanding. Apologies again for the confusing reply.
>>
>> Since Johannes has acked patch 3, perhaps we can simply remove the
>> conditional check in __node_reclaim and keep the shrink loop as follows:
>>
>> ```
>> @@ -7906,16 +7906,16 @@ static unsigned long __node_reclaim(struct
>> pglist_data *pgdat,
>>   	noreclaim_flag = memalloc_noreclaim_save();
>>   	set_task_reclaim_state(p, &sc->reclaim_state);
>>
>> -	if (node_pagecache_reclaimable(pgdat) > pgdat->min_unmapped_pages ||
>> -	    node_page_state_pages(pgdat, NR_SLAB_RECLAIMABLE_B) > pgdat->min_slab_pages) {
>> -		/*
>> -		 * Free memory by calling shrink node with increasing
>> -		 * priorities until we have enough memory freed.
>> -		 */
>> -		do {
>> -			shrink_node(pgdat, sc);
>> -		} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
>> -	}
>> +	/*
>> +	 * Free memory by calling shrink node with increasing
>> +	 * priorities until we have enough memory freed.
>> +	 *
>> +	 * What to reclaim is gated per type by sc->skip_slab_reclaim and
>> +	 * sc->skip_file_reclaim.
>> +	 */
>> +	do {
>> +		shrink_node(pgdat, sc);
>> +	} while (sc->nr_reclaimed < nr_pages && --sc->priority >= 0);
>>
>>   	set_task_reclaim_state(p, NULL);
>>   	memalloc_noreclaim_restore(noreclaim_flag);
> 
> Could you post a stand alone patch with the full description please?

I have just done so. I would appreciate any comments you might have on it.

Link: 
https://lore.kernel.org/linux-mm/20260826124409.35569-1-ridong.chen@linux.dev/T/#u

-- 
Best regards
Ridong

