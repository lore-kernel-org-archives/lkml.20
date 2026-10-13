Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE18A4AD4BD;
	Tue, 13 Oct 2026 06:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872331; cv=none; b=VjKlA2uZawNfk+r3qKumzwOtv2Xqi+8KwqWF8w71abeFGENlUv4zjMgAWh1Dh23eazwCHmakAVTtCSLiT5Z5jdu0M/uFh4b2Iq9FH+ayYcgHlPid/tNXctDVry/XUOYpH1+RMAjs/f8r2c3DI9+shFvMuTshDoMTwQ4GT+bUj7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872331; c=relaxed/simple;
	bh=0b/pAISD1D5CdnldwffbixhoouHqE4LHCiAv5KpNApU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJx8XG0p7Mm9WLRZxlzIadMliH5ByJYrMoo4Vmo7RozgXmuZFz3XFs6JKawPFX7bXBcD/HZdsKVllzYdiia/4wwBqKErQn0m5Gd1DPZHG/5v3MkZX+6XPXfflM1HELFxw0lcXlOfKYezq1GuanWfTaWEcLPpuHVDfM9mizY1KG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TvxaHE0I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TvxaHE0I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7F41F000FF;
	Tue, 13 Oct 2026 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791872330;
	bh=dKnRmP26KfLdhc5NFoP1VHt3F0PVDy4c1kiQGz0rqow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TvxaHE0I4evG3ISqKoI1pb+TMKZT9KzsTAcpcB0Knt5eQMp5LCUL3Tg+04RYT/SIw
	 8DI58pJPwdy0dEjaj/BrK8SSjfx6Wx1UuARHsVdp6TE/rQZV+/PYlqSC3jzkVJw38U
	 SU2qqrd7RTbZDxLu0yPOMjRI325ESxgOaFTsLW/4=
Date: Tue, 13 Oct 2026 08:18:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Sasha Levin <sashal@kernel.org>,
	corbet@lwn.net, skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <2026101327-cupid-legal-6cf6@gregkh>
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
> 
> 
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

lwn.net now has the "meeting notes" where this was discussed:
	https://lwn.net/Articles/1099594/

> Do you assume that everyone now uses it (LLM), just as everyone
> uses an editor?
> 
> I still agree with what GregKH said on July 2, 2026, in
> https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/

As I stated elsewhere in this thread, I've now changed my mind, it
didn't work out at all and maintainers are really annoyed by it so let's
just drop it and focus on the content of the patch itself (and push back
on _ANYTHING_ you feel is wrong).

thanks,

greg k-h
