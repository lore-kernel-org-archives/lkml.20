Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D51D44F56D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142322; cv=none; b=JOTjnGJ5UqIYiTDyIFd0afQRTgzF9/zam8qiGFn7WxtnkewIWSPN+G4m2Tm47SSLtoxHrtCpqUmSQRVl3/aV4S8itd3/WX2XzBw9esRgt+pxEKyuXvkmrHsrO4fRaQTbD7pQjN41GAKSPWK+KIDn1i2nK9JaNVeaH509yFBGafw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142322; c=relaxed/simple;
	bh=2uDmgSD8vDZPuPUqBuj3vDEeSZOdzhg4YYIXxTjsH3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrE4FkJTj2GZpyXru8RXYZBY7Dgp0/iTnC9PZ6XHOf0K/wLOZpsQJM0oyszbUmOmtpdY8jDk5fXqCyv+cxCA3Y0Mte9iLqxf/r2tHvPrAr3RHdiPJXn9gbZktwGI4MsjteiPXm8EO206jKRi4VRsPzkzfrmqdizEFpA3Pj4lu+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Loj+n/1I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nBokoZMl; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Loj+n/1I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nBokoZMl"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 625251400169;
	Fri, 11 Sep 2026 11:58:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 11 Sep 2026 11:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789142319; x=
	1789228719; bh=SsR0HR0pw4kDSImLViPVSWsm/iy2iIyQ6XZ5SwWZypI=; b=L
	oj+n/1IcBV5tie3ucxFuz0Mq0YWToLY/MVqGmLm6ii17ZQU/gNJ88//SSWBbdyfc
	r577ztUjMOqBrzBuH0zV3z9/hATRnI+dH45sYcTTSPbLp7HepzEz4C18cwTHpA/y
	/pfci+MFrAMYVSU2NiC5qnaZpZ5otGXHw9Mns/VdAAql6R5S+eWYs3RtQF+u1jp3
	wQyhYim/xT6Tgs82VgEanlUOvS3Ma7L6A27IC6bCEr/X7gqd5xnl6n12I24P08Bz
	3tNwMS/qWoL8LKo2b5BRnr24ExSvfXbYcy5pfyJJ+pbTCBO+SSv5ZOmgLpUpQuhx
	A4Cnb61DI8yH12esD4emw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789142319; x=1789228719; bh=SsR0HR0pw4kDSImLViPVSWsm/iy2iIyQ6XZ
	5SwWZypI=; b=nBokoZMlEzRdfFPUxlPf7Vqb9NkuBzeXPOfLgLznwLCQhdxYjg2
	dA1gRdcmPfx3DCljiRkvQ1TY/vmmhC74pxSIu0NnuW4XlMi1joiOgvhPZlZs9jOS
	3LiegcM63Yw2fjDCcQqi9L9zOu2v54aThpkzUef+G7lmp+aPokyPJdiylz+Bcc5P
	lPqq5BzmWwNZjyq+e+hk7yg+t7cB+XO0nNUsWlO7KWFNsP4jOdqeyWEXJtu2zZFZ
	3k4PBnJp5/hpXtwmiUfLJLTt5O1Dqh8B24xJZGHfUuqAoHOFSM88DoCygItT5BmQ
	KHoUJjoNMzl+bJiGaBPLv5UUNPjlAj1lFTg==
X-ME-Sender: <xms:LyWkaklElL8-UqaR_ApPPDHUFDdoTSYD2eSVyKN4on9NekW9X10zPg>
    <xme:LyWkauo6_9fulllf-atV_oFqQO_f22akuVvMuAQhSWY5Za0YjCSKL5-8ywnoH42oY
    JjKkxEvcqVAZZtXcgEetL0gdXA0VmUvvqhIlidDHumVQYuzF-_7YYzTSA>
X-ME-Received: <xmr:LyWkag4eelSPg12kYSnFjvj-lWwecMqtxvW_fxPBpvIkBbAG1jOKw04bozk>
X-ME-Proxy-Cause: dmFkZTFdhIIRaHoHvxR/i3qDB+Toan8xhX/BO4+LAXG6YR9Th32opelHKVqK5DPv2w5l2g
    mk7hR63FLrTi9H9OKaK3FiFYCj8H06se6Ibg178Z/kVc0sDSIeQHfNcAVGtagcp0fyGWsF
    2KZVKsddUect1FLwMOhtJQIBUA7GSldxWIBYXSmvpmeJ6hLC38qM8vk4TrNBAB4AGNTUas
    SDP5i7H1AkLaCnj/QE3E5gOS2I6JpFXPLLknYD/tT/JFvbDfCQBmeW0g178/yGlRvxQiyk
    gglF+PN2p3sWtGuVoTd1Kwhv5qSHxGsS1Bbqn+//ovzyjuutXkqlvJIzc84yAaW/XKBnRO
    pNd0f/HXf5ohF0TXEbleZGrqvr/hVH/Anh6pVivhVTVoK5u8TjqSI38QVOzH5zl5K9PCcU
    JMVM0UdLNUyLs19KnbqHDdYrM0XGHKIJxknY7xk3/UU5PGYr+jD6uKcK+S4c9ZmUP0/Iwa
    si4UoXGrCG07kirb46RsyitgqMIJspSCWViXGvzXDCldU0QLpWZP7aGSt5JmOGNufGfVMI
    QE3NBIinwblebkIrlnNlzizraov7Vxj5N10BpPXJ/L9zdYSH7qbTH6GBB3Tepd/rHOZq9b
    RT9+IsuPaQmDTv8q62Zb7BwajhOjixcd1TwzYVH8XetVQgJSr3y5dN9fGg7Q
