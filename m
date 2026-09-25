Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755623537FD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.218.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302817; cv=none; b=cqZr+P7X+Dffvi8XtzerZ02q4mDJ6qMi0i9X/FubvbN3vv7DzI0MPTvw/FctFYOk/PVzgfMSGe8ZbJ4caieKJCbxd5UCs1zMPRdMsEPbHs9ZbdNPGarL1huT8IQA5Ftfxd/HFXq7m2RbHxJEDHuUSn3zM9VuQWqlq+to+iC8q0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302817; c=relaxed/simple;
	bh=uNvqXtUUkiWSofVJtjxDHYlxLFgw9YkSTv1n3ziPnTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRNYnr1Wm5WfLrJUdKdHz6VGIz2UGJnfAqiqo66kF3mfgfO+81kCyASUDq4rXnxxFf67Ff372sjqqze9Rp91W6Xr2Iwzb2LR0VuDI99D8vmzzJXFl9e2qwtGm0ndwa3khdM/JDz9Fymiba8eNqZ0FPRlaXYMfekUDa8XGVAsIks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=hAMu6hkf; arc=none smtp.client-ip=23.83.218.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="hAMu6hkf"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C72233E1FB5;
	Fri, 25 Sep 2026 02:12:31 +0000 (UTC)
Received: from pdx1-sub0-mail-a247.dreamhost.com (trex-green-6.trex.outbound.svc.cluster.local [100.100.66.64])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1D8BD3E1F9D;
	Fri, 25 Sep 2026 02:12:31 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Battle-Callous: 7196804e2346228b_1790302351581_998903741
X-MC-Loop-Signature: 1790302351581:2710523619
X-MC-Ingress-Time: 1790302351581
Received: from pdx1-sub0-mail-a247.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.66.64 (trex/8.0.2);
	Fri, 25 Sep 2026 02:12:31 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a247.dreamhost.com (Postfix) with ESMTPSA id 4hrZ3K2pmmzyrG;
	Thu, 24 Sep 2026 19:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1790302350;
	bh=djP5XwafCJ4cxBiTvz9MUWwQtYHkRPgJgZ89NauuvtU=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=hAMu6hkfDkFG2sGtKgJUR6x7TvXaA3XybQus6zjPGz9VFNcIW7t8XUUdrqX1OKRYz
	 nM5UTYkQQuwfkaNcmQZFlUKnwOF/RxPFzFomIY84Nj5u4tp2nXBmx0nCfRcsby2Vrs
	 2ZxdDjuNozBGTMHqt231JsCFHmbhKF+xKZakbXQ7FG2W7scbEt2FpyOSsCofD8cjBI
	 fc8VKBC0/wbB2cOgwynv+w8c+yI639oEUYuairqMoyUEP0XDBdU/NCmaRawkq0KY/b
	 97IrhjjjR1Ag72f0WB+DTGbwbu1rtFFyQvS7ZOxYleaYobkYKAh0JyLKnpA/VYFhlP
	 uRXf4PhqTRtWA==
Date: Thu, 24 Sep 2026 19:12:26 -0700
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
Message-ID: <20260925021226.52kpnmvfylw73dz4@offworld>
References: <20260728054356.291998-1-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728054356.291998-1-bharata@amd.com>
User-Agent: NeoMutt/20220429

On Tue, 28 Jul 2026, Bharata B Rao wrote:

>Performance summary
>===================
>All results are on 3-node tiered systems (DRAM top tier + CPU-less CXL
>lower tier). Speedups below are normalized to the base kernel with no
>tiering (NUMAB=0). Columns compare mainline hint-fault tiering
>(base NUMAB=2) against pghot in two modes: hint-fault driven (pghot-hf,
>NUMAB=2) and HW-hint driven via the AMD IBS memory profiler (pghot-hw,
>NUMAB=0, no NUMA scanning). Single run per config (abench is avg of 3).
>
>Benchmark      Metric (higher=better)   base-NUMAB2  pghot-hf  pghot-hw
>-------------------------------------------------------------------------
>NAS BT (MPI)   Mop/s total                  2.26x     2.26x     2.13x
>Graph500 BFS   harmonic-mean TEPS           2.64x     2.49x     2.68x
>llama.cpp      decode tok/s (tg128)         1.09x     1.41x     1.21x
>Redis+memtier  ops/sec                      1.05x     1.05x     1.00x
>Microbench     completion time (1/t)        2.41x     2.40x     2.35x
>-------------------------------------------------------------------------
>(baseline = base kernel, no tiering = 1.00x)
>
>Summary: pghot hint-faults reproduces mainline NUMAB=2 with no
>regression on every workload; pghot HW-hints/IBS matches it mostly.

The IBS doesn't seem to bring anything to the table, other than just
serve as an example - we've discussed this in the past this. And for
NUMAB2 I would expect this to be the very best case in that you are
not suffering from loosing the locality info.

This is a lot of added complexity and code just to break even. And
hardware sources should really outperform NUMAB2 for this to be
worthwhile, methinks.

I know Joshua mentioned some improved PSI by doing the promotion async;
which makes me wonder that perhaps just a simpler promoting kthread is
enough, so NUMAB2 just kicks the migration to it and not done in the
accessing tasks' context etc. And Gregory also recently improved this
path vs NUMAB1.

I mention this because I have integrated the chmu as a source of
hotness for pghot and this was tested on a real device vs NUMAB3.
This was based on Jonathan's rfc for the perf driver, only that I carve
out the first chmu instance for this, and leave the rest of them (if any
for perf).
For example, 'XSBench' improved by a factor of ~2.7x (I would like to
report a wider range of benchmarks at some point, but this is what I have
now). But a lot of this bypasses most of this framework and just piggy
backs on kmigrated moving memory. chmu does not do well with
pghot_record_access(), which is designed for sampling... so I just set
MIGRATE_READY right away. I also added a pghot call/api to make use of
the regions chmu deals with instead of per access/page. The cxl driver
just takes the dpa range given by the chmu hotlist, coalesces into adjacent
hpa ranges (just 1 for the case of no interleaving) and feeds that to the
pghot subsystem as a list of these contiguous physical chunks ranked/sorted
by access density (accesses per page per second, so a large lukewarm region
and a smaller hotter one can be differentiated and promote the latter
first).

So perhaps any mm interface for this stuff should just not be designed
around sampling, and instead proper hardware sources?
A lot of the complexity in pghot can be removed without this imo (per-pfn
metadata, accumulate+decay phase). Of course we still have the problem
to evaluate the cost of replacing a chunk from the top tier(s) with the
what the low tier is reporting has "hot". And this is particularly true
with chmu with limited full system memory visibility (as opposed to IBS,
for example). I don't really have a good answer for this, other than the
user could use proactive reclaim along with the per-device tunables
(ie unit sizes and thresholds for chmu) to configure things realistically
for their use cases - prob. easier said than done.

Anyway these are some thoughts prior to LPC.

Thanks,
Davidlohr
