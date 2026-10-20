Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488481;
	b=gmMgacLVRC6Wgvx4gQaRUJPlTbHQaMkjvlHiLJAyzQvd2rOinZ+cKD0bWqlmbOtPadA2
	 CjWmXmlbRkTnDe8jUqVpBttKZ3jkouz+cHZeuU2v/ZUAcymiRl3c5EwzyM8ppUVOUM7TC
	 +Tu/MZAnG8x+1l/afmF5Yhm0Bu/XGR7ijMK235VW24ZSLGF14GUQjJg1CuUrgSnc6yq5N
	 w2irBPzq413g1m6wHe+pxgG/K9hk0WH4yWAs09Y0nfSSZl+ioTPFJF+MoJF2UC3sh7Myu
	 iwTIAGctiWqUgw2h7Uztv3PHQkr8H4Pn6qkoOsFxYdEePCUrKHcAaEKi3eFZANmH2yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488481;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qm5hxrzsx0yRdSYYG6OEY4PTPJuPDuREv28P0/x7drY=;
	b=ImNdj/IzBqvSMzh64eMTY1/wprezz5cwNCJ8mxxgDrbXGl6IZxcixa7cT2tjlKxjmS91
	 cQcBdLA2P1EQIimU/aPzSQrNiSiK14Ku8cmx25rSUSfjtdZuYzcgGxixbQJ3vKJ8GA8LR
	 Lw9Z7UnlRoi/nByc3hT8F5TTAQo6BNlD8Mp3koCQIm9cfr8/BOasX6xnmZ7/xwk1kCT64
	 JAH5Qof6V1jStxIrVcK5xX+26rhHdsvKriqdzwNxXzEIzAxTUB61ZAefPKeGSh9Wkb+71
	 nUiAnvgUMcanctfWv7p14rAPrk3KygYyVbHaGsqtdbmrp+XoESrbSVlTAIPLMsCcYvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JH5lIuMK;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D4606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JH5lIuMK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=msM+cZjAKkwGVsfaQzIbcjbAhIHFxqTzbEiHo39glFo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792488478; v=1; x=1793093278;
 b=JH5lIuMK8SSfFBgtPncMAzzNJQhAmW8ijEW1eP/P+r6H0R2ICX53BgNHF4WT+89bsb0fEL4A
 eUT4F4AjH2UNdQPbWp5ZVTghVEcFbpRyi57cmo7fL1Gb+2/t4sycemaCV3Fc8PU8JXYVaAWyEGu
 IDPsHhWlco6JEZsl44EYKkYc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f945068c0369cb3a;
	Tue, 20 Oct 2026 09:27:58 +0000
X-Mizu-Trace-ID: f945068c0369cb3a
X-Migadu-Flow: FLOW_OUT
Message-ID: <8aa3e14d-6573-4359-919d-a8e9d372032f@linux.dev>
Date: Tue, 20 Oct 2026 17:27:49 +0800
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
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in
 lru_gen_folio_seq()
To: Barry Song <baohua@kernel.org>, Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20261020023548.3242028-1-ridong.chen@linux.dev>
 <CAMgjq7BonFtsvHMRYXXToqWBHTzNa52EU9B4ZqD-k-DJ2inQDg@mail.gmail.com>
 <CAGsJ_4yAYMiRoJRLLt9B_+qdMhOFmizDy-PSbQ3jkMxV0zJqPA@mail.gmail.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <CAGsJ_4yAYMiRoJRLLt9B_+qdMhOFmizDy-PSbQ3jkMxV0zJqPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/20/2026 4:29 PM, Barry Song wrote:
> On Tue, Oct 20, 2026 at 4:20 PM Kairui Song <ryncsn@gmail.com> wrote:
>>
>> On Tue, Oct 20, 2026 at 10:36 AM Ridong Chen <ridong.chen@linux.dev> wrote:
>>>
>>> From: Ridong Chen <chenridong@xiaomi.com>
>>>
>>> lru_gen_folio_seq() computes how many generations below max_seq a
>>> folio should be added to, but stores it in a variable named "gen".
>>> Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
>>> seq % MAX_NR_GENS, so reusing the name for a relative offset is
>>> confusing.
>>>
>>> The comment table above the code also no longer matches it. It only
>>> covers the PG_active and the final branch, leaving out the reclaiming
>>> and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
>>> although lru_gen_folio_seq() never looks at it.
>>>
>>> Rename the local variable to "age", redraw the table so that each
>>> branch maps to the age and seq it produces, and note that the result
>>> is clamped to min_seq[type].
>>>
>>> No functional change.
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>>> ---
>>>   include/linux/mm_inline.h | 48 ++++++++++++++++++++++++++-------------
>>>   1 file changed, 32 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
>>> index ab69b9930893..a933d8c14558 100644
>>> --- a/include/linux/mm_inline.h
>>> +++ b/include/linux/mm_inline.h
>>> @@ -302,34 +302,50 @@ static inline unsigned long lru_gen_folio_seq(const struct lruvec *lruvec,
>>>                                                const struct folio *folio,
>>>                                                bool reclaiming)
>>>   {
>>> -       int gen;
>>> +       int age;
>>>          int type = folio_is_file_lru(folio);
>>>          const struct lru_gen_folio *lrugen = &lruvec->lrugen;
>>>
>>>          /*
>>> -        * +-----------------------------------+-----------------------------------+
>>> -        * | Accessed through page tables and  | Accessed through file descriptors |
>>> -        * | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
>>> -        * +-----------------------------------+-----------------------------------+
>>> -        * | PG_active (set while isolated)    |                                   |
>>> -        * +-----------------+-----------------+-----------------+-----------------+
>>> -        * |  PG_workingset  |  PG_referenced  |  PG_workingset  |  LRU_REFS_FLAGS |
>>> -        * +-----------------------------------+-----------------------------------+
>>> -        * |<---------- MIN_NR_GENS ---------->|                                   |
>>> -        * |<---------------------------- MAX_NR_GENS ---------------------------->|
>>> +        *            +-----------------+-----------------+-----------------+-----------------+
>>> +        * age        |        1        |        2        |        3        |        4        |
>>> +        *            +-----------------+-----------------+-----------------+-----------------+
>>> +        * seq        |     max_seq     |    max_seq-1    |    max_seq-2    |    max_seq-3    |
>>
>> I think this comment update is not beneficial, we might have more than
>> 4 gens in the furture, so hardcoding a number is not a good idea.
>>
>>> +        *            +-----------------------------------+-----------------------------------+
>>> +        *            |<---------- MIN_NR_GENS ---------->|                                   |
>>> +        *            |<---------------------------- MAX_NR_GENS ---------------------------->|
>>> +        *            +-----------------------------------+-----------------------------------+
>>> +        *            | Accessed through page tables and  | Accessed through file descriptors |
>>> +        *            | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
>>> +        *            +-----------------+-----------------+-----------------+-----------------+
>>> +        * PG_active  |  PG_workingset  | !PG_workingset  |                 |                 |
>>> +        *            +-----------------+-----------------+-----------------+-----------------+
>>> +        * reclaiming |                 |                 |                 |     always      |
>>> +        *            +-----------------+-----------------+-----------------+-----------------+
>>> +        * can't      |                 |  anon && not in |                 |                 |
>>> +        * evict yet  |                 |  swapcache, or  |                 |                 |
>>> +        *            |                 |  PG_reclaim &&  |                 |                 |
>>> +        *            |                 | dirty/writeback |                 |                 |
>>
>> I think it's better not to describe too many details in the comment as
>> it actually easier to just look at the code.
>>

Fair points.

What confused me about the current table is that it is not clear
which dimension it is drawn along. The columns are generations, but
the rows mix access paths (page tables vs. file descriptors) with
the flags that protect each of them, and some of those, like
LRU_REFS_FLAGS, are not inputs to lru_gen_folio_seq() at all. So
when reading it next to the code, it is hard to tell which branch
puts a folio where.

How about keeping the existing table for the design overview, and
just adding a short note above it on what "age" means, without
hardcoding the number of generations, e.g.:

         /*
          * The folio is added to seq = max_seq + 1 - age, so age 1 is
          * the youngest generation. Ages up to MIN_NR_GENS are active,
          * and the result is clamped to min_seq[type].
          */

>>> +        *            +-----------------+-----------------+-----------------+-----------------+
>>> +        * else       |                 |                 |  PG_workingset  | !PG_workingset  |
>>> +        *            |                 |                 |       or        |       &&        |
>>> +        *            |                 |                 |  PG_referenced  | !PG_referenced  |
>>> +        *            +-----------------+-----------------+-----------------+-----------------+
>>> +        *
>>> +        * The resulting seq is clamped to min_seq[type].
>>>           */
>>>          if (folio_test_active(folio))
>>> -               gen = MIN_NR_GENS - folio_test_workingset(folio);
>>> +               age = MIN_NR_GENS - folio_test_workingset(folio);
>>
>> That's a very nice rename, the `gen` variable is so confusing to me
>> for a long time, I thought about renaming it to `gap`, `age` looks
>> much better. Thanks!
> 
> Agreed with the rename part. Maybe this doesn't conflict much
> with MGLRU-FG either. It could be cherry-picked before
> MGLRU-FG or included as part of the MGLRU-FG series.
> I'd vote for the latter.

Sounds good to me. Kairui, would you like to pick up the rename, and
the comment change above if you agree, as part of MGLRU-FG?

-- 
Best regards
Ridong