X-ME-Proxy: <xmx:LyWkagIYz5HiGTNwJGREkKRD1yEIqzoAM7trsGL0k8BeKK2Oo-XzNA>
    <xmx:LyWkasmFJuag4G8hEs9fDAqmm2hA7buaLhbdY4wXdmRKyHI6l6NQpA>
    <xmx:LyWkan_Xw0j3uiadsf0_iByBlQKHzL722WsULuGVhM_tGGEKOXynZA>
    <xmx:LyWkaj73Z3fuvARAyA56H20_4UEC_VJxuW2XEKARQ7P4eGziMRSZKA>
    <xmx:LyWkaufG0P7HmwZ0YBjnA1JeIe1B4GjdcooRK8-BLoDm83ECZMNsgp_2>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Sep 2026 11:58:38 -0400 (EDT)
Date: Fri, 11 Sep 2026 16:58:37 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v2 00/12] mm/collapse: separate a collapse from its
 callers
Message-ID: <aqQlBzxvNVObNSxg@thinkstation>
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <8170ef17-0de3-45dc-8c8c-de15f088214d@kernel.org>
 <aqQf9hSy0iNjnL6t@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqQf9hSy0iNjnL6t@thinkstation>

On Fri, Sep 11, 2026 at 04:56:06PM +0100, Kiryl Shutsemau wrote:
> On Fri, Sep 11, 2026 at 05:06:58PM +0200, David Hildenbrand (Arm) wrote:
> > On 9/10/26 14:02, Kiryl Shutsemau wrote:
> > > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > > 
> > > [ This is the first of the cleanups I said I would front-load ]
> > > 
> > > There is no line between the collapse engine and the callers that ask for
> > > a collapse.  khugepaged.c holds both, and they reach into each other.
> > > 
> > >  - Sixteen tests through the collapse path read cc->is_khugepaged to work
> > >    out what they are allowed to do, when every one of those decisions was
> > >    made by the caller before it asked.
> > > 
> > >  - collapse_single_pmd() does both halves of a collapse behind one call and
> > >    drops mmap_lock somewhere in the middle.  Which of its paths dropped it
> > >    is not something a caller can see, so it hands back a bool and the
> > >    caller keeps track.
> > > 
> > >  - MADV_COLLAPSE's implementation -- the walk over the user's range, the
> > >    per-PMD loop, the errno translation -- sits in khugepaged.c, which is
> > >    the daemon's file.
> > > 
> > > So: draw the line.  State what a caller allows in a policy, split the call
> > > in two with the lock as the boundary, and move the syscall to madvise.c.
> > > What the engine offers is then four calls, with the lock state written
> > > down against each, and a policy the caller fills for itself:
> > > 
> > >     collapse_control_init(cc)         once, before the first table
> > >     collapse_policy_*(&cc->policy)    what this caller allows
> > >     collapse_scan_pmd(vma, addr, ...) per table, under mmap_lock
> > >     collapse_run_pmd(mm, addr, cc)    when a scan found work, no mmap_lock
> > >     collapse_control_release(cc)      once, when done
> > > 
> > > The engine stays in khugepaged.c for now; what changes is that it has an
> > > interface, and that neither half has to ask about the other.  madvise.c
> > > gains the operation it should have had all along.
> > > 
> > > Changes since v1
> > > ================
> > > 
> > >   https://lore.kernel.org/all/cover.1788533997.git.kas@kernel.org/
> > > 
> > >  - Rebased onto mm-new with Vernon Yang's tracepoint fixes in it.  Patch 8
> > >    no longer merges the two calls to each scan tracepoint, since the base
> > >    already has one; its changelog now says what the status field reports.
> > > 
> > >  - Patch 3: nr_occupied_ptes is nr_eligible_ptes, and the mthp_collapse()
> > >    comment counts eligible PTEs too (Zi, Baolin).
> > > 
> > >  - Patch 4: no comments on the two constants (Baolin).
> > > 
> > >  - Patch 5: one line per policy field (Baolin).
> > > 
> > >  - Patch 8: the file side is split like the anonymous one (Zi).
> > >    collapse_scan_file() runs under mmap_lock in the scan and only judges;
> > >    collapse_file() runs in the run.  See Behaviour below.
> > > 
> > >  - Reviewed-by from Zi Yan and Baolin Wang on 1-4, 6 and 7.
> > > 
> > 
> > I'll hopefully get too look at this soon (after digging through older stuff in
> > my queue).
> > 
> > Skimming over some patches,  a note that we should not be undoing recent
> > cleanups without a very good reason.
> 
> I don't think we undo it.
> 
> Both madvise and khugepaged use the same interface to the collapse
> engine. Anon and file paths are handled internally in the engine. What
> changed is that we have two calls into the engine instead of one.
> 
> Collapse consists of two phases: finding what to collapse and collapsing
> the found range. These two phases have vastly different locking
> expectations.
> 
> The scan reads a PTE table under mmap_lock, fails often and doesn't drop
> the lock to move to next range.
> 
> The collapse allocates, may sleep in writeback and takes mmap_lock for
> write itself. So the lock inherited from scan is no good.
> 
> collapse_single_pmd() hid that boundary inside one call. It had to drop
> the lock somewhere in the middle, on some paths and not others, and the
> only way for the caller to find out was the lock_dropped bool.
> 
> With scan and run as separate calls each has one lock rule: scan is
> called locked and returns locked, run is called unlocked. There is
> nothing left to report, so the ugly lock_dropped goes away.
> 
> It is the same move as Nico's da98790891a4 ("require collapse_huge_page
> to enter/exit with the lock dropped"), one level up.

Forgot to mention, this kind of split by lock boundary makes it trivial
to switch scan to per-VMA locking.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
