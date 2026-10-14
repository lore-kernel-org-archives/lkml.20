Received: from mta1.migadu.com (out-73.mta1.migadu.com [95.215.58.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E3640D588
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791951899; cv=none; b=i1cLNCQRTDgcFfbZQPj5U8ANGuEc6dkiH8sxb/09hl0HH9K1OvPTgVGTxrKz2y7hkMG2hel16ZUsmuQjSLHj6iw9oqUApx6vc6eF5/jHNhRTOl2hzusIo1UYvDl33TXjX26DhbqozJmG+mbQ1A/iX5V4du/QzCqwxRmNPSge5mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791951899; c=relaxed/simple;
	bh=tOKfQbBfrehty/qW3pINrljOFcxIODGYHAtE2STWOrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ton9GLtw5dgc+/Gm/tN60ftIgMNxDx2Aor9o7lztPlYRjOxYL3WGGXpBZyfspFZQ3CiOY5DZH9P03LXba7cNhVAimnf/NWag1sxgROMWvnuSAKnHOasdmmQRZeUiFuzmxevAw8c7r5McOVlU3zaGQtQyZmglD1arMQHliqPMDMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gd0b7toG; arc=none smtp.client-ip=95.215.58.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gd0b7toG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tOKfQbBfrehty/qW3pINrljOFcxIODGYHAtE2STWOrY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791951895; v=1; x=1792556695;
 b=gd0b7toGmMGQDvpmBBvyyF3R02lD9xSMO1zWSRXnAw8D/oooqnqMObDHfg1IX5NEjYH/NXYN
 qsZYwebFpj2UQBi/rq86Egs3R9oaLkH8uquYbANSiOxaploED0AS76bAvyGzNGBObjZK9Pv5le7
 N3DdpIyQIeXZ70vIDXn6rQwU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 967b8fc28b66cba3;
	Wed, 14 Oct 2026 04:24:55 +0000
X-Mizu-Trace-ID: 967b8fc28b66cba3
X-Migadu-Flow: FLOW_OUT
Message-ID: <75a46520-0771-4a50-ba77-ba815dfb6bac@linux.dev>
Date: Wed, 14 Oct 2026 12:24:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm: unqueue deferred split folios outside the lruvec
 lock
To: Barry Song <baohua@kernel.org>, joannelkoong@gmail.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, hannes@cmpxchg.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com,
 usama.arif@linux.dev, hughd@google.com
References: <20261013221307.850803-1-joannelkoong@gmail.com>
 <20261014030737.2102-1-lance.yang@linux.dev>
 <CAGsJ_4wxKQK=caM6a_AqJArGyJdBgq_=i=gSNjiVePkGBZHnpg@mail.gmail.com>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4wxKQK=caM6a_AqJArGyJdBgq_=i=gSNjiVePkGBZHnpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/10/14 11:13, Barry Song wrote:
> On Wed, Oct 14, 2026 at 11:07 AM Lance Yang <lance.yang@linux.dev> wrote:
>>
>>
>> On Tue, Oct 13, 2026 at 03:13:07PM -0700, Joanne Koong wrote:
>>> move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
>>> folio_unqueue_deferred_split() on folios where the refcount has dropped
>>> to zero. In these paths, folio_unqueue_deferred_split() is called with
>>> the lruvec lock often held (move_folios_to_lru() always holds it and
>>> folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
>>> in the batch except the first). However, it's not needed to hold the
>>> lruvec lock.
>>>
>>> The lruvec lock protects folio->lru and the reclaim LRU lists whereas
>>> the deferred split queue lives on folio->_deferred_list in
>>> deferred_split_lru. The deferred_split_lru is a list_lru with its own
>>> per-memcg per-node lock.
>>>
>>> There are already other existing callers that call
>>> folio_unqueue_deferred_split() without holding the lruvec lock (eg
>>> __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
>>>
>>> Add folio_batch_unqueue_deferred_split() and use it in
>>> move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
>>> unqueue each batch of zero-refcount folios from the deferred split list
>>> after the lruvec lock is released and before
>>> mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
>>> critical sections, which run with IRQs disabled and are highly
>>> contended.
>>
>> Nice work! Thanks!
>>
>> BTW, have you seen measurable overhead from unqueueing deferred split
>> folios under the lruvec lock?
>>
>> Any before/after numbers for this change, including the cost of the extra
>> pass over the batch?
> 
> I recall Joanne mentioning some data on this in the link below. Is that right?
> 
> https://lore.kernel.org/linux-mm/CAJnrk1a2PpUGTsCgS7jct2KET4K2zAL+_h+te8G1MaU9bXs99w@mail.gmail.com/

Thanks, Barry! Yes, those numbers answer my question about the
observed overhead :)

Joanne, have you rerun that benchmark with this patch? I'd be
interested in the before/after runtime and lruvec lock wait.

Cheers, Lance
