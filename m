Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612388;
	b=EAmN8wwO4li1ieCB8OoaxmkQ3gBhOhkLD3tgvCRmgPXY/y9YmELqtgijGzZwtyuzFG90
	 6P7gliMVbOutHErMArKz6OrttkKbTVegeb8rTz1wSoJQ4+tz6cWhtpKeNI42Q5ynYgA9O
	 K5QkyMq5s38p55dtkEEhLshaUi8aM4ARMJJt4mGAfTHnm7JM/Pe+ZEc1Ou2OzNejxtBl7
	 DwhKvOYs31alSPKoGu3wyxldN88gPBT4JJK1Z6WUG4EHFERNbiBR5wxS8sf58C25FSueD
	 bmPbDS1epJsTadIXOxzhgA+UZ1axK5qPWRvtQm1ADMrTP2NrGFcfsDD2qwlTXkX59kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612388;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Au4Oi0MWceZmpJKV/fPCRNAL50XGi5ZE7tYwaKOfapM=;
	b=lxFmCEaLolCVYLcx/vEfq+nwCs8oFcM8fJfTCl6uZ2/ueMm0Y2LsvhWn7k9xbttm9y5R
	 xXLoKvut9a87ly0jxF/MtFl+be0Q/xxNp1hebHbP0WBeionol0LKwZZyshzimN/Y/qvcB
	 OnV3nu4zrwJWLhk2jcgB+kHMJvGJSCM6oKshQ0WkAh9rzpZ14xYcFPiPl1NC/kZelhY4Z
	 Rum1ZluEB3vum6aKrIjReD+EMA5CE7YphIy1zO0oWMnRmoeV/jndf4JDMk3oL1PUSIDyQ
	 AQnSDcfqacIadjECiP98GpVEb8yH5C6p0kMmGDJBd1cu2ipE64r96BYBznApzSJW2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7oSp3v9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41885606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7oSp3v9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82851F00919;
	Mon,  2 Nov 2026 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612388;
	bh=Au4Oi0MWceZmpJKV/fPCRNAL50XGi5ZE7tYwaKOfapM=;
	h=From:To:Cc:Subject:Date;
	b=k7oSp3v9Fos5Z4miGPDrC/wv1d1MnZFnxzpA7s6wtL9+68JlzEo9TCJG7j7nQyQAf
	 MNTeN0DZtdf067oBOHSfaXnrKtNVzR1BTWd2RUjd4JCrQup6xU/SRax7OPMo2kOhsN
	 v7Eqdhwk8rO0F0B6WzV+As5+CVkIy+khxXwVbanavoHdIw51M/GLBrXLL7EofECsMA
	 EP8HcibKkM+mn2bIF3BCvton1IOpHOY2rqbl8MDzoKqoBbEfB0D/KOTtROANb6uQPl
	 9ik3uBCUTuzLD+bAn/Sf3G35e5mQsKxLNhG1mkq7Brni4jjksnht2eCFSXQMgRIaNR
	 3pfusIE7IMd0w==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0B494198004A;
	Mon,  2 Nov 2026 04:39:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Nov 2026 04:39:45 -0500
X-ME-Sender: <xms:XlroakDI_7O5jyH8JQCM-udFw2VPaxLG4NbntEt5nqSuBmLOdTh2ng>
    <xme:Xlroanl6gnTX0opeotuZ6y9-5VLH80cyVSNl6v1xzIv7LZLqMcPPdCRU17bcENO88
    eKQT_xMJTxDDmZcQkXSj9uq4KsJV0o0PLdR_08g78PR5bdftPlAOLXqlg>
X-ME-Received: <xmr:XlroaqiwquFLkb6lJTBqpXjiPJRjx7gO23AeV5QvjZuY7eJ-Ir2mkhJdH9I>
X-ME-Proxy-Cause: dmFkZTEhRarKBtCberBUjce/isjK9PfXutCTgFrSk65KJKrexvZPW1kHnXgqWxfsL477VB
    0B+PUPaT0e2V6Y1aPEXZVpEDk/+XK3MUho/889EWBmq9dmu8CIuWdZ8d3PoRSIBwOZdAl6
    FAQq6B3QTX2w0id03oZqWxDy7lBwXWKlG1aBfgfczDUssKofptZoug1l1tH0rTdJNE0frn
    8/dZfLluhMvsLe5R9E7RvpG6I6eP9Jlue9NB4farYB7LcaiXDNz/+vZ0sD6utgRIgufl9D
    aC7zZ2u4lnQRU5sqAqppO5dRDB2cw4bonYD/UqVTA3uyFtqvBsNQom54gAR5K0bW51m3no
    63Ee2F1tTcQBxaWwuBEAKR+cyi9JGCdUEVzz9GRGGU6gqw6hSklUQKltbix/cfAnapKVJy
    h+8dGc2ZbZdCwOaOBC0SiXE1Neo/HvfeXXxYlKitadtOszma/yeufwYv1+o1gF1nQKwFgQ
    zNcCXeUFHI72AjTwQF4Q4H1HYvBmUwmAZatgsY4Z7iRl60qtztd1PUTyHWv93mWerhhdEM
    bXi49E/GP6KLTpWxooA7iENbIjIe30PdDHpSpzlgAwyBoU6jNs+AkHwz1edXfPvOIdivLz
    Cxae+nqP7Ddo5G7GF2+yqaSWHNskBw7Ks5nJNbPqpVi8A/wX25r0ZabgrirQ
