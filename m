Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C77282F30
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787970207; cv=none; b=YnZJO+365A6B0y6VzTYnYiefHlzC9surmRTpPw9pbWt36qqXTH1lt0JgAS+nfU3k8E1Q6j+j4o7snUPFLw6CvYzm+K2DaOc4F7C90gOzk6vERsqBzpY2uUjElm+0rQTudFihkSr6rBoniZPH6HGE8rkpJhfzAWV3bDI/tQFdUh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787970207; c=relaxed/simple;
	bh=9dpmGVCTK6YIdLHcSKf21OYzQ3WaSDmWbAA1Hj8B9Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cutZlvKDgsc5/NCH6MuO8QqtDMQ8DFo2QbTtLkMpbWLxh+vTb+3bqt/y/5XOwynE2J53fj4zL/6gxsxVT8KzEUJH5Cyi22HLJZ7Z10qJCMUty0K7Rdm7B8EQ83K9kZfN9cD75ILj/F0rqLVv2IwI8Dy/nkN1bV8+T9fLHAMWC/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BJB2b2UL; arc=none smtp.client-ip=95.215.58.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BJB2b2UL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9dpmGVCTK6YIdLHcSKf21OYzQ3WaSDmWbAA1Hj8B9Aw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787970201; v=1; x=1788575001;
 b=BJB2b2ULznAVmp1DP0FBgu/aMBBbQLjTBZ9MctHHmOjry8gZNls4HyFKlXx+r2gJKN67GTRw
 FSbskbvGJNKp8MRRTYpWMas251B9NOecy8deGS1PMb6n86GzFFjteGr1GjTqBCvn7lBeuezNaoz
 8TCSqOZlswsD2pjHAexik4Tw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 167889d1c3b5653f;
	Sat, 29 Aug 2026 02:23:21 +0000
X-Mizu-Trace-ID: 167889d1c3b5653f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 28 Aug 2026 19:23:19 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Meta kernel team <kernel-team@meta.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-7.4 0/9] memcg: remove the v1 soft limit
Message-ID: <apJCb-8RK0azF8_h@linux.dev>
References: <20260811203203.3456029-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811203203.3456029-1-shakeel.butt@linux.dev>

On Tue, Aug 11, 2026 at 01:31:54PM -0700, Shakeel Butt wrote:
> Syzbot reported [1] a set_mm_walk() warning from kswapd. Soft limit
> reclaim is the only thing that runs shrink_lruvec() from kswapd with a
> target memcg set, and thus the only way kswapd can reach
> lru_gen_shrink_lruvec() and in turn set_mm_walk(). The offender,
> mem_cgroup_shrink_node(), has long carried a "Only used by soft limit
> reclaim. Do not reuse for anything else." comment and a priority hack,
> and it simply never got taught about MGLRU.
> 
> Rather than teach it, let's delete it. The v1 soft limit was deprecated
> in v6.12 by commit 569c4f62d84a ("memcg: initiate deprecation of v1
> soft limit"). Nobody has reported depending on it in the ~21 months
> since, and v2 has covered the same ground for a long time with
> memory.low and memory.min.
> 
> Link: https://lore.kernel.org/all/6a7a6929.b50370da.49fe0.005e.GAE@google.com/ [1]

Andrew, should I resend this series (without the first patch) or will you pick
it up?

> 
> Shakeel Butt (9):
>   memcg: make the v1 soft limit knob inert
>   memcg: remove v1 soft limit reclaim
>   memcg: remove mem_cgroup_shrink_node()
>   memcg: remove the soft limit reclaim tracepoints
>   memcg: remove the soft limit rbtree
>   memcg: remove lru_gen_soft_reclaim()
>   memcg: remove the per-node soft limit tree fields
>   memcg: remove mem_cgroup->soft_limit
>   memcg: simplify v1 event ratelimiting
> 
>  .../admin-guide/cgroup-v1/memory.rst          |  49 +-
>  include/linux/memcontrol.h                    |  27 --
>  include/linux/mmzone.h                        |  30 +-
>  include/trace/events/vmscan.h                 |  14 -
>  mm/internal.h                                 |   4 -
>  mm/memcontrol-v1.c                            | 435 ++----------------
>  mm/memcontrol-v1.h                            |  12 +-
>  mm/memcontrol.c                               |   7 +-
>  mm/vmscan.c                                   |  96 +---
>  9 files changed, 66 insertions(+), 608 deletions(-)
> 
> -- 
> 2.53.0-Meta
> 
