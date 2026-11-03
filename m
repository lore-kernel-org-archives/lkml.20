Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737678;
	b=ZHYvOyHURH91rlYcAKDf9IRVvGK/FVo8SjlNSmEeaoPCfwCy2aQLjVaoaifpev1vb5bI
	 APO2WqSL0gwu8tH0+V+S1dS7wBq9+YNoaLCUD4cJzr7SZDKnxWCuRJfN2mIVkIbhAmlhV
	 lnPiSmwV0uxZe6X7dYPa/9aF6UVeH6Bjc5SkdHMkOFWpqEzLtwp+mdMNoeiobYmdoNcWM
	 14GR8dn25nLvXmcEo2agEXIoI7g4LDHAvqGHf1o1VE2Xo3ZOnrEoa5Gc+SmTfpm8kaodT
	 zWWs+VMfDcIcTw+urgkjtUNVUChtZU3i2y9BeBskDKtZRC1OSY4hvpM5/ORVUBiL/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737678;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=fnpflM47wvGG0hwWR6WATMCEt8TRH1OkdyCyS+HJdDg=;
	b=NpwwYnqSJ8KNyxlgHQOtzaoXY7q8sKaWAICyNuyVAwr35vSr2QE+SnhC9GjCNGwi26wT
	 oD9MwY4vsaB1UwwNx11x80n4NqvaU4qluHSmISvcntgdf/x7+kYo5O+ClGVVLL7Wp2z68
	 eT4/iboLvEUXJVWpq3JHsCi3yqO8VZ7/ckB959mqMfce2cubWUKLAU4t9lsE8w6rj74HW
	 0XzouTsNgBCesWkHMLPlGPuHfXRfKKUU3PB4zqXAlkXbL5LVMJlp8Ng9UO53oPAY4cr2n
	 A6fkgd5G0iXvs7GYZHpVRAg2HkAncEdYVGpv5zDPXtUIlcaP1bCFvtMhxeg4hjuPEXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="lYY/j6zw";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8948A606A324;
	Tue,  3 Nov 2026 20:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8948A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lYY/j6zw
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB1FB6DC;
	Tue,  3 Nov 2026 21:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793737537;
	bh=wzZJeygUkHu2Eg/ueqz8GixHo6cAyjxaWg4xMDcAfMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYY/j6zwziedk+YPPS7rfaC+ywclpX24t1qiDbNLpBfHAsOJ6xdR2al67JQIKHuhg
	 9xJaYQIiZKw7/bHuvQI4tNP8Zwg+tVnDM261wm6ZrXEvgdJpLm7QPtILug+VoEWpwa
	 6yD7dQGbnFy1FI74DD5YDAHSwG9+fJFyDzxMsskM=
Date: Tue, 3 Nov 2026 22:27:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Manuel Herrmann <m@manuel-herrmann.de>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add support for NV21 pixel format
Message-ID: <20261103202753.GA3862409@killaraus.ideasonboard.com>
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
> skips the format as unknown.
> 
> NV21 only differs from NV12 in the order of the chroma samples, so
> bytesperline is wWidth, as for NV12.
> 
> Signed-off-by: Manuel Herrmann <m@manuel-herrmann.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
