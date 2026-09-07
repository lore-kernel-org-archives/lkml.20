Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED142E40A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778565; cv=none; b=OGAPBq+cbykihtt1Ke7gKsec2g07ov78gWcdq83czFvFwe1cw6g6rq4BUqoMf8qBQY+kPR0bl7F8JLFaCSKRV2d32REUG3fh53ofXD7/Z2V3TnA6+1QLNOtQoi3XuDd7LknEcQyh+Mi359B0+PrtwHqrt+xntPyKQWRiAx+qSyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778565; c=relaxed/simple;
	bh=Rx6c49vX+F1LMG5IX96K+HxRBn0WDu/YnTz8NR886ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPemGUhAA2xbpUn5kVX+FgWTwg0LeiXfWU/loO1c2Zvqt9PlmtWs350fYuyokSnxQ8WKaEK0SdZrPZrATWEkgDKQasQo5EGxlKr7LpIkxndx3NaDY/syEnfxYCmL7fXdALJD0AXbSbfOgx+H8I0yaDpEayse8OSR8u8KJwm0KaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=YjX0Xvo7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VVnUv86V; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="YjX0Xvo7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VVnUv86V"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AFE431400202;
	Mon,  7 Sep 2026 06:56:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 07 Sep 2026 06:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788778562; x=
	1788864962; bh=F6lbYxm83JbmP8qJnr0Ogd18054WFY+Ycq+o9l1/0PY=; b=Y
	jX0Xvo7oGUW/F2QhyRT8seoU0e0FRHzb90YPtWCI4rD76gS2qxWZSOS6AJteqVhw
	OTboYETbjneWQCp6eahnsUco4gqwvRQmSgXRLUo18ztOGXvg5zkN9KdQMkiYx1E+
	+Xb+j75D1bxX0DI44SAtX+z+RzD0FiFRTYENDXiH0Gg7KiBbKNKvdz1KUt84/Sxj
	0afyzh2v0Q9NQbuWdY3jx4Wayk4/PiI7EFNJtBbHDUgwDn6P2ALqr0agGGOE6Ddz
	6rImegbasfQaMrpdvSRqBEd3DkKgXjIZtE2AiXB1zk+AdJqhVm6zI4L1OhYrhQzk
	efg+yyx3H6qozsSgn1aUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788778562; x=1788864962; bh=F6lbYxm83JbmP8qJnr0Ogd18054WFY+Ycq+
	o9l1/0PY=; b=VVnUv86VbRqJ4pV2wlCMOSvkXpaXQmS+CMMJyJioxlMxzFkuAM8
	cakjHBoK+ox2jw/l9djUsqJVXYkjvESA2Xr5W+oJ2ndT+w5rPt5hcApZhzwQ/e6H
	4Csc3Ugd+s1LODbu0xRNlmC6UJWvxrX8+JunYbILtsMCA165+OjTK8OZ8KarX1ZJ
	NPr9WKk4Hy5DIMU4VLnGxZv8yHOqHcEbyq9p+oiL3Vjrd/jcRfz4N5P2NkqNAPn5
	OsUt7tq8O6EGkjy0cf8W9vLrWmMHRpPAOGSBhZJFLZj9M3gk5ARII/eMBUy+d4t7
	lkDUye7EJvVgKI0KKQJogGGirk0wEk+RHhQ==
X-ME-Sender: <xms:QZieasA7HwhiONj2STBEXUK0dq29atl8-HemJRtzoZpLPVLAk5XuZA>
    <xme:QZieasKrmmcFjKTi9NTLmDMLk1t_HPJklhVvNzT6J4EaU0weM84eePeHdZThE0n6E
    bH-6swicY-nWdg0jALv_iKE_ADvAJYvQqkHBpIJEXopYEp7q9B1UlQ>
