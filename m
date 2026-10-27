Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116177;
	b=CW9tHX03iR5xTWD9yYdc7410qYEDbCb7a0oID/0mIjZVzMv5tyFF8xUqfpuc1FmHCUyz
	 SPPZu1w5+C90eM+OgUOZn1VHzeKfCoGzc/bHslLtZZFLs6byHQa5cZeTO8fBmtrnur+Sa
	 YyQsKgGpZKit9RZm5JY7fMFQhnRtZNdRAKfXOyOd9O22xzSADe+OdtfVzFiTBBBFwJGeF
	 HbFeBueUiNCjUhWxx7IC5n9AoThEks4bBjJzw+t7J7UdqvwbAeC7FNC0r7Wh4dpifX03v
	 Sesa2mLF11zK9Rh9UWN9xOP6OrYRWAlm1LW4UuPxf6wr1Seq2KI3YmXvSUpVvbSdciQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=1KBHB8+qa4NlnLyGzz+b6HJfV/xmDramajBB5F7wR4s=;
	b=NMMoqPSv0/iS7QW3+em+8LqyoLN8XHwX4ZRIyzXrbyPvb/HTi+ezQaj8UnDySa7/0IBL
	 fsZ8iA4GP7PX0t+qWKDvGcxgIfogNa/y8YLu/UZo4yCHo9yx0Bbkf9mxJw47w3sODcqUH
	 W62SMyRtWhwLGHNceOcalIUt/9L0T/UFf8Csp7IcO5fd683LURpRyH8xOC09XBjIlGXXD
	 lfrT66grMdSXoavDX2BzAo9HffEvviQcD9D267nhFsHb6D4eCABBOdLIoc3M7pT63e6fI
	 chps/D6ZEiTJZCO4KBimTxIczeby/6N7baiKcpA6+0VHRbsqZbSOrwamDRThQPLkPDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TZ7opDRA;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0514F606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0514F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TZ7opDRA
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5363c8de563so1092291cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793116176; x=1793720976; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1KBHB8+qa4NlnLyGzz+b6HJfV/xmDramajBB5F7wR4s=;
        b=TZ7opDRAxn4wTrOy1fwRQPp9v34MOTbHLGoONT2tM1soAOn/rIkDZ8/+ZZ9R0KOb/7
         PN19QyA3D2tXcltt8/6aZMDGteSPR/MYIxaK08sL7MJ2stAkP3mMMWMC3JRtVoPr66Zj
         u2DVJpR7m5RR4G0bcKy1mFOLHnqjzoeusG8cZVOipTXd72nx11qjlhQPr5bz/CXrfhQm
         FxdYgabYpdaJF+nYMuiaNoT2IvmcF43MxYfyqfc+XU5uDLfERb8EeqtwdDGNWxFOHiVc
         F7R+KnO9W+T+NdxU4kKJG3hSi5PP+ah2YqJp78xvPzxlrMapEc2uZQZ/S3Ygj79TcDNa
         6+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116176; x=1793720976;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KBHB8+qa4NlnLyGzz+b6HJfV/xmDramajBB5F7wR4s=;
        b=Kc6VXIUHOm4UXevEjLcMSlfuILtSIXnDHebHw8xMLiuDu8cru6EcZ02EBdDBqtSjic
         Ne+H78XQePsQ9vtzg7suQG1p7+AZkPpq19eQgnKVo6S0Sj5oR+mOhg2ZFWFT/JSmz1c9
         w6wTeorFjXnP+9CBaUpde+RqTMwJyU6hKs8tz+Vts/nQtQXvIMrAy9SMpn9tmRwvkFTk
         AAbztYeiND4aRtP/7/ztH9l5IRk8vp05DPRL6l9tIVJ6CcYvdjgI4iCiS6p9at6krurU
         s21RrTo/lqQXmLl2a0jJjyIk+H+PoytUo1L2z4YlfsKpilsQgxJk2LNW0MxZ8y3OOTcv
         +VYw==
X-Forwarded-Encrypted: i=1; AKwUvBzH3zTrFaH1/fS5CTdASwe6fgKXQ/rF5AfoeEO0h/EwW78KArRh5auVmz6fIFnC1FrPUirKmspA6GLJFyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD+lEEDzXoq7dlAppWsFtZIoLAYjq8L7rT+jMmaF367z3eDoOG
	YH3RrlwHBLg4Nq6GRdAsZVV4mbWcvdWEahwd2LJKd9oLkdx02ewgH6gsh0GcHNPguIY=
