Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264174;
	b=CpxF7EzEIRpZhWD7EYKo3mFKGoS4kFnHrsCWaCahD2jhBSAgtE+PTAOzlVgQq5PfemdS
	 nzK3eOvDhSu3/GsQxyG569eba9ahUfyRf7VSxlV2QNX/ujXS9swYmv+2CW2fGiVpp4ft6
	 YI/ANqXE3eJGgzowqcjMB1EzADKdgLgea71N96u4FyxxGKO7IHa2Xo/JAzLURVeCO+M2E
	 Ij7HVlVHbX9JrR8QXbJPJ3ZmrUibA3deqTeyyDzn2o0phjSmRbPu+a+X46TKm8E+bEEYQ
	 H/If29nv63F9Mz+TmOeeohGMe3csVKjihhLXH6+iR6a25sjdm180GYzsn2FqZp+6ZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264174;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nPwSPsyZbXl/IjjBxekKC+O0xydHzhe1kjdW6d72i64=;
	b=4o1at9T3Ck7Ah5vXTnf5ePrRjwHhDKVgsA0maetAIpcyXU3KnF431BW7agBU/eBJMN4O
	 T/GQcUaOBF9CWBqcAQSVJzTd5ZdHRFgu+72T9UHMnBjl6bv0v8vgGB5LsvLoIM6nNeMOR
	 Jc1wydWdM313NMv+jwZYrHf5UvhNrZKRuR+jpB6kZJtfA1Y1fNWwsfaiRmi+fHXFosFCN
	 lj7VDN8OFOjzfKJEwvNpTEdq6us4Y5pX93RblN6iglRV93MTKmO8Xcq2g4p/q5t/yV1av
	 gWw5CdxKlNwO1RCxXrgRP/1heYJcPYf6gqio80wL8+WASY+IEH3Rhmq0ybsA9BLazZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=S9QiWH+1;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2F606A31D;
	Thu, 29 Oct 2026 08:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A2F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=S9QiWH+1
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA433BE;
	Thu, 29 Oct 2026 09:53:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793264038;
	bh=GcRRU/3tEMhNeOSUogjmLD1GIWxyuUhdnrCH9im4Lho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9QiWH+1nCdV+NGzs62XvGl+nrs+sYGQ4K8sueyz+YDbB4AtMAotPp1FIxIJSS/mD
	 pVzrLwvkUqzWajOHVN+tpHkhGiKaOlTz91V4TPWzvRJYuXvLcwHtAboEtU4ZMLYNAm
	 zkxEJzB/WsAG0yS/gGXpSr9CaSMhEibsEA96dS2A=
Date: Thu, 29 Oct 2026 10:56:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK
 camera
Message-ID: <20261029085610.GC2673734@killaraus.ideasonboard.com>
References: <20261029033106.7374-1-ki.chiang65@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029033106.7374-1-ki.chiang65@gmail.com>

On Thu, Oct 29, 2026 at 11:31:06AM +0800, Kuangyi Chiang wrote:
> UVC control requests issued when preparing a video stream sometimes
> time out on the HIK 1080P Camera (2bdf:0280):
> 
> [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0280)
> [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 26).
> [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110 (exp. 26).
> [   58.592967] uvcvideo: Failed to initialize the device (-5).
> 
> Adding a 1ms delay after each control message avoids the issue.
> 
> Introduce UVC_QUIRK_CTL_MSG_DELAY_1M for this device.

We don't add random delays. This needs a root cause analysis.

> Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++--
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc7..c720d75 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3162,6 +3162,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
> +	/* HIK 1080P Camera */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x2bdf,
> +	  .idProduct		= 0x0280,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_CTL_MSG_DELAY_1M) },
>  	/* Insta360 Link */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a..4667f86 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -35,13 +35,19 @@ static int __uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  {
>  	u8 type = USB_TYPE_CLASS | USB_RECIP_INTERFACE;
>  	unsigned int pipe;
> +	int ret;
>  
>  	pipe = (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
>  			      : usb_sndctrlpipe(dev->udev, 0);
>  	type |= (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
>  
> -	return usb_control_msg(dev->udev, pipe, query, type, cs << 8,
> -			unit << 8 | intfnum, data, size, timeout);
> +	ret = usb_control_msg(dev->udev, pipe, query, type, cs << 8,
> +			      unit << 8 | intfnum, data, size, timeout);
> +
> +	if (dev->quirks & UVC_QUIRK_CTL_MSG_DELAY_1M)
> +		usleep_range(1000, 2000);
> +
> +	return ret;
>  }
>  
>  static const char *uvc_query_name(u8 query)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b6bcee4..1426d14 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -81,6 +81,7 @@
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
>  #define UVC_QUIRK_MSXU_META		0x00040000
> +#define UVC_QUIRK_CTL_MSG_DELAY_1M	0x00080000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001

-- 
Regards,

Laurent Pinchart
