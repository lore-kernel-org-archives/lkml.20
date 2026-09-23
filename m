Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DAB3AE198
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174104; cv=none; b=aTLhDqyq69bfKqQ7ixuni2Ekh9OhWXaAaaNMqS+ew4J0aFCY+npxMUpqf5+Wq8rL8kySzQ/j2bku67YeBAKR/bjl0apnoLBjmLx7NqQQR0XsmabjkQcsIvPx0h5RwevZi1qi7TOypyplHteKtteqf49APcD3e7OcMqkYMR18QMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174104; c=relaxed/simple;
	bh=5uIlNa4xAoXh/sFqM7AmbWsWqOhs2eV3y5IK8rYjWoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpPVTgCyHrxjuEa9nZ8MYuEpD9qhJDL7mmYLWi2YiecYLFHH0Nuy9NLcxzgvwkcitQ9HZNjPUfMRHz6x+WibGhqzvKjWBfWKM0omDBdt0VgwIaH0ZQzvvKm8KVkLuB/bb6OGt9dRJbHViZlvDgRuq/GyEm4+Pf4xYcCilXl/Z5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhCZj666; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhCZj666"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso671230f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174101; x=1790778901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CxuB9ejzTC3o9hFwevWHCxu5Fr62XzfQUzmljnivqK4=;
        b=bhCZj6661fV3XPzCS7tqELrBJYuhlYKT7FgVnHnY3obiteRy0IgKRks/WwbfW15uiF
         DJkux1hmPK3xUKyN+wuLA4qPzIsL9Gr//m3S0DOXeSwSGNsOZs9Qawebyb+KFR+CQofW
         SPlRjj6uqPgGz/OzGU9iRVd4OT6mLdD83Bov2vgStdGfHL3a0XA6ufFuk+q3BbaMgMa6
         Dru+955Up4LHuovuPbHstZwZoMXPoj43PQQ7fMfWySMLTnk+SewULYWn4mO03vZ37Nn/
         yQOkprEeYEpzbr0KUgs1zOXsNVihl3rQ786/CK4gUJ4Cy54wjvR+IB448meAWvXwtnYv
         WvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174101; x=1790778901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxuB9ejzTC3o9hFwevWHCxu5Fr62XzfQUzmljnivqK4=;
        b=ppirKBSDzsmIS2syvd3semv76FswzQTEySGtejVZPSKfnLEuGRcbC9IIm4SgjdV2Sk
         bApdOf7nDPlmq9kKc8/Iuzvu+7uvUFMaXpJoV3lve2/sGKG07oUmeeCtqoGbwIjYOiX4
         NnZau5rXYoqStVU+1H3nhx42Nfdsp0ULsKVS1OI43UTKxcXsUNjV0gUzVduk15u1dX9l
         HQOrLagGMTFOD8ZvKfnNkhcKZ9e98vBNaMX7XQsUlaVUH+QmIM9DlUmI/HeIUTEtmhC9
         Hn+W0NTFpXuRqaNlJHyRD93ggYTwdU7hZi20S7+jTrA99R3dScjnUlIHDkPqrrP3hz2l
         lDYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8XD/Yvh1J4jx8QcugFlWjyTnSOfY/1hzOgVoSXlRd70qbv9crL7irRAXWO9VJ4DsANYuJWw8pkqgOJ7o=@vger.kernel.org
X-Gm-Message-State: AFuF++mI5jxwFjM4ypRztrqPsiP5l+iLR3mIvjGNLSLp6cZXnhjPQBSC
	1vcmcgSgHGITdiOjcSnBhc12DKbM/GX4GvLhgT+vpKiLRPBp5ndHQHM4
X-Gm-Gg: AYBFou28VvWqRYPgv1puesGOJk3rAF7DZ6fOKFKRBQjFNokB1M3lVRfLN0EjfYQIXgV
	k9rhXaP9o0JThqShnIwEyeMB5LYc/rJ28Q5xySDArjKos4vzSXEldypNazTGVGh6wdQy7XFMlnO
	NPvAmHlbN8iEcsvdqySAajzssFG1G3VB9x5OvrFu1AK74Gng9jmO3bCTdlF7s6PIFrf/N76K1X3
	Rngk0QK0zNyWPdgstFsF9Ga5s07RDmZPp+Sd6TjB6H8nr1iINfEaXBS0lqduASmhPIiRY8DjLMI
	FaVYX2/4c9E5C3lNMXnHr5MZCQn0j1U7B5XOWuPMuxhyMOvuCRx5+cqD+Eq6jWeBFhAFx/o8ybx
	cDnGddI8P3a1mnfEqHIYxIswLNIcTgAhkUwyC18JvxjSqvyt883ayyOEF0lPZmY9QNth1rrvA+7
	gJyw3twtTfjf+VNWlP8F0fg2t6BKvfsDgff3ivZ6S5ACUbslbel5H+ojx2nS46sg6Dq5atFQqJx
	JeRqj0ztxJfCN+BbCUAjFClGnBLRbq6Hqv1V9xZjlWM9OXtEbdXPruODgWG3Ei6P7JyClCLxuuF
	O04jC2Jr24XPrkBYSf/D
