Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2434A1BD9D0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603115; cv=none; b=DLy6lUi2CMXPw6JxJ3bo9JhN4DfZp9/q2NN3nhBKp2QY+hjELE+WQ6VNAkwjQZMKIebqgkX+KomUxCAp8IC0ipA5efafcomZC9ojSQp/l7F1CJ4pjps5C+lq2xk40FoV/lx3xP6K5K3B6jfQ3l5xTn7PbHvcaMaxiZVvKfskM1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603115; c=relaxed/simple;
	bh=D6K3BOI5KNWAmDk2QBwwqXifEnqtxRuoE2x5RluKaj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8ztcMn3mBtz+pw1ScQCRryPY1WMXFYLnLuCq6r2/Zq+gZkmo/sSMLCxxSljJLBfx0pm70qEqruQZzchkBkAOJ8/xiLYR09BI18GbMy/1RsJWDWsi1axKHyz25woe5Kg40LXVX1DceDP+9tET9flp9z5pg7uGjYxbwdmhcGDEXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jx+vDvKI; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jx+vDvKI"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso1517049b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790603112; x=1791207912; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgHkR3jCTMFGIyjZGHnZqmPlH8rDju24yO6Q6RorKic=;
        b=Jx+vDvKIq/th2GydJ4R1aTwqqDgNj+IodUE5X/HWC6wySMg5kp9DOkzol6jlBiI/ed
         YdinGGfVerUbP18UG0GBlBHHqhDH7EnnAGB6B8aLb5IzzpNq3L5c3IUXxl/BUOJElQzd
         wCJx7FVuf/NtWKC5TD92VkCv/WcaQEptlqdE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603112; x=1791207912;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MgHkR3jCTMFGIyjZGHnZqmPlH8rDju24yO6Q6RorKic=;
        b=nwj3Bm3RknEZB/757FzS2F1dj85iJngeaM35c01qshgT3iaayZXxJopOPOhKHuVkKL
         11Lc75Xo/pxaDj4ukcsGFgBxheQdmYnbihYrcuDRacxzgmDCCSKtsDBZRF9MCElazVsP
         eygK82J3OR16egbXMiaUzZjE57FeQUWzzAgPBijcxxwp5wFvGIUTA+SxGpgahtkyb0BP
         4AYxN5WoefhBWb+I6iSu5eMRXML2jYTgtVIXdBBsmSj6/nwRaOWIKcvTYUtGt9J+rh1f
         1wmhwI4Rr6DiXXm+MSXQavU2J/ew0oEzSotBq1NEMZ2cJnNeSAT8K9tOOABpXT1sBe2A
         7bbw==
X-Forwarded-Encrypted: i=1; AKwUvBx+mU7WpEXryReF3qx8DfSrBzVRanhrbcLRIvshuPuWp3W4j5Ob2s+e1+0IWjswkX3ryp9LqV415xvJCmA=@vger.kernel.org
X-Gm-Message-State: AFuF++kSohW1CIKfRn0uylUGpesDASlTzh6rJahwsuZYggVMIbrqbt+J
	oJBkoVMINosp42Jm9ehDYFPyxo+Zgzdtelt+one/70dSJCrGp9d1mYCzhgL9FTyfKaa1u4fBmiw
	JMhY=
