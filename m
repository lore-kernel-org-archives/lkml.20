Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8244F56D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142168; cv=none; b=DzAKf+fD12Ha7FcOB70VMILs4hpCVzGdPBciKycsrmRpVmWbeQcKekkjsYCmCyW7qbuRktD9Emdo7TJ8ZUDAI6N+sXtEXPAzV9O7T1a2TvHWmQGbsy2lTiMr5Twm1d3yrMMbxCnRksS1NTfqGi8TiY6+xZ5VlOCD93mhds5cHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142168; c=relaxed/simple;
	bh=BHvC9468ateYEevqC8SltFCKTdBoSPLkbzDl5I5QUYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvYKCAlc+Va7WhEApmNX3EcEeraijRCYo29N59011p9GoQ0WHWgPbZXnUgp6TWl+8BypehA07gzqeFZYpBII6BUv+tZBX9ojv33G/aYU5qHLnaU7KGCRzv6frIM62o39GyilvqsEJwDhdj8QQk/vyzu6wsX6g8fK/zgIKHN9AHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=nE2xLN2M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mqYPiZ1C; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="nE2xLN2M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mqYPiZ1C"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id C2E89EC00A2;
	Fri, 11 Sep 2026 11:56:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 11 Sep 2026 11:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789142165; x=
	1789228565; bh=CpkRjukhNmD2VLcP+kNjnb/Y+O1Luo3t+QTwhUwDhVA=; b=n
	E2xLN2MhoWl8xjFcGUjtepqTLf9LM+bTuNT8gBbvxckZXYQi0QUrMC0wbunKTh48
	OXTtBEIENk8yV6Xa+KYhTJ3wcMgF48kIJ46/U2+rUgGvit6CVl7JRuTLVnRT34yF
	WxLyDm32LWyVv92tbZf5Byc7evK62UCcyfbDg8F7d1WDe52SOy7Od33Pv27b+PX8
	s2pcKIFX4SfdjID55uOngL9Z7znbd8ZfljrmTxuUgQASG2c9YflztTXD5fMR9CRb
	+iQgK9TmugTzqo+FEL1XkuF0fbYRMDW3UGWMkUzCIyD3hK+Ow9baLxDrxh8cZhwp
	C/qnNEWmt/vLf5c3N6Hzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789142165; x=1789228565; bh=CpkRjukhNmD2VLcP+kNjnb/Y+O1Luo3t+QT
	whUwDhVA=; b=mqYPiZ1C8V1D7ko6AQe944jRR3Fe5Rwpv06XfD1epF/IW007eI4
	/QJ/1ksvpJdoy6vngUtSeBFpLUximiVN7bna6H6HtoBiq4/2LtN39Z6jdPoTA7nU
	zsI2mf6zrJxyrP3BNVnLp1nAbzFSffPRGcVVMCgSm+y1VzT6mZJPZJrFMWGnT0oJ
	WXchYbwtKNOPiKYajzue/SsFUZTG5EZmhT4UZZmN49u8iqQdp0icuBNhD8mM9Rmk
	K4CMmmUWWQbp5njFMsBTnLilRAJbd4PV3HPJOAjZmbRVTaCXlgycJXMiphC40QRh
	KGcxtF3ATbBaBfFP2kxU29NY65qFdFDxBUA==
X-ME-Sender: <xms:lSSkatb0vbfd7sUiGe2b0G97LoItanl7M60VueYOjfn8j45MZrR7Hg>
    <xme:lSSkaiA-wXwVwfbpy8lycEbODIggDKLYvznfsiCDMqw5pVn-mAetHx9iF6GeK-OV7
    Rr6MsUhI7DQE9YwvgSYxpxexudYQTK45i3sfp76ivzJGdF2EP7V_VG1>
X-ME-Received: <xmr:lSSkanXF0JApUQWOKZYpaKyRqSCZlw79grtu-PHvrJAIPxv1lnau6mLgIs8>
X-ME-Proxy-Cause: dmFkZTGTAWYtDpGmqldcHLGSX4v5lFhCr/Fj+S8fqcXDWFWNUtiXtn/NhTkjTJQ8pBXXV8
    zbCaMxckVD2fu4yD3tliI1eEuWpqb/TsvmUNUMjoKQ28M82Uy6sQN8qyBypym9xlH/wV4P
    J42kKHBokB/lr5oenyIHpxD6wNEyMMQ9qg1K8PfNeHD0LqsHThY+O0dn86GMoy9YfEMTfQ
    53A9vAqDcf20mCrAB7uv8q6daB2YSzjD7SWTHwpd928byL8ORNjLjWbwg4U1UFTkNThWi7
    Kuc1cjsu2uhtI9Vn2fB18F8jMXO3erw2YQWZeKB/aad/Q7lyh13MRrVglqVkRBZk+f4OoZ
    sQzym5wCoxbqFPVAzc/87b6kyk1v74yMsWCZi4vFIdYz1y5jDvxewWjBEpLPCdfPNW7VHR
    8netzjdv9hUNlBXEdGGxv6/y5E+n1Zf9iKCe1f83yxQPf+G2bt+1VSOfrQ3mfTv7R5KEsQ
    leyXWLmYoJMDAsxtre0NOo30gb5O/8BX9r2o0IvgTmARscD6H2kpplwFPIXdflYidJPB1N
    FOtNnojHaMv43OxarRrnlcCs8uGXJ6C6AIs5C4R+7Ya6vhqrGz9xh16kLWkW+ULr5+gt5M
    kvvi74U+aw7VbU00bbWY4jqNWnvcNbz2LvVscQpuqeMtts33cu2ZqgyMTjTw