X-ME-Proxy: <xmx:XlroaodtHk7aGcKr_YzseEk-PrDx4lmjEF7M0d_2UedQdUlm_uB0Ag>
    <xmx:XlroaiCoIMLIUN064fo2I8hdYC-r7t166mVaDBxD3rvaw5K6s6GJLA>
    <xmx:Xlroak7uuCaYPSVTKIy6m7h1KUTYf4zBfTLTViUcXPJu4Ff68nSZ3w>
    <xmx:XlroanzjgyF3US9HUYxyo3oi4xHL-N7EWnRe0OEnGbBVuEtbPdCSJg>
    <xmx:Xlroaol1N_NYgwFjW88m8VTXlU-xqzSiRp3m0z1UUG6nujWOGoQJI290>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 04:39:41 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Dev Jain <dev.jain@arm.com>,
	Harry Yoo <harry@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 0/3] mm: make watermark checks honour ALLOC_NOFRAGMENT
Date: Mon,  2 Nov 2026 09:39:33 +0000
Message-ID: <20261102093939.3340540-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With defrag_mode, 64K mTHP faults under memory pressure stall in
compaction 18 times as often as without it, and get about a third of the
folios.  Dev Jain reported it [1].

The high-order watermark check counts free pages of every migratetype.
With defrag_mode, every slowpath allocation is ALLOC_NOFRAGMENT, and a
request below pageblock_order cannot take free pages from another
migratetype's pageblock.  Under pressure, that is where the large free
pages end up.  Two callers act on the wrong answer:

  - direct compaction's up-front check returns COMPACT_SUCCESS without
    compacting, so compaction is never deferred;
  - direct reclaim for a costly order stops early, having freed little.

Patches 1-2 give the check the request's migratetype and make it skip
the free lists the request cannot take.  Patch 3 tells direct reclaim
that the allocation is ALLOC_NOFRAGMENT.

Dev's benchmark in a 7G VM with only 64K mTHP enabled, medians of 15
runs:

                              defrag_mode=0  defrag_mode=1  defrag_mode=1
                                                            + series
    compact_stall                      1690          30669          7366
    64K faults allocated              20750           7391         20129
    64K faults falling back to 4K       725          13832          1339

defrag_mode=1 still compacts more than defrag_mode=0: by design, it
keeps 64K faults out of unmovable and reclaimable pageblocks [2].
defrag_mode=0 is unchanged: 20698 64K faults allocated with the series.

v2:
 - Patch 2 changelog: describe what the fast path change does to pages
   on the per-cpu lists (Andrew); drop the should_reclaim_retry()
   paragraph
 - Patch 3 changelog: say that the benchmark baseline already has the
   high-order check honouring ALLOC_NOFRAGMENT (Andrew)
 - Rebased onto v7.4-rc1

v1: https://lore.kernel.org/all/20261028132638.2560361-1-kirill@shutemov.name/

[1] https://lore.kernel.org/all/4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com/
[2] https://lore.kernel.org/all/auCDnqJc7fsBpUW2@thinkstation/


Kiryl Shutsemau (Meta) (3):
  mm: page_alloc: add a watermark check that knows the migratetype
  mm: page_alloc: make the high-order watermark check honour
    ALLOC_NOFRAGMENT
  mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT

 include/linux/mmzone.h |  3 --
 mm/compaction.c        | 16 +++++++----
 mm/internal.h          | 10 ++++++-
 mm/page_alloc.c        | 64 +++++++++++++++++++++++++++++++++---------
 mm/vmscan.c            | 24 ++++++++++++----
 5 files changed, 89 insertions(+), 28 deletions(-)

Range-diff against v1:
1:  c630170105ac = 1:  ed3ef9f9fd13 mm: page_alloc: add a watermark check that knows the migratetype
2:  918bed282fed ! 2:  3347b0a24b0e mm: page_alloc: make the high-order watermark check honour ALLOC_NOFRAGMENT
    @@ Commit message
         __compact_finished() the same rule for its fallback test, so that
         compaction, once it runs, stops on a page the request can take.
     
    -    The allocator fast path gets the same answer.  A zone whose large free
    -    pages all belong to other migratetypes now fails the watermark check,
    -    where before rmqueue failed, and the allocator moves on to the next zone.
    -
    -    should_reclaim_retry() keeps counting free pages of every migratetype.
    -    It does not ask whether the allocation can be served now, but whether
    -    reclaim and compaction can still make progress, and they work across
    -    migratetypes to free a whole pageblock the allocation can claim.
    +    zone_watermark_fast() calls __zone_watermark_ok_mt() too.  With
    +    defrag_mode, an allocation now wakes kswapd and starts reclaim or
    +    compaction as soon as the free lists hold nothing it can take.  For the
    +    orders the per-cpu lists serve, that is earlier than before: the check
    +    does not count their pages, so the allocation no longer uses up the local
    +    list first.  A request that may not wake kswapd or reclaim, such as an
    +    mTHP fault with THP defrag=never, falls back to a smaller folio instead.
     
         Fixes: e3aa7df331bc ("mm: page_alloc: defrag_mode")
         Reported-by: Dev Jain <dev.jain@arm.com>
3:  a7ebde665647 ! 3:  0ecbcc5f5fb0 mm: vmscan: tell direct reclaim the allocation is ALLOC_NOFRAGMENT
    @@ Commit message
         and cannot take the free pages left in unmovable and reclaimable
         pageblocks.  Reclaim stops on them anyway, having freed little.
     
    -    In Dev Jain's 64K mTHP benchmark, an order-4 direct reclaim frees 16
    +    In Dev Jain's 64K mTHP benchmark, with the high-order watermark check
    +    already honouring ALLOC_NOFRAGMENT, an order-4 direct reclaim frees 16
         pages on average with defrag_mode and 45 without.  64K faults get a bit
         over half as many folios as without defrag_mode (medians of 15 runs):
     

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

