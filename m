Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1166233949
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487702; cv=none; b=VvjeXas+MVcS4wuRS2o+OwE9QEVoNTH88XrpM3DeBlyDCae8ps7UpATjKTJzEaP+K/f1ioB5a2gWrX9Loi2aji8BTydLE/4QOcx3Sp1SU3SZG3h1L9+mPslym8PUy7EJ5grS+pxg6Jgwe5FLYVT3r0m7T6Ha1nxbB3H84efd15c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487702; c=relaxed/simple;
	bh=2NlZnuayVM4v/82tyMrXP5whnRgkRRV5PNyh6IVCqZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m0szt2UmTnMctb3sbSDdRfvv9u7KQf3thfazpAgj73/1bOO1mzO1GAnmPg0RsHdpCFE2lzG9QZ0BkRcFbBqJ12WgnjTf+uAq8TCdPNqmiAlz72S+i3ReuyS4qmW6zWH7sAJZgIZRqV8ACDAlSmmevATSmOqLdOMBpFmR3Sc9ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsk9+1/0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsk9+1/0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso5337465ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788487700; x=1789092500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8Sx88G1D3cLQBFH9yUavJPElbl9q9H57N/owGoAbjE=;
        b=lsk9+1/0EI6RO2AnMgoS6LLPqn6YEVw9WUKfLCb3diSyMLDEWrcFDzEGgj+wgsu18b
         fBTQUXFnkIZwJ9+4dx+g1w6udjv5hdcZbd70BskrQi4+AsI6U09yf73ufKwNyODhB5wt
         ZkVcoB0xiU+eMAx4OJVjEC5sJIVYSD40a9BJLXJ0jH5xph4Ip/9lRVhFvMJJdBZ4K19R
         0CAl5Vl3IuC/yn4ebFEnRE5EToOIu3d7gt22bcMvlH7CydQ2CFXaJH/rzZNrfDgPH+eI
         2mIgEf/6acA86MJofu1qoswTfZ6JiAXYPSqNvnRUqdbh/V6sFWNJ3evuLoXpJ/QOgVQ0
         IIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788487700; x=1789092500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8Sx88G1D3cLQBFH9yUavJPElbl9q9H57N/owGoAbjE=;
        b=OfgB/DdFjRA3mFDHTwhhFFMRT2qDUx1OtUacQ9bbRrJk+4VduX82ma6rml/AvZrqPO
         ifRD7YutILOzsmfjJtCNAKvOfxXQ6QJ4JGzxBuWxps4I7ysffHYpAXrCECu/bNTosza9
         AIVwCNOm0ym3rkzm+yylJwGAFv/aGTiyWIGxSjj2l7Sr57j7476GzDEl4mXoL6vqG4t6
         FnlqrBTuYaqHTkPcsnUL+e6O6skGLCXsh0k08TrPP/th5K0eBrpsnK/OS5nc9SpFpo50
         8WHJT+EQSdnNCZrtAoIQpA8PF02YxUE1JVDutE7/SwaZOu7NMijZv0JBRaqQtS4Umxxr
         YG9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzc/28l/7lMbobBf6cymwuHrx12GCgfVTToT6YTPg1gSa9mmGHZgvrXgwrkzIVOD0xyjdFgPl3hkssCFJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++lcLswAAGLUtkOPCxChTM5AyMhLjVbKLg2zU82xnVzwgZaDNwVN
	isjCS+c3gDtTHwxcd6v805FHg9MgkMoNLtShAbisnoSgwYx8VQ4OUP2T
X-Gm-Gg: AYBFou2JGfsUYCNXuQhCs5G2RXrXrxVagfETg+6ghdn3ORn0EU/eF/TvmnCHt+u79GF
	sdW6CBkyqvrVSdqmVjZ5re1SeuJhNVZ4nm1KVB8pBP38iQGBlYll5HtLTTqD/800tvfHUGODVxr
	h/dUpmJ8MP/Y8voNtJOvGQHZ45w1CSZjjhTgMs9EakNPtJTXftFnjAJwKzkaLplZ0AXaREThpwN
	9dGlWSqbn3zm+hRiUQ8kPq0+yIORlJmg1QJnMIWmhhwC7O4YppQOOinT/RbKVn+Prhhnp0OvjJF
	DXX/Sjpqsp3ahKDWYzgXgnn4Ek4PSIrJjynb5FXE+GF2SknL5gzVkrwe3ovjS7Nu9jyEQENknQQ
	7l7d7bLLl5/og/Hrkpi7oaQ7aUtDwXVLplmT3uucL9crtT969VoJxz0VA/TUhScgNGLWUSxC7QQ
	CJcHqgEmz+C3kHeS105ADxFuWc6Dy281YQ5sFmMfllJIIVQxZ9aFdWnDmi7c4EPaH3hyVCSoZXL
	odWnA==
X-Received: by 2002:a17:903:faf:b0:2d6:ef11:1773 with SMTP id d9443c01a7336-2db159c66bdmr16943145ad.8.1788487700136;
        Thu, 03 Sep 2026 19:08:20 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497f3e0sm3022005ad.44.2026.09.03.19.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:08:19 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: hannes@cmpxchg.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
