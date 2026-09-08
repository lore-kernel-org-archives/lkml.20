Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB60549369
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872949; cv=none; b=BAV6IMAOvbjcb9epAsTH433j3KCq4jV4Whd0TRVpSCuwI3Dg0e46k8IQbppPJ+Mp0oYyMCkA2pjnO+Jk3iCOOyhtGqzYE1nHBxzRtarwagq3g/Bhq1iXlx9/JPZyYSiww1sgdtFUAcEGIaryXLaGlGnFF2TH4bJRN4RiOYNx6HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872949; c=relaxed/simple;
	bh=j4TbLGfPIfIib7DoYRvqWh501ib/4MzE3b1vNb6XzkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/+ZL4MeYFa8P6Kvv1VHCqVvax4+9W6f07gQCNz2bcbqGzhGNq3OywfgnwNXrNZo8EhsNrbbN/DJeVQOHj3vDnVuNeSst4vI5dXspyIuvfiCdPFRPG5+XW7vmqJJ5THB9YT2L3090ZpTSBuOCrVAqkoxOHk57xU48mYjYjyoR0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=hiT/r7zQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q4gss+Uq; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="hiT/r7zQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q4gss+Uq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E0278EC012C;
	Tue,  8 Sep 2026 09:09:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 08 Sep 2026 09:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788872946; x=
	1788959346; bh=4ayj4peSiR9Svnk4dcRkrIeubDo3GBkWjAAWp4/esog=; b=h
	iT/r7zQhr70zC5NihfXkAb88NPIyxmpY6AT03lzRqA9MLg9KC7Ek8Ty9MEpXb4Ju
	H1VQLu5+Ad351rw8epWiSuYjv5kkDsEiUOWJ3Uytfdc/MVORwf8d1w7lSzoZ7jFD
	1+7d7JojdOQfcFDOqcuTLsn0jrwSPF9/n/uKomgS+9bUrTtpqBgGFY4jZf5aJiiU
	86AokqbOrJ/P40AsKvuY45+WSM8JXy73+9rxM5tGuhpi8pj/vUKaQW4n1KjnzVr1
	9C02zAUZCtCqFSM2JtlIcUCODURj25p8+WqOSvgaEbzl8hd6Jn99eF/Fa02S4Oqb
	vmuW098rs4Gahnm7+OllA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788872946; x=1788959346; bh=4ayj4peSiR9Svnk4dcRkrIeubDo3GBkWjAA
	Wp4/esog=; b=q4gss+UqTOT1NnlPnnjbIKpJ/g3P+FoqFME2fM/13CR5+SFGjrg
	ADMoyARmQLu+pU1WDi0iZjWHPYd4vBaafhfjyf1HcbuU/CUdceF0z3KKxhzy7hXB
	R2h33gUWr3F1mlXJgyjhPasmJhC0fsNyAohG7HJkNvu4/Lx4gdINrfskvaUtXLlk
	5O8O0JffWP5Zdte1Eu+u96buBwpuMFnluFsv9WD+SujzK5nQHbUR7BSXh7L8jw2x
	SeRo/if9njVQBXxBO20kkJ3F6ZrNymRHZOojZITn+KDISVgianfuvN/8ySWrKq0v
	6gmh/1mo9RTQ5uaFxg3Bx9zLUzTGxa3ouLg==
X-ME-Sender: <xms:8gigatS6yC8ny3IVTtM0JzMpyrHuKXsHOt9Ct7XrqCL-jBEEUE9ZDA>
    <xme:8gigao1HlhM9fZd1lx6ODg7qXColQhWnmiPONuhnoBwgNSF8FftXOAslGsHsTDEJ9
    _6yZSfOcxyOW5rKGezHZG0yG9kEKnGjIJrYLsiB4XPJ0sxB17Tom0KZ>
