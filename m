Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C112DECC2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134784; cv=none; b=oEzXpcTbQ5FKayo0wExLrUCJsnlhRAH7nKa1sshtAAc/RPK7daJqYz6ZvboUQuKQUxA8ZHQFXH2+hEBeUaJFNqyznzAxGIe8G4OYj6G+cFZm+lyikuMobKjip7UAVBLSRTzYOO+fgVzmbbMb/VL3kPoVX4pZPrccJjGRowCwJK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134784; c=relaxed/simple;
	bh=QY8AVjCbcaW+wVLRtHjQxzMTz4h9U9+ldEP+b+H2GcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNBJxN/v68qVEixHpJHlgcKGX8fUc4CnNQ1BJvAHL/ISsZqU3o7bfyZnJazEGXsr2YhfWL3qOUzKO7YnX0qwI/xNdn3yqW7uSfq3+aXLZ+POONNUwNlQjgwsYalDQiEwqaMZWYpyAZd4XF+9Bvc9/QjJGhMteqkXQnpVICaYL9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xq5qrKhz; arc=none smtp.client-ip=91.218.175.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xq5qrKhz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QY8AVjCbcaW+wVLRtHjQxzMTz4h9U9+ldEP+b+H2GcE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790134780; v=1; x=1790739580;
 b=xq5qrKhzE0+o64gM4M94boNT5RqrOoMc1iU/v1S+dI+Xa8+B5gIXMAP0L6qaPMed6RxtReb9
 N9dgVgeovnw4lDGjtvZwei5sgML/jLGTo/YaY0hQL6TTP21136CCSibH4ARRqwJy3uUA51ic/3G
 kexcT/7NKGTkoNWudjN8ueVg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2387b4930517eb3;
	Wed, 23 Sep 2026 03:39:30 +0000
X-Mizu-Trace-ID: e2387b4930517eb3
X-Migadu-Flow: FLOW_OUT
Message-ID: <19136e23-3af6-4bf5-93cf-46bb1dc46c08@linux.dev>
Date: Wed, 23 Sep 2026 11:39:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm/vmalloc: fix vmalloc_dump_obj cross-zone VA
 lookup
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-2-73fceb3ed1c8@linux.dev>
 <arJ4PLGlF7uhNWOs@milan>
Content-Language: en-US
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <arJ4PLGlF7uhNWOs@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/22 20:44, Uladzislau Rezki 写道:
> On Mon, Sep 21, 2026 at 09:17:22PM +0800, Ye Liu wrote:
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> vmalloc_dump_obj() searches only one vmap node (addr_to_node(addr)),
>> but a vmalloc allocation may span multiple vmap zones.  The VA is
>> stored in only one node's rb-tree (addr_to_node(va_start)), so an
>> object pointer in a different zone than va_start maps to a different
>> node and the search misses.  This affects any allocation larger than
>> vmap_zone_size (64 KiB) on multi-CPU systems.
>>
>> Iterate all vmap nodes using for_each_vmap_node, like find_vmap_area()
>> does, but with spin_trylock instead of spin_lock as this function can
>> be called from atomic dump contexts (OOM, KASAN, RCU).
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>> ---
>>  mm/vmalloc.c | 24 ++++++++++++++++++------
>>  1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index df42d8a6f058..30c610f678dc 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -5278,17 +5278,29 @@ bool vmalloc_dump_obj(void *object)
>>  	unsigned long nr_pages;
>>  
>>  	addr = PAGE_ALIGN_DOWN((unsigned long) object);
>> -	vn = addr_to_node(addr);
>>  
>> -	if (!spin_trylock(&vn->busy.lock))
>> -		return false;
>> +	/*
>> +	 * A vmalloc allocation may span multiple vmap zones, so the
>> +	 * node whose rb-tree holds the VA may differ from the node
>> +	 * the address maps to.  Search all nodes.  Use trylock as
>> +	 * this function can be called from atomic dump contexts.
>> +	 */
>> +	va = NULL;
>> +	for_each_vmap_node(vn) {
>> +		if (!spin_trylock(&vn->busy.lock))
>> +			continue;
>> +
>> +		va = __find_vmap_area(addr, &vn->busy.root);
>> +		if (va && va->vm)
>> +			break;
>>  
>> -	va = __find_vmap_area(addr, &vn->busy.root);
>> -	if (!va || !va->vm) {
>>  		spin_unlock(&vn->busy.lock);
>> -		return false;
>> +		va = NULL;
>>  	}
>>  
>> +	if (!va)
>> +		return false;
>> +
>>  	vm = va->vm;
>>  	addr = (unsigned long) vm->addr;
>>  	caller = vm->caller;
>>
>> -- 
>> 2.25.1
>>
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 89c327a6ce7d..3719dc02dcaf 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2511,7 +2511,22 @@ static void free_unmap_vmap_area(struct vmap_area *va)
>  	free_vmap_area_noflush(va);
>  }
>  
> -struct vmap_area *find_vmap_area(unsigned long addr)
> +static inline int next_vmap_node_id(int i)
> +{
> +	return (i + nr_vmap_nodes - 1) % nr_vmap_nodes;
> +}
> +
> +enum vmap_lock_mode {
> +	VMAP_LOCK,
> +	VMAP_TRYLOCK,
> +};
> +
> +/*
> + * Add a comment here.
> + */
> +static struct vmap_area *
> +find_vmap_area_lock(unsigned long addr, struct vmap_node **locked_vn,
> +		enum vmap_lock_mode mode)
>  {
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
> @@ -2534,16 +2549,40 @@ struct vmap_area *find_vmap_area(unsigned long addr)
>  	 * addr is within 2 or 0 nodes we should do extra work.
>  	 */
>  	i = j = addr_to_node_id(addr);
> +
>  	do {
>  		vn = &vmap_nodes[i];
>  
> -		spin_lock(&vn->busy.lock);
> +		if (mode == VMAP_LOCK) {
> +			spin_lock(&vn->busy.lock);
> +		} else {
> +			if (!spin_trylock(&vn->busy.lock))
> +				continue;
> +		}
> +
>  		va = __find_vmap_area(addr, &vn->busy.root);
> +		if (va) {
> +			*locked_vn = vn;
> +			return va;
> +		}
> +
>  		spin_unlock(&vn->busy.lock);
> +	} while ((i = next_vmap_node_id(i)) != j);
>  
> -		if (va)
> -			return va;
> -	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> +	*locked_vn = NULL;
> +	return NULL;
> +}
> +
> +struct vmap_area *find_vmap_area(unsigned long addr)
> +{
> +	struct vmap_node *vn;
> +	struct vmap_area *va;
> +
> +	va = find_vmap_area_lock(addr, &vn, VMAP_LOCK);
> +	if (va) {
> +		spin_unlock(&vn->busy.lock);
> +		return va;
> +	}
>  
>  	return NULL;
>  }
> 
> 
> and we use the helper in the vmalloc_dump_obj()?

Hi Uladzislau,                                                       
                                                                     
Thanks for the suggestion.  I have adopted the find_vmap_area_lock() 
helper approach in v3.  The helper unifies the cross-node iteration  
logic with a mode parameter for spin_lock and spin_trylock, the      
latter used by vmalloc_dump_obj() for atomic dump contexts.          
                                                                     
find_unlink_vmap_area() is also simplified to use the same helper,   
removing a third copy of the iteration loop.  The helper returns with
the node's busy.lock held, so the caller can unlink_va() under the   
same lock before releasing it.   
                                                                     
Will send v3 shortly.                                                

> 
> --
> Uladzislau Rezki

-- 
Thanks,
Ye Liu

