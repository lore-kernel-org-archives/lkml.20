Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835433;
	b=sSdznmzEeeC5qtQs6T/5KBK4ie0x2MHxnut2579i/lVdlmSpgg1SmM0DHSM84UJj/06d
	 s5zLdH7zLpIHfmIgY7LFjyptvQrSTLvnNfvObUXSNgS63BHsN/8N2924dMXTIXPh7wmTW
	 I0BDwYbTMTWd6k4aZ6emHcvOcz/HcTbQtvVaf9D0YSbYME4wdvCgRVH7TAjlZZSxkFKiX
	 I/6YRJDstNOjBlP0p7ZQJjUuoKtnz24M4iXVM6U8m+s7kNK2DA3Jf7DizJiVwAyxKbqfh
	 v9C8+5vDXY/G6xAoMSR+bsaRdhDAAJNNTl+2JDGBrwgbsF9L5bw4AkCoeEBd9OyKWUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fD5u8EDjljGCE0xDZ4fbiW3sWVh8TOsEBt4cumx8/T0=;
	b=QPsdkVHgUYdqvEM4mO+CsRpNFq9hqz9NkpnY2Xsb0xW1ET5q8FCmoRhBDIctafy/S2Pg
	 LKjQIKvbrTKXX7fxfaTQfPnTHNAap3zHxz2MNbszc5Uf5w+fQ01lgsECFvswbmZa3Hjhq
	 v9dFFT8Z18ZZM6HkKNqGMyIl+fTHSsgyMfrX2A+z+QPi1LIn9ACOf+NuwUJY5H+Zq8cf+
	 Ak1TkYArscwhH6ZbnTbbNEznhywvziQmd5nTyE80tBAf+2/51RRMN9B45O6w5MW8qq9lQ
	 s5pdip9NPSq3WA1e3+ff3SDIU/0qsRD9W9c7UDEIopjGqC9U8tlqsMfpebrPmWg5OBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XT+RFfUf;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1365606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1365606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XT+RFfUf
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc758830601so3317476a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794835431; x=1795440231; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fD5u8EDjljGCE0xDZ4fbiW3sWVh8TOsEBt4cumx8/T0=;
        b=XT+RFfUfprv27LWd5bMdJlkR5mDDJLua3R67x8JDpXNDTPB12x0S/PLhevtlJR92rB
         fJiHrcxc+XmXYOko9f17f0xJylL1yN67m/OrY1tsbt2mc+bFsME+zVTfgeChqFAbpv7H
         yOC5Z1/8c9Bq6zZRY6JIi981H34TqvQL24Nrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835431; x=1795440231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fD5u8EDjljGCE0xDZ4fbiW3sWVh8TOsEBt4cumx8/T0=;
        b=iM/KSxW6koO6gPMVPLyBIpbCyUJsLFelXpUjFBSpM6nV2+/2rbm4SdBrDCDZuf9pLv
         7OzQ3e2+lKU5L6le4MBJ6eYGPps7IOL/Lnqw5BgReNJKaEE5SBaxwbrfn+g7BMDYLwFp
         PpJqlD5JfHJ/E6DteRJvEnpA4ja9+9sG56ZXt15FFg7wek0S+bcJ5IufxWQXKfuCA7ch
         yCJPEyVNn2u1rJEzxe3Z+2lLtymGpe9tZt8i9sD4tFvaSz86++ONbfBNgw3+CB7c5HjI
         9sf2HjvAFX2mY+oWfBWWXkP2kqKRfiFdSo9e7FGjL+vnlNozJRMYkKfxfKHt0ah9Yw2y
         6lWg==
X-Forwarded-Encrypted: i=1; AL+hErElLctemd3xM9L8YLuCzeKfpa/VyAP6GAIPhHut0aq2d8FNmTajQrjNWLa//kTfIj5X2fBu7ZLyGHf2XGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UfAJv5BwzlCseiR2MddSgLAV2u1KKgLAyoVGsLSjFSehVElHl
	brLUFWF3dvQ9szA5nkxqLwc4x9VDw9yHFKfr8Q0Leh8zNT6J1sgH7lbO78gnGDOv8EwXNEcIo21
	AoaDlFI8q
