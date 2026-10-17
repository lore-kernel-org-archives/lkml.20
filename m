Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A73C1991;
	Sat, 17 Oct 2026 11:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236044; cv=none; b=YvoEcW+y1TIRw3cB9BElqCWVbseUaXzleXOSjMUfE9yWS9NnIbjkR/iF3GrRVMAyQ1rq5sMMs0lt7kzFha/l4PLZnwRBb73zog8zVCzkG1EoK/fP/YiurrihZaYb4q5j9IPlGXlU5S8WRewB0faMtXdkk82drtAgueJFU3CeJT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236044; c=relaxed/simple;
	bh=dUxcIaBctsoh2N0CDke09JWxJMEKJHOSolcqYpXAsAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9TAlI5oxPgcPcAgjZ2uWp1RDUgmibTH3xdKPhdWK/6EHFIq1C5RsFBLG2jVhJw654Nyn+M5onGKHRtCFd9ERHsumyDPjGsyv95S7D9rFRQUcPN9skqbrY4Fieo8V1aq2VC/Wam+p8d7YX34/AAny/ZfEUXhs6TX1FfmILAeDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A/eoEesR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A/eoEesR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A481F000C4;
	Sat, 17 Oct 2026 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792236042;
	bh=smqssJde2X7dQ4rJvP3/JqZDvAVMXuI6oi3dfuUiLmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A/eoEesRoQfw8IiAD4yUiOv0gB6fXAL0m/sCrFouyJrL9tKOJsXt4gYXcf/sPvtz+
	 H9rnRUCpyrk5T/dFFpSuvPsOOTcQTKgPIx5UooFIUA90jPsEsY2v2P0gLX+V3Zy4uz
	 m5ZRZQ0OpmjwPUzvo/8R/hMhFKRPWMhSRGMT9mns=
Date: Sat, 17 Oct 2026 13:20:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: pavankumaryalagada@gmail.com
Cc: johan@kernel.org, vireshk@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <2026101707-routine-hatchback-4a35@gregkh>
References: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015082238.65187-1-pavankumaryalagada@gmail.com>

On Thu, Oct 15, 2026 at 01:52:38PM +0530, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Use %pe to print error pointers directly and display their
> error names.
> 
> Keep PTR_ERR() calls when the numeric error value is needed
> for returning the error code.
> 
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---
> v4:
> - Return error codes directly instead of storing them in ret,
>   as suggested by Julia Lawall.
> - Remove the unused ret variable.


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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
