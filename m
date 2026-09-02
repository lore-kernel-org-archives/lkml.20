Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683AD2D2385
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331121; cv=none; b=MwbgRRrBYLGFmMpjTzEc90ULDHRQWIuS0UUOxR3Fdy/jgi9NZ0/giNWNxcHfBgYx4kwiZpCXE3NN7LzBQUHFhJWWQedHt6XiJ2iKpAmAjQZLs0tolrWJCp/ZQ+epch9EdLqX1TpKbSQAotBgQYn6HgHIIkPkFPpo/NIiovxtboY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331121; c=relaxed/simple;
	bh=d4vLhITn+jR/h6W3zj3Hov9b+bUcb/iUnGTEbg+K46g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bj472QfMReliZ2I3SlIzodq1HMoQz3XnyhYHlXgxtQKD5K/46096R/XJ23So1r3zMYCiyIu7warBTQ+RKgcAR/aSOZfxXEoYzdM//TzDm4ycVkJcOVszAh2B/ezv747aWzs60KBXca/AnilgegYp3JA73Kv1JRPObNfm4mtnNLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TmRnmujS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TmRnmujS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so640642a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788331120; x=1788935920; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpQcfp2zeHT8RNQwdlP8Z2qS1OhmNqrs1OuEaNbmbws=;
        b=TmRnmujSA8vNCa5dCV03mLsUZN8Hf/cd3buVo0sz/sBUDvxMLs41+NUZXlbCQGeXPt
         XQHuyN2HHRggGCQLDjRbyc//qNLW6fDgR5/oqEVd2nXD/ex0TvWzbK5ztS4etxl9FtDQ
         GPuqmybs7vI3kRheN6fz8QWB0PjIq8kKxLPyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331120; x=1788935920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xpQcfp2zeHT8RNQwdlP8Z2qS1OhmNqrs1OuEaNbmbws=;
        b=a+THBCftq6RVfNMRAQ6dytDYzUmPkjgyZGY+YwmjyWKtoMRHrKU8bqYNU5aZuYRrlI
         GN0f4aTOmbYgaE7TvCURhiRL3IgkaUayJ5cx5CPJorXgxAOgaRN6XYL0x04BSGNmPhfR
         4q1QImfD1rAEMmEXquC3XrtjzDHNMeV5yExf457AlQLsnyTcy9/ph6DpkTE+Mdazmptj
         N23gmb7943dRPNdVbkB05bb9fDIr82wDn+Ip9o6QORNX8AhPtnXCx3NeL/7Ox10WNqar
         HDNjzyCnjErq1RV/BN21FNRPpvOSpAovO6mTiRtVq7F2CVTWlszl5UHYYkVUD7KGGoKQ
         OIWA==
X-Forwarded-Encrypted: i=1; AKwUvBwqzPR6DdTeF0ldpGKyvcPNKBI2cnGZZIUwDnX/WZXra2fl84tIQapFsGhorjhM+Q4YR5MqQuwur7ocMWI=@vger.kernel.org
X-Gm-Message-State: AFuF++mARQvzZru32rsZknHM7o4ehyXYRuB4wj8annMZWvvI4kBgQvIw
	LIBxtEtJn9VTVtZuaveb1kpDzel/zJmN7Fvhy3Hdc/t4cotcd4Z0ACFxlERzYB1FXmm6qIwA8bp
	EdOI=
X-Gm-Gg: AYBFou0VIEcM6LxEdlsKfVUM3LdcwM0VEb62rDeX120wJcc4EVHLp++C7rl5FpYXrAG
	V2skPjDfw8wAGMzDAwTN/4mzZfoeYvHqZ4OXLLX6vOEkw7Qz3HdlWUvl2qA0A5upD/9aMpK9kCl
	BMwjk5E+NGCkzVuegRivLri0YndBKNP5ow09WLI6MG15MYEw0ztmxwCPlmD2ARH9wj6INPHPv0b
	vEH2s9J+pLLe2Mgakoq4kvmgMTGtWQSWigq+Y53P9cRjejPOAiEu3dbmRWLi5xgyqXskGInKMgz
	wXNK+0hWWsMbj3WfDtcifUZJFLleI8/LIJIPd2qKr0UopcVcuU3UoAcXV0xmK+JLTjJKg5LuMqs
	xvqXaGvVlubwUltJ9TqU93JwyUvnzH0YlRVEeqD4OAxbKBFt3v6mh6NuHe++XEtiGycpivRcssQ
	wlxAY1STMSWEHwOvzZjkwZtxily4XBAuAXbrsCBe4Tl2j9xlF0MraVXszcUEA2WkY4TTHGtapKE
	+ZbRGAFBiMG8iFc0mx8ew2jnQ==
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr3426695a91.18.1788331119765;
        Tue, 01 Sep 2026 23:38:39 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990baaeec3sm10015534a91.0.2026.09.01.23.38.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:38:39 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso535553a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:38:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy198NPoa4o/cpohD6GN9gkS7dH+McJLJnNK0/3XZOgnMC/Qc7CjMnFte/Kn5iU7HoKI8GEoTknwK8DA3g=@vger.kernel.org
X-Received: by 2002:a17:90b:4a:b0:398:9be9:ab92 with SMTP id
 98e67ed59e1d1-39aee17ab22mr4098888a91.23.1788331117973; Tue, 01 Sep 2026
 23:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-3-jordan.mymail@gmail.com>
In-Reply-To: <20260902002553.34839-3-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 2 Sep 2026 08:38:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCtNb1YE1CgUCx4a+WFbjrNDbuoSRN_Y2F+fyWH7zae5oA@mail.gmail.com>
X-Gm-Features: AcwNN1VaVnNnO0ABGaKnSfEvaKXGYoxdBD-bQsnkN8Htq1fDqUxdpnpCBKWudIg
Message-ID: <CANiDSCtNb1YE1CgUCx4a+WFbjrNDbuoSRN_Y2F+fyWH7zae5oA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: uvcvideo: generalise the XU flags fixup to
 all controls
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Wed, 2 Sept 2026 at 02:25, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
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
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
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
> +                       return true;
> +               }
> +       }
> +
> +       return false;
> +}
> +
>  /*
>   * Retrieve flags for a given control
>   */
> @@ -2862,6 +2904,14 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
>         u8 *data;
>         int ret;
>
> +       /*
> +        * Some devices report bogus capabilities through GET_INFO. If the
> +        * fixup table covers this control, take the flags from the table and
> +        * skip the query altogether.
> +        */
> +       if (uvc_ctrl_fixup_flags(dev, ctrl, info))
> +               return 0;
> +
>         data = kmalloc(1, GFP_KERNEL);
>         if (data == NULL)
>                 return -ENOMEM;
> @@ -2893,45 +2943,6 @@ static int uvc_ctrl_get_flags(struct uvc_device *dev,
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
> @@ -2972,8 +2983,6 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
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
