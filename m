Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1165113D53C;
	Tue, 13 Oct 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895787; cv=none; b=LEPrj8vQ9dZvSIYWIMUNLLAGLyAdXSF76gGi3fcGeC8rcCRKvagksuC8jOw3sQpjIP0KbeF1VtAElDKv6zURr9VLuulXNFi73VLHgcFJRMh3CLjY0yrxwJHczHqMlvRLPMijAPc0PJmYCZ+P9IoBZoUARwx8YPYApfi545Ukirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895787; c=relaxed/simple;
	bh=mmq78eypghUGj2mUvOkbLkDRuWZqn12z5apirK2PaVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTnGRVKKvVZSFJ3FjUMnQ63wqUKxEc1Nd5AcikaSX4PHMw4mlw98L1AWOAuC+fVBzvh575CtaiLTaKq1LjsvBXD5M3L5v5U5ErJasTlY9aZP8Vz5EARq5u3bi2Pg3TQxHSm63fYUqo26OnNGpYdeTV+/AbrM2l3haWZP+si6nAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBc8VNt9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBc8VNt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9125E1F0089A;
	Tue, 13 Oct 2026 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791895786;
	bh=mmq78eypghUGj2mUvOkbLkDRuWZqn12z5apirK2PaVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oBc8VNt9D+gxH5qJnmBV5BjgwcWW3kxsO1hYhNHeURjXKswuBtHC+ee/zncz1VX2Y
	 SdHWn472oO/97+pAzpk/Ghju71hJW7K0uPj40oVmZeXI2a2g78Odw+9v/LSGBVJXkS
	 gfNoac2yD7M4XeAeOSXzhIgCktFagYn6VWGfRDj0IrLqiZMtnTmzWp2MiFDfSe575e
	 Zk6ie/GZz558vyE35Fa5ppXvcutnVveFIyDbqU7CnH6i/6hKZEo1McbfLzxcjZKLsh
	 zATVj5fX7dsEHj2in71IZIOM69QBdPKm5XFeAXNfmkDZPc1IIxRwj8aZIYnTeefsoQ
	 17P2MJRhWZdoQ==
Date: Tue, 13 Oct 2026 13:49:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, 
	Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	Jens Axboe <axboe@kernel.dk>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <as4mYQGQFbjh4jVq@gremlin>
References: <20261009083137.3-1-sashal@kernel.org>
 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin>
 <1716819121.765615.1791890380179@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1716819121.765615.1791890380179@kpc.webmail.kpnmail.nl>

On Tue, Oct 13, 2026 at 01:19:40PM +0200, Jori Koolstra wrote:

> > The only long-term solution to that is to hit mark read 1,000 times :)
> >
>
> There's a way to nuke drive-by authors and that is to require them to do
> some kind of "proof-of-effort." So you want to contribute to the kernel?
> Good, come to one of the OSS conferences, or LPC, or have some well-known
> maintainer vouch for you, or do the kernel mentorship program. The point
> is not that this cannot be gamed, but that the "gaming" in itself requires
> some kind of investment, like proof-of-work.

Yeah that is a neat idea :) like universities requiring people to be in
person for exams and shifting grading weight mostly to that.

Let's not encourage people to ask maintainers for backing though! Maybe
leave that bit unsaid.

>
> We may miss the savant that for whatever reason cannot show up to a conference,
> but Linux Foundation is already very supportive of funding people. And besides,
> Linus has already made it clear that we can expect of people to be able to grow
> into serious community members (which may include being able to effort time and/or
> money for LLM access.)

True. I did worry about people from countries/with lack of means where they
might struggle with this requirement, but LF help I guess addresses that.

>
> This would solve most slop immediately, and we will know about LLM found bugs
> anyway from cooperation with Anthropic and just the maintainers using LLMs.

In mm we're more and more dealing with bug 'fixes' by taking over the
patch, which is its own workload but will figure out how to do TODOs for
that in time.

--
Cheers, Lorenzo
