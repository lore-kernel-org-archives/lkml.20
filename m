Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81123645D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439141; cv=none; b=tj+k3I7oDl+kHafS3BO+VGvGv18ohWjtWgotK4kQxRXKeYpmDLl6m9bEiyhHIpGOLt7TEfjsvNWntFh7s+lXkyiq6CDXEstk7sxNjy+TfGy7NaBi12z87+huIF9xXI+VcJTLqseCFHfPUKMVhbqUy4aHH1kvpLDw+vfryZdxZSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439141; c=relaxed/simple;
	bh=G7jAV2yOVUgDl7MjUvMbstEXrE2pwtF5/atE+hJu/P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTdkZHQA3C5swqPDUIQn9idDOVV3nLqimt2hvvGrxDafBc5cGczGpkKu5dLN8Yi4H4xV38py0FccrZX6HB+Et49bhtdu6So4VOIpsPU+UwthuSTRPn6k2LuHuFu1FrTtEc6OIvVzRLwEH0gPZ8lbV7JVUlDxieYhprDxg6x4ZwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t7ciUKFq; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t7ciUKFq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G7jAV2yOVUgDl7MjUvMbstEXrE2pwtF5/atE+hJu/P4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789439137; v=1; x=1790043937;
 b=t7ciUKFqPBEZwQMEJDKqx5K9iHlF57FcZMf5oYVFVQrPSyYyE7SIeyE5jA8UTi5ahazNbr8L
 /zLrNa5riwjmx0omISWKiWkmHx7rLe6rtFoaPnDB2GhU+anIzfGrPyABR7hUNqbyaQVwOay6e0z
 I/ndzDlxlLWuR6fPL6OJXO80=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8ebffbc4bc65cf5d;
	Tue, 15 Sep 2026 02:25:36 +0000
X-Mizu-Trace-ID: 8ebffbc4bc65cf5d
X-Migadu-Flow: FLOW_OUT
Message-ID: <fc999f45-fcbc-4d6c-a0b6-2bea4da98013@linux.dev>
Date: Tue, 15 Sep 2026 10:25:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm/vmalloc: extract vmap_insert_free_area helper
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
References: <20260914-vmalloc_study-v1-0-526f68559706@linux.dev>
 <20260914-vmalloc_study-v1-2-526f68559706@linux.dev> <aqgow3u0GSlj0P1Y@milan>
Content-Language: en-US
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <aqgow3u0GSlj0P1Y@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/15 01:02, Uladzislau Rezki 写道:
> On Mon, Sep 14, 2026 at 11:34:01AM +0800, Ye Liu wrote:
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> The allocation and insertion of a free vmap_area is duplicated
>> between the loop body and the tail of vmap_init_free_space.  Factor
>> it into a small helper so the main function only deals with computing
>> the free gaps between busy regions.
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>> ---
>>  mm/vmalloc.c | 41 ++++++++++++++++++-----------------------
>>  1 file changed, 18 insertions(+), 23 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 117483dd048c..797933ba9451 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -5433,11 +5433,23 @@ module_init(proc_vmalloc_init);
>>  
>>  #endif
>>  
>> +static void __init vmap_insert_free_area(unsigned long start, unsigned long end)
>> +{
>> +	struct vmap_area *free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
>> +
>> +	if (!WARN_ON_ONCE(!free)) {
>> +		free->va_start = start;
>> +		free->va_end = end;
>> +		insert_vmap_area_augment(free, NULL,
>> +					 &free_vmap_area_root,
>> +					 &free_vmap_area_list);
>> +	}
>> +}
>> +
>>  static void __init vmap_init_free_space(void)
>>  {
>>  	unsigned long vmap_start = 1;
>>  	const unsigned long vmap_end = ULONG_MAX;
>> -	struct vmap_area *free;
>>  	struct vm_struct *busy;
>>  
>>  	/*
>> @@ -5447,32 +5459,15 @@ static void __init vmap_init_free_space(void)
>>  	 *  |<--------------------------------->|
>>  	 */
>>  	for (busy = vmlist; busy; busy = busy->next) {
>> -		if ((unsigned long) busy->addr - vmap_start > 0) {
>>
> This line gets removed and then re-added below because of removing space
> after (unsigned long). Maybe it is better to keep that space.
However, the '{' is still there, but I'll add a space anyway.
> 
>> -			free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
>> -			if (!WARN_ON_ONCE(!free)) {
>> -				free->va_start = vmap_start;
>> -				free->va_end = (unsigned long) busy->addr;
>> -
>> -				insert_vmap_area_augment(free, NULL,
>> -					&free_vmap_area_root,
>> -						&free_vmap_area_list);
>> -			}
>> -		}
>> +		if ((unsigned long)busy->addr - vmap_start > 0)
>> +			vmap_insert_free_area(vmap_start,
>> +					      (unsigned long)busy->addr);
>>  
>>  		vmap_start = (unsigned long) busy->addr + busy->size;
>>  	}
>>  
>> -	if (vmap_end - vmap_start > 0) {
>> -		free = kmem_cache_zalloc(vmap_area_cachep, GFP_NOWAIT);
>> -		if (!WARN_ON_ONCE(!free)) {
>> -			free->va_start = vmap_start;
>> -			free->va_end = vmap_end;
>> -
>> -			insert_vmap_area_augment(free, NULL,
>> -				&free_vmap_area_root,
>> -					&free_vmap_area_list);
>> -		}
>> -	}
>> +	if (vmap_end - vmap_start > 0)
>> +		vmap_insert_free_area(vmap_start, vmap_end);
>>  }
>>  
>>  static void vmap_init_nodes(void)
>>
>> -- 
>> 2.25.1
>>
> LGTM:
> 
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> 
> --
> Uladzislau Rezki

-- 
Thanks,
Ye Liu

