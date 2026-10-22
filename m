Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679034;
	b=pWexwIDDXSpcUA5P2ipR16pq54PILTBFGDEk0xbpqvJbGOFwfIae3dnpPrv05QIfDlgf
	 OesQQRU+XAFkkzYe6ttJh67u/dAxs62VW+Em+UQQJZzbQ/m7aSVmVPuYO83gwho7xASql
	 1q9TBV4LqiVsdJIgNr2qPHiIqinj9dxwQuJdbMAvEu7hA7ir/EFTw1lwakSF/bEcWwnZu
	 d1z3VDULZJ8+J0gVWMJ0ylGyyO/BQMvpXVHy0netgMTW4VeJMKTq73/GQguvs4VOeHErp
	 a+MAnN80WmcI9OemH9/YvmPUzEVZbqwwzw8F21RkP4CYJFyNJT8qKSbTmsASdYodHng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679034;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dIZsXz2SbVsKkEiL1g551QShsK3q3XWlF8skIiToku8=;
	b=klPqV2+9EbV/0gJKBXDzdkgTe6zmZehrurlqub0zRxciGiusjnqZ65hEB0KVb2N1ia5t
	 Of5Nd9fuyt0nejBBZ/pK3JrxUFLHxjc3fM6i65Dt/s6lc6RuUxK6fnn647/sRMnRpfdMr
	 jagwVbuz2vFrR2CInd6fHFqEh13SwGqzLGR3x4ZG95Zvw/M/cdvYi4AaoYp57DmGXsI9a
	 bH/1W0t26Eo/hWPoXaCGGSGdf99LojnGyaDj9mJGyaN/dNnn1+7jNAmNkByTJjw3ZjpPv
	 189vLgrRmgTu6aZwfEoxA0TfGqsig7fBSwQA2wpl1pqKpaiuUlndTSk8ESgwAaprrWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9pS2y+j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3223F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9pS2y+j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C7E1F000C1;
	Thu, 22 Oct 2026 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792679033;
	bh=dIZsXz2SbVsKkEiL1g551QShsK3q3XWlF8skIiToku8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L9pS2y+jsI0ppns07ZzBoky914S4ByJRvmHjmNVGAwMUGSDeQ0F7tj49DSSU8rkEK
	 JsHKgZluABjraGPaWiiCOog2+3d/6KCUjf3izwTQnUy1GMevKXpm1irQj8NVq1EdEC
	 UCj4lah7akanJMtD6Vknb6eGKwP+fgLAdPdYMnBOvOjTUm7x6cLsfhj9x5r8Fo+I3u
	 4JKDwZEYH2jIv10fYdpTKD0YP2lhGbT6LXbSt6p0WV7imYDvoKpCW6hrIrMhfo1n0Q
	 HNW1NZo9Em+beu57l7lGtLucrPpDOhX9QsBBzXdKtevTcISPRvHglPZFfLdFAGMjTr
	 kGkVs7o1468cg==
Date: Thu, 22 Oct 2026 15:23:51 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	LKML <linux-kernel@vger.kernel.org>, Imre Kaloz <kaloz@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Kees Cook <kees@kernel.org>, 
	Longlong Xia <xialonglong@kylinos.cn>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>
Subject: Re: [GIT PULL] slab updates for 7.4
Message-ID: <atob5qNd70YPJqJa@thinkstation>
References: <atoJsKNb5KiE44jl@thinkstation>
 <d5fe8a82-8195-4e18-94e8-2980e8c83674@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5fe8a82-8195-4e18-94e8-2980e8c83674@kernel.org>

On Thu, Oct 22, 2026 at 03:37:19PM +0200, Vlastimil Babka (SUSE) wrote:
> On 10/22/26 15:10, Harry Yoo wrote:
> > Hi Linus,
> > 
> > please pull the latest slab updates from:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mm/slab.git tags/slab-for-7.4
> > 
> > There are no known conflicts with other trees.
> 
> Thanks, Harry!

No problem ;)
You've been doing the hard work alone for years... now time to help.

> I felt I should endorse this as it's the first time Harry sends the PR as
> the co-maintainer and not myself.

Thank you for the endorsement, Vlastimil!

> I looked into cross-signing the tag but seems like git doesn't support that.

Yeah, apparently not a thing in git.
I see you signed the email instead! :)

> Vlastimil

-- 
Cheers,
Harry / Hyeonggon
