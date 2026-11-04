Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772284;
	b=B8WIxtQfy52IBDMFgL+2KHq12e8YHaIxZ6WH5Cfx/b88n/VLkvLH8PvcF5Kf7hOvON59
	 qaaNr2f7W+elo5aWFfTx85Di4yX4BGlvwQ5oTzvd7mMRufemwO0VajRY2Erpax+H1E4MG
	 EO2A9O9EZ2iJP3sK49NxOKklGYxXMfWkuLt0thEoIMMpQ+BrJvBPneiO4CrHt9utA0/Xx
	 vYDuIqgMWtF1p6VTdtGOYkxzXYJIGvmgtj3Az4j4V4PxzsFXeSk2e3NPAx2mdqwj/ZZ6X
	 2blrr+xyG+TnlIvOSJC2uwa88OJY9w1iRvkDVO/2d/LTuIQRMyvu5/SiPKb8L0xp2zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772284;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=HfRVcRK8a+rara4tkD18kKNxwAxM7wDiQB69YALWUh0=;
	b=Dx3+H9LMuNPxt8iiBzCclY4L3W8Nr0AfplxEK3Sr8M9wgTejeQfigFPZXbP9KUCA4JzF
	 aHVop2xUH3EvwugL9PUKWk/we4k2SED8Sc3xXVyNEQG3+jfFbf3Mr/Mgo4/zm+0ofWnKI
	 fwtM0rq0w84LOJgoW2yPLl9i+jHgCbRRmA0OijMHM/GIfpZDozrAUXHAnZ1MF3GGQLt3w
	 J2E1pQ4gU+ug75jlBeqM3ZGMngp1cSJzj67EIASJGaCZ/ZbmFI/Cd7394DtDf6kQ7EQox
	 zMtrCAHPBMjml1kKLdDZzqinBkWo1Ti30iC4hIXshq8JPWKWePdVCANY5ghkzvrRYRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=QzlBya4a;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DEB606A31B;
	Wed,  4 Nov 2026 06:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DEB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=QzlBya4a
Received: from killaraus.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B53E24DC;
	Wed,  4 Nov 2026 07:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793772143;
	bh=c/l2P3UKmUejGx51EYfQBnCcwBveIg7nGpPKFX7Z+OY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzlBya4aLbC3AhUNd+7M2BTtUMgfjqYMdQCVMGTPquKslQBqn/Ua4ojwQlid5pAlj
	 2/ffBN8uLXmRfUrwbQV8ocjffnUyuR7DcvnFy8snnMi7O/Ch9TiEviDrl3ZP2w/rHA
	 XF58MfHPH4rTrpFbDeiTwF3FZj/ZxuUbERtqQftI=
Date: Wed, 4 Nov 2026 08:04:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen Changcheng <chenchangcheng@kylinos.cn>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fail probe when no video device is
 registered
Message-ID: <20261104060440.GD3619815@killaraus.ideasonboard.com>
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

Please provide the USB descriptors for your device.

> Check after registering all video chains that at least one video device
> was registered, and fail the probe with -ENODEV otherwise.
> 
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
