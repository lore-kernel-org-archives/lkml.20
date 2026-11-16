Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793710;
	b=sMD2WqVcm7Ey3LUgR8aqkUGoHBnfQtmRWUvRz/5U/pErFuxSxBKrLtKXUqfZVZ1IwSJE
	 59J7ntksDc4DHYmRF5al/Sx5nSg0IlJPlihdIuTHLB8lhNB7HUSm4m5W395VVksUMcqj5
	 x8cU0IvGvvBfvSGcNtY67ISEsW9GNEr8c113pKSSj1VquqqYBqj9z1BapuKjadERV3hOg
	 tEH/BgGYIcHId90dR8a/N/YKTcbG9jIT2V94SALvTogvI7HOC5PTZC8cAQb9FOJVzYhJa
	 P0dfHxsKkY0fOxiqNKP1psy8Kcn5AI9gNeopCEpMxQL6995611ykA92r+JDYKHfZ4sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793710;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SvYb2dbF8RnLfseYOjJpEqV6XDnyeEcsBNE/GmkQ/9I=;
	b=4IukjJUnbvCG6Ic9i9ZfkuwU3zOgfiqcDDLn7qx2I9oPelKb0q1yNeVx825u88r+eEtZ
	 x1s9ZfzPGJirSp3gABuf+YJPxHg5ZBO3l+jjXbErL6fuRyO2dcILhmK1KFN6dGEi5kYRh
	 iySdtnvVRCwQx8sEc1FlPR9d9GABBqBA7NhGVG0YzNlYGzOIulUQMNRK9igM/7p1F5fB3
	 AnXk6za7pwbmNC/8agJt6nUoQFVO9K6KPGVtdXKBIR4EROcpA6eWujMO/7GR+Lr8/XNZS
	 CVnghoM06CWgmxZ0eVPvDVgNwoK6/FzvzzO4ZB6J7qkJ6DNovNX76Zl17WBu9mGE7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lhFLmzbK;
	arc=none smtp.remote-ip=91.218.175.176
Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509D606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9509D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lhFLmzbK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Yho2xLjSCxu9gfbIDUeoWttJyXdMvsMQaSwbhg6fSYE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794793707; v=1; x=1795398507;
 b=lhFLmzbKTduR9ver9Ra7b8ZIeuudqIc1Km/1sdaQFfbTc3qOcio/1UfUJzCdI0xmywBPmRyz
 dN6wDg0rQmfbnVuqpj7gr9+01mahSzQjo2ropmTcq3wT+TuIFWwLDhWWNTd6or6Qj53ntlGCGwS
 H2KaLCRHbQk6XCRHLMTBNzh4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4b9c400b95ed6538;
	Mon, 16 Nov 2026 01:48:27 +0000
X-Mizu-Trace-ID: 4b9c400b95ed6538
X-Migadu-Flow: FLOW_OUT
Message-ID: <e4f50794-0c47-4fd3-8c3d-f3888f83dd2e@linux.dev>
Date: Mon, 16 Nov 2026 09:48:21 +0800
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
Subject: Re: [PATCH] mm/mglru: deactivate anon folios into the oldest
 generation
To: Barry Song <baohua@kernel.org>
Cc: Kairui Song <ryncsn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Yu Zhao <yuzhao@google.com>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20261112081928.3014946-1-ridong.chen@linux.dev>
 <avV52J2rD19cjM2J@KASONG-MC4>
 <CAGsJ_4yibOkJmi9niJ8svu2NdEkZ5Qyf98VO6qMrJMa_9wGFgQ@mail.gmail.com>
 <c01ec177-da44-49bc-a542-35b64554526f@linux.dev>
 <CAGsJ_4xx8ivDeh1d5pvJOEgndRL8rf=CO2==T480pAm=j2X0ZQ@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4xx8ivDeh1d5pvJOEgndRL8rf=CO2==T480pAm=j2X0ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/16/2026 8:28 AM, Barry Song wrote:
