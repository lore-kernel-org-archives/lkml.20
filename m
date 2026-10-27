Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793070941;
	b=ec+o2eLeg9NQbfsOm/i24S+S17Ja7A2DoirLmhxebtna4eTZdc447QF0ifHgWUqRaGe1
	 PR7biFh35C5jno0VExBRi4M/003b/ACr5MPnebsXFsc9pA7MtSGt71RYXiD8T9ZO2JhPF
	 8MSbc35AHOP0F18bz/f7buR9vjmk8F0fTfEST7tHMmeX4cbJwrYQKP2tnzL5mZx03rogb
	 PSp3B0xXC8EMLBkIYfLzcbjOkWMUSX8Bd/wmJQLj/J7u9l4vIPsjtbw9SlUsWXzuZFjgK
	 p33Ovd/yxIIrw79XDj1qkpz/6ALl3mskRQCzuNkOWAW1f+2zxI//ZFxct+K7QAfBXUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070941;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZMcqxqEdxhYm9DJv8CiGnoIvH49x6j3ASsael4JsugA=;
	b=tLu6x0yuxPMPByMiiZFdcuWgX1xXqTd7mcbO7Gu9Bwg1rfgm2gMTKyjVkSaRbaAY3VEw
	 hf3Q+mwhORVqS8+PijFMkXhkiubu7ufoWfH9yGAzYFWhZBJgy5wB4xxtBgvZgW/ZbNDSd
	 S0Q7m7ZMGxPK75i0OcznTWFuJbRZQxLPazSvMU0G6mJ0TyNAFgNOC4iAZcynlGm7PK7lB
	 VOoKwLnTOwbBKP8If5szOBLaw0hMv3kgKD87Grl429NzciroPGB5qVf+5zOYdvMNXijCX
	 g3j50nKApbts1+GIhhBnLz5llduhzQ5x4Fgo7ulRjUggfSTv+4JCO55S8kD59d0ZzhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wkYZ6et9;
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC45606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC45606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wkYZ6et9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tehtJZH8LWnxAEOv5ZDaiuGWrUe05hqpLq0Cx1KcqRI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793070938; v=1; x=1793675738;
 b=wkYZ6et9tfRRLnN9hM1M9EQHJjnPf1EeG+ZjhGUj93jPcpRGthVaiYzt7y5SuV/1lTiu47JO
 K/SPcaoQuKDIJzCmuh8DN+IJ+BpRdcWNIU0LHFA5tJy5Nb+/FE2LkYDPVHjm4ID9CMZ4QXGXmZF
 bJ4Iycg7ZU4tU4Y4ERBBo0o8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aeed83f3aaf06eae;
	Tue, 27 Oct 2026 03:15:36 +0000
X-Mizu-Trace-ID: aeed83f3aaf06eae
X-Migadu-Flow: FLOW_OUT
Date: Mon, 26 Oct 2026 20:15:35 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Tony Luck <tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Newman <peternewman@google.com>, 
	Meta kernel team <kernel-team@meta.com>, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] x86,resctrl: Read event counters with an IPI when
 the read cannot block
Message-ID: <auAOCnqJFTMQ3ZdD@linux.dev>
References: <20261020151352.2346257-1-shakeel.butt@linux.dev>
 <c96fb51f-9ab2-42ac-81a3-a5e49c87c2b4@intel.com>
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
In-Reply-To: <c96fb51f-9ab2-42ac-81a3-a5e49c87c2b4@intel.com>

Hi Reinette,

Thanks for the detailed review and feedback and sorry for late response.

On Wed, Oct 21, 2026 at 03:58:38PM -0700, Reinette Chatre wrote:
> Hi Shakeel,
> 
> On 10/20/26 8:13 AM, Shakeel Butt wrote:
> > In the Meta fleet, readers of the resctrl mon_data files often sleep
> > while holding rdtgroup_mutex. Over several hours, a lock profiler on
> > several thousand hosts (almost all AMD) caught:
> > 
> >   - 96,368 reads that held rdtgroup_mutex and cpu_hotplug_lock for
> >     17 ms on average and up to several seconds, mostly sleeping.
> >   - Three different userspace applications [1, 2, 3] doing these reads.
> 
> This is very demanding usage of an interface that cannot and has never 
> intended to be fast.

