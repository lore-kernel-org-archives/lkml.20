Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187DD30AAA6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175012; cv=none; b=EUgs+mM3abdiO76856yYq/VNGWtZ3sa5TvwiODUl2N4HTpNwHLzfK2/+SfIHzFU5bEfG59czqixZolmtYVvBKRMl/q+sLE8OZRuMNov37YK4L2H4ugRbLUP85zCOpJLPnmPO/QWqbsO0saYKCy8mNNAPfFerqe+diTDty+dj8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175012; c=relaxed/simple;
	bh=YWlxGEd+q0psBfApITqKzWdA2Uw4k5OebAGh84O7dtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0pXS9tWiAApkbY2Z4ZoiBAOhLbOv0nMPt31+jTzvGjszpiwhvqPwFeRO7Z8PnkdCGuP65/bOfKajlOer8S441KEsnKcuaXx16Vep/DUlVIQMiOoR2itHYbR1ZCXaNPCdJbDyjHX7Pb1FSxxUW4K5noD8yj7fNfsmPwxxZRAFuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Bd1eZyep; arc=none smtp.client-ip=91.218.175.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Bd1eZyep"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YWlxGEd+q0psBfApITqKzWdA2Uw4k5OebAGh84O7dtE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788175008; v=1; x=1788779808;
 b=Bd1eZyepJx6PRVcMTMWIlRP0f7pJy/cLLz2ciTdASJ1IBA23DNGpHDlL67xdx1J8o32VGXwt
 c7yOurJw6GgP/WLL7pQoUT+IVX3mddS9HpZUaXfRb85/5pIHEjeMqSff0bYZGZHMbvYAgNbR1LM
 a51mhcOaFR68btTKtJUR+iD4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5bea7a6055a809e8;
	Mon, 31 Aug 2026 11:16:47 +0000
X-Mizu-Trace-ID: 5bea7a6055a809e8
X-Migadu-Flow: FLOW_OUT
Message-ID: <249e0c30-bdd2-4dec-8c21-57cc4c2dd617@linux.dev>
Date: Mon, 31 Aug 2026 19:16:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm/huge_memory: do not touch frozen folios in
 deferred_split_isolate()
Content-Language: en-US
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: ziy@nvidia.com, kasong@tencent.com, hannes@cmpxchg.org, david@kernel.org,
 hughd@google.com, baolin.wang@linux.alibaba.com, baohua@kernel.org,
 liam@infradead.org, usama.arif@linux.dev, nico.pache@linux.dev,
 dev.jain@arm.com, ryan.roberts@arm.com, balbirs@nvidia.com, kas@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 ljs@kernel.org
References: <20260831091514.1879786-1-kirill@shutemov.name>
 <20260831091514.1879786-2-kirill@shutemov.name>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260831091514.1879786-2-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/31 17:15, Kiryl Shutsemau wrote:
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

Reviewed-by: Lance Yang <lance.yang@linux.dev>
