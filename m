Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793668135;
	b=xVCRaKmnQnIP22XKPbvUxXH4f8woaWLuJ5A3pOBGWqMRZl93MWVN3gdyx4I2okc+ylap
	 KG/AOP6kLV6sfEydQPm9i4kJDHcA9i65tsSNdOL+cC+vkVn/lPasWA8p+WzWner2Fkwto
	 ZupWNfgvhdUKmhov+3/M+J4sb36ZedC+qzh1FcaOC2PJ03H/nMd8JL+JVutUYxRGb5r7m
	 3ao4ALOv8sFH2QPebSla6SdcX26fELZygACKu6b7S1YWnYT5t4TzNRT7IehJQf5boJBRd
	 oDXuyJBZTO4gVQQbIubqLRNUh28FI6oUy2tGgY2lZD+pxksDvuWeelKRxISRjZ2tAfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Us9uyqDvvriV3s06O4jeqZld0pMlKcDJ7sK+x+EI1fU=;
	b=EYzcVK29pThQ9WpZ/AF3hKvxCqILcs10J5U9by5zOk4Lz7uVPXyjetfe+KJB/INSlM7H
	 oahrEqbcMpL84MKYCZZm166Nk8HSWnGoVPdJTCC+UOJNkbKNdxbbMUpJ3XATRm7kKiZko
	 iGXI15fBDhDGWNof7KRoOqz7iCee73US1QL9nQofBN8Ikls4Uig7QoZPdbxCPKZtDYGYh
	 ZH61a4Tg1KYo25bfvOkIz/kTCOekabXy9940hFg6r10eSPCRppi2oCiVopDGoPyWOa5IU
	 sIftd8eNBqSZ3a8KOkynXluQMCZSjLbYdrW1pEhYEqXyOMWEVKh+2Jcv/ataMPaVlSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgrkeaN9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBC2606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFBC2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgrkeaN9
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71528ede7b1so834858eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793668134; cv=none;
        d=google.com; s=arc-20260327;
        b=sTVpxk9KDdRF48gVjlPugooV+f0I+ghCqK9PjRZzpTYV2Zmslaykm4gYJJAGnbdlAl
         7DxDz6qtKIYeliQ9FCjCmseJGmudNEXh7kPfAweI+T4tzTQQZbnjcUrRp7P55ec1uZdw
         6xyGDWbk87PW0A9Nlnj7L+tCCVcvrun9/jhIyeu58lmxb4ewPGQamfGb5/VJsSsrWmNE
         5+QZSVHP6Q/Ox4ozsTyd9T0xwkElXVgqHtJLpYOupC5rlsWzy5x9imEclL4iY+aeXLaA
         93C435p5QcF+1CLAI1t8X0TGmp3CmKgPBaX3v0qf+6Ujv+AQRvD4OHWbel9NQHpyOKB8
         nfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Us9uyqDvvriV3s06O4jeqZld0pMlKcDJ7sK+x+EI1fU=;
        fh=HkzzJvZTuh0J2CxS/D/wfPWq9BCD8DpAU/mHAaqusfM=;
        b=VFbFxtkcSLhN2YBsGDTvHuNorUGwFcSct2lxI2/WWts3GMVfhdjwbHwhAlKYH2y65u
         FcLwm+pPOja6lWJzmq/TTDa8DSw2439rgUK6SgPwE4r2NfQqoArcfTQYkas+eDgSQWm7
         XN+KNPdWFvOCVgaiI/bhHOm+jiSC10O0EaDzIgCh41E3NApIYtSWC5mefZ7HE7Ax9/RB
         Z7rV6Otd7Ot0c7NGUWad5rWYQ8wEHrrD96cQ16yWdt9XwHBKkpOf8HcN8KMUJO59UlFc
         YNHnG/Va4acdrzIJXHK615p/3FIedBN/0q8dQYhpDYDeYB3wanrTeWR1RUjy3syIdzSr
         vXdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793668134; x=1794272934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Us9uyqDvvriV3s06O4jeqZld0pMlKcDJ7sK+x+EI1fU=;
        b=dgrkeaN903ttE5BpyfZfJV7eZg9gliEDCuodyKrf+jXIz3kfY2bQXMbBcLK2ofGuAH
         I0OJmL2xexNiKcD1jIEWU13bTUzrjBOnAYE1iDYceobXb6bbvhujZWev1mnF9o7IZ8e8
         bKlmYAx9Hvp8C5LrI+ZTj/zfADRWXDVCJExPZn8b3kXrUpemDvjRqGRbZxOxZYcDgE43
         ViR1wcGVcwb57ipIFN4x5Tn/CRIX/63GsLJ3xKeISxnvmWLaZPTM9khHm2eaLN8gd9a/
         lpG1mqDa73+ibRN5CnUkDiBEsekXR7L2Xy4Nuh863n/2ZKMCDZCVc96TGnGxbrTS7ib0
         nLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668134; x=1794272934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Us9uyqDvvriV3s06O4jeqZld0pMlKcDJ7sK+x+EI1fU=;
        b=DqiLY7WA5xMsn61YTsJFaEnC+woa1hjzeuP9jPxGM9AHcdcNTlK8xIPt2pD9ww+tok
         PmIg/EjchzLGMt+W+xaSCa9U93/mrC0EyvbM9lvLOdcaN9K/KN3ExnAb67fpfHoGGlLp
         x+luI/gmNcdaqj4zpiE7l8EYD7GJ9k1nDszN1y6D/seKqJ2gORp8SUnA2aY1X2dVq35r
         9ccJn55MhXaxpUWKkdjJOmZG6vbYMpsDILSKhsyIpjbhrTtgnKbBYyI4Fc4DSzMIlnmm
         WBnElYk0deOoqSqwU0E+1JUwKQU3Ma5wb1ij8XDXbWYsJTAitjMWXUnwDg1VIzfAnwQD
         rYdg==
