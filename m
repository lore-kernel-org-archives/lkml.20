Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EE33E3156
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750929; cv=none; b=mYuJQ91yQjN084uIHZVsx5FIoidk5pdlV6qWTabZD2oHw42/VHzMzAJ113jJi+W6y7Q5pieqeq3+pPWUZh5Bp9ktBqx2NFotvDX4FR5HQ5cuF0aAIkd4DNXbu5BUFREz4HDYglixgGUnmjqi0+q2UZVodO8+FpeSF7XPq4lpZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750929; c=relaxed/simple;
	bh=DDv3cPZxn6rwTNgLSXqZdpcN4+TbMNK9bA08Io73id4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6/87YRkFa7vUCkuu0O3AZqyrJWVe/dxxp6vmsbTkoW97Mqw8hkXK0FZFLf0DSvC0BALoYHOk9n+GFpWTzQuWaEEQ63z590OxyLC/3tJGnGP+ZkNGzVXjJjz0QUDVB1nRLFtLym+QKdGZ6RDdSD8xYFYBNUYecUveuOxxVkJQRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJwqengn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJwqengn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6431F000E9;
	Wed, 26 Aug 2026 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787750928;
	bh=iQywvME1XBZPDMnvcuqkj5aII4MPfcDfKqPLaW2AAUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aJwqengn3k3UHyYr5hk5RvhJ18sB/0kW3OMam2evX2+l3YM3LooL4w/KpI/pn1RGX
	 gyDac3KFDpYUC+ecE74X4bfof2GSrfA6CoKJaZl4pA6Po4s1acfBGDIWAkwTr5tfKG
	 9tGOatWmT/dLzGDVyKpcqEtM3snoZBJga9a3wkW0UxY3dajO9ivv38H0ZEoXYuaDxf
	 /QisTFuQHiBhME7KXm7srtWNn9Lp+bNxobGkqp17F7QwvZnAUJKMVSwpy/vgyd1llL
	 MOCEXf73PgzDm8hXdNyqQm6n6nV3yQk+owdAllZqFFUFEqU5fPvdxbMUDnpsm/srUt
	 CIeeW6DwgIuPg==
Date: Wed, 26 Aug 2026 14:28:42 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <ao7pIIxxpqkJ7b4Y@gremlin>
References: <ao7Nr_FALfP7cTY5@gremlin>
 <20260826124316.80455-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826124316.80455-1-lance.yang@linux.dev>

On Wed, Aug 26, 2026 at 08:43:16PM +0800, Lance Yang wrote:
>
> On Wed, Aug 26, 2026 at 12:31:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> >Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
> >
> >	~107,000 words of review across 948 emails (in 279 distinct
> >	threads), counting only prose you actually wrote — quoted text,
> >	signatures and attribution lines stripped. That's a full novel's
> >	worth of review commentary.
> >
> >	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
> >	and your longest single review was 2,404 words (mTHP collapse
> >	support, v12 — the khugepaged/mTHP collapse saga accounts for most
> >	of your top-10 longest reviews).
> >
> >	Estimated review time: roughly 300–500 hours, centred around ~400
> >	(i.e. ~7 hours/week for 14 months).
> >
> >	1,615 THP-related emails in the window: 948 reviews of others'
> >	work, 278 replies on your own THP-touching series threads (~31k
> >	more words responding to review), 382 patch emails, and a handful
> >	of MAINTAINERS bits. Busiest months: March 2026 (131 review
> >	emails), June 2026 (113), August 2026 (111); quietest was December
> >	2025 (5).
> >
> >Think I can be happy with that!
>
> Aw, man ... I totally get needing to step back, but we can't let you
> disappear from THP that easily :) You've put a crazy amount of time
> into it, and your reviews and judgment have made a massive difference.
> We'd miss you badly.

Thanks I appreciate that :)

>
> Could we talk you into staying on as a reviewer for now? Zero pressure to
> keep up with everything or carry the maintainer load. Just hang around,
> jump in whenever you feel like it, and come straight back as a maintainer
> whenever life gives you the room.
>
> Seriously, Lorenzo, THP still needs you. Please stick around!

I'm not going anywhere in terms of upstream kernel - and as David suggested
- I am happy to be pinged on threads where my input would be helpful :)

But in general I'm dropping the R: for now as I feel it wouldn't be quite
correct to keep it, as I can't really give much time at all to THP, and it
wouldn't be fair for me to be listed but remain inactive.

I may very well revisit this in the future, but for the time being I think
this is the best way forwards.

Thanks again for the kind words, much appreciated! :)

>
> Thanks, Lance

--
Cheers, Lorenzo
