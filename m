Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622117;
	b=YM3SbZYT8+Kd9dToSaSbflDSS3/5VRgRTGh2G9ecHHhGH9iNTppYXQV4ISstkzHIAu8J
	 4ZRknMwHqBKvz6/jpMMGlZIzB2lo4/JyQHTvOB8sM2BekMS2dTx5uuYWhpW8u+6LBCQcf
	 N53bpLoN4ryPaLmmje4Tl7VilBm8OTCs7TAxH1ibBH3MoZiNXzFjHbqdcMxalfUfHjhK1
	 PMQg0qtsNkUP7wCxSG1fAMgmImI3/6vUBAzpBj2YZG8m7oeD87nvbs0882wZUMb0cXw6z
	 uG4borSf2UWQccN8LR9ysftWtu950RL1BoXek0QzYZ+564H4MQUztWMdDTEXBIlJc5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622117;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lJSyYvwSTzmhS0c4ngcLjWN7ivwDuselzLolPFvY7As=;
	b=FlvUH7IAvIQHDFFeF5NQLP37w6gpIA57hieZz62oYYMveyed4CLZ/2QT1JpAKLlsHx5Z
	 hgKC/e27VYaa37fPlFn7YwocxB8DdifiPPkhjVzJu5od5TisllcqTImbwwPVlhbKq6yYl
	 qqCHv4WRESKHFt/LpOZ/BbI7Nw71yfEUMO76Rg4qH5Pfmh+wPPJYyTH1YY5tFe4fwaYMG
	 y9HC84iXmaarwvYyQH7zxTPy7cwYOEHUdaPAN3kbWcAtb3X2j/axCgPvDW0OL4rb61Sjg
	 jC0Ly1ZAmfUWjJsxstCCK7F7HvE5QFWSaU1u9BAR4GqzZ3G6gj0RWaLiVRjIMOjengg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cElEVmNU;
	arc=none smtp.remote-ip=91.218.175.51
Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34EC60A6F75
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34EC60A6F75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cElEVmNU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lJSyYvwSTzmhS0c4ngcLjWN7ivwDuselzLolPFvY7As=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793622110; v=1; x=1794226910;
 b=cElEVmNU937nh44jKlu5viOPZ2Kt6mygyHlA41x4Ijf4x6Jik9yWSQGWcppeiFXLHZHA5Inr
 Xx/F+p29wmDcZzSWxQ3vOWEJxQhc9ae/WEEU/c5Z2wVIzmCNbpjZUkJpfwlb4boIWdAoB7oay/x
 X50CRGrVeZDkwslztUyX45gI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 98fd0dfb40fe473a;
	Mon, 02 Nov 2026 12:21:49 +0000
X-Mizu-Trace-ID: 98fd0dfb40fe473a
X-Migadu-Flow: FLOW_OUT
Message-ID: <0368f299-52e5-451f-b1f9-19524af0e931@linux.dev>
Date: Mon, 2 Nov 2026 20:21:39 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-new v1 2/2] mm: vmscan: skip anon folios zswap would
 refuse when writeback is off
To: Yosry Ahmed <yosry@kernel.org>, Barry Song <baohua@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>,
 David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030095223.325309-1-jiayuan.chen@linux.dev>
 <20261030095223.325309-3-jiayuan.chen@linux.dev>
 <CAO9r8zMF-cj4StEz9okWGROGjBhQ1XFVW3H2nJj3b8i5Jj=zAA@mail.gmail.com>
 <CAGsJ_4y52-hyd=JrPaX-isNWNFUfX30aLCgbsiCAFjxDzhYs8Q@mail.gmail.com>
 <auUZPZfxNNBCH5uf@google.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <auUZPZfxNNBCH5uf@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/31/26 6:32 AM, Yosry Ahmed wrote:
> On Sat, Oct 31, 2026 at 03:03:26AM +0800, Barry Song wrote:
>> On Sat, Oct 31, 2026 at 1:52 AM Yosry Ahmed <yosry@kernel.org> wrote:
>>> On Fri, Oct 30, 2026 at 2:53 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>>>> A memcg with memory.zswap.writeback=0 can only swap into zswap. Once
>>>> zswap stops taking its pages, because the pool is at its limit or the
>>>> memcg is at memory.zswap.max, swap_writeout() has nowhere to put a
>>>> dirty folio and returns AOP_WRITEPAGE_ACTIVATE.
>>>>
>>>> shrink_folio_list() only learns that at the very end. Every folio it
>>>> picks gets a swap slot, is unmapped, fails in swap_writeout() and goes
>>>> back to the active list, to be aged and tried again. Each round costs
>>>> a slot, an rmap walk, a TLB flush and a minor fault for the owner, and
>>>> frees nothing. The folio also stays in the swap cache holding its slot.
>>>>
>>>> The obvious place for a zswap check is can_reclaim_anon_pages(), but
>>>> it cannot go there. Zero-filled folios never reach zswap:
>>>> swap_writeout() marks them in the swap table and returns before
>>>> zswap_store() is called. They need no pool space, they are common, and
>>>> a memcg-wide "no anon" decision would keep them in memory for as long
>>>> as zswap is full. With zswap full they must still be reclaimable.
>>> I really wonder if we should revisit not swapping zero-filled pages at
>>> all, and instead mapping them to the zero page read-only (and whatever
>>> the equivalent for shmem could be), because yes, the right place is
>>> can_reclaim_anon_pages(). I don't remember what happened to that
>>> proposal, Usama do you remember?
>> Hi Yosry,
>>
>> FYI, I recalled that we discussed something similar in this
>> thread too:
>> https://lore.kernel.org/linux-mm/20241212073711.82300-1-21cnbao@gmail.com/
>>
>> It would be nice to see an implementation that maps
>> zero-filled pages to the shared zero page.
> Yeah I also found Usama's attempt and the complication that were found,
> unfortunately it's not simple:
>
> https://lore.kernel.org/linux-mm/20240604105950.1134192-1-usamaarif642@gmail.com/.



Exactly, it is complicated.
Taking zero-filled pages out of the swap path doesn't look like an
easy thing to do.

