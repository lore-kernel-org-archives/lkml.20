Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F76430D3E0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813021; cv=none; b=uv+hyzhAoR/AXUIe07XyHQtkLzbLmpiIIdjbZhWSpOrL6Ugfjyyw9pHfkKM+BaVeVq9+V2NLLNKa7UsrcijLHAn92ALMQcm69qm3eNYTOn4G9CYYeZlM/5LKCiDaR3oKv9tIGi/tC3znigqM2BGa03fASAUAXMpheUcxV68JTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813021; c=relaxed/simple;
	bh=iIF0cuBrvG7b5EsFRUsQtjqUL9CqJNgHm4Pujjq8N5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYfySEVTdsjx8PpJNYjF4AfZz1pqM7r5PQPpsCDSvvBAV8iERnvg17lYghUDbJpA423Mp+gHF6z/cJ17HjSPWk1ywCCRnsJP8JbAvP+lUmWCgim2kkUexZcKaydhpWz2+rjy7zfIdDfjYYt+sZsZyGCT/jlv3CWzgwK9dqOFKBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm+kKnUH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm+kKnUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354411F0089B;
	Mon, 12 Oct 2026 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791813020;
	bh=iIF0cuBrvG7b5EsFRUsQtjqUL9CqJNgHm4Pujjq8N5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lm+kKnUHfiLVmzLPRe4NR1YRlcaapiM8GWY8ZbTS5ukWb/CAm9lH/msxFephP9zZx
	 5pZhY5gLUXsJCyUSi5NDRxWpADvgWvPLBea4X60jo9qifaBAKPwq2HndWaxjT+4cFF
	 BJcxL5cKSeTnnjl9KeH2mjW3xT+9YdeVDngEujeiRE/kBUzBkKRCfg8LRNqQ+KAlBL
	 X8awSOOC2QVH4jHMjQ1AyvGgdWDWReZapWKnkV8n+YlbEMUOERC27oD3QA/GAvr79d
	 Y/CY03Z5C9NPPGZXUomO8MdSs/OkMhS4T6zyGIN84V1Vov9pk3SfSKpZnrJTiUcuPW
	 zGXbfcjvvx5lw==
Date: Mon, 12 Oct 2026 14:49:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: albin_yang@163.com, akpm@linux-foundation.org, liam@infradead.org, 
	david@kernel.org, vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH] mm/madvise: add cond_resched() in THP branch of
 madvise_cold_or_pageout_pte_range()
Message-ID: <aszlcdgUO8bUdNFs@lucifer>
References: <20261010024042.4070048-1-albin_yang@163.com>
 <aspKmWIrOzNjiP-t@gourry-fedora-PF4VCD3F>
 <aszZPq92qX3jpsNE@gremlin>
 <aszhNc-Lrw7BgCT0@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aszhNc-Lrw7BgCT0@gourry-fedora-PF4VCD3F>

On Mon, Oct 12, 2026 at 09:32:14AM -0400, Gregory Price wrote:
> On Mon, Oct 12, 2026 at 01:58:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Sat, Oct 10, 2026 at 10:26:33AM -0400, Gregory Price wrote:
> > > On Sat, Oct 10, 2026 at 10:40:42AM +0800, albin_yang@163.com wrote:
> > >
> > > This same improvement came naturally from refactoring the entire
> > > function into a proper pagewalk structure:
> > >
> > > https://lore.kernel.org/linux-mm/20260922235830.2350770-10-gourry@gourry.net/
> > >
> > > this function is really nasty.
> >
> > Nice!
> >
> > And thank you for looking at this horror show of a function.
> >
> > But yeah as Andrew said, need something for the backport, then your work can
> > help eliminate the source of such things! :)
> >
>
> Oh yeah totally reasonable, just pointing out that two separate efforts
> came to the same conclusion.

Yeah, it's nice it fell out that way!

>
> ~Gregory

--
Cheers, Lorenzo
