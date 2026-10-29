Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247341;
	b=pJjwQlV44nG0t9VuxomLVOumhfDA6MlHDmJKPMmPW+H4878sMVATnyjfkTphWStEPb3Z
	 NpbJ/s3+lxmXearYEJsFaINUhO4hECwPyYrR7lsPx7r0I33toj0vjwR7VF9w6dCh5h8hX
	 wsPIQn829cq0UcDEBT760Ad1d7Gw06I13LIFtvq4Rbt9JTuCPvIJTVdA6sgxPOwKJQH8w
	 hrl8v3+vxuceNUVnq6gLQdBfYzCIU3DEjC4SDWfIJ8qqbUnYsvB04e/hQfehn7QY0hbuS
	 ItDrReFLZItl77S837ZoBGCOrqmEJW9Qxxe7ABka2Hamsz3otC8ob75SMlCyM7yUa4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247341;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=R5Iw6XNOv11IMqEOTa+b+9SQzWGBF50EMs427zf5Llk=;
	b=AsKt3wPry1sPXXNTchzD8KbFvkqeIYYyPdWGHEjcou9axyHlmRYH1KCvBpY08pvElNYv
	 aOpBL8sWLltreXb12aivbYXKBoe7OshPoq1V5nMBJHJfHtuvZVBXVQ70lpaJf93vFt3tX
	 NPniiFM9XmiLGMb35XeopUKC/9WUhTDAeo/lwkRCQ8nU4y2TcDz2gesnFSiWMcfxiY/tY
	 YXxe5PQluhIEbVPr2RjNpOLRwBJ069MNCyuiYulQyzAxOOW9KcrzLgbToEUlqpKj2AbuK
	 dCw241z+EzXMUJ8lJw+/wwuR3PU9xfghgv9MpnQhsxjx2nAJ32Ui+CmT1+PgB1cXwyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="E7r9Du/H";
	arc=none smtp.remote-ip=95.215.58.97
Received: from mta1.migadu.com (out-97.mta1.migadu.com [95.215.58.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0274606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0274606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=E7r9Du/H
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YEZp3sGN8gs48o4bStQAvC9Qt9Sv9D5jLzzzs1e263Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793247337; v=1; x=1793852137;
 b=E7r9Du/HofmzApl61zpJXYUqnn5MpnM03T6rVnFrcyBHY71X0Y9vsrSZvbEKgGaT0i2EaUJI
 Gk7pM8P9rwh6Zr2lqVRP2/q2783uSiMNoRJmxmSHT0IV6+hj0Rmw+eIPYSA8N7dHZl2qzn9j6in
 PzqACY6e1+6BXSvS33bz3048=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c6635af0f1e01899;
	Thu, 29 Oct 2026 04:15:33 +0000
X-Mizu-Trace-ID: c6635af0f1e01899
X-Migadu-Flow: FLOW_OUT
Message-ID: <3410e049-2e61-4ab1-b776-e77f3b97517f@linux.dev>
Date: Thu, 29 Oct 2026 12:15:23 +0800
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
To: Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20261028113619.38752-1-kaitao.cheng@linux.dev>
 <CAKEwX=NfFNbBwhvNpYz8iWgimFuOow8J8x1SzV_6GcC_bb=Etg@mail.gmail.com>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <CAKEwX=NfFNbBwhvNpYz8iWgimFuOow8J8x1SzV_6GcC_bb=Etg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/29 02:47, Nhat Pham 写道:
> On Wed, Oct 28, 2026 at 4:36 AM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
>>
>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>
>> Successful writeback calls zswap_entry_free(), which removes the entry
>> from the LRU and decrements both the sublist and node item counts.
>> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walker
>> to decrement the node count again.
>>
>> The affected call path before this change is:
>>
>>   __list_lru_walk_one()
>>     shrink_memcg_cb()
>>       zswap_writeback_entry()
>>         zswap_entry_free()
>>           zswap_lru_del()
>>             list_lru_del()
>>               __list_lru_del()
>>                 atomic_long_dec()  /* first node count decrement */
>>       return LRU_REMOVED_RETRY
>>     atomic_long_dec()              /* second node count decrement */
>>
>> Add zswap_lru_del_nocnt() to remove the entry and update only the sublist
>> count, leaving node accounting to the walker. Split data cleanup into
>> __zswap_entry_free() so writeback can free the entry without performing
>> another LRU deletion. Other free paths retain their existing accounting.
> 
> What is the visible effect? Is there any effect, be it in reclaim
> dynamics or userspace counters? Can you add it to the changelog?
> 
> I'm not against fixing it, but need to gauge the effect for
> prioritization, whether to cc stable etc. etc.
> 

This is only an accounting issue; I could not find any code in zswap that
reads lru->node[nid].nr_items.

>>
>> Fixes: 5878303c5353 ("mm/zswap: fix race between lru writeback and swapoff")
>> Link: https://sashiko.dev/#/bug/linux-68d2ca49-23be-4504-9a75-b8526ec92388
>> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>

-- 
Thanks
Kaitao Cheng