X-ME-Proxy: <xmx:lSSkaj39Toqy7lM7O-FbGLM96Mk8YMkQeicKmoUEdxcQmIHkO_9CfA>
    <xmx:lSSkagVZSj-u13cdHH5S-CcYt24bgK2vg0mt2unMkwBHVqMxRA5lWw>
    <xmx:lSSkahDmzQgxTgIL6wtCDaRpIb2IFtMJIiQhDhuVJibeTSrPRpCtQg>
    <xmx:lSSkarqf-70VGvnPkzraCPeuVu_X_9LZD3eW_zKtwlxO7qHtktPTMA>
    <xmx:lSSkasYlUajrZbG8YqgaPrFnEnZc8Ncr4BLyNHtotFTlUnFBstbcXNQD>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Sep 2026 11:56:04 -0400 (EDT)
Date: Fri, 11 Sep 2026 16:56:03 +0100
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
Message-ID: <aqQf9hSy0iNjnL6t@thinkstation>
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <8170ef17-0de3-45dc-8c8c-de15f088214d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8170ef17-0de3-45dc-8c8c-de15f088214d@kernel.org>

On Fri, Sep 11, 2026 at 05:06:58PM +0200, David Hildenbrand (Arm) wrote:
> On 9/10/26 14:02, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > [ This is the first of the cleanups I said I would front-load ]
> > 
> > There is no line between the collapse engine and the callers that ask for
> > a collapse.  khugepaged.c holds both, and they reach into each other.
> > 
> >  - Sixteen tests through the collapse path read cc->is_khugepaged to work
> >    out what they are allowed to do, when every one of those decisions was
> >    made by the caller before it asked.
> > 
> >  - collapse_single_pmd() does both halves of a collapse behind one call and
> >    drops mmap_lock somewhere in the middle.  Which of its paths dropped it
> >    is not something a caller can see, so it hands back a bool and the
> >    caller keeps track.
> > 
> >  - MADV_COLLAPSE's implementation -- the walk over the user's range, the
> >    per-PMD loop, the errno translation -- sits in khugepaged.c, which is
> >    the daemon's file.
> > 
> > So: draw the line.  State what a caller allows in a policy, split the call
> > in two with the lock as the boundary, and move the syscall to madvise.c.
> > What the engine offers is then four calls, with the lock state written
> > down against each, and a policy the caller fills for itself:
> > 
> >     collapse_control_init(cc)         once, before the first table
> >     collapse_policy_*(&cc->policy)    what this caller allows
> >     collapse_scan_pmd(vma, addr, ...) per table, under mmap_lock
> >     collapse_run_pmd(mm, addr, cc)    when a scan found work, no mmap_lock
> >     collapse_control_release(cc)      once, when done
> > 
> > The engine stays in khugepaged.c for now; what changes is that it has an
> > interface, and that neither half has to ask about the other.  madvise.c
> > gains the operation it should have had all along.
> > 
> > Changes since v1
> > ================
> > 
> >   https://lore.kernel.org/all/cover.1788533997.git.kas@kernel.org/
> > 
> >  - Rebased onto mm-new with Vernon Yang's tracepoint fixes in it.  Patch 8
> >    no longer merges the two calls to each scan tracepoint, since the base
> >    already has one; its changelog now says what the status field reports.
> > 
> >  - Patch 3: nr_occupied_ptes is nr_eligible_ptes, and the mthp_collapse()
> >    comment counts eligible PTEs too (Zi, Baolin).
> > 
> >  - Patch 4: no comments on the two constants (Baolin).
> > 
> >  - Patch 5: one line per policy field (Baolin).
> > 
> >  - Patch 8: the file side is split like the anonymous one (Zi).
> >    collapse_scan_file() runs under mmap_lock in the scan and only judges;
> >    collapse_file() runs in the run.  See Behaviour below.
> > 
> >  - Reviewed-by from Zi Yan and Baolin Wang on 1-4, 6 and 7.
> > 
> 
> I'll hopefully get too look at this soon (after digging through older stuff in
> my queue).
> 
> Skimming over some patches,  a note that we should not be undoing recent
> cleanups without a very good reason.

I don't think we undo it.

Both madvise and khugepaged use the same interface to the collapse
engine. Anon and file paths are handled internally in the engine. What
changed is that we have two calls into the engine instead of one.

Collapse consists of two phases: finding what to collapse and collapsing
the found range. These two phases have vastly different locking
expectations.

The scan reads a PTE table under mmap_lock, fails often and doesn't drop
the lock to move to next range.

The collapse allocates, may sleep in writeback and takes mmap_lock for
write itself. So the lock inherited from scan is no good.

collapse_single_pmd() hid that boundary inside one call. It had to drop
the lock somewhere in the middle, on some paths and not others, and the
only way for the caller to find out was the lock_dropped bool.

With scan and run as separate calls each has one lock rule: scan is
called locked and returns locked, run is called unlocked. There is
nothing left to report, so the ugly lock_dropped goes away.

It is the same move as Nico's da98790891a4 ("require collapse_huge_page
to enter/exit with the lock dropped"), one level up.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
