Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE21C4BD368
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601757; cv=none; b=H9ANtWhZOt39RVYbNnBxDclwzBZvetbSo5rf8G4zWo0+Z4TC85fY+7kqzciXX9He4PgiscgzX7EXFDFpfoRa7D78Cc/v94v2q1ph2MnSHCzp/Q43XFA3CzA6YbkdVznsRoc02GmqlIYkZ6Zaxp8vVp+Ic+YiI8ctCDeCazXWnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601757; c=relaxed/simple;
	bh=E1+5UqElEpQ5P+0984SRmM5eJBgCjPMCC5ACMcP2rVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWymqB3G5ypVUYcEpgfrv1mytB7fJ5eNg+45NOfZpuxMg7JUua+1JYxtjip892bTU7MNUwEvX9/FsPiPkhM1sTdOnQ41zebbiBCrrXufLMAgu1iTIYFEv4dZFDOxx80C3eaUHnVyaa2wf9BmveWM7p9F8XKL78wbbEXhLpOUzZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T96lA88M; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T96lA88M"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso2208959a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790601755; x=1791206555; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RPcRKGYr1XZHwGm79pP3hdZM5YXoo/M6t9gIRk53wQ=;
        b=T96lA88MvPoDgUMaV/YKVht+sjae4+kUJZqCnEqpvXGGLCY3UrQGtvW01nDwZBav7/
         JAcFM5lTxFipzvh/N6hxOMdeVsFAz9E8Hqq8t+baHWpyt28MC9wcAD7ubPTFm/8VCp+F
         GL2H3iPgHoHmvqyCbW809D+VFKxJgIHvsJ0ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601755; x=1791206555;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8RPcRKGYr1XZHwGm79pP3hdZM5YXoo/M6t9gIRk53wQ=;
        b=Qefl4GBpX5yn7GUOiMt6GqfMEOYYCZ6SIEQGIn3lz08z5RNgKq75v+ukrtn/Bi0esm
         WNdZs+b22ZLm7lKUzYo/W4YL09gRJLdv7af2tnyEMeCOAhMhmNukcxDrEpP0Uu1S0Hgs
         AqJ64oXhWIPlPUPSznMWNIKlMEhxD9NifB2jM7yrd2S1rGhxmJTc+ihGu7wRrEsysJdy
         VxXkef9BXQg3ItpgwrMqMCySKE/LP/tv3ScvTOiF2l3CVgq2DPHkiTtlIFArgTd7Xn8k
         L7bNmKocC3ZSQDOvU80OA54/M9I+jpP90XE74MGXaTvE7D2RvcoihX5YvVm6VipPVkvR
         eJdA==
X-Forwarded-Encrypted: i=1; AKwUvBwTg8MA/8vSPzgeAGWyyLh+/GohrZo563a4rWASS1vpryvoQXZ5TM0jS+/tiYIhaBJp/W3856Gp37OAjHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL35ClTzTdSKuXq+5MnYr7y2aH6wqL79cWLXZMk5LlxDsbziJSu
	wsTG3pcttX2IAKN5imdMpMmZzMmwg2rvtZvHrXNn5D6yNZgsnD083tpOqfRLvK/Yo0E+pvxYLsj
	U9d8=
X-Gm-Gg: AYBFou36Cy6yw36vY9jqHSXv8PiuGpZZc/PowAwK29u90EXtZ4fjLjNMd6lxftHO5Zm
	f2sAhb5oKonQAiMiqUBoxIM3l6EhY1u1KSn4LM9gWviEx5RcFs98eVLWFcElIcOLt1EA8zUPlRM
	uvmkhO0imMHHeV3PS1KYEbq7dbrLfdGTbczJpvQf+YlrE0vdCH5HUSdA8l3/ibakfbgGLK/CcMz
	Px6WUTuRn7xxUeRs6WJoI5TDmdzhNnCxRaHmOq6T+bd0jeorQlAIioIPvez7Bv551BIhjcRzXml
	AYyeL/OUOB17nkwmGr9+DwBWiDltVj2cMW/VygdP+085dz8DrmtdyhZuiNDnt+IJCJ+XT5bbIWE
	5HQTQMHsYs+5Ho8tPmPnhAB9UOWW29kBTKIISdW9xSDD30KgBNgnCA0N5//Ksi9tZoB/jPZCyu4
	9Y22S/TjqnmOThwo/MN+4Gw7w1frSW5bwc1TEdVXJUY0S9dP1bQG+MsvkgmyoKNJpmzP1VqLaGx
	ATHN18ekcgRMhVz35POgfn+Gz72WKGV24XTI7njBP5E1kQz
