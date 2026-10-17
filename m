Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952443BB9F5;
	Sat, 17 Oct 2026 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792227436; cv=none; b=fZjylc/3FDP7CgSnFJ/JlicVeV9pfbgYmZ/42FeZUB46XyFHG4dpbu4dOdL9P6hgzrxZAn53Zl+ruaW5INndE7u6d/HYmivXg25Kkp03B59fRkBsdYdt8x7qrVwdwiu7UbyPXq9UTGn6CKIxtYNq/frqSpsrR/8NU5Dc/g63HDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792227436; c=relaxed/simple;
	bh=C7ndD7U9Qawo2WRx0tDyIjcrESkjtHsB0ZYI6qwNI8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOVZ4rf2JMM36mlaLdfJ+zGtf3P9jI/FhCU8igMQ/zmN5WMFBTK4cCdh7FhBCdJ3Kv/g29MkNCDAOPOZxyYXOwFLFPFEkH+SvinY5e3zwZxRD+JWyD5v3tFP1co2xCp9ME4Fl8HN57aXE1R90ezCYKHWv49ARjS/ATwyJsOAkoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvAYBqYG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvAYBqYG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A831F000C4;
	Sat, 17 Oct 2026 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792227435;
	bh=ujI4rap9eJVM8u2Ua4kMH5tajhCICDKyeN9lG32xgB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BvAYBqYGLIUvzwiRy8/FEiWO5hLjD2WgbFidQNV/pKDQ6CY6codlbcVw28NVKtEcR
	 YSiyMhe7+ypzm+N+LGu/GUh8Av8Xjg6YvpSxGudSDO5zfU0s/UuiMTWLfIqh+YRJbw
	 lUKLIOk4nfhX/kwgceS5yG/uiG5NfPCF5wTigdgSpHLV6h5ajggsgUFd8YdMO6NUvr
	 l47sfIscC+1AOG/JMRce69nqmgUXMkuXLMCcIxiOqnFpH3YmorK9DQeQII0uGK/sHw
	 yiySLAVSJ9hTia0aqpeDOrx9wU3o049c860CuyU8UDpFF+4t4TYHiwPvuxL6OfQgy1
	 /A3PVKb/RMlwQ==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xI0E5-00000007FIn-0cKC;
	Sat, 17 Oct 2026 10:57:13 +0200
Date: Sat, 17 Oct 2026 10:57:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: document purpose of interface parent reference
Message-ID: <atM4adZLm_qfYb9s@hovoldconsulting.com>
References: <20261015074831.1418677-1-johan@kernel.org>
 <DM6K85ZAWSUG.VCF8TRYUDHJ0@kernel.org>
 <2026101759-charger-elite-39fb@gregkh>
 <atMxsLDLjo9rVjs7@hovoldconsulting.com>
 <2026101737-distort-harsh-1cb4@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101737-distort-harsh-1cb4@gregkh>

On Sat, Oct 17, 2026 at 10:49:57AM +0200, Greg Kroah-Hartman wrote:
> On Sat, Oct 17, 2026 at 10:28:32AM +0200, Johan Hovold wrote:
> > On Sat, Oct 17, 2026 at 10:18:08AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Oct 16, 2026 at 10:54:17PM +0200, Danilo Krummrich wrote:
> > > > On Thu Oct 15, 2026 at 9:48 AM CEST, Johan Hovold wrote:
> > > > > See commits:
> > > > >
> > > > >   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
> > > > >   af61396a992b ("driver core: fix parent lock use-after-free on USB disconnect")
> > > > >
> > > > > for further details.
> > > > 
> > > > The last one is now 0f554506a3fc ("driver core: fix parent lock use-after-free
> > > > on USB disconnect"), and queued for a -fixes PR mid merge window.
> > > > 
> > > > Greg, please let me know if you want me to include this one, or if you will take
> > > > it after -rc1 ist out.
> > > 
> > > I just grabbed it now, thanks.
> > 
> > I should have waited a bit with posting this one.
> > 
> > The commit id mentioned in the commit message above was changed when the
> > driver core commit was moved from driver-core-testing to the
> > driver-core-linus branch. I guess we can always find it via the patch
> > link (or commit summary).
> 
> I can still edit this as it's not really lived long in my branch, what
> should the text be here?

The second reference should be:

	0f554506a3fc ("driver core: fix parent lock use-after-free on USB disconnect")

Thanks!

Johan
