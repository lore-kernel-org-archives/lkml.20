Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5565471CEC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390490; cv=none; b=ZFcLaCAP7hjPUy+w/qAcZYtUoT4tzhYWRuWAxDHLa2f36fuQafUGjMGjqeTiKHo8vPfG8+Zu+zgdjNpjytGQl4In+dIxiR8CHbRuzAIG/TfzitFHIvlUYXjMFH99RBxpV/qqXWifZ6VoKuaqhWaB6Vq6dTGi8jIK8Nr9cX0z8+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390490; c=relaxed/simple;
	bh=Y/IqC182WWLahsOjzKJeqQE9UR1C2wq8AS8LUBth8hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKyaveu+i/ySv/b/6W7rf/hkcO5hHfexSFqhsni7cfe+NyQhcQLMvx882JH+30VtdsEXfgsn51XYNu+W97ddGXAWAabQhy8cbQfoLZAJcGppQTkiBj/CgJ7Wrepnqj6JZajxt+9nvoDslDd8CxO/S5pbJJIhBZxB+MON8uNXHTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=XScFTxA+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=npZ75TKF; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="XScFTxA+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="npZ75TKF"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 1BE2C1D000B9;
	Mon, 14 Sep 2026 08:54:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 14 Sep 2026 08:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789390486; x=
	1789476886; bh=58HuI72UzzufVKEgM4X9pABwg/YtbZfRPL8mqB0t9wA=; b=X
	ScFTxA+nYqYAWWciwS/wfXDPt7L+2Olxix7oQAXauU32RuY+7dlJC7w8hURyOWth
	u1pSeS8IOglcXUpmXYI0nRNKHY/o6QTBYevLz9mbhxVbMWSekbVzYfLUR5BQMGnV
	LoXZtdrlA8xKY4vtZ/7B6vN7+KgVa7T+UUl1Poe0IdPsQbpEKMGUoI+q8i6ytpgU
	JWyg0f6vcNsljTXG4xf7srS2NW7v6OsgbLjNVOt7JO3wpC3jYFmtSI7qqpUz8X2e
	qkD4RToP507RmUoagWp2kqAh/F3w7QDOExCGYChgTKBLAlpACfv/7oWG0B4wuBe7
	n9TM/1+fGnO3mcob7C1UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789390486; x=1789476886; bh=58HuI72UzzufVKEgM4X9pABwg/YtbZfRPL8
	mqB0t9wA=; b=npZ75TKFZODpvLZX6x5yyyX8XY8g17pNRzf0tIImPa6pJRZeuIG
	0YVY1oRTGg8df7Z6eIxxz0hIehtWFzSCOyd2TKADDLSPG3xjy49rr34MAAq+29Lt
	savhmUQk7zpP9o7PGIAheQncdL63JHKvXoPR7ngNZ1VWPOYKU6q1kaJF26KGUjae
	3iwDzLwQOK0UIl3dHwsLRLvBenIf11Eu3hJd7t/gd2CPCxdPVTPiswBi3K//VqhY
	Co3le7+a2n7ezI0egPQUHNZhXpgn8YuJwpkkk/T4ZDlMDq9+UHIAKTKWpLjqvbs5
	WQAiyxvTL+vG9Dk3LqgfUn6TFZNG6wZCZQw==
X-ME-Sender: <xms:lu6narPmfpVnstfOzbIhkoHnmNmU8V-Yia576STa6PIzz4ULuY8yIw>
    <xme:lu6najnH8N71sB91W2CZKvfXFMbgineqYsj8SBzzr3zaiSK5tEN05uEWLPGfWFKO3
    zl2M1cpMlOAPbqaKPW6Q7G-c57zFeCBib59DkzOBlqWCWemr5yLNOcs>
X-ME-Received: <xmr:lu6nahqbRiVkSbF9kIwbaxBklQwRUrzD7QibUn9qEJIdPnjdBbyryYpq_nk>
X-ME-Proxy-Cause: dmFkZTEkuE1qsOgHWNd2OJi/yEsB/yNWtkH7YkkdilSZOyWVcpUr7C3FIxlP6mcCehLd48
    KR9hpUt45AE5XRP4aAPuDU9kUileQnSl0/RWstJYNZsUBN3hRAQe3TEpT73wY3cRQ8sG6D
    ZVA+IIhiR21cGIsbwsWUrYJ0grwFLMNYvsvuKwT0L6ql+b5ba1DO7cP2Xz7pVKcNwle5j7
    psSwiANkuSb/y/u9Hr3hLrrVW/pdrXIzE9pfy/yW4ltMw8Yjol9bLoBNYjEv/PKK/qPfFL
    2KJ7pqjxHaFgfPIhMCdBUc1bKT7acJdP3SvNAyfzszQLtU2vMgGXZ6qLjIkn6SPRotbICZ
    hQPH4wCikJyTznNwi7vj5rg5GzLyM9OK1v9ErJClkMQb28ZjgVSboC8IjUJj0LcgEZ0g0+
    mNf/bU6/dEECgqV1eaEkAYDMUHuqDCNku4lVWzRxqvZXdhNTiHKCrSjQaCQcxmxH0zNLxz
    u+pSpaOMhdtP0IzwoXAXTheThWUJ/GqXxE6pxpeZd4u2urZBsLQx9BYySVqZsJQrd2xODK
    2y4l+0xyeknr1coDbB3Btmt9XsX7lbej3PVXDseaNO+Ykqa4uQSc1J3Cr+PZ6GTSjRECa/
    a4u/32yakCAgtWL9DC1RvLUtuk4znNtBYEQYAlG8hUJVEcgzA5eIgVVIOLQg
