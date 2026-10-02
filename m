Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFDA23D7F4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951244; cv=none; b=jyGodeWXbX78mfTyAVrNlK1hrW0T7oE+PBitu4cvyC2F2ERa6Lh7FHc5KPMh8jhorIvJ6V9xuBel6SqBIT0il29YHOviQo7NLSBSZE0RgLMjE3rjvR0cS4nPjFzP2YiLBKEpbLLCwYq3Lr9zS6g0QR+PAYFpdz5aoL715LNXGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951244; c=relaxed/simple;
	bh=aTYczatzxFghBxxt6+I6Ijj8xf1r7HURdlc5TARsnno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NU1CyC5lLY1PBsxpq0MA1V4P1t9ZXv36ynXxhso3XkDo4R8XpzJR6c21kxJzhzODpGP0SFKkaPw/BWrHrEGxJhH8iuZAvpiMeTcCQ1t6VmL+Y7WYxQ0rj1bVIIvkbFBdjvH3PBc74oOS5O+OzXAgJQZnveSvmOwEiniMSn+IiUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=KlMgJlBC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g/G+Rl4b; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="KlMgJlBC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g/G+Rl4b"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 611AFEC01A1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:27:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 02 Oct 2026 10:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790951241; x=
	1791037641; bh=sbdgbdFTJvNwsF7OFSnsee/ChxmLprJ0Q1h635WZ3gw=; b=K
	lMgJlBCt1l7i2VvZgYxJNENbnUsVlaegLpQZ38g/xNapL1oKRuIQIi/ckJsE1IIz
	4gf1SdGg3sCS6hjdsTzUw1l3CGTp9IdHUc/Ba/fY9ZD/qTG7QgEHLr1V2RoMMO2f
	OARFiAPqXClTo0IShZRV4JdBdZGRHC9UJGMa/0akTbqziWUyjy9+68DHRW2wjS3U
	SwwUCIwnNvgEXbxykIA0zYZaOJ7V6NVjw19kimFn2lTDhyWrEeAiJIYdwcwHpvMI
	yr/MD41riZIy1HZhUpH95PxKawEyiILE/CIw3GsFeFV7VD127F0lnzMG4femPKBH
	xxXd9hNMv4EfC+l/12SGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790951241; x=1791037641; bh=sbdgbdFTJvNwsF7OFSnsee/ChxmLprJ0Q1h
	635WZ3gw=; b=g/G+Rl4bNuOrK13DKtF4c6aFOYnkuLrMgYu4UE/nwzI9VTV1sIF
	ceY/rvM+GOaMU3tuNJouCjyjZAjJG8it6JWgPY96AoBMTwBfnADNByEy1ph27IZF
	NqFPkcDoRTGge/lPT21N07tl8+k5rTt5cxzV58DtePOHDI3RsYgPvDiQU2GxRvQ9
	iIJEnR9n7MLfuYR2SfN29My5e8Qvl1TKUWtNWeTB+lajuD+/m0Q3YJXjzMdF2yGW
	5mVp0As6+Fjji2t/jgJ8LpbOiypaL1brk0XBLAJ0AEgESK/3M3t0cCUK9F09D3Kb
	0QklBGGNh+6oSu4OFNu5aL6dY/fRO023a7Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790951241; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:jEa76TAKtNdBGzXnDDIgzIIhuZXyaEO+PYQmuKPNXi4fC/O
	NPxsR9gMzRvaCyVsc0DmaMTNMkZLFcdRatJJghTniKQmQ1Bmsab/v2Dt6yg+hwLX
	FLoK19/tZAK5Hg5pFyZgcQcYzTslmSeCh+Dj7cYX/akPs8czo6OnWcRnVQf38+Ea
	Zi7DemKpWsNJx4LWp0NTbAuHl37wlqcl7zFzGV4WErUM2BgpmCGgR4kMwRIDRp7L
	p7dinUSZHUDURvwyenk29KvCPrx8ahqyhuWH2pRmvgPEbKbnJS7OdoDomx+/onoH
	/yYTV3wnvSjed189kyEGmCg5EW9Xjj9wmTunWXQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vpewZRuhIM1oASSZ5cZOnkOnUeKAsvD7DkHHp86obNs=:aTYczatzxFghBxxt6+I6Ijj8xf1r7HURdlc5TARsnno=;
