Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053066;
	b=ZFKtjMhozrwvxWZ0/2z1/8CnuSS337jGQYdvr2y6fRIZO0zsqnxklT2MEUUENrt/4r1k
	 x+k6IsRVCskwMTSKdg//sRwBn6OqrAYrrCJpUXoG3XU1+LvQ1XHBSBfdP58THOMofhqiV
	 f45oD5pnlVbTJn+Y3Jhb/AkhpQD64sUK5XoziKLhKYgjTKk21OCMUy2tbWwqM6TZQzooM
	 YUjrGhWyp55t+TPnHLymVPpXIxLsiYoLIR5wrO+zJSrahyjlVNwK0Ut47iDdO3+LxSp9i
	 4BMkNtPJOVt5RVeOfAMSvxLzmpApg6ZLSeke3/qPm8r0T85oXzktj8oUXlSwwGK6Kig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053066;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fehvpwKLkvAzp8Ic92lGZjTmUddHTM0YOLXxTp5AQBo=;
	b=f9mbCol3xZL2K8ReYK2LthbWguIa32/6xlDFOYB1VwWtPkrRZY9pg8XNIcj5KYpdGI4o
	 eL1gSMGKgmSqjjeASZtDu3T3TDUf7b2Z6qba9YgqZFR67d0P3opfspW+r59FAhmoAi+gI
	 7R4PWrC2b152D3IRn0ZI5obpd2hN0FH+xu0wX4l5Wfjx6FJ7emLGgv11H1fduSjFdu9Tw
	 JVghTb9fMSS7TU+jDu6SXusXxu8TkmnmpfBu4gz7alR+WpDq5Uc+/30fCpyN4W0hq8DS/
	 ktOrDoS7OIRc6a+BrSctnE8vogkkvdW9bYhnMuHOtVFY8xstjjGbC7PqzLxud8DXUSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cNoUt+Ay;
	arc=none smtp.remote-ip=91.218.175.150
Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9D606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F9D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cNoUt+Ay
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E8Yy5bgEjYt6pYSaf6glxvsg2jFl/7uxBAsGhxtzXs8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794053063; v=1; x=1794657863;
 b=cNoUt+AyDRYJYww4eWAnV245h4ALVh+CDwe4HlIqkLVef4mf5Oz0ja/yCE+a+1Psw2NqeZcM
 1zegAI+cNaLKutgSwSX0RLjDlyXpIRDn5VmmHodYWqrTVK12WFNPeeL50FHSL3tgmOslFlwLURC
 dQwjHEapxMo4n3ei4MWQjXpY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3d9503d94a972e62;
	Sat, 07 Nov 2026 12:04:23 +0000
X-Mizu-Trace-ID: 3d9503d94a972e62
X-Migadu-Flow: FLOW_OUT
Message-ID: <ad63bf38-d3c8-4977-8582-60a65815887c@linux.dev>
Date: Sat, 7 Nov 2026 20:04:10 +0800
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
Subject: Re: [RFC PATCH 2/3] mm/mglru: skip the flags cmpxchg when nothing
 changes
To: Kairui Song <ryncsn@gmail.com>
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Joanne Koong <joannelkoong@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20261105132220.2233677-1-ridong.chen@linux.dev>
 <20261105132220.2233677-3-ridong.chen@linux.dev>
 <CAMgjq7DtU+tSOgQWgTaV0obLwkkUwQqgvtTXjG2qf8L+iPXbiQ@mail.gmail.com>
 <57d2a4ca-8edc-4291-a919-8a74abda94a5@linux.dev>
 <CAMgjq7BtS6KKqdq1oVrvrO9FcTEkE4HNJe02dA87n6Zm7FFrww@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAMgjq7BtS6KKqdq1oVrvrO9FcTEkE4HNJe02dA87n6Zm7FFrww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/7/2026 6:39 PM, Kairui Song wrote:
