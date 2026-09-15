Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DAD2F3C37
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789444099; cv=none; b=NZPBcFG/0XPc2OEMQePbM0DcHS3S8w4rB7MF1wugfqEx8fYSp0TRnf5beBlRbsberSeWLJJq7pNCwK36OB41QCs83EKknNKzU19UfqEueRf4Lr02lgNCL98OVoeTiqZ3GXOYaCmJZy6IbxT7BMSzZiw4UvfJfJXKs0Si6b6whKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789444099; c=relaxed/simple;
	bh=KgjqZoWoWF2qzt6t1QQEyEyqBSmp/mCKv/Xm4NSLhic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaMJbyCoF3EyeXQui4dphgdJamrF1pSQfNMefeelxb7nMHO+hGK9tTe8pl7RUd/4+bCXU8WMTD1mzAIukPUnnrpz5k2LETbgihw90TppqkD+N0n2TZ3AVCCCtpgsQDnOHnaUtRyfOEHYzQYY2EB0V7DIVEeHjCV0NwE1VUqfbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gtMBSMt7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gtMBSMt7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F11791570;
	Mon, 14 Sep 2026 20:48:10 -0700 (PDT)
Received: from [10.164.19.33] (unknown [10.164.19.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E17253F7B4;
	Mon, 14 Sep 2026 20:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789444094; bh=KgjqZoWoWF2qzt6t1QQEyEyqBSmp/mCKv/Xm4NSLhic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gtMBSMt7KQpkpEw4uf2tV+eK0xJnhIK+UUdPXXSlgHaKB+doyn1hf0yIbcbxVkeB7
	 gZ1GkGl+e4POIgoV86zRSfkJa/jcGhzGkpiswTbEjIPWcJXI5jFPP01aZfXhFDylb9
	 dCn3om+7wQ5Fg4wBewetvePHdKhyIny513KDRR2Q=
Message-ID: <5bafc4c7-6902-4015-8f74-e2f5773086de@arm.com>
Date: Tue, 15 Sep 2026 09:18:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm/vmalloc: extract vmap_insert_free_area helper
To: Ye Liu <ye.liu@linux.dev>, Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-2-526f68559706@linux.dev> <aqgow3u0GSlj0P1Y@milan>
 <fc999f45-fcbc-4d6c-a0b6-2bea4da98013@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <fc999f45-fcbc-4d6c-a0b6-2bea4da98013@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 15/09/26 7:55 am, Ye Liu wrote:
> 
> 
> 在 2026/9/15 01:02, Uladzislau Rezki 写道:
>> On Mon, Sep 14, 2026 at 11:34:01AM +0800, Ye Liu wrote:
>>> From: Ye Liu <liuye@kylinos.cn>
>>>
>>> The allocation and insertion of a free vmap_area is duplicated
>>> between the loop body and the tail of vmap_init_free_space.  Factor
>>> it into a small helper so the main function only deals with computing
>>> the free gaps between busy regions.
>>>
>>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>>> ---
>>>  mm/vmalloc.c | 41 ++++++++++++++++++-----------------------
>>>  1 file changed, 18 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index 117483dd048c..797933ba9451 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -5433,11 +5433,23 @@ module_init(proc_vmalloc_init);
>>>  
>>>  #endif
>>>  
>>> +static void __init vmap_insert_free_area(unsigned long start, unsigned long end)
>>> +{
>>> +	struct vmap_area *free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
>>> +
>>> +	if (!WARN_ON_ONCE(!free)) {
>>> +		free->va_start = start;
>>> +		free->va_end = end;
>>> +		insert_vmap_area_augment(free, NULL,
>>> +					 &free_vmap_area_root,
>>> +					 &free_vmap_area_list);
>>> +	}
>>> +}
>>> +
>>>  static void __init vmap_init_free_space(void)
>>>  {
>>>  	unsigned long vmap_start = 1;
>>>  	const unsigned long vmap_end = ULONG_MAX;
>>> -	struct vmap_area *free;
>>>  	struct vm_struct *busy;
>>>  
>>>  	/*
>>> @@ -5447,32 +5459,15 @@ static void __init vmap_init_free_space(void)
>>>  	 *  |<--------------------------------->|
>>>  	 */
>>>  	for (busy = vmlist; busy; busy = busy->next) {
>>> -		if ((unsigned long) busy->addr - vmap_start > 0) {
>>>
>> This line gets removed and then re-added below because of removing space
>> after (unsigned long). Maybe it is better to keep that space.
> However, the '{' is still there, but I'll add a space anyway.


Just mentioning in the commit message "while at it, drop redundant whitespace
in "(unsigned long) busy->addr" should suffice.

Reviewed-by: Dev Jain <dev.jain@arm.com>