X-ME-Sender: <xms:SL-_ahycoHtJvrfE01u9Y8ShGxLAYtakxSjjUIHx_hXlK4x3-Eva4Q>
    <xme:SL-_au5aE2-iigmFVauipP-iCCJYQ2cv4JqkYzHk97RrurP-A5DuSKtCP4mSuz5AI
    Qe4KMmS3nT-_w6ZXZnPrCRFHW_5nVm2vIWexhmRoZ7POa9I5cqWeHF7Ww>
X-ME-Received: <xmr:SL-_aisdkLUKj4rte-k0rZW1QZSEguraa2sHpaMhVCKSP1YxlN_tlBwV6nA>
X-ME-Proxy-Cause: dmFkZTE6osMbuhp93dIm3/olPTvePRSEtMiSG2yB8BD28yVvcGSQ8kW/aPp5RH7S+4LSfa
    bTM/3ZvRE9+32cpLQr/CGpHm+Yi8RYT6Byk/DtsaHMS7yVFCz7hfxGUsRHzER8EyP/fnfk
    dp40B298jELpaIf6SSNxNLO7aX0eEnbYyGnLyRxkEtipTrYhKpJ4vthG5lCuD86qn2IP17
    AYs411yzZV8ZQ2yOJDUEt8N7GYHX5M5Bcu3wNIxvJzuBny3NV6V2M57TZNmwfjSkSnqlYW
    TWEpKVq9jPTQlT04TKh2mDklcp76W1Z5REyvPrpjXEk4VgRzrbfbRe8ztlihACiNsuySYI
    sTLLE/FCDIEgtzXT9x3uYfnPqHfeK+xjfZHxsW8lkPbym0ZtxUJuI5HV+Wh13ivD0eoCnR
    hqviaf5w34ufD2Od8C7Lj9M1R+32/jPXFDyWGzob1PxP5eCYrmzlpubSo2K15J/xmuu66Y
    0PEUIY2OUyaKexZl7pnnpLIC3siTRdSb6msOuo8T5ioC8I5HI2inmPPp7XpUHEs60ukDfY
    pu5aJmSIpReyPwe9Z7jMGnGysaZBxIrGWPP9KIWYDjwf0Q9KM9tm0+0Fu7bmS5fbGK1l0p
    8aRXi+RXSFIMCRzAjBkyDDszEPoU1Q4eoydKtuK7rHmco0UJ1XN0CE+c2M8w
X-ME-Proxy: <xmx:SL-_arvZXMidHA4TJIr2OogNNR1yGXNeUsiQL9LYlOm7zlxkEZM-wg>
    <xmx:SL-_aqtucqcOI6pwBn5zXr56kiUMFHub0AZLnaFeJBK9dmYToUTDqQ>
    <xmx:SL-_ar5BWk5XwRrNDzhraZWn9W-DKyMRjEeDFOUxiU8G6Xa4Iaf85w>
    <xmx:SL-_atD8hN0hPvotiJqyEhm6-MHoGeKnuugJtDUoJ4HnUy4aTm8oxA>
    <xmx:Sb-_ag3AqfLrmlL8ECTKvBaHmWyjTJD8J3lroHPDVeHEeXP-XxrTeTkE>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 10:27:19 -0400 (EDT)
Date: Fri, 2 Oct 2026 15:27:18 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v4 10/13] mm/collapse: open-code collapse_single_pmd() in
 its two callers
Message-ID: <ar-nKHZ5hlbsXeFP@thinkstation>
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-11-kirill@shutemov.name>
 <b2133cff-ce69-4a45-bf33-c44b774dee7b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2133cff-ce69-4a45-bf33-c44b774dee7b@kernel.org>

On Thu, Oct 01, 2026 at 11:37:31AM +0200, David Hildenbrand (Arm) wrote:
> On 9/28/26 12:06, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > A scan and a collapse want different things from mmap_lock.  The scan
> > reads one PTE table under the lock the caller holds, refuses most of the
> > time, and the caller moves on to the next table without letting go.  The
> > collapse allocates, may sleep in writeback and takes the lock for write
> > itself, so the lock it is handed is of no use to it.
> > 
> > collapse_single_pmd() kept that boundary inside itself.  It dropped the
> > lock on some paths and not others, and reported which by way of a bool
> > its callers had to carry along and then act on. 
> 
> Let me think this through. collapse_scan_file: it doesn't actually need the MM at
> all. The only reason is to do tracing. Rather stupid, it just should not consume
> the MM at all anymore. Consequently it doesn't even need the mmap lock. But the
> caller needs the mmap lock to figure out the file + range from the vma (the
> per-vma lock would also be sufficient for that).

