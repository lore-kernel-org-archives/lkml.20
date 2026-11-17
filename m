Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911315;
	b=bzIixlqg1zigZ0nCg6lKY4E/3lMEHzpsx1XVYU6aj+x9pK/R5kJMLxORzT9nvM5/h5Ww
	 PObsPKqSfZ9uckt36ip2PXOCW523zYdSyh5vUepmR1qx2Ny8t01yOqSvPab2VOw8MIqUS
	 5fSwHWeC/iO0zwz8pFUIRX9EdrYYimibtdNXBErFFmHT3YTgNC8/MVfK9+v8EFKevBWUo
	 gbcZHHkHrIZYCRBZvwHgptxJCqHCKV8XFJWtTn1eu5pe/BAr0iODrln3Te0C5uVe3PLI5
	 LljmiO/iu46NnluV9CX1cCf6tSpKxIaZx2E3j48V8tk5zBNKjutp+rTH5x322KX1AIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911315;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aUuc456jVRsmRWx54q8uCKHa7yeIdCKeWb6UY4IYup8=;
	b=Surs6SIXJ7Sdsz52qG0k61Xys9AfuBBbeqnpDsZUAUw9x6UA5zyrMz1FnyN6+/pgENLT
	 K1nwFGu2PjBjpf65wkopoj7yUcokn/w/nBIp1GSnQHHmvJssgGBctx7SLKUdcfAhZwfw+
	 0T2U6t0vI2cnpcWLhMvzPpsaxhPY/mzOr5y/WUmtXWLgujuZ9BmycADwbCTXkyUKRivr9
	 xW+VVWt3eBUkQwpM7/t6hex4gH+8Qbo61RnFSfpMWE5AH7wZUEdt+XHJTq3xprARjmgPF
	 yjIo1lokGFdizhqthvtA1wax4QFesOOmW7oKO3vDbL9pZWP4zIqWMiStUgeK32ZihPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hFSrnfLu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D35606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hFSrnfLu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE131F000C6;
	Tue, 17 Nov 2026 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794911315;
	bh=aUuc456jVRsmRWx54q8uCKHa7yeIdCKeWb6UY4IYup8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hFSrnfLuYRHtiF9Pjsbi4to8AXQQuRh9YcBWqLaGZuvxWpiE8bg6sDIMQUFNFXg8c
	 /K4uB+UlRk51TxHTEmrb1U3eO5FDHN6n5sl8tSpHa6XvT7LInWCdv1VSp8MrMyoxbn
	 Q5iyjziHgJiR8H+U0ltMTM/iuBF7iU8BhGfNnjxs6s0KdRDPivrSjQ/FlBRcOfFdTK
	 qg3SYfYUSdgawV1tSuux3eqMbVYIODN7EDNpGqm3jrJa7Xg7rem1FW/8gkoPZQiJVw
	 DA82/kkxxmaieLWf9z/pP1D582wTgxcAuWTHhnL6PqzkMkHuL09VFsseAwBY0524sz
	 vvSKe7w0wPbtg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 466DA198003A;
	Tue, 17 Nov 2026 05:28:30 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 17 Nov 2026 05:28:32 -0500
X-ME-Sender: <xms:TSz8akoIJ8VUdPzL2SAiWezRgl-xK2V1RTwV_qy8_po38gJ4Z-kejQ>
    <xme:TSz8ajv5tywZhKakde_bPAmx3iEyufG7ZFZ8S33VIQLqLr5Jksk3g-fQGtraUnigc
    pzqEIUaP2eojkS-JWGjbs3iPBQmqgT7sirtzjnlSEQmTSeuqV8XBn3p>
X-ME-Received: <xmr:TSz8aiR9EEX3NPPPgJeP7O8Kc4pvyuP2AgHF7-LAs4rWoYPBn7JNAf1LXr4>
X-ME-Proxy-Cause: dmFkZTEyk12DcAQuIlTI2xJtbrOBSs+QrfdgWAvOUBdNOkqljsjgvALIdBr7Jffnf/Vh9w
    FK7xcfJVC+STgtN1Cz2GRI2Kh104UxI95eHtE//tBhmqi2hu6pIyaAgxIzhFuC7GMEXmVo
    Tpq1KL61++h1aClhBiPt5I2Yn3jUWMVxis1ka23Rhc7KaS3ObGJFW9Th80E4+x5RcGGPbe
    pnS+zPR15R+jxQWkbj/jQwUNfYD8cZtLC4S4+TDMS1BwSEY5tBktOjQjVazb6rpLDly24h
    9gC+Vqt8lr1zsFqyi6SwbGj5AtzFivZws+QSr5kkFEAH3QIzrdy2/D+0X7rQ4Xq1GklHiq
    wr1w3kJJH3vFW6cRjI3TiaxeaipF5h7UYumzTynQh88nyDwB2dB4ttLfqfae9hhwVIqMlP
    Xv2Se5iFpRzxNm5zEDAvHXtq19X/u/2icBThVFdLeh8OMxfDQADC6dXkMXkHOqvfiowEM8
    yilSsrPCZoUftz8loKWlB7Sv+NAIwystEO7qIRBOtTwJ5Ln7PtPn1KKUJfVXRArqYOGzCO
    QkApXqsq47Nx7BaCdwxvS0y0erKA0U/GHlU2g1PnXlx3/6vb8u7BQNcHqOEg/nFSdcYMiO
    RZ39dUYlu4I6e2iTb5goZox7sX/U0lukWx8YhPpjGBMlrfRSc4xIsQucLWWA
