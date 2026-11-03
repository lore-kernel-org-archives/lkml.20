Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669324;
	b=P5Ux06IOUgg26XevuSGwUJZ/eo17Lmp+n4nEQWbVyKIlWP6LPaKyBV8yDPdR7LsyDoWn
	 GveqPZKdrz8Xm0LgD+G4LIWbqHw2zHLfQihnIg6Ca+pHMfMR2OHZePYUCTzuM7d2gm8sW
	 o9ftZqheEA96dmpcHSgNOI2Vp8oqsdQl0wFZNWK55Sc+Qj6GIrkbl8cGuHzuQelPjLVX+
	 kZdX4s9GJp5Ej83Pji8OZO4x/dBPKuBgF7S7rwCazV6oOAT0C2WJeZlDWv+dB2UX9C73k
	 B5xq/BD28TiYvSDEQ8nUo0VIuKBSnisOBgRxgZcxwetfJBWhV2w7J1i/iizsLz/Zt/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669324;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zYiqOA3TF5D8l7p/X4g/neFYYur8zLKr3v5bYCoBZMY=;
	b=WUROLUxxhBLKGeXvpSV+zW3HvkN1SQzWIFNuXJu1mFigAADBeP3kAEW8FsITngw6jX4K
	 mj+DRvn7y30VghlZ46bNLNLWrpItCxDPxAQHJ++kqo4Nu1EgxhFN0hIvNQg252KwQ66pV
	 BKPy/zI70ZiBx6q4i9QEtd9eM3JrDOo8HEFht3Uu4JFTqoWOSVJlomuwey9588lirD6Rc
	 7rova1iflAZQBjp1VYbYN/xepFchMUoBCN1Nm9o3/kTt/1jfjkHLpsfAqRloyC1QQmhIb
	 rmdkzxqGIUG24OttuYZUqPjLSvUSAF2Zo3ibq6Ribm358UIFg5GurjqXhJ+/KxzKySg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a2iC8BIg;
	arc=none smtp.remote-ip=91.218.175.86
Received: from mta0.migadu.com (out-86.mta0.migadu.com [91.218.175.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F45606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9F45606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a2iC8BIg
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ViW3AR3aucqfjaslib2uPpXkrn3bYgKYm/ie3qj5EvY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793669321; v=1; x=1794274121;
 b=a2iC8BIgro5Y6032BHcbFol1vwo/kIZR2Fvy+Tm5OKERGZxUuNPx+fwCSgxo0mGO64IUugpZ
 JEav5eR6Edm/13yko8Z2YhG5u4GqMAhGPdp7DLKWiKD3mjzhIOzjk1QkVArTTJyL5KNdEZuoX/I
 rlNknM/mqdoEHcQk2K1ddz5o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 4a6a12f2aec11156;
	Tue, 03 Nov 2026 01:28:41 +0000
X-Mizu-Trace-ID: 4a6a12f2aec11156
X-Migadu-Flow: FLOW_OUT
Message-ID: <d79c6bd5-68f0-4268-bc4a-7d453acc26ff@linux.dev>
Date: Tue, 3 Nov 2026 09:28:30 +0800
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
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
 Muchun Song <muchun.song@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20261028113619.38752-1-kaitao.cheng@linux.dev>
 <CAO9r8zP15iW3ECW2Bs0rfyZrifeisDunLa6qJC43M1RcE16wWQ@mail.gmail.com>
 <auJkvb-Lq0M5Enkz@cmpxchg.org>
 <2bd4f0df-80c7-4d32-ab50-1225681ff6be@linux.dev>
 <CAO9r8zPuDtn1S0g8rDnXNfSdZ6uuH1geXALDN5-X_SZpM_W+wg@mail.gmail.com>
 <aujBMrk-nFaVtPsB@cmpxchg.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <aujBMrk-nFaVtPsB@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/3 00:58, Johannes Weiner 写道:
> On Thu, Oct 29, 2026 at 08:10:54AM -0700, Yosry Ahmed wrote:
>> On Wed, Oct 28, 2026 at 9:23 PM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
>>>
>>>
>>>
>>> 在 2026/10/29 05:10, Johannes Weiner 写道:
>>>> On Wed, Oct 28, 2026 at 12:22:43PM -0700, Yosry Ahmed wrote:
>>>>> On Wed, Oct 28, 2026 at 4:36 AM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
>>>>>>
>>>>>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>>>>>
>>>>>> Successful writeback calls zswap_entry_free(), which removes the entry
>>>>>> from the LRU and decrements both the sublist and node item counts.
>>>>>> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walker
>>>>>> to decrement the node count again.
>>>>>
>>>>> I wonder if we have a valid use case for adding LRU_REMOVED_COUNTED or
>>>>> LRU_DELETED instead to simply avoid the decrement.
>>>>
>>>> It bugs me that it's the walker, not the callback, that adjusts the
>>>> count. That composes poorly with the normal list manipulation API.
>>>>
>>>> How about pushing the accounting into the isolation callback, which
>>>> can then simply use __list_lru_del()?
>>>>
>>>> The tradeoff is that more things need to be passed into the isolation
>>>> callback, but that seems reasonable. It does make the change noisy,
>>>> however, and we might want something like Kaitao's change as a
>>>> backportable fix first regardless.
>>>
>>> I tried three approaches.
>>>
>>> The first was "pushing the accounting into the isolation callback", as
>>> Johannes Weiner suggested. However, as Johannes's example below also shows,
>>> this would require extensive changes across multiple subsystems. I doubted
>>> that such a broad change would be accepted, so I dropped this approach.
>>>
>>> The second was to add a new flag to enum lru_status, as Yosry Ahmed suggested,
>>> to handle cases like zswap where the callback has already decremented the
>>> count. However, the incorrect lru->node[nid].nr_items value in zswap is only
>>> an accounting issue: I could not find any code that reads this counter for
>>> zswap. Changing a generic interface to fix an accounting error with no
>>> apparent functional impact did not seem worthwhile.
>>>
>>> The third approach is the one implemented in this patch. It keeps the changes
>>> within zswap and fixes the accounting issue, so I think it is appropriate.
>>
>> I honestly think it's a problem with the list_lru API, as Johannes
>> said, walkers compose poorly with the API. So I prefer we either take
>> Johannes's suggestion or add LRU_DELETED, unless there's strong
>> objection to both ideas.
>>
>> FWIW, we don't need a minimal fix for backports, I don't think this
>> needs to be backported at all. As Kaitao said, I don't think the wrong
>> list_lru count is being used anywhere for zswap.
> 
> Good point.
> 
> Ok I will send a proper patch and we can discuss it from there.

My v2 version is almost ready, please give me a moment.

-- 
Thanks
Kaitao Cheng

