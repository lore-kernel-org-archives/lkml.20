Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977F3DE45A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169350; cv=none; b=rEO8btOIJ7PTwvshSF4sOkFOO7aGgwpXR9ysOsY9AgSsc6VIYXr2oikWE1AhgCo3BrYT8vmckFA1VMLFgY+ZZvX2gCSH+w6h4kRJviNA/E1TGQ4Bvz3fE4LReyIY3IYMLfF4bHDD/1wwUfMocZde9DNeecMmKw01yPDNKArXIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169350; c=relaxed/simple;
	bh=U5LnSUi2wHrcwYVfC75cSRN0FRvvdDzaxePvnYHJ/p4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFOvNJo0mpP2Fqm1LwQPoHKH+1jtTn5hrLB7Xvx1wP9Z183ZKiRub1AtHSXK3W69/SIt4iw074LPtj8rr5+OH5r4Ny3QIyV/6C5zLdKxBMqJKI45TXbv7cB842DILKSJOHuC7d2HhhrFdvKrgIubVYZYQXvhR7zrCMLV3fY177Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YrrByIGN; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YrrByIGN"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso2815548a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788169349; x=1788774149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Z2gWPFgv4n4jgrujxRMEWPQXnpDvopS8YwK5e2Ug0I=;
        b=YrrByIGNeKxWaFsaHAiznkSgVVxYJbtw2wATrVtekmsKYB5W8PYSO3V0qJpKOlYCru
         yGZdg9o60rZfSOjwDRlIKQ/eMxHHYFagahC7CCARYpW+vNVn/tTANUqayyYV319f4aTx
         I+gWwqevfwR4aS04grlgqBoXXygBVCehm6I9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169349; x=1788774149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Z2gWPFgv4n4jgrujxRMEWPQXnpDvopS8YwK5e2Ug0I=;
        b=AeWPlAdzdTEZYFETV28c+2669JoBszG0aDVH9c55S4RZqjqmOHwPCLFUueGDToDxpY
         /C3e1XwpioLoKvr41ToJsLelBL33OI9jHzrhOYBdnNrywvBYiM2o3mDlZuIcWRDHU9dx
         3eJBYg1MVZYfmAlKKf6oDPYcSjckZbmDZWt6xr2f9zaG8RUj5mZlsLLPlj1EMldnD18L
         fK1ToUspboHVBt4H2wS+x8ue2KAgdLGrjwPorqE5ceec3UpkL+5oQk/GNI3lsABtEw8q
         4+K0d7ep68e5/1gSu++RtGnXYtzkyxsIEE2TaAuSkOJob/aria0EVfwZPcmYV/Snubzn
         yK+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxyJKe760YHcGPu0xFfF5LZy8YOP8IAfB45XxaA3MnDnMaRxsOZK9BPcGuOK+6zvxetD92xnphWA5CcNIk=@vger.kernel.org
X-Gm-Message-State: AFuF++mbFzJJNLKRWOmoPZTNRNNY2bvqo7e/X6aottsuA/G6oGaI8PA1
	+Uazu+BB0Za0Yp2nrlF14PXdWhjZPjzflRw8f3VMOUcezcn0rsmNIhAPzM2zs44p192zXb4PoY1
	qrlgm+fvK
