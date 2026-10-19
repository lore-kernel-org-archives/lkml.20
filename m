Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA05331EB8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416424; cv=none; b=ds29jtA7N5PoifMi6Br90svH8IlxQ79XFtDSKw507NiL3Q0uLnJbpKew4t++X1VbvVzG4VV1WA8yvvmbBSOgsh9SY4uVmfFOUtajR4VkjmCF4SzI5pCmeNndAktQmSQTV9j6ouSjIv3bUP2nQsIhNC/vvZ4/i5UYwv+kao3XqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416424; c=relaxed/simple;
	bh=cBEbiXl6lphFYFUWmUuusO74xRPEba8IBlclVNgiiYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W73ZPJ3n1+cxKaiF36+rJyXfJYdXzkgcWeBWH19h53Hs7b2y4wQq4V+2YGfuXkPBg9FH1TWMLhNPWE3TsvrkUZRWmB/Tanf9RN21xuj/XHsBxDs64UTngHq3tLDWJ6p7+F4ILM12zOZixg4nCT+7ruQZjT30tlIDWy5UAbqBIVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoO97zB5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoO97zB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A0A1F000C4;
	Mon, 19 Oct 2026 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792416423;
	bh=mZ/yJ4dwS0nFEA/LwTAGUHV7Cz0xHftBUnFwL0NH36A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YoO97zB5l64bkgGGRHVPrac5zt4TgQBHFw8dQ6KbkSJLpA8ekU6CJ+u+NzM8vAHU5
	 qntGXOzMdi7UI99ZlQ6uC5G8+plqCHWSg7kwDtggOLoW18k/GrwWpSOMd9o9OGd+o1
	 vccqzwUfqlnb4ySkhIN04iSfzLK6XSj8XdNC97tmzdWg3tDx5AFPF+6FXgrLkscngc
	 TrHXsu8bGQtMio/5ceUpfT/TqSDXGvCggZNggvGYQELY2n2OJe08ZDUwPWiLzY/Icz
	 9BUSvn2jhfje8yUwI7NZy3xA7pXcdf25LYM/7ajs0JZDnMKmAYsfq4R7e9YMnDa+HD
	 BazwhF0WgBzIA==
Date: Mon, 19 Oct 2026 14:27:01 +0100
From: Harry Yoo <harry@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: akpm@linux-foundation.org, cl@gentwo.org, hao.li@linux.dev, hch@lst.de, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, nickolai@csail.mit.edu, rientjes@google.com, 
	roman.gushchin@linux.dev, vbabka@kernel.org, vitaly.vul@partner.samsung.com
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array
 after concurrent resizes
Message-ID: <atYZnuRTTG7iweuK@thinkstation>
References: <atTh-yyVIPQ-zNWJ@thinkstation>
 <20261018160315.1465504-1-vitaly.wool@konsulko.se>
 <atTv1tg9q9n92kZv@thinkstation>
 <F846CE95-6D2A-4D53-9C09-5C8630E2C8A7@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F846CE95-6D2A-4D53-9C09-5C8630E2C8A7@konsulko.se>

On Mon, Oct 19, 2026 at 08:45:55AM +0200, Vitaly Wool wrote:
> 
> 
> > On Oct 18, 2026, at 6:15 PM, Harry Yoo <harry@kernel.org> wrote:
> > 
> > On Sun, Oct 18, 2026 at 06:03:15PM +0200, Vitaly Wool wrote:
> >>>> How about we take my patch [1] instead since
> >>>> it isn't prone to this bug and is a nice optimization to the existing
> >>>> mempool_resize() at the same time?
> >>> 
> >>> It is not a good idea to squeeze a bug fix and an optimization
> >>> into one patch.
> >> 
> >> Generally speaking, yes. But that patch had been submitted before the fix
> >> popped up, so there was no sqeezing per se.
> > 
> > I mean the patch you've submitted does two things (wihch is not good).
> > 
> > It should be split into two patches that 1) fixes the bug and 2)
> > optimizes it.
> 
> I don’t think this is a fair statement. I would say that the patch
> I’ve submitted improves mempool_resize() to be rid of unnecessary
> reallocations and data copying, and that (improved) implementation is
> *not* prone to the race found in the previous version of this function.

We backport bugfixes to -stable, but don't want to backport
performance optimizations to -stable in general.

-- 
Cheers,
Harry / Hyeonggon