X-Gm-Gg: AZFdTZepIEtfnAGvYmAUvvoBK//RrSejY+bSeZ3BvIUqwfOABEfPYm5GSqYNjUO+Hus
	eAV6WHg+8tRfi4gC/fpzbjMFBWv8ebugp8clh42CxorO+gCHGzgo29mgAi7uEQ5JMQoM3cTdnRe
	6kkz0Y52CRz5MIO+hYeygZPwkqfpYYvKQoT1f1Xbm4C4rhH3ygZEbZSpnJzu4QCgYG+iFH/Mpj0
	ucV5ku/76YCaPRUAi54Y1TQfMAYAetmHECFuZRmmn5XdgmNWt0bI7RlhoCdV01VuRkr8SAxir/I
	AAFzqEhZ1hiwX7tMGCqrw5iEh1FWWZ5tHXg/8DI3TePLdhsYQaXZaJkMK93I8y/sLZnmiKfNVAP
	Ng7V/qJQMFn7QbchoynwLUfnKNHvZRaHgaE3cQ9hvu2bMK2ImORhn28NlP5EdD+Z+FxUJMvcII7
	8kKakphjGhqdwIqxJTne++DECBNaexGSl5KEE0za/A75nsrHd9T1Zn5lyCkqe7HGB93hNjNamrp
	bWB1HTNs3amdAL5oVt8c/NUpxY3piAytBxmFQxZ6NZIMP+Qaa3oXjep372kR2J/xUN4jzTcL2/k
	5aGiBlnidml4/o/FGrc7AuJ2CBdVyr3ePVMXgpveD45R+XyH9K6BRWgGls4h+3D85A==
X-Received: by 2002:a17:903:1b2e:b0:2e9:cb4:b345 with SMTP id d9443c01a7336-2ee0ded3336mr105701615ad.55.1794835431509;
        Mon, 16 Nov 2026 05:23:51 -0800 (PST)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com. [74.125.82.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm38197975ad.57.2026.11.16.05.23.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:23:51 -0800 (PST)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2af4c8d00so6986688c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:23:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1yGx5HEtMfc0U6QhZnSVpflSOtjcRH6iTenTh4DYwf5nubAznqTwUfWBvhw2A9rHILAA91B4Jio67//c=@vger.kernel.org
X-Received: by 2002:a05:701a:cc91:10b0:1b5:2dce:1b6d with SMTP id
 a92af1059eb24-1b52dce1c17mr3055768c88.17.1794835429211; Mon, 16 Nov 2026
 05:23:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
 <20261116-uvc-shortmeta-v1-1-487cfe42fa89@chromium.org> <20261116130839.GA1714298@killaraus.ideasonboard.com>
In-Reply-To: <20261116130839.GA1714298@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 14:23:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCsuPhCyeFWSBPWauECVHQ5A0ySMSqvC7UB6W9ZR4_+iAA@mail.gmail.com>
X-Gm-Features: AclHuK_Zhc9uC1guqtPyu4702nINbtLFRGaSTrUWoBHn2UUyYnjYXDCq7yKTSpg
Message-ID: <CANiDSCsuPhCyeFWSBPWauECVHQ5A0ySMSqvC7UB6W9ZR4_+iAA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: uvcvideo: Reject short metadata
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sinan Turunc <enscrpt@pm.me>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent


On Mon, 16 Nov 2026 at 14:08, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Nov 16, 2026 at 11:56:37AM +0000, Ricardo Ribalda wrote:
> > The UVC header has two bits saying whether the packet contains the
> > optional PTS or SCR fields.
> >
> > If the header says that those fields are there, but the header is not
> > big enough to hold them, there is something wrong going on and we could
> > read out of bounds.
>
> There are multiple checks scattered through the code for this already,
> some of them causing the whole data packet to be dropped, others just
> short-circuiting operations such as clock and stats updates. Did you ned
> see those ? It's getting too messy.

Yes I saw them :P.

I can move the tests to uvc_video_decode_start(). The question is what
we should do for non compliant cameras.

I would love to just drop the packet altogether (with a non compliance
warning), and if someone complains... we can add a quirk or some
heuristics.

Will send a v2


>
> > Mark the metadata as invalid and move on.
> >
> > Reported-by: Sinan Turunc <enscrpt@pm.me>
> > Closes: https://lore.kernel.org/linux-media/20261115121701.189-1-enscrpt@pm.me/
> > Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
> >  drivers/media/usb/uvc/uvcvideo.h  | 1 +
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index a92a986ab714..9cc5d83acbc2 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1487,6 +1487,14 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
> >       if (has_scr)
> >               len_std += 6;
> >
> > +     if (length < len_std) {
> > +             uvc_warn_once(stream->dev, UVC_WARN_META_SHORT,
> > +                           "UVC non compliance: payload header length %u is shorter than expected %zu (flags 0x%02x).\n",
> > +                           length, len_std, mem[1]);
> > +             meta_buf->error = 1;
> > +             return;
> > +     }
> > +
> >       if (stream->meta.format == V4L2_META_FMT_UVC)
> >               length = len_std;
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index af8cef94ffff..59e23e55bc2e 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -661,6 +661,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
> >  #define UVC_WARN_PROBE_DEF   1
> >  #define UVC_WARN_XU_GET_RES  2
> >  #define UVC_WARN_QUERY_CTRL  3
> > +#define UVC_WARN_META_SHORT  4
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
