Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C964D5980
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350909; cv=none; b=DHaugWo5iRRce/cGec2KXhtlnviFcAP9ZzSUM8IOh2OBLWH7Em5tUNw8NNz4ytAOM4pOm72wD1IwZABICCTLMGyfIiuAK2vyr3ZN/ij8Hu0PPGLM8xMWFl0KmspOP9JceSETzc5fMsckPPNzINxgS5psec5tKF/X9giHVKLtbfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350909; c=relaxed/simple;
	bh=8VXDxwsX1o+yHZsWaTKgQc5D6VhgVDIKq1qYb3Phszg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbLtScygp7g7MFXbM8yueqAA4eTPXZw7JesW7/LPGwilK7ku8S7HhDNi5b0FMB+Bv+yfEzB6Rxl12d7cjIUGykkKPSLScuqcvYa5eZhU0QnUe7dnBDj5wyVOlmusjlLM/Ly5GbxwfLkHcNMr3++rWX1QHf2mNFGOzkPONykEQmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=W/SWaEgH; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="W/SWaEgH"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910ca5aa8so96021285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790350899; x=1790955699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIiTdCRmfuDk3fuKkf/gmUjp83CRXZD1qvI7wHqMTnI=;
        b=W/SWaEgHInd/0mHvagT9NV4aEKHu+/uW2rcZcmWi13ixrmP6t+2dt+5Atx7FeNXNVz
         G6H2ErPZjBIpMiqndDrwcj1HM8feEa5D2VfHxAiBxof4zlh3qf3xrwXsMS5nNkMgYzjU
         yxSQw77STHkHY6dE8KZjC5So34Hx5a007+e21gGruB/R0G9mTyXBlbusuZ1hkjm0o2ss
         bH40WLDBqLs6Y6PPyJBn9QXs9poTe6hz/HbyjlDCbisMvgiaDVnNiqTn1tybw/juEoWc
         S5jLD+nbaBl/TXKZsanyZDmAPJ7w0ZFBHlaxjjcdJ9+pJBZmrPfACAPAsvIPoYCArPhe
         Xq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350899; x=1790955699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIiTdCRmfuDk3fuKkf/gmUjp83CRXZD1qvI7wHqMTnI=;
        b=ntJJjszVuiShZO3W1LO0taGkc5PQ5NRGAkChNmAg66TjcnXUOZUKMHwiDR/vZ5RxTd
         9Y7t3LsAT4D5oQM8MaSK7ZzaSEc9DWIcSyrY70Kdigm25YdRYvd+GqVIBDeAaSyhFKq3
         0inD0qWDURPr2x8SUt61SYosWvGs43CduW98AfTc0Rr6ZIWEC/I4nElPN7dIgYJ8S62Z
         C4xCBpGbZ2IZJ0HpIgjs9Uw9qcopZw89RR1bGyIutXDXbylFX1hQyWdwJpTmhHXYWFjK
         wYFd8eQZmYscBRCLCJzNWIm0OGs+xqrqyOuK69owq9Jsiy+BirrCe9LQz9PyjheBTZg/
         uwig==
X-Forwarded-Encrypted: i=1; AKwUvBxfO4EVhTX8yUK1pAa5FwRUn+E08nYrM/9D1uCWLbDtqrJcpBDT1YBSr0Y8dCqhXamh0Yw/ie46r91KRc0=@vger.kernel.org
X-Gm-Message-State: AFuF++kGP1iKy9Ldm5gDddEEqe0HmGwIxFvs7WGHXmUNR5O6m2SGIhLb
	laBc82lrxLO4e366bVfv0ppz1XCSZPO1/8Ie1nhlRtzo1kwX9hIU5eOUgMbfMCX7y0U=
