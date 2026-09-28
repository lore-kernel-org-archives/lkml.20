Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEE04DAFA5;
	Mon, 28 Sep 2026 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628495; cv=none; b=qdrs7dtP9+743Ys5Y9kXGyQ0WkV+4Of1r+FvIA5La0kevIGYJHNfoIkZ35Ifk335BBnAaI1OfjB/f2LU6x6ck0b9rDWROAzZhaclqlqTyb7ClyNDybKzTZVvzVWq2GYn8aTqXBWdEGfg1NZHFoQahXlFo2DELAmNtrrZJTkHu2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628495; c=relaxed/simple;
	bh=Sj+x23nJImAPh1NpjfrqXDjUUWAwofPzDCBHe/0oQYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gv+wBUV5qeoaUHFuBHuwrpj1jkBsUviAOX3K459q8lOQXh6BrQGS3NLLhO0Jtb7VvxEUhQuVvtYOgx942KgxbiuIXxGmOtJztcImNP9a0wG0E/UpWj/RWLmHCAHQ7mdbagC31hHcGnv9TCzPlsci15gq9ehjWWwLKCCOtbTu2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OQM3RNwX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OQM3RNwX"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25685B07;
	Mon, 28 Sep 2026 22:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790628381;
	bh=Sj+x23nJImAPh1NpjfrqXDjUUWAwofPzDCBHe/0oQYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQM3RNwX2eSLDccDLSX7fIIJATFk5Zy72lPRJvR719VDN7sCMgcPhygVZ5del7Euo
	 0sM6ENvBO+LUyyGwNJb0UnlCxl5B3PE7zXbbsF7O+tckaQiWvKQI12O+LcovJAtgSr
	 5DyV4UEpLg4Vl+k7qfa4SSPbO1gVYgdgCLqPJU5M=
Date: Mon, 28 Sep 2026 23:48:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Natasha Klaus <natalie.klaus@runtimeverification.com>,
	noambs2999@gmail.com, ribalda@chromium.org, hansg@kernel.org,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
Message-ID: <20260928204810.GK4406@killaraus.ideasonboard.com>
References: <20260818092803.4f51e6dc@pumpkin>
 <20260820091339.42288-1-natalie.klaus@runtimeverification.com>
 <20260820113129.299aa918@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260820113129.299aa918@pumpkin>

On Thu, Aug 20, 2026 at 11:31:29AM +0100, David Laight wrote:
> On Thu, 20 Aug 2026 12:13:39 +0300 Natasha Klaus wrote:
> > On Tue, 18 Aug 2026, David Laight wrote:
> > > I'd bet there is a requirement that width*bpp is a multiple of 8 (or even 32)?
> > > You definitely don't want the divide rounding down!  
> > 
> > There is no such check. bpp is a raw descriptor byte at uvc_driver.c:405, and
> > wWidth is unvalidated. The rounding is pre-existing, c0efd232929c has the same
> > /8, so it is not a regression, but it should be DIV_ROUND_UP. uvc_driver.c:431
> > already uses it thirty lines below.
> 
> I'd guess that the only values of bpp that have ever been used are 1, 2, 4, 8,
> 16, 24?, 32 and maybe 64 (for 16bit colour).

Looking at the descriptors for 456 devices, I get 6 different bpp values
with the following number of formats for each bpp:

     43 bBitsPerPixel 8
      1 bBitsPerPixel 10
     18 bBitsPerPixel 12
    446 bBitsPerPixel 16
     12 bBitsPerPixel 24
      1 bBitsPerPixel 32

We of course can't rule out other values. For cameras outputting raw
data (very uncommon), 14, 18, 20 or 22 could be seen.

This being said, I expect width * bpp to always be a multiple of 8.
Splitting a byte across two lines wouldn't make sense.

> Anything else won't go through a hardware FIFO.
> Similarly the hardware wants to do a whole number of memory reads for each
> video line - otherwise it all gets hard to get the porches right.
> 
> > > > +		if (bufsize > U32_MAX) {  
> > > 
> > > Should that be >= ?  
> > 
> > No, U32_MAX itself fits.
> 
> Brain fade :-)
> 
> David
> 
> > > I'd include the bpp, width and height values in the trace.  
> > 
> > Agreed, will do.
> > 
> > I am carrying this as part of a three-patch series at Ricardo's request. Will
> > fold in the rounding and the trace values.
> > 
> > Natasha

-- 
Regards,

Laurent Pinchart
