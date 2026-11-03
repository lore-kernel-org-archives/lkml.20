Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793668702;
	b=acMXSJjLeE0QdD3xNdsJPyJC2IY2n5BJVO6W8rb6s32Ny4kIlsrp+zCF52S16X2ubaHq
	 lqZ1IXgHNIwl5qy64CC+2pmvMM7/E4siGrtj+TS1gKhE73PkGBOwSALzu0y6UXprHyEy1
	 VZKwNjvMyDPcW5KV6QlQBRgsLRWpaL2f03bitJSeLQZGXdLXbbWEsRIcmueAOCQO9kfcj
	 Uiw5sUi9sAOyE09hsBBINVjVk8OaZDCa/p5WdyS0ei992+f1rhzjy8qurkypL/F2XTjNF
	 OoS908dbg4vsLJQFi7NpnaT+dd0/39tY4Znj1Ejaab03i1bhXbVlFvVHNfcsW6SqwmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KTYlUBf0wD5xIYqHc70GJMPslPEvwEHVySo2mabcF+A=;
	b=yt/dobprcLwtvshreXHGx3EdYE6AUyYfhQP9emCKZqmwe6nR5bNm9xMCxjA5rvcKAfCR
	 jiokyePLFa/jmV0O0hJmzoU1v8D2R5Vws6qAR3iClBTHN0K/EoDc1w9DCtEUP6lFokXxM
	 c82/qpUIxGrxio+WJ+qSgoXh/vwwlPLKAp9/gB1tmZs39ooiOOBQ5fa3pLz+jwYHZX62B
	 gm4nTtkFAV8Brpqa/is2/57oX2d6RU+Uhv4chq5RHqjlEnLVQsy9KJteQB935H/K3IoNW
	 Xje4H9cuq0OEnwEbYtE5nX8yM9/MMUmJihrmlCW30ZaveH/bao8wEFB7/Be9tIV5VlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1WfL4yt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D525606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D525606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I1WfL4yt
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-70bf1671c21so2118730eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793668701; cv=none;
        d=google.com; s=arc-20260327;
        b=SHsd+ZjZXUcR/YoRAVNDulvYgbOcaszz3fA9AWZDxCOy838hg8K8auKe1xo6hWv69V
         NLftrmdP13zwp9XW1dI7IJFdFUq+eFPnL5LEjsAgC6AWA03ZuUpvkT/yYigu34aM7KSW
         o6ObF0yGGknko7uVsb/fLXHC3w9/7sKVMWO154PiBJeZUdwMMH/rOGERoxsIS7aNkm5Y
         i80Wbra6FMQQ0nbOfuvMFhheyzDYvEcaRPW59CVH4TpEsuUftrH+lc/6DWOcBk3F3cKf
         DWLxOYuC3X55D8m0AkI3//XAIUrhwvn44ddzS0tSy78ojulsEZmQKereLRcXAKjnPPcN
         Stcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTYlUBf0wD5xIYqHc70GJMPslPEvwEHVySo2mabcF+A=;
        fh=FhgJ89aURNLy6JDQ8dQtDhsQlWZQB3RiAU/9x1kKKdc=;
        b=YWVMiXz35LPbyMGjmXpaopGtCPubYO1MFcZ9LWARUP+JgeK8qhZyWz5ljuduQpVsqj
         YUNWMnvaink6fQIl4pJXS8sG3iIuWwtUeT4ws4T10ZDfnNoOBxP8Fl3rBJqS3HqB4A35
         SwH2G1o7g0TWUMxu2nUoQfvfhKEZuMF9RCvllGc8OP9IFq1h1r/dQ7ihmfZZcqrbKDpD
         ETIrImFkgxRVkNUnuh+RhZC+ZdfKuJBilQvVPZP0sRl/EBPy22rg0AqCEwv68B8Ey7BA
         0FH21tBXk0O2wWbycRHV7mi0y0la9ljKRKaQUSQQve3ojJVzsvoPdUauS1eNoUI/NF0I
         LxQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668701; x=1794273501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KTYlUBf0wD5xIYqHc70GJMPslPEvwEHVySo2mabcF+A=;
        b=I1WfL4ytP5PwbzDUaDvhqTkiaecS8GMOSCsuVNPCh06MuqdZ+b7BOGUKAZbfKz1lSU
         wqX8fJ48xHBAONej7ozo6kBZKTLlNrLr8aas5cjA8BudBs5GMxHsnDcRjRDyApYpAEjo
         n+o240w44flUBkfZ+ktLhThtKC1PJxjZ9ySj06qfR+VkBHmQ11X4nbklIS+69YVc2DML
         F+xSOg3IaLSr7VIEkciA9A9XC+/K/cGYLw+rQneE4NkgEBHAmm61spfbMgtCWqR9NJap
         NhSL44sl06D0HZG7cey1m6RmDT7N+aD+hu1jFVMrWq1O3szS5l8jl460/RaWEW2p16dI
         HpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668701; x=1794273501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTYlUBf0wD5xIYqHc70GJMPslPEvwEHVySo2mabcF+A=;
        b=evcYdNMraXp1jrFLikFclm7m7c8sXrnrgOphmSxnkr3X6LPcDCzOc7vJlpHBlXWGLk
         xcoVuLpn6oC3DwhtGpE6F9FIw6vCfV47rMwSXyJxZy6uJ0t0y0n2UOa1WpNRjZvK336G
         bfiOWuAa48D82VQn8ZAk2/eP6w7bhmmJJLQWEhwdHCQqgnyulWYGHjeTj5NhCIdZeIJE
         RFFasoDR+X36iFdK0oRbtordLDKgt0vRm24olY7hM2HQm4wfyLeypYuwaEDeSjoKcCPL
         QZZAKfTSTizkgUhneXVf8bD7rOqtJNMhxn2B72OGcSxCZNtQ71l4qbWSpK1+e6suDmfJ
         c5JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrc8syrKPxvyvBkVZd7MiI3nCeqeC0vecKlOww/JjHJIYv1fJ6DrF+KoKQOqKXU/jb8Ra33ZV+ZDXuppY=@vger.kernel.org
