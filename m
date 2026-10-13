Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60CA253340;
	Tue, 13 Oct 2026 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879961; cv=none; b=PaIV7dR/S+iQ5EGbuviLbFsixTztSZJlizvxA4Xq7ogrIzdNGJXWmiBIe7KsRCUS1sqtjv7mSV0FUhQkmclQmXofnFbLzVoavf8frNFJaCCRTkXk2zOZHuIZC9gJejkFYs5K8YmhEM1JCJECSKSWjzZuJiCVTovRJNdYssaDVRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879961; c=relaxed/simple;
	bh=4+e2L81th8/ghLRy07Uxy5Ux/SPPV8yxuW+/HcC99u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gt7mIBdayBAGjw/UkhL3mBqFeDiK0BzkT7TXAX3cZqlQhfp80iqh4Frv7/sSnyMfrhkv8dKYsPkKEQMtej7xsHXB6eWZ9FSCgFvAGa42mLNwJ2IBJZVPeT+DfLE4O1UjWLiykpaW6DrV1gQPdhj9JaauphPgLDTX3O2M1b7nRiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIaVZUlP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIaVZUlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4981F000FF;
	Tue, 13 Oct 2026 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791879960;
	bh=GDHL78zpwrDmstbdLgcJ9oSfRFzRztMFHf+wlBz7JGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JIaVZUlPRUrJbi4zuV7K/C28jgMN/+i+L6TGxf1VCq9I3rCaSEVFmAADzHObFieAc
	 h2ufdWjUQEwRmc5h/s/J81w9jJYmWSG46rroFNruJXYbgYeqHwsljdFkvk0c/8DWQh
	 5ZXo/r/NDP+OzhTDNW8PGV28kI34b59DeWRuF+rpU/IEe7uk+cUaTTEHM6MxMG7FCj
	 Bftk62ptzMnaLShTuXN5Eftgq55DdikMJ7k7Q8TVQU8NvmpRlTw/4WDt06z6IGi7RO
	 XMYgUCKVcXvjpOYIQoHesGbNEJvVEIee7dEryWMbcb/mzxM7Ux31KcFWF9YizCPhBo
	 mQWy/kvqfJ7lA==
Date: Tue, 13 Oct 2026 01:25:59 -0700
From: Kees Cook <kees@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <202610130120.E43D236E@keescook>
References: <20261009083137.3-1-sashal@kernel.org>
 <202610122124.08E058768D@keescook>
 <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea3ff257-70e2-43e4-aba7-140e84994872@infradead.org>

On Mon, Oct 12, 2026 at 10:56:59PM -0700, Randy Dunlap wrote:
> On 10/12/26 9:24 PM, Kees Cook wrote:
> > On Fri, Oct 09, 2026 at 04:31:37AM -0400, Sasha Levin wrote:
> >> The Maintainers Summit reached consensus to deprecate the Assisted-by
> >> tag. Remove the documentation requiring it.
> >>
> >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> > 
> > Yup, it has become as redundant as specifying what editor I use. ;)
> > 
> > Reviewed-by: Kees Cook <kees@kernel.org>
> 
> and for those of us who don't know details about the discussion,
> how is it redundant?

No, I mean I use an LLM constantly for almost all aspects of my
development work, in multiple dimensions, so if the old tag requirement
held, my email body template would just put "Assisted-by: LLM" in there
because at the very least, it drove the build and test stage. It was
redundant in the sense of "yeah, of course I used an LLM at some point
for this patch". ("This tag means nothing *from* me")

> Do you assume that everyone now uses it (LLM), just as everyone
> uses an editor?

I don't make that assumption, but I always held the position that the
tag was meaningless because it's the human wielding it that matters:
they either sent a good patch or a bad patch, and if it was mangled by
gmail or an LLM, it doesn't really matter. ("This tag means nothing *to*
me")

-Kees

-- 
Kees Cook
