Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4A4E0212
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990795; cv=none; b=bGejsVTUlwMIOO4yM3CukdqdltURkGS7/cu1kTvkYQPYr2U3uX4/hL2RqO3YgZ341l1586qvon0wBbAXlwpLdIfiN4VUpBRGb1xt+a6C4tFuVKmHWl3pKjKm5u8e21TatFaSJMXU8ntf8QA/kC3WdqxiXQWKoa8uD0mt574Jr1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990795; c=relaxed/simple;
	bh=G60KgCAh3+4rO87ttQo4oGU0cSK3AxlL7WM4JZKqcCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIT/gW4iMM7gU7WaAUthUupxD21ls/rHkUJXCy36Kw5+9EVTdVbg7nqTRIYuahY5e85fW07V0uVSdqWenGRm+S/mc6TzUloj/INGT0cHY0RSVv/KYylJMrnbKgerXcG8MmG2hbmSoYGszJSRwFKpTmTGaLQeJpdjOSZ1e2Z8Jmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=uQta/omL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OxtN50Ew; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="uQta/omL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OxtN50Ew"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id BE38C1D000E9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:13:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 14 Oct 2026 11:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791990791; x=
	1792077191; bh=wOpUc93gFFArBoAXhaus4seduOQibJAcMCNch1pqklg=; b=u
	Qta/omLOGimjIHUEKQwfL7ovZ1Lo4R2MfYGoNM89lkMZeWaHMKy7GL1g5UqyTjbI
	mbo66i77QLZAfV3PpUG9ahmmUcu8KmnaxXoccU+oSWy76beQqEjtU5Ph5I+bYIyi
	/XsLiOP+VgLb5ZDRb0KDuweDD4JEhAlN1hTqnm2Iz99/rcku+U599ErRcNi7VLJB
	d5EhCcxfcGidc6TJf38fmp6Y2vxjz2WMRFDD1ZUuf+CP8glkRtHfIt5xkq9B8W5N
	FlNAFLz2W9OGOCr2nEuO5bfFbbmTYQ7VuET4qkr4dICA3uIhUB+3kn5BMCr3D5xH
	2fYfseBlR4WbAouF730eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791990791; x=1792077191; bh=wOpUc93gFFArBoAXhaus4seduOQibJAcMCN
	ch1pqklg=; b=OxtN50EwzPAHLrIDo+SxTurWAKMOY2VMScylMB8tMqI8HyUuzVG
	kZo04+Z/KnJeSZ3zklT3vpuhPha5g4GYCQG/C5T17xcl1y+Me9kxGkct0/I010KQ
	ZJi+UAjAg4exnfGaX15qgmxBHXeIFy1Akbx/qYdd14LZv/FJMTs2RUjiViJAOFJd
	OF7LsOWh0BRHfenivBQRo0K+8qVxQ82KWlE/F8gSQBU32V35CclON0xi9yWcTnvA
	qaQUAuqjkeRGIuerWTUzn9DboQvbMl71xyT3EfG5LcLJExVlyA+jVKzuilKRV8pW
	JSmoiazAIucv0nmcqcekkac+NqHOBcgRBvA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791990791; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:FFEKBuDxcEp/nOq7CJQ7Y5RlVhtJIhukMz2V3TzdeXrkZ/l
	6lCK+3vktcNjt49u24JGGEVonnwFw+0pCDSszvRdpN04A8h+oI6m4zPkWWf0fpnj
	rZemLGeAozB6WFKbmjuk/oY1SZGL27EGKKEqXqoyheJ8SPLTPPK4tmILvCOJPWWv
	wlgCRO9Cvw6z9SEvI6shq2GDn94h+R0BQdkgpy+X70Fcg/BvHfkCdtJsPUzKHIWV
	cauVLsR6eLzBlg/bmgdIYoruAER1Tvf/hc0i5SqioXAUotQm9I8KBc4tJ4UODl8G
	DMVfhRCEEXsYBx7I7ZJXUkDMOFhsHlsuhtAk4fA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:l7exCgdNv9j0ZInYme449tBrkRlNDP+jpQLyBNQizzU=:G60KgCAh3+4rO87ttQo4oGU0cSK3AxlL7WM4JZKqcCA=;
X-ME-Sender: <xms:BpzPagLxp0jZW1pc4QX2lC1ovBgjRCBisoidbAJQmyCY0Acu9v0p6A>
    <xme:BpzPaq_7GYtVozT03T6peLWLV67rToRejqTMAdddSqANNPp-hwx_FRUtGAszqKSDs
    aDbD4uYMQ35vzCPXCD8GDy8QXJwCfuG2TWrgm_4BbqsVw98oVxz5HQ>
