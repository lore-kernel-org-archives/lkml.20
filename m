Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956337;
	b=3p1jcJxT8BFFXe3IDF7o6eDwOl61FKbwGqjiDM+/qrep2ljVVlUIa+bT5JWq6jqwlq5A
	 XIzI+fHs7mxUl3yUU3jhd09xgtZGa/UOdrZdXWishNo29qudEt9SFoNYWUp3Gg4h2DEv2
	 1pAUd7PuA7rOxumelrMsKZb+bP7/7I0FBzQ0pmgRt+th/gFB0tCPGTdVT8bdZbgXqNT+I
	 rs0rk0e744sjZojpBANLHoFvj4aL+daDAzsnPj82vaY6MygL5CLKSohPuzJR8KxnjqRVy
	 4Thooau8sJPvWPxz+z4v1uD2PrC5SH3W9ZvE6rChz67QnGU4OWsa1qLxCUJo71MWObA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956337;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FU4+q6u/OsLFgFaCnY4cj+PQmLDqknYoJspT5tQVk2o=;
	b=pBSRsY+e2M5S1kFsE+1JGs9K5fLPAVfYo0J9dhsXhmv1f0e1xRmBoXwcZnS4wkbFi1zd
	 NWmuNs2LRhwt9UTfNP3OE9U8ALZUR8HFoY9rK2t+rQ9EWJvM0g0wwveu6gX1zGumk5YRN
	 q/bvZpLrWt0svmr2YouHLnCfwQQjgMtLGKu7bfArnjlwT+mxkMjbJCuVCVfHW6/lN16xe
	 rC7QuifDMvqHBLj3yYLA1KsFGRlOKfuFKb6MUbhdeZpLjPr7Ktd2LafpHQGtNbeVPFcVu
	 e5BSzQieZNUDtksJAhnLDXroNtWLTj/npvqegFkYfzfosZDZrR/G4Qcko2R6c6Giyrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eDSNbXk1;
	arc=none smtp.remote-ip=95.215.58.43
Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F392606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F392606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eDSNbXk1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EcP7tMfRcqfAvgoH0gXVXtHAsN+lMrgLB2oyqBdVo8c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793956334; v=1; x=1794561134;
 b=eDSNbXk1104OrMa7I53rBqPpa0V4cS2YoF7NfMFChLxfhTTTvrzuGTP63HfVewdMF8/p9/E4
 c2HM+fP6qCUkJX//cuKuT9mnPaMd3A3dXcD+sJw4O56aLrPw4LtSLUjy5olAPag39iK8+HoQxJG
 WjVl743LfNRVxsS58rnRa2Eg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id d18d573a7e491a03;
	Fri, 06 Nov 2026 09:12:14 +0000
X-Mizu-Trace-ID: d18d573a7e491a03
X-Migadu-Flow: FLOW_OUT
Message-ID: <07a6ef5a-3f28-47b8-a063-912f70977035@linux.dev>
Date: Fri, 6 Nov 2026 17:12:04 +0800
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
Subject: Re: [PATCH] mm/zswap: fix double decrement of the LRU node count on
 writeback
To: Yosry Ahmed <yosry@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Nhat Pham <nphamcs@gmail.com>
Cc: Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
 Muchun Song <muchun.song@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>,
 Dave Chinner <dgc@kernel.org>
References: <20261028113619.38752-1-kaitao.cheng@linux.dev>
 <CAO9r8zP15iW3ECW2Bs0rfyZrifeisDunLa6qJC43M1RcE16wWQ@mail.gmail.com>
 <auJkvb-Lq0M5Enkz@cmpxchg.org>
 <2bd4f0df-80c7-4d32-ab50-1225681ff6be@linux.dev>
 <CAO9r8zPuDtn1S0g8rDnXNfSdZ6uuH1geXALDN5-X_SZpM_W+wg@mail.gmail.com>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <CAO9r8zPuDtn1S0g8rDnXNfSdZ6uuH1geXALDN5-X_SZpM_W+wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

在 2026/10/29 23:10, Yosry Ahmed 写道:
> On Wed, Oct 28, 2026 at 9:23 PM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
>>
>>
>>
>> 在 2026/10/29 05:10, Johannes Weiner 写道:
>>> On Wed, Oct 28, 2026 at 12:22:43PM -0700, Yosry Ahmed wrote:
>>>> On Wed, Oct 28, 2026 at 4:36 AM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
>>>>>
>>>>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>>>>
>>>>> Successful writeback calls zswap_entry_free(), which removes the entry
>>>>> from the LRU and decrements both the sublist and node item counts.
>>>>> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walker
>>>>> to decrement the node count again.
>>>>
>>>> I wonder if we have a valid use case for adding LRU_REMOVED_COUNTED or
>>>> LRU_DELETED instead to simply avoid the decrement.
>>>
>>> It bugs me that it's the walker, not the callback, that adjusts the
>>> count. That composes poorly with the normal list manipulation API.
>>>
>>> How about pushing the accounting into the isolation callback, which
>>> can then simply use __list_lru_del()?
>>>
>>> The tradeoff is that more things need to be passed into the isolation
>>> callback, but that seems reasonable. It does make the change noisy,
>>> however, and we might want something like Kaitao's change as a
>>> backportable fix first regardless.
>>
>> I tried three approaches.
>>
>> The first was "pushing the accounting into the isolation callback", as
>> Johannes Weiner suggested. However, as Johannes's example below also shows,
>> this would require extensive changes across multiple subsystems. I doubted
>> that such a broad change would be accepted, so I dropped this approach.
>>
>> The second was to add a new flag to enum lru_status, as Yosry Ahmed suggested,
>> to handle cases like zswap where the callback has already decremented the
>> count. However, the incorrect lru->node[nid].nr_items value in zswap is only
>> an accounting issue: I could not find any code that reads this counter for
>> zswap. Changing a generic interface to fix an accounting error with no
>> apparent functional impact did not seem worthwhile.
>>
>> The third approach is the one implemented in this patch. It keeps the changes
>> within zswap and fixes the accounting issue, so I think it is appropriate.
> 
> I honestly think it's a problem with the list_lru API, as Johannes
> said, walkers compose poorly with the API. So I prefer we either take
> Johannes's suggestion or add LRU_DELETED, unless there's strong
> objection to both ideas.

In v2 (https://lore.kernel.org/all/aupITfr9pBKPrU20@dread/), Dave Chinner
explicitly objected to changing the common interface, so we need to revisit
the fix. Otherwise, progress on resolving this issue will remain blocked.

> FWIW, we don't need a minimal fix for backports, I don't think this
> needs to be backported at all. As Kaitao said, I don't think the wrong
> list_lru count is being used anywhere for zswap.

-- 
Thanks
Kaitao Cheng

