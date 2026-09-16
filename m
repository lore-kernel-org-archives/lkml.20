Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1DC524AE8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569764; cv=none; b=VPwywUdv5pchdx3yLhkCv2J61RlDf6TjiITqxg6keEN+ucfjybUX93khJn+VZ0DgbdYNawUjXG/Zejx4QSwpwlXhJBKEMj+QP+XZUNzTKxoGZKP4/5WPwJ35vV6E2S51MPMjdrKM10z2YdL+AW7bnU2ge2o4PU54njwq7v5XUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569764; c=relaxed/simple;
	bh=Q9s4sEEri3oRIDOADPZxVwPNRw8PRSNPYg5PLYUT/II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/nJ+IjdjcBHm7Ok3vIfOrqNEBKIQEjHRsCuFsQ3R74wchNNaO8TZOsAmzlT6KhzounM8jhIVh4eROhjJnZPdEBZdFnKza1QJYE1tZlLGxAX6PWj139IWp84AKdutwomx/XajDB1ukvDXkqbEnBPwq5swqjtEpsfjKWwTK/R2CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YlVtYB1l; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YlVtYB1l"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-53122c5bbb4so10837391cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789569761; x=1790174561; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=APS81j5DoNNcu6pzB1xIdVlOym6nIXIYbB0pf6pRDP4=;
        b=YlVtYB1l+o1U4kuvnm2L9WsWnIGlPER7dV52fip1whNuoJBPhzHbh5eR5qO+2HuXe6
         UOGBH61elqKO5Tf6jSZIPLkQtPiez5xf5RN4UzdHCVHN+MNxyZSFaYmKcbrGQl51MGO3
         NyIv5i0nQo/JYMIaw3E5aOCHRMl7NrWkjeHbPWpz0aTzIFTTctqNLeRh0vfw4RE1vbmZ
         ge9rssmsIwuAZlShtBT6+KqVqvyHDrPPr21WOutLbjaNPx7Zbn4eZxJH3U0roilUPmqD
         7Slspjlqt7V++BDMWCL4BvJqij4GTfR6fB5f9jZV2DJoOnrvaYJ8VimWQt2I+lLSMX/G
         syHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569761; x=1790174561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=APS81j5DoNNcu6pzB1xIdVlOym6nIXIYbB0pf6pRDP4=;
        b=TKkK5bYOeSN2yQ6LD0GGiPc1HyNQPLc+IFX7EfIOtyQbDuTb5m7W+Sg/oW9DuAfKLx
         cHM/9QEwKKzkIw9kEqjmaIQ0skNqOK4k1Kq1e3NrWRnrUh/Oazds0k2X8SjXLmwg/PtY
         ZsaMFVL5SMKK2lAVPOCQvbSlW8OusiXLRnUa7lRhWMQuK8B3Yw8hZ2hbTzDF2ajjrsr5
         5K8tFEZyqMkkb5yL7ymUUB8yZwSZSMtEY4998fDLeO1EsyyenoZPHZzzFXBtzfFy76gF
         ijaAG6EB3W3aClz5gLEzRoodGvZxxB/tQlGPygGqq3/QHuO7xzwNiEer3BrugAeHfxBB
         iW5w==
X-Forwarded-Encrypted: i=1; AKwUvBx0SSMYGZPtFM0vk4pd33lH2tnz7VWw0p1HR/sZ8mpADo/iHCeV6QQeVzRBGs7/zwXDH6BsVnPnnjm4US0=@vger.kernel.org
X-Gm-Message-State: AFuF++kxmtHACjH1uusrgeBS2C2itgnsjH6KPo9dsY+uzFrpl9NufTgX
	zBSc+3NL8j6eG1XOxqBQ4M96/YKaTptxcZY2VeKmomYtPlV2PaMpm6hZrL6R+36xeOg=