X-Gm-Message-State: AFq9FYImYmKbgOpAAm03f4fFug5RUS2dGqlKvS9WlZTLTcLyS56oxhJY
	3aup6fsHridTF7/IY3EQESlSh8qbhCOmwKUpcj+pDrKQp7Hu37y2WYQoZYPjLu6uX+toC177jsE
	2fuOUk3P1tyKK2iaB9OPYe3y1+8E8M24=
X-Gm-Gg: AYBFou1lc5/GWGOQZB0VniYbHy/yn0KHOHkpZKDQcYCRpy2vnQmYuUo0ySM/j9fx0vX
	aQvEr5/DNYhsRSGBIfw7VRC0K14QABlm5r8Dn+3jpb2OPpIWMBjUk9ZG0Klit0MsUw3vN3lPgiV
	growgEFuJGB7CAsJ1YYeaGAq+Vy24kNiGPqXhAn+5Nm813ONM3gf4aMQqHOLn/Hpuf1oFpCCe/d
	QqiTK5ln294cJx8IAdr935mw36e0XC+Vw71SNuH91bj/IcD1nZWxNmg/jEuJX1DI/g4GOrSGpK/
	nIWis8y5undUzREN9TOfem5vHjibPACepDqQoImDKIYFh7lQ6c6Fc0TYedrj8dRLJFwUBkYbnUx
	0/acrF2r4mVLKqtCxuJmMjKsC/Zad42CugFj5a+Y=
X-Received: by 2002:a05:6820:168e:b0:713:e3f5:251e with SMTP id
 006d021491bc7-714f29ba27emr6218018eaf.48.1793668700964; Mon, 02 Nov 2026
 17:18:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029033106.7374-1-ki.chiang65@gmail.com> <7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
In-Reply-To: <7c254ab7-579e-4c17-80fb-596e6fdd29a9@kernel.org>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Tue, 3 Nov 2026 09:18:13 +0800
X-Gm-Features: AclHuK-xERevdyIuOmPpPuK18g64qqPWLytPJ62nx5z0uR0oy9As2XqZ8575ib0
Message-ID: <CAHN5xi1_T=C1v=hDqoHxLtc9uuZO5Evsv2hS2-ZSGd3_mo=qSA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK camera
To: Hans de Goede <hansg@kernel.org>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

