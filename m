Received: from mta1.migadu.com (out-214.mta1.migadu.com [95.215.58.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA113A5430
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788237496; cv=none; b=nfu0+SydLHpElRXVIU+xZBzWvs9j225ql3jIpK1WNtZtl1zQswDcQXELn8YPFlNGxhvCJzCMxAKANTNFfsCZAfw2Eo35QZjok80wV9lZ9xIbomqah7i13U2s23Vxkaw5bkloc2ChXYDjBax4w4rZRfkeY5UFHqbABIRjjC8RDNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788237496; c=relaxed/simple;
	bh=TJG98YKiXILgUM5yXGikDrQSHVcylHnt0O0nBzmY7eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLnQk/k6CRZQ0RVE4wsl+OmYQ3xG11ZjlJ18EMK6eAZFBMWpRadqTPDu9dUAeTCfRk6eXSIkKz3SSO/f3VY56EYwd+HxwARLqpfWsWfUcWElo4le4I28tjecj9YzNiKp3Wk5Re92SiK9WI6eILijFw9NTcaoPmycjpqOvLqpcio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kLD7F0a0; arc=none smtp.client-ip=95.215.58.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kLD7F0a0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TJG98YKiXILgUM5yXGikDrQSHVcylHnt0O0nBzmY7eQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788237491; v=1; x=1788842291;
 b=kLD7F0a0QGTb7I+CbdUUzo4q9cGsV7xb3XktvjRyCsc71MdWym+MmWs95MAAqj9JidlMxWoZ
 DqR8KvBhbBkYDwX8ufxhK9LMp+29++KE8ZtmVZpF2z/EVAVSQ2b++aEWZDvJF3QApthaQWdD6zL
 jIbArI6/TSxEf896kNoCLU+o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8dd80eb52778aac0;
	Tue, 01 Sep 2026 04:38:11 +0000
X-Mizu-Trace-ID: 8dd80eb52778aac0
X-Migadu-Flow: FLOW_OUT
Date: Mon, 31 Aug 2026 21:38:09 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Ridong Chen <ridong.chen@linux.dev>, Lian Wang <lianux.mm@gmail.com>, Yu Zhao <yuzhao@google.com>, 
	Zi Yan <ziy@nvidia.com>, Qi Zheng <qi.zheng@linux.dev>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v4 1/6] mm/memcontrol: make lru_zone_size atomic and
 simplify sanity check
Message-ID: <apZVe8UHZ1CNo4r1@linux.dev>
References: <20260831-mglru-flags-cleanup-v4-0-2d15dde0d7ee@tencent.com>
 <20260831-mglru-flags-cleanup-v4-1-2d15dde0d7ee@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-mglru-flags-cleanup-v4-1-2d15dde0d7ee@tencent.com>

On Mon, Aug 31, 2026 at 02:43:31AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> commit ca707239e8a7 ("mm: update_lru_size warn and reset bad lru_size")
> introduced a sanity check to catch memcg counter underflow, which was
> more of a workaround for another bug: lru_zone_size is unsigned, so
> underflow wraps it around and returns an enormously large number, then
> the memcg shrinker loops almost forever as the calculated number of
> folios to shrink is huge. That commit also checked if a zero value
> matches the empty LRU list, so we have to hold the LRU lock, and
> handle the positive and negative deltas separately.
> 
> But later commit b4536f0c829c ("mm, memcg: fix the active list aging
> for lowmem requests when memcg is enabled") already removed the LRU
> emptiness check, so handling the deltas separately is no longer
> needed. And if we just turn it into an atomic long, underflow isn't a
> big issue either,

Why atomic long and not just long?

> and can be checked at the reader side, which is
> called much less frequently than the updater.
> 
> So let's turn the counter into an atomic long and check at the reader
> side instead, which has a smaller overhead. The underflow correction
> is removed: a massive leak of the LRU size counter would indicate
> that something else has gone very wrong, and one should fix that
> leaking site instead. Besides, the updater-side sanity check is
> unlikely to catch the leaking site anyway: if a folio was removed
> without updating the counter while other folios remain on the LRU,
> the WARN only triggers much later, from a likely innocent callsite.

Do you have any data to support your claim that updater-side sanity check is not
that useful? Also can you explain the motivation to move the check from the
update side to reader side?

