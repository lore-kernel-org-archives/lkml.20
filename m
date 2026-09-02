Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1200B355813
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327009; cv=none; b=OVfMYI17waJy2U3aLNHLWo0RKrn+Xd5f02DdwV6NflMP47CP/R8guEQG0v/lPcssDsdfAL64JaQgvGJa/F+H6KrfiS7ym0fMR77gMGCZNqxx0g88Ji7vBZChcd5Pe9PphrYL0ZFuzTxFV1E0TNa+xtCKzaHTRmZXcT0Ida5dezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327009; c=relaxed/simple;
	bh=RKaWPkS5gkhVldtR204XZ9vnVaFrNye7474muZuU7A0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbc2H7MjLas3Ev8+bFCDEXdgPCWbIrilKV6dwMMfcmc5T5sQP9Jjh+MoBs5No/j1RdqJ7Mdj8Ov2eHlDWzEM1cUCe8FZywZo82wzBhZIZ/0IGOJfSZin9h+WIQU30+KPzvfJrMhQfPq1eZ29j1Aml3fYAxwwerdWOArjXfDJ2qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=EA6epckl; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="EA6epckl"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788327003; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=M8SuqTKhovBiNOhy36sFqG8T3PHPsV4g3A2I1lrc+ec=;
	b=EA6epcklQUMh3czgdnyCi7XwhuHWczOP+UUJI+lmU2ncAPTu5tmoPeXFibrFt31PjTCYm39I771GT+SukEj3IJsQBwJUy0p4a5epi4WBiZy3hkf7FidHSyzxSG+T+2NZpo5jW5YE79P/C95OfawMrHD2usbRtcrpiOLNMcz+khg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XABT2kE_1788327002;
Received: from 30.74.144.115(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XABT2kE_1788327002 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 13:30:03 +0800
Message-ID: <aba2f612-001c-4e74-8c6f-7fa4ac2e2a98@linux.alibaba.com>
Date: Wed, 2 Sep 2026 13:30:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
To: Qinyun Tan <qinyuntan@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Lance Yang <lance.yang@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Dave Chinner <david@fromorbit.com>,
 David Hildenbrand <david@kernel.org>, Xunlei Pang
 <xlpang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/1/26 7:51 PM, Qinyun Tan wrote:
> With cgroup.memory=nokmem, shrinker_memcg_alloc() fails with -ENOSYS
> for shrinkers without SHRINKER_NONSLAB, and shrinker_alloc() falls
> back to a non-memcg-aware shrinker.  On this fallback path,
> shrinker->id is never assigned and keeps 0 from kzalloc(), which is a
> valid id belonging to whichever memcg-aware shrinker registers first.
> 
> __list_lru_init() copies shrinker->id unconditionally, so every
> list_lru backed by such a fallback shrinker (thp-deferred_split,
> zswap-shrinker, workingset shadow nodes, superblock lrus, ...) ends
> up with lru->shrinker_id == 0 instead of -1.
> 
> Under nokmem the list_lru collapses to the shared per-node lists, but
> __list_lru_add() still calls set_shrinker_bit() against the memcg of
> the added object.  Most list_lru users are unaffected because their
> objects resolve to a NULL memcg without kmem accounting, but the THP
> deferred split queue holds user folios, which are charged regardless
> of nokmem.  Since no memcg-aware shrinker can register under nokmem,
> shrinker_nr_max stays 0 and every memcg's shrinker_info has
> map_nr_max == 0, so the first folio added by khugepaged triggers on
> every boot:
> 
>    WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x99/0xa0
> 
> On systems where a SHRINKER_NONSLAB shrinker (btrfs, xfs) did register
> and expand the maps, there is no warning; instead bit 0 is set
> spuriously for an unrelated shrinker.
> 
> shrinker->id is only meaningful while SHRINKER_MEMCG_AWARE is set,
> and all readers inside mm/shrinker.c already check the flag before
> using the id.  Make __list_lru_init() do the same and fall back to -1,
> so set_shrinker_bit() is never reached with a bogus id.  The stale
> shrinker->id itself is left as is; cleaning that up is a separate
> topic.
> 
> Fixes: 03375203e1da8 ("mm: do not allocate shrinker info with cgroup.memory=nokmem")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