Hans de Goede <hansg@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8829=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 29-Oct-26 4:31 AM, Kuangyi Chiang wrote:
> > UVC control requests issued when preparing a video stream sometimes
> > time out on the HIK 1080P Camera (2bdf:0280):
> >
> > [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0=
280)
> > [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 2=
6).
> > [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110=
 (exp. 26).
> > [   58.592967] uvcvideo: Failed to initialize the device (-5).
> >
> > Adding a 1ms delay after each control message avoids the issue.
> >
> > Introduce UVC_QUIRK_CTL_MSG_DELAY_1M for this device.
> >
> > Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
>
> Is this a USB-2.0 camera connected to a XHCI controller ?
>
> And if yes, how old is this camera model ?

Yes, it's a USB 2.0 high-speed camera connected to an xHCI
controller.

It's an entry-level 1080p USB webcam from Hikvision that has
been available for several years.

The enumeration log is shown below:

[  421.245199] usb 5-3: new high-speed USB device number 2 using xhci_hcd
[  421.368603] usb 5-3: New USB device found, idVendor=3D2bdf,
idProduct=3D0280, bcdDevice=3D13.00
[  421.372056] usb 5-3: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  421.372064] usb 5-3: Product: HIK 1080P Camera
[  421.372069] usb 5-3: Manufacturer: 04004000_P040200_SN0002
[  421.372072] usb 5-3: SerialNumber: 04004000_P040200_SN0002

So far, we have reproduced the issue with these xHCI hosts:

ASMedia ASM1142 (1b21:1242)
Etron EJ168 (1b6f:7023)
Etron EJ188 (1b6f:7052)
Intel xHCI (8086:8d31)

>
> The reason why I'm asking this is because the EHCI USB-2.0 controller
> interface causes a natural delay between consecutive ctrl commands queued
> one by one till the start of the next USB frrame, so they get spaced
> 1 ms apart.
>
> Where as the modern XHCI controller interface will put these back-to-back
> on the USB bus. We've seen some issues with (older) USB devices before wh=
ere
> they needed some delay because they were originally only validated with
> EHCI controllers and the hw/ff assumes it will get some "breathing space"
> between control messages.

Thanks for the explanation. That makes sense.

The camera works with the EHCI host we tested without any
additional delay.

We haven't observed this issue during device enumeration.

In our tests, adding a 1 ms delay to both the UAC and UVC
control request paths prevented the timeouts.

When the delay was added to only one driver, we still observed
control transfer timeouts (-110) in the other driver.

We also submitted a similar patch for the USB audio driver,
using the existing QUIRK_FLAG_CTL_MSG_DELAY_1M:

https://lore.kernel.org/linux-sound/20261029032856.7100-1-ki.chiang65@gmail=
.com/T/#u

Regards,
Kuangyi

>
> Regards,
>
> Hans
>
>
>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
> >  drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++--
> >  drivers/media/usb/uvc/uvcvideo.h   |  1 +
> >  3 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index e289cc7..c720d75 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -3162,6 +3162,15 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >         .bInterfaceSubClass   =3D 1,
> >         .bInterfaceProtocol   =3D 0,
> >         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) }=
,
> > +     /* HIK 1080P Camera */
> > +     { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > +       .idVendor             =3D 0x2bdf,
> > +       .idProduct            =3D 0x0280,
> > +       .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +       .bInterfaceSubClass   =3D 1,
> > +       .bInterfaceProtocol   =3D 0,
> > +       .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_CTL_MSG_DELA=
Y_1M) },
> >       /* Insta360 Link */
> >       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/=
uvc_video.c
> > index fc3536a..4667f86 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -35,13 +35,19 @@ static int __uvc_query_ctrl(struct uvc_device *dev,=
 u8 query, u8 unit,
> >  {
> >       u8 type =3D USB_TYPE_CLASS | USB_RECIP_INTERFACE;
> >       unsigned int pipe;
> > +     int ret;
> >
> >       pipe =3D (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
> >                             : usb_sndctrlpipe(dev->udev, 0);
> >       type |=3D (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
> >
> > -     return usb_control_msg(dev->udev, pipe, query, type, cs << 8,
> > -                     unit << 8 | intfnum, data, size, timeout);
> > +     ret =3D usb_control_msg(dev->udev, pipe, query, type, cs << 8,
> > +                           unit << 8 | intfnum, data, size, timeout);
> > +
> > +     if (dev->quirks & UVC_QUIRK_CTL_MSG_DELAY_1M)
> > +             usleep_range(1000, 2000);
> > +
> > +     return ret;
> >  }
> >
> >  static const char *uvc_query_name(u8 query)
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index b6bcee4..1426d14 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -81,6 +81,7 @@
> >  #define UVC_QUIRK_INVALID_DEVICE_SOF 0x00010000
> >  #define UVC_QUIRK_MJPEG_NO_EOF               0x00020000
> >  #define UVC_QUIRK_MSXU_META          0x00040000
> > +#define UVC_QUIRK_CTL_MSG_DELAY_1M   0x00080000
> >
> >  /* Format flags */
> >  #define UVC_FMT_FLAG_COMPRESSED              0x00000001
>
