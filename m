Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0663EC814
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539943; cv=none; b=IZY1BCoo9pwJRpkeKOzCQnUvS0KIc2GiRHI/LdEL2HaNsItuNzulWIzBLfedRSwkwaQ8gdWwsLWdcVjZYIkanGNXG7X0zLjXYwAEiOcaaNB+Z4evdGZfvWqcWZCo2L1jpSdg483jYgqXsf3AbSZVHiyibpd7SVceKH86Pq+Cex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539943; c=relaxed/simple;
	bh=DmhTSGF3lltQO93xTkhtfdUDlv3AG6mDegblhYUGxVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPYKWqREuTh04y/5nQEuTPvSiEO86VxF9FZWf332WxWc9NAB5YxfmsCcOmrpMepgUjyjK3u/Smoq9TWAgYoBp87VFEfmQVDIb7r06MFGPaxn43VQTa+LXrAy7T6u9UkP9QUS+73nNcP+0Ce9AljTkWIiAsrTU1nkDhaS61hWkbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=JZZ/2RDt; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="JZZ/2RDt"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-90cd96389efso16318266d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788539940; x=1789144740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BPJNCIJctbxrL/gwwpLp4isL2IQcKA6SZn3cTOfdjLA=;
        b=JZZ/2RDt66MrMHuKwnJKXiLo1a5hJlRmnpq2e26PES/gC+hm2683D6zuwhBxD8UqoK
         byKW0OZCbZE8Xvg9uw/c8wS5gP6vAwknwJPRwIJzC8NWscpNcwArF9ePlJx/kpq+MdFG
         KnwPR+tQTyXaMFpwN2WiTvC+csRyLA9lCjEp3cj2i5CTpOS9H8dqvGX0VBjWfCIcfqsT
         Ckq0QMuHE6K5TghiAlC9uWy6JTe75TZJBR6/QzwiL3yLEDNTTSW32eaYJSSBkFDORitR
         HiOrf8QohCm/GXqLiTNXEy95bsSoZzH3IatQYhMUT9T+mylifF+VxCLohyN62hZsrMXT
         V8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539940; x=1789144740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPJNCIJctbxrL/gwwpLp4isL2IQcKA6SZn3cTOfdjLA=;
        b=N3vgNuwVdgw/9eWPx8D94s1dvJ+UR2toPZiXJXWpZQIiYA9cl8USGKWOodSOmy64T5
         n3xzqOa0YCokEbSCU9+WjbRBypUqnjptjqK6JkmLlttVFQ9BQa8xK02pKd4ZcO9WESMY
         5Z1H2WFnAGUobC1CCt+lX6nfDD83Vd4D23OilR5C3JmOjePqhTDMV3iicdit9SEDBkSh
         m2ruKMpBTCbmO2af8FDOIHHMqg0ZRmRjg3htWYDFS9QGGGLz4xWCb4PkqrwCil6K7HWh
         vrTRt9wwcrN8bkseyMYa2RUzJiXP0so+C6afQ4AK63qbujSUDW+4jMC82Dnw7Gv3akho
         tR7Q==
X-Forwarded-Encrypted: i=1; AKwUvBywFNL6DAE3jlqNMD8Qn5AsXY+mJSTkz2ZB/vD7mB1Do329B+q51fUYpxnnEyWMmrZQrmpSHXz8f544+R8=@vger.kernel.org
X-Gm-Message-State: AFuF++nsZ9OfXX87GBOM3K7TjAhr25m3DrZ46zYRpWeoEy2hvhbFV/qP
	OClkAnj6dr8umW82nIsWNIf6LrGxxCNV4iNt/Ax+MKjL1gCO8mHRjw4qMDV4BPpNS4Y=
X-Gm-Gg: AYBFou2jVf1Mcyn1SuAMnDaX5jmkIm1mZlYgbZufsa9IsJnRZg0PW3DNctGdXN9aMfz
	TzphKHwXc3fJ4pYdLotVzLdDyj8pMZU8fjkGVV1ohE8LLOHydlGGgBW/FJB8gMIWxBXAPbIDsz6
	TllY0B+767vVbtr3tFrB7GLYqo5FM3YbEHY7RaFESJWcpFq6e9kxUZG2X94lkcAkp9rRv0BbIUn
	lprcP2M79euThL65cNvVs1Y3t0bJZDDWI/kJIS0oEv7K0B52OfL7rW71MSeDwpxw/34XZFlFWEU
	XKNLjFt72s9mxosAQA+Ch1hc2cOQWifEN1raxjcGqbb1aDUlpEMo1WEUFupNbaKNpRBN9MIKMPK
	VwlWZyyia1bxJYUqfOG0/GXJf2pUOEgrwHWB7yT4naCtxMN4EPAheUPRujdzIP2vsZRPBRqb5Jm
	dG+Rq+S6U3g4niWH9j5VGu9sqcjjRb7inPQOhlqfvgP5gGZ3oI