Right on both.

As I mentioned before, virtual address scanning might not be the best
way to collapse page cache.

We might want to start from inodes on superblocks that have large folios
enabled.

But it is out of scope for the patchset.

> Also, I guess we can convert some of the scanning to use per-vma locks in the
> future, whereby we would actually want to scan with the per-vma lock held.

That is the reason the caller owns the lock here.

On top of this series I have khugepaged scanning under the per-VMA lock:
the scan asserts whatever lock the caller holds, the caller does
vma_end_read() before the run, and the run takes the locks it needs
itself.

Neither the scan nor the run changed for it.

With collapse_single_pmd() dropping the lock, it has to know which lock
the caller took. process_madvise() on another process's mm cannot move
to the VMA lock: untagged_addr_remote() asserts mmap_lock, so a remote
MADV_COLLAPSE keeps it while a local one and khugepaged move on.

The single call would need a flag saying which lock to drop. That is
the lock_dropped bool again, pointing the other way.

> I do wonder about one thing: should we really care so much about keeping the
> mmap lock locked? Meaning, why not provide a single collapse_single_pmd() that
> 
> * Is always called without the mmap lock (as is)
> * Always returns with the mmap lock unlocked (change)

Yes, we should.

Walking the tables under one hold and giving the lock up only to
collapse is how khugepaged has worked since ba76149f47d8 ("thp:
khugepaged").

The bool is just how that signal got plumbed when MADV_COLLAPSE arrived
in 50ad2f24b3b4, and it has already cost one bug, 5a62019807da
("mm/khugepaged: fix issue with tracking lock").

This series removes the bool and keeps the behaviour.

> Sure, we drop+re-acquire the mmap lock a couple of times and lookup the vma, but
> isn't that actually being nice to the other parts of the system? In the future
>  it would simply get called with the per-vma lock and would return with it unlocked.
> 
> In the good old days, looking up VMAs was expensive, but nowadays ... not sure
> if it still matters?

The rwsem and the VMA lookup are not the only cost.

In your version every table is a visit to the mm: unlock,
khugepaged_mm_lock, back through khugepaged_do_scan(),
khugepaged_mm_lock again, a trylock and a VMA walk, for a scan that on
memory already huge is one pmd read.

I measured your prototype against patch 9 as posted, both on a production
config, 8G of anonymous memory already collapsed, scan_sleep_millisecs 0,
pages_to_scan 65536, PMD order only, five runs each, medians:

                                     as posted    yours
  khugepaged, nothing to collapse:
    full passes over 8G in 20s         251,180    55,477
    khugepaged CPU                        100%      100%
    cost per refused table               19 ns     88 ns
  MADV_COLLAPSE, already huge:
    512M per call, p50                  3.8 us   17.4 us
    2M per call, p50                    703 ns    703 ns
  tables walked in full then refused
    (max_ptes_none 0), passes in 20s       803       836

On being nice to the rest of the system: the scan is already bounded.
The read hold ends after pages_to_scan worth of progress. We already
have properly sized scan batching in place.

> khugepaged? Not sure if this matters. madvise? I suspect many real users operate
> on a single PMD only (e.g., tcmalloc, jemalloc). For the other ones, not sure if
> dropping the lock every PMD is really a problem?

khugepaged matters. We run it across the fleet, and its scan cost is
what decides how aggressive we can afford to be with it. I am not
giving up scan rate to keep one entry point into the engine.

For a single PMD there is no difference either way. For a range, today a
MADV_COLLAPSE over memory that is already huge walks it without letting
go of the lock at all; in your version it relocks and revalidates for
every table, and tells madvise_walk_vmas() to look the VMA up again.

> IOW, how bad would the following simplification be (prototype that needs more
> work and thought):
> 

...

> 
> Based on that, I'd rather want to see collapse_single_pmd() to just inline the file
> and anon paths, and see how we can further optimize the locking internally (e.g., perform
> the pagecache scanning without the mmap lock).

I see the appeal of the single entry point for the collapse engine. I do.

But it costs us on both the locking picture and the scan rate. That
does not work for me.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
