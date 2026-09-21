Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86284238C1A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950103; cv=none; b=WH+dcppmsc3CNFe2dFZBfu8fsXCHPBMdf74bArcBzRkaH/nEP8wlu6O9AaBB4K4VRTtMm5dp7lFOQMmg2KIml/0NF21vto+1p0jx9N0d5ihfnZvdswOX8EY3tHeOMoZe1Y/QbPgYFLKVakA9y3qyw7rVwIhrmmCr+2FO4JXfVII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950103; c=relaxed/simple;
	bh=37qNlOcLbOhHatM8dMqvPIeqNWeCxT22Gkdm8ie5LH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZk4aqbZhfJiBVxn+2P0MOKRUuOjEY/tCzOwMiNAzpvoD8k/y2svXwZVrZE0qpP8LnZZ3D+Dhd9YlZ3/mVqscQwlnH7M8tdQ73D0UV84mLylx0VSMNhSRLRV+UjI/JC6yYsTn3Il3195UFg7i3tTte3Bh32qUHQDKY6txasycLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qbS+ijx/; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qbS+ijx/"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc93e00so13762076d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789950100; x=1790554900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5+HOZTbn3M5ZHhIolHoNXACaHcDNcWtJGkXHOE2EGc=;
        b=qbS+ijx/btPEshwUwBw4JvmCvY5xfl27mVSwnwmiULRgv8O6dmzeUmeyd8iYbggx6A
         FmTgsj06aTL3h6l20k+aWhFlk2Cepnm/bVV6xdQoSkJN26KXER8w0HfolPlOpE8KEKvm
         vy/cUnUQrPNz6I5kaLZuXKaVqr2QuqKG7cCdVsJQNDVfkI5zrG/AEiUDAvlkWGNh2YQs
         Wma3jwq4VYdmmnqsyLvbpWF+cRxTI7GbtFveVp+yRWdBtmhN8hJVtnlAeS7czdqdoLW3
         rCBjTMKiqmS8rzltAu7mf8Y9FRcsUl5NQTXr3H+Vb877oL0NHZDfaftO9ZlgykCF8T0Q
         DYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950100; x=1790554900;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5+HOZTbn3M5ZHhIolHoNXACaHcDNcWtJGkXHOE2EGc=;
        b=fb5DWH6hJfaM6YQEJZQ61R+E81cKU9V+lKuEhgjYSBcBhcVTN3tYKCDSdycTIiYVU0
         NN9PiF69HhVqYyvZcZY8xbWpt/9MQyr8xd6ns1obt0f2FUXGABV+7srghzVt9bCgug6V
         gsFP3jL4UZRLXzd9fLIlQRbDZz741NN4MY5XVTzL0hh4V19JtkeC1zNWWiOy2mDrwTgk
         d8Jupmq1G4WTz434QqbSbfYyjDalmARKMd6heASXmwtgg7I7xwV46cV9hu5O2D4PyJY4
         SFRgNlMErd9QgGDAMwLiCDPb1qL0NFgr3wXmeiYxbY9ZBedS2b4aJwnyiAV9ZwRKr/OC
         j0XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOxW+4E4faRH6lQBGXd+SDvt3Jiy1YJrCgeqk1/UKyzzmb8KmTpn80bknsWtXeTgF9r1lUhTDtfSVgsvk=@vger.kernel.org
X-Gm-Message-State: AFuF++mlBytHhiEoFVW555C+ca14gz7r4oHlkZFTBPPGFyHn0KGIEfV5
	QxM6YEZv8tzctKSJwqhmsn3YMvXu7E5rKm1l0hr8eh7OMTvpZR6UGzVl43nI7eBbLPUYGsOtF+g
	mn2ReFw==
X-Gm-Gg: AYBFou1jeGy/pYyYpPqhcF5xN0d9YO3mzOOIfS/sKqlqPEqL1W7TxcTfgXPUK1bFVpE
	vc7h4GaMSVYMgDEZYmhwI5S1sgYrRIbBut1dLo0Vug+EdxOk0SvRjdgd8tBx7EfFuQiAeLpgeXU
	bYIrAp9NV048tpX5Z6Yw6eVi1DCALE4dyjjgkyoMKB25ND+jP8JjlS8hsku5D9T67fIIINELFD1
	RcIfpyniGbHgdfirMvWFJc1Tk1jI7Zi2c1DycnNeMJvN/dGX9Kx2ZAyoOHhU35V68NCcOUSNGDD
	8cZ9ifDOwyOElj/5RRuvr/OB7wWpExEpGpugjZxqObx1Vz10Wq4UxVwLdU3BRhnpUuNKJ4uoePf
	wRFgl/VU3/CnPBWoCBSBpvtsHb+oh/v5LTsr1gZ3ySsdJPObORUSkoqIDh1l1oBHPw8sO0sfRkp
	Y7FqS8/khWiRhqmkJdzfi3oYGjdV01VzN4w/qa9jD/CgN0BihhwUccjA+6VcWoXVGDZ8bdhyE+
