Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550305;
	b=0LZ5xCMQ8ly1bd4s7cX8v9+NNFSuLCsjKlju8vQWgZwPNj9qUTgw7qjp1Wg74byvMwIV
	 Jc1EivmYj9/jZgpQzGEKePD68Jb7EIE7TuIB0xyHM2l7M+OHWXKC58ABvtQWETBZfck8/
	 45IpIi4Lmtsz/oQjVRUqM3voha/ZdIqhWVnDzuhvpSr3/6Z+RMR3sqW9hlCIYIenc79iW
	 Ggo1MKabO9vPLsOZgUCnoU/dhWxVqF1bnkG4U2Ww/hpZ3sdncCpL8aYZUXzcHmQpPAThm
	 5NsVL1gWN25EmcmSb7+GwYklAw83yw7tjuC4V+gwMBibfw8W6EwouDYtuQ5zkYLIPrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550305;
	h=DMARC-Filter:DKIM-Signature:From:Subject:User-Agent:In-Reply-To:To:
	 Message-Id:References:Content-Transfer-Encoding:X-Original-From:
	 Content-Type:Cc:Date:Mime-Version:X-Lms-Return-Path;
	bh=3um0oSkFchI+VCovec//CZdEMgzXeLCw0E3DOZkZLFM=;
	b=cGoSHz1GwzjvRJflBDOLJ14zTgFUYz3kFyNwL6AFhQ0573F15vzPhvMsTHjOzZz0ssds
	 CjDcKmej/ZA2ifflBJ4xnDLxRBXI4lm1D9hv2Tpidx77ek7SJAWWAbtjh6uaDABxvn8Np
	 y4FQsP1p9BVjjJ/kI4eP6yQGhuZ9/HfE0mV5IZzOarmtB5wjE9qFy1k4AinzyVhU4sDFP
	 QKg8dgbDQMBjE6221h1wwg9a5lVATf6peIVg0SfLrRQPd1LtVQKxtd+rrhUkATzRtX4xL
	 y9rTGGApoDKaxDfDRf7MA09YbEwCVXxfeN/a6IwYvor7VmEfusdhRR51ZczxLq7bplg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=KnZygorN;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5D8606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5D8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=KnZygorN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792550298; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=3um0oSkFchI+VCovec//CZdEMgzXeLCw0E3DOZkZLFM=;
 b=KnZygorNvUDC31e41SbkkHNOHcDVkQUtxHE7QIaAilN+Xrtg3MOGhJQCGd1244FNHb4DxH
 fSkgJcPeHQi82+1mU/8C+c4EXFi6x5kXcPXuo6bou3hhpgvrPXdvEoE4gaYvlzPAPGfOLD
 NjdtSP2xjfggH/Ka+CAIyQOv+K0FRoJ2afLebGYlDqrCuO+QU5BCrrFVHG8uYdBYnwb1r6
 clEoByIUdJHgOqMus528jYmuPVojq8n1aFZCs3+ZkdrNo7KVYzJTYU6yurak56Tf4Kq3fi
 1iBhu1buvWkPvgk/vUfH/f4r3wZDc7Wltpm2Gg7rBMPCaixhAhrLIsmC5xIC+A==
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH V2 1/3] mm/hugetlb: fix mremap move length truncation
User-Agent: Mozilla Thunderbird
In-Reply-To: <b6d4de88-cf2c-444d-8050-da2a9b22c7b9@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, <muchun.song@linux.dev>, 
	<osalvador@suse.de>, <akpm@linux-foundation.org>, <rppt@kernel.org>, 
	<peterx@redhat.com>
Message-Id: <6d3aafde-9082-4c74-bf50-a440671632bc@bytedance.com>
References: <20261019113034.97690-1-lizhe.67@bytedance.com> <20261019113034.97690-2-lizhe.67@bytedance.com> <b6d4de88-cf2c-444d-8050-da2a9b22c7b9@kernel.org>
Content-Transfer-Encoding: 7bit
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 21 Oct 2026 10:38:03 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ad82598+312907+vger.kernel.org+lizhe.67@bytedance.com>

On 10/20/26 4:18 PM, David Hildenbrand (Arm) wrote:
> On 10/19/26 13:30, Li Zhe wrote:
>> move_hugetlb_page_tables() returns the number of bytes moved, but
>> its return type is int while the generic move_page_tables() path uses
>> unsigned long lengths.
>>
>> A hugetlb mremap() move length above INT_MAX can therefore be
>> misreported to copy_vma_and_data(). The out-of-range conversion to int
>> is implementation-defined; on common 64-bit builds, for example, a
>> 4 GiB move can be reported as zero, making the caller treat the move as
>> a failure and use the wrong length for rollback.
> Sounds like we want to CC stable here, right?


Thanks, I will add Cc: stable@vger.kernel.org in v3.

>
>> Return unsigned long from move_hugetlb_page_tables(), matching
>> move_page_tables() and preserving the full byte count.
>>
>> Fixes: 550a7d60bd5e ("mm, hugepages: add mremap() support for hugepage backed vma")
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> ---
>>   include/linux/hugetlb.h | 18 +++++++++---------
>>   mm/hugetlb.c            |  8 ++++----
>>   2 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 16c4c4caa126..cc12040e4032 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -121,10 +121,10 @@ void hugepage_put_subpool(struct hugepage_subpool *spool);
>>   
>>   void hugetlb_dup_vma_private(struct vm_area_struct *vma);
>>   void clear_vma_resv_huge_pages(struct vm_area_struct *vma);
>> -int move_hugetlb_page_tables(struct vm_area_struct *vma,
>> -			     struct vm_area_struct *new_vma,
>> -			     unsigned long old_addr, unsigned long new_addr,
>> -			     unsigned long len);
>> +unsigned long move_hugetlb_page_tables(struct vm_area_struct *vma,
>> +				       struct vm_area_struct *new_vma,
>> +				       unsigned long old_addr, unsigned long new_addr,
>> +				       unsigned long len);
> While at it, can you convert all these to use double tab indent instead?
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>


Thanks, I will fix the indentation in v3.

Thanks,
Zhe