X-ME-Proxy: <xmx:lu6nan4yiahtUA2GFEJiAgxMP4K-obqDV-RcDXY35niJ-917y_3aiA>
    <xmx:lu6narJr199QHvXRtGDCVBgz3pbLpa0A8xhr40YnEY0Y9QN46eqjrw>
    <xmx:lu6narlHImFxT_2QDLgB29nrLHa5R0mPp1LDND_zD4YPdVsQ-pD_6Q>
    <xmx:lu6naq8Kc79BrM53WoVjOURv-gHn3iL0XwBJEIe8hA-VXB6lxpoAOw>
    <xmx:lu6nancwZbD0qRsRrjf3k0D3eiyVYxmB17rxaSWLekbER7RGtVu1VHGg>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 08:54:45 -0400 (EDT)
Date: Mon, 14 Sep 2026 13:54:44 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v2 11/12] mm/collapse: declare the collapse interface in
 collapse.h
Message-ID: <aqfuZ09c2-yHRUdG@thinkstation>
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-12-kirill@shutemov.name>
 <DLCPXEXM5YQ3.GPN2LX0UL19T@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLCPXEXM5YQ3.GPN2LX0UL19T@nvidia.com>

On Fri, Sep 11, 2026 at 03:02:22PM -0400, Zi Yan wrote:
> On Thu Sep 10, 2026 at 8:02 AM EDT, Kiryl Shutsemau wrote:
> > diff --git a/mm/collapse.h b/mm/collapse.h
> > index 346859a2184f..1ebbbf63fb25 100644
> > --- a/mm/collapse.h
> > +++ b/mm/collapse.h
> > @@ -106,4 +106,48 @@ struct collapse_control {
> >  	bool scan_retract_only;
> >  };
> >  
> > +/* Which orders a VMA may collapse to, zero when it may not collapse at all */
> > +unsigned long collapse_possible_orders(struct vm_area_struct *vma,
> > +		vm_flags_t vm_flags, enum tva_type tva_flags);
> > +
> > +/*
> > + * A caller states what it allows in cc->policy and then hands over one PTE
> > + * table's worth of a VMA at a time:
> > + *
> > + *     collapse_control_init(cc)         once, before the first table
> > + *     collapse_scan_pmd(vma, addr, ...) per table
> > + *     collapse_run_pmd(mm, addr, cc)    when a scan found work
> > + *     collapse_control_release(cc)      once, when done with the control
> 
> This is a good overview of the workflow.
> 
> > + *
> > + * The caller holds mmap_lock for reading over the scan and passes an address
> > + * within @vma, aligned to the PTE table the scan is to judge.
> > + *
> > + * The scan returns with that lock still held.  It only reads, and almost every
> > + * table it is offered has nothing to collapse, so a caller walks a whole VMA
> > + * under the one lock it took to get there.  SCAN_SUCCEED means there is
> > + * something to collapse; anything else is why there is not.
> > + *
> > + * The run is called without the lock and returns without it, taking what it
> > + * needs in between: what it does -- allocate, isolate, copy, flush -- is slow
> > + * enough that a writer would wait behind it.  The caller gives the lock up
> > + * first, and with it @vma and anything derived under it, so a caller carrying
> > + * on has to look up again with collapse_vma_revalidate().  The run revalidates
> > + * for itself rather than trusting what the scan saw.
> > + *
> > + * A scan that found something has to be run: the file side takes a reference on
> > + * the file while it still has the VMA to take it from, and the run is what
> > + * gives it back.
> > + */
> 
> It might be better to document each function individually about the
> requirements and what each does instead of putting everything above.

I will add a comment to each function at its definition: what it needs,
what it does, and what state the lock is in on entry and exit.

The overview stays. Per-function comments tell you about one call at a
time; the overview is what ties the four together and says in which
order they are made and who holds the lock in between.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