X-Gm-Gg: AYBFou323P8CXkfb5gd8cWtuz+xQ1l5AjTEkqeEnhR2btryYevp2jLuzsKoGDDPF2Un
	6SMctRK1wJTnPfkx0GIvYhlDKPhQ1tnm62nkSvJZlQD1j7lmxmopbOL3V+xrW9bbF+m6fmhX/S2
	ivnhlQiBjsuC2efP94DWN5Z1hNm59AFr7EOXLDAjiFUeXAYUdY3RWvC5zC7ksb/zLXlWMgPA20I
	JHe4iBJR3VPhhnq/j6fCNzDDYJXjEozrIDbOPw7NAiuxWyMjA8MOBmHKj4GcDYW0SM//vRwD30z
	k9ZoQKWkL6g5GFu00MiEIAP898AsWbvlbWEtMZsb+I/z2MOSyKhwmfM+1HFLfVCsMvX83dTLctx
	TyBwc6DX/G2OtPr2FdyXnjl+4ZlqzCdGUmG4X/tRKvwuWwnLDD9MbAsOBmL8BeAirVUjORrQkea
	J3+ssgJAW1VjY92GV0xMJfDItU1AuycuRzgpqpTiPLDf88jaRXCZOnXsEjmweefCtyW8orjRTvM
	eJAcYFPPM1yDQ8Qf8IMXqJRwaJ9dWC1P6HP7Q2aMShdyir8bitluCo4cq+Z6zKfD2OM6gn8DzzQ
	jq/O1pji/nUm25Q4yn/KPOKJyaU=
X-Received: by 2002:ac8:5709:0:b0:535:1368:4582 with SMTP id d75a77b69052e-5383b572fa6mr173122891cf.46.1793116175615;
        Tue, 27 Oct 2026 08:49:35 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47ce49d9sm106169096d6.45.2026.10.27.08.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:49:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/6] mm: fix pfn walker races with memory offline
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 kernel-team@meta.com, akpm@linux-foundation.org, vbabka@kernel.org, 
 surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
 hannes@cmpxchg.org, ziy@nvidia.com, linmiaohe@huawei.com, 
 nao.horiguchi@gmail.com, ljs@kernel.org, liam@infradead.org, 
 rppt@kernel.org, osalvador@suse.de, muchun.song@linux.dev, 
 iamjoonsoo.kim@lge.com, anshuman.khandual@arm.com
In-Reply-To: <1c61eeb7-5fad-46e5-9643-e99050b9042d@kernel.org>
References: <20261027042204.3741307-1-gourry@gourry.net>
 <01d7d54d-0047-4eb6-a1d2-5b3f113f26cf@kernel.org>
 <179310071902.664110.12994053710961856591.b4-reply@b4>
 <9051ac3d-60b9-4ed2-b781-b7191898bc83@kernel.org>
 <179310895201.1491991.14362391061932133491.b4-reply@b4>
 <1c61eeb7-5fad-46e5-9643-e99050b9042d@kernel.org>
Date: Tue, 27 Oct 2026 11:49:33 -0400
Message-Id: <179311617372.2530325.90240880272181996.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-27 15:25 +0100, David Hildenbrand (Arm) wrote:
> On 10/27/26 14:49, Gregory Price (Meta) wrote:
> > 
> > while these are ai-generated, I'm not posting untested, unreviewed
> > schlopp for the sake of getting patches upstream.
> 
> Appreciated.
> 
> For this long-standing considered low-priority thing in particular it is
> reasonable to go back in time, see how often it was raised (quite often by me)
> and how often it was actually reported (I found one case).
> 
> Then discuss the high level design in more than a single sentence :)
> 
> Discuss why we are not using it for other pfn_to_online_page() users, how it
> interacts with zone->contig etc etc.
> 
> There really isn't a lot on the design in the cover letter.
>

Fair, there's a mix of design vs firefighting tension going on here.

I'm trying to get out ahead of a rapidly evolving scaling issue before
it becomes big.  But I will admit it's sometimes hard to even figure
out what questions to ask without posting the wrong patches first.