I think I agree here and I should have been more clear about my motivation. The
actual issue I am trying to resolve is that one of the reader of this interface
(actually below) is very critical for reliability of the system (or actually
observability) and we are seeing multi-second stalls in that daemon on this
interface. This causes gaps in our observability into the issues.

Also I think the read rates are modest. Below reads the whole tree every 5
seconds and scx_layered reads one root-group file per domain every 100ms.

[...]
> > smp_call_function_any() fallback. MPAM and other architectures keep
> > the old path. Peter Newman posted a similar change in 2024 [4].
> 
> Did you consider the thread that followed that proposal to learn why it did
> not land? 
> 

Yes and I think the problem I am tring to solve is a bit different. I am ok with
spending more cpu cycles in order to avoid critical daemon getting stuck behind
lower priority readers and may get impacted by scheduling delays or priority
inversion.

> > 
> > Results on a 316-CPU AMD EPYC with busy target CPUs, and readers that
> > copy the fleet agents, per 60 s run:
> > 
> >                                        before    after
> >   hold time per read, average          350 us    4 us
> >   hold time per read, worst            3.4 ms    109 us
> >   time off CPU while holding           9 s       0
> >   one pass over 750 files, average     360 ms    7.4 ms
> 
> The numbers make the contention clear. If I got the math right the "after"
> is still about 10us per file and with 4us spent holding rdtgroup_mutex there
> is still about 6us per file spent outside resctrl. I expect this is
> taken up by the syscalls, the various kernfs allocations to manage the read
> cycle, also a seq_buf allocation of a page (just to return a few bytes of data).
> 
> I do not think the 750 file example accurately captures how "bad" things
> can get. From what I can tell this proposal only *slightly* adjusts the limit
> of how many monitor groups this deployment can support.
> 
> My guess is that the 750 file example looks like possibly about 25 monitor
> groups with three events each monitored across 10 domains.

Yes you are right. The patch does not change how a full sweep scales. It is only
changing the potential hold time of the sleeping locks and today it depends on
scheduling on another CPU which introduced a lot of uncertainty.

> 
> The "after" value indicates that this deployment can now support more monitoring
> groups. For example, 250 monitor groups with a pass over the increased number
> of files taking about 74ms.
> 
> AMD can support 4096 monitor groups though so while this change is undeniably
> an improvement, it does not address the foundational limitations of this
> interface and does not enable this deployment to use full capability of
> the systems.
> 
> If the goal is indeed to obtain accurate monitoring data at regular
> intervals when using the stated hardware at its full capacity then
> I would suggest that you consider the per-group rate files that Peter
> settled on per
> https://lore.kernel.org/all/CALPaoCgpnVORZfbKVLXDFUZvv8jhpShHPzB3cwdLTZQH1o9ULw@mail.gmail.com/
> 

I will think more about rate file interface. It seems like Peter has offered his
prototype, I will take a look.

> I actually cannot remember seeing an update on that work after he posted that
> message and my assumption has been that that is what they have been using since
> then.
> 
> Essentially the solution builds on the monitoring data already collected by the
> per-domain overflow handler, it turns that data into a rate that user space can
> read on demand without any IPI.
>  
> > The cost: interrupts are off on the reading CPU for about 0.5 us per
> > counter, and up to 131 us for a root group read with 128 MON groups.
> 
> 128 MON groups sound low - it looks like AMD has 4096 possible MON groups.
> 
> Interrupting a monitored application with interrupts off for so long
> is significant for a fleet whose product is the monitored application.
> 
> > A reader that runs every 100 ms used up to 29% more system time,
> 
> Is it really needed to get the data every 100ms? 

Most probably not. I have to check with scx_layered folks if they really need 100ms.
However below and dynolog reads less often and are impacted by stalls on this
path most of the time.

> ...
> 
> As I understand this patch slightly moves the needle on how many monitoring
> groups this deployment can support. I do not believe this patch enables this
> deployment to support all monitoring groups possible. 
> 
> Please do consider per-group rate files as discussed in the thread around [4].
> 
> Even so, surely this patch improves performance under some scenarios. We could continue
> to consider it if you still believe it useful.

I will and I still feel the rate file are complementary as the existing tools
use the mon_data files and this patch helps them.

I will address all of your suggestions/concerns on the code in the next version.

Again, thanks a lot of the detailed and helpful feedback.