X-ME-Proxy: <xmx:TSz8anofhu7nNmVpvzT2pcY6RSTlJIgjs34zEeA4En6hvuVgwZnPXA>
    <xmx:TSz8atIJszYvWLsH6P2BumTmmcn7RuntqIDDfHQy15asFAthMe_tlQ>
    <xmx:TSz8aqORVjb07TSUxsL9ffSizIxS_a13Aqjri1kOT8m3ziR5nSlKcw>
    <xmx:TSz8aopJgLyZZ_LS8fMSIt_-3-0fX2aE1MS5DP_qttsTERHtv60NgA>
    <xmx:TSz8asGRw07OZlo26V4Qm4Tz0MATWMtrfGOnYElGyj61HDuwfmNxwEQf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 05:28:29 -0500 (EST)
Date: Tue, 17 Nov 2026 10:28:28 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] mm/compaction: do not skip the free scanner's periodic
 lock drop
Message-ID: <avwrmTszH4tNSIjA@shutemov.name>
References: <20261116125746.2897395-1-kas@kernel.org>
 <ad8a7751-c9c1-4b0c-969b-27efd0945dc1@arm.com>
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
In-Reply-To: <ad8a7751-c9c1-4b0c-969b-27efd0945dc1@arm.com>

On Tue, Nov 17, 2026 at 11:04:25AM +0530, Dev Jain wrote:
> 
> 
> On 16/11/26 6:27 pm, Kiryl Shutsemau (Meta) wrote:
> > isolate_freepages_block() drops zone->lock, checks for a fatal signal
> > and calls cond_resched() at every pfn that is a multiple of
> > COMPACT_CLUSTER_MAX.
> > 
> > With a stride above one, the scan steps over a compound page, or over a
> > high-order free page it has just isolated, to a pfn that is not a
> > multiple of the stride.  From there it never reaches a multiple of
> > COMPACT_CLUSTER_MAX, so the rest of the pageblock is scanned without the
> > check, possibly with zone->lock held and interrupts off.
> > 
> > Count probes instead, and check every COMPACT_CLUSTER_MAX of them.
> > 
> > Fixes: 4fca9730c51d ("mm, compaction: sample pageblocks for free pages")
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> 
> Cc stable?

I have not seen real world problem triggered by the bug. I don't think
it is needed.

> 
> Reviewed-by: Dev Jain <dev.jain@arm.com>

Thanks!

> >  mm/compaction.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/mm/compaction.c b/mm/compaction.c
> > index f1b2060eb201..4465c1551406 100644
> > --- a/mm/compaction.c
> > +++ b/mm/compaction.c
> > @@ -579,7 +579,7 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
> >  				unsigned int stride,
> >  				bool strict)
> >  {
> > -	int nr_scanned = 0, total_isolated = 0;
> > +	int nr_scanned = 0, nr_probes = 0, total_isolated = 0;
> >  	struct page *page;
> >  	unsigned long flags = 0;
> >  	bool locked = false;
> > @@ -599,13 +599,15 @@ static unsigned long isolate_freepages_block(struct compact_control *cc,
> >  		/*
> >  		 * Periodically drop the lock (if held) regardless of its
> >  		 * contention, to give chance to IRQs. Abort if fatal signal
> > -		 * pending.
> > +		 * pending. Count probes rather than pfns, as the scan does not
> > +		 * always land on a multiple of COMPACT_CLUSTER_MAX.
> >  		 */
> > -		if (!(blockpfn % COMPACT_CLUSTER_MAX)
> > -		    && compact_unlock_should_abort(&cc->zone->lock, flags,
> > -								&locked, cc))
> > +		if (!(nr_probes % COMPACT_CLUSTER_MAX) &&
> > +		    compact_unlock_should_abort(&cc->zone->lock, flags,
> > +						&locked, cc))
> 
> I see this is an unrelated change but I don't mind.

&& on the new line looks odd to me, it belongs to the first line.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
