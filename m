Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97D738DC64
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778153; cv=none; b=gktG7zKPa0+Pb4tvSU+80UckjEYS2nS1Zz0+pY2MHsXWel4n5mTdsy+0Joc7rDKxxVYVfweHkilXEYMzlWdvw3Xtlotn+qMZJFvFukX9tVxFT52J0X6b4qXKdzshZ8F++uCYxrFYzdiHQdpp4e4psQ3YCk+6vPoMlUauMuHI1kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778153; c=relaxed/simple;
	bh=NuSjooa2Kvpdxs18m7a1azOykQKz91VPzAodqW6GEhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzC6btIO86JeWjGFnDnAVqQtxH9ETf3VmANJ8RCFpe/2lb7XHNeUGlN0HtgjmxPyNL9J6zP5q5LcshqXg8N7r0ywddcKng92EjpZ5Gzq/6G2rL4O+tmC+RSXZvW/1wr5flzHnrrPUX3hpt87DuJX7rC1GtG+S7rCcejwowMdweo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=IS+wSGKe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P6V5JnSg; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="IS+wSGKe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P6V5JnSg"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CD82A1400183;
	Mon,  7 Sep 2026 06:49:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 07 Sep 2026 06:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788778150; x=
	1788864550; bh=s+zDE/Nc5gs/w4KbwvZ5L9RNBXJEN/bY6CjWChHoQog=; b=I
	S+wSGKelXRa7/kMd+4F5uaqH/H92eBOI1KleFygRMaSYAJn8Rqva67+i6KI07NC0
	yOdwGEMP9L9VkslQC5KBI9jNZ1eDJzYgrm2oswe8sIm38RRnPnC+YFL2RdizmAGh
	cuv9Hl5BfxdWTNCqPXkFPLmAaw7cMJOUosasMd3yRQ26rnlKa4djrZWXb8whlk2l
	j4Qy5Fg+xgwAdyLQrDSM3IrBSi3ZXpqTb+Ncz1mtFEaTbsTKYkiwOEW9vjbrmGvf
	j7gD2TdVwkmGNaFtAHAxC26omxExCeB9Ydzr+gofffR1M6LqUt3ELd2hvSiCbTt2
	Vrhd27gvNggLcLhn1Ybog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788778150; x=1788864550; bh=s+zDE/Nc5gs/w4KbwvZ5L9RNBXJEN/bY6Cj
	WChHoQog=; b=P6V5JnSgXhYedgBCFKqXPfVdJh+ZLSFoU7iAnutp62h0xmF2NpV
	sOgo2UQ8vmHNcvmECjfvhvsC86nr9KnMKin/CPBg5tk5BzKoA+pYCDwUy7SPffT0
	oo7axZGMoj+zZ08Wq+SBaPs884Utcgir2RFun/0kddIopPuk6nrCKcyeMCphVV04
	kMPovv+qsBIgno/ZlDovieC4zG/Fs4g46m+Xz43og4Lf5W1RID5IA8k7tYNyaBKo
	NSX4jTp0+KmQT6k/3l0K9P5iRuFvtVVixLc+kibXuizacvA7NWdLnJ8R0QJbq3CM
	neynYa9tRLNohQFeZhwNgHovKQ64PvZT6IA==
X-ME-Sender: <xms:ppaeaoMiXAkdzwvtynwBUoWIsCzUj-HFjNAhqfOVlZJCIn9EX0DxWw>
    <xme:ppaeaskeoHuYzIwDo2OEtK-3cgkZTKUcTzoN20goTpdcAO0P-b1-VtXlfeYR8ly-S
    3npLJeXwnRMxl1yoCKiH8D7OXGBlgGyN40pJw6REABi_o8rSl5Wt5Q>
X-ME-Received: <xmr:ppaeampDWv3NnLmgv6W_vhLtvb7EJusWVgJO56ccpMlQM4QcHcL2O5jEjck>
X-ME-Proxy-Cause: dmFkZTGe3tLT5fc5+1pPy0eOLkMhNrtlYjSsZgwM58xbqe/DhzD5c9SsnG7aNo4wDlyEoA
    uI68qsMxO4BPA9zitZYH4R9RNpulf1zz5tNYTG0P/Q+OrUohdknDB1ZG75PdleB59LGIOE
    gQAu368RjXfOXvQkU0yxJ2YJDdU9aEfTg5J+CwomIK3tLx6WRUIkmS5VVXGxmhQ8gBvPWi
    E+VofEuhqzTZIfqixt5wc/8fAeHiOn+Q6XvhHXRYdsNUnUQnA0GksMWee9DgplA082fJQr
    jk8kbI1oW1nZcRBmUuQNB8sCn7D1zjsTEFES9DXQb1zkzU0t1Wi6PjKt1sj8SIpkcNE0Vy
    leTi1mZVVXRC1OwK56ec8mcG7KW8yx4Z2dvmgNBhwxwQe3i3JqVHrgsmOndBSdGoR+zJpZ
    9zzKSpizI7SjEnZ7dE2zEo3T0wpJa39DWi+zENbi98fm2xbdMFnViduoOz8gnS1Xd7CaIs
    ZOVunMDjordK8QyfAlY7Oq79Aador+uFzNq/BkUABAKH4nzyncKjODVPVm1QApDMRS6mEd
    eEInms44A6mMjw+eTaut8Ec3SatBbt0K7IuuOCu6EhQOlovXkuogyhflKqLWJsrleIuzOg
    uG+IBacqViL5fHihWSMPZQM/HhK1oqXjW34SsQPyAj3EN1SCKpWlZ60yhcyQ