X-Gm-Gg: AYBFou2QMp+184cyfo3+mKORfnK62kjSfidAex5eQYpwIavzM/qvPRyhsHMGzHrx2w/
	RYOZq09NgviYtS5TWVXVPMdOB3z+HiUAwh8kgUI+P3ikmkLD5UTprbBDqEg4iNCIhOzdOn0FGY0
	xQ0Yt03PmasuVhGxMxPVz8OazWAsxX2bl1URIqrbOyuAt3SxLmUpcJcUCPr29n7k08wg/tQXJ2e
	Ajv0AHZpqCZ0zMa6sL1mDhrxywxDu/OtXvWSf1GY8ifQMD6w4YQ6CYzDhzqBNqma9eTJiV75a4i
	YMkyV/hUAuTk8uB7+18iw7tP7L/XwiA3P2D1j0YHwkcwxZ3qEQcp7MAwdnnc0c1TCDlBClNvSjE
	y1+goNTZbBuc8ZltMLB8jYFeQljXHITN08eQFLtUwJyIppZKVCDdc128Lq+WlfClD9TjXwsmNcq
	inU9HpfwzK7erOkhHkkCHcSaOlXFF6bvxofI0Wibtd7qqB6wVDP86dpmaLPWFsKkFRrwS5PhNzL
	y+rHjPMgw7nZVi8BOQFCJu70hfslSqpVIdyRA==
X-Received: by 2002:a05:6a00:807:b0:881:e626:74b7 with SMTP id d2e1a72fcca58-881e6268a39mr4105134b3a.49.1790603112033;
        Mon, 28 Sep 2026 06:45:12 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-882ad656fdcsm1865269b3a.18.2026.09.28.06.45.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:45:11 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd025d07so2525639c88.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:45:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTcIVkdT1U9wug3JNW0c1B/WgxJEGDDEt1mSuGnS3U2hMkfB7Vn+RWFXeYE+3espJCi7qQWhuxfb3ovTg=@vger.kernel.org
X-Received: by 2002:a05:701b:4254:20b0:143:4d12:396d with SMTP id
 a92af1059eb24-146cfec876fmr10133650c88.26.1790603108313; Mon, 28 Sep 2026
 06:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
 <20260911-uvc-version-v3-3-604328d8a0dd@chromium.org> <20260928125242.GE4406@killaraus.ideasonboard.com>
 <CANiDSCtb9-LVTuhwdLYdTzNMbrq_TYCjKYOxc5TxhCqaWg2NCQ@mail.gmail.com>
