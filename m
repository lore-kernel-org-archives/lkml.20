Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B2530ACF1;
	Thu,  1 Oct 2026 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853797; cv=none; b=Sd0gt+l80wRIzJsr+/LPgW5BAfxD/K//vN48XKNhh31blargv4ukZ7AlC7s1A1Z4LoOpY3XPbTymyz7u1WRbhv1LM5vvLNuv1FL1EH1qSUdBka9kRMIsR5JjoGDUEisURZaVWYJ+kfqsJtkaScUvPsxuLTKvQhhdmCNCb0yHwPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853797; c=relaxed/simple;
	bh=SgU6dvPOm4fOqJ0yjF6HKnxNhelZQesUuZqpSFA8XjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FA48UbPvcCIAbzgfPl4BNfOx41f//OLZEFZLpRUfL8SwY6TSvrgrwln0dCCAZ2Ak6OoIGy6yb1x96YfhprSCZUIP23zPvcXpKrixgLZ1s+y5S+l+X2XDr1VIA1Euoxd6r1zjSb6pdjRL+A8zxOvZHkCVB+9/8qJK3p4NBWUXyiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gsFKS/0z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gsFKS/0z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7B91F00898;
	Thu,  1 Oct 2026 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790853795;
	bh=07PdP49ebLjOWH7pDQQdeJ5K7Hm9J4SwIcMKEJtTi68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gsFKS/0z3b0jRInYrTd6E7kyviKA5NVxgvUT9UJmCCBGo9fIBS6/ZiHt6JaiL9y8O
	 JB2SeRsc2uyqktwINJy5Q6Pb2L4zLB6G5WNvcuIfyCFYNz5651XL0tNxKOKQl5x8eH
	 f9TJXEbyQjdHqO2ETutmYfPY4CI0MfS/cac5k5yY=
Date: Thu, 1 Oct 2026 13:23:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3] usb: hub: Set proper message when
 usb_hub_create_port_device() fails
Message-ID: <2026100144-defraud-subarctic-b726@gregkh>
References: <20261001110630.1476797-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001110630.1476797-1-wenst@chromium.org>

On Thu, Oct 01, 2026 at 07:06:30PM +0800, Chen-Yu Tsai wrote:
> Right now when usb_hub_create_port_device() fails, it prints a separate
> error message to say which port failed, but otherwise leaves 'message'
> set to the default "out of memory", which is somewhat misleading.
> 
> Use a small buffer on the stack to put the custom formatted error message
> in and use it as the error message.
> 
> Assisted-by: LLM # local reviews
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Simplify to just using a small buffer on the stack (Alan)
> 
> Changes since v1:
> - Explicitly track and free the allocated custom error message instead
>   of using devm_kasprintf()
> - Link to v1:
>   https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/
> 
> Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
> was telling me that it won't work correctly if CONFIG_USB=m.
> ---
>  drivers/usb/core/hub.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 0e929a4c9fa1..d7f39e86b24c 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1480,6 +1480,7 @@ static int hub_configure(struct usb_hub *hub,
>  	unsigned int pipe;
>  	int maxp, ret, i;
>  	char *message = "out of memory";
> +	char msg_buf[32] = {};

Why are you initializing this?

>  	unsigned unit_load;
>  	unsigned full_load;
>  	unsigned maxchild;
> @@ -1756,8 +1757,8 @@ static int hub_configure(struct usb_hub *hub,
>  	for (i = 0; i < maxchild; i++) {
>  		ret = usb_hub_create_port_device(hub, i + 1);
>  		if (ret < 0) {
> -			dev_err(hub->intfdev,
> -				"couldn't create port%d device.\n", i + 1);
> +			snprintf(msg_buf, sizeof(msg_buf), "couldn't create port%d device", i + 1);
> +			message = msg_buf;

Please just do what the other errors do, set message to something else
and leave the dev_err() here.  That way no extra stack space is needed.

And how did you hit this?

thanks,

greg k-h