(Cunningham's law :P)

> > Some of these don't show up as crashes but instead as hung offline
> > attempts (GFP_KERNEL landing on movable).  That shows up as our
> > hypervisor just failing to overcommit / guests hanging.
> > 
> > The compaction/alloc_contig bug is one I've seen in production.
> 
> Right, but I suspect that's "[PATCH 4/6] mm/page_alloc: don't undo another
> isolation in alloc_contig_range" which is *not at all* related to "mm: fix pfn
> walker races with memory offline".
>

Ehhh... i'd argue it's the same shape.  But i'll concede some of these
could be pulled out ahead as you've said elsewhere.

> > skippable side note on virtio-balloon/mem:
> > 
> > I have some improvements to virtio-balloon and virtio-mem that allow for
> > handoff from balloon directly to mem for hot-unplug without having to
> > drop the balloon, but I haven't posted those (and we don't run those in
> > production, so this is not the nexus of crashes).
> 
> Do you mean free-page reporting or actual balloon inflation/deflation paired
> with virtio-mem. I hope not the latter, because that is just disgusting.
> 

Actual balloon inflation/deflation.  It is disgusting, but it's
effective.  Right now we use hotplug at boot to minimize the size of
cold machines to avoid thundering herd issues, and then add it when
they actually get allocated for work.

At runtime we use ballooning to reduce a VM to its actual RSS based
on PSI feedback (see: that virtio stats extension i sent you some while
ago), but would like to use hotplug to give the host a defense against
a storm of deflate_on_oom scenarios across a large number of guests.

Basically using PSI stats we can make guests do somewhat aggressive
proactive reclaim on without having to build any new tooling, and
while being able to back-off aggressively.

Free-page reporting is also on by default, but this only helps you if
your guests are being extra nice about things.

(spoiler: they're not! they're greedly little imps! :D)

My experiments made balloon prefer to try to reclaim movable regions
in contiguous blocks, and then just hand that contiguous block off to
virtio-mem for offline without having to drop the balloon.

tl;dr: This seems effective and works quite well.

I've become a little confused as to why virtio balloon and mem are
separate entities when they could work together this way.

Haven't had the time to read up on the development history.

> > 
> > Agreed.  Although I fear the structural fix for this will have uglier
> > performance issue than we think.  Then again, maybe it doesn't matter
> > (if you're doing a PFN walk, then you're likely already doing something
> > stupidly expensive).
> 
> Which areas are you mostly concerned about and from which piece do you expect
> the overhead?
> 

largely the zonelist iteration - which looking back through history 
has already been "optimized" multiple times, only for those things
to introduce more bugs :\.

The zonelist races seem more ammenable to RCU solutions than the pfn
walks.  I'm not sure how to safely quiesce every possible PFN walker
without atomics in their fast path.

> For "broader" things that are not just a simple pfn_to_online_page() user, we
> could also have memory online/offline sync in more efficient ways using the
> memory notifier.
> 
> It's also tricky, but maybe for zone->contig + compaction the better solution?
> 

This seems reasonable, I was trying not to schlopp you with a half-baked
architectural fix and instead use the available tools.

But maybe we should chat (after the window).

I'll try to be on IRC more often.

> > On performance:
> > 
> > I've been hammering this with will-it-scale and a bunch of workload
> > tests on a variety of hosts and have not seen any obvious regressions
> > outside of powerpc (which i can't test directly, but SRCU-fast requires
> > atomics for powerpc from what i can tell - so it will eat overhead
> > without a fallback... if there is actually any hotplug ppc hardware out
> > there to care about?)
> 
> So the big problem is the overhead on the read side for srcu?
>

Yes - but specifically this affects PowerPC because it:
 - has NMI
 - does NOT have NMI-safe per-CPU operations
 - supports memory hotplug
 - uses atomics for SRCU-fast

So using SRCU fast in these contexts is not cheap.

For what I could measure in QEMU, the atomics on PPC seem like they
could be significant (15-20% overhead) in microbenchmarks.

Hard to say what that turns into on real hardware.

I implemented a fallback solution for those architectures to just not
free the zonelists in this case.  They have to iterate the dead zones,
but it's a much less overhead comparatively (<1%, but measurable).

For everyone else SRCU-fast is imperceptible overhead.

> If we can find something else to suspend compaction, we could maybe switch to
> rcu for the remaining cases.
> 

Is long-term compaction suspension even safe? I had to make COMPACTION a
requirement for N_MEMORY_USER_NUMA in order to not generate spurious
failures due to fragmentation.

~Gregory

-- 
~Gregory

