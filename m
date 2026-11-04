Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778067;
	b=KyJtiy7cPstcM8e2cYlqSAskhR+H6LMI8zxuC6fjffPBO4k9rIaOP15ZPT2Lu2jNY60S
	 J9Vh4H7PTK74N/RcibqP6og2wU+ebDEBlhPAVZx0hAw/ffOAFPP/Aj64ggYWNGoEXY7l7
	 8ZoLDGgex7UADdDs8G7MGdyeKEZxPRgafVL0sGDniwWIQYCV7whRz0r/XdeQ23D9RzKIX
	 fLRfEIbKzbAbBmQ+RQsjbp6toltzgKAsp+UX9wshd58jL5BNENvuFc0WCpvGxeLS9QrnM
	 ex+pO8vXe4ENGetwN7Lp3i5KAvG08JzFh1TkrK24lQHET0ZpofUS4ILEaMQTSodDhtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778067;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=E6KaVjOzaIihwwkJhtsDrmAppK0b8JAgElFD+J/JyCY=;
	b=XITin63cZjahGI9TjhXlduyXsqUdUANsP4Yt4zNkKyHfyIYkvzKCLqEfwaNc1395Glqx
	 6+ac32T3poI3tkgGbCjNhzF8M7+oq8so9/EITKFHKXCbH2BurbGkeBHJVK79qoupC7e5W
	 pmj2WiYtGZRi4fMGzyhWYw4vJLKLtyYA/uSXO0tV0nmSep0DvqVUFuI8ZaIhIZ6SnctXU
	 ZcOtFvyw9KjuiGBpO+lN4ok2w6McHnamhC8VBhd2dEMRml1naL0hmubLA9xxiIQQvAW4v
	 bP0uw6AddEKwsLYMMZwW0yAJJTBDbpL2PxcLBGuSZ2+acrQ+u2e99d+QkNLSvypD+yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GvkDrN1u;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6503606A326;
	Wed,  4 Nov 2026 07:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6503606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GvkDrN1u
Received: from killaraus.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 158844DC;
	Wed,  4 Nov 2026 08:38:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793777927;
	bh=d3F7JN644RH25JEuxMz+KTJkv/9cp9kRgQkD40SL1r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvkDrN1utu2oBvezEkxxaK0592fnKw4aS6BqzEk70CUxu5/FroFba7RlgFv66G41E
	 w496UmjRegC2MAZ4xVf923+/WEokOxGludtD3lVHbyHjZgasS5IT2vJwE0XzDDRSj9
	 mukjwWShyCONuseLOfaPBek58yclncxDleIEWV0E=
Date: Wed, 4 Nov 2026 09:41:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Changcheng <chenchangcheng@kylinos.cn>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fail probe when no video device is
 registered
Message-ID: <20261104074103.GA3896730@killaraus.ideasonboard.com>
References: <20261104022146.42954-1-chenchangcheng@kylinos.cn>
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
In-Reply-To: <20261104022146.42954-1-chenchangcheng@kylinos.cn>

On Wed, Nov 04, 2026 at 10:21:46AM +0800, Chen Changcheng wrote:
> When a UVC device is unbound while userspace still holds the video
> device open, the VS interface claims are released only after the last
> file descriptor is closed.  Rebinding before that fails to claim the VS
> interfaces, leaving the VC interface bound without a usable video
> device:
> 
>   [ 3229.189556] uvcvideo: Probing generic UVC device 1
>   [ 3229.190496] uvcvideo: device 2 interface 1 is already claimed
>   ...
>   [ 3229.193758] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
>   [ 3229.193766] uvcvideo: Found a valid video chain (1 -> 4).
>   [ 3229.193771] usb 9-1: No streaming interface found for terminal 4.
> 
> Check after registering all video chains that at least one video device
> was registered, and fail the probe with -ENODEV otherwise.

That's a workaround, it doesn't fix the root cause.

> Devices with no usable streaming interface at all will now also stay
> unbound instead of being bound without any video device.
> 
> Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..0943db4eae07 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2156,6 +2156,19 @@ static int uvc_register_terms(struct uvc_device *dev,
>  	return 0;
>  }
>  
> +static int uvc_has_video_node(struct uvc_device *dev)
> +{
> +	struct uvc_streaming *stream;
> +
> +	list_for_each_entry(stream, &dev->streams, list)
> +		if (video_is_registered(&stream->queue.vdev))
> +			return 0;
> +
> +	dev_info(&dev->intf->dev,
> +		 "No usable streaming interface found\n");
> +	return -ENODEV;
> +}
> +
>  static int uvc_register_chains(struct uvc_device *dev)
>  {
>  	struct uvc_video_chain *chain;
> @@ -2174,7 +2187,7 @@ static int uvc_register_chains(struct uvc_device *dev)
>  #endif
>  	}
>  
> -	return 0;
> +	return uvc_has_video_node(dev);
>  }
>  
>  /* ------------------------------------------------------------------------
> 
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222

-- 
Regards,

Laurent Pinchart
