Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B224B7A4A;
	Mon, 28 Sep 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596638; cv=none; b=soEi/JQRVeC/V87DkelVbLGW0eAO+AklkeTqkrA9ElDJKj4fU74iD1+MLALi6VXshoqUZziPrSPohb/XT2Eo4xbyDmR8uYzOcdCXejPvRAqWyStbWMmB8K+Yd2Iy7zcHe6KLqtBZiGGJPXnfAxat38YSLCUgY2td3pWdQIGihvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596638; c=relaxed/simple;
	bh=+M7TscWUN5UeQ7Nu4hIt+KoBPgO1Y9PqXzblGG5u1jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfSoW1bqhWNEHF/2H+Eykja0RpZe/PJYF8Jd2WyO95fIPG6U+zIa2BJrR0+iVtceku0MnagQw5P9IKQA4Pi8fwq2/kPkXUgo2AUatGdkFxDug0en3wE27C2fYgLKLEtkuhVmHUCA3Mhi98lQ/2fesxiHR0CvZPqNIqWwIddMprM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vLOibIK6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vLOibIK6"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89DDEB07;
	Mon, 28 Sep 2026 13:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790596524;
	bh=+M7TscWUN5UeQ7Nu4hIt+KoBPgO1Y9PqXzblGG5u1jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLOibIK67YftPZBWITN3XEbV/RH34RhIJClXn9Ui/0ohd5DZzs/ZAtbySVdytYlTr
	 JZD/u1OtOZEPyKtp04118SxBaZx1DtwH8szy6KwO3PUG9HjJnrJjYUf+cKsNAJQEqT
	 gYa6bjsQu+jUA/ARdeCiRMjhmeednh3wXbtg7BNs=
Date: Mon, 28 Sep 2026 14:57:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on
 the OBSBOT Tiny 2
Message-ID: <20260928115713.GD157191@killaraus.ideasonboard.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <20260902002553.34839-4-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902002553.34839-4-jordan.mymail@gmail.com>

On Tue, Sep 01, 2026 at 08:25:53PM -0400, Michael Jordan wrote:
> The OBSBOT Tiny 2 (3564:fef8) computes its GET_INFO capability byte per
> control, but gets it wrong for the controls that matter most on a
> motorised PTZ camera: CT_PANTILT_ABSOLUTE, CT_PANTILT_RELATIVE and
> CT_ZOOM_ABSOLUTE all answer 0x03 -- GET and SET capable, with the
> AUTOUPDATE bit clear. (The byte is not a constant stub: CT_ZOOM_RELATIVE
> correctly reports 0x0f, CT_ROLL_ABSOLUTE reports 0x01.)
> uvc_ctrl_get_flags() takes the flags from that byte, so it clears the
> UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entries set for
> all three controls. Without AUTO_UPDATE nothing clears ctrl->loaded
> after the first read, so uvcvideo serves them from its cache
> indefinitely: VIDIOC_G_CTRL returns the last value the host commanded,
> never the live one.
> 
> All three controls were verified on the hardware to change autonomously
> and to report the live value on GET_CUR:

The device implements an interrupt endpoint. Does it report control
change events for those controls ?

> - pan/tilt position keeps changing for the seconds a commanded gimbal
>   move takes, and changes on its own under the camera's autonomous
>   subject tracking;
> - zoom follows the subject under the camera's AI framing (observed
>   0-71% with the host issuing no zoom request, matching the vendor
>   status protocol's zoom report);
> - the pan/tilt speed control reports the actual current speed during a
>   relative move (a commanded 80 reads back as 78, then the deceleration
>   ramp, then 0 once the gimbal reaches the end stop). Without
>   AUTO_UPDATE the cache would report the written speed forever.
> 
> Add fixup entries restoring AUTO_UPDATE, alongside the flags each
> control already has in uvc_ctrls[], for these three controls. The fixup
> replaces info->flags wholesale rather than OR-ing, so each entry spells
> out the full flag set.
> 
> The camera's other AUTO_UPDATE-flagged controls were checked and
> deliberately left alone: exposure, white balance and focus have working
> autos, but their GET_CUR just echoes the last SET_CUR (the firmware
> never reports the auto-chosen value), so AUTO_UPDATE would add USB
> traffic for no benefit; there is no auto-hue; CT_ZOOM_RELATIVE already
> reports AUTOUPDATE; CT_ROLL_ABSOLUTE is read-only and unmapped.
> 
> The vendor has been asked to fix the firmware (support ticket #8220,

Any public link ?

> 2026-08-04); no fix is available at the time of writing.
> 
> lsusb -v (device descriptor and the Camera Terminal):
> 
>   Bus 003 Device 006: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
>   Device Descriptor:
>     bLength                18
>     bDescriptorType         1
>     bcdUSB               2.10
>     bDeviceClass          239 Miscellaneous Device
>     bDeviceSubClass         2 [unknown]
>     bDeviceProtocol         1 Interface Association
>     bMaxPacketSize0        64
>     idVendor           0x3564 Remo Tech Co., Ltd.
>     idProduct          0xfef8 OBSBOT Tiny 2
>     bcdDevice            4.09
>     iManufacturer           1 Remo Tech Co., Ltd.
>     iProduct                2 OBSBOT Tiny 2
>     iSerial                 0
>     bNumConfigurations      1
>   [...]
>       VideoControl Interface Descriptor:
>         bLength                18
>         bDescriptorType        36
>         bDescriptorSubtype      2 (INPUT_TERMINAL)
>         bTerminalID             1
>         wTerminalType      0x0201 Camera Sensor
>         bAssocTerminal          0
>         iTerminal               0
>         wObjectiveFocalLengthMin      0
>         wObjectiveFocalLengthMax      0
>         wOcularFocalLength            0
>         bControlSize                  3
>         bmControls           0x00023e3e
>           Auto-Exposure Mode
>           Auto-Exposure Priority
>           Exposure Time (Absolute)
>           Exposure Time (Relative)
>           Focus (Absolute)
>           Zoom (Absolute)
>           Zoom (Relative)
>           PanTilt (Absolute)
>           PanTilt (Relative)
>           Roll (Absolute)
>           Focus, Auto
> 
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 64c90c380..74f6e8039 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2876,6 +2876,26 @@ static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
>  			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
>  			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
>  			UVC_CTRL_FLAG_AUTO_UPDATE },
> +		/*
> +		 * OBSBOT Tiny 2: GET_INFO reports GET|SET without AUTOUPDATE
> +		 * for the pan/tilt and zoom controls, clearing the AUTO_UPDATE
> +		 * the driver's own control table sets for them. The device
> +		 * moves all three on its own (gimbal moves take seconds, and
> +		 * its autonomous subject tracking pans, tilts and zooms with
> +		 * no host involvement) and reports the live values on GET_CUR.
> +		 */

This belongs to the commit message.

> +		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +			UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> +			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
> +		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +			UVC_CT_PANTILT_RELATIVE_CONTROL,
> +			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +			UVC_CTRL_FLAG_AUTO_UPDATE },
> +		{ { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +			UVC_CT_ZOOM_ABSOLUTE_CONTROL,
> +			UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +			UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
>  	};
>  
>  	unsigned int i;

-- 
Regards,

Laurent Pinchart