In-Reply-To: <CANiDSCtb9-LVTuhwdLYdTzNMbrq_TYCjKYOxc5TxhCqaWg2NCQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 15:44:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCvqPWG+xx4xid69shz1BD45jNXaNx1TRZ1nSrJe4Y-7-w@mail.gmail.com>
X-Gm-Features: AclHuK_ZBAtgklAkGESpVb4q0Te85HQvVvf98PI9V3oZLultwc6KZYvUUDkHYag
Message-ID: <CANiDSCvqPWG+xx4xid69shz1BD45jNXaNx1TRZ1nSrJe4Y-7-w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: uvcvideo: Automatically handle cameras with
 invalid uvc_version
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 15:22, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> On Mon, 28 Sept 2026 at 14:52, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Fri, Sep 11, 2026 at 01:22:27PM +0000, Ricardo Ribalda wrote:
> > > Currently, the driver expects that cameras properly implement the spec
> > > version that they announce, and if they fail to do so, we do not continue
> > > probing the driver.
> > >
> > > To make drivers more fun, some vendors decided to announce that they are
> > > a UVC version that they are not. Until now, we handled those cameras via
> > > quirks.
> > >
> > > Unfortunately, reality has shown us that there are more cameras out
> > > there with an invalid uvc_version than we initially predicted.
> >
> > As far as I understand, this was triggered by the Avermedia GC515. Have
> > you received other reports ?
>
> I have not, but we can agree that not that many people does the extra
> mile to report to this mailing list.
>
> If multiple cameras, from different ISPs have this issue it makes me
> think that Windows is handling this uvc_version more naively than us,
> and unfortunately it is what most vendors use to validate their
> cameras.
>
> I'd rather support more cameras than fewer.
>
> >
> > > This patch tries to handle these cameras with an identity crisis
> > > automatically. We still shame them in dmesg. But now they will work.
> >
> > If the vendors ignored the fact that those cameras didn't work at all on
> > Linux, do you think they will read dmesg ?
>
> They wont, but distros might look into logs and keep track of warnings/logs.
>
> >
> > Jokes aside, UVC version override was added in November 2020, and the
> > Avermedia GC515 is the fourth device we list in nearly 6 years. Let's
> > see if there are any drawbacks in the implementation below that can be
> > justified by such a small number of devices.
> >
> > > Tested-by: Edwin Gatier <edwin.gatier@protonmail.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++----
> > >  drivers/media/usb/uvc/uvc_video.c  | 40 +++++++++++++++++++++++++-------------
> > >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> > >  3 files changed, 35 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index e289cc71ba98..ca75f8d1ec46 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1169,9 +1169,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >
> > >       case UVC_VC_PROCESSING_UNIT:
> > >               n = buflen >= 8 ? buffer[7] : 0;
> > > -             p = dev->uvc_version >= 0x0110 ? 10 : 9;
> > > -
> > > -             if (buflen < p + n) {
> > > +             if (buflen < 9 + n) {
> > >                       uvc_dbg(dev, DESCR,
> > >                               "device %d videocontrol interface %d PROCESSING_UNIT error\n",
> > >                               udev->devnum, alts->desc.bInterfaceNumber);
> > > @@ -1188,7 +1186,12 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
> > >               unit->processing.bControlSize = buffer[7];
> > >               unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
> > >               memcpy(unit->processing.bmControls, &buffer[8], n);
> > > -             if (dev->uvc_version >= 0x0110)
> > > +
> > > +             /*
> > > +              * We are not using bmVideoStandards, so there is no need to
> > > +              * warn the user if it is missing.
> >
> > There's value in warning the user about UVC non-compliance though. I'd
> > like to see a warning that indicates the device reports an incorrect UVC
> > version.
> >
> > If I'm not mistaken, the Avermedia GC515 includes the bmVideoStandards
> > field. This change is therefore not needed for any devices we know
> > about, right ?
>
> We do not know if it includes the bmVideoStandards or not. Wihout
> https://lore.kernel.org/linux-media/20260928124109.GF157191@killaraus.ideasonboard.com/T/#t
> it might leaking the next control. (this is how I started working on
> the other patch).
>
> Luckily for us bmVideoStandards is not used.
>
> >
> > > +              */
> > > +             if (dev->uvc_version >= 0x0110 && buflen >= (n + 10))
> > >                       unit->processing.bmVideoStandards = buffer[9+n];
> > >
> > >               uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index 2a3b7431cc68..2f3daa920ffa 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -273,6 +273,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
> > >       }
> > >  }
> > >
> > > +#define UVC_VIDEO_CTRL_MIN_SIZE 26
> > > +
> > >  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > >  {
> > >       /*
> > > @@ -280,7 +282,7 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > >        * on the protocol version.
> > >        */
> > >       if (stream->dev->uvc_version < 0x0110)
> > > -             return 26;
> > > +             return UVC_VIDEO_CTRL_MIN_SIZE;
> > >       else if (stream->dev->uvc_version < 0x0150)
> > >               return 34;
> > >       else
> > > @@ -290,7 +292,6 @@ static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> > >  static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > >       struct uvc_streaming_control *ctrl, int probe, u8 query)
> > >  {
> > > -     u16 size = uvc_video_ctrl_size(stream);
> > >       u8 *data;
> > >       int ret;
> > >
> > > @@ -298,13 +299,13 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > >                       query == UVC_GET_DEF)
> > >               return -EIO;
> > >
> > > -     data = kmalloc(size, GFP_KERNEL);
> > > +     data = kmalloc(stream->ctrl_size, GFP_KERNEL);
> > >       if (data == NULL)
> > >               return -ENOMEM;
> > >
> > >       ret = __uvc_query_ctrl(stream->dev, query, 0, stream->intfnum,
> > >               probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> > > -             size, uvc_timeout_param);
> > > +             stream->ctrl_size, uvc_timeout_param);
> > >
> > >       if ((query == UVC_GET_MIN || query == UVC_GET_MAX) && ret == 2) {
> > >               /*
> > > @@ -319,7 +320,8 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > >               ctrl->wCompQuality = le16_to_cpup((__le16 *)data);
> > >               ret = 0;
> > >               goto out;
> > > -     } else if (query == UVC_GET_DEF && probe == 1 && ret != size) {
> > > +     } else if (query == UVC_GET_DEF && probe == 1 &&
> > > +                ret < UVC_VIDEO_CTRL_MIN_SIZE) {
> > >               /*
> > >                * Many cameras don't support the GET_DEF request on their
> > >                * video probe control. Warn once and return, the caller will
> > > @@ -330,15 +332,24 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > >                       "Enabling workaround.\n");
> > >               ret = -EIO;
> > >               goto out;
> > > -     } else if (ret != size) {
> > > +     } else if (ret < UVC_VIDEO_CTRL_MIN_SIZE) {
> > >               dev_err(&stream->intf->dev,
> > >                       "Failed to query (%s) UVC %s control : %d (exp. %u).\n",
> > >                       uvc_query_name(query), probe ? "probe" : "commit",
> > > -                     ret, size);
> > > +                     ret, stream->ctrl_size);
> > >               ret = (ret == -EPROTO) ? -EPROTO : -EIO;
> > >               goto out;
> > >       }
> > >
> > > +     if (ret != stream->ctrl_size) {
> > > +             uvc_warn_once(stream->dev, UVC_WARN_CTRL_SIZE,
> > > +                           "UVC non compliance: Query (%s) UVC %s control had a size of %d instead of %u.\n",
> > > +                           uvc_query_name(query),
> > > +                           probe ? "probe" : "commit", ret,
> > > +                           stream->ctrl_size);
> > > +             stream->ctrl_size = ret;
> > > +     }
> >
> > There are two other locations where uvc_version is used:
> >
> > - In uvc_fixup_video_ctrl() to implement a workaround for pre-1.10
> >   devices that don't report dwMaxVideoFrameSize
> >
> > - In uvc_ctrl_filter_plf_mapping() to stkip the power line frequency
> >   control on pre-1.50 devices
> >
> > None of those are handled in this patch. Furthermore, more usage of
> > uvc_version may be needed in the future. This patch seems a bit fragile
> > to me in that regard. Could we instead detect the version and update the
> > uvc_version field ?
>
> Will send a follow-up to fix dwMaxVideoFrameSize.

Would this work?

        if (!(format->flags & UVC_FMT_FLAG_COMPRESSED) ||
-            (ctrl->dwMaxVideoFrameSize == 0 &&
-             stream->dev->uvc_version < 0x0110))
-               ctrl->dwMaxVideoFrameSize =
-                       frame->dwMaxVideoFrameBufferSize;
+            (ctrl->dwMaxVideoFrameSize == 0)) {
+               ctrl->dwMaxVideoFrameSize = frame->dwMaxVideoFrameBufferSize;
+               if (stream->dev->uvc_version >= 0x0110)
+                       uvc_warn_once(stream->dev, UVC_WARN_CTRL_SIZE,
+                             "UVC non compliance: Missing
dwMaxVideoFrameBufferSize from video_ctrl_size\n");
+       }


>
> uvc_ctrl_filter_plf_mapping properly handes devices with invalid
> uvc_version. It automatically probes the control.
>
> I though about parsing the uvc_version, but then I realised that some
> devices might implement video_ctrl_size correctly but not filter_plf
> (or the other way around).
> So I decided that this was better.
>
> >
> > Another option, given the small number of affected devices, is to just
> > merge 5/5 (as well as 1/5 and 2/5 that are nice small improvements).
>
> I'd argue that 4/5 is also a nice to have.
>
> >
> > > +
> > >       ctrl->bmHint = le16_to_cpup((__le16 *)&data[0]);
> > >       ctrl->bFormatIndex = data[2];
> > >       ctrl->bFrameIndex = data[3];
> > > @@ -351,7 +362,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > >       ctrl->dwMaxVideoFrameSize = get_unaligned_le32(&data[18]);
> > >       ctrl->dwMaxPayloadTransferSize = get_unaligned_le32(&data[22]);
> > >
> > > -     if (size >= 34) {
> > > +     if (ret >= 34) {
> > >               ctrl->dwClockFrequency = get_unaligned_le32(&data[26]);
> > >               ctrl->bmFramingInfo = data[30];
> > >               ctrl->bPreferedVersion = data[31];
> > > @@ -381,11 +392,10 @@ static int uvc_get_video_ctrl(struct uvc_streaming *stream,
> > >  static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> > >       struct uvc_streaming_control *ctrl, int probe)
> > >  {
> > > -     u16 size = uvc_video_ctrl_size(stream);
> > >       u8 *data;
> > >       int ret;
> > >
> > > -     data = kzalloc(size, GFP_KERNEL);
> > > +     data = kzalloc(stream->ctrl_size, GFP_KERNEL);
> > >       if (data == NULL)
> > >               return -ENOMEM;
> > >
> > > @@ -401,7 +411,7 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> > >       put_unaligned_le32(ctrl->dwMaxVideoFrameSize, &data[18]);
> > >       put_unaligned_le32(ctrl->dwMaxPayloadTransferSize, &data[22]);
> > >
> > > -     if (size >= 34) {
> > > +     if (stream->ctrl_size >= 34) {
> > >               put_unaligned_le32(ctrl->dwClockFrequency, &data[26]);
> > >               data[30] = ctrl->bmFramingInfo;
> > >               data[31] = ctrl->bPreferedVersion;
> > > @@ -411,11 +421,11 @@ static int uvc_set_video_ctrl(struct uvc_streaming *stream,
> > >
> > >       ret = __uvc_query_ctrl(stream->dev, UVC_SET_CUR, 0, stream->intfnum,
> > >               probe ? UVC_VS_PROBE_CONTROL : UVC_VS_COMMIT_CONTROL, data,
> > > -             size, uvc_timeout_param);
> > > -     if (ret != size) {
> > > +             stream->ctrl_size, uvc_timeout_param);
> > > +     if (ret != stream->ctrl_size) {
> > >               dev_err(&stream->intf->dev,
> > >                       "Failed to set UVC %s control : %d (exp. %u).\n",
> > > -                     probe ? "probe" : "commit", ret, size);
> > > +                     probe ? "probe" : "commit", ret, stream->ctrl_size);
> > >               ret = -EIO;
> > >       }
> > >
> > > @@ -2231,6 +2241,8 @@ int uvc_video_init(struct uvc_streaming *stream)
> > >
> > >       atomic_set(&stream->active, 0);
> > >
> > > +     stream->ctrl_size = uvc_video_ctrl_size(stream);
> > > +
> > >       /*
> > >        * Alternate setting 0 should be the default, yet the XBox Live Vision
> > >        * Cam (and possibly other devices) crash or otherwise misbehave if
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index abcafd929c9e..8d99e857a69f 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -461,6 +461,7 @@ struct uvc_streaming {
> > >       struct usb_interface *intf;
> > >       int intfnum;
> > >       u32 maxpsize;
> > > +     unsigned int ctrl_size;
> >
> > That should be called video_ctrl_size, ctrl_size is ambiguous.
> Ack
> >
> > >
> > >       struct uvc_streaming_header header;
> > >       enum v4l2_buf_type type;
> > > @@ -662,6 +663,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
> > >  #define UVC_WARN_PROBE_DEF   1
> > >  #define UVC_WARN_XU_GET_RES  2
> > >  #define UVC_WARN_QUERY_CTRL  3
> > > +#define UVC_WARN_CTRL_SIZE   4
> > >
> > >  extern unsigned int uvc_clock_param;
> > >  extern unsigned int uvc_no_drop_param;
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
