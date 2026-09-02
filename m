Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108B25782D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330893; cv=none; b=qmyxC2hY+1b+aU5kuamL5Bs5sYNtOo3HLfWLl9zw8C9mMTEBf1ZnxNxM1AfhKlEy7WZb+Ydrg5ucFZSluRp4QwjpsMMkmH53yw5vYuETP/sp884oICWJuMkk7ES0pEXyX+/L1HHhiPHEa4MZtwRMqm5iVtd6SweWL7n80EJMxJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330893; c=relaxed/simple;
	bh=v5NNZ13ICIwFEB7KwX6D6WmT1ybAJgJP24OCFpO6Kvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEg2sQsOh0IjAk7ACgwXKGvr6Ii0rrafrYmu3Vg+lklE0Cp5MpvKFcvrD1mULM7NycZKQsf1D3MLcsL/Jy1dxTE8NgMFvjVQTZxSBY1F7ptJmdudkm78UFv0tQ9GtL0EU8KO9asq7ubNCNUPLs9Jqf3l12jmFZjUVPa+O1N885k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gLn6t9SJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gLn6t9SJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d8f265cbe6so6185525ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788330891; x=1788935691; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD6xC4rnHgCgww20/q5WKAfoI9VRmRXVJLBx2igp1m4=;
        b=gLn6t9SJh4aL6QJZhiVuZcIlAf0thdVUNVvYrd9dTm5yQ1Sux5VWac6uX7cupNMCdL
         yLvn5oLeJaCraf0UC8x7NcFZR0u5Nkvhnmp1N/CCMHSZd8jAhb+l0+pfFuUIDT9DddxU
         zdvCow/Mhzyne5CRaydLQJAcocTsqEtyTFkHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330891; x=1788935691;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gD6xC4rnHgCgww20/q5WKAfoI9VRmRXVJLBx2igp1m4=;
        b=YGP1gfpnnCctaGBl8OKBv6ZyGgOIqH4r1gRWD1pRJVdyZf42ZKLjqhMVM6/FruR+t9
         Q3pIxAH1w29CHEkV6xNXRtdKoUA1UYUGhM+1nWIKkSvT4jUqmUFoPAfvZy6ofbMsKKL4
         xCWaggyCLy/2/ToUcxMdo/y5Apc7HYXrhZA9jB/gIAPolG1MwU7ZFzuoTEzqEvtHdTX8
         8uZ9LlEm1ubJboO31IAnbUKmJvJlHI7BhxYxIEh6R4iffAZxZF7Es/uX+zcUzIxGQxEH
         z4V5PrZJeDRWORoIp9X4AfghpvZ95VNFMZ2xdKVJz2HKgI4K47+scAzgivARoTyYgcCG
         /9vw==
X-Forwarded-Encrypted: i=1; AKwUvByZzEuDuRGtxQYN2oRoRBvRNOO3I+4kvfKZEzxqoCg9c3ijZsGJ9wCY6kgN/RABgYE5JTAMXRg+9+SctEc=@vger.kernel.org
X-Gm-Message-State: AFuF++nzXVcVkzs+/MxALXsLevRMK5YIn0qeTPDXeCekRuxHYH45Jvhf
	cf+BYUhQtMuyo6F//EMIvwitVSQ85knOWWLIjdfw9VuCMM1h7/s5tSa4a+NDB3MG+tiUYUhXui3
	bUKnorg==
X-Gm-Gg: AR+sD12OiefMht0vH+vQzr/P73/iT8zM8nhLz7jaMZ/jWJiknQOiJYK5O8QyTzSj5Sw
	QFd7JXGBV9cu27DZuSKnIx25Ssfjfn82ZwL0JStxDdu+mvJy8lFUvYpBGGmR1821c/AyxRSDlmD
	D5m8m0IQ5RtYmf4s5a/Vyer2HluEAj+DLIoMLvD73wti83+KPVTTq96tDHiYexCN1clgvavvqUq
	+xfBHKAgq/8szh+MYHOPorz55gR8X7ow5NTmNMmkw665xHSOwwFw0jQqmWwbiDFCTV7MBWSBKmM
	PVFcONNCOiTw5wmaFBstG6XyFw6NBMCazXYjRTckIlL9nDGNK6TMxJKMbq2UsKF4hPfwPnCe7oq
	sGuh8Uo4p/ilXRzDHsrY3PwMnkz79J/HOG+RwBc4fFlKXy4OsyIJGgFM4etxmpJ6GyDdokhiB0Y
	Vr51FUrlURfn309kBLGbAgQQk/Wrnvu9TR028nmtwLOWPSHIV8hH0lv6S26kKxo0Ire9/dWPr37
	m5F4jTMU3BjOHVCULMS+U9fguwlIQ==
X-Received: by 2002:a17:902:d98f:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2daec6d7c52mr40376945ad.10.1788330891517;
        Tue, 01 Sep 2026 23:34:51 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488af8sm7962795ad.44.2026.09.01.23.34.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:34:51 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso738868a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:34:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzG6DvFYuJb22fZuo6Igggf7a4dAy5IfoLRu+7br25fHZuKBr8UslemWFNiWXoYfDGK5v1flOS/JA31cO0=@vger.kernel.org
X-Received: by 2002:a17:90a:d44e:b0:398:ceed:6d44 with SMTP id
 98e67ed59e1d1-39aee1bdb29mr4020081a91.25.1788330889395; Tue, 01 Sep 2026
 23:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-4-jordan.mymail@gmail.com>
In-Reply-To: <20260902002553.34839-4-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 2 Sep 2026 08:34:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
X-Gm-Features: AcwNN1WU18_0j7LBDxpDuT4pyAr-4a1s3iw8XblmP-PrLavwmJt-FjbCa16vEiM
Message-ID: <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the
 OBSBOT Tiny 2
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

Thanks for your patch:

On Wed, 2 Sept 2026 at 02:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
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
>
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
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/linux-media/20260902002544.34798-1-jordan.mymail@gmail.com/T/#mf4b518b5bfa604a5c925d23d1653b927b811488e
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
>                         UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
>                         UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
>                         UVC_CTRL_FLAG_AUTO_UPDATE },
> +               /*
> +                * OBSBOT Tiny 2: GET_INFO reports GET|SET without AUTOUPDATE
> +                * for the pan/tilt and zoom controls, clearing the AUTO_UPDATE
> +                * the driver's own control table sets for them. The device
> +                * moves all three on its own (gimbal moves take seconds, and
> +                * its autonomous subject tracking pans, tilts and zooms with
> +                * no host involvement) and reports the live values on GET_CUR.
> +                */
> +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +                       UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> +                       UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +                       UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
> +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +                       UVC_CT_PANTILT_RELATIVE_CONTROL,
> +                       UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +                       UVC_CTRL_FLAG_AUTO_UPDATE },
> +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> +                       UVC_CT_ZOOM_ABSOLUTE_CONTROL,
> +                       UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> +                       UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
>         };
>
>         unsigned int i;
> --
> 2.43.0
>


-- 
Ricardo Ribalda
