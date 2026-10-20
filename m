Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455368;
	b=cqz7NQG8faqj2ZPcyhqibyxmFkq0mz8Tq3xLquLwUzKtAIYqjXwoBbnLxwZNQSI8XleL
	 DZTiKaBOYZWcypxx20Om8TUZq0J1VIAFi+0Ct7n081/2+EA9PB5HWMsG27F7VGHaFG/Lc
	 iWNu0EOvTrlnSRpIhIOWja/sUmrw/NT0y7ENnl1E0Gix7Soqm3zr7RwXJC5xLnyGyy0o2
	 Yi2NQI8cxDCEL1UFnQDT/9uCSEmqwutHymyoGWapi6kuNzC/dCeo5RJ08hoOnFnuVEuHR
	 62pA/4ClVhF6Z2q7719bGZE/x3W07rLu5EgF/KM1mZHIJefPX6ph721A3VZA0hdn6sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455368;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yxOiEWJaqgHkBMG09/cBx6s6uMUt/RNcnnUvvQy8OME=;
	b=nfvL0MCyDRvck3JUCXPkGV0Hcrn37pVMNg0C8YpqolLpwuvnUi/5yvC/MYwGiBeCpPH8
	 6Lq6zchhlHxG1Kycr6a9u6fDMrfPbQOFb9mFOu6kPpReKmPJFIssmeuLLHQ52Nq1VSKgL
	 P4Zi25U+ov8s784/nLJzhTA6monRsCWgeQDOLQ/T4OKtNl8TXwCDR0UFeoo7MLJueNhh1
	 PfoHQg9xl26WilKBZtTeieO+tZOOEOd3S9AIAl0S36D5HgJRXu+E/wz0Pou93AtqzYqc9
	 ALBAJO1ijyfoeNi4WiBWS7O1W9K6F8NYE8iTJYNHOcROWm8eNjC/qjScV+YqlehG4Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aO1PTJnF;
	arc=none smtp.remote-ip=95.215.58.213
Received: from mta1.migadu.com (out-213.mta1.migadu.com [95.215.58.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F9A606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F9A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aO1PTJnF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OQ7b2P4cSAuJuKX0jJ7hkWkBRiURgUV5lBZ7lUJp3tU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792455365; v=1; x=1793060165;
 b=aO1PTJnFC/zOnFbBnFSA3AZyCjoUOOJO6Yw7JLGEhdrDKpq63xT3B64JaPfoy6uME4Nv+bXD
 Idg9nPxQNIxdUS0SG85waup2xWQSUhqMJwTw1+MnDGeF/VZDxUHACPAyfapGjyn3WIpQSDcTs6g
 kfzQCIl4/9HN7ITZlFZOAm8I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57b2788d4b87db0d;
	Tue, 20 Oct 2026 00:16:05 +0000
X-Mizu-Trace-ID: 57b2788d4b87db0d
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 17:16:00 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Barry Song <baohua@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v3] mm: unqueue deferred split folios outside the lruvec
 lock
Message-ID: <ataymsNET7AV6qT1@linux.dev>
References: <20261019230646.3510790-1-joannelkoong@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019230646.3510790-1-joannelkoong@gmail.com>

On Mon, Oct 19, 2026 at 04:06:46PM -0700, Joanne Koong wrote:
> move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() call
> folio_unqueue_deferred_split() on folios where the refcount has dropped
> to zero. In these paths, folio_unqueue_deferred_split() is called with
> the lruvec lock often held (move_folios_to_lru() always holds it and
> folio_batch_move_lru()/folios_put_refs() usually hold it for every folio
> in the batch except the first). However, it's not needed to hold the
> lruvec lock.
> 
> The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> the deferred split queue lives on folio->_deferred_list in
> deferred_split_lru. The deferred_split_lru is a list_lru with its own
> per-memcg per-node lock.
> 
> There are already other existing callers that call
> folio_unqueue_deferred_split() without holding the lruvec lock (eg
> __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
> 
> Add folio_batch_unqueue_deferred_split() and use it in
> move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
> unqueue each batch of zero-refcount folios from the deferred split list
> after the lruvec lock is released and before
> mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> critical sections, which run with IRQs disabled and are highly
> contended.
> 
> This came out of the discussion on v2 of the mTHP shrinker series [1],
> where queueing small mTHP folios on the deferred split queue was found
> to regress Barry's fault microbenchmark. With [1] applied and
> khugepaged/max_ptes_none=0 so that every folio is queued, perf lock
> contention showed that the extra cost came from waiting on the lruvec
> lock in the free path.
> 
> Test setup: 2-socket Intel Skylake, 40 cores / 80 threads, memory bound
> to node 0 so that all threads contend on one lruvec, with each of 80
> threads faulting in and unmapping 16 MB of anonymous memory 200 times.
> With only 16K mTHP enabled, this patch reduces the queueing cost from
> 15% runtime to noise, and lruvec lock wait time (summed across threads)
> drops from 491 seconds to 38 seconds. Most of the remaining contention
> moves to the deferred split list_lru lock, but runtime still drops back
> to the unqueued baseline. This test uses a worst-case configuration ([1]
> is expected to only queue folios of 2M and larger).
> 
> [1] https://lore.kernel.org/linux-mm/CAJnrk1a2PpUGTsCgS7jct2KET4K2zAL+_h+te8G1MaU9bXs99w@mail.gmail.com/
> 
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
