Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958809;
	b=pNszrFHRIBAkCJbkcr27TOt+/ic7RtGc6ycx4bZnjHeCghvsK1zvjFjkjw0v31jHKDYM
	 uU3fmXg5V8RSR+kgeZWqhxZtxpT2SP4vsRT2aGDUUcM1atOFzqPYiASJXNpN9jSgeJHVd
	 7UdzA4KBx8pM7qoztXSN5brXAJSgODhtZ97RoVptT6xzcbFTJeqy68/Yks5+Ntq5Ntk5R
	 NUQthee5fE2t6CVxh5nYBq+hulBEbPYxs58YWTqZghOjDFV2RWuvTHeo9SRpmksRUIRZQ
	 5oFK77PX2tqov//g+YQlSYjSeT//hhRDwOKvKUDaJiz0pJJvbDXTVRfKgS2BbbPVQiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958809;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=mbRl3t9exy6FqHqmbYkjfXKdOm1e4uREYg0nK1TRNp0=;
	b=wJbZpk5CsQKrfOQ+0lxNnsVqjU7nMGZSibg7/GsuS55bgNDPs9Szr9YPAQVHMTvQxQaB
	 wMAzdeygFt3pFG7qJsl+tN40GnifpwhIt1nVh3ZRF5Zg0q3UqZvZMm2z5q32Z/pgStBim
	 r8ETbpEeMVl81PxyUajs2sohrrZV+n/M8redT0jZUHQpdwWJUOfSU824BikQKfyXAiwxI
	 U49VbRYm+Uqtcs6KbO2BPmWjD03wjyBEpSGsH6IEoCqe3tAUFfCLK8hIGFFBKZiL2UoFq
	 udPw2JRCnAfh03RaXOSZDPtdM9up6i4Fzaq831j1Rkv6eLHZWvLFoy6XPRZzRj5C+5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UaNL2qBa;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831C606A31A;
	Sun, 25 Oct 2026 20:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E831C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UaNL2qBa
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F36BCBB;
	Sun, 25 Oct 2026 21:04:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792958676;
	bh=CeO0S0s51CfRjENlBU+f96CdgbSMMC9AWHkiZh0bpdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UaNL2qBaQPXrrMmTRXx2EmU6XOLkLDGTFHmgJf4YuU0PQS6vw4hhL8JGkSEP5nrGM
	 xNX7pQ2ttmm1LqVS9TXJQCpOe5OkF+RkGyEfYs0zvlXnLnwGbDhhuRkeIToGSv2ZTa
	 HLzNXisp3rQ1+ptVVN41zQIivA5vSdF3AiZvc/0s=
Date: Sun, 25 Oct 2026 22:06:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Manuel Herrmann <m@manuel-herrmann.de>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add support for NV21 pixel format
Message-ID: <20261025200645.GB1001933@killaraus.ideasonboard.com>
References: <20261025143522.327365-1-m@manuel-herrmann.de>
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
In-Reply-To: <20261025143522.327365-1-m@manuel-herrmann.de>

On Sun, Oct 25, 2026 at 03:35:22PM +0100, Manuel Herrmann wrote:
> Add support for the NV21 (Y/VU 4:2:0) pixel format to the uvcvideo
> driver. This format is exposed by the color camera of the Creality Pika
> 3D scanner (2bc5:0c0b), next to YUYV and MJPEG. Without it, the driver

Could you please provide the USB descriptors for that device
(`lsusb -v -d 2bc5:0c0b`) ?

> skips the format as unknown.
> 
> NV21 only differs from NV12 in the order of the chroma samples, so
> bytesperline is wWidth, as for NV12.
> 
> Signed-off-by: Manuel Herrmann <m@manuel-herrmann.de>
> ---
> Tested on media next (d7e7bca71698) in a QEMU guest with the scanner passed
> through. Before the patch, the driver logs
> 
>   uvcvideo 2-1:1.3: Unknown video format 3132564e-0000-0010-8000-00aa00389b71
> 
> and the color node only offers YUYV and MJPG. With the patch, NV21 is
> listed, G_FMT reports a bytesperline of 1280 for 1280x960, and v4l2-ctl
> streams it at 30 fps. A frame captured in the guest has the right
> colors decoded as NV21, and red and blue swapped decoded as NV12.
> 
>  drivers/media/common/uvc.c       | 4 ++++
>  drivers/media/usb/uvc/uvc_v4l2.c | 1 +
>  include/linux/usb/uvc.h          | 3 +++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index 0107cedd0..7d918ba0e 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -24,6 +24,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
>  		.guid		= UVC_GUID_FORMAT_NV12,
>  		.fcc		= V4L2_PIX_FMT_NV12,
>  	},
> +	{
> +		.guid		= UVC_GUID_FORMAT_NV21,
> +		.fcc		= V4L2_PIX_FMT_NV21,
> +	},
>  	{
>  		.guid		= UVC_GUID_FORMAT_MJPEG,
>  		.fcc		= V4L2_PIX_FMT_MJPEG,
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 644c2f1cd..60732f5ac 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -232,6 +232,7 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
>  {
>  	switch (format->fcc) {
>  	case V4L2_PIX_FMT_NV12:
> +	case V4L2_PIX_FMT_NV21:
>  	case V4L2_PIX_FMT_YVU420:
>  	case V4L2_PIX_FMT_YUV420:
>  	case V4L2_PIX_FMT_M420:
> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> index 99b070ab8..48419a862 100644
> --- a/include/linux/usb/uvc.h
> +++ b/include/linux/usb/uvc.h
> @@ -85,6 +85,9 @@
>  #define UVC_GUID_FORMAT_NV12 \
>  	{ 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_NV21 \
> +	{ 'N',  'V',  '2',  '1', 0x00, 0x00, 0x10, 0x00, \
> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>  #define UVC_GUID_FORMAT_YV12 \
>  	{ 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
>  	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> 
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8

-- 
Regards,

Laurent Pinchart
