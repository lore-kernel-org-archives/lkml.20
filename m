Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553851;
	b=qETq+8kXSUGvUaXc5r3mz6ELiGk/SLQYehu9Un7siT8TlAKpRmVXhe9shXV0+AikDiw8
	 nVxkzrZT4UQ978/rNANyJ7m7B5YVe9JokpLNRGp7EofygCDmJ3VSKiBnbkg/LG3uEptz5
	 C734V2WILKl+QpKSOFObNE832glztzfmzVLzqjDCaQtuEyz1I6wwCX2J7zM/h290xzlXu
	 GhPKWnhQuIW+uLbny8Tr5d/ocXjvaTdoSZdDxTsS+zeYc92rFRVJx92BTtrIplDNo39u0
	 s5b1ucvSWrRm7ATSILP+KH7IdbKSWrLknHYw/BQwLCsyO9fjtshHSPpUW5tScUnEn7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553851;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JlRmug8M8jL+izLY5CnmCZpoNqlaHo91H3D4D0KORIQ=;
	b=w2h98i4Od6LSGTNM+6pMdxVy9xOqKTDibcqP+tRLbzVNqQ1uKBF1yMoK23OxOl2pckZh
	 tmmuXuhoYfRGZq56TwKTgeDDIODH5hTMtAkEPqexA5qD1lSEUEn9krfNsYQ4u5HBGBwm2
	 7yyp7xtCsFYWA8h0rtTqTS4E7mlanlMhDlr7mBNh8PtH3rNXxW1H+30/u0ke8sAFsj6OC
	 ddWCwn/prQrEJ6897EsMbb48bO+gY9sJayONW0sl020KE6w8ZMK+DNquFMw5e7oknN4SP
	 5luopT2le/n6zSH2lE3gRsldxx0ne9d7VeenuVWYPJiaX6adDSfU8rb4AS4s7+yEfzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=v6knzeLY;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F6606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36F6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=v6knzeLY
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792553847; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JlRmug8M8jL+izLY5CnmCZpoNqlaHo91H3D4D0KORIQ=;
	b=v6knzeLYhoOevSDZafqomGZAQJhuVioZPMPBmQhWfnxT+mb0lqAWtUdngvb9WgTWK3lEe6levZoQX2bLAn22k9yDJTNCPuCZ5ectuCxMy+QWAEXmQXEqH5X02P/Lp5dOe8+UDcx7D2WU+DRMxA8rAVtST1fp8C7kak64HBKP/jw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R811e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XDFBTxn_1792553844;
Received: from 30.74.144.135(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDFBTxn_1792553844 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 21 Oct 2026 11:37:25 +0800
Message-ID: <0d0e6e7a-eb2f-4435-9be8-0c82d39b4cb1@linux.alibaba.com>
Date: Wed, 21 Oct 2026 11:37:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm: unqueue deferred split folios outside the lruvec
 lock
To: Joanne Koong <joannelkoong@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, Lance Yang <lance.yang@linux.dev>,
 Hugh Dickins <hughd@google.com>
References: <20261019230646.3510790-1-joannelkoong@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261019230646.3510790-1-joannelkoong@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:06 AM, Joanne Koong wrote:
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
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
