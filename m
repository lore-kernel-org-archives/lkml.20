Received: from mta0.migadu.com (out-166.mta0.migadu.com [91.218.175.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2844A64D6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363619; cv=none; b=RR4lJLFN8h8xoWlvf1Vdx0lBjhMit4XHCUbFO5TDXtLgz7Xt0wzCADX/1vBZbn/XPWGYHOipBEhXa5vOs4DI616ZtGxhIM9TX8wAI5OOOVOw2e8SFdKPTxgnrapqG6IVo79BVI15mAbJOw7w2CgkD3FmpqMv1N7MUsLGYfRjgWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363619; c=relaxed/simple;
	bh=XgAxi/AozePVAAsGuyYaplqRMqNIRGre5HL93/nj7/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBve6mAh0Dd9Xvm20nJy60CLNCpNTi55hYwW0qJ8cd676n/7uG7OYGAyPH/Y5pTuhJaoz0A5pPUQLu0cp7XTY54Cq/WZbuUp7Czt1jpl+5nN3Bj03CWdB8FamDgSv+T31CWmY25tbqhvGzaKmRLhd4Jh4n9nbdvw6mN0LTp2RgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QbF+57ia; arc=none smtp.client-ip=91.218.175.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QbF+57ia"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XgAxi/AozePVAAsGuyYaplqRMqNIRGre5HL93/nj7/E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788363613; v=1; x=1788968413;
 b=QbF+57iaD79gvn7EK/B7z/gopq8GRR6y5Heai5CRsGqbqdrdwkEmPr0m4bjALgJgauVUPl6l
 YaDfRFev1om365xVxLQiPRAQwv9u12FnCP8TzDQmyIUbdQDJ5IciUmx5HR5r6eVyR0Zh2xLgATg
 UEM4UBdp9j8qokVhK0m+3K4s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f8325dd3e3de5b6b;
	Wed, 02 Sep 2026 15:40:12 +0000
X-Mizu-Trace-ID: f8325dd3e3de5b6b
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 08:40:10 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/shrinker: fix bogus set_shrinker_bit() with
 cgroup.memory=nokmem
Message-ID: <aphDRUyFXJjEEhJN@linux.dev>
References: <20260902073800.305481-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902073800.305481-1-jiayuan.chen@linux.dev>

On Wed, Sep 02, 2026 at 03:37:59PM +0800, Jiayuan Chen wrote:
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

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
