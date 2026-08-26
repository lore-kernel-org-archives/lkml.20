Received: from mta0.migadu.com (out-161.mta0.migadu.com [91.218.175.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAB922423A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750530; cv=none; b=iWUZrUU1UL+AYcSkS3t8qLjzWJSzNdk7HnXT+P8y8XMx+jw05YnKXRQbUibzLJBNNulYD8v2U1627CSBWR2Ec6XzLtPXDAnpJjKLINBjCLoGzN36idS3YSnCRBbNL2Oj5YXDRC1mq4ua6RDZAZPAtz2FmAHsw07Sni2vIExQ14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750530; c=relaxed/simple;
	bh=MbqC4/3XY2Q8MsrJW7NGpu6sTdEBe8KkMt4dCMJF8g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uhv+hNwxPZwac9tHjGwJtZEx8FaWQemhTPoNQ2zVPtK2tAPZU1qGem+zvdZO5CQW90qZT+w0p5qobbUWJAaIg6Fal4nnE/grwZpPFj5U9Gdrui9U0L2LgKHGaoMUJx6ZpQCAbOUiZbt3zMSTrZGBQo244tkVcbxiXbhgSC9v1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CVvqQQM1; arc=none smtp.client-ip=91.218.175.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CVvqQQM1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MbqC4/3XY2Q8MsrJW7NGpu6sTdEBe8KkMt4dCMJF8g4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787750526; v=1; x=1788355326;
 b=CVvqQQM184Jm75RDtC4a1OO4/F7nTy91v4NJKILsAAfjDf7M+JdN0EoD4RkwoK4jJsR6HVbO
 gy/aYQ9o+uksKAvOLOQ8kBPluU7m7BtlvRg/I2cuMJFO6W5nvjlC5c6fE8wMd05ep0I+a8cZzW0
 mbjh4aiJtP0Ixz0Bcde12QLU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (2a03:2880:10ff:19::)
	by mta10.migadu.com with ESMTPS id ee22d32ad11dbb84;
	Wed, 26 Aug 2026 13:22:06 +0000
X-Mizu-Trace-ID: ee22d32ad11dbb84
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Usama Arif <usama.arif@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/swap: move LRU insertion out of the swap cache allocator
Date: Wed, 26 Aug 2026 06:21:58 -0700
Message-ID: <20260826132159.433469-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825172604.3243589-2-alex@ghiti.fr>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 19:24:51 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:

> This is a preparatory patch.
> 
> __swap_cache_alloc_folio() adds the new folio to the LRU itself, which
> leaves its callers no way to act on the folio before it becomes visible
> to reclaim.  Two users need exactly that:
> 
>  - the next patch moves the refault evaluation out of the swap cache
>    folio allocation, and it has to happen before folio_add_lru(): that
>    consumes PG_active to file the folio on the inactive or the active
>    list, and under MGLRU it also reads PG_workingset to pick the
>    generation.  Setting either flag afterwards does not move the folio;
> 
>  - the upcoming zswap writeback dropbehind implementation needs the
>    buffer folio to stay off the LRU entirely, as the per-CPU LRU batch
>    would hold a reference on it and keep remove_mapping() from freeing
>    it once writeback completes.
> 

I think the kernel convention is to not say "next patch" and "upcoming.."

Especially as this patch is in 2 series, so you don't know where it will land.

> Defer the LRU insertion to the callers of __swap_cache_alloc_folio():
> each of them adds the folio right after the allocation, so there is no
> functional change intended.
> 
> Suggested-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>


The code change itself looks good to me, so once the commit message is fixed:
Acked-by: Usama Arif <usama.arif@linux.dev>