X-ME-Received: <xmr:QZieam__O3WKf_im4KmROwP_Of9vdBiR7mxobQTR3iInuvU-Y5LlaVPe3TU>
X-ME-Proxy-Cause: dmFkZTG3PVKk6/dBlCY9MyEqHeq/YD8qaSwBBn0/5FZxKMy2ibK2aT6dY6SikOzIpcZJJZ
    0mB/SyAjAnTvowh1qg7gdtVfg9iuNruxOi9V6GiQRPks8HOHntmOyDsadX/skN+YgpufWK
    n4q0QgK2D3RXx8OP68/Ho8HmTgce79UgjbxR4LeLU3o7Gp2IAAh2OlrLXhkm+Tpsi78Iq6
    lme+bbPuIZAxWBX234GC2jt5ENcuojIS4t/mv03y/rONCCbzz84c+wd7m48mtxqQLhyf09
    /ytQuiYjrtq1nZdw9GaPF/T0jF0pLcAOGkPqtNwj1e2WcJV1UaRLLmyLlaB5Gl2zqtxBKm
    O6mTp01rfqQcb/MnseRWJAfS470fDA7zi3eRR2QkmhIPtOykCVz/jpEOQYFBQedZycRBpm
    RUnQbL5OdsapNR7vWXpoLvuTx1g4Ik1d+mGmRxQhs56SUBe7L51/wvFyoQ6Mi/6h1Tobv8
    E/w1lVvJ8ZBwv7NptH6+RmHWS4cpSGigPkJg+/8HTgUKfjAeRkUWzhtPIlSaH999Fm1Hxc
    +zgaU2WKhMa/mltdM0KUnRhJ0FufEGPos1v/YXH7d4qAmIb+frxn6XNLbPmV4BGcaBaS2a
    Y2Mv7I/P1n59bsZKp84w6zUW3YRIHNE9rcBe+UHunG777uc/OmJJ61dXX4WA
X-ME-Proxy: <xmx:QZieaq9IhWAF4-rjM6CI8WanivZN7oVk3syZdXC9bNz5UTqRJXWrWA>
    <xmx:QZieao_kSKUxkbJ5_B6cIt8WC_9-6qNw9WRbqchKmZvh448QiPRTJA>
    <xmx:QZieatJLxXZylXwZiOJDlao-w55lAvFldli0OscYsp8X6G2AiMkkHw>
    <xmx:QZiealQ_luD9NQ399_rrwYJgsxQUztRObWgkaCva94yizPLHiYQWFg>
    <xmx:QpieatF5zQfKdOIfPKeUeneKwjGUOS0B8hSLptim8GryWSzPZsvlB_3C>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 06:56:01 -0400 (EDT)
Date: Mon, 7 Sep 2026 11:56:00 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, Zi Yan <ziy@nvidia.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 05/12] mm/collapse: state what a collapse may do in the
 policy
Message-ID: <ap6XERs2j7e1lZCU@thinkstation>
References: <cover.1788533997.git.kas@kernel.org>
 <b01681c3cc945a7f7c3c7ca1de502f7cc0e93fe8.1788533997.git.kas@kernel.org>
 <c070e67a-4c1e-478f-aa28-09fb88f8a786@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c070e67a-4c1e-478f-aa28-09fb88f8a786@linux.alibaba.com>

On Mon, Sep 07, 2026 at 05:05:19PM +0800, Baolin Wang wrote:
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
> 
> This is a bit confusing to me. Actually, the check for mTHP collapse is
> stricter.
> 
> How about naming it 'allow_mthp_collapse'? That way we can keep the most
> original comments for the collapse_max_ptes_xxx() functions, which is
> clearer to me.
> 
> If others have a better name, please ignore my comment.

I would rather keep strict_sub_pmd.

Which orders a caller asks for is already decided elsewhere:
collapse_possible_orders() hands khugepaged every anonymous order and
MADV_COLLAPSE the PMD order only, from tva_type.

A flag called allow_mthp_collapse next to that would read as
a second place deciding the same thing, and flipping it would not change
which orders get collapsed.  What it does change is how a sub-PMD window
is judged once one is asked for, and it is read at exactly the three
places that judge one.

I will do:

      /* Take no swapped-out or shared PTE into a sub-PMD collapse */
      bool strict_sub_pmd;

> 
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
> 
> Can you simplify theses comments? I think the 'install_pmd' is easy to
> expalain. :)

Done for v2.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