X-Forwarded-Encrypted: i=1; AKwUvBwDM+K2QMttzAX/RZXf2rc/+KaYGoXY5ZynsHU2TeG0SdVi1Djlr39PR+FT3s6D8vIlj52qca0Z6OFUTHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzkqS+NjuJ8I0cnTh28hkqPp9CZW4SX33128CjJL5AYobmjt3+
	qdsiz4FInFO0piMh7fyrEEyzUOOwmM69aaOmwI72Xgs09XVlNJ7OTM1vWU+MjgV6MNcLfujEtjl
	+deW6LlxQucTZ9Ov6aotpNCflviB5EnE=
X-Gm-Gg: AYBFou3Mdn+3SQm/ow5jHztXifZkx1ZyoUhN4IcgmPPX2UAyYpif5lE/h+1bL4t83DN
	jAG6AyHW8l8BkBhh65rb86fgx013ArQTfYHA8wfWNUgv8LzE6mGH1t9tofrZDqBsDe6lnIgeT9V
	4hh7XUKLyBmLf2z8aMrnuhcEnEouo1802n5pfYOtaZA+07HgdjNMjuRvCLadgE9p9Yjiy7J0MWH
	sy+zX86zWh+5lukpDakv4o7gqVOcdXN7uMD/YcPK0iNgj+Zl0yDRHbHzfjC9RftkDQPf9dmdIZ/
	J8sCEtb1xtwLlSXbn3ayip13jss8tNPZ3TPT99aSXLvltHCyChE3MBVjLjnvc2BP3ipjt75I7sq
	ia3IMs1F6TQXUgtqdNTWByNErSCl2FqTasRkdQRa+luiKQfWPIC/fBSua5RNv
X-Received: by 2002:a05:6820:a65e:20b0:702:dd8d:3167 with SMTP id
 006d021491bc7-714f2a0b974mr4624732eaf.53.1793668133765; Mon, 02 Nov 2026
 17:08:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029033106.7374-1-ki.chiang65@gmail.com> <20261029085610.GC2673734@killaraus.ideasonboard.com>
In-Reply-To: <20261029085610.GC2673734@killaraus.ideasonboard.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Tue, 3 Nov 2026 09:08:45 +0800
X-Gm-Features: AclHuK__Z4IbWBemCKllUOBlE45796QmTyXwO65UFmWddNfrWR2s7z8p7hWvah0
Message-ID: <CAHN5xi0-=24_xzXWP9RwfogiRdtF9poWk=eYi+7JPQfXMUxxyQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add UVC_QUIRK_CTL_MSG_DELAY_1M for HIK camera
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

Laurent Pinchart <laurent.pinchart@ideasonboard.com> =E6=96=BC 2026=E5=B9=
=B410=E6=9C=8829=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:56=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Thu, Oct 29, 2026 at 11:31:06AM +0800, Kuangyi Chiang wrote:
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
>
> We don't add random delays. This needs a root cause analysis.

We captured USB traces using a protocol analyzer and observed
different behavior between the failing and successful cases.

In the failing case, the device ACKed the DATA stage but kept
NAKing the STATUS stage until the transfer timed out.

In the successful case, the device initially NAKed the DATA stage,
then ACKed it, and the STATUS stage completed successfully.

The patch adds a delay after usb_control_msg() returns, before
the next UVC control request.

Although this delay prevented the timeouts in our tests,
we haven't identified the root cause yet.

We agree that a root cause analysis is needed.
Do you have any suggestions on what else we should investigate?

Regards,
Kuangyi

>
> > Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
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
> --
> Regards,
>
> Laurent Pinchart
