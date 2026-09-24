Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA86D3002CF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257752; cv=none; b=p22gGz1OzvZ/1PS9XHk7Q9QZ8Ydnw+m44FQ6W0SECvx3zN/I/Sp5fhDnt89SvVCDrcptuKC3oO2sUPxDBM0NHAXU0Yd/WPHim2o6YIoHLtYw67xB3T3swvTvbCJZKpn067Z6R8nhih3qPaKskWKXBPzqRQFlYGSsRM8ZXSxsV+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257752; c=relaxed/simple;
	bh=u1b4T6xgCH3mgByw4ciO20/BUXumR4YjM6XojB1QxQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+FAaoQd0VoR5WamQJTUUm3+5bPAKOtVM8iI+aYaIp5V4RnuoQwJItd7Se+r03hNVEZdG+P+Bi4z11USPACpjKkCZ2IsvQBwsCCfxmNLl+OHMiblQK5ZpFDjIqRPcrqdCYRM/qUzRaMvDt9WWO7DuV72ds9loc2vmFMY0oQ/Yws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=KlLDLx/c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sNoFqRa0; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="KlLDLx/c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sNoFqRa0"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 021FE1D000A9;
	Thu, 24 Sep 2026 09:49:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 24 Sep 2026 09:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790257748; x=
	1790344148; bh=VxubDCMimHQWV4U5vlu/eXk+mNGTkF4qp8DTiFv5xy8=; b=K
	lLDLx/c/VQBykNZjaB9yWxhaXwngnJGlUCjOcfrQ1n2yk/0JmYdBkz2N49EhXfin
	xoiT6uvexYHqGrFz/I17vWZlcHDayffTu1XUWz0guVJ823zRUqQ9PYRl1pkW2Gf7
	jd3EqSfnL3/OgrYoI1AYyLH55sPNXTIZQX1PhKf0PcPoC95Q1qkT8+I3R9sq/Alg
	x9psJegKTzqLufhpbNGy6uMsra2pgnKJxYmwy9Bc9YhJbRP0aEv4p1Jz25EAUbLl
	5KxE2F9049gpZ9/EJV2YlxmHr7aMru5cjjw+SPpIQh4i6RdQTp/p0xgSLBpYYSg6
	D2TzCNxJ3SDcXeuwkafug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790257748; x=1790344148; bh=VxubDCMimHQWV4U5vlu/eXk+mNGTkF4qp8D
	TiFv5xy8=; b=sNoFqRa0LZd2RdcS9wyhws8zjYUBe82sDzmwye5yzbvB7iyIBdU
	kvNvAR1nm4ZpWm4mDidIDiNWUDlLHCMFt83EvuuC12ERUX8WV5atRnqa6ujscHo1
	F7pZeLnW4W+BU6Ih5N61r6F2tdixkHaDcFwdRCe8KGOPFmNmJAlNuM74dmP5cXoU
	QB1dN+e+ozM23IcvWEst31EtPObCSwdx4PQ27/J6h2hfiyUlkmkTutkhTIFqxgUV
	Xx58y3z6nuySF1/dHzdOjbsEV846IGnYSNp/+XXN2CfXp28oWJhhJxvpTdBz/N+W
	yMXpp6DM6wV+NxGSW8zAEIefMer1Zlb0+LA==
X-ME-Sender: <xms:Uyq1alJJFePU2J9lMkTkocu53B_TZLZQm0r4i-2Y8aWIXKlwld1cIg>
    <xme:Uyq1auyeJ9HP6PX3kQfNv-mgvHpFaf2kQtlGw3QQbXoJF1_aeXSB7X__TJju0Xqf6
    rB5AUBAdbtw6y1eQHhdQdXVoar_AKcBhS-AjG_CpM0uX8FfSi72yrV_>
X-ME-Received: <xmr:Uyq1alFEb58FhTR1JmsF-dQoc_Yq6iI5GAkg-nI8n2VBGDsOHHfWfLRGJLo>
X-ME-Proxy-Cause: dmFkZTG3YGxO9W0mzHNwF9Y5CKWnPkGQyWa550BUS+S62HTmLWg1YjjTjJC6Z3zL8E+9ws
    ACtwAJWI0ONvH87yRA4Cj5fY3m7CA2kRQUbgqRQm8v73NyB3368cDbCbad192qblN5sJB4
    ChR4nZLGh+b1YKI5sh5eNYLDYXuyqCGpLHJQ9IRyUsZZdxsp843Gr4U6Tz8FQjzMgyAvS7
    yu9JYx9E0yAMAXcHxswYezuBxfJHR+BffOoZRKuTtzxgZDRnQw7Sxlg4nNRVRRwCQNLrp1
    kSWQ17aEeMfY2DkAXv7GZOUd37EBu007cxR5FcZrZ1E0LmyJjXEAmTsSs732zO9EqIgKrm
    kaMIxSCKB09lJ53cWjNlWFSv0phUM8xx2qLhrRplpKg/k50aUah1LiPqD5wMkG1PoBh1dg
    ZjiwlDIonXNpBO5QkuwCb+deo1Jw0EEaIj16OFlPu92ya8huWR6EjmLPSC6cARDtaVTtJt
    g+3R93A5jhnZCrXMdoIko5jrF9jhN58og7lEv3ey4083+s56zLu34NdaXkZYWYwIcgk5T+
    b/m+OUQQVXPUJsKHsQptxOchoS4i5YgKCB0YkKLfwvpN+WFpb8G9yCIQAxAxZlAFp++Q4M
    eHPn69ZCtR2wQO9LQnn/LmfrBi05yQitHZuyxiIiUWPcYdIbQQH5aW4xr7oA
