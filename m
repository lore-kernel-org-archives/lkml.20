Received: from mta0.migadu.com (out-146.mta0.migadu.com [91.218.175.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315578F3A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789962245; cv=none; b=c5APWaYARB/ZSjCluQtrCq35ASdAVruo+7hLLuObGadrpWlj4PqqHZ9OPpum7v7kPLuLmVZd4TJExh2Qljwt8Bg0fb8K8+dgDeanfsr0DsYMVzaUrWn4XEcrxd+DuzARyBZqOgp9grAGWPk5FLjcXG+ZDGYIxdJpZrua0FTclI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789962245; c=relaxed/simple;
	bh=OGERyTp5CrbGXz3u1lwBm+Mkoof0KEPSvGD6/69fiBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcFb/pR3cOfzm9wpNitGkYl20c1SaSmtO7YfL460NKODUFJ5HuFRIae+EuE1lRAMbZel0QNeOcd5vqR6LTQu9/PpJ4lr5Qdihi5/cJQoBMBa32W+K+3GAGHiLOMD+xvMEAaouSjMeBRyTwbUqxMFedIscTDwzF+6MKLoO+So9as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q6i3Cc4v; arc=none smtp.client-ip=91.218.175.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q6i3Cc4v"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OGERyTp5CrbGXz3u1lwBm+Mkoof0KEPSvGD6/69fiBc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789962241; v=1; x=1790567041;
 b=q6i3Cc4vPqW2HACNC1Kbcz5AWkNrBAYd+5bKQYabHMNoOlMMuY3LgSJDfb1uNhWzk0yXNWQ/
 H6nBlVUvtNQacO2ypx/6s3g+F0Qqoq+o8ycUPanwPWEII6LLiBx6wFzMsVCccjETiUbB0bUqndW
 gxfcR9gm2LW9kj92Cy41XQnA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f06bd7d5875bb714;
	Mon, 21 Sep 2026 03:44:01 +0000
X-Mizu-Trace-ID: f06bd7d5875bb714
X-Migadu-Flow: FLOW_OUT
Message-ID: <95d326cb-ebb4-492c-9062-5d373609e18b@linux.dev>
Date: Mon, 21 Sep 2026 11:43:51 +0800
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
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <4AA6C66B-0FD8-49F3-8447-959A3E438FC2@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/19/26 10:07 PM, Muchun Song wrote:
> 
> 
>> On Sep 19, 2026, at 22:01, Qi Zheng <qi.zheng@linux.dev> wrote:
>> On 9/13/26 4:37 PM, Muchun Song wrote:
>>> VMEMMAP_POPULATE_DAX currently distinguishes DAX vmemmap population in two
>>> places: it keeps allocations on the normal path and takes a reference when
>>> a backing page is supplied for reuse.
>>> After Device DAX switched to the common per-zone shared tail page, both
>>> conditions can be determined locally. DAX supplies ptpfn for every shared
>>> tail mapping and requests an allocation only for compound head mappings,
>>> whose PFNs are not optimizable. Therefore, vmemmap_optimizable_pfn() alone
>>> selects the correct allocation path.
>>> When ptpfn is supplied, the caller is reusing an existing backing page.
>>> Once the slab allocator is available, take a reference for each reused
>>
>> Does the availability of slab mean the buddy allocator is already being
>> used? Could there be a window where the buddy allocator is functional
>> but slab hasn't become available yet?
> 
> Yes, because the slab allocator is based on buddy allocator. But I want to know
> what's your concern here?

The goal here is to check if the buddy allocator is ready, but the code
actually checks for slab.

I'm concerned there could be a gap between these two:

buddy is ready <-- gap --> slab is ready

Thanks,
Qi


