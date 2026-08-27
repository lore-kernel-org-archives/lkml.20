Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE646D095
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836031; cv=none; b=Ucnt9Y7/RhhCGLEJoql+/RZSRvrdbpgVWzKEBw/jC28Mkk7q6JcYaMgI/uMs1NjWCPqJJrOZfR30eSi2tfTaexQO1b/fzxFzptbo5KS4HLpZNVgz/shUK3fr2fxQLk3stfmuaOaN/2JJZgdiJv9qzLDcQCtHPvTU/a+ogPorlTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836031; c=relaxed/simple;
	bh=aJa8GkM03fEh8NtHJaRKAJ/tp0xmeMNgj/Rj1HV5SfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uB3i8QQkKOPl/gtx3C7WHewKnREUavp9VZtjmOFdEXOqcADWIsEOs4JnjxLozPOg2wNABmnuVhVAYas7fotNfpYkj8Gs9oKF2cKtxaq2UgEH9M85Y163NWUAp2qkAv5lM4zF/gZ6dBxRdRfNxXNnBu7/yoQXLiqwOaZVttcb7pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lfne+dj1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lfne+dj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9951F000E9;
	Thu, 27 Aug 2026 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787836015;
	bh=ZSuTZwdeaDVo8ilObKv1yNCokL2S+sutd5WfT+a22kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lfne+dj1c3eOzsZQQYORIe2wqZ8Hd+nnFmlXRR9bizxkA+mm4PhiSkK5JctbFRHGz
	 qgV8h6Wc0gV0ZMxA6x+hSPrSm3ygBn0HrueK7XlRZb0iNKWW+8FGnTj8q+f2biCu+4
	 Q9cSAqrKCLhK+c/U70mG8ugw5cyQpbyozWw+Cj/P3JXRfnTpWNe0OYlLR1zgldPcjO
	 FtA9ORbeowfPJFxXkZhf225GQXYsT4V7MqyFWcevVPYKDfx8LKp1bDsXfmtIWmlq6f
	 arXv9VxGH+aF1hWSC4X+N52gAZlC2aQ11S0n1JhbViwPKu7JCs0XpI1G0HzUsfNo3X
	 bZ3Xv5Ul1Qsiw==
Date: Thu, 27 Aug 2026 14:06:49 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <apA1Bm2BwpqPc86v@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7Nr_FALfP7cTY5@gremlin>
 <20260827082352.26769-1-lianux.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260827082352.26769-1-lianux.mm@gmail.com>

On Thu, Aug 27, 2026 at 04:23:27PM +0800, Lian Wang (ProcessMission) wrote:
> On Wed, 26 Aug 2026 12:31:09 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
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
> >
> > --
> > Cheers, Lorenzo
>
> You certainly can.  Thank you very much for everything you have done for
> THP and for all the people whose work you have reviewed.
Thanks :)

>
> You and David were among the first people to review the first patch I
> sent.  Later, SJ, Zi Yan, Mark Brown, and many others also began helping
> me.  Although I kept making mistakes, I genuinely wanted to learn enough
> to share some of the review and maintenance load that you have been
> carrying.

I'm glad I was able to help :) and mistakes are just part of being human, I
make the dumbest mistakes _constantly_ :>) so the key is really trying to
always find ways to quickly fix things up and improve.

>
> I still have a great deal to learn, but I have started to slow down, think
> more carefully, and improve both the technical quality of my work and the
> way I submit it.  The help I have received from the community means a lot
> to me, and your patience and reviews were an important part of that.

I really think going over and thinking carefully about the code and the
approach is really helpful.

Also review really helps with getting perspective on what other people are
doing and how things fit together so is super helpful for improving too
(part of why I do a lot of it!).

Am very glad the feedback has helped :) I know that sometimes I am not
quite as patient as I could be but I do try to do my best, and felt I've
developed over time as a reviewer, albeit never quite being perfect on that
front :)

>
> I know none of this changes the workload that led you to step down, but
> reading this made me realize again how much time and care you gave to all
> of us.  I will be at LPC this year, and I hope I can thank you in person.

Thanks, feel free to come say hi :)

>
> I will also be more disciplined about patch preparation, testing evidence,
> email formatting, revision history, and the overall submission and review
> workflow.  I hope that, over time, I can take on a useful share of the work
> rather than add to it.

Amazing, yeah I think the key thing to realise is that while feedback can
be painful (for me too!), everybody is aiming at the same thing - trying to
make things better and improve the kernel for everybody.

>
> Thank you again, Lorenzo.  I will miss having you as a THP co-maintainer,
> though I am very glad that you will still be around.

Thanks again for your kind words! :)

>
> Thanks,
> Lian

--
Cheers, Lorenzo