X-Received: by 2002:a05:6214:6343:b0:90c:c6fd:e8fe with SMTP id 6a1803df08f44-9103f044b57mr66427916d6.30.1788539939628;
        Fri, 04 Sep 2026 09:38:59 -0700 (PDT)
Received: from localhost ([2603:7001:f100:501::2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406b0f51sm23891226d6.42.2026.09.04.09.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:38:58 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:38:54 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, kasong@tencent.com,
	qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org,
	mhocko@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache
Message-ID: <20260904163854.GE6641@cmpxchg.org>
References: <20260903130304.GQ3004@cmpxchg.org>
 <20260904020756.4163139-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904020756.4163139-1-zhangbo56@xiaomi.com>

On Fri, Sep 04, 2026 at 10:07:56AM +0800, Bo Zhang wrote:
> On Thu, Sep 03, 2026 at 09:03:04AM -0400, Johannes Weiner wrote:
> > On Thu, Sep 03, 2026 at 12:01:31PM +0800, Bo Zhang wrote:
> > > We have observed some cases where memory is allocated with GFP_NOIO, so
> > > we cannot reclaim any anon folios unless they are in swapcache. We can
> > > end up spending more than 150 ms looping in `shrink_folio_list()` scanning
> > > non-swapcache folios without reclaiming a single folio. This is pure
> > > overhead.
> >
> > Not entirely. There is some value in aging anon alongside file, so
> > that the next __GFP_IO reclaimer doesn't look at a stale list.
> 
> You're right, "pure overhead" was too strong - aging anon does have
> value for a later __GFP_IO reclaimer, and I don't intend to skip it in
> general. Let me describe the case in full, because the reclaim cycle
> itself already provides that aging on a later pass, which is what makes
> me think the trade-off here leans the other way.
> 
> > Can you describe a bit more about what you observed? What workload is
> > running, maybe you have a stack trace of which NOIO requests are
> > routinely getting stuck in reclaim?
> 
> The workload is app launching on Android. The NOIO allocations come from
> dm-verity hash-block reads via dm-bufio, which legitimately use GFP_NOIO
> because they run underneath the IO path:
> 
>   worker_thread
>    process_scheduled_works
>     verity_work
>      verity_verify_io
>       verity_hash_for_block
>        verity_verify_level
>         dm_bufio_read_with_ioprio
>          new_read
>           __bufio_new
>            alloc_buffer
>             gfp_mask: GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN
> 
> So the NOIO use itself is correct; the problem is on the reclaim side.

Ack.

> Here is the full picture of one such direct reclaim. It runs two rounds
> of do_try_to_free_pages(); the target is 32 folios.
> 
> Round 1 - partial (shared) memcg walk, 169.20 ms, 0 folios reclaimed
> --------------------------------------------------------------------
>   prio 12->1 (~1.3 ms):
>     cache_trim_mode is on, so get_scan_count() picks SCAN_FILE. Only the
>     file side is scanned. Because this is a shared/partial walk, each
>     priority only visits a handful of memcgs before the iterator is
>     handed off, so very few memcgs are looked at on the way down:
>     428 file folios scanned, 0 reclaimed.
> 
>   prio 0 (~167.9 ms):
>     priority hits 0 without meeting the target, so get_scan_count()
>     forces SCAN_EQUAL. The walk lands on a single memcg with a large,
>     unswapped anon LRU and a tiny file LRU:
> 
>       inactive_anon ~335 MB, inactive_file ~4 MB   (~84:1)
>       memcg swap usage ~3.6 MB, so swapcache is negligible
> 
>     shrink_lruvec() now keeps feeding that huge anon list into
>     shrink_folio_list() - ~2400 shrink_folio_list() calls, ~93,000 anon
>     folios scanned - and every folio hits the !__GFP_IO keep_locked path
>     (not in swapcache, needs a swap slot). This single shrink_lruvec()
>     pass alone is ~168 ms with 0 folios reclaimed.

Ack. Thanks for the rich explanation, this is illuminating.

Agree with your fix. This GFP_NOIO just has to get through the day,
and aging 90% of memory it cannot reclaim is an unreasonable side
quest. Leave it to kswapd and the other reclaimers.