X-Received: by 2002:a17:90b:37c5:b0:3a0:9640:8039 with SMTP id 98e67ed59e1d1-3a0bb59d69dmr7137507a91.30.1790601754763;
        Mon, 28 Sep 2026 06:22:34 -0700 (PDT)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com. [74.125.229.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4926a280dsm174754a91.0.2026.09.28.06.22.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:22:34 -0700 (PDT)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso1708116c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlj5BeLqR8LJan2J2KojqG+ZXXT3OY9JODa44tX5qh8w05KdF/E1M0YGQ/VjvE7rnz9/+4f76qy6Iv2Q0=@vger.kernel.org
X-Received: by 2002:a05:701b:4252:10b0:143:298f:33b6 with SMTP id
 a92af1059eb24-146d096d31fmr9984470c88.46.1790601750263; Mon, 28 Sep 2026
 06:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org> <20260928125242.GE4406@killaraus.ideasonboard.com>
In-Reply-To: <20260928125242.GE4406@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 15:22:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCtb9-LVTuhwdLYdTzNMbrq_TYCjKYOxc5TxhCqaWg2NCQ@mail.gmail.com>
X-Gm-Features: AclHuK8oVZSlYIBQO6ij5u2sY0EUmnZWXqwfIgQBb-dk-zqNmpS46gemuFgKR64
Message-ID: <CANiDSCtb9-LVTuhwdLYdTzNMbrq_TYCjKYOxc5TxhCqaWg2NCQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 14:52, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Sep 11, 2026 at 01:22:27PM +0000, Ricardo Ribalda wrote:
> > Currently, the driver expects that cameras properly implement the spec
> > version that they announce, and if they fail to do so, we do not continue
> > probing the driver.
> >
> > To make drivers more fun, some vendors decided to announce that they are
> > a UVC version that they are not. Until now, we handled those cameras via
> > quirks.
> >
> > Unfortunately, reality has shown us that there are more cameras out
> > there with an invalid uvc_version than we initially predicted.
>
> As far as I understand, this was triggered by the Avermedia GC515. Have
> you received other reports ?

I have not, but we can agree that not that many people does the extra
mile to report to this mailing list.

If multiple cameras, from different ISPs have this issue it makes me
think that Windows is handling this uvc_version more naively than us,
and unfortunately it is what most vendors use to validate their
cameras.

I'd rather support more cameras than fewer.

>
> > This patch tries to handle these cameras with an identity crisis
> > automatically. We still shame them in dmesg. But now they will work.
>
> If the vendors ignored the fact that those cameras didn't work at all on
> Linux, do you think they will read dmesg ?

They wont, but distros might look into logs and keep track of warnings/logs.

>
> Jokes aside, UVC version override was added in November 2020, and the
> Avermedia GC515 is the fourth device we list in nearly 6 years. Let's
> see if there are any drawbacks in the implementation below that can be
> justified by such a small number of devices.
>
> > Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++----
> >  drivers/media/usb/uvc/uvc_video.c  | 40 +++++++++++++++++++++++++-------------
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  3 files changed, 35 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..ca75f8d1ec46 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1169,9 +1169,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >
> >       case UVC_VC_PROCESSING_UNIT:
> >               n = buflen >= 8 ? buffer[7] : 0;
> > -             p = dev->uvc_version >= 0x0110 ? 10 : 9;
> > -
> > -             if (buflen < p + n) {
> > +             if (buflen < 9 + n) {
> >                       uvc_dbg(dev, DESCR,
> >                               "device %d videocontrol interface %d PROCESSING_UNIT error\n",
> >                               udev->devnum, alts->desc.bInterfaceNumber);
> > @@ -1188,7 +1186,12 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> >               unit->processing.bControlSize = buffer[7];
> >               unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
> >               memcpy(unit->processing.bmControls, &buffer[8], n);
> > -             if (dev->uvc_version >= 0x0110)
> > +
> > +             /*
> > +              * We are not using bmVideoStandards, so there is no need to
> > +              * warn the user if it is missing.
>
> There's value in warning the user about UVC non-compliance though. I'd
> like to see a warning that indicates the device reports an incorrect UVC
> version.
>
> If I'm not mistaken, the Avermedia GC515 includes the bmVideoStandards
> field. This change is therefore not needed for any devices we know
> about, right ?

We do not know if it includes the bmVideoStandards or not. Wihout
https://lore.kernel.org/linux-media/20260928124109.GF157191@killaraus.ideasonboard.com/T/#t
it might leaking the next control. (this is how I started working on
the other patch).

Luckily for us bmVideoStandards is not used.

>
> > +              */
> > +             if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
> >                       unit->processing.bmVideoStandards = buffer[9+n];
> >
> >               uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 2a3b7431cc68..2f3daa920ffa 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -273,6 +273,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> >       }
> >  }
> >
> > +#define UVC_VIDEO_CTRL_MIN_SIZE 26
> > +
> >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> >  {
> >       /*
> > @@ -280,7 +282,7 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> >        * on the protocol version.
> >        */
> >       if (stream->dev->uvc_version < 0x0110)
> > -             return 26;
> > +             return UVC_VIDEO_CTRL_MIN_SIZE;
> >       else if (stream->dev->uvc_version < 0x0150)
> >               return 34;
> >       else
> > @@ -290,7 +292,6 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> >  static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >       struct uvc_streaming_control *ctrl, int probe, u8 query)
> >  {
> > -     u16 size = uvc_video_ctrl_size(stream);
> >       u8 *data;
> >       int ret;
> >
> > @@ -298,13 +299,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >                       query == UVC_GET_DEF)
> >               return -EIO;
> >
> > -     data = kmalloc(size, GFP_KERNEL);
> > +     data = kmalloc(stream->ctrl_size, GFP_KERNEL);
> >       if (data == NULL)
> >               return -ENOMEM;
> >
> >       ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
> >               probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> > -             size, uvc_timeout_param);
> > +             stream->ctrl_size, uvc_timeout_param);
> >
> >       if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
> >               /*
> > @@ -319,7 +320,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >               ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
> >               ret = 0;
> >               goto out;
> > -     } else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
> > +     } else if (query == UVC_GET_DEF && probe == 1 &&
> > +                ret < UVC_VIDEO_CTRL_MIN_SIZE) {
> >               /*
> >                * Many cameras don't support the GET_DEF request on their
> >                * video probe control. Warn once and return, the caller will
> > @@ -330,15 +332,24 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >                       "Enabling workaround.\n");
> >               ret = -EIO;
> >               goto out;
> > -     } else if (ret != size) {
> > +     } else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
> >               dev_err(&stream->intf->dev,
> >                       "Failed to query (%s) UVC %s control : %d (exp. %u).\n",
> >                       uvc_query_name(query), probe ? "probe" : "commit",
> > -                     ret, size);
> > +                     ret, stream->ctrl_size);
> >               ret = (ret == -EPROTO) ? -EPROTO : -EIO;
> >               goto out;
> >       }
> >
> > +     if (ret != stream->ctrl_size) {
> > +             uvc_warn_once(stream->dev, UVC_WARN_CTRL_SIZE,
> > +                           "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
> > +                           uvc_query_name(query),
> > +                           probe ? "probe" : "commit", ret,
> > +                           stream->ctrl_size);
> > +             stream->ctrl_size = ret;
> > +     }
>
> There are two other locations where uvc_version is used:
>
> - In uvc_fixup_video_ctrl() to implement a workaround for pre-1.10
>   devices that don't report dwMaxVideoFrameSize
>
> - In uvc_ctrl_filter_plf_mapping() to stkip the power line frequency
>   control on pre-1.50 devices
>
> None of those are handled in this patch. Furthermore, more usage of
> uvc_version may be needed in the future. This patch seems a bit fragile
> to me in that regard. Could we instead detect the version and update the
> uvc_version field ?

Will send a follow-up to fix dwMaxVideoFrameSize.

uvc_ctrl_filter_plf_mapping properly handes devices with invalid
uvc_version. It automatically probes the control.

I though about parsing the uvc_version, but then I realised that some
devices might implement video_ctrl_size correctly but not filter_plf
(or the other way around).
So I decided that this was better.

>
> Another option, given the small number of affected devices, is to just
> merge 5/5 (as well as 1/5 and 2/5 that are nice small improvements).

I'd argue that 4/5 is also a nice to have.

>
> > +
> >       ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
> >       ctrl->bFormatIndex = data[2];
> >       ctrl->bFrameIndex = data[3];
> > @@ -351,7 +362,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >       ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
> >       ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
> >
> > -     if (size >= 34) {
> > +     if (ret >= 34) {
> >               ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
> >               ctrl->bmFramingInfo = data[30];
> >               ctrl->bPreferedVersion = data[31];
> > @@ -381,11 +392,10 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> >  static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> >       struct uvc_streaming_control *ctrl, int probe)
> >  {
> > -     u16 size = uvc_video_ctrl_size(stream);
> >       u8 *data;
> >       int ret;
> >
> > -     data = kzalloc(size, GFP_KERNEL);
> > +     data = kzalloc(stream->ctrl_size, GFP_KERNEL);
> >       if (data == NULL)
> >               return -ENOMEM;
> >
> > @@ -401,7 +411,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> >       put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
> >       put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
> >
> > -     if (size >= 34) {
> > +     if (stream->ctrl_size >= 34) {
> >               put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
> >               data[30] = ctrl->bmFramingInfo;
> >               data[31] = ctrl->bPreferedVersion;
> > @@ -411,11 +421,11 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> >
> >       ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
> >               probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> > -             size, uvc_timeout_param);
> > -     if (ret != size) {
> > +             stream->ctrl_size, uvc_timeout_param);
> > +     if (ret != stream->ctrl_size) {
> >               dev_err(&stream->intf->dev,
> >                       "Failed to set UVC %s control : %d (exp. %u).\n",
> > -                     probe ? "probe" : "commit", ret, size);
> > +                     probe ? "probe" : "commit", ret, stream->ctrl_size);
> >               ret = -EIO;
> >       }
> >
> > @@ -2231,6 +2241,8 @@ int uvc_video_init(struct uvc_streaming *stream)
> >
> >       atomic_set(&stream->active, 0);
> >
> > +     stream->ctrl_size = uvc_video_ctrl_size(stream);
> > +
> >       /*
> >        * Alternate setting 0 should be the default, yet the XBox Live Vision
> >        * Cam (and possibly other devices) crash or otherwise misbehave if
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index abcafd929c9e..8d99e857a69f 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -461,6 +461,7 @@ struct uvc_streaming {
> >       struct usb_interface *intf;
> >       int intfnum;
> >       u32 maxpsize;
> > +     unsigned int ctrl_size;
>
> That should be called video_ctrl_size, ctrl_size is ambiguous.
Ack
>
> >
> >       struct uvc_streaming_header header;
> >       enum v4l2_buf_type type;
> > @@ -662,6 +663,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
> >  #define UVC_WARN_PROBE_DEF   1
> >  #define UVC_WARN_XU_GET_RES  2
> >  #define UVC_WARN_QUERY_CTRL  3
> > +#define UVC_WARN_CTRL_SIZE   4
> >
> >  extern unsigned int uvc_clock_param;
> >  extern unsigned int uvc_no_drop_param;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
