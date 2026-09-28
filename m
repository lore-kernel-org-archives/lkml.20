Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FCA49D5B6;
	Mon, 28 Sep 2026 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593997; cv=none; b=ERwncyVzWzwKrRKfAtWOlGrOmsDet5JiA2LElNey02ug7yaNor6+Df+WtiVlaFzwgNL/dR4Lms6F7m+FpDooTGDQ7RCPE0x/PGnzKJN//FKAPJKsaR3Nz+9yP33jkh/ZLJ8QRGIlK5j9WZZKxMM6dZd60dMpqu8dGOzAqFb3qeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593997; c=relaxed/simple;
	bh=3KQztp1dC5SheoWQiW79Y7s2v3h9wFDjH9pluNo5xjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3VhsZKHIb28JsfoPv7Lk7BMP4Fi2OqsD8P7rgb1pIGrHnvjmqZb9Imqu48FNiODElygquQ9G9imnU/qCcGeGt/Qwb1o9fBP4AmCKksD1hjOAAT82OG/UJglui37rs3/mhFFdyH6Zm8QPcgEXWqF0TxrAn7NU6Hr2yCC/ZcUNz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kF+1yIaG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kF+1yIaG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABCF1F000FF;
	Mon, 28 Sep 2026 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593995;
	bh=NQfBAlPZrUjXi/gxs2LDUhMbfbkNR/0OacnxXDEZCSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kF+1yIaGbKdYXxnIm/Z8S2wG03x9npgxbnRtkWp71K82nZw2/Fof1DOdIi4y1f7q9
	 yTEt9OnLHxYvJf4MOXa2mYXpOJ8Zqd0qWZOO2ZZhmcF+qvsmZ2XsSxdtYS1xkFYNO1
	 dsc8LPwl6ZON54Vk7ZDEtFXY7ivB2o/XseBruHOO/yLseeANp5ezSu2KlIMEN4dNSz
	 A/cAaLZom4mDoZsvGVCzjYsu+ggNRR5H57g/5jxcYy7DLJZ+G08VlnsFsSnoXkIGGq
	 c0TmJgafHwPf06sINZwrz0gzCQPaol1GEgkU//dAcqIkG5s+acrs5QPgWYPKlQ3f/w
	 8aI357Jy5okng==
Message-ID: <29c3a7e4-cd53-41d9-8bbf-458ca9c10704@kernel.org>
Date: Mon, 28 Sep 2026 13:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Sep-26 15:22, Ricardo Ribalda wrote:
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
> 
> This patch tries to handle these cameras with an identity crisis
> automatically. We still shame them in dmesg. But now they will work.
> 
> Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




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
> 

