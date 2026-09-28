Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F414AE8A9;
	Mon, 28 Sep 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595870; cv=none; b=NHLLFzWdgBWhrGucnGpzlqUuFhHApcsjKOZaWw4MgxW1o1Tq56IwR+ge3+CnIYDUVfAAa2+w+FFIhDs3g0Hf4VgxEwbfzKw7ZTiK0pYfd3b8f4F+PZilF/d4OvnPDaNnFZnnOqAildrVxfrQJDPPdlKy/4h+SRJ2a9ioY3QYHZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595870; c=relaxed/simple;
	bh=hA3C+SE4gTmuEA2wSp6ivN7V1PdWDili25FnhTiFZZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBzIg1+AVC8CvA5xHuOc04MeB/5KpT1HdH6Cua79qVnqDuxxu1uwRBjMO9SeRYtGIKwALFL0bYm4mAAOHB4zX8JIUB4bWaqCYbhtKCRjXQjkaK3txAElBcZeL68N/stygh+TtFe68wMnZ4snIaU5Gb6xOn9cvJydZgeAqLMpfvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bqOlIj0Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bqOlIj0Y"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05369B07;
	Mon, 28 Sep 2026 13:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790595755;
	bh=hA3C+SE4gTmuEA2wSp6ivN7V1PdWDili25FnhTiFZZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqOlIj0YIiqJFcyGvFO2E4UU5UFH7p9QP4cReaFKZIzu4kFyKDxXYMpzSmk2SUqO1
	 /njT9hqi/hPINFWT8R79F1j/0KLz0QYwkpaldwQP35naMuxY/7yflSpOvHWAGqP7a1
	 J7zNLR94mEcd8SVo944mHjf4wnrE68y0Qd3WwFQg=
Date: Mon, 28 Sep 2026 14:44:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: uvcvideo: generalise the XU flags fixup to
 all controls
Message-ID: <20260928114423.GB157191@killaraus.ideasonboard.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <20260902002553.34839-3-jordan.mymail@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902002553.34839-3-jordan.mymail@gmail.com>

On Tue, Sep 01, 2026 at 08:25:52PM -0400, Michael Jordan wrote:
> uvc_ctrl_fixup_xu_info() holds a per-device table of controls whose
> GET_INFO reply is wrong, and overrides the flags for them. It only runs
> from uvc_ctrl_fill_xu_info(), so it can only correct extension unit
> controls, but standard controls suffer from the same class of firmware
> bug: a device can report a wrong capability byte for a Camera Terminal
> or Processing Unit control just as easily.
> 
> Rename it to uvc_ctrl_fixup_flags() and call it at the start of
> uvc_ctrl_get_flags(), where the flags are derived from GET_INFO for
> every control, standard and XU alike. The fixup replaces the flags
> wholesale, so when the table covers a control there is no point in
> querying a device we already know gives a wrong answer: return early
> and skip the GET_INFO request altogether. The call in
> uvc_ctrl_fill_xu_info() is dropped, as uvc_ctrl_get_flags() now handles
> the fixup for XU controls too.
> 
> No functional change for the devices already in the table: their
> entries are XU controls, matched by entity and selector before as they
> are now, and their flags come from the table either way. The only
> difference is one GET_INFO request no longer issued per fixed-up
> control.

That's a long commit message for such a simple change. Is it
LLM-generated ? If so, you need an Assisted-by tag on this patch series.

> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 91 ++++++++++++++++++--------------
>  1 file changed, 50 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index aceb26310..64c90c380 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2852,6 +2852,48 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>   * Dynamic controls
>   */
>  
> +static bool uvc_ctrl_fixup_flags(struct uvc_device *dev,
> +				 const struct uvc_control *ctrl,
> +				 struct uvc_control_info *info)
> +{
> +	struct uvc_ctrl_fixup {
> +		struct usb_device_id id;
> +		u8 entity;
> +		u8 selector;
> +		u8 flags;
> +	};
> +
> +	static const struct uvc_ctrl_fixup fixups[] = {
> +		{ { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
> +			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +			UVC_CTRL_FLAG_AUTO_UPDATE },
> +		{ { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
> +			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +			UVC_CTRL_FLAG_AUTO_UPDATE },
> +		{ { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
> +			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +			UVC_CTRL_FLAG_AUTO_UPDATE },
> +	};
> +
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
> +		if (!usb_match_one_id(dev->intf, &fixups[i].id))
> +			continue;
> +
> +		if (fixups[i].entity == ctrl->entity->id &&
> +		    fixups[i].selector == info->selector) {
> +			info->flags = fixups[i].flags;
> +			return true;
> +		}
> +	}

The O(n*m) complexity isn't nice, but it's not a new issue. It can be
addressed separately.

The code change looks fine.

> +
> +	return false;
> +}
> +
>  /*
>   * Retrieve flags for a given control
>   */
> @@ -2862,6 +2904,14 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>  	u8 *data;
>  	int ret;
>  
> +	/*
> +	 * Some devices report bogus capabilities through GET_INFO. If the
> +	 * fixup table covers this control, take the flags from the table and
> +	 * skip the query altogether.
> +	 */
> +	if (uvc_ctrl_fixup_flags(dev, ctrl, info))
> +		return 0;
> +
>  	data = kmalloc(1, GFP_KERNEL);
>  	if (data == NULL)
>  		return -ENOMEM;
> @@ -2893,45 +2943,6 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>  	return ret;
>  }
>  
> -static void uvc_ctrl_fixup_xu_info(struct uvc_device *dev,
> -	const struct uvc_control *ctrl, struct uvc_control_info *info)
> -{
> -	struct uvc_ctrl_fixup {
> -		struct usb_device_id id;
> -		u8 entity;
> -		u8 selector;
> -		u8 flags;
> -	};
> -
> -	static const struct uvc_ctrl_fixup fixups[] = {
> -		{ { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
> -			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -			UVC_CTRL_FLAG_AUTO_UPDATE },
> -		{ { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
> -			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -			UVC_CTRL_FLAG_AUTO_UPDATE },
> -		{ { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
> -			UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -			UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -			UVC_CTRL_FLAG_AUTO_UPDATE },
> -	};
> -
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
> -		if (!usb_match_one_id(dev->intf, &fixups[i].id))
> -			continue;
> -
> -		if (fixups[i].entity == ctrl->entity->id &&
> -		    fixups[i].selector == info->selector) {
> -			info->flags = fixups[i].flags;
> -			return;
> -		}
> -	}
> -}
> -
>  /*
>   * Query control information (size and flags) for XU controls.
>   */
> @@ -2972,8 +2983,6 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>  		goto done;
>  	}
>  
> -	uvc_ctrl_fixup_xu_info(dev, ctrl, info);
> -
>  	uvc_dbg(dev, CONTROL,
>  		"XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }\n",
>  		info->entity, info->selector, info->size,

-- 
Regards,

Laurent Pinchart
