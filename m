Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1B311592
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784381; cv=none; b=B6WhIm+DoUi5s9r8Ev8jNHz07ZSwr4sNC0iwL/fQ170XDMty74f/z8PrWWDVHd2Y08r8wKYX//w+6mcSt+yntZXHLG6SrNAccBhAwIhLaD1mejepL+LhDJXMWqvGXJFi5TGvhut0VFbzgEtxFtikZW1rsboFsc3Lf47dGaID8hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784381; c=relaxed/simple;
	bh=A2iHD3gqDKCj2QGR7GYWNFcmLP3k10Fn9vLLIK1hz6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qn21ZGDXWyC11vzHc0fiBkK7Dya8OytFWz/j2kG0d/8zlgVf9Uwut8p8y6M2MU/Dh+YAVkTVS5iku24LTyI62hbyPLLR/Io5hWg6w5uXPpxNqCskXaX4AZ8/XP9WvKvkqTsIMvWdHfGPzx/rsvz9h+EgQecLtxOcLmESfGYy42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MR24bwJJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MR24bwJJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D3D1F00A3A;
	Mon,  7 Sep 2026 12:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784380;
	bh=A2iHD3gqDKCj2QGR7GYWNFcmLP3k10Fn9vLLIK1hz6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MR24bwJJn3WPSLSaGDC4QmCRAH0ef5go8d+B6Hd8hOAdYfLk3I1XTgLFC+W8oRSlU
	 wYV7gjxDSoo3rZN/buTvNfDA8RrHZ7izDRqPu19IQaMz7pQCA9pPc8Nl9g4H3DFjnG
	 6cQTnDcZCKcsozvUu9zxIiGgHwOISy2a51nuPGV37VgLK7BFgoeHA1iww8WMI64Z60
	 jIyCaxBHh3/3juv45cHnjMvf5u9Y1xhupwy81zFRQg48rh0mXtmv1Bntj3ScGqi+h0
	 6CxXkjQ1jHeSH/BjiMvoR8/h235xKerP8ll7kQyS/lo/4HtnB+uR3zbCguJ9XD9LaM
	 u6Lq4L99cV5qQ==
Date: Mon, 7 Sep 2026 13:32:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pedro Falcato <pfalcato@suse.de>, 
	"Liam R. Howlett" <liam@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mike Kaplinskiy <mike@recall.ai>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: Re: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Message-ID: <ap6u6Ana3MvvIIUe@gremlin>
References: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
 <apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net>
 <aprjOxDy3JCPb2oa@gremlin>
 <20260905171757.ba8b0f8f0f18ebd04418bfeb@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905171757.ba8b0f8f0f18ebd04418bfeb@linux-foundation.org>

On Sat, Sep 05, 2026 at 05:17:57PM -0700, Andrew Morton wrote:
> On Fri, 4 Sep 2026 17:01:37 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
> > Andrew - could you swap the patch out in-place with below? Thanks!
> >
>
> np.
>
> > Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
> > entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
> > for the former and a tree walk and swap in to swap cache for the latter.
> >
> > MAP_PRIVATE-file backed mappings straddle the two and currently get treated
> > as if they were purely file-backed, meaning any swapped out private pages
> > remain swapped out.
> >
> > Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
> > mappings and performing both walks in this case.
> >
> > Since the logic checks for vma->anon_vma this means un-CoW'd
> > MAP_PRIVATE-file backed mappings retain only the single file walk.
> >
> > Reported-by: Mike Kaplinskiy <mike@recall.ai>
> > Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> The failure mode looks pretty obscure, so I'm thinking that no backport
> is needed.

Well it's not even really a failure mode so much as a 'known limitation' :)
So yeah agreed.

--
Cheers, Lorenzo