> On Fri, Nov 6, 2026 at 9:44 AM Ridong Chen <ridong.chen@linux.dev> wrote:
>>
>> On 11/6/2026 12:21 AM, Kairui Song wrote:
>>> On Thu, Nov 5, 2026 at 10:11 PM Ridong Chen <ridong.chen@linux.dev> wrote:
>>>>
>>>> From: Ridong Chen <chenridong@xiaomi.com>
>>>>
>>>> folio_update_gen() and folio_set_lru_refs() always end with a
>>>> try_cmpxchg() on folio->flags, even when the new value equals the old
>>>> one. The locked instruction still takes the struct page cacheline in
>>>> exclusive state.
>>>>
>>>> That is common in practice: a folio mapped by many processes is visited
>>>> once per mm during a page table walk, and after the first visit it is
>>>> already in the youngest generation with refs cleared and PG_workingset
>>>> set. isolate_folio() and the eviction paths also call
>>>> folio_set_lru_refs(folio, 0) on folios whose refs are already zero.
>>>>
>>>> Break out of the loop when the flags would not change. The result is
>>>> the same as a successful no-op cmpxchg. The only difference is that the
>>>> full barrier implied by the locked instruction is gone on that path.
>>>> No caller relies on it: the eviction and isolation callers run under
>>>> the LRU lock, and the others (page table walks, folio_mark_accessed(),
>>>> lru_gen_clear_refs()) only care about the resulting flags value, which
>>>> is already in place. Note that lru_gen_inc_refs() already returns
>>>> without any atomic when refs is at LRU_REFS_MAX and the folio is in
>>>> the workingset.
>>>>
>>>> Tested on an i7-13700HX with turbo disabled and the performance
>>>> governor. N processes map the same 2GiB tmpfs file (huge=never) and
>>>> read every page, then one aging pass is triggered on their memcg
>>>> through /sys/kernel/debug/lru_gen ("+ <memcg_id> 0 <max_seq> 200 1").
>>>> Time per aging pass in ms, median of 5 runs of 10 passes each, averaged
>>>> over 2 boots of each kernel:
>>>>
>>>>     processes    base   patched
>>>>             1    32.9      31.7   -3.5%
>>>>             8   195.1     160.2  -17.9%
>>>>            32   755.8     592.2  -21.7%
>>>>            64  1597.2    1260.6  -21.1%
>>>>
>>>> With one process, every visit changes the generation, so there is
>>>> nothing to skip. Before the patch, perf annotate attributes 53-58% of
>>>> the walk_update_folio() samples to the lock cmpxchg in the inlined
>>>> folio_update_gen() in this test.
>>>>
>>>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>>>> ---
>>>>    include/linux/mm_inline.h | 2 ++
>>>>    mm/vmscan.c               | 2 ++
>>>>    2 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
>>>> index b3d85fe91385..4ba9079f4dc8 100644
>>>> --- a/include/linux/mm_inline.h
>>>> +++ b/include/linux/mm_inline.h
>>>> @@ -244,6 +244,8 @@ static inline void folio_set_lru_refs(struct folio *folio, unsigned int refs)
>>>>           do {
>>>>                   new_flags = old_flags;
>>>>                   lru_set_refs_flags(&new_flags, refs);
>>>> +               if (new_flags == old_flags)
>>>> +                       break;
>>>>           } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
>>>>    }
>>>>
>>>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>>>> index 50c352e9ffef..3fa76715382d 100644
>>>> --- a/mm/vmscan.c
>>>> +++ b/mm/vmscan.c
>>>> @@ -3398,6 +3398,8 @@ static int folio_update_gen(struct folio *folio, int new_gen, int *type,
>>>>                   lru_set_gen_flags(&new_flags, new_gen);
>>>>                   lru_set_refs_flags(&new_flags, 0);
>>>>                   new_flags |= BIT(PG_workingset);
>>>> +               if (new_flags == old_flags)
>>>> +                       break;
>>>>           } while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
>>>
>>> Hi Ridong,
>>>
>>> I had the same idea in V4 of MGLRU-FG which is posted a few weeks ago,
>>> with the same code:
>>> https://lore.kernel.org/linux-mm/20261016-mglru-fg-v4-4-2106750c0bfa@tencent.com/
>>>
>>> + if (new_flags == old_flags)
>>> + break;
>>>
>>
>> Hi Kairui,
>>
>> Oh. Sorry about that. I read the series a few weeks ago, but as it is large
>> I missed this change. I should have checked it again before sending.
>>
>>> I didn't have time to benchmark that one function but the e2e test
>>> showed very trivial improvement, it's a good improvement though. Feel
>>> free to add:
>>>
>>> Reviewed-by: Kairui Song <kasong@tencent.com>
>>>
>>
>> Thanks for the Reviewed-by. If you don't mind, I'd suggest merging it as
>> a separate patch, as the test shows the benefit of this small change,
>> which makes the code easier to trace. I will also mention in the commit
>> message that it is a small part of your series. Does that sound OK to
>> you?
> 
> Sounds good to me! No need to mention that, though; I believe you came
> up with this idea by yourself. And that will make the change more
> traceable indeed.

That's very kind of you. Thanks.

-- 
Best regards
Ridong

