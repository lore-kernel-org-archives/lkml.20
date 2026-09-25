Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63F36E489;
	Fri, 25 Sep 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327106; cv=none; b=Kf50F55D+akTwjDAlBFJasIZRHFybGQzxwtK6SWlRF0NGkU0kx0j7wuxsMrkuJEKFYr90eGuFQJrS/TxtxRzDo0nsOO8wC9gPa6LB52vP64fD36dhhO1fSKBOf6clrOCpPpgKDO6UdgY3skwW6phBegZAOsVzRYQ94n/vQhKfcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327106; c=relaxed/simple;
	bh=c6llWUny0E66kPyHL/7p+1jeHNfgYEjMQRzHkRwU/gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqIh75WBLDZmvLC8/mj9uPRpf2YtF9t4c463aeiG+eXOs0I7PNREjPj35u4qZbtBp8xP2QQMRHUpkGPSNWxc8PuolppHHe2Uy6XoFutjftlztLFxwLXR0aDpkeVWAwjMz5vrRhNOlQrH3CK0msHn3xUwafbl+rsCqoNc9HVKVX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZddo08k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZddo08k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503711F000FF;
	Fri, 25 Sep 2026 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790327105;
	bh=4Ka6LcgqGURGXrWdrDOmkfnOgfMTXwW+K1BRk0D+ckA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mZddo08kjQ+SgHLQAxgFdL1h1WEoLYF7zKL0jS2/STRNoUxVXwfQ2NvvNMlKRKh2k
	 6zlWGwSRhfS1e7m3sm4mqXOjkdr1UPr9WXi1l3sCNgYq0XoKPaEgzZbHNi5iP1bgeM
	 d0edYwKQwj8FetdYpxNWBE5zdJcqG/k0p9EH4mFn0/kyrDFPrASLSt/EaZe7QomXNi
	 /98E8GqMn8EvPfzPpmdf3vrMjD/lTgrEuwyBvLcTEFryWfLhdE2ehIz535Aw2x8xs7
	 x1ZMN08u1RXxCovC414aGazppMXTZFxAToMvTwiKIC8cL5n8X5Z9sB0DRtTa+zL9kr
	 AJybpvZA1UTaA==
Date: Fri, 25 Sep 2026 11:05:00 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: document the branch in git T: entries
Message-ID: <arY5PNvhEdyx1W4u@ryzen>
References: <64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com>
 <2c05bf39-7e04-4cc7-9926-3cbf673865b5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c05bf39-7e04-4cc7-9926-3cbf673865b5@kernel.org>

Hello Matthias,

On Thu, Sep 24, 2026 at 10:22:32AM +0200, Krzysztof Kozlowski wrote:
> > @@ -30,6 +30,8 @@ Descriptions of section entries and preferred order
> >         See Documentation/maintainer/maintainer-entry-profile.rst for details.
> >  	T: *SCM* tree type and location.
> >  	   Type is one of: git, hg, quilt, stgit, topgit
> > +	   A git entry may name a branch after the URL; name one when
> > +	   development does not happen on the repository's HEAD.

I like the idea of what you are working on.

But one thing crossed my mind.

If we look in:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Next/Trees

You will see that for most trees, e.g. ext4.git, the same tree is specified
twice:
https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git#fixes
https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git#dev

That is because the most logical thing is to use the same tree, but obviously
you need different branches, if it is new development or a fix.


memblock even specify multiple entries in MAINTAINERS:
https://github.com/torvalds/linux/blob/v7.3-rc4/MAINTAINERS#L17035-L17036

memblock seems to be unique here though, and I don't like the idea of having
multiple T: entries for each branch in the same tree.

Possibly we could allow multiple branches to be specified after the tree,
but I'm not sure if that is a good idea.

A fix is usually merged within a week, so a developer should not really
need to think about "fixes" branch. They should just base it on latest
SHA1 in Linus's tree.


> What contributors need is the branch feeding next, because this is the
> base for them.

I think you are right.

Possibly the documentation should be updated to differentiate the "strictly
a fix / regression in recent release" case versus "new development" case...
but such documentation is hard to write in a generic way. (Not all fixes
might be so important that they deserve to be queued for -fixes.)

But we should probably try to add something to submitting-patches doc which
makes this distinction a bit clearer for a beginner.


Kind regards,
Niklas