X-Gm-Gg: AYBFou3hAQ2TDdVJxfdQeT8nhia8yFOXpPmqRMOwj0m9WkEdIulEUGznMSUA5Zhlu1N
	dXRWWRtby3lkjWXa5zJflVGtHB36VWSO/ICxvbHGUtzXq7F19hXEFA+9+DZZHj6BNa+Tn2VXZqb
	etFmMFD2Qdzl0lxSc81rJS9xGPKn1T7gDVw41ylOXokQHzLOl3hU9gHCLexFf7FqYceRq3gD2Yb
	RfrReWDSdprD09bem8l0ZRWbYWTmKr8dkklsLpppJgya9yGQ1l2J/TxbS0hNP1dWQFMRrC+q2cW
	DfaUZM4o5QFhKzfJ6rjI0L6hME+Wr8x69RWfzRrDT66ciV5fn2eZwpEv5gqlsIksIOemaLYlm5T
	OYiqyDA3Cn79T4n0RsVey8UtMX887cdOBzjT3yBZVP1QCHNbzV9BaeZnLP5frv1JwqmUMCPh66l
	q1/r+yyNTtkYGyqtAa8KOLbbL+a3m/L2bI/bJSceZS8h+L4XUXLj9V2ZJn8ScudDOS3ZQebwTEB
	v5aiWAgsH0mhLzz1TLnjVM/e8qPcLg2csO+J2MKET7BxnAmOhwSo/Y=
X-Received: by 2002:a05:622a:1312:b0:530:b2e2:d7e2 with SMTP id d75a77b69052e-5327f24d070mr45834991cf.61.1789569760741;
        Wed, 16 Sep 2026 07:42:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326208ea78sm25268101cf.24.2026.09.16.07.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:42:40 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:42:38 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, liam@infradead.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, wangjiexun@tinylab.org, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aqqk89oTigJ9LS2N@gourry-fedora-PF4VCD3F>
References: <20260912110832.3203902-1-gourry@gourry.net>
 <aqloB0zm3RjJ47m1@gremlin>
 <aql65IhMobL5Al9B@gourry-fedora-PF4VCD3F>
 <aqqTbGMJL86TzDrf@gremlin>
 <aqqbB_nFAOGenDhy@gourry-fedora-PF4VCD3F>
 <aqqjW5dpyznijYLh@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqqjW5dpyznijYLh@gremlin>

On Wed, Sep 16, 2026 at 03:12:53PM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > Going to spend a little more time testing and tweaking before I post it.
> >
> > I've been working on a making more extensive unit tests for certain
> > parts of mm/ and this might be a good time to look at whether I can
> > introduce a piece of it.
> 
> Nice, curious as to how?
> 
> Have you tried the userland VMA tests btw? Not tooting my own horn so to
> speak :P but it's nice, though it comes at a bit of a cost in how the files
> have to be set up...
> 

Yes, in fact I used that as a start for exploring how I might make other
components testable the same way.

"Stubs... stubs everywhere"

There's basically 4 testing mechanisms i explored:

1) selftest
2) Usermode Linux (UML)
3) Userland stuff like VMA
4) Linux Test Project (for syscall and ABI testing)

selftests are really limited and actually create a maintenance burden,
they're not real unit tests and are highly dependent on the actual
machine configuration which is super annoying.

But, lets take the page allocator as an example.

The only piece of the page allocator that "should" (cough, simplifying
here a bit) be machine specific is zone and node configurations... but
I'm not convinced that this should require a full VM to unit-test.

(other caveat: obviously some things like RCU and interrupt contexts are
hard in userland, putting that aside for now).

We should be able to stub out the reclaim calls and at least demonstrate
basic correctness for a combinatrix of commands into the page allocator.

Anyway...

I've been looking at how to use the VMA and UML test infrastructure to
stub out even more of mm/ and generate these kinds of basic contract
tests.  So far I've found bugs in a few random corners, but nothing
critical or reachable as far as i can tell - so that's nice.

Have made it compilable with ASAN and Coverage

The harness itself turns into a decent fuzzer as well for basic stupid
logic conditions, which in turn allows coverage and LLM guided fuzzing
into an easier task for any random kernel dev to start engaging in.

> I always feel like I should do more with it but don't have the time
> atm. May set the LLM on it though...
> 

