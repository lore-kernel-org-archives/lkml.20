Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968B2EEE8A;
	Mon, 28 Sep 2026 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599967; cv=none; b=HUx59egTdum6XoLUsbwN/TF+yxdzM2YTYHS82ZMt6wZaj3aBOZoYSX/2VZzDdLYaDw9UqslugD9Ppl17tVLlmwC/y8AUa6NPSzIaldfsXWfgQbGK+7jpLhNYXSsYUsF74A1ZIqVRWEU/JTI2Ko2qOKe4oJa7J2rCgf6CyA+ibDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599967; c=relaxed/simple;
	bh=GkJjQKg8hcVtsAG7lum0KyCiRNRP66Ky5RW4z1/dyig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIdObtBrR/2KqHzZe5RkBfidqC+iQTMZdpHuCm1Af7ShR4AIzu60hYurUVEae8f43wPMUQceatDKGLZzCsLXflSnSDAnn1P/WFQ0zdIrDgQkZ4sw1mOGY1jQCT/BtoCPVsRyAlkOG5x4IPtJHP3AS1mAcxYTX9NWwj3KiWFkyoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vnjGYG2M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vnjGYG2M"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A5238FD;
	Mon, 28 Sep 2026 14:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790599853;
	bh=GkJjQKg8hcVtsAG7lum0KyCiRNRP66Ky5RW4z1/dyig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vnjGYG2MeVmSxk4O+CsnoAgb8Aa6HpUu4Uk9XN+vC2NCuF2SR90y1Rk5gGxL6RjFB
	 qWOOWaEhwckhDeZgyg8F7SRbNB6FT5GT13GXEFlGC+8Rj9FYYMt9ZK1Ehrq0lBwDUX
	 xL0oUh0PMXSl4wEQBjiPKqB1LJDM1QP4wz7aMJSI=
Date: Mon, 28 Sep 2026 15:52:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Edwin Gatier <edwin.gatier@protonmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 3/5] media: uvcvideo: Automatically handle cameras
 with invalid uvc_version
Message-ID: <20260928125242.GE4406@killaraus.ideasonboard.com>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org>

On Fri, Sep 11, 2026 at 01:22:27PM +0000, Ricardo Ribalda wrote:
> Currently, the driver expects that cameras properly implement the spec
> version that they announce, and if they fail to do so, we do not continue
> probing the driver.
> 
> To make drivers more fun, some vendors decided to announce that they are
> a UVC version that they are not. Until now, we handled those cameras via
> quirks.
> 
> Unfortunately, reality has shown us that there are more cameras out
> there with an invalid uvc_version than we initially predicted.

As far as I understand, this was triggered by the Avermedia GC515. Have
you received other reports ?

> This patch tries to handle these cameras with an identity crisis
> automatically. We still shame them in dmesg. But now they will work.

If the vendors ignored the fact that those cameras didn't work at all on
Linux, do you think they will read dmesg ?

Jokes aside, UVC version override was added in November 2020, and the
Avermedia GC515 is the fourth device we list in nearly 6 years. Let's
see if there are any drawbacks in the implementation below that can be
justified by such a small number of devices.

> Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++----
>  drivers/media/usb/uvc/uvc_video.c  | 40 +++++++++++++++++++++++++-------------
>  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
>  3 files changed, 35 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e289cc71ba98..ca75f8d1ec46 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1169,9 +1169,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  
>  	case UVC_VC_PROCESSING_UNIT:
>  		n = buflen >= 8 ? buffer[7] : 0;
> -		p = dev->uvc_version >= 0x0110 ? 10 : 9;
> -
> -		if (buflen < p + n) {
> +		if (buflen < 9 + n) {
>  			uvc_dbg(dev, DESCR,
>  				"device %d videocontrol interface %d PROCESSING_UNIT error\n",
>  				udev->devnum, alts->desc.bInterfaceNumber);
> @@ -1188,7 +1186,12 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		unit->processing.bControlSize = buffer[7];
>  		unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
>  		memcpy(unit->processing.bmControls, &buffer[8], n);
> -		if (dev->uvc_version >= 0x0110)
> +
> +		/*
> +		 * We are not using bmVideoStandards, so there is no need to
> +		 * warn the user if it is missing.

There's value in warning the user about UVC non-compliance though. I'd
like to see a warning that indicates the device reports an incorrect UVC
version.

If I'm not mistaken, the Avermedia GC515 includes the bmVideoStandards
field. This change is therefore not needed for any devices we know
about, right ?

> +		 */
> +		if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
>  			unit->processing.bmVideoStandards = buffer[9+n];
>  
>  		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 2a3b7431cc68..2f3daa920ffa 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -273,6 +273,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  	}
>  }
>  
> +#define UVC_VIDEO_CTRL_MIN_SIZE 26
> +
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
>  {
>  	/*
> @@ -280,7 +282,7 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
>  	 * on the protocol version.
>  	 */
>  	if (stream->dev->uvc_version < 0x0110)
> -		return 26;
> +		return UVC_VIDEO_CTRL_MIN_SIZE;
>  	else if (stream->dev->uvc_version < 0x0150)
>  		return 34;
>  	else
> @@ -290,7 +292,6 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
>  static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  	struct uvc_streaming_control *ctrl, int probe, u8 query)
>  {
> -	u16 size = uvc_video_ctrl_size(stream);
>  	u8 *data;
>  	int ret;
>  
> @@ -298,13 +299,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  			query == UVC_GET_DEF)
>  		return -EIO;
>  
> -	data = kmalloc(size, GFP_KERNEL);
> +	data = kmalloc(stream->ctrl_size, GFP_KERNEL);
>  	if (data == NULL)
>  		return -ENOMEM;
>  
>  	ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
>  		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> -		size, uvc_timeout_param);
> +		stream->ctrl_size, uvc_timeout_param);
>  
>  	if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
>  		/*
> @@ -319,7 +320,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  		ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
>  		ret = 0;
>  		goto out;
> -	} else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
> +	} else if (query == UVC_GET_DEF && probe == 1 &&
> +		   ret < UVC_VIDEO_CTRL_MIN_SIZE) {
>  		/*
>  		 * Many cameras don't support the GET_DEF request on their
>  		 * video probe control. Warn once and return, the caller will
> @@ -330,15 +332,24 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  			"Enabling workaround.\n");
>  		ret = -EIO;
>  		goto out;
> -	} else if (ret != size) {
> +	} else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
>  		dev_err(&stream->intf->dev,
>  			"Failed to query (%s) UVC %s control : %d (exp. %u).\n",
>  			uvc_query_name(query), probe ? "probe" : "commit",
> -			ret, size);
> +			ret, stream->ctrl_size);
>  		ret = (ret == -EPROTO) ? -EPROTO : -EIO;
>  		goto out;
>  	}
>  
> +	if (ret != stream->ctrl_size) {
> +		uvc_warn_once(stream->dev, UVC_WARN_CTRL_SIZE,
> +			      "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
> +			      uvc_query_name(query),
> +			      probe ? "probe" : "commit", ret,
> +			      stream->ctrl_size);
> +		stream->ctrl_size = ret;
> +	}

There are two other locations where uvc_version is used:

- In uvc_fixup_video_ctrl() to implement a workaround for pre-1.10
  devices that don't report dwMaxVideoFrameSize

- In uvc_ctrl_filter_plf_mapping() to stkip the power line frequency
  control on pre-1.50 devices

None of those are handled in this patch. Furthermore, more usage of
uvc_version may be needed in the future. This patch seems a bit fragile
to me in that regard. Could we instead detect the version and update the
uvc_version field ?

Another option, given the small number of affected devices, is to just
merge 5/5 (as well as 1/5 and 2/5 that are nice small improvements).

> +
>  	ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
>  	ctrl->bFormatIndex = data[2];
>  	ctrl->bFrameIndex = data[3];
> @@ -351,7 +362,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  	ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
>  	ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
>  
> -	if (size >= 34) {
> +	if (ret >= 34) {
>  		ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
>  		ctrl->bmFramingInfo = data[30];
>  		ctrl->bPreferedVersion = data[31];
> @@ -381,11 +392,10 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
>  static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>  	struct uvc_streaming_control *ctrl, int probe)
>  {
> -	u16 size = uvc_video_ctrl_size(stream);
>  	u8 *data;
>  	int ret;
>  
> -	data = kzalloc(size, GFP_KERNEL);
> +	data = kzalloc(stream->ctrl_size, GFP_KERNEL);
>  	if (data == NULL)
>  		return -ENOMEM;
>  
> @@ -401,7 +411,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>  	put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
>  	put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
>  
> -	if (size >= 34) {
> +	if (stream->ctrl_size >= 34) {
>  		put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
>  		data[30] = ctrl->bmFramingInfo;
>  		data[31] = ctrl->bPreferedVersion;
> @@ -411,11 +421,11 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
>  
>  	ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
>  		probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> -		size, uvc_timeout_param);
> -	if (ret != size) {
> +		stream->ctrl_size, uvc_timeout_param);
> +	if (ret != stream->ctrl_size) {
>  		dev_err(&stream->intf->dev,
>  			"Failed to set UVC %s control : %d (exp. %u).\n",
> -			probe ? "probe" : "commit", ret, size);
> +			probe ? "probe" : "commit", ret, stream->ctrl_size);
>  		ret = -EIO;
>  	}
>  
> @@ -2231,6 +2241,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>  
>  	atomic_set(&stream->active, 0);
>  
> +	stream->ctrl_size = uvc_video_ctrl_size(stream);
> +
>  	/*
>  	 * Alternate setting 0 should be the default, yet the XBox Live Vision
>  	 * Cam (and possibly other devices) crash or otherwise misbehave if
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index abcafd929c9e..8d99e857a69f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -461,6 +461,7 @@ struct uvc_streaming {
>  	struct usb_interface *intf;
>  	int intfnum;
>  	u32 maxpsize;
> +	unsigned int ctrl_size;

That should be called video_ctrl_size, ctrl_size is ambiguous.

>  
>  	struct uvc_streaming_header header;
>  	enum v4l2_buf_type type;
> @@ -662,6 +663,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
>  #define UVC_WARN_PROBE_DEF	1
>  #define UVC_WARN_XU_GET_RES	2
>  #define UVC_WARN_QUERY_CTRL	3
> +#define UVC_WARN_CTRL_SIZE	4
>  
>  extern unsigned int uvc_clock_param;
>  extern unsigned int uvc_no_drop_param;

-- 
Regards,

Laurent Pinchart
