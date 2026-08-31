Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76AE3DA5AE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168964; cv=none; b=ueB4zusXrf3nK4+e7RvjX4V5nsT8ESVuWhFe5wcWgBX6MxewNx1O5jSTF+StKr0KokTOUeCIZb6dGBRlj0QN9xwT7Ee2Z2mC1Gt4zz0j7GCOMO4QBxGez+/ZQJZmuKBWW8+zECd364DY3aR5SZMmBpaD7oabSFRqhOBV125lTnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168964; c=relaxed/simple;
	bh=7Mb+q6N+WQ81Oqcs4xdKYoCQuYOk9+K+7xb3AxjM1mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irRJfROlZx/y2bKdwOURsSEjcDQ2CNN8YXzInW6bAESXv4B/X6XRXeHa4rzeO96RSPupimdQr+FNHkK1q7T0mZ9/zGvVBtfT4fMncZ8z7U2u81fVp5IP0pE0HE5q5hMTanog6K3dSmqsWWt8SJBxi0Px2XredxESxWXm5Wgvz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mZxpOwb5; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mZxpOwb5"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2620756a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788168962; x=1788773762; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FN1nAbCl0iWx1Jrj/gmdbaIbN4coW5aF8DCQuC7TC90=;
        b=mZxpOwb57z0ZQCis9Xax0JrtF0G6ZEc59kRDs8TsvbmGQbseKUa4CoZXO8xUjfPaNW
         EMbVSmurKMMNHe+Xy8WkuQfsJev9uFGo+Rv2xIBj8X+bXjrvbLdgCTKU8nKBdpLA2RNT
         SZHurQCrpmn9ObVq9SoCwLzeUkbnBInvshwto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168962; x=1788773762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FN1nAbCl0iWx1Jrj/gmdbaIbN4coW5aF8DCQuC7TC90=;
        b=pHeDexfwc3T2fOvA8Kut0f1hqASMban/JuHF9cHCziDrhPrCdCKC79rh2Iz/bYqMLM
         rUPW/jzWwcbsQNTUX8is/rXeJJFccsYTwAhiCBrJHsNZ7f86ral/svlxXqi3irpUY/9l
         jbLsX1AFuKZmtHFcrMkGcHI3jzLNMRSVsdC8xL3wbwJxG3OKUHayx7oIILk9FVr2FJ5/
         PkboVIf2z1UjKRN7oNibCiGDb+ubSGOuakLN3jlWpxifp4DiXytZ2egPXtomaS8qg0Ot
         ChyBW259uxFfbbZk8GWePfSUTG8zilhrAz09NCPgRskI7NPGowdtTVVLoy1GkYYjRbx2
         72Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxF8QANFQ0TLMA0ByLI4g5t3rI9sD61p8nyMhKXSflOStol8qetEhiS1ArIFOIAUxuzjS0z4sxxdJ3PWmg=@vger.kernel.org
X-Gm-Message-State: AFuF++ksv/SlNSEyBJnBLwV4+rSEd93v8qcQ6vvBoP4dfyflPG5iR+rz
	4f4tbpjRJD3tts3omFCiU/LCfd61dhXU5NtT77lD59Ca5eyON6NOHPhk87e//9Ct09bOT1VES2m
	aR35YnB8D
X-Gm-Gg: AYBFou2BY/WiBlVrhGvYSUhUYInTFWCjytKirH4TD77COtleYLhEZS5KivOIOHdMhni
	l+0CPs0u5beLTuHBy4OFq+gY2XfrhGTyHDVXM7tz0/ZaFht51xIjZC1ZG34DaFd7NTk2TQ4us9Y
	n07X3cjnBeu3xqu3H3AvACKbaPGQ/zhbGEEbdyL4c4VCy2jZ+hoQul3MbX0eiCD10B26Xs4xmyh
	iLyFPnF37oGLAPUjUrjB7DFhzYY1f+TMqEvH9ltKwU/c0DYb2ak3OgOPJ3wdEDVkTko9yMMrbJ8
	1l2WmeIjwUtCppMD/INKQUt3FIShCqWuvRjY76QI/O1AZc1uKLLFZxswWP2lfPngKhV4EB4xIX7
	IcWyT8wm8nsYcBoPgwVUA5YHzw56G2ckxBpJbzMAGMBD4eW2lK/hPj7j/SSXmYCAJY3dYMkHshy
	EZwNbFK+sj5B3oCQKg/wnJ0i7yh+JtP3rkanVM1zwIB6snl5hbdtZVdsQqsI8NSbgxCO/o2bp+l
	OdL9eD/2ZPVxzmh4KpdcS8VV05m1w==
X-Received: by 2002:a17:90b:3c8a:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-396d10076e9mr38160605a91.13.1788168961794;
        Mon, 31 Aug 2026 02:36:01 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7aaaasm15762223a91.6.2026.08.31.02.36.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:36:01 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84eb992a881so2864959b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqD4TOGtXvyB0yYP72InCuDDsLqHqDxKPFeySm2d+4FJK5WOVtcVT43KwFoEeUnGmQ2MhnmBfiloxYHA+4=@vger.kernel.org
X-Received: by 2002:a05:6a21:3a93:b0:3cc:eea9:f757 with SMTP id
 adf61e73a8af0-3d268f0155amr42887925637.16.1788168959895; Mon, 31 Aug 2026
 02:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828152557.653475-1-jordan.mymail@gmail.com> <20260828152557.653475-3-jordan.mymail@gmail.com>