X-ME-Received: <xmr:BpzPau8vqyvIR_bktSL81eFnEAJe6HFpopdo_oLBkXN70gOaxp2Nm2GKxDQ>
X-ME-Proxy-Cause: dmFkZTGOpaIiUCvzOKJYmWwXLjE5VgiI69sgmw5zefHn3fmXaEZm9155gUIeRoBxRHgim+
    ixRIflW98cI4qN3hOAjoBaFOgQR1uVMYXdKZ+fm59GlcrANLb2+KrT5qejXhIsxbQBVqak
    1xyLocSkJsK8DtQftxAbNn+72pI6QgbvPcQ7E5BcVM+MrYW/mxVTtwGxkpJBdPU9OZdPFZ
    j7vKRWCjzBkG9w+tE20g1pFuIPAhd78DzHySseDSKBy2rIghh8NJer6mAS6Tj5c43ccszP
    ggeSyQ7V/cdwJiI6FVREhq6feoXVDszLULow4fyrDr4sy3cFU/Ms4vtOPIs8OhElQk/sTm
    wIfCb4Z9fF0Zvqb++fnTIbI4LSFY72L9U8H9f0eDS9isgrlxGTsieOHp8uGHXF4yZOubLv
    NIRHaTqOdPpHbjZWewcgr4kRAZZIX/u2CQfSgLXHfT+ck/AAq3W7duqcwKIuo8gNzmbc+q
    4x0IG+l7d+LyfQIx6LpMd9z8lsHFqaYAMZbp2OCncLW/4cUCpmh+DOWFeWqK91+U12j+qu
    ITuE3dOOc4PqunrKwNv37D5SJpDCe76lw+pmkMj3Od2Y1zm7v8GEDpC4kQMU/aqVyHhiFe
    oNzPBWg3oQOV6cUd5NYqJxMtjgHJq2qU38hxfrikXYACTyMHiHgCuwZb7new
X-ME-Proxy: <xmx:BpzPas_aL-HXSm6Evglg5jCYT_Vqfbmuuym6tulxuya7o9B4bbE5sQ>
    <xmx:BpzPahKlWfzgSXDFkUL_olfi1a6lLRK6WTW4PyP-nSUzqcKu-30-rA>
    <xmx:BpzPapS_789xelULVYeqwXs2AfZZvE2AYwLqgJ4Iu8tjfcwmzZQXqA>
    <xmx:BpzPai-m-KAXgGLQZ7CGnmSbNfJbNNrEFJTouUWp-_Apo5O-uFZ1gw>
    <xmx:B5zPalhIblhyXImjNOn_4nXgCQ6sg96scz4_xXA25V2_KEep2ZytyFTS>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 11:13:10 -0400 (EDT)
Date: Wed, 14 Oct 2026 16:13:08 +0100
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
Subject: Re: [PATCH v4 10/13] mm/collapse: open-code collapse_single_pmd() in
 its two callers
Message-ID: <as-WGjXRHws2f0z7@thinkstation>
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-11-kirill@shutemov.name>
 <b2133cff-ce69-4a45-bf33-c44b774dee7b@kernel.org>
 <ar-nKHZ5hlbsXeFP@thinkstation>
 <dfbb4bac-0def-4e1b-87a7-91c9cd91349e@kernel.org>
 <20261013143839.832f1a4db51f801a2b95f850@linux-foundation.org>
 <3bd88620-c245-4fab-abb7-9091d9a1b649@kernel.org>
 <as9cHpbmDm2FzJai@thinkstation>
 <b5b2e72e-496a-4756-bdd9-c83c78b3da89@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5b2e72e-496a-4756-bdd9-c83c78b3da89@kernel.org>

On Wed, Oct 14, 2026 at 02:37:02PM +0200, David Hildenbrand (Arm) wrote:
> On 10/14/26 12:55, Kiryl Shutsemau wrote:
> > On Wed, Oct 14, 2026 at 11:33:46AM +0200, David Hildenbrand (Arm) wrote:
> >> On 10/13/26 23:38, Andrew Morton wrote:
> >>>
> >>>
> >>> I've suggested to Kyril that we park this series until the next -rc
> >>> cycle.
> >>>
> >>> But I can bring it back - we have a couple of weeks, three if we get a
> >>> 3-week merge window.
> >>
> >> I'd say we move forward with the uncontroversial parts, and keep discussing the
> >> controversial bits. Either these make it still in this cycle or we'll simply
> >> have them for the next cycle.
> > 
> > Agreed.
> > 
> > Andrew, could you pick up 1-9 and leave 10-13 out for now?
> 
> I think #9 needs a resend, right?

Ah, my bad will spin v5.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