X-Received: by 2002:a05:6000:703:b0:486:e901:e59 with SMTP id ffacd0b85a97d-48867093c7bmr5013070f8f.31.1790174100524;
        Wed, 23 Sep 2026 07:35:00 -0700 (PDT)
Received: from KASONG-MC4 (11.pool90-167-203.static.orange.es. [90.167.203.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm7703114f8f.23.2026.09.23.07.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:34:59 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:34:54 +0200
From: Kairui Song <ryncsn@gmail.com>
To: Gregory Price <gourry@gourry.net>
Cc: Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arPhtkrM-khhmgnN@KASONG-MC4>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
 <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <CAMgjq7CJBHkoZmg9oKNgGA8czL0djyBTCAkPz8ETm-tX=Qci4g@mail.gmail.com>
 <arEotFqE7ZZoxMHd@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arEotFqE7ZZoxMHd@gourry-fedora-PF4VCD3F>

On Mon, Sep 21, 2026 at 09:27:01AM +0100, Gregory Price wrote:
> On Mon, Sep 21, 2026 at 12:01:18PM +0200, Kairui Song wrote:
> > > First of all, the traditional swap counter has a very well-defined
> > > meaning. It is the size of the memory that, when accessed, requires a
> > > page fault. A page fault adds significant latency to memory access
> > 
> > Yeah I agree on this. Swap just about makes resources not directly
> > accessible by the CPU act as RAM, whether that is storage on disk,
> > compressed memory, or a network resource, all accessed through a page
> > fault. I hope we won't make this fuzzy in the future by introducing
> > too many magics.
> 
> Hm.  The counters are already fuzzy - the accounting is already doing
> two different jobs.
> 
> Suppose we want to allow 24GB of logically swapped memory, backed by up
> to 8GB of compressed RAM at a 3:1 ratio, but permit only 4GB of physical
> swap.
> 
> Today we have:
>   memory.swap.max  = ?     /* logical memory requiring a fault */
>   memory.zswap.max = 8 GB  /* RAM consumed by compressed data */
> 
> If memory.swap.max is 4 GB, zswap stops after 4 GB of logical pages,
> despite consuming only 1.33GB of RAM.
> 
> If memory.swap.max is 24 GB, zswap may reach 8GB of memory consumption,
> but the cgroup may also consume up to 24GB of physical swap instead of
> the desired 4GB limit.

Hmm, I mean, this sound a limitation of the zswap.max and not swap.max,
swap.max is doing a prefect job here limiting the logically swapped
out memory.

> 
> memory.swap.max is simply overloaded - there is no way for us to express
> both limits.

Limitation of physical layer is some swap tiering issue I believe. We
don't have swap tiering at the moment, so we can't do that, right?

With tiering limit setting swap.max = 24G seems totally fine here.

> Could we preserve the existing swap semantics and add a physical swap
> counter instead?
> 
>   memory.swap.max  = 24GB  /* logical swapped memory */
>   memory.zswap.max =  8GB  /* compressed RAM limit */
>   memory.pswap.max =  4GB  /* physical storage limit */
> 
> These limits would be independent and compose naturally.
> 
> For a zswap-only workload where we care about RAM consumption but cannot
> predict the compression ratio:
> 
>   memory.swap.max  = max
>   memory.zswap.max = 8GB
>   memory.pswap.max = 0
> 
> For a workload that performs poorly after more than 7GB of its logical
> memory requires swap faults:
> 
>   memory.swap.max  = 7GB   /* workload-specific latency/SLO limit */
>   memory.zswap.max = 8GB   /* uniform compressed-RAM allowance */
>   memory.pswap.max = 0     /* zswap only */
> 
> In short:
> 
>   memory.swap   = logical swap       - workload/SLO limit
>   memory.pswap  = physical swap      - storage limit
>   memory.zswap  = compressed memory  - RAM limit
> 
> This would preserve the existing memory.swap semantics while allowing
> both backing resources to be constrained independently.

Yeah, this part seems better, but a pswap vs zswap still seems maybe
too specific for one single usage? Or too board to be over rided. :)
A actual tiering limit seems better to me.
