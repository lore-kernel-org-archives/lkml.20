Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E0B320A04
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226720; cv=none; b=Sv221TLAiewIXtRU2tRFDyGabr+30RIOn3uP/c2aZQbF95MI/Z6JkNgs7yErgacS1dtF2iAGiZCrpabJ2Th2OVZDPC7I4rNEn3Iwm7UzLyE6z2w6hq096OwawPEm5FDJ/9/+CAFdzzbsvWid6ZzADNiDDsVUypInO8ZqakSFOXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226720; c=relaxed/simple;
	bh=5dUHuBTqi3Rm+qLOK7yC+mxblg/6/DPE6PGeRFe0KlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wm19OtZ5OJXqKnDW757yy3/AfTWgrxrN+W4lWZXDkaQMf6PVRzmnoZqPs2LWnrdM2ZhnN0j9aBcr/ZBBd9WY3ldWeChgLDsI10Lr+AAn1BbIc3wiWVhiPs+ZAH9zjUTDrx1neVvcXTkTNjNv0ukgQ+WAkPGX/f2HcZuqJlz3AkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nm8vlbs+; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nm8vlbs+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788226714; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Ycy4OKk1KlIEFG7HzpEc7ZUQeBgOA/LNvRw8vb5tr30=;
	b=nm8vlbs+hRscix7wzIKxnAyL2gp1Wyy5cppuySE0joun2JM69lHJOnEDzPEAWEiOaZN22Cf1qnRKepbVyWyZFVYge2HFQcaAI+q9/bXP8ezEJm6jMvLDQssNnYpk3Xya/FKxQoexb7dXYdV0fHYSgeEWJzn5JaQp9a4JZg7CI1c=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XA0icNh_1788226712;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XA0icNh_1788226712 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 09:38:32 +0800
Message-ID: <4b5a8f77-a5c8-4751-b60d-0c748460167b@linux.alibaba.com>
Date: Tue, 1 Sep 2026 09:38:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm/huge_memory: do not touch frozen folios in
 deferred_split_isolate()
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, hannes@cmpxchg.org, usama.arif@linux.dev
Cc: lance.yang@linux.dev, ziy@nvidia.com, kasong@tencent.com,
 hughd@google.com, baohua@kernel.org, liam@infradead.org,
 nico.pache@linux.dev, dev.jain@arm.com, ryan.roberts@arm.com,
 balbirs@nvidia.com, kas@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260831091514.1879786-1-kirill@shutemov.name>
 <20260831091514.1879786-2-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260831091514.1879786-2-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/31/26 5:15 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> deferred_split_isolate() probes each queued folio with folio_try_get().
> folio_try_get() failure is treated as a lost race with folio_put(): clear
> PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
> the folio off the queue.
> 
> The folio_put() race is the most common case for !folio_try_get(), but
> it is not the only option. Another scenario is folio_ref_freeze().
> 
> A zero refcount in such cases does not mean the folio is going away.  It
> means "don't touch me" and current deferred_split_isolate() doesn't
> respect it. It can lead to unqueueing folios from the deferred list for
> no reason:
> 
>      CPU 0                            CPU 1
>      ---------------------------      ------------------------------
>      freeze a mapped folio            deferred_split_scan()
>        folio_ref_freeze()               folio_try_get() fails
>                                         folio_clear_partially_mapped()
>                                         NR_ANON_PARTIALLY_MAPPED--
>                                         folio off the queue
>      give up, put it back
>        folio_ref_unfreeze()
> 
> The folio is still partially mapped, but it is no longer a split candidate.
> Nothing queues it again until part of it is unmapped once more.
> 
> Skip the folio instead: whoever freezes the folio, owns it and owner is
> responsible for its fate. It also covers the folio_put() case:
> __folio_put() unqueues the folio via folio_unqueue_deferred_split().
> 
> Nothing is lost by skipping.  Everything that frees a queued folio
> unqueues it first, and folio_unqueue_deferred_split() clears
> PG_partially_mapped and brings MTHP_STAT_NR_ANON_PARTIALLY_MAPPED down
> on the way:
> 
>      __folio_put(), folios_put_refs()   mm/folio.c
>      __folio_migrate_mapping()          mm/migrate.c
>      shrink_folio_list()                mm/vmscan.c
> 
> __folio_freeze_and_split_unmapped() does the same by hand, under the
> list_lru lock it holds across the freeze.  A freeze that ends in
> folio_ref_unfreeze() leaves a folio that is still partially mapped and
> still belongs on the queue.
> 
> Fixes: 8422acdc97ed ("mm: introduce a pageflag for partially mapped folios")
> Reported-by: Lance Yang <lance.yang@linux.dev>
> Closes: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
