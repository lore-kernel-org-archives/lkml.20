Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A94E020A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617821; cv=none; b=fkZlJRMGxRef3uZH/N/jXmVlUBlglCLnq8zhrJiisI55CS74pH2/jUaw+nu9Havnu49wvgtBkz4HiTnsfLdLLARITa3B5YGMa0GeVj0a/OnQl+jmadwrsXYAWX6ig2QmsflszQ0yZW7qunNdNK5Pe66p9Fo1yASD6jISVQrR5uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617821; c=relaxed/simple;
	bh=Vo7tiaS4qd/hQI2D/pUUMf1JmeMr8vHttgciIKPZ3t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIk+arA4aGaNdeE3UW0MWMY7WaRfWQZx/93OuzrEm9K7riKU/s6eBIaojxMo830GJ1rgiY26oSUSkIOW5UfP8JM6wDBwcX29dM2aGyea/o+MvXbU6kPcyIyERiViGFThHYiRa2+0k/VkvaaeEh+pGZS2oDpk7Kkbxo/TIZSfEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LeIbOH1m; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LeIbOH1m"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7a15ba46fso718517a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790617819; x=1791222619; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUOcs/vLJRWuvXVgcchrSjRSXVJyt3AuDbAQ0AxA9eE=;
        b=LeIbOH1mJLd7K8xq17V1Nb8ISWjQ7/imlcR6yI3oiBzxS5yZROzhAE4Bqa213zhnj2
         J/hIUQv2E6nBcSoKpX6HL7AbsBVsO/qrIpCxPQsCdccBwvRJIyPBoWx0eRzxpUMkS4Im
         r/VEt0W4YyAxRC0MMvpmyfiub7eTh3xBM1zOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617819; x=1791222619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kUOcs/vLJRWuvXVgcchrSjRSXVJyt3AuDbAQ0AxA9eE=;
        b=KQJq5FfwxNMgCE3l9lNLNSQIPDjQNkhP7McPWxk8/jPndS6fLxjcnSVuGYpjT28ygy
         JjJJHEucXbTNcaAhTTuUu5Zk/1br0fUTITyEzLBBDQ/uDlLntyKnleY6xM9V3xm5xeLw
         Fduvxy2dx0fhYLzT662iFEU4uYoFYPmvAxOis6F+oh54waIblyNNZ2luwtilCXn5IOJq
         8XMR62KpsOhAkbqniGh/8lRk+4AfbFW69pKwWbRCOp629d3q5gO7hUks9qOy5GRq1iqC
         4Lk6zMyairuBxOyz4fv9sam0EuSNlqhVON2jyhgp2c5Nelgclz13ReEXn6dp45DBwky+
         dwDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoDu0yuRXoXVMj76Mq5htFZKBosycx51AwkB+F5G0ojfqI1DSPdYLoPOb9EmPr32ArHUdnThhmLjPdV9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmgnT5aKzaOvVK9oQaNi0V2DzS+B9fRJbMsWJgl/isVYvxZOLC
	EgDN2T35mjA+evKvr1vNvKAA19Q/LqKd+pxproyxTbvCggmB9eEl2x5SSYxv/0Pyw76OK/nuPz1
	Bq/iU3w==
X-Gm-Gg: AYBFou2RUtNXhllp2w6HlL7f7R+RiNQ/qJMz+fyAq8qj5uyFesGNzQv02d6WLmC83jb
	/2ONEsIlXQONlEniidB3kwxm2Ak6+TrRySEKflGJ87j0WTIGeusZ0GjmTcbnkFlstTLm1OD/qLG
	z85tjNX7XnhLEu3lARZ6wc2EBB/kdzpi0znFsKVipWXipEeJZdETdJlbFHPwu4FPPB38n+8tF0L
	8gU5JogjT0ymSl0OlaBWvITX9yZ5MGnJouTDMTYd7O5Q4Qcva6EJzGrSSvvXTpn/bRohmp57+Em
	dx6u5AJTsmYIelPto4LXEFZ25XXUJ25UqUP/KLvuWGVM322LNJOm3ayMQ3HFJcezjbo+wVzBTjF
	NvUaP0W4G5V1dnlCMptUeh9c74moCj73XEXdX4HZGcnGwdyIZ2j6h0H0m05vvzD1cyYy+zRR66k
	g4yBOJKwYZdhoyUEf87KFgAJR1aZxaNOT541SEEI4ALzryrBbkl0BzJzar0ztfLonAijXDK8N/U
	n2hGyF07cdTR1aEQuJT61APQuo20XcMkEc6
X-Received: by 2002:a17:90b:4c50:b0:3a0:d823:c74a with SMTP id 98e67ed59e1d1-3a0d823cb89mr6771204a91.65.1790617818885;
        Mon, 28 Sep 2026 10:50:18 -0700 (PDT)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com. [74.125.229.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49869b9fasm695966a91.12.2026.09.28.10.50.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:50:18 -0700 (PDT)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34abf779ac9so360525eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:50:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByiRW3/cFRMiLXjJz+NiUnEH/NqcM05C2nnloagq1ANuUpPVL0vI2YRVZEug/zUv/vInmyOY7qXOXhb7w8=@vger.kernel.org
X-Received: by 2002:a05:7022:5f08:b0:143:2982:1043 with SMTP id
 a92af1059eb24-146d039e75bmr8017356c88.36.1790617816308; Mon, 28 Sep 2026
 10:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152416.766957-1-jordan.mymail@gmail.com> <20260928152416.766957-3-jordan.mymail@gmail.com>
In-Reply-To: <20260928152416.766957-3-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 19:50:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCv4R-ogez_NaXdx+q+ejQLKhPTqdR6Dx1-HAk6Y3EHKsQ@mail.gmail.com>
X-Gm-Features: AclHuK-Ewb6GQzGWa58AXBEImlBnO_UZyyEBA5b-FDYbjUaORX1kCvkIJxuHdec
Message-ID: <CANiDSCv4R-ogez_NaXdx+q+ejQLKhPTqdR6Dx1-HAk6Y3EHKsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: uvcvideo: generalise the XU flags fixup to
 all controls
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Michael


On Mon, 28 Sept 2026 at 17:24, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> uvc_ctrl_fixup_xu_info() overrides the flags of controls whose GET_INFO
> reply is known to be wrong, but is only called for extension unit
> controls. Standard controls can have the same problem.
>
> Rename it to uvc_ctrl_fixup_flags() and call it from
> uvc_ctrl_get_flags(), which handles all controls. When an entry
> matches, skip the GET_INFO request, as its result would be overridden.
>
> Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Assisted-by: Claude:claude-fable-5

nit: I think that the current way is to not mention the model version

Assisted-by: LLM

https://docs.kernel.org/process/coding-assistants.html#attribution

If you need to respin please fix it, but maybe Hans or Laurent fix it for you.

Regards!
> Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 91 ++++++++++++++++++--------------
>  1 file changed, 50 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index aceb263103e9..64c90c380d3d 100644
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
