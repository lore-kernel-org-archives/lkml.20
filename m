Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2C443B6ED;
	Wed, 30 Sep 2026 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751339; cv=none; b=hIuKIsiptjhzSAKZ9I0eaNxed88cD2PBHaueezWcgDVpWC8sQJn9eWGBXzGkCUJ/k+NUQPbZqr7tSIWm3GwJANbWdwLky7TV4XrlNH4PKkdOudgVEjoNgpX5ZvMtQ9A+DVKVTZ7fxD6wB8obfYXzHx/SIFR16YXWpjEVYFH1ibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751339; c=relaxed/simple;
	bh=pOre7b5K8XzdnM1fildbGlPON1gKdmN7i7JeUCpheXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fw5TBKVOyPgPa68vvRbNwvZW1M18LmOyLasmeeAF6e1XnIafsB8RtnNh6adHSuMSnU0bO42cDpqc0MBJf+5e0j7T3SsLHpYbKmh10b8bhc2sEabJ9awtesUbyVxO2Df6bYVIEnwa+NcTm7qOneYA+X8POAb/dM7HJnf++3mqFpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FPL3O/6m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FPL3O/6m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5B01F000FF;
	Wed, 30 Sep 2026 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790751330;
	bh=/XAl8sbyoadHlpSpi85xT/Ou78XuJpB2zs90+HIsFbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FPL3O/6miQ6reXKAkqsE4wwlWg29sZvoyvSKu/78DeroeXHc6luHzKzkxtUOI5+0s
	 ZNiGOhxbbdjXu0+RZ/a7NB7h9IOr4tAZkVQ+1QLa5YiwtqePRyPM7RTXrRUPKBk7Xc
	 fGd0Cdb98DXaR9Te2m+vzJI04soNK1bWU4CYD1ZA=
Date: Wed, 30 Sep 2026 08:55:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Pieters <davidpieters1978@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: quirks: add USB_QUIRK_NO_LPM for ELECOM DEFT Pro
 TrackBall
Message-ID: <2026093013-stature-rekindle-ba2a@gregkh>
References: <CAJ3h-bPZ4LyGyoUywhxnGx-Je3irbM67g5z2y6Sn_6oxOdtAvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ3h-bPZ4LyGyoUywhxnGx-Je3irbM67g5z2y6Sn_6oxOdtAvA@mail.gmail.com>

On Wed, Sep 30, 2026 at 08:39:06AM +0200, David Pieters wrote:
> The 2.4GHz wireless USB receiver of the ELECOM DEFT Pro TrackBall
> (056e:0132) and its wired counterpart (056e:0131) fail to handle USB
> Link Power Management (LPM / USB 2.0 L1 sleep states) during initial
> enumeration on modern USB host controllers. When LPM negotiation occurs
> at boot, the device stalls and fails to register any input events until
> it is physically unplugged and replugged.
> 
> Applying USB_QUIRK_NO_LPM prevents LPM negotiation and allows the device
> to initialize properly at system boot.
> 
> Signed-off-by: David Pieters <davidpieters1978@gmail.com>
> ---
>  drivers/usb/core/quirks.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 8923a10e7b41..0f34e819b22a 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -350,6 +350,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>   /* Corsair Strafe RGB */
>   { USB_DEVICE(0x1b1c, 0x1b20), .driver_info = USB_QUIRK_DELAY_INIT },
> 
> + /* ELECOM DEFT Pro TrackBall (fails on USB Link Power Management) */
> + { USB_DEVICE(0x056e, 0x0131), .driver_info = USB_QUIRK_NO_LPM },
> + { USB_DEVICE(0x056e, 0x0132), .driver_info = USB_QUIRK_NO_LPM },
> +
>   { }  /* terminating entry must be last */
>  };
> 
> -- 
> 2.43.0

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
