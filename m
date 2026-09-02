Received: from mta0.migadu.com (out-75.mta0.migadu.com [91.218.175.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14D846D2D3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348889; cv=none; b=kiam4gA+caPVlQeXQyye/oaSTgsq5iOKGlgL5vQeR7ZkWCutN8uyvGpvAAl7MvYe9Z/gOTLMyoX/HtWgZ15pwvPHKTl50NLpdlPTqHDAMIuF1mI0jlTKICvMhS34rW4xv48F5OpfOOgzyDB5Ko48cbBvcHbQSwNmz9qmtdcxeuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348889; c=relaxed/simple;
	bh=qjw5gpQggZH5kMdGCrNH15qunf+SR8sJSyM7R3/MV2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ufa44RckmMBuvyN3qqZP3TQUOTHza9YOftWRKxNvNyKqd4C+Mwu0WNyg4bWF4pyEqWKAn1aTIDVuU9ri7ToOTwMvx+2nv/E1tLPm8kUhbjJipaRjEfVuciXXMXcyvS2M1VemMNCm14ysLHisqMDek+j1VNKIKGTS6Np0udCCKwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cGbEubHa; arc=none smtp.client-ip=91.218.175.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cGbEubHa"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qjw5gpQggZH5kMdGCrNH15qunf+SR8sJSyM7R3/MV2c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788348878; v=1; x=1788953678;
 b=cGbEubHadqfrVll+7NNtWQIYnPU686kaQlFqGD/JIMkOVW5ieqSumYnRxe7b8rcwbG4Iy3Oo
 ANgS2U+7SDLV1BWt0vhTI4YP1DYyfGKEy6pX3btbTHmpEAPOkc0XC2m8ZbEZs5R9BRUcZP8W2jC
 MLNZIDIJAoaryukC8TxW+woc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0649d5faa369876e;
	Wed, 02 Sep 2026 11:34:38 +0000
X-Mizu-Trace-ID: 0649d5faa369876e
X-Migadu-Flow: FLOW_OUT
Message-ID: <5753d853-df04-4918-9852-c23842c66428@linux.dev>
Date: Wed, 2 Sep 2026 12:34:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/shrinker: fix bogus set_shrinker_bit() with
 cgroup.memory=nokmem
To: Jiayuan Chen <jiayuan.chen@linux.dev>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org
References: <20260902073800.305481-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260902073800.305481-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/09/2026 08:37, Jiayuan Chen wrote:
> With cgroup.memory=nokmem, shrinker_memcg_alloc() bails out early and
> never allocates an id, so shrinker->id keeps the 0 it got from the
> kzalloc() in shrinker_alloc(). __list_lru_init() then copies that 0
> into lru->shrinker_id, where it looks like a valid bit index.
> 
> Nothing calls expand_shrinker_info() on nokmem either, so
> shrinker_nr_max stays 0 and every memcg ends up with an empty map
> (map_nr_max == 0).
> 
> deferred_split_folio() hands a real memcg to __list_lru_add()
> regardless of whether the lru is memcg aware, so the first THP queued
> in a cgroup does set_shrinker_bit(memcg, nid, 0) and trips the bounds
> check:
> 
> WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x7d/0x90, CPU#126
> Call Trace:
>  <TASK>
>  deferred_split_folio+0x18c/0x220
>  map_anon_folio_pmd_nopf+0xdd/0x130
>  map_anon_folio_pmd_pf+0x14/0xb0
>  do_huge_pmd_anonymous_page+0x1a1/0x620
>  __handle_mm_fault+0xea9/0x10d0
>  handle_mm_fault+0xe5/0x320
>  do_user_addr_fault+0x1cc/0x870
>  exc_page_fault+0x81/0x1b0
>  asm_exc_page_fault+0x27/0x30
>  </TASK>
> 
> Harmless, the WARN_ON_ONCE() is what keeps the out of bounds unit[]
> read from happening, but the id should not look valid in the first
> place. Clear it before returning.
> 
> Two other spots could paper over this: drop the id in
> __list_lru_init() when nokmem turns memcg_aware off, or make
> deferred_split_folio() pass NULL like list_lru_add_obj() does. Both
> leave shrinker->id lying around for the next caller, so fix it where
> the id is handed out.
> 
> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  mm/shrinker.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index a70aab124a0e..7ec2a9704f6f 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -227,6 +227,8 @@ static int shrinker_memcg_alloc(struct shrinker *shrinker)
>  {
>  	int id;
>  
> +	shrinker->id = -1;
> +
>  	if (mem_cgroup_disabled())
>  		return -ENOSYS;
>  	if (mem_cgroup_kmem_disabled() && !(shrinker->flags & SHRINKER_NONSLAB))


Thanks for the fix!

I think the initialization would look better in shrinker_alloc()?

