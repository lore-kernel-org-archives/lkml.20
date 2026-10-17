Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8BC27A462;
	Sat, 17 Oct 2026 08:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792227002; cv=none; b=W9WQcCCOtw/V6AjSdG/Bfo5G33tV/H9I7gynfrvxSZxpujrF0QsHHWwUJ1X8zuEZ2PUJKIPqx7TDzdoH6ov30cvDz1eeadG6mUksRCYOaE6GvMuArATP3f0eNqI0nbpqjnODknBNpBJa/w9McA8pQImgmSMPsVThXZ350xFiOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792227002; c=relaxed/simple;
	bh=3ys5Ya/RmwpUblvy7iecYXS67oy6RhchdlsbYx1vUYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtPmoEZuI0fliYqpz+wwzrCURJS/WqcDeIozfpgF4t9k+giV9KpCRIa1bsS0BVmIsad4xt1ZxOmMpol7SCZHmU8+n0YFGEayuMWuvidiyhpHO0HyUPOMW9Xc+Ysx2jxnMKzIN06VUuV6P3800qzEZ9ARFQnsnKrv2ltx8OrIGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d6sa6H4R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d6sa6H4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4867D1F000C4;
	Sat, 17 Oct 2026 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792227000;
	bh=18BIlR+nJTPwNxyUfX/vUQaYlygqxxeuSnrDn0lht7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d6sa6H4RycAVSN17uMwk8wdmG24fdGGcluuOi4SLY/jw10K5R9EX4tSMth2F322Wo
	 wOpGSvTapjSv4bjS6T5RiIBpyULdhixkQuEn/iPPM7E+WOX8kWGGKWJ1GuJeWaEfnt
	 XO6ekCD9i4F70ySUWtovd1rF/G0GYEvOPtNVKEo4=
Date: Sat, 17 Oct 2026 10:49:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: document purpose of interface parent reference
Message-ID: <2026101737-distort-harsh-1cb4@gregkh>
References: <20261015074831.1418677-1-johan@kernel.org>
 <DM6K85ZAWSUG.VCF8TRYUDHJ0@kernel.org>
 <2026101759-charger-elite-39fb@gregkh>
 <atMxsLDLjo9rVjs7@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atMxsLDLjo9rVjs7@hovoldconsulting.com>

On Sat, Oct 17, 2026 at 10:28:32AM +0200, Johan Hovold wrote:
> On Sat, Oct 17, 2026 at 10:18:08AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Oct 16, 2026 at 10:54:17PM +0200, Danilo Krummrich wrote:
> > > On Thu Oct 15, 2026 at 9:48 AM CEST, Johan Hovold wrote:
> > > > See commits:
> > > >
> > > >   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
> > > >   af61396a992b ("driver core: fix parent lock use-after-free on USB disconnect")
> > > >
> > > > for further details.
> > > 
> > > The last one is now 0f554506a3fc ("driver core: fix parent lock use-after-free
> > > on USB disconnect"), and queued for a -fixes PR mid merge window.
> > > 
> > > Greg, please let me know if you want me to include this one, or if you will take
> > > it after -rc1 ist out.
> > 
> > I just grabbed it now, thanks.
> 
> I should have waited a bit with posting this one.
> 
> The commit id mentioned in the commit message above was changed when the
> driver core commit was moved from driver-core-testing to the
> driver-core-linus branch. I guess we can always find it via the patch
> link (or commit summary).

I can still edit this as it's not really lived long in my branch, what
should the text be here?

thanks,

greg k-h
