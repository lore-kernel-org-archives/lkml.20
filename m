Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000C3CA481
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900790; cv=none; b=rfHj87o1ZfB1vQRndAirhiF6cf8Jw3D1n90tVF44u6Q7aZ2RV/g3Cwe4f2gAwC7WM0gxgPPW4n2rQ3V4xoVYCCRW/XXYgvRJkvxMbHYdqFxT4aPEfdrmOPSmYKuC9oinmnrpMpOxmwQNSZW4pfXYgp0BaeW6qIJ3S0v4tDh4nRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900790; c=relaxed/simple;
	bh=qsB0p1lkXELR8q84L1NKERWXPQ4e5T0YG6u7/IxQ/fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2KTcPaCztBCZEQwB5pyKaZOYrpthH9YEkdP9aJld6jtWpyiOkqVas0R/7rU86LtlCVj8B9jW0LQqpZqANOGMaBPhYpnGiW2atoI1plz87ckSXj4lsdRm9fORcSxaGkMcVZa4jSuzldniF3i1lQYJuCMHqcksgwsvCeRF34IYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8KDsOFl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8KDsOFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADF41F000E9;
	Fri, 28 Aug 2026 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900788;
	bh=My7joSDz2Ka+qwaJkxbQwVtYYsCHnHrEPDsE1x4YmfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T8KDsOFlA+dTcPNq7bkKzLFIYt/lQkONpAHMQJNLpFoByDRuPH1wgWULvCijkonM9
	 4JyhIqOI+YtF0gdXLsv+ez/CxeF/U16VVbZ/eDp74ZxLwHfFVeSZqoMRHLnl/ckFJv
	 M2DyItv9e3C2GdhzSTPGl4crHVtUR7t6A0LOkL6dmA/sqPHJT55DPP7wyWTlot8cPZ
	 a5CuPFR5HjNeF5kktKiEn7gM2ugr6P2JgWW/OqETnDpb8QloTcEMFzGWDwNlxcNJvh
	 GR7xc1nMA9r0u9y3eIum9upZjkCrHyoQcCUkTKT0BbwYzkUaPpv98w6RHqxLyIbObT
	 ck0mGEaFIO9mQ==
Date: Fri, 28 Aug 2026 08:06:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <apEzYdLWx0508hBH@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7Nr_FALfP7cTY5@gremlin>
 <4836208f-a84a-42ca-aa74-bede23d7de41@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4836208f-a84a-42ca-aa74-bede23d7de41@gmail.com>

On Fri, Aug 28, 2026 at 02:34:31PM +0800, Vernon Yang wrote:
> On Wed, Aug 26, 2026 at 12:31:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
> >
> > 	~107,000 words of review across 948 emails (in 279 distinct
> > 	threads), counting only prose you actually wrote — quoted text,
> > 	signatures and attribution lines stripped. That's a full novel's
> > 	worth of review commentary.
> >
> > 	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
> > 	and your longest single review was 2,404 words (mTHP collapse
> > 	support, v12 — the khugepaged/mTHP collapse saga accounts for most
> > 	of your top-10 longest reviews).
> >
> > 	Estimated review time: roughly 300–500 hours, centred around ~400
> > 	(i.e. ~7 hours/week for 14 months).
> >
> > 	1,615 THP-related emails in the window: 948 reviews of others'
> > 	work, 278 replies on your own THP-touching series threads (~31k
> > 	more words responding to review), 382 patch emails, and a handful
> > 	of MAINTAINERS bits. Busiest months: March 2026 (131 review
> > 	emails), June 2026 (113), August 2026 (111); quietest was December
> > 	2025 (5).
> >
> > Think I can be happy with that!
>
> Thank you very much for your hard work. Over the past two years, THP has
> been extremely busy, especially with the addition of mTHP-related
> features, which required a great deal of time and effort from the
> maintainer. In my main role at my company, I am also responsible for THP
> and memory reclaim functionality, so I fully understand how demanding
> your work has been. Once again, thank you for all your hard work.

Thanks very much :)

--
Cheers, Lorenzo