X-Gm-Gg: AYBFou3pRPRAR3r1EupNA1f7X2wcreTH88QFqMsDdcGGQKwXp1B5DfpNcCtoS02ifcy
	j7aCDul8mewjaqzmZhlD/nwYMH2iQZ9DEiT4+7Q9moyVNRxSxHCilcl0/X69JfnN+MHVQEf/itq
	Cooo9c/zPJOZM/pE+4oxfnUN6Hkd50ll1aQxbLe/gwUeRoBLszH0jtMrMauLSSvwypBWDqgWkHS
	D31qez8kTkxRB8ZX4Z1ulFJsqMsw7srl8hdWuiSDuWrJo91kIbpb14I0Hmbq/jmRYdkEWdmr8tE
	GUrpYl7YJCF2YgFRFsQ+6xBQweShztcgaCvwL/HUlsPPDYvbAc3VY+i0fmCrbRbuFuaoGa7GbKK
	mJvk8t+2FaqtkHAqp2xb1weKcSFmnAvVhMoNUkFKdwHP8qF+rQVoBERfvKp59vdSDmaiS5m5Xik
	SuFgngIaZobAkvn9OQP81EX32c9gBlBG6NKebftNPv6J9hVpq+7FgcF7nDVmdwYhzotYeglMDdV
	C+ZrnzcQMJ+LoGMp/1G7XuEDQ==
X-Received: by 2002:a17:90b:3c45:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-398c292b6b2mr17097475a91.10.1788169348508;
        Mon, 31 Aug 2026 02:42:28 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d776d0dcsm5301363a91.4.2026.08.31.02.42.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:42:28 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2678224a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:42:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByx6H2Q2aKpv56StcfcMWaUobl9XbuiHg0YNPa22uxHPEtXA1RoprKep4rpDk++k/QayxZbIPcnJYwVtGg=@vger.kernel.org
X-Received: by 2002:a17:90b:4acf:b0:398:b17b:3bd2 with SMTP id
 98e67ed59e1d1-398b17b3dd4mr18739337a91.4.1788169346536; Mon, 31 Aug 2026
 02:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828152557.653475-1-jordan.mymail@gmail.com>
 <20260828152557.653475-4-jordan.mymail@gmail.com> <CANiDSCsL0kffzysq-9ttk_po6T1uYA5+JwDriMbdD62K1zZQLw@mail.gmail.com>
In-Reply-To: <CANiDSCsL0kffzysq-9ttk_po6T1uYA5+JwDriMbdD62K1zZQLw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:42:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCufacRzHcKaotop47qz+0rFXixLM3u5pgNzfWJDzR86BQ@mail.gmail.com>
X-Gm-Features: AcwNN1Vd-cihvDm2lWbx8kHE9zY6JVweyDZTTIEunkYzDBe1rdUhZu2BUfCihls
Message-ID: <CANiDSCufacRzHcKaotop47qz+0rFXixLM3u5pgNzfWJDzR86BQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on OBSBOT
 Tiny 2 pan/tilt
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi again.

Sashiko [1] has pointed out that there might be other controls that
will benefit from the UVC_CTRL_FLAG_AUTO_UPDATE.

Can you double check if that is the case? Feel free to add is a v2 or
as a follow-up patch.

Thanks!

[1] https://sashiko.dev/#/patchset/20260828152557.653475-1-jordan.mymail%40gmail.com