X-ME-Proxy: <xmx:ppaeao6839vIWO4N53b9UbDcnVEzAHS7yvTZ8iILUIZlwSQo4iLVhg>
    <xmx:ppaeaoKUeqJRvCPspqqDJHQTwjUoX-JHV3EjERZ645MjSQefBNy1TQ>
    <xmx:ppaeakmIBddqicXOli0e25be4Cf97QaZaJYK_aniZqzetf7a4_DWNw>
    <xmx:ppaeav_n9oGX4Z4f0PVDrrb8zA8VmECU1BsKvFlMc1S7aWPfC7xjzQ>
    <xmx:ppaeaozL7Z_xCY09r__0vm7hJUFtf4bHqRAo0Zjj7dle7HXYEqUpqYLm>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 06:49:09 -0400 (EDT)
Date: Mon, 7 Sep 2026 11:49:08 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 05/12] mm/collapse: state what a collapse may do in the
 policy
Message-ID: <ap6Wa6h_4HznOzSx@thinkstation>
References: <cover.1788533997.git.kas@kernel.org>
 <b01681c3cc945a7f7c3c7ca1de502f7cc0e93fe8.1788533997.git.kas@kernel.org>
 <DL71DSES00K6.5JMVM0IJLPHP@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL71DSES00K6.5JMVM0IJLPHP@nvidia.com>

On Fri, Sep 04, 2026 at 10:44:58PM -0400, Zi Yan wrote:
> On Fri Sep 4, 2026 at 11:10 AM EDT, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >
> > Tests scattered through the collapse path decide what a collapse is
> > allowed to do by asking whether khugepaged started it.  Between them they
> > settle:
> >
> >  - which VMAs are eligible, and how hard to try for a folio;
> >  - how many empty, swapped-out or shared PTEs a window may contain, and
> >    whether a sub-PMD window is held to a stricter rule than a PMD;
> >  - whether a range has to look used, and whether a MADV_FREE'd page is
> >    left alone;
> >  - whether the PMD is mapped as part of the request, and whether dirty
> >    pages are worth writing back and retrying.
> >
> > None of those is a fact about khugepaged.  Each is something the caller
> > decided before asking, and the collapse code should not have to look up
> > who called to find out.
> >
> > Add struct collapse_policy for the caller to fill: khugepaged from its
> > own settings, MADV_COLLAPSE from the fact that a user asked explicitly.
> > Every test becomes a read of a field, and cc->is_khugepaged goes, having
> > no reader left.
> >
> > khugepaged fills the policy once per scan pass, MADV_COLLAPSE once per
> > call.  That is the one change in behaviour.  The max_ptes_* limits and the
> > defrag setting behind the allocation mask are sampled once per pass rather
> > than on every table.  A table scanned early in a pass and one scanned late
> > are then judged alike.
> >
> > collapse_file() also drops a NULL check on the collapse_control.  It has
> > one call site, reached only from collapse_single_pmd(), which dereferences
> > cc unconditionally, so the check was already dead.
> >
> > Assisted-by: Claude-Code:claude-opus-5
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  mm/collapse.h   |  40 ++++++++++++++++-
> >  mm/khugepaged.c | 114 ++++++++++++++++++++++++++----------------------
> >  2 files changed, 102 insertions(+), 52 deletions(-)
> >
> > diff --git a/mm/collapse.h b/mm/collapse.h
> > index 1c40229b9554..05282eed9a35 100644
> > --- a/mm/collapse.h
> > +++ b/mm/collapse.h
> > @@ -48,8 +48,46 @@ enum scan_result {
> >  	SCAN_PAGE_DIRTY_OR_WRITEBACK,
> >  };
> >  
> > +/* What a collapse is allowed to do, decided by the caller that asks for it */
> > +struct collapse_policy {
> > +	/* Limits, stated per PMD; HPAGE_PMD_NR means "no limit" */
> > +	unsigned int max_ptes_none;
> > +	unsigned int max_ptes_swap;
> > +	unsigned int max_ptes_shared;
> > +
> > +	/*
> > +	 * Hold a sub-PMD window to a stricter rule than a PMD: no swapped-out
> > +	 * and no shared PTEs at all, and max_ptes_none as
> > +	 * collapse_max_ptes_none() scales it.
> > +	 */
> > +	bool strict_sub_pmd;
> > +
> > +	/*
> > +	 * Collapse only where it looks worth doing: require some sign the
> > +	 * range is in use, and leave clean lazyfree folios for reclaim rather
> > +	 * than collapsing them into a folio that is not lazyfree.
> > +	 */
> > +	bool skip_lazyfree;
> > +	bool require_referenced;
> > +
> > +	/*
> > +	 * Finish the job rather than leaving it half done for a fault to pick
> > +	 * up: map the PMD over a file collapse before returning, and write
> > +	 * dirty pages back and retry once instead of refusing them.  Both cost
> > +	 * latency the caller has to be willing to pay.
> > +	 */
> > +	bool install_pmd;
> > +	bool writeback_dirty;
> > +
> > +	/* How hard to try for a destination folio */
> > +	gfp_t gfp;
> > +
> > +	/* Which VMAs are eligible, as thp_vma_allowable_orders() spells it */
> > +	enum tva_type tva_type;
> > +};
> > +
> >  struct collapse_control {
> > -	bool is_khugepaged;
> > +	struct collapse_policy policy;
> 
> Can it be made const since it seems to be read-only?

Not as a member: khugepaged fills it once per pass from the sysfs knobs,
so there is no constant object to point at. And madvise has to
initialize it somehow after cc is allocated.

It could become a const pointer to a struct the caller owns, but that
adds a lifetime to track for a struct that is written in one place and
read everywhere else.  I would rather keep it embedded.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
