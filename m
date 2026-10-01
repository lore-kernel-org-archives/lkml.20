Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEF937FF48;
	Thu,  1 Oct 2026 05:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833341; cv=none; b=mHt0/JHgwCKQp0US734Sr+Zk8pfg/VnpXvuq/wMFT7uBzLxwIyToQuKRDVRbskTWnOOk0cpPqH/4uAKUNmairu8u/sJ/+sNLZOpgYegCsmvYJoiMb/j+bSgz8WO1QCqv/Ypy1X7V8RisMWe1Qqo2lkmHKG9DnMk0C/KnQkDzlY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833341; c=relaxed/simple;
	bh=qM2+IlXgxzCvRL1V0xvEgDu1jH9GrS8PIF5q4v/tma0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3suLFSqnqegDSYLwMBrDEC1jG9rIJH7w8JSHSf2Kk7LWlLsJ7tgCU1Nz7g/GTyo4nlVDZ8WW2FSQQQ9unUhndSu7y+iEGRcs0Rw/99/M36MTJ2oSADeKAQCwAHWfmmh3/+wsW1IsqM2nwRKsGd9DU3J3v9yqMCaCq8b56A7iSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UJ5M7Hwd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UJ5M7Hwd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AF51F000FF;
	Thu,  1 Oct 2026 05:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833339;
	bh=YFqHc2IPL4HsStJHwRBHONtEGCcmeJb8M30ksqgsN7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UJ5M7HwdQysgOsMzcvmfRvOuoQiFiDzJ9tWq7R2b1MDnauodGaG+ZLp2NXSvVNRFY
	 K2tdeT+6dESwEPybreehixdN7+4ltEGmuuivuvANW4XdPwM4aJOUOmwkFYPniG9uV9
	 OhFJP2ZXXOg/X/8EffSSTh8ngSj6MIlNdVvIAq8I=
Date: Thu, 1 Oct 2026 07:42:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Enzo Frese <freseenzo@gmail.com>
Cc: Jennifer Guo <guojy.bj@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Dan Carpenter <error27@gmail.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Michael =?iso-8859-1?Q?Steinm=F6tzger?= <m.steinmoetzger@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: avoid CamelCase in
 odm_DynamicBBPowerSaving.c
Message-ID: <2026100147-sixties-dramatize-8bee@gregkh>
References: <20260910143857.154320-1-freseenzo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910143857.154320-1-freseenzo@gmail.com>

On Thu, Sep 10, 2026 at 11:38:47AM -0300, Enzo Frese wrote:
> Rename odm_DynamicBBPowerSavingInit to odm_dynamic_bb_power_saving_init,
> and rename local variables and struct ps_t fields (PreCCAState,
> CurCCAState, PreRFState, CurRFState, Rssi_val_min, Reg874, RegC70,
> Reg85C, RegA74, bForceInNormal, Rssi_Up_bound, Rssi_Low_bound) to
> avoid CamelCase, which is not accepted by checkpatch.pl.
> 
> Signed-off-by: Enzo Frese <freseenzo@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
>  .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  | 72 +++++++++----------
>  .../rtl8723bs/hal/odm_DynamicBBPowerSaving.h  | 16 ++---
>  3 files changed, 45 insertions(+), 45 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
