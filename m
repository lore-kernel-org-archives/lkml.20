Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042004;
	b=GhgoL8zgZDPyOJmcLcjZn+dQsfhbwn/+LiiSTVhOvGz6JV43bF6KLiXPBlKx6zrQ9YW4
	 zXyNrHDlz9bRpzTrheF9Zpb8HwFk88F67YIpFi/4HYtp/XDwCSpy/mfvpV2bUOlepNSWU
	 kj8dZNrUIpypd16/VAAXW3k03AfThGfWRcOF6RsBDKsl01/vptFLwW37peWuePoCV/0qO
	 3i2sfc1blrsQvSuacy5rhFRSu9F+F/a0qeGZuO6oYCpxTIDE4vsGka9KrZrXSlkx2hqOY
	 sZf5FEIEOqVNS8sSloTNEMHdWHiz+udo4FYzcH7p3iNhzIq8Gg4qhl0znQSgcb94aTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042004;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=3yrz+Ov6jBpPKPNpWn5AEy9fZTQAY5u9WL+GOyU2/X0=;
	b=HXIhY3XtF1P5hyAmLKuYXDyv695DINrRgG6U4Gy/6q73OHCEWJldFuVGbtEP4v0O5R0p
	 O7YW/wX+EoMDxVyyz4eU/9XLpxyRSicdPQrJQbzfs5w1vo9o7H5hXVCc/ymFStLcbZLRj
	 voW37OdoasQ7cPQE2w+Kw3WWE80sUTUAGC1fsKD17xIfkuwKKltKAisxcBK86pw5J4RU4
	 UkCeSM32r3pG0RG9KXHRDS5Fce+qMje0tqYZubkEnOZlMxo9ssJAlsX7oX4pE3gamwSjy
	 U3/ROXmzIB51Fen6z/WYVMh3QaRUWFedWtevLg+FAzyWTOUEUrRKiPfHE5fZ3K2Ku0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UlrdTnkq;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D377606A31E;
	Mon, 26 Oct 2026 19:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D377606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UlrdTnkq
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E18CCB1A;
	Mon, 26 Oct 2026 20:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793041870;
	bh=ivDiP8NI9Z30mey8L2KGIt+N5uRIkUdxK3fKOwTUsIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UlrdTnkqAoAFbqjmbN7M+tq859syiUuvI+z+afkwnI9wFCwCRXWY9kCG97buiEXVC
	 U+0a9Ivky/rYi9rgEJmtnrzqSlvTK4XpOX3qlDrv08bfpheaKA6L1DzqC1eX27Y38F
	 rxMygoM85k+PJJ8+lIC35GjauAVkRbhTzsxWUz50=
Date: Mon, 26 Oct 2026 21:13:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [GIT PULL for v7.4] media updates
Message-ID: <20261026191319.GA1996520@killaraus.ideasonboard.com>
References: <20261024185058.20410953@foz.lan>
 <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
 <at-a-2wTtf7bJQwU@kekkonen.localdomain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <at-a-2wTtf7bJQwU@kekkonen.localdomain>

On Mon, Oct 26, 2026 at 08:24:59PM +0200, Sakari Ailus wrote:
> Hi Linus, Mauro,
> 
> On Mon, Oct 26, 2026 at 07:34:12AM -1000, Linus Torvalds wrote:
> > On Sat, 24 Oct 2026 at 06:51, Mauro Carvalho Chehab wrote:
> > > Sakari Ailus (60):
> > >       media: Don't hide I²C or SPI drivers by default
> > 
> > This needs to be fixed some way.
> > 
> > The kernel config is asking about ridiculous things that no sane user
> > can know the answer to. And that change has made it worse.
> > 
> > Asking a user for random media drivers by chip ID is *NOT* ok. It
> > needs to be hidden some way. If the old way didn't work, some new way
> > needs to happen.
> > 
> > Guys, the kernel config phase is already *the* most annoying thing for
> > people trying to build their own kernel. Don't make it worse by asking
> > questions that make no sense to a normal user.
> 
> The patch in question puts camera sensors and related chips in line with
> how the rest of the drivers are selected elsewhere.
> 
> The reason why I wrote the patch was that Arch Linux kernel missed enabling
> these drivers, which given how the MEDIA_HIDE_ANCILLARY_SUBDRV option
> worked before the patch was to be expected at some point (rather it's a
> small miracle no-one had complained about this earlier). Raw camera sensors
> are quite common in laptops these days and the only way to enable compiling
> them before my patch was to enable CONFIG_EXPERT first.
> 
> I guess we could have an option to compile pretty much all media drivers as
> modules (it may be hard to draw a line) and then require CONFIG_EXPERT to
> allow choosing amongst them. I'm not sure I like that idea much though.

As far as I understand, the goal of the patch was to stop hiding the
"Miscellaneous helper chips" section by default, and let users select
VIDEO_INTEL_CVS. While the commit message states that it applies to all
camera and lens VCM drivers, that doesn't seem to be the case, those are
not covered by MEDIA_HIDE_ANCILLARY_SUBDRV today as far as I can tell.

One simple option could be to drop MEDIA_HIDE_ANCILLARY_SUBDRV only for
the section that covers the CVS. It's not ideal, but it could be a quick
fix until we find a better option.

Junjie also proposed automatically selecting VIDEO_INTEL_CVS in
VIDEO_INTEL_IPU6 and VIDEO_INTEL_IPU7. You didn't like that because CVS
is an I2C device separate from the IPU6 and IPU7, but is it found in any
platform other than in conjunction with an IPU6 or IPU7 ?

> I wonder what others think.
> 
> Also cc Hans and Laurent.

-- 
Regards,

Laurent Pinchart