X-Received: by 2002:a05:6214:1c46:b0:912:6067:f588 with SMTP id 6a1803df08f44-912a801caabmr84450146d6.39.1789950100231;
        Sun, 20 Sep 2026 17:21:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a8d2cdsm54394216d6.35.2026.09.20.17.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 17:21:39 -0700 (PDT)
Date: Sun, 20 Sep 2026 20:21:35 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hui Peng <benquike@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, michal.pecio@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: clear both ep_in and ep_out for non-ep0
 control endpoints
Message-ID: <fea9a6f7-b6d1-4b20-968d-a306ee4b4e80@rowland.harvard.edu>
References: <20260919223518.3890208-1-benquike@gmail.com>
 <0bc9c10f-6b6e-429c-a625-d34b12aaf2ef@rowland.harvard.edu>
 <20260920231702.110963-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920231702.110963-1-benquike@gmail.com>

On Sun, Sep 20, 2026 at 11:17:02PM +0000, Hui Peng wrote:
> In usb_enable_endpoint(), non-zero control endpoints (where
> usb_endpoint_xfer_control(&ep->desc) is true) populate both
> dev->ep_in[epnum] and dev->ep_out[epnum] with the same
> struct usb_host_endpoint pointer.
> 
> However, usb_disable_endpoint() only clears either dev->ep_out[epnum]
> or dev->ep_in[epnum] depending on the direction bit of epaddr when
> reset_hardware is set, leaving the opposite direction's array slot
> pointing to the disabled/freed endpoint.
> 
> Clear both dev->ep_out[epnum] and dev->ep_in[epnum] when disabling a
> non-ep0 control endpoint with reset_hardware set, and update the
> function kerneldoc accordingly.
> 
> Tested in QEMU against Linux 7.3.0-rc3 using dummy_hcd and raw-gadget to
> enumerate a USB device with a non-zero control endpoint (bEndpointAddress
> 0x01, bmAttributes USB_ENDPOINT_XFER_CONTROL), verifying that both
> dev->ep_in[1] and dev->ep_out[1] are cleared when the interface is
> disabled.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> Changes in v2:
> - Dropped all changes in the other files (config.c, hub.c, port.c,
>   devio.c, sysfs.c, and ledtrig-usbport.c) per Alan Stern and Greg
>   Kroah-Hartman, keeping only the usb_disable_endpoint() fix in
>   drivers/usb/core/message.c.
> - Updated the usb_disable_endpoint() kerneldoc comment and commit
>   description per Alan Stern.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

You might consider looking through other parts of the code to see if 
they need similar attention.  Historically we haven't been very good 
about supporting control endpoints other than ep0.

Alan Stern

>  drivers/usb/core/message.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 75e2bfd744a9..0cd6dd2b6334 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1337,7 +1337,8 @@ static void remove_intf_ep_devs(struct usb_interface *intf)
>   *
>   * Disables the endpoint for URB submission and nukes all pending URBs.
>   * If @reset_hardware is set then also deallocates hcd/hardware state
> - * for the endpoint.
> + * for the endpoint (clearing both ep_in and ep_out pointers for
> + * bidirectional non-ep0 control endpoints).
>   */
>  void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
>  		bool reset_hardware)
> @@ -1358,6 +1359,11 @@ void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
>  			dev->ep_in[epnum] = NULL;
>  	}
>  	if (ep) {
> +		if (reset_hardware && epnum != 0 &&
> +		    usb_endpoint_xfer_control(&ep->desc)) {
> +			dev->ep_out[epnum] = NULL;
> +			dev->ep_in[epnum] = NULL;
> +		}
>  		ep->enabled = 0;
>  		usb_hcd_flush_endpoint(dev, ep);
>  		if (reset_hardware)
> -- 
> 2.47.3