X-ME-Received: <xmr:8gigag8rFhCC6KseXt4l0witibDd6_eLy-zSPMWPp3Ke2koAqs-Vy5xG8f4>
X-ME-Proxy-Cause: dmFkZTFVW8T6Hhbun1kCRweiWLTW4B0DweckVuex7uj8ZYNR1/gxJR7tKJt3JXNK8Om+03
    K5k1jQTsgq+L9NoWVoR0nWsC411it3NbkREAwr7Mv8YOa6AECeJYV6rN8pUV2U7Ye5QXSE
    Kb3b2KmjmfBJsH3moF1fEWaQxyoGveHt8bJlj4pFtC3Z4MRA/Hqg/zLKteN0LK9CXq6WfR
    dGLbKn2Tk/pNxZQl1bfNTSji2dqJQFlIwfvSHKqM4mmK9RCgWRLrd4AThRYqA7qXrzzDyx
    xixbOrMKoz1Bo03Wm9NGoQ8Fkkosjy30K2SXNi6bkjaY7FiqhmPQQ1L3FM4/uIdQa8/aT8
    iqlnvc6OgLfXBjRiE3WVxkuDHsMC0K8rTFfZjzdhLHmb+CJ8cXUpbu5a7cwUNCsLRcP6HW
    3jNJYgdGJ5JHLKMVcJGeoKBvUoONVrZ7hKZk2+V/wLGSuUZwTaALaoCP0tBSw7Kpc6jKwi
    /oZ4G9nd4k6qvQzwjra1a6k9ZyqA+YL9T6AfwVJy4SYZYm465fdbPyDrEjfzXcT44EW//T
    MXmJ2E+pBcV+rP6dQxzfL1b70ovzluegONoR28y/Bi4HvZuEbBsPlWSOB4KR2+bMiAU1Z7
    5Isf7HdUQ/m8AFJqXDM4FdT1zUVN0XrhiKYpa/ry+BJgqqmNKSVf8RT+mjaw
X-ME-Proxy: <xmx:8gigap9DySO-xz67KhqOoXTqVEM4C6MXgsPe7G_cznS9FXNIgXZxhw>
    <xmx:8gigajECGeOagpaJs3teiMUFAz83cM_XBQNjl9fTWFRyemmhwsRiUA>
    <xmx:8gigajf37X8vwqQdGC3lqQwteJkolOt99f6JCtPcfGZz6MGyPyslog>
    <xmx:8gigaik-YgEmlZ5Q38n3BYnAFUr3v9T8nHIQ3lZE5Zh54HZX_VUqAw>
    <xmx:8gigalH0G0HBl1IznQMXiEdN1oQLwpcUHFEF7mj-0aNkiWN01RKdyvon>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 09:09:05 -0400 (EDT)
Date: Tue, 8 Sep 2026 14:09:04 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Gladyshev Ilya <ilya.gladyshev@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	hannes@cmpxchg.org, usama.arif@linux.dev, lance.yang@linux.dev, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, kasong@tencent.com, hughd@google.com, 
	balbirs@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] mm/huge_memory: add folio_reset_partially_mapped()
Message-ID: <aqAIFV4nOGPbWiDS@thinkstation>
References: <20260907183340.1446132-1-kirill@shutemov.name>
 <ap_Tjt5vxal-B8DP@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_Tjt5vxal-B8DP@gremlin>

On Tue, Sep 08, 2026 at 10:25:07AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 07, 2026 at 07:33:40PM +0100, Kiryl Shutsemau wrote:
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Assisted-by: Claude-Code:claude-fable-5-1
> 
> Note that policy has changed on Assisted-by tags so this should be:
> 
> Assisted-by: LLM

I was not aware. Thanks.

Will fix in v2.

> > +static void folio_reset_partially_mapped(struct folio *folio)
> > +{
> > +	VM_WARN_ON_FOLIO(folio_ref_count(folio), folio);
> 
> NIT: I wonder if we could have a folio_is_frozen() that'd make this
> self-documenting? As trivial as it'd be :)
> 
> If not, then a comment like:
> 
> 	/* Folio must be frozen. */
> 
> Would be helpful.

There is a series that changes how frozen is encoded and would be the
natural home for such a helper:

https://lore.kernel.org/all/bb1cb750157733f897df2e261cad3d5c42acc172@linux.dev/

The patchset seems to be stuck. Not sure what the plan there. Ilya?

I will go with the comment for v2.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
