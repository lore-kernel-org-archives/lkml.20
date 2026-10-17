Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720293BB13D;
	Sat, 17 Oct 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236319; cv=none; b=ZGAbiJDx+9WK3WG7QkaLLtRPwHLCxDwtG9XaBWzEWYOk5P5mWxMn5wJE1rHUdJ+HrIgQ6pV5CoO+BQwDcEdVl3OpijLP1aIywT+mw9JXF//vbUsWfcHNvArFePNEyjU9HAvFIASwKCtKcFTx260jPRXkAH6LnNktsa9KMptGYuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236319; c=relaxed/simple;
	bh=Lk0uWEjoNjuWfPItDCgY3wD84tBhJWyWSBuEKpZ1go8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAYkqKdSyYu73gsETQazYxlkGXPh8OMcKj9qVtnafAXSZ0q97XQpXkzukT5qgREtwtxCr89K+kr2ta5k+LL9w/XqKCT+mqU7lKuh2YT+NTVZF5YihswipGnbdzADC0sJdsa+h1QEG6t503oiHUbGpb5B5UR+yNpMabT09du8Vvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dGW2qu26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dGW2qu26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AB11F000C4;
	Sat, 17 Oct 2026 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792236318;
	bh=L20j62PT3ABTX9zDpe7TzJcQGp29XQ4mHjPr6uSSXGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dGW2qu2617FeKVT46QzRbATNfM7ZELlAiqJzbmNg5W8rb6xZdJOsXjtKucnk7NqCz
	 nC+YiT5tOTkrhyO8ZDY2q5LK2ZE8eDr896PJ2ca+elD5vU7rmBIduv6+5MNgpstAYI
	 4yUidWoP6MQVtllQzAKhhEZdwSvIjpEN3cS8ijDc=
Date: Sat, 17 Oct 2026 13:25:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: pdsj2807@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gdm724x: make DEVICE_STRING array const
Message-ID: <2026101701-padded-preachy-e653@gregkh>
References: <20261015093128.1004956-1-pdsj2807@gmail.com>
 <20261015121813.1130536-1-pdsj2807@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015121813.1130536-1-pdsj2807@gmail.com>

On Thu, Oct 15, 2026 at 05:48:06PM +0530, pdsj2807@gmail.com wrote:
> From: Palak Raval <pdsj2807@gmail.com>
> 
> The DEVICE_STRING array contains pointers to string literals and is
> never modified.
> 
> Declare it as 'const char * const' to improve const correctness and
> prevent accidental modification.
> 
> Signed-off-by: Palak Raval <pdsj2807@gmail.com>
> ---
> v2:
> - Drop unrelated formatting changes
> - Keep only the DEVICE_STRING const-correctness change
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 32b2e817ff04..65c53811f099 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -31,7 +31,7 @@ static struct gdm *gdm_table[TTY_MAX_COUNT][GDM_TTY_MINOR];
>  static DEFINE_MUTEX(gdm_table_lock);
>  
>  static const char *DRIVER_STRING[TTY_MAX_COUNT] = {"GCTATC", "GCTDM"};
> -static char *DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
> +static const char * const DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
>  
>  static void gdm_port_destruct(struct tty_port *port)
>  {
> -- 
> 2.34.1
> 
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