Date: Fri,  4 Sep 2026 10:07:56 +0800
Message-Id: <20260904020756.4163139-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903130304.GQ3004@cmpxchg.org>
References: <20260903130304.GQ3004@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 03, 2026 at 09:03:04AM -0400, Johannes Weiner wrote:
> On Thu, Sep 03, 2026 at 12:01:31PM +0800, Bo Zhang wrote:
> > We have observed some cases where memory is allocated with GFP_NOIO, so
> > we cannot reclaim any anon folios unless they are in swapcache. We can
> > end up spending more than 150 ms looping in `shrink_folio_list()` scanning
> > non-swapcache folios without reclaiming a single folio. This is pure
> > overhead.
>
> Not entirely. There is some value in aging anon alongside file, so
> that the next __GFP_IO reclaimer doesn't look at a stale list.

You're right, "pure overhead" was too strong - aging anon does have
value for a later __GFP_IO reclaimer, and I don't intend to skip it in
general. Let me describe the case in full, because the reclaim cycle
itself already provides that aging on a later pass, which is what makes
me think the trade-off here leans the other way.

> Can you describe a bit more about what you observed? What workload is
> running, maybe you have a stack trace of which NOIO requests are
> routinely getting stuck in reclaim?

The workload is app launching on Android. The NOIO allocations come from
dm-verity hash-block reads via dm-bufio, which legitimately use GFP_NOIO
because they run underneath the IO path:

  worker_thread
   process_scheduled_works
    verity_work
     verity_verify_io
      verity_hash_for_block
       verity_verify_level
        dm_bufio_read_with_ioprio
         new_read
          __bufio_new
           alloc_buffer
            gfp_mask: GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN

So the NOIO use itself is correct; the problem is on the reclaim side.

Here is the full picture of one such direct reclaim. It runs two rounds
of do_try_to_free_pages(); the target is 32 folios.

Round 1 - partial (shared) memcg walk, 169.20 ms, 0 folios reclaimed
--------------------------------------------------------------------
  prio 12->1 (~1.3 ms):
    cache_trim_mode is on, so get_scan_count() picks SCAN_FILE. Only the
    file side is scanned. Because this is a shared/partial walk, each
    priority only visits a handful of memcgs before the iterator is
    handed off, so very few memcgs are looked at on the way down:
    428 file folios scanned, 0 reclaimed.

  prio 0 (~167.9 ms):
    priority hits 0 without meeting the target, so get_scan_count()
    forces SCAN_EQUAL. The walk lands on a single memcg with a large,
    unswapped anon LRU and a tiny file LRU:

      inactive_anon ~335 MB, inactive_file ~4 MB   (~84:1)
      memcg swap usage ~3.6 MB, so swapcache is negligible

    shrink_lruvec() now keeps feeding that huge anon list into
    shrink_folio_list() - ~2400 shrink_folio_list() calls, ~93,000 anon
    folios scanned - and every folio hits the !__GFP_IO keep_locked path
    (not in swapcache, needs a swap slot). This single shrink_lruvec()
    pass alone is ~168 ms with 0 folios reclaimed.

  Round 1 ends with nr_reclaimed = 0 < target, so reclaim retries with
  sc->memcg_full_walk = 1.

Round 2 - full memcg walk, 2.37 ms, 68 folios reclaimed
-------------------------------------------------------
  With memcg_full_walk = 1, priority resets to 12 and every priority
  now visits the complete subtree (~78 memcgs). Progress is made
  entirely from the file side:

    prio 12: ...  0 reclaimed
    prio 11: ...  0
    prio 10: ...  3
    prio  9: ...  8
    prio  8: ... 18
    prio  7: ... 38   -> cumulative 68 >= target 32, done

  All 68 reclaimed folios come from file LRUs; anon contributes 0.

So the whole 168 ms is spent scanning an anon list that cannot yield a
single folio under GFP_NOIO, and the actual progress comes from file in
a fast full-walk round that follows.

> 150ms sounds awful indeed. Is this cumulative for a whole reclaim
> cycle or single shrink_folio_list() runs?

It is a single shrink_lruvec() invocation on that one memcg, as above -
not accumulated across the cycle. Each shrink_folio_list() only handles
SWAP_CLUSTER_MAX folios and is fast on its own; it's the prio-0 while
loop over the huge anon list that adds up to ~168 ms.

On the aging trade-off
----------------------
I take your point that this pass would otherwise have aged anon for the
next __GFP_IO reclaimer. But in this cycle that benefit is small and the
cost is large:

- The aging is not lost so much as deferred. Round 2 (and any later
  __GFP_IO reclaimer) still walks the full subtree; anon that genuinely
  needs IO to be reclaimed gets aged/reclaimed then, once IO is allowed.
- The 168 ms is spent scanning ~93k anon folios that, by construction of
  GFP_NOIO + negligible swapcache, cannot be reclaimed on this pass at
  all - the aging is the only product, and it comes at the price of a
  ~168 ms stall in a latency-sensitive path.

That's why I'd argue the balance tips towards skipping anon here rather
than aging it. To keep the change narrow, the check only triggers at
priority 0 (where SCAN_EQUAL is forced) and only when swapcache is far
below the anon LRU (below min(anon >> 6, SWAP_CLUSTER_MAX)), i.e. when
essentially no anon on the list is reclaimable without IO. Outside that
corner anon is scanned and aged exactly as before.

And skipping anon in this corner doesn't cost us the aging in practice:
with no reclaimable anon left to scan, Round 1 simply finishes quickly
and reclaim proceeds to the full-walk retry (Round 2), which resets to
priority 12 and walks the whole subtree - anon included - so anon still
gets aged there, just without the ~168 ms detour first.

Thanks,
Bo