X-Gm-Gg: AYBFou3wegEd2/lmYTVp/K5NnW180eEC+WITs6fanhHw79eZdClKVNd5rv7BKbLpl1A
	aUzNxzGh7bEJO7QCCiHcESCimiwhDwWWsvzycAN1a6nkF4wSWBAsLbcxqvKsMOtSoAUKsVtsAkd
	4uDXyuldMfNPxmaDVpkEBc2Oi6R1enAlcgzS5JxQVsB6kmU4xzyLaAwuhfplgulCu6rxYmKgQrd
	wgkOgxmNwVWtKHW2/3TK2zQOiW+JsJtc9cAdCK84nvKubbwpOW5F80KsJBzoPBWp1XZAsTtaucg
	iJjeZzX/eJafiglFlZyqixI/o5GtsBq+BsMEbLRrHc5ctS3PZYBMeda0FDc48WFYY+Mwjkr+fkV
	dusYBFhqBHP2n/2EJUtcdfseGdiwkUL+Zwfiy6e7JnVjo3CxV7w160Ofe97cCxk68bsF1z/W05U
	+6EDwX/bq9S3ETnvuxfO/MyY0GPCLPxXDCVsTRcwsvMWwA2JGkhg4Y+z/DHEDrfut+8+OY
X-Received: by 2002:a05:620a:2720:b0:939:feaa:949c with SMTP id af79cd13be357-93c43ca0f79mr497616285a.36.1790350899351;
        Fri, 25 Sep 2026 08:41:39 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c44652fa3sm205736385a.4.2026.09.25.08.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:41:35 -0700 (PDT)
Date: Fri, 25 Sep 2026 11:41:31 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Rik van Riel <riel@surriel.com>, Baoquan He <baoquan.he@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Gregory Price <gourry@gourry.net>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <araWKyJ5MENBwXCL@cmpxchg.org>
References: <aqjcFb6MFNiA6n4V@fedora>
 <aqjpYHbZ14A8xRtK@fedora>
 <CACePvbUwTxcMPVK_1GAz5gPDdh0BV9JZSnKXaUFLqDHBzBmPQg@mail.gmail.com>
 <7ee199ddee81bf8026688def82f78ad9db09be9e.camel@surriel.com>
 <CACePvbVA+DnDJprMx3qOrGb98y1ORQ-LfaENy_Btfx3uW=E4eQ@mail.gmail.com>
 <f3ca71f1c561f28a341de0e5a1b3f24bd4da3201.camel@surriel.com>
 <CACePvbX5Oy98DygLZjC=Z03Lqb0nk50_OEKQCT9svbQOOwwDew@mail.gmail.com>
 <CAKEwX=Mv+tnL8K4rfPuof6mKaLQp=tqR_qjtKrtY0-5L85FLfw@mail.gmail.com>
 <CACePvbUF2QQMh_GiCNQn-RTmZNkkLWkmaHSYzdQwv2fupjNQiw@mail.gmail.com>
 <arUcil9kxUPiymXI@KASONG-MC4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arUcil9kxUPiymXI@KASONG-MC4>

On Fri, Sep 25, 2026 at 09:15:17PM +0800, Kairui Song wrote:
> On Tue, Sep 22, 2026 at 09:44:37PM +0100, Chris Li wrote:
> > It seems you are talking about a different topic: the vswap charging issue.
> > There is a golden rule that we should follow: don't break existing
> > users. At least with the same persistence, this rule should apply
> > universally.
> > In the swap tiers discussion, the UAPI was such a big deal that we
> > couldn't implement new UAPI. On the other hand here we argue for
> > liberally changing user-space visible behavior.
> > 
> > BTW, I already shared that changing swap counter charging will break
> > our and others' existing deployments.
> 
> Hi all
> 
> As I read the threads and try to clean up the requirement, just
> realized that I forgot and ignored something previously. I think I can
> share a few things here.
> 
> I also see that Rik mentioning that:
> 
> > It adds up anonymous, file, accounted slab, and
> > (after compression) zswap memory use for a cgroup,
> > and can be limited with all the usual cgroup
> > limits.
> 
> That's very true, and that's also the one reason we can't
> migrate some workload to zswap easily (at least yet) :D
> See below.
> 
> The discussion on this can be saw two years before (I know
> things are different for V2, so see below):
> https://lore.kernel.org/linux-mm/CAMgjq7AYA91f4g-bknUZOMg6hApTD-X5LqjcTBN2u-Lu8pjs+w@mail.gmail.com/
> 
> An minor update for that, memsw in V1 serves pretty well (we also
> modded that part and would try push to upstream if doable), and as
> memsw is missing in V2, we can still workaround that using
> memory.current and memory.swap.current. BUt missing the offloaded
> part in memory.swap seems a problem.
> 
> First a little bit off topic, I'll be really happy if we can make
> both compressed memory and swap as separate counters (I even once
> tried to implement a zpool accounting to account compressed memory
> in some unified way, but, well, zpool got killed before I post
> that :P), or at least a way to do that, e.g. something like nokmem.

