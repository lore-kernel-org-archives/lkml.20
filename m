Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA6277026;
	Sun, 18 Oct 2026 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792305200; cv=none; b=Y0Uumt8OzhUukqUoDYra5NrrWVZAmp7ToLELZHUzwRmfkhDZWBNqRIQskdk41rrgvd5UECeDVnb5kaTe4lBWBZfgNfdk9PqzRJ4zE/dET9t0oxijmDjO1VMclewetq30dCbqvOSh8DN98LSBIT2bhalv5BADIYEpu1j1EIjNOH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792305200; c=relaxed/simple;
	bh=fTQq3baiWMdYfx0Q8a21Yl4sPRMJBuSHVU1XC74vjWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFJaH3OX0MISui6OpXv1P4lTX25a8Td34+pDhOPx9zi8tQrGBEJRmg3OngvqrY1atnd5dNjwp9hHNOHY20jO0Xcvbq7foyBqMmbbbvHPVMtojOKpXtq0XS2PRUPSBEADJiqocUpk7f6sP8KwLRpXzMjoZya/YaKDO4MpYimSILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uLqXj1hh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uLqXj1hh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0B01F000C4;
	Sun, 18 Oct 2026 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792305199;
	bh=UaRJmFERky/mo8yFBithcos+Bsd5rz1z03eXuI8Oq4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uLqXj1hhZYl8WkDkuCX2GP9wA1ZOv+YHBuqZN/zD/xQjP19+YsIjoKVzwAaGLCsqZ
	 Oe7JJiCYdN5qj3BehHCSnqYnxnqe6ecl9fqn35+NNy3tIfOtGI3J781Jg0SVzec9pu
	 leF6V7n/P/2uuUMvpNBpLk88LkencC2AUmCVho3s=
Date: Sun, 18 Oct 2026 08:33:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Cc: johan@kernel.org, vireshk@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <2026101846-surfboard-fender-a3ce@gregkh>
References: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
 <2026101707-routine-hatchback-4a35@gregkh>
 <atN8FallRb8IbXT0@user>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atN8FallRb8IbXT0@user>

On Sat, Oct 17, 2026 at 07:15:57PM +0530, Yalagada Pavan Kumar wrote:
> On Sat, Oct 17, 2026 at 01:20:39PM +0200, Greg KH wrote:
> > On Thu, Oct 15, 2026 at 01:52:38PM +0530, pavankumaryalagada@gmail.com wrote:
> > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > > 
> > > Use %pe to print error pointers directly and display their
> > > error names.
> > > 
> > > Keep PTR_ERR() calls when the numeric error value is needed
> > > for returning the error code.
> > > 
> > > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > > ---
> > > v4:
> > > - Return error codes directly instead of storing them in ret,
> > >   as suggested by Julia Lawall.
> > > - Remove the unused ret variable.
> > 
> > 
> > Hi,
> > 
> > This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> > a patch that has triggered this response.  He used to manually respond
> > to these common problems, but in order to save his sanity (he kept
> > writing the same thing over and over, yet to different people), I was
> > created.  Hopefully you will not take offence and will fix the problem
> > in your patch and resubmit it so that it can be accepted into the Linux
> > kernel tree.
> > 
> > You are receiving this message because of the following common error(s)
> > as indicated below:
> > 
> > - Your patch did not apply to any known trees that Greg is in control
> >   of.  Possibly this is because you made it against Linus's tree, not
> >   the linux-next tree, which is where all of the development for the
> >   next version of the kernel is at.  Please refresh your patch against
> >   the linux-next tree, or even better yet, the development tree
> >   specified in the MAINTAINERS file for the subsystem you are submitting
> >   a patch for, and resend it.
> 
> This v4 patch did not apply because arche-apb-ctrl.c and arche-platform.c
> were removed by commit 2f75b2eac999.
> 
> The fw-core.c changes from my earlier v1 patch present in staging/staging-next.
> 
> Only the change to uart.c remains.
> 
> Should i send a v5 containing only the remaining change in uart.c?

If you wish to see this patch applied, yes.

> Also, should i keep Alex Elder's Reviewed-by tag in v5?

If the only change is removal of other parts of the patch, yes.

thanks,

greg k-h