In-Reply-To: <20260828152557.653475-3-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:35:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCuBjSBaFn+_tU0_mJJPmYS22hYDtKkQPdA-hdyoYyAx2Q@mail.gmail.com>
X-Gm-Features: AcwNN1XgkLCjecn-xMPBFQ2S99WV76kJbhuKbPVXzKnNTlVDVd-mHsiSIZiuY6g
Message-ID: <CANiDSCuBjSBaFn+_tU0_mJJPmYS22hYDtKkQPdA-hdyoYyAx2Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: generalise the XU flags fixup to all controls
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

Thanks for your patch

On Fri, 28 Aug 2026 at 17:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> uvc_ctrl_fixup_xu_info() holds a per-device table of controls whose
> GET_INFO reply is wrong, and overrides the flags for them. It only runs
> from uvc_ctrl_fill_xu_info(), so it can only correct extension unit
> controls, but standard controls suffer from the same class of firmware
> bug: a device can report a wrong capability byte for a Camera Terminal
> or Processing Unit control just as easily.
>
> Rename it to uvc_ctrl_fixup_flags() and call it from
> uvc_ctrl_get_flags(), where the flags are derived from GET_INFO for every
> control, standard and XU alike. Call it whether or not the GET_INFO
> request succeeded, so the table has the last word in both cases. The
> call in uvc_ctrl_fill_xu_info() is dropped, as it now runs from
> uvc_ctrl_get_flags() which that function calls.
>
> No functional change for the devices already in the table: their
> entries are XU controls, and were matched by entity and selector before
> as they are now.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 87 +++++++++++++++++---------------
>  1 file changed, 46 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index aceb26310..b16a5cc0d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2852,6 +2852,46 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
>   * Dynamic controls
>   */
>
What about making uvc_ctrl_fixup_flags return bool:
true if it applied a patch.

That way we can move it to the beggining of uvc_ctrl_flags, even
before the kmalloc and return early.


> +static void uvc_ctrl_fixup_flags(struct uvc_device *dev,
> +                                const struct uvc_control *ctrl,
> +                                struct uvc_control_info *info)
> +{
> +       struct uvc_ctrl_fixup {
> +               struct usb_device_id id;
> +               u8 entity;
> +               u8 selector;
> +               u8 flags;
> +       };
> +
> +       static const struct uvc_ctrl_fixup fixups[] = {
> +               { { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
> +                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +                       UVC_CTRL_FLAG_AUTO_UPDATE },
> +               { { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
> +                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +                       UVC_CTRL_FLAG_AUTO_UPDATE },
> +               { { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
> +                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> +                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> +                       UVC_CTRL_FLAG_AUTO_UPDATE },
> +       };
> +
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
> +               if (!usb_match_one_id(dev->intf, &fixups[i].id))
> +                       continue;
> +
> +               if (fixups[i].entity == ctrl->entity->id &&
> +                   fixups[i].selector == info->selector) {
> +                       info->flags = fixups[i].flags;
> +                       return;
> +               }
> +       }
> +}
> +
>  /*
>   * Retrieve flags for a given control
>   */
> @@ -2889,49 +2929,16 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>                                 UVC_CTRL_FLAG_ASYNCHRONOUS : 0);
>         }
>
> +       /*
> +        * Some devices report bogus capabilities through GET_INFO. Let the
> +        * fixup table have the last word, whether or not GET_INFO succeeded.
> +        */
> +       uvc_ctrl_fixup_flags(dev, ctrl, info);
> +
>         kfree(data);
>         return ret;
>  }
>
> -static void uvc_ctrl_fixup_xu_info(struct uvc_device *dev,
> -       const struct uvc_control *ctrl, struct uvc_control_info *info)
> -{
> -       struct uvc_ctrl_fixup {
> -               struct usb_device_id id;
> -               u8 entity;
> -               u8 selector;
> -               u8 flags;
> -       };
> -
> -       static const struct uvc_ctrl_fixup fixups[] = {
> -               { { USB_DEVICE(0x046d, 0x08c2) }, 9, 1,
> -                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -                       UVC_CTRL_FLAG_AUTO_UPDATE },
> -               { { USB_DEVICE(0x046d, 0x08cc) }, 9, 1,
> -                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -                       UVC_CTRL_FLAG_AUTO_UPDATE },
> -               { { USB_DEVICE(0x046d, 0x0994) }, 9, 1,
> -                       UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> -                       UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> -                       UVC_CTRL_FLAG_AUTO_UPDATE },
> -       };
> -
> -       unsigned int i;
> -
> -       for (i = 0; i < ARRAY_SIZE(fixups); ++i) {
> -               if (!usb_match_one_id(dev->intf, &fixups[i].id))
> -                       continue;
> -
> -               if (fixups[i].entity == ctrl->entity->id &&
> -                   fixups[i].selector == info->selector) {
> -                       info->flags = fixups[i].flags;
> -                       return;
> -               }
> -       }
> -}
> -
>  /*
>   * Query control information (size and flags) for XU controls.
>   */
> @@ -2972,8 +2979,6 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
>                 goto done;
>         }
>
> -       uvc_ctrl_fixup_xu_info(dev, ctrl, info);
> -
>         uvc_dbg(dev, CONTROL,
>                 "XU control %pUl/%u queried: len %u, flags { get %u set %u auto %u }\n",
>                 info->entity, info->selector, info->size,
> --
> 2.43.0
>


-- 
Ricardo Ribalda
