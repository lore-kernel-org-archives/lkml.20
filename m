Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17F37A843;
	Mon, 28 Sep 2026 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597417; cv=none; b=lWto/mLD4/SruQ/oxw5G0dgkTeFmkKtQJiVudJEvkQH7e8ck1Y9NnmY0WXVme7Ie1ZkAXfXdnQirBrlI+9MdxDWn4WuyUID2vAm5yDH5qaXM31OtAal5vkK0tNTK4WnrBg62QvtTeUiFuNAbK3C/RO8O3qhyBECtJkEsad+9JhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597417; c=relaxed/simple;
	bh=4D27CAkRt6cgtziSTtRYpMnhYidbFcda7zVwvFXMXP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaOPI0i6Ov5oGajxDk8xUHuiX5dZ9th18mJaQiFqFDiwW9+eCRzv6+e8nMQ7Kn121FFHkyNtrQ6PO30NH7EarnyC0fF2oFJsYN3Wv51m1V7z/W4xO8lHzH5pOYE6pmaSrswOaN8d47FTq30sFuaTb/uwYjFAJ4j+BXytIh/arzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h02aj/gg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h02aj/gg"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA6E25E;
	Mon, 28 Sep 2026 14:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790597304;
	bh=4D27CAkRt6cgtziSTtRYpMnhYidbFcda7zVwvFXMXP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h02aj/ggXuRh4Rm4XDP2+QTxaMZWwU+Xm/Pm1pzSaY4qBkosYUXtFTUF3YNjyyeTw
	 9zT64sQ5vktkhGlZRKrJ9doG0AXXPyBL6Wlnq7WRCT+60Ed0VbpuDWiDgztmNlxDke
	 9Tq6yz1u5n/oQKA/XJJ888NWAqB030mviO+ul4lI=
Date: Mon, 28 Sep 2026 15:10:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Edwin Gatier <edwin.gatier@protonmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 2/5] media: uvcvideo: Use uvc_warn_once when it make
 sense
Message-ID: <20260928121013.GD4406@killaraus.ideasonboard.com>
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-2-604328d8a0dd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-uvc-version-v3-2-604328d8a0dd@chromium.org>

On Fri, Sep 11, 2026 at 01:22:26PM +0000, Ricardo Ribalda wrote:
> If there are multiple cameras in the system affected by a compliance
> error now we only show an error message for one of them.
> 
> Use uvc_warn_once() to print an error message per device.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  drivers/media/usb/uvc/uvcvideo.h  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a4399f..2a3b7431cc68 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -95,7 +95,7 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  	 */
>  	if (ret > 0 && query != UVC_GET_INFO) {
>  		memset(data + ret, 0, size - ret);
> -		dev_warn_once(&dev->intf->dev,
> +		uvc_warn_once(dev, UVC_WARN_QUERY_CTRL,

I thought about submitting a patch for this when I read 1/5 :-)

The only other usage of dev_warn_once() in the driver logs bad access to
the privacy control from userspace, which doesn't need to be logged per
device.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
>  			      uvc_query_name(query), cs, unit, ret, size);
>  		return 0;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a80406f20beb..abcafd929c9e 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
>  #define UVC_WARN_MINMAX		0
>  #define UVC_WARN_PROBE_DEF	1
>  #define UVC_WARN_XU_GET_RES	2
> +#define UVC_WARN_QUERY_CTRL	3
>  
>  extern unsigned int uvc_clock_param;
>  extern unsigned int uvc_no_drop_param;

-- 
Regards,

Laurent Pinchart
