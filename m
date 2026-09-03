Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFB14A5ED0;
	Thu,  3 Sep 2026 12:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440099; cv=none; b=B1nQ46KK2KV8+NkYkaUJf92bJ7XJCkj/saVI/Rhv/tPzYO10av6rKWcNgfFCjQcAFTsEzbDkmMTOgwZ9GkSa24P0UYQwhyD4fwpTZ3xkkWz4bGll0U9Td+HBxKMvyUzhwJfKVHPN6rfY2n4aTHSySD8Qliv3yD+QgabECHRYYQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440099; c=relaxed/simple;
	bh=sZ3XNWUezqA67lIFCv3P787xp6Cn62FJf9b4Y+C2J34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9lMWIOjPMJXjMt4Mueb9MSFm/VsSbr5AHUxXimS80u5JzJM1CeZopKeYBij7mCtCXv4BNdvxBtA4zAcQFGZansTGIWAzPw7qAFiEC48l1aE6mKL/NEnEFrYkJrAsXnhMELwVjhPaJkZyeZZqwzQ0LrA2onBzIsfaxfugbIiLe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dW1N8ZPE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dW1N8ZPE"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E63822335;
	Thu,  3 Sep 2026 14:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788440004;
	bh=sZ3XNWUezqA67lIFCv3P787xp6Cn62FJf9b4Y+C2J34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dW1N8ZPEGT4AEd6G+yLimxmjYvusVqTRIkihhtwRCgOQT6GLvMgwuCjusNC3zkc2K
	 KE4cfktigGoXAbSLYc9u0zME5ZAuae1dqB+3By4lXHS8/Tzrwxe/b/PqhTAHUrO3YG
	 r4dD4C0bCebbiYdwy4RkUWpvT42SwfjRpHcM9Ms4=
Date: Thu, 3 Sep 2026 15:54:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Nguyen Duc Thinh <ducthinh100812@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone,
Message-ID: <20260903125454.GA541154@killaraus.ideasonboard.com>
References: <20260902084430.17248-1-ducthinh100812@gmail.com>
 <aploLWg-i315frp5@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aploLWg-i315frp5@wyuan.org>

On Thu, Sep 03, 2026 at 08:29:33PM +0800, Weijie Yuan wrote:
> Thanks for Cc'ing me.
> 
> On Wed, Sep 02, 2026 at 03:43:58PM +0700, Nguyen Duc Thinh wrote:
> > This patch series performs a thorough pass across several files 
> > in the Linux kernel process documentation directory. The primary focus
> > is to improve readability and maintain a professional tone throughout 
> > the guides for a global developer audience.
> > 
> > Core changes include:
> > - Expanding conversational contractions (e.g., "don't" to "do not").
> 
> Is this necessary? I'm not sure.

It seems a bit pointless to me. Contractions will creep back in as
patches are merged. We would need e documentation editor in charge of
ensuring a consistent style, and I think the documentation maintainers
have far better things to do.

> > - Rectifying minor punctuation oversights and grammatical typos.
> > - Standardizing terminology formatting to elevate professional voice.
> > 
> > Extra notes:
> > - I originally intended to send a 12-patch series to cover the whole
> >   directory, but decided to scale it back to these 5 high-quality
> >   patches to ensure thorough accuracy and a manageable review cycle.
> >   
> >   Also I want to know the current progress of the patch titled 
> >   "Capitalize Git, Quilt, and Mercurial consistently".
> 
> It has been applied:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git/commit/?id=4a0be1a25d98672391e8ad2a0802f08609397274
> 
> > v2:
> >   - Resending the complete 5-patch series together as a single cohesive 
> >     thread. (Apologies, the v1 submission suffered a terminal wildcard 
> >     argument error that accidentally truncated the transmission 
> >     after 1/5).
> 
> A better practice is to name it [PATCH v1 RESEND], I guess?
> 
> > Nguyen Duc Thinh (5):
> >   Documentation: process: Clean up grammar, tone, and contractions in
> >     core files
> >   Documentation: process: Clean up grammar and tone in next guide files
> >   Documentation: process: Refine language, tone, and grammar in
> >     subsequent files
> >   Documentation: process: Refine language, tone, and grammar in
> >     subsequent files
> >   Documentation: process: Clean up grammar and tone across multiple
> >     files
> 
> Output of 'b4 shazam':
> 
> ...
> Applying: Documentation: process: Clean up grammar, tone, and contractions in core files
> Applying: Documentation: process: Clean up grammar and tone in next guide files
> Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
> Applying: Documentation: process: Refine language, tone, and grammar in subsequent files
> Applying: Documentation: process: Clean up grammar and tone across multiple files
> /home/user/Projects/linux/.git/rebase-apply/patch:72: trailing whitespace.
>   License (about which more will be said below).  The author is not a
> warning: 1 line adds whitespace errors.
> /home/user/Projects/linux/.git/rebase-apply/patch:244: trailing whitespace.
> Which is nice, since there is no more insanity in the form of fake-generic
> warning: 1 line adds whitespace errors.
> /home/user/Projects/linux/.git/rebase-apply/patch:261: trailing whitespace.
>    rare cases, an AI assistant capable of finding a bug is capable of fixing it.
> /home/user/Projects/linux/.git/rebase-apply/patch:262: trailing whitespace.
>    Fixes written within the same session used to identify the bug will
> /home/user/Projects/linux/.git/rebase-apply/patch:263: trailing whitespace.
>    generally lead to better and more accurate fixes as the LLM's reasoning
> /home/user/Projects/linux/.git/rebase-apply/patch:282: trailing whitespace.
> - Within two weeks, a representative of this group will communicate the
> warning: 4 lines add whitespace errors.
> 
> Should we handle with whitespace?

-- 
Regards,

Laurent Pinchart
