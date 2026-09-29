Received: from black.elm.relay.mailchannels.net (black.elm.relay.mailchannels.net [23.83.212.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E8D39FCCD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.212.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712836; cv=none; b=RKHwV7Q/kiYwLei6v3wxRyYOI5MHXAUGlbNpnsERGrTu9HsPkLBovnPZOkfDzxgDcMpiUudqTlRFkYuSKBQF+dEblWr2aequADstGolf+shcXFOKQ0P9Hz+DgTmF2UUMxLP4sKr5LRIQ9D1ZF4gdgSCIHdhPEnXSW2QXm/LRo+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712836; c=relaxed/simple;
	bh=Lts9hOFPjg3orrRfM41iZgL+PnG4ETHesSbZ961bpyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s867KPPQP54VEt69f0ZiX9pfIa7Wl0W45NAeQexOO5lhEykW+4a8HIr4LidrH2RYThwGfZowbImKqvhBaP7w/BMCb/Hiqv/t+ADUDjHimk5DMfxujRs2i7s2wDgRODj9rjL0hFlmtUEr8G/w5xBt+GuapbF+lcICYKlmDSMKlNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=Wufqs1OW; arc=none smtp.client-ip=23.83.212.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="Wufqs1OW"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 62A62461434;
	Tue, 29 Sep 2026 19:57:03 +0000 (UTC)
Received: from pdx1-sub0-mail-a258.dreamhost.com (100-96-12-141.trex-nlb.outbound.svc.cluster.local [100.96.12.141])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9E87146245A;
	Tue, 29 Sep 2026 19:57:01 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Macabre-Lonely: 6e3c9a745d573fba_1790711823248_166122602
X-MC-Loop-Signature: 1790711823248:766552379
X-MC-Ingress-Time: 1790711823248
Received: from pdx1-sub0-mail-a258.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.12.141 (trex/8.0.2);
	Tue, 29 Sep 2026 19:57:03 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a258.dreamhost.com (Postfix) with ESMTPSA id 4hvTTl6pZXz105F;
	Tue, 29 Sep 2026 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790711821;
	bh=pxMsgv7QdRgYyE7jsfFXudm4dBWFzhEls+snUKxmoRU=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=Wufqs1OW8EeFlMwH86dA7lMFChW+V71vN4GvQEGx6Wgec0NC9jrdmz/lRuqgexRSx
	 RTlgxRRpmdsHRxPiEbbb+sb3IEXp+j8fauEEPwK2UMpkZ9vk37HWXfC958FLlHVuYx
	 bP5cTJk1rPIjWZuqhDAMPH57tlykgQp7cQ6HI5ZuWbCyqm40bx3vmZMdVwEJ2i/fh8
	 rkSQhTLzOfKN2r/ClRgGxciqoUj5yN9JE8NpZ1kvbr3Rn4p9zZgJmp3fNEIEbDYrBA
	 WiQgTvf3KgSmzRPzcUrqkPF9h6utTg37UAImktqDrGWw8dgFIn1MCRg4nhzTVDvNEU
	 CuVa82E56bZBg==
Date: Tue, 29 Sep 2026 12:56:46 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, jic23@kernel.org,
	dave.hansen@intel.com, gourry@gourry.net,
	mgorman@techsingularity.net, mingo@redhat.com, peterz@infradead.org,
	raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
	sj@kernel.org, weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, nifan.cxl@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@kernel.org, byungchul@sk.com,
	kinseyho@google.com, joshua.hahnjy@gmail.com, yuanchu@google.com,
	balbirs@nvidia.com, alok.rathore@samsung.com, shivankg@amd.com,
	donettom@linux.ibm.com
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
Message-ID: <20260929195646.4ttbl22clnrrktg7@offworld>
References: <20260728054356.291998-1-bharata@amd.com>
 <20260925021226.52kpnmvfylw73dz4@offworld>
 <31442591-d020-47b5-8f1c-b87fb632c226@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <31442591-d020-47b5-8f1c-b87fb632c226@amd.com>
User-Agent: NeoMutt/20220429

On Sun, 27 Sep 2026, Bharata B Rao wrote:

>Hotness promotion engine
>------------------------
>This is not something that was written for pghot from scratch, but instead it is
>the same hot page promotion engine that is part of NUMAB2 which is now
>generalized and moved to pghot. So this is not the complexity that pghot
>introduces afresh.
>
>So considering all these, I see pghot as a light-weight and low-overhead
>mechanism to track per-PFN hotness and do async batch migration. Initial
>versions had fancy double data structures; a large hash a small binary tree of
>promotion-ready records and associated synchronization mechanism, but that is
>all past now.

I think we are all in agreement that the async batch migration is wanted.

>
>pghot interface for sampling
>============================
>pghot_record_access() interface was designed keeping the existing NUMAB2 source
>in mind. It fits that and it fits other sources like IBS Memory Profiler. So
>sampling sources report an access and the shared promotion engine acts upon it.
>
>But for sources like CHMU, from what you describe, I gather that a bulk
>reporting interface plus an indication to bypass the engine to treat the PFNs as
>migrate-ready, is what is required. Should those migrate-ready PFNs go through
>the regular pghot tracking (getting into section hotmaps to be picked up by
>kmigrated) or even that should be bypassed?
>
>However, in the context of PTE A bit based source, I have often thought about
>extending the interface for
>
>- bulk reporting where more than one PFN gets reported.
>- indicating the bypass options (frequency check bypass, recency check bypass etc)
>	
>NUMAB2 has to perform better in pghot
>=====================================
>pghot is about a sub-system that makes it possible to have multiple sources to
>coexist with reuse of common hot page promotion engine.
>
>NUMAB2 source resides within the scheduler and the promotion engine is also part
>of the scheduler. Through pghot, I am separating the source (NUMA hint faults)
>from the engine and moving that existing engine into pghot, to a common place
>where it gets reused for other sources as well.
>
>It is the same NUMA hint faults and more or less the same engine and hence my
>main objective is to ensure that there is no regression during this move.
>Additional performance optimizations can be done to the engine itself separately
>but that shouldn't be the baseline expectation from pghot.
>
>Is moving hot page promotion out of scheduler into a dedicated system, a good
>thing in general? I believe so as scheduler isn't the right place for it to
>reside. However I would like to hear from scheduler folks on this.

So two of the autonuma balancing og authors are scheduler experts - and iirc
*the* reason back then was locality. And Peter has already nacked the IBS
stuff in the past. But indeed the batch async part would be good to get nack/ack;
albeit the cgroup charging situation.

>
>Do we even need a centralized hot page promotion engine?
>========================================================
>NUMAB2 is good and serves as a good baseline for any new source that comes up.
>But with different kinds of sources becoming available, do we want all of them
>to  duplicate the hot page heuristics and promote hot pages on their own? I
>thought that may not be preferable and hence started this effort.

What are these sources that will become available?

>CXL HMU may not need the promotion engine,  but IBS Memory Profiler needs. It
>needs a promotion engine with full recency and frequency considerations before
>promoting. I don't think an arch driver like IBS Memory Profiler should be doing
>hotness heuristics within itself but instead be using the existing engine. In
>fact in my early posts, the driver based on primary IBS instance was feeding the
>"access sample" as "NUMA hint fault" to NUMAB1/B2 so that rest of NUMA
>Balancing/Hot page promotion engine just worked. But I think pghot is a better
>approach than that.

I agree that the IBS driver should not be doing hotness heuristics, it's the hw
that should.

>
>Why full pghot? Isn't async batch migration enough?
>===================================================
>Some of the above reasons apply but during the course of iterations, I have had
>implementations of just the migrator (kmigrated [1]).
>
>If every sub-system/source has intelligence of its own and just wants to
>handover a list of pages to async migrator thread, that's not much of an effort
>as this implementation showed.
>
>But then if some source needs rate-limiting and another source needs only
>hottest pages to be promoted, then again we overlap with the existing NUMAB2 engine.
>
>Then if we want to be slightly generic and want two sources to complement each
>other or the promoter to differentiate between lukewarm vs hot pages/regions
>then we may have to maintain hotness records and may soon end up with something
>similar to pghot's hotness tracking and reporting mechanism.
>
>Hardware sources have to out-perform NUMAB2
>===========================================
>Different sources will have different characteristics and capabilities and will
>help different workloads differently. So it is the choice that one could
>provide. Sometimes sources can complement each other as well.
>
>What IBS Memory Profiler has shown is that it can match and/or exceed (for
>Graph500, ptr-chase, llama) NUMAB2 with no hint faults overhead [2]. Also please
>check the initial XSBench numbers in my inline reply.

It's all about the numbers, and the ones you have just don't really sell - which is
one of the reasons this has been going on for years. If numa balancing didn't
exist, then maybe adding all this would make sense. For the XSBench I don't think
making decisions based on the non-overcommitted case is worthwhile.

>
>Cost of an unused source
>========================
>Not all the sources are required for every situation. Sources can be disabled at
>compile time or not enabled at run time with no cost or effect on other sources.
>But hotmap allocations would remain as a static cost even when no source is
>enabled (built out at compile time, the map is gone; sources off at runtime, the
>map remains)
>
>Tracking granularity: per-PFN vs region
>=======================================
>Often times this question comes up when pghot is compared with DAMON.
>
>Firstly, the baseline that we have (NUMAB2), tracks hotness at page granularity.
>To support this, pghot started with per-PFN granularity. Naturally two concerns
>come up:
>
>1. Memory overhead: I have shown the numbers above. It is lower-tier only and
>not much IMHO.
>
>2. Scan/CPU overhead: pghot started with scanning all PFNs, that was expensive.
>Then it introduced hotness bit per memory section so that only those sections
>which are marked hot are scanned. Now I have added (yet to be posted) a
>sub-section level hotness tracking where a hotness bit is maintained for each
>fixed 2M region within a section. This has considerably reduced the CPU overhead
>for kmigrated thread. While the ptr-chase numbers that I shared with the
>separated out IBS RFC v0 post of IBS Memory Profiler [2] does show the kmigrated
>utilization numbers with sub-section tracking, I plan to have some more numbers
>ready for LPC.

I look forward to seeing any new numbers you have. Region granularity is certainly
more aligned with willy as well as chmu.

>I am beginning to feel that this may be a good middle ground between real
>region-level tracking (where all pages of region are promoted irrespective of
>their real hotness) vs scanning at sub-section granularity but performing
>per-PFN precise promotion.

[...]

>I would be interested to understand more about how you ran XSBench, the
>parameters used, the promotion stats, if demotion stats etc. Do share when you
>get time.

The actual command is 'XSBench -g 90424' so only set the gridpoints, everything
else is default, so total ~44Gb footprint. I don't have the vmstats currently
(I do not run these benchmarks) but will share them once I get them - I can
affirm that demotion is in fact enabled, so full TPP up and down.

For the chmu: 32GB device (1:1 dram and cxl), this is with a 4k unit size, 1s
epoch, reporting mode is always on, threshold value is 1024.

The numa balancing mode was set to 3, the rest used the default values:
pghot_freq_threshold=2, pghot_promote_freq_window_ms=3000,
pghot_promote_rage_limit_MBps=65536, kmigrated_sleep_ms=100, kmigrated_batch_nr=512.

I also have numbers for two more benchmarks with a real chmu, with basically
the same numab parameters:

(i) TaoBench almost 2x throughput, going from ~250 qps to ~480 qps, vs NUMAB3.
     (dram:cxl is 16:32Gb with a 32Gb memsize, num_clients=2, clients_per_thread=75)

(ii) Graph500 only shows a smaller ~20% improvement vs NUMAB3 (bfs mean time drops
      from 5.0 to 4.15 secs). This was for a memory ratio dram:cxl as 64:32Gb. The
      algorithm is BFS, edge factor 512, 16 mpi processes.
      (mpiexec.openmpi -n 16 ./graph500_reference_bfs 22 512)

>
>I did a round of testing to compare base-NUMAB2, pghot-hintfaults(NUMAB2) and
>pghot-hwhints (IBS Memory Profiler). I am still experimenting with options,
>placement etc but here are my initial numbers:
>
>Non-Overcommitted case: XSBench working set fits fully within toptier but starts
>on lower tier before the measurement phase

Those are nice numbers, but I don't think this is the methodology to use...
It is more representative for the workload's working set to be > total dram and
therefore spill into slower tier(s), instead of artificially starting in the slow
memory and moving up. Do you have data for the over committed case?

Thanks,
Davidlohr

>(XSBench -s XL -g 238847 -t 64 -p 60000000 -l 34, footprint ~116.56 GiB)
>
>			Runtime (s)	lookups/s	Promotions (pages)
>base-NUMAB0		498.6		4.09M		0
>base-NUMAB2		422.4		4.83M		30.5M
>pghot-hintfaults	329.6		6.20M		30.5M
>pghot-hwhints		109.2		18.69M		2.7M
>
>Same amount of pages promoted by both base-NUMAB2 and pghot-hintfaults but
>runtime is better with pghot. This could be the benefit of async batched
>migration showing and no adverse effect of losing cache locality.
>
>pghot-hwhints shows good results. As I said this is just a first peek to the
>experimental numbers, I should have more concrete numbers and conclusion in LPC.
>
>[1] Kmigrated -
>https://lore.kernel.org/linux-mm/20250616133931.206626-1-bharata@amd.com/#t
>[2] IBS Memory Profiler RFC v0 -
>https://lore.kernel.org/linux-mm/20260924062206.319314-1-bharata@amd.com/
>
>Regards,
>Bharata.
