Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A53306D2A;
	Wed, 23 Sep 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155933; cv=none; b=Hdx91v8BaPiUnSy3OWJkMdFrL07t44mc/65cXthCE3lHwtVUlGW84EFy7O8OQKFOVqJJ9oWHto+tg/HCO3JO1/ucAd6qe50KA9bEuUEBvqZS+LVsVTZ7s9NBcmhHOVrTZl7QmDPaaPQcnp9H8r0Y5rATqRaR9WyKIUR+MRIh73s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155933; c=relaxed/simple;
	bh=g1cZZwJWfvvsxrzmZyIr96fQkVorSnKyKq2Q/FTEHzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coUVBPmM5se570o/WanE8bI0xcPnywV+qxa6DH3XteJrFvk6zowKmkBPa0V7RZbzwQhSBlXluBlVhbEJwe3l84RcQDr34eMRKpZnHwJaRJz2MR5FbjCvMkxlkHNtkgQaff+layzT8BD9bP3Vb8GFwO8SKuwuhkLPW9jyot1D78Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IPXnJZ+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IPXnJZ+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA0B1F000FF;
	Wed, 23 Sep 2026 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790155931;
	bh=HDeVlNpL3o2gPwyMo0wyBLOfP2nSTaCOsudTlQUQbOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IPXnJZ+tC3Y3q6BtR9sjMbg45zhPj9VvE0cmHPPu7eTK8RHt2sRiEKrAn4xDDpfVl
	 pA5N1deaLDmzUKk1i+MAPa8DjRLE4Xis9uL19XGIRTLrlxn7v7W7blFaeb3lRKnC/c
	 bP5aoZfX/9OKnb7o7ee1BqhPG3Kl+7jN69nyWyuY=
Date: Wed, 23 Sep 2026 11:23:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: Fix unlocked hcd->status_urb access in
 usb_hcd_poll_rh_status()
Message-ID: <2026092336-unstamped-fracture-4018@gregkh>
References: <20260923083828.64925-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923083828.64925-1-ginger.jzllee@gmail.com>

On Wed, Sep 23, 2026 at 04:38:28PM +0800, Ginger Li wrote:
> usb_hcd_poll_rh_status() tests hcd->status_urb without holding
> hcd_root_hub_lock, while rh_queue_status() and the completion path inside
> usb_hcd_poll_rh_status() itself update that field under the lock.
> 
> Take hcd_root_hub_lock around the early bail-out check so that the read is
> serialized with the writers.

Is that a real issue?  How can this be hit?

How was this found?  How was it tested?
Did you forget an Assisted-by tag?



> 
> Fixes: d5926ae7a827 ("[PATCH] usbcore support for root-hub IRQ instead of polling")
> Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
> ---
>  drivers/usb/core/hcd.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -727,8 +727,13 @@ void usb_hcd_poll_rh_status(struct usb_hcd *hcd)
>  
>  	if (unlikely(!hcd->rh_pollable))
>  		return;
> -	if (!hcd->uses_new_polling && !hcd->status_urb)
> +
> +	spin_lock_irqsave(&hcd_root_hub_lock, flags);

guard()?

thanks,

greg k-h