On Mon, 31 Aug 2026 at 11:40, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Michael
>
> Thanks for the patch, and for contacting the vendor.
> Could you reply to this patch with the full output of lsusb -v instead
> of a cropped one?
>
> We keep that info for future reference.
>
> Thanks!
>
> On Fri, 28 Aug 2026 at 17:26, Michael Jordan <jordan.mymail@gmail.com> wrote:
> >
> > The OBSBOT Tiny 2 (3564:fef8) answers GET_INFO for CT_PANTILT_ABSOLUTE
> > (entity 1, selector 0x0d) with 0x03 -- GET and SET capable, but with the
> > AUTOUPDATE bit clear. It returns the same 0x03 for every Camera Terminal
> > control queried, so the firmware is not computing the byte per control.
> > uvc_ctrl_get_flags() takes the flags from that byte, so it clears the
> > UVC_CTRL_FLAG_AUTO_UPDATE that the static uvc_ctrls[] entry sets for
> > this control. Without AUTO_UPDATE nothing clears ctrl->loaded after the
> > first read, so uvcvideo serves the control from its cache indefinitely:
> > VIDIOC_G_CTRL returns the last value the host commanded, never the
> > actuator's live position. On a motorised PTZ camera the position keeps
> > changing during a move, and changes on its own under the camera's
> > autonomous subject tracking, so userspace cannot observe it at all.
> >
> > Add a flags fixup entry restoring AUTO_UPDATE, alongside the flags the
> > control already has, for this camera's pan/tilt control. With
> > AUTO_UPDATE restored, the rollback at the end of every
> > VIDIOC_G_EXT_CTRLS runs uvc_ctrl_commit_entity(), which clears
> > ctrl->loaded, so the next read re-queries the device and reports the
> > live position. The fixup replaces info->flags wholesale rather than
> > OR-ing, so the entry spells out the full flag set for the control.
> >
> > Tested on an OBSBOT Tiny 2: without this, a read taken while the gimbal
> > is moving (or after the gimbal is moved by hand) returns a stale value;
> > with it, VIDIOC_G_EXT_CTRLS tracks the physical position on both axes.
> >
> > The vendor has been asked to fix the firmware (support ticket #8220,
> > 2026-08-04); no fix is available at the time of writing.
> >
> > lsusb -v (device descriptor and the Camera Terminal):
> >
> >   Bus 003 Device 006: ID 3564:fef8 Remo Tech Co., Ltd. OBSBOT Tiny 2
> >   Device Descriptor:
> >     bLength                18
> >     bDescriptorType         1
> >     bcdUSB               2.10
> >     bDeviceClass          239 Miscellaneous Device
> >     bDeviceSubClass         2 [unknown]
> >     bDeviceProtocol         1 Interface Association
> >     bMaxPacketSize0        64
> >     idVendor           0x3564 Remo Tech Co., Ltd.
> >     idProduct          0xfef8 OBSBOT Tiny 2
> >     bcdDevice            4.09
> >     iManufacturer           1 Remo Tech Co., Ltd.
> >     iProduct                2 OBSBOT Tiny 2
> >     iSerial                 0
> >     bNumConfigurations      1
> >   [...]
> >         VideoControl Interface Descriptor:
> >           bLength                18
> >           bDescriptorType        36
> >           bDescriptorSubtype      2 (INPUT_TERMINAL)
> >           bTerminalID             1
> >           wTerminalType      0x0201 Camera Sensor
> >           bAssocTerminal          0
> >           iTerminal               0
> >           wObjectiveFocalLengthMin      0
> >           wObjectiveFocalLengthMax      0
> >           wOcularFocalLength            0
> >           bControlSize                  3
> >           bmControls           0x00023e3e
> >             Auto-Exposure Mode
> >             Auto-Exposure Priority
> >             Exposure Time (Absolute)
> >             Exposure Time (Relative)
> >             Focus (Absolute)
> >             Zoom (Absolute)
> >             Zoom (Relative)
> >             PanTilt (Absolute)
> >             PanTilt (Relative)
> >             Roll (Absolute)
> >             Focus, Auto
> >
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index b16a5cc0d..379ee51bd 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2876,6 +2876,15 @@ static void uvc_ctrl_fixup_flags(struct uvc_device *dev,
> >                         UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX |
> >                         UVC_CTRL_FLAG_GET_DEF | UVC_CTRL_FLAG_SET_CUR |
> >                         UVC_CTRL_FLAG_AUTO_UPDATE },
> > +               /*
> > +                * OBSBOT Tiny 2: GET_INFO on CT_PANTILT_ABSOLUTE_CONTROL is a
> > +                * stub that reports GET|SET only, clearing the AUTO_UPDATE the
> > +                * driver's own control table sets for this control.
> > +                */
> > +               { { USB_DEVICE(0x3564, 0xfef8) }, 1,
> > +                       UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> > +                       UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_RANGE |
> > +                       UVC_CTRL_FLAG_RESTORE | UVC_CTRL_FLAG_AUTO_UPDATE },
> >         };
> >
> >         unsigned int i;
> > --
> > 2.43.0
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
