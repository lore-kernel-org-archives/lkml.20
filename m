Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E5F1A6820;
	Sat, 17 Oct 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233678; cv=none; b=k/Tn4FS5lrP/4eDIA4HdP3AGWKVxu4im0CrLNmG27vgUaTKAVDaC2HEKVFM+loQSEoV3mX1jdoxJ40WzNiRvMltqssvsBzlNFW5NXtPsyEhdU5IwIyEEy5TZRM4yQMbulhce0Bgz2nsQA3wRQsPt94HNHGcgeZ7WzV/t45UlSFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233678; c=relaxed/simple;
	bh=aID7yxZ75PCDJU8YTjYh8ef6ooIx930s0RqDpT+Ey1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Re4HMt2EhaAcx45XL73JHw7J2KSyvITu1rCT4Tw4OcVTtDqXUZFZr8RFu6XJLg/L1EBSUd42dVQ99wjN5jxQhY48ZCmYARHaw3LpBK/FYm2IZG88my/290ZZ5GsRkGcNSILYKKQ6wTDmYOzShzvYf4KUgl2NreLRF2g7YU7fC0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ICHA7by7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ICHA7by7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C8B1F000C4;
	Sat, 17 Oct 2026 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792233677;
	bh=nesoiyd3xT5GEbl4hfT9ys/utT9179Yt85GJELHlFck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ICHA7by7pQNI5a1OCk9QC0fyr76xooA+K0i6kO48yjNEEH/OAU49ruO5YxVGBTN/J
	 Rjp4PxRbNkTLFqbbnkZ/xnCSKZB3+0UATUho3U6MJ85bSbYSwSx822ClrJAgMoanTN
	 ldcyFE8qXNVvUlCFokwtrnFU7iyASNZroqRFxnYs=
Date: Sat, 17 Oct 2026 12:41:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: document purpose of interface parent reference
Message-ID: <2026101708-boogieman-botch-fe8b@gregkh>
References: <20261015074831.1418677-1-johan@kernel.org>
 <DM6K85ZAWSUG.VCF8TRYUDHJ0@kernel.org>
 <2026101759-charger-elite-39fb@gregkh>
 <atMxsLDLjo9rVjs7@hovoldconsulting.com>
 <2026101737-distort-harsh-1cb4@gregkh>
 <atM4adZLm_qfYb9s@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atM4adZLm_qfYb9s@hovoldconsulting.com>

On Sat, Oct 17, 2026 at 10:57:13AM +0200, Johan Hovold wrote:
> On Sat, Oct 17, 2026 at 10:49:57AM +0200, Greg Kroah-Hartman wrote:
> > On Sat, Oct 17, 2026 at 10:28:32AM +0200, Johan Hovold wrote:
> > > On Sat, Oct 17, 2026 at 10:18:08AM +0200, Greg Kroah-Hartman wrote:
> > > > On Fri, Oct 16, 2026 at 10:54:17PM +0200, Danilo Krummrich wrote:
> > > > > On Thu Oct 15, 2026 at 9:48 AM CEST, Johan Hovold wrote:
> > > > > > See commits:
> > > > > >
> > > > > >   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
> > > > > >   af61396a992b ("driver core: fix parent lock use-after-free on USB disconnect")
> > > > > >
> > > > > > for further details.
> > > > > 
> > > > > The last one is now 0f554506a3fc ("driver core: fix parent lock use-after-free
> > > > > on USB disconnect"), and queued for a -fixes PR mid merge window.
> > > > > 
> > > > > Greg, please let me know if you want me to include this one, or if you will take
> > > > > it after -rc1 ist out.
> > > > 
> > > > I just grabbed it now, thanks.
> > > 
> > > I should have waited a bit with posting this one.
> > > 
> > > The commit id mentioned in the commit message above was changed when the
> > > driver core commit was moved from driver-core-testing to the
> > > driver-core-linus branch. I guess we can always find it via the patch
> > > link (or commit summary).
> > 
> > I can still edit this as it's not really lived long in my branch, what
> > should the text be here?
> 
> The second reference should be:
> 
> 	0f554506a3fc ("driver core: fix parent lock use-after-free on USB disconnect")

Now fixed up, thanks.

greg k-h