Thanks for your thoughtful email, Kairui.

> Due to our real usage:
> 
> With compressed memory staying in a separate counter (which
> we manged to do that with ZRAM) the memory.current + memory.swap
> (or, memsw for cgv1) could be the exactly planned or sold size of a
> container, the scheduler (e.g. from k8s level) is fully aware of
> the packing rate of a host based on this reading. and can make
> scheduling decisions based on that. And can control it by
> adjusting the limit two combined.
> 
> But with compression as a fixed part in memory.current, first the
> compression rate is totally uncontrollable, both the user and us
> will be fully *unaware* of how much memory they can *actually* use,
> that makes the planning really awkward. memory.max stops being the
> bound of what we planned or sold, anything compressed lets the raw
> footprint go past it by however much the compression ratio happens
> to give, so what we oversold is bounded by the workload's data and
> not by anything we configure. We can substract the zswap reading
> though with adaption, however it's hard to change the performance,
> OOM behavior or reclaim behavior:
> 
> As you may considering compression is trading CPU time with memory,
> then two things here: the user could use more memory than we expected
> by burning the CPU. And, some users has a leaking application, the
> application could goes super slow or experiencing high CPU usage due
> to memory being compressed. They really just want to get OOM killed
> in time when ever the application leaks beyound a threshold (and
> yes that is a real and actually practical model for many applications).
> And, we can't simply disable memory compression for them.
> 
> In many cases we just want a best effort compression to make space
> for low priority tasks, and do not want ordinary containers to use
> compression at the cost of lose of performance. While still has
> a fixed limit as usual. So simply disable memory compression is also
> not the plan, we do need compression to make place for other
> applications, we just don't want their real raw usage to exceed
> memory.max, and we can dynamically adjust memory.swap.max to
> control the oversold part, compression or physical.
> 
> And this is not about residency, so memory.min/low don't help here:
> it's about overselling, and about not leaving a container thrashing in
> compress/decompress loops instead of being killed.
> 
> And if the memory compression is really fully transparent (not
> doable by software), yeah, that's great as there is nothing to do
> with reclaim.  But, for now, we have to go through page fault / folio
> allocation / map it again. So For example, if we already have
> memory.max == memory.current or under high pressure, then now
> doing any read from the compressed part would need to some
> require further eviction first to make place for the decompressed
> new data, this is not like any kind of "real" memory, something
> feels not right here.
> 
> Another thing is that I think we has been assuming that physical
> swap is slower than compressed memory, which is not always true either.
> They all need to be read through page fault, the page fault could
> be the real blocker here rather than IO or de-compression.
> 
> I also want to separate two things that I think got bundled together
> here: not requiring a physical slot behind a compressed entry, and not
> charging the raw size to the swap counter. The first one is great, yeah,
> and it's exactly the part we want, it's what makes compression usable
> without provisioning disk. The second one is a policy change, maybe it's
> not needed for the first stage, charging a cgroup for the
> memories it has offloaded doesn't require any slot to exist behind them.
> If someone wants to run memory compression with no disk at all,
> memory.swap.max defaults to max, so that still works fine, right?

I think what we found out over the course of this discussion is that
people have been using memory.swap.max in two ways. Regardless of what
we do, we will "break" one side.

(1) The usecase you're describing. Use memory.swap.max, combined with
memory.max, to set a "total", predictable footprint of in-use
application address space. You can mmap whatever you want, but the
number of unique pages you can touch is limited to this sum. And you
can control residency vs non-residency through the invididual values
of those settings. If compressed entries are not included, this
usecase will break.

(2) The use case we have. Use memory.swap.max to divide a finite space
in storage. We only have so much space on disk, and we need to manage
fair access. Note that this isn't about speed. We have a mix of
containers where some use writeback and others do not. The ones who
write back to the swapfile need to be able to get their fair share -
not more, not less. Including something that doesn't actually consume
this separate finite resource is also a behavioral change that would
break that usecase. And arguably it's a deviation from how the control
was intended and from the broader cgroup design philosophy.

I think we need to build tools to support both cases. But somebody
will have to change how they're doing things... :/
