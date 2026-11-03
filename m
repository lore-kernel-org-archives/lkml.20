Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713635;
	b=cYxBcnuzYE0SOWmuyyZmZsm9xjqARni12zPMeKjUqxe80TsSm1L62zF0NeRdKON4cCtS
	 gR1pNdsI2hGI1ME/Ae7dtgQgTFQhWdVJi+hYUihA5pbS4pqBc/MKu8tfe+8uwk2iOOa/K
	 lTw6PUUKp9eju08JPM6cLAORhNzjTmjzr48OabUM8Ffew1YvJCDaIwi0T1BGnXnvZTcby
	 hATbuuqOp2htzgDE2J0V8z2i1AorZQT8491Ur9eL8lTdxNBTbwIO+SscCMQn6nWnUYT2i
	 TEdJmsaFOhyuUnOC81RDvwLtp6Ooy8O+n3E0uhXVWJAaNmijrl/a08RYekkJmpD8M3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
	b=SVtyGUq+y0LT5WXBw6rks86PIZCGO3P0S/Ouqeufp4HIP9XKwBu5Y5UlcDBUiJBiRSPq
	 bRXaF24W9PYITXfYBA821ANetvOy1rtujIAOuN/p3pbP/Tr8u+G7ZUO+O2Ehmcy20Ec28
	 /3NTx63JIeu4EF6+MNuKPtGUM7qXtgl4oUnm0AZMJO5lOdxQe61edde+qksQhhRTds2ZS
	 O9u1LkR6nCtd+SQTjw9uSJH7BmHtdTYicBH+Y1VvoeMlwwkjICNZfLt0y6PBsFWCQ5aXS
	 +mAgbQGFSrY0NGLk7MOQJ+gIEOT+/OL0LOl++rxXP9hS1NaimIICjmZn3WNIuLpidAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="MS/nCF09";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B3606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 798B3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MS/nCF09
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e946155442so37010095ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793713634; x=1794318434; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
        b=MS/nCF09Kaepy8l4amk1AQkeG3JDeFVFiR75xOhgb/2YUD0I64nG1hnAmPHtaRI9KL
         +12xegRgpBfgYCJdMNqlmMssuRfjcQSMvIfWtLsVW0pwT77LnFGz34MPXkvI7Ex/emG+
         J1Ge9yVaF6ICQLHwVOAuUiFxs/pxHXlDYaFPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713634; x=1794318434;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zueZNP1aj9vbS3XFpHdbqXKOjA2wf/HQOC7naWwefJk=;
        b=J9kRMc1Cf3YSlCZCDHdoQuoPVc1xSS1WJ9l9tWq0d0Ds2VeY8Z/4BMTBZQyAfi0J/Y
         IXozsIlIxRWoInd/Rs0cVTvDmulj79eUBCaQLzbO3oHGDuz/fLVOCsUVUSPM2YUK9Ylh
         UtgQPU6vOLKjI5cgXnlHY3hjDREQmPME1qY+UJSxeZmc2A9QaneFJThrFNsg3qqhRodg
         TJnT4D2bFOdYH+RprRVBT2iDOso4n1XHrbO8RLtWS7tKPvFYE0U/tfTvK/5lByIRucvh
         T714zAKXSY/Yu/b8BSKar7Ti2EsANT2sDpEmSDjDGatRkPxfTqq0YKS2CnpGVxMtk9Qi
         dP6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAsAdp2DEdNwHWS3lUGmHVqc3Ged5M3tOt4CC2/ZJscWO0Em7JCUM5BLOt9SF7Sy0NkXyiS6wBWRuVvr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4HYQ0LWuBDh0bNcyKaO+b3SprNKZe1Fj8lvmod4lgISWrEDJ2
	sw8Pi6YdMgHb2E6sjheNu8cJjnwLDm5pt7x2ir1WeXFuAl1Hc5aLEw8xjACWg0hcUpk9pNR4TTJ
	7O/+0wm1z
X-Gm-Gg: AYBFou3W4lb7H01BidhCD1dkWF3bs0D925FHoeWu4Ra1BkMO7IqPc6+Z9AQzXLxmPSA
	DUkX89Wg2PFrZTCccvLw3LktcR5b1NBoYaYTh8xFqfbCy+/gSo6ILATWgURqMXudY3uYJ/M/X/y
	CdXh8mx3ONbmxjRnPqROrIF7LdzGoTQDDxcGyry/6yrjD9xw7AE6QcDLgavudlUrL7vHmlvmQ+v
	GuqEi7nMIoLGmgZ1C8HUNYFUElQl3ioVttJw7bkfARvZEz12w4mpCt33B/Df/+mesrvsSyAgn4G
	S1sMLBM97fyB07z+LNbdDsecTFQXiuolJkLK6Vnv4neiEOcfGTl60ynNeQirQMN2BQpNWrxbd/t
	mioSZ/zT1no9TUdQrLTSUgDG4Q/0a8dB17uFWoOdKAFdfYuIlMYvhaRf6rYiOnNY0H7XEMsr0fi
	ipxq5ATv76JvV6JYJkZCm1yODHZ803+eb42R6CyS3r8cm7VcqweRc2Xay9nwTQTh1GQi5MBG0TP
	bcOoJZVSDHr/VdECqBk8mwOorH1/LdsMl8qY+oZ54erqvInsNMJMQZgHX2YA9xCfW1NJPA08mLg
	9dXwPq5bsTDGqJc9VFc4R+Sqoofab/igxjleqB51H17nUrQH02OyJBjE8fZPoNcv
