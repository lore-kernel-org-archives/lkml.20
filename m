Received: from mta1.migadu.com (out-100.mta1.migadu.com [95.215.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25925346766
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882887; cv=none; b=SBPOG7m9cKlTzztjOP1IXC2kUGknHFrVwK86RG1UYyDjTRHQCNB01zXEy3uN44XeRZRDNH0zAG95EXpRsC3gb+JZzHu/t4qEEz+crvIpI1M9PRLRn19akRflN4aQH2Fa9f0zE4vse7P2+a5IpBWTLHnmdk2thKLc8+wzP7d5X4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882887; c=relaxed/simple;
	bh=V2olgPrVx/bw1wkdwsCXU0ioQk+pJBVYyH0u4HOW5i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7uEyzNFa+bSt1tzRKuAPuRcx2lF7/yF/UQzsfkhuu9D9FbPu45fquxZGkW4qbHpvn13UoKaIR+V6uZMzi+MMLY4LAfy1zaqYzLL9eMgkNYS/3XL8IjcWSlf+2hd+RlXSXjVG9bedtGUcHegnoHtmpwsZaJYUvZqgGbfDJFQqWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i1OLnB+z; arc=none smtp.client-ip=95.215.58.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i1OLnB+z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V2olgPrVx/bw1wkdwsCXU0ioQk+pJBVYyH0u4HOW5i0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787882882; v=1; x=1788487682;
 b=i1OLnB+zqDCLVZTeHkmY+8n+M19USmjjr00B4XfZBfi1KTMrkJb2C9REA4M+JkwSWa5zCq60
 i0Qqj5iS79dLSntDSxgWR77N8jJ2VMlRArZwPe4Dsz6o1nacjXPBfoYJ9tUgXrRaYVpWOtCssu/
 +nOjkfDd8xzen2EN9p3kHBSE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ce77929620145a86;
	Fri, 28 Aug 2026 02:08:02 +0000
X-Mizu-Trace-ID: ce77929620145a86
X-Migadu-Flow: FLOW_OUT
Message-ID: <ac0d1ef0-1cbd-40d1-9f0f-c12d890be3ec@linux.dev>
Date: Fri, 28 Aug 2026 10:07:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memcg: sink mem_cgroup_uncharge_folios() into
 free_unref_folios()
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>, Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ridong Chen <chenridong@xiaomi.com>
References: <20260827030516.462926-1-ridong.chen@linux.dev>
 <20260827145209.GA3004@cmpxchg.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20260827145209.GA3004@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/27/2026 10:52 PM, Johannes Weiner wrote:
> On Thu, Aug 27, 2026 at 11:05:16AM +0800, Ridong Chen wrote:
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> Every caller of free_unref_folios() invokes mem_cgroup_uncharge_folios()
>> on the same batch immediately beforehand.  This pattern is duplicated
>> across shrink_folio_list(), move_folios_to_lru(), folio_batch_move_lru()
>> and folios_put_refs().
>>
>> Move the uncharge into free_unref_folios() itself so the batch is
>> uncharged in one place before the folios are freed.  This removes the
>> repeated boilerplate at every call site and makes it impossible to free
>> a batch without uncharging it first.  No functional change intended.
> 
> Hm, IMO this is confusing. You're making uncharging an included
> service in a subset of the page allocator freeing API. Batch freeing
> uncharges, but single page freeing does not.
> 
> I don't think saving 7 lines is worth that API caveat.

Thanks Johannes.

I thought this could improve cohesion, since we have to uncharge the batch when 
freeing unreferenced folios. However, I didn't consider the symmetry with single 
folio freeing.

I'll just drop the patch if it's causing confusion.

-- 
Best regards
Ridong

