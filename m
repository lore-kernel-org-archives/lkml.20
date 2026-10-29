Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277968;
	b=XOLFAVk/4iGaza7lvEKBJo5qRtSOgBDGf+D0/ku7dzFYz23UWyRcZPHTIO7tT0YnqGQx
	 PbsSGfMn4wFYLEY6CDjVQfEDzBnkNz044emWJPXltcx/esWn6CDP7UDYExgoxOD/eA5co
	 T1gYU0IivowgSFBZVQ3Vr/gscQCn13OC5k0v1KNVzzHEvfdS+2hNsuZtrqEp2pUuc/oqu
	 FRbyhnYn0csWW2O3SSrabrARKihpZ2ZRrc9wZyU+2ij55POyEG4+bQThE9TVF1iEEeDC6
	 kfhWIwzEXLWkux4d9NBKRe6yjVpKIxmW2N864dWQWVQLGVMV6uVp03fQimpS5vzq2mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277968;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pyqfF0vPEy9uP//rnIsCRwzN7gKyNeQUfHgeOSmrvJY=;
	b=qX+k0artU+PmTSipuw8tMpyj5DA/nmOUSDrPEehN0ZPBGt4JraxPFQNnZFWmiYYDd65C
	 NOhZ/CWlSP6UoM3vXkhousFgLMD47bJ21CUJrgAbtY5mNSacoxsOo0E4EQPzGNNr3MkBb
	 qqTxG7uHcd7mCeMva/kmbh3AkgmnEGVVKFM6OLEF5OSVwgY1bfV+6PefH+r3lzlTHsj94
	 uY5Dp4FghTV+HFHeRGmb27gsL+KQPK+w5ChewmhnaNhJ6z+HRpfHI3mN0ZYmpXk8KXFhM
	 gNwnwYf/2GLOKLAmDf7AS9uMKhYdou+UU9NBs1tRYPXkz1B+GiAut2bmI40UI8moLFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULCbiumh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A7606A31C;
	Thu, 29 Oct 2026 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULCbiumh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CFB1F01825;
	Thu, 29 Oct 2026 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793277968;
	bh=pyqfF0vPEy9uP//rnIsCRwzN7gKyNeQUfHgeOSmrvJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ULCbiumhSBpvHWfABnOL+qWWXTjf5N0lA/5Ith6C7WGBILoqVTaUf6N2ERWnc6PJn
	 mPID/jQLcmV4/Xm4aptEUXchkZbYCFJWE8D7f8RT1lXY+VzoBSij8nkqf+VibG2yso
	 r+U/MDpD+SlRVf5AipnN9Q+6+Pav3UJO49dGl7FzzVJz1b6LopuGCs+Mc8sJI3XR5d
	 ARbPI4PTuYtKzc/1NrZU/6xh4BzaZCU13h8stp9MwyR/sv+iwY1VmrAVz/IEBGnUc7
	 1ANZNumOHdFnNnFPdihV/Pl7af6B91QQeFxgf6U4A1JPTjy+3Y+t/o89uww0hfBvyE
	 cyP+KJfpdD7bg==
Message-ID: <7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
Date: Thu, 29 Oct 2026 13:46:04 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK
 camera
To: Kuangyi Chiang <ki.chiang65@gmail.com>, laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029033106.7374-1-ki.chiang65@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261029033106.7374-1-ki.chiang65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Oct-26 4:31 AM, Kuangyi Chiang wrote:
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
> 
> Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>

Is this a USB-2.0 camera connected to a XHCI controller ?

And if yes, how old is this camera model ?

The reason why I'm asking this is because the EHCI USB-2.0 controller
interface causes a natural delay between consecutive ctrl commands queued
one by one till the start of the next USB frrame, so they get spaced
1 ms apart.

Where as the modern XHCI controller interface will put these back-to-back
on the USB bus. We've seen some issues with (older) USB devices before where
they needed some delay because they were originally only validated with
EHCI controllers and the hw/ff assumes it will get some "breathing space"
between control messages.

Regards,

Hans



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