I will keep quoting myself.

"The thing LLMs do is make the pipe dream of test-driven-development
 actually feasible."

:]

~Gregory

---


some stats from my infrastructure:

  How much of mm/ is testable

  24 of 130 files (excluding DAMON) — 30,108 of 187,486 lines, 16.1%.

  ┌─────────────────────────────────────────────┬───────┬
  │                  Compiled                   │ lines │
  ├─────────────────────────────────────────────┼───────┼
  │ page_alloc.c                                │ 8,050 │
  ├─────────────────────────────────────────────┼───────┼
  │ mempolicy.c                                 │ 3,923 │
  ├─────────────────────────────────────────────┼───────┼
  │ vma.c                                       │ 3,429 │
  ├─────────────────────────────────────────────┼───────┼
  │ memblock.c                                  │ 2,911 │
  ├─────────────────────────────────────────────┼───────┼
  │ util.c                                      │ 1,317 │
  ├─────────────────────────────────────────────┼───────┼
  │ memory-tiers.c                              │ 1,215 │
  ├─────────────────────────────────────────────┼───────┼
  │ cma.c, pagewalk.c, pgtable_move.c, +15 more │ 9,263 │
  └─────────────────────────────────────────────┴───────┴

  ┬─────────────────────────────────────────────────────┬───────┐
  │               Not compiled (largest)                │ lines │
  ┼─────────────────────────────────────────────────────┼───────┤
  │ slub.c                                              │ 9,933 │
  ┼─────────────────────────────────────────────────────┼───────┤
  │ vmscan.c                                            │ 8,163 │
  ┼─────────────────────────────────────────────────────┼───────┤
  │ memory.c                                            │ 7,603 │
  ┼─────────────────────────────────────────────────────┼───────┤
  │ hugetlb.c                                           │ 7,320 │
  ┼─────────────────────────────────────────────────────┼───────┤
  │ memcontrol.c                                        │ 6,756 │
  ┼─────────────────────────────────────────────────────┼───────┤
  │ shmem.c                                             │ 6,019 │
  ┼─────────────────────────────────────────────────────┼───────┤
  │ vmalloc.c, huge_memory.c, filemap.c, ksm.c, gup.c … │       │
  ┴─────────────────────────────────────────────────────┴───────┘
  The uncompiled chunk all need real folios, which is a problem that
  I haven't tackled yet.

  Coverage of what is compiled

  ┌──────────────────┬───────────────────┐
  │       File       │   Line coverage   │
  ├──────────────────┼───────────────────┤
  │ page_counter.c   │ 100.0% (119/119)  │
  ├──────────────────┼───────────────────┤
  │ numa_memblks.c   │ 99.5% (221/222)   │
  ├──────────────────┼───────────────────┤
  │ execmem.c        │ 94.4% (271/287)   │
  ├──────────────────┼───────────────────┤
  │ page_poison.c    │ 86.5% (32/37)     │
  ├──────────────────┼───────────────────┤
  │ numa_emulation.c │ 82.2% (199/242)   │
  ├──────────────────┼───────────────────┤
  │ page_alloc.c     │ 79.6% (1873/2353) │
  ├──────────────────┼───────────────────┤
  │ mempool.c        │ 67.0% (179/267)   │
  ├──────────────────┼───────────────────┤
  │ page_isolation.c │ 60.8% (118/194)   │
  ├──────────────────┼───────────────────┤
  │ memremap.c       │ 58.5% (137/234)   │
  ├──────────────────┼───────────────────┤
  │ mempolicy.c      │ 54.1% (735/1359)  │
  ├──────────────────┼───────────────────┤
  │ mmzone.c         │ 52.8% (19/36)     │
  ├──────────────────┼───────────────────┤
  │ shrinker.c       │ 51.6% (174/337)   │
  ├──────────────────┼───────────────────┤
  │ cma.c            │ 44.6% (206/462)   │
  └──────────────────┴───────────────────┘

  Aggregate: 4,283 / 6,149 executable lines = 69.7%.