X-Received: by 2002:a17:902:ef03:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2eb3649be94mr130087295ad.18.1793713633667;
        Tue, 03 Nov 2026 05:47:13 -0800 (PST)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928d821sm41313525ad.56.2026.11.03.05.47.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:47:13 -0800 (PST)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4105465c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzbd2xr/pmZ7sBiLsKvb0VxyB/Es8qwvSLlEDTzTMj0XVOwngRKSeWt9x/omKtPm/P8IPLjpUhlVQnLuPc=@vger.kernel.org
X-Received: by 2002:a05:7022:7f19:b0:1b2:3a68:f18f with SMTP id
 a92af1059eb24-1b23a68f64bmr6139614c88.22.1793713630988; Tue, 03 Nov 2026
 05:47:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025143522.327365-1-m@manuel-herrmann.de> <20261025200645.GB1001933@killaraus.ideasonboard.com>
In-Reply-To: <20261025200645.GB1001933@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 3 Nov 2026 14:46:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCt4-Fe0K-Z1fZpSLzP9NgPvPgrFtP8L8AydgM=BQK_WYA@mail.gmail.com>
X-Gm-Features: AclHuK8xPEPmSnJMsCIQnMZV-pQNvjoVqbPFhW04b4cRIhHNAnZsPffF_fOjdMo
Message-ID: <CANiDSCt4-Fe0K-Z1fZpSLzP9NgPvPgrFtP8L8AydgM=BQK_WYA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add support for NV21 pixel format
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Manuel Herrmann <m@manuel-herrmann.de>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel

On Sun, 25 Oct 2026 at 21:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sun, Oct 25, 2026 at 03:35:22PM +0100, Manuel Herrmann wrote:
> > Add support for the NV21 (Y/VU 4:2:0) pixel format to the uvcvideo
> > driver. This format is exposed by the color camera of the Creality Pika
> > 3D scanner (2bc5:0c0b), next to YUYV and MJPEG. Without it, the driver
>
> Could you please provide the USB descriptors for that device
> (`lsusb -v -d 2bc5:0c0b`) ?
>
> > skips the format as unknown.
> >
> > NV21 only differs from NV12 in the order of the chroma samples, so
> > bytesperline is wWidth, as for NV12.
> >
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Manuel Herrmann <m@manuel-herrmann.de>
> > ---
> > Tested on media next (d7e7bca71698) in a QEMU guest with the scanner passed
> > through. Before the patch, the driver logs
> >
> >   uvcvideo 2-1:1.3: Unknown video format 3132564e-0000-0010-8000-00aa00389b71
> >
> > and the color node only offers YUYV and MJPG. With the patch, NV21 is
> > listed, G_FMT reports a bytesperline of 1280 for 1280x960, and v4l2-ctl
> > streams it at 30 fps. A frame captured in the guest has the right
> > colors decoded as NV21, and red and blue swapped decoded as NV12.
> >
> >  drivers/media/common/uvc.c       | 4 ++++
> >  drivers/media/usb/uvc/uvc_v4l2.c | 1 +
> >  include/linux/usb/uvc.h          | 3 +++
> >  3 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> > index 0107cedd0..7d918ba0e 100644
> > --- a/drivers/media/common/uvc.c
> > +++ b/drivers/media/common/uvc.c
> > @@ -24,6 +24,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
> >               .guid           = UVC_GUID_FORMAT_NV12,
> >               .fcc            = V4L2_PIX_FMT_NV12,
> >       },
> > +     {
> > +             .guid           = UVC_GUID_FORMAT_NV21,
> > +             .fcc            = V4L2_PIX_FMT_NV21,
> > +     },
> >       {
> >               .guid           = UVC_GUID_FORMAT_MJPEG,
> >               .fcc            = V4L2_PIX_FMT_MJPEG,
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 644c2f1cd..60732f5ac 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -232,6 +232,7 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
> >  {
> >       switch (format->fcc) {
> >       case V4L2_PIX_FMT_NV12:
> > +     case V4L2_PIX_FMT_NV21:
> >       case V4L2_PIX_FMT_YVU420:
> >       case V4L2_PIX_FMT_YUV420:
> >       case V4L2_PIX_FMT_M420:
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 99b070ab8..48419a862 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -85,6 +85,9 @@
> >  #define UVC_GUID_FORMAT_NV12 \
> >       { 'N',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > +#define UVC_GUID_FORMAT_NV21 \
> > +     { 'N',  'V',  '2',  '1', 0x00, 0x00, 0x10, 0x00, \
> > +      0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >  #define UVC_GUID_FORMAT_YV12 \
> >       { 'Y',  'V',  '1',  '2', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >
> > base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
>
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