> On Thu, Nov 12, 2026 at 4:55 PM Ridong Chen <ridong.chen@linux.dev> wrote:
>>
>>
>>
>> On 11/12/2026 4:41 PM, Barry Song wrote:
>>> On Thu, Nov 12, 2026 at 4:38 PM Kairui Song <ryncsn@gmail.com> wrote:
>>> [...]
>>>>>    mm/folio.c | 11 ++++++++++-
>>>>>    1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/mm/folio.c b/mm/folio.c
>>>>> index ea3adb6a89d7..c412d9b398e4 100644
>>>>> --- a/mm/folio.c
>>>>> +++ b/mm/folio.c
>>>>> @@ -583,7 +583,16 @@ static void lru_deactivate(struct lruvec *lruvec, struct folio *folio)
>>>>>         lruvec_del_folio(lruvec, folio);
>>>>>         folio_clear_active(folio);
>>>>>         folio_clear_referenced(folio);
>>>>> -     lruvec_add_folio(lruvec, folio);
>>>>> +     /*
>>>>> +      * For MGLRU, lruvec_add_folio() places anon folios that are not in
>>>>> +      * the swap cache into the second youngest generation, which is an
>>>>> +      * active one. Add the folio to the oldest generation instead, like
>>>>> +      * lru_deactivate_file() does for clean folios.
>>>>> +      */
>>>>> +     if (lru_gen_enabled())
>>>>> +             lruvec_add_folio_tail(lruvec, folio);
>>>>> +     else
>>>>> +             lruvec_add_folio(lruvec, folio);
>>>>
>>>> Hi Ridong,
>>>>
>>>> One question here, why MGLRU/CLRU have to use two different ways to
>>>> add the folio back?  Will this cause over aggressive reclaim of the
>>>> folio?
>>>
>>> I guess that is because on mglru, that is lacing a way to add the folio to
>>> the head of the oldest generation for anon folios while CLRU can do
>>> that :-)
>>
>> Hi Kairui, Barry,
>>
>> Thanks for taking a look.
>>
>> Barry is right about the reason. With the classic LRU,
>> lruvec_add_folio() adds the deactivated folio to the head of the
>> inactive list. With MGLRU, lruvec_add_folio() can't put an anon folio
>> into the oldest generation at all: lru_gen_folio_seq() places a
>> swap-backed folio that is not in the swap cache into max_seq - 1,
>> regardless of its refs. The only way to reach the oldest generation is
>> the reclaiming path of lruvec_add_folio_tail(), and that path adds the
>> folio to the tail.
>>
>> And you are right that this makes it more aggressive than the classic
>> LRU. With this patch, a deactivated folio is evicted before the folios
>> already in the oldest generation, while the classic LRU puts it behind
>> the folios already on the inactive list. It also changes file folios:
>> before this patch they are added to the head of the oldest generation,
>> the same as the classic LRU, and now they go to the tail.
>>
>> So the problem in the current code is that a deactivated anon folio is
>> promoted into an active generation, and with this patch it goes one
>> step further than the classic LRU in the other direction.
> 
> I think MADV_COLD is fundamentally broken for anonymous folios
> under MGLRU!
> 
> An anonymous folio may already be in an older generation, but
> lru_deactivate() can actually promote it to the second-youngest
> generation, effectively making it hotter instead of colder!
> 
> Right. For anonymous folios, we have no way to insert them at the
> head of the oldest generation without introducing a new flag like
> PG_cold, which is unlikely to be accepted.
> 
> If we instead insert them at the tail of the oldest generation,
> I'm not sure whether that would be consistent with the historical
> semantics of MADV_COLD.
> 
> But I've been thinking about how to insert a folio at the head
> of the oldest generation. Why can't we simply move the folio
> directly from its current generation to the head of the oldest
> generation in lru_gen_deactivate_folio()?
> 
> For example, something along these lines:
> 
> lru_gen_deactivate_folio()
> {
>          int type = folio_is_file_lru(folio);
>          int zone = folio_zonenum(folio);
>          int gen = lru_gen_from_seq(lrugen->min_seq[type]);
> 
>          if (folio_lru_gen(folio) < 0)
>                  return false;
> 
>          folio_clear_active(folio);
>          folio_clear_referenced(folio);
> 
>          list_move(&folio->lru, &lrugen->folios[gen][type][zone]);
> }
> 

I think that works, and it is better than what this patch does. It
puts both anon and file folios at the head of the oldest generation,
which matches the classic LRU, and it avoids the two problems I
mentioned (too aggressive for anon, and moving file folios from the
head to the tail).

A plain list_move() is not enough though. We also need to:

- update the gen bits in folio->flags with a cmpxchg loop, as
  folio_inc_gen() does, since folio_update_gen() can change them
  locklessly from the page table walk;
- fix up lrugen->nr_pages and the LRU sizes. lru_gen_update_size()
  warns on an active -> inactive move ("demotion requires
  isolation"), so this would be done as a deletion from old_gen
  followed by an addition to new_gen.

min_seq only advances under the LRU lock, so it is stable here.
Something like:

static bool lru_gen_deactivate_folio(struct lruvec *lruvec,
					struct folio *folio)
{
	  int type = folio_is_file_lru(folio);
	  int zone = folio_zonenum(folio);
	  struct lru_gen_folio *lrugen = &lruvec->lrugen;
	  int new_gen = lru_gen_from_seq(lrugen->min_seq[type]);
	  unsigned long new_flags, old_flags = READ_ONCE(folio->flags.f);
	  int old_gen;
	
	  do {
		old_gen = ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
		if (old_gen < 0)
			return false;
		new_flags = old_flags & ~LRU_GEN_MASK;
		new_flags |= (new_gen + 1UL) << LRU_GEN_PGOFF;
	  } while (!try_cmpxchg(&folio->flags.f, &old_flags, new_flags));
	
	  if (old_gen != new_gen) {
		lru_gen_update_size(lruvec, folio, old_gen, -1);
		lru_gen_update_size(lruvec, folio, -1, new_gen);
	  }
	  list_move(&folio->lru, &lrugen->folios[new_gen][type][zone]);
	
	  return true;
}


> Right now, lru_deactivate() seems unnecessarily complicated,
> incurring additional CPU overhead and LRU lock contention:
> 
> 1. Remove the folio from the LRU list.
> 2. Add the folio to the LRU cache.
> 3. Drain the LRU cache.
> 4. Add the folio back to the LRU list.
> 
> Why do we need all these intermediate steps instead of moving
> the folio directly in a single operation, given that we're
> already manipulating the LRU list?
> 
> Am I missing something?
> 
I don't think the batch itself is the problem. The folio stays on the
LRU while it sits in the per-cpu batch; only when the batch is
drained do we take the LRU lock once for up to a batch of folios and
do del + add under it. So the batch reduces lock contention rather
than adding to it. What the in-place move saves is the del/add pair
inside the lock.

So I plan to keep the batching and, in lru_deactivate(), call
lru_gen_deactivate_folio() instead of lruvec_del_folio() +
lruvec_add_folio() when MGLRU is enabled. I'll test it and send v2
if that sounds good to you.

-- 
Best regards
Ridong

