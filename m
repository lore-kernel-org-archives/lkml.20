Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1BF388371
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020997; cv=none; b=WRQdgIL2CLYnvE/SBEKHcDv15WZSVT0UVFn0zGsKoX/+MtCQfbPY8ogHKHHJjffcxOLlDwjHcf0KAd+WquKxBUc7Z548NdgFqjyMCY8b7fRPwGNsAsH1d31WYZVbcf65bWoWwhoWQnIKZSwcLItebCHdGJRyViFb8LarIDeDJGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020997; c=relaxed/simple;
	bh=p+y0PN6mR31PohlWhzq8Aw6AVr/yUxoSMYAvxtIzJlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/gGCACkMQS2d8ED+bhw9ox90dwxdijcqQTv1imlhKOpe3FtwQ8xbW89BHzjvogZHs8+Xfmjl6pjhfqb0Fac0ObZDY0PS7sRPLOPGkuipLgD9gzw6Wd7qEegqwgFWxOX0HhM2JnHX5kEDyY+1MsVdEhDcWeXFEsxK5bzbpCXg5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=LrluNfDp; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="LrluNfDp"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so376124985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790020994; x=1790625794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQm/uwfE/blbvgLVhCQkOkUD5IsuWeBPyg1vuiu/AZE=;
        b=LrluNfDpFLY1mdebKyaXDtoPEt+y1NpGZ7dZDXG88mYYd7mRGBo2KXQa/XlwjY8sw9
         mehGFhzzJuBQgq0YmAI1oPvwINDo7l122D/dijhUTy6nwlF4cO3DNWdKxAxUkkbLaUtM
         ehziGClLMSILFSso0A75UiXgFgfM4T3eBNUcxaZdduw5OAuoxi+Esq51uW/CwSG5mc8X
         yRxck/+VaBOL5S81ynIVozA72CmIp0F3ILz2JyGKe8vPg3lfywlPM0I2ZoVOH9kcgJXW
         jwiE6jBflCXCcVE1EOf28y/PvDcBvbMWrd04OKZLYNzMa+kMysGiHNBMgc2AGLjgNI8/
         50Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020994; x=1790625794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQm/uwfE/blbvgLVhCQkOkUD5IsuWeBPyg1vuiu/AZE=;
        b=VUeCffaUFVs+elftq4aDRIXpsf9NdDgLpNER3rFyqS34tXdRdyfVthfUlV04qAejCT
         bQ8huNLuZyeGsKHVB+vUDnLzGS9fnh1JnthzGPYowSal3yrUEwQ+mCiaL9canYjFJBCm
         56BR0Fcm1FaPrILZDJ/OsrWAPRkS3UVVTeWEVwkhBcN9i6YvDmmNC5dNSn3h5DQCgNF+
         /dYl73DibswhekI6J8W1UsnBHd/0StbmyvCz4l84ulOnpKWhV/62Xbh992hwT07ToCaI
         7btXKy0E/yvie8Mdmweoin/IlLUnzpLTEA1IOsGJbP6Jp87RsWTDQYWUX+IzI9l3Ibi9
         MLdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhLLpTFzbgbprhhc5EZyJmbzU9yS9yIY2DMAI04jRM1aLDV5Nm9kyU7rXwziLcgO3KIvS6z7d6xXIDfMc=@vger.kernel.org
X-Gm-Message-State: AFuF++lqnI7k5m3is5HUo6UKmAt5lSvFN18SjWYmNe8oEcICBRv/aKjl
	GBXJ9ptrb3UdGiZwH+GSSKYL0x4q6hyW22eJzocR+h4A0eOLxMs8QqPWqM0IAd/GTN0cZfx7QdI
	jUHpa
X-Gm-Gg: AYBFou2+Hd5k/sf5ufxYMtm3fL1yLuFO4HUWS1J2dCwQC9NrE6exqZ+48glcnl/OlWn
	h8cbcy9UqE0Y4vrWK19ScdBt4mAdRxsrERKl1rMDhIKmKuBI+wy3mAhURmYzFtw31528ePaw9KC
	IaBeuWgEa+hbDxiMj8E4qmQScrEG0e7iy3M3SgSYzBLHhlm1Y1KkFdikT3Qb3M/TZ56NYkEzgLs
	jEX6Mdj4nBP14Ac4hhZ67Lp3fLIA+kapsH8S7BFq8sh9KdB01BZvSXlscC1xjjgCZCbGCzZK7T4
	Ov1vb5oyNnWih+ykZut7kUWy0SHg/r/yISLpiJifBJNKmQ5kBcQJTLmbcFc5UoWZjELc3igIDqE
	5HYKAXPtz8as1Bo4QYQ71cuDakI8TnXPjrA/3KhWRl9q4owQd89iaCIwINGUeR57NiasmgK2f3D
	MO5mAirVSM57sAQ35BBRUjNBHdZJ+OYpoWgyxGaZ1atrEdVLW7dx9M2pAC7A98HF8DZUCg
X-Received: by 2002:a05:620a:1a11:b0:93b:c332:3d9e with SMTP id af79cd13be357-93c198e7a38mr13199385a.30.1790020993597;
        Mon, 21 Sep 2026 13:03:13 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a9c777sm4296385a.27.2026.09.21.13.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:03:12 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:03:09 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Liam.Howlett@oracle.com, david@kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, riel@surriel.com,
	vbabka@suse.cz, ziy@nvidia.com