X-ME-Proxy: <xmx:Uyq1aumolOTs1D2HxPu95h8NMAKQY2CNiZT2lLT1DzNWPOiFOIAKxw>
    <xmx:Uyq1akH5wLHApYnavw8j8T0q62Mxi4BRoZdRNUoQJtGkm72bsyioJw>
    <xmx:Uyq1apwHlhiFbk-3Pj_mbCyw5srezlM2fDbC1LlaYWcRNr8S3BHY4w>
    <xmx:Uyq1alawZZn9PHt2xDcLS2V66x79eOPykh2ls4AP1FtjKPS0_Tg_2w>
    <xmx:VCq1atPdZUi-hXJhe5aqb5betmTExulnvbbCQpBFEwbcz0ytT1GSJXl->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 09:49:06 -0400 (EDT)
Date: Thu, 24 Sep 2026 14:49:05 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v3 05/12] mm/collapse: state what a collapse may do in
 the policy
Message-ID: <arUVpLSG3Xj560m5@thinkstation>
References: <20260916093145.4022188-1-kirill@shutemov.name>
 <20260916093145.4022188-6-kirill@shutemov.name>
 <2add40dc-6541-41e3-8233-521cce7e0d33@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2add40dc-6541-41e3-8233-521cce7e0d33@kernel.org>

On Wed, Sep 23, 2026 at 02:24:04PM +0200, David Hildenbrand (Arm) wrote:
> > +/* What a collapse is allowed to do, decided by the caller that asks for it */
> > +struct collapse_policy {
> > +	/* Limits, stated per PMD; HPAGE_PMD_NR means "no limit" */
> > +	unsigned int max_ptes_none;
> > +	unsigned int max_ptes_swap;
> > +	unsigned int max_ptes_shared;
> > +
> > +	/* Take no swapped-out or shared PTE into a sub-PMD collapse */
> > +	bool strict_sub_pmd;
> 
> Reading this variable name without the documentation I have no idea what it
> means. It looks like the wrong abstraction.
> 
> Maybe you instead want to split max_ptes_swap and shared to a PMD and non-PMD case?
> 
> I am also confused why you use "strict_sub_pmd" in the collapse_max_ptes_none()
> handler below? Something seems odd, as it doesn't amtch the description here.

The comment undersells it.

The flag stands in for every sub-PMD rule khugepaged applies and
MADV_COLLAPSE does not: no swapped-out PTE, no shared PTE, and
max_ptes_none scaled to the order.

Before this patch all three helpers tested is_khugepaged and then
is_pmd_order; the flag replaced the first test in each. Which makes it
is_khugepaged under another name, so you are right that it is the wrong
abstraction.

Splitting the limits works. Two sets of counts, one per order class:

	struct collapse_limits {
		unsigned int max_ptes_none;
		unsigned int max_ptes_swap;
		unsigned int max_ptes_shared;
	};

	struct collapse_policy {
		struct collapse_limits pmd;
		struct collapse_limits sub_pmd;
		...
	};

For swap and shared the sub-PMD value is a count: 0 for khugepaged, no
limit for MADV_COLLAPSE.

For none it is the knob value, and the helper keeps today's rule: 511
means all but one PTE of the window, anything else means none.

	static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
			struct vm_area_struct *vma, unsigned int order)
	{
		unsigned int max_ptes_none;

		if (vma && userfaultfd_armed(vma))
			return 0;
		if (is_pmd_order(order))
			return cc->policy.pmd.max_ptes_none;

		/* Below PMD order: all but one PTE of the window, or none */
		max_ptes_none = cc->policy.sub_pmd.max_ptes_none;
		if (max_ptes_none == COLLAPSE_MAX_PTES_LIMIT)
			return (1 << order) - 1;
		return 0;
	}

Only the warning for other knob values moves to where khugepaged fills
its policy. MADV_COLLAPSE never reads sub_pmd: it collapses to PMD order
only. Nothing is scaled, so the creep question is untouched.

> > +
> > +	/* Leave clean lazyfree folios to reclaim rather than collapse them */
> > +	bool skip_lazyfree;
> > +
> > +	/* Refuse a range with no sign of use */
> > +	bool require_referenced;
> > +
> > +	/* Map the PMD over a file collapse instead of leaving it to a fault */
> > +	bool install_pmd;
> 
> Confusing.
> 
> If some of these policies are anon-/ file-specific, the name should indicate
> that, so there is less head scratching.

install_pmd and writeback_dirty are read only on the file side,
skip_lazyfree and require_referenced only on the anonymous side.

I will prefix them.

> > +/* MADV_COLLAPSE was asked for explicitly, so it is not held to those */
> > +static void collapse_policy_forced(struct collapse_policy *p)
> 
> Why are we not calling this collapse_policy_madvise to match its description here?

Will do.

> > @@ -2943,6 +2952,9 @@ static void khugepaged_do_scan(struct collapse_control *cc)
> >  
> >  	lru_add_drain_all();
> >  
> > +	/* One policy for the whole pass, so every table is treated the same */
> 
> just drop that comment.

Ack.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
