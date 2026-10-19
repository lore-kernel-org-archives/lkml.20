Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6D34503EF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388309; cv=none; b=HMrp4/Zwl+R102DnCjQQ7kQjWL7k7p6kjdqfomLVg0PjX0c4vUL3HzX7vFCjvnNmYfcbmRaJiuLotzVLsxSVg8Z/WqbzmiLDBCpb5GTW5BdokmVfvYGnCNWmDPboldOGBw5cxpbTmRras8uNLM2v3p5LYRe3iZRHinhgERUsNR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388309; c=relaxed/simple;
	bh=5E31hXFLn3ZF06DDXoSyDVQz+JRrW2LFsdTv2H+nT0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFgA+Wn3++dbQLlhkha3ZnrGdCaPStzlmkPiH6nckOCgsxaKw5FL8XOmlGnGvqkBFY2VCwk0lO6Xu98riQox8yUEHRki8pTmUqjN4PcgnzfiCI5bhIA1mbyqAr8MZxk6eXawz4SGrZQTNv1MySoLR1hnth1+JsvEhZ9ovQ+EmAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o0+2Mzj6; arc=none smtp.client-ip=91.218.175.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o0+2Mzj6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5E31hXFLn3ZF06DDXoSyDVQz+JRrW2LFsdTv2H+nT0Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792388302; v=1; x=1792993102;
 b=o0+2Mzj6jR0sh8s3vW7/WMOS+4ddEI1CG0esQegFfd+dTIU9fhM3WSi7/9cmzQVXxfTfcmKl
 7K7iK3fwddNVUUr0q+3wWfH22v2i1e2dXjZdHKqfqKRC2dO1N4/MY/lyXCIxQSTM3LyQO6zSqeP
 UQaJWfiLfOZ6Jb4E0dLGY8C4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a20ba9f3511e7662;
	Mon, 19 Oct 2026 05:38:22 +0000
X-Mizu-Trace-ID: a20ba9f3511e7662
X-Migadu-Flow: FLOW_OUT
Message-ID: <19d5b7cc-782f-44b1-8ec9-a1764484f10f@linux.dev>
Date: Mon, 19 Oct 2026 13:38:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: unqueue deferred split folios outside the lruvec
 lock
Content-Language: en-US
To: Joanne Koong <joannelkoong@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20261017004555.2890038-1-joannelkoong@gmail.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20261017004555.2890038-1-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/10/17 08:45, Joanne Koong wrote:
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
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
> This patch came out of a discussion about splitting underused mTHP folios [1],
> where queueing small mTHP folios on the deferred split list was found to
> regress Barry's fault microbenchmark. The cost turned out to be the unqueue
> running under the lruvec lock rather than contention on the deferred split
> queue itself. Testing this patch on top of the series in [1] with the same
> microbenchmark, queueing every 16k folio went from a 15% runtime cost to
> noise, with lruvec lock wait dropping from 491 seconds to 38 seconds (most of
> that contention then moves to the deferred split list_lru lock, but runtime
> still drops back to the unqueued baseline).

Looks great :) Could you also keep the benchmark results above the '---'?
They'd be useful to have in the changelog, along with the test setup.

With that, LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
