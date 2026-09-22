Received: from mta1.migadu.com (out-167.mta1.migadu.com [95.215.58.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3123522692
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063685; cv=none; b=uls4Z/Tam5HFzl+rt5VDjinzwh10Mb2Vtdpd/AC/RuEhhlITsAkPKY4Q2bS2QM0ORn2pzWJhOhtGv+q6/gndRpwQ/bk7Y1DYTyB4zfehCzlLWQbwagtHQonXH1534sAFvcU6+LqqNctMySlx/GNs4yyvoYfTwSLljhA46tmOa4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063685; c=relaxed/simple;
	bh=0TJo2ZSluV7GOtUR+gK4tKoCDniJGIYoMCtvZ+NvpCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqyhkOrok5xNqOJszJiDncm/0QuiV2XMFZdTWPYOBWinWe8Dun66DLJN921OG3tqjXpY8JBHkdfxlUZQUMbm/RGBUfLE4pmW++6EOWGUGDi9SnCnCCBKewjERw1f202FdbXyGohsjGnExYWk8oO5L05FrvX1p4Sq6uAWNu5hpsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tGB5EvHd; arc=none smtp.client-ip=95.215.58.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tGB5EvHd"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0TJo2ZSluV7GOtUR+gK4tKoCDniJGIYoMCtvZ+NvpCE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790063672; v=1; x=1790668472;
 b=tGB5EvHd07V3TRZMw3nlxhs4aBNVlsx9LjWONbG45hiYxCmkXpi1+InKeO+o5RER8f1Q0RNp
 YIO7kc+oY9gkGrf5WxWAB1KwqWnpMeNUX9h0Y7ftfm9Chl7NGjuKMGxLmLNGKWn8EuT3o/ZXnO4
 NxjusKf1p68ZfxMuFgFYMbAs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 994fcd1d9a4dc67b;
	Tue, 22 Sep 2026 07:54:32 +0000
X-Mizu-Trace-ID: 994fcd1d9a4dc67b
X-Migadu-Flow: FLOW_OUT
Message-ID: <47038cfd-59a7-4dab-891c-0469cbeb37c8@linux.dev>
Date: Tue, 22 Sep 2026 15:54:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mm/sparse-vmemmap: drop VMEMMAP_POPULATE_DAX
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260913083734.86802-1-songmuchun@bytedance.com>
 <20260913083734.86802-2-songmuchun@bytedance.com>
 <186ee2ba-daf3-4120-a3e3-101cac1ff5a1@linux.dev>
 <4AA6C66B-0FD8-49F3-8447-959A3E438FC2@linux.dev>
 <95d326cb-ebb4-492c-9062-5d373609e18b@linux.dev>
 <6479325A-E6FA-45BD-9392-262E71467EDB@linux.dev>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <6479325A-E6FA-45BD-9392-262E71467EDB@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/26 11:49 AM, Muchun Song wrote:
> 
> 
>> On Sep 21, 2026, at 11:43, Qi Zheng <qi.zheng@linux.dev> wrote:
>> On 9/19/26 10:07 PM, Muchun Song wrote:
>>>> On Sep 19, 2026, at 22:01, Qi Zheng <qi.zheng@linux.dev> wrote:
>>>> On 9/13/26 4:37 PM, Muchun Song wrote:
>>>>> VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population in two
>>>>> places: it keeps allocations on the normal path and takes a reference when
>>>>> a backing page is supplied for reuse.
>>>>> After Device DAX switched to the common per-zone shared tail page, both
>>>>> conditions can be determined locally. DAX supplies ptpfn for every shared
>>>>> tail mapping and requests an allocation only for compound head mappings,
>>>>> whose PFNs are not optimizable. Therefore, vmemmap_optimizable_pfn() alone
>>>>> selects the correct allocation path.
>>>>> When ptpfn is supplied, the caller is reusing an existing backing page.
>>>>> Once the slab allocator is available, take a reference for each reused
>>>>
>>>> Does the availability of slab mean the buddy allocator is already being
>>>> used? Could there be a window where the buddy allocator is functional
>>>> but slab hasn't become available yet?
>>> Yes, because the slab allocator is based on buddy allocator. But I want to know
>>> what's your concern here?
>>
>> The goal here is to check if the buddy allocator is ready, but the code
>> actually checks for slab.
>>
>> I'm concerned there could be a gap between these two:
>>
>> buddy is ready <-- gap --> slab is ready
> 
> There is no vmemmap population during the gap. We don't need to concern the gap.

Okay, perhaps we could add more explanation in the commit message.

With this, LGTM, so:

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

> 
> Thanks.
> 
>>
>> Thanks,
>> Qi
>>
>>
> 