Subject: Re: [RFC 2/2] mm: page_alloc: per-cpu pageblock buddy allocator
Message-ID: <arGNfQQAVRZpEoPl@cmpxchg.org>
References: <20260403194526.477775-3-hannes@cmpxchg.org>
 <20260918022222.22955-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918022222.22955-1-laoar.shao@gmail.com>

Hello Yafang,

On Fri, Sep 18, 2026 at 10:22:22AM +0800, Yafang Shao wrote:
> On Fri,  3 Apr 2026 at 15:40 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> 
> [...]
> 
> > @@ -2941,15 +3242,45 @@ static void __free_frozen_pages(struct page *page, unsigned int order,
> [...]
> > +	pcp = per_cpu_ptr(zone->per_cpu_pageset, cache_cpu);
> > +	if (unlikely(fpi_flags & FPI_TRYLOCK) || !in_task()) {
> > +		if (!spin_trylock_irqsave(&pcp->lock, UP_flags)) {
> > +			free_one_page(zone, page, pfn, order, fpi_flags);
> >  			return;
> > -		pcp_spin_unlock(pcp, UP_flags);
> > +		}
> >  	} else {
> > +		spin_lock_irqsave(&pcp->lock, UP_flags);
> > +	}
> 
> [...]
> 
> > @@ -3025,17 +3369,35 @@ void free_unref_folios(struct folio_batch *folios)
> [...]
> > +			if (!in_task()) {
> > +				if (unlikely(!spin_trylock_irqsave(
> > +						&pcp->lock, UP_flags))) {
> > +					pcp = NULL;
> > +					free_one_page(zone, &folio->page, pfn,
> > +						      order, FPI_NONE);
> > +					continue;
> > +				}
> > +			} else {
> > +				spin_lock_irqsave(&pcp->lock, UP_flags);
> > +			}
> 
> Hello Johannes,
> 
> Thank you for the great work on this series -- I hope it is still being
> actively worked on.

Thanks for the kind words.

I am still actively working on it. Since the last iteration I have
addressed a few things:

1. The locking bug you are seeing. Rik had also run into this during
stress testing. The fallback to the zone buddy on PCP contention
brought back some of the original zone->lock contention. So instead
I'm using the zone llist introduced for lockless allocations.

2. The PFN search for block recovery that Vlastimil pointed out. I've
tried various solutions (counters, bitmaps) but the thing that worked
best was having the zone buddy itself maintain free pages of owned
blocks on a per-block loaner list (in addition to the regular zone
freelists). This eliminates the sparse search altogether. Recovery is
then: pcp->owned_blocks -> pbd->buddy_loans -> page. Every page
visited gets recovered. For the loaner list_head, I'm reusing
mapping/index space that's unused in a freed page.

3. Removed the unowned buddy splitting on the PCP. Vlastimil had
actually asked to try that separately, as an incremental step, since
it's self contained. I tried this but realized that part was actually
bad altogether. It violates the rmqueue_smallest policy and causes
runaway fragmentation - just like the new block claiming did before I
added the block recovery step beforehand.

So now refilling is just block recovery -> new blocks -> unowned
singles of the requested order.

Incidentally, this also eliminated the CMA problem that Frank pointed
out, since the other refill paths respect ALLOC_CMA.

4. I realized I'm also violating the smallest-first policy in how I
was mixing owned and unowned chunks on the same freelists. For
example, an order-3 refill from singles sits next to order-3 fragments
from owned blocks. Only owned fragments, which route back to and
reassemble on that PCP, must be split. Unowned singles must be
consumed at their native order to preserve smallest-first policy.

pcp_rmqueue_smallest() could check the PagePCPBuddy() flag to tell
which ones can be split, but that introduces another sparse search
problem, where we might walk higher order lists in the hope to find a
splittable owned buddy.

To avoid this, I retained the legacy/unowned pcp freelists (up to
costly order and THP), and added a second set of buddy freelists up to
pageblock order to the PCP. This way the rule can be maintained with
O(1) list checks instead of O(pcp size) scans.

5. The on-demand merging at drain time proved problematic. Draining
isn't exhaustive, so it can attempt to merge the same unmergeable
fragments repeatedly. I moved merging into the pcp free path instead,
so every page is tried for merging exactly once, which seems to
perform a lot better in performance testing.

Overall, it's gotten a bit bigger than I had hoped for. But it also
looks much more robust. And the additions described above seem well
offset by performance improvements in tests so far, even on smaller
machines.

I'm still testing and polishing right now, and hoping to send a new
version soon.

> We are suffering from heavy zone->lock contention on our production
> servers as well, so I backported this series to our internal 6.18.y
> kernel. However, since deploying it to a few dozen production servers
> running workloads with heavy memory and I/O pressure, we have been
> hitting hard lockups at a rate of roughly one every day or two. The
> hard lockups look as follows:

[...]

> With these changes applied, the affected servers have been running
> lockup-free for more than two weeks so far.

I'm assuming you saw an improvement of zone->lock contention. Would
you be able to share some numbers or observations?

Thanks again!
