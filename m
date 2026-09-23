Received: from mta0.migadu.com (out-229.mta0.migadu.com [91.218.175.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7713CA92
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135337; cv=none; b=c1GA3t1yaxtQV5KhmGvWumDqrFhHSmibzyaqVFZYDONuOvB7M67rzPa3tj+X+hF8ktviqvA5p1T8AXmDgkrzUA8hNwQIGPm1SIk/A9tX0Hqd/N1T5iVc0N4bK6rS3AttM9vyvc74pgHftsljCTcYR1Mwj6crsZ2XDKAQWaYON7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135337; c=relaxed/simple;
	bh=kwj1dykHmtOFPAs+8qWDVTWLL54NsScLQymUSN+v64I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2zctuLZQVE42PlJ6XZepxUNDZtX7Qe6nejXKTOQFMKOUEuJ5/Jd6DP6Zb228GOQ3hiOIztofkomR+8Kq1rXyPzroSj59NTy8MRf5ey0Nd/VmIxnYrFwnKz+9Ju7OgpP6/wnN6iZpJ9kVytugbaOhfTlauX/oPuGELgsQ0k8nGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eGGSwrT1; arc=none smtp.client-ip=91.218.175.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eGGSwrT1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kwj1dykHmtOFPAs+8qWDVTWLL54NsScLQymUSN+v64I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790135333; v=1; x=1790740133;
 b=eGGSwrT1bfdsDebz6TCRNlnQKa0MDYDXCwWENpPCG1kHQM6ruG3wBZuS1aIYtY4cYC9gCtV7
 1u1XLvwiK1rR4YX+IuWb7mIIHrKa/WKLQbF2+P6IG7KhskfRyjuc8CuCbQ34mVZLxrocAcfefBv
 8u5L4QjGO8BHdCmWUWh1VxPk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09235456071ae306;
	Wed, 23 Sep 2026 03:48:53 +0000
X-Mizu-Trace-ID: 09235456071ae306
X-Migadu-Flow: FLOW_OUT
Message-ID: <97c0aabf-872d-46d7-bc98-ab50ea7035a0@linux.dev>
Date: Wed, 23 Sep 2026 11:48:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc
 addresses
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ye Liu <liuye@kylinos.cn>
References: <20260921-vmalloc_dump_obj-v2-0-73fceb3ed1c8@linux.dev>
 <20260921-vmalloc_dump_obj-v2-3-73fceb3ed1c8@linux.dev>
 <arJw-VKQNxWA0RSc@milan>
Content-Language: en-US
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <arJw-VKQNxWA0RSc@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/22 20:13, Uladzislau Rezki 写道:
> On Mon, Sep 21, 2026 at 09:17:23PM +0800, Ye Liu wrote:
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> vmalloc_dump_obj() unconditionally searches all vmap nodes even when
>> called with a non-vmalloc address (e.g. a slab or stack pointer from
>> mem_dump_obj()).  Add an is_vmalloc_or_module_addr() check at the
>> entry to avoid the unnecessary per-node trylock and rb-tree traversal.
>>
>> Use is_vmalloc_or_module_addr() rather than is_vmalloc_addr() because
>> module, BPF, and execmem allocations reside in MODULES_VADDR..MODULES_END
>> on x86_64, arm64, and riscv -- outside VMALLOC_START..VMALLOC_END -- but
>> are still tracked in the same vmap_nodes rb-tree.
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>> ---
>>  mm/vmalloc.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 30c610f678dc..d8095b558365 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -5277,6 +5277,9 @@ bool vmalloc_dump_obj(void *object)
>>  	unsigned long addr;
>>  	unsigned long nr_pages;
>>  
>> +	if (!is_vmalloc_or_module_addr(object))
>> +		return false;
>> +
>>  	addr = PAGE_ALIGN_DOWN((unsigned long) object);
>>  
>>  	/*
>>
>> -- 
>> 2.25.1
>>
> Do we need this check? If it is not the vmalloc address, we just return
> noting. Another question is why do you want is_vmalloc_or_module_addr()?
> 
> vmalloc_dump_obj() is about VMALLOC_START..VMALLOC_END, IMO.
> 
> There are only two users of it and both rely on the VMALLOC_START..VMALLOC_END
> range:
> 
> <snip>
> *** mm/kasan/report.c:
> print_address_description[403] if (!vmalloc_dump_obj(addr))
> 
> *** mm/util.c:
> mem_dump_obj[1096]             if (vmalloc_dump_obj(object))
> <snip>
> 
> 	if (is_vmalloc_addr(addr)) {
> 		pr_err("The buggy address belongs to a");
> 		if (!vmalloc_dump_obj(addr))
> 			pr_cont(" vmalloc virtual mapping\n");
> 		page = vmalloc_to_page(addr);
> 	}
> 
> and
> 
> <snip>
> 	if (vmalloc_dump_obj(object))
> 		return;
> 
> 	if (is_vmalloc_addr(object))
> 		type = "vmalloc memory";
> <snip>
> 
> --
> Uladzislau Rezki
Hi Uladzislau,                                                        
                                                                      
You're right that the check is not necessary — without it,            
vmalloc_dump_obj() just returns false for non-vmalloc addresses after 
searching the rb-tree, which is fine for a debug path.                
                                                                      
Regarding is_vmalloc_or_module_addr(): the concern was that module/BPF
allocations are also tracked in vmap_nodes rb-tree (they go through   
__vmalloc_node_range with MODULES_VADDR..MODULES_END), so             
is_vmalloc_addr() would filter them out.  But I agree that            
vmalloc_dump_obj() is about VMALLOC_START..VMALLOC_END, and both      
callers already use is_vmalloc_addr() in their logic.                 
                                                                      
I will drop this patch from v3.  The series will be two patches: the  
alignment fix and the cross-zone lookup fix with the shared           
find_vmap_area_lock() helper.                                         

-- 
Thanks,
Ye Liu

