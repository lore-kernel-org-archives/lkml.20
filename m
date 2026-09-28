Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB80376A05
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602360; cv=none; b=r8bD6hfXYNTdFX6hQWVkqpUdO2N9pzlp0te/Y3+qROjoSVBlkup4WhRRJ4tJsyCAe+4ekG4GX7fpz9ShrK5AaxgJ8lkgmvToT/lYTOIFOCkuxyXM85nObKxOPD7Pne76YKHDi6XeUpdFMOAV5ke0LbgKnY2MJVmgPDSjLNNOyXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602360; c=relaxed/simple;
	bh=MVXQTin4/5A0iVla6oq+dFiBBhZi9Q2530/0uafB2Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tl7A4XhW5yqt4pMng0KLszIiqKp1KObHclpOiAWnqAtSPE+9AeoZF3WhJZLipnKcozwlTA/c4BcAIETZJwB+L8mIADH8PCqEYys9cAqocqbu0VqidzaS2Oq77lh8W0rtCzamPlbiCMcaFSrAQtMFrY5vze2BXNPEYHWhzawkqr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YjEEIvPe; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YjEEIvPe"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so1385753b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790602358; x=1791207158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjW5WSrKHWZBlf6PacnfszCDiPshVdQjSexGrtbbzg8=;
        b=YjEEIvPeS1rTTM7TH5ZRNvjHR0ZyrZPuJv1W3H1Kmz8MiE7rxYmXrjotuHciOE8i/Z
         SyCFt1/4k5Gen49wE0ILTduyFFEHzqgertljQszaXZr90WxuAtwxf/ryuhBXiTgZ1j/x
         zt3FJBl2/g3bTgJIG+9++NPNP0njfTltBnDS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602358; x=1791207158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kjW5WSrKHWZBlf6PacnfszCDiPshVdQjSexGrtbbzg8=;
        b=Xtd8Ngc2m4WN6wqlfcUMESJCBgqtz5DyMPEZzJrgsOqw2FEra4ZlnESsazegQnggxZ
         ecavn5r/o4ARTGBvBjewOub/OmSsVi55a4zwHMPBCKNC+uxkQOeXPBmI4JClYGBINB4i
         xcp+8S7atwxJ3TNoIvds/XkYv9H7Th92bHWILQgM1hphc903IHDv0Z/wF2eiRFqMKdLR
         U0FU7P6DaADMgRd8FVise34BoBFWpBeR/4lKWKIzyCqUmJHXtMf7O8ycot3bKHLIU//Y
         fyklfmZewoEe/T1Yn/lYrOJqKb4inbnI5MZYR9C+qRsRJzcx6AyQPXg0m5iAhDa85wvg
         RSgw==
X-Forwarded-Encrypted: i=1; AKwUvBzlyC6eJjZz8TTSzd0ZqDa/ttkp5T59MIZeROXMZwnaM4GHHOds6L4RziEm+/pHNz0EG3PCby3k3acsXK8=@vger.kernel.org
X-Gm-Message-State: AFuF++lpi0hb6pIh82t3iEcZjYed2QnvPzpiJ4SkOkGPEdtZDfKWsA2e
	8ULGIGYauAQ1HedOI0MS5wUqbVAT4ajRF70WSZoWBU010FrRFjtxEoLZUh2IKhx+7Subdao6Jg1
	IuGg=
X-Gm-Gg: AYBFou0GN7fDeL1kQ/eQojhcI5aUiR/ZN4Q2NyiWyIVDasZwlHp92eau2xHjU4XWgbj
	ziNdz5hOxW/jJ1J3qP84b0xlCN6F98BKyetW14dYMISZS0suESVpgZz+qb9JXOTJfJLDjzvjGJ8
	YBxN8jBQWO0xEXvjWbsWw6jT7XVaZ7XyFw4kvP+Svpii7QBfwyKYvu2E37q4qIcqu2cTzNkcPBF
	6GpV6Ix0YAfUM+PfcPRWnogqmgGWGs1LTcacC9e5LHRZrtQSOcisyhrnFpJE7kp+EqfQJ19zUF2
	kr5AZi8jAFRWWyzIEpdC6Ghnedvo5lQLZ9iodDKNVQ1ucDxGK9dJoENfU8k6Oc3PkoUPa7pBKPD
	tY9hcTH2p8tafK18Dr2lMjyr0ZcwNzNcjk1M5USu0sE4ZcXRI4Ua7ezSqN5866zrqu7V60lzJUo
	zrekyjkQ8ohlzSo4Sg9Ee3wXiSUY9P0e1ao7udWfwwARwu/W1fXhP/N4l9Nf8XqC1q/fto58JlM
	bypNPa+zm/bkV2bTpHVzMjBjatDAGdbhvjx/CYIaKvGpKCsuQ==
X-Received: by 2002:a05:6a20:43a7:b0:3dd:a196:309a with SMTP id adf61e73a8af0-3de0e977289mr11705511637.74.1790602357693;
        Mon, 28 Sep 2026 06:32:37 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787943cc9sm4593085a12.21.2026.09.28.06.32.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:32:35 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438f55921fso770456c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:32:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzqMUXqw1rCvr/3KO2Zl0awIEbhcU0k4CsYgvICbhqHeih1dNj/s5T6koO8wvgv1jwa5JZBcEJZ56W63zE=@vger.kernel.org
X-Received: by 2002:a05:701b:428a:20b0:144:c128:4c4b with SMTP id
 a92af1059eb24-146d077b8afmr9195740c88.36.1790602354542; Mon, 28 Sep 2026
 06:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081145.8382-1-rh_king@163.com> <CANiDSCsqZzFY+KMKGBg06vm6rGR4FMy63hd0HShiHfb+vpqyqg@mail.gmail.com>
 <20260928132407.GG4406@killaraus.ideasonboard.com>
In-Reply-To: <20260928132407.GG4406@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 15:32:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCt8kntjSh4TWFb4N-DxwEpsbqtUUTtNJ-hOuGRofz791A@mail.gmail.com>
X-Gm-Features: AclHuK-PdmlYvMLhbLcHdOUIGOFXJv-QPERf5awH97_XGN5zm6QhE19yXB4erPY
Message-ID: <CANiDSCt8kntjSh4TWFb4N-DxwEpsbqtUUTtNJ-hOuGRofz791A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kean Ren <rh_king@163.com>, linux-media@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 28 Sept 2026 at 15:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Sep 04, 2026 at 11:15:15AM +0200, Ricardo Ribalda wrote:
> > On Thu, 3 Sept 2026 at 10:58, Kean Ren <rh_king@163.com> wrote:
> > >
> > > The device binds cleanly but delivers no image data; USB autosuspend is
> > > suspending the streaming endpoint. Disable autosuspend for it.
> > >
> > > Issue found on Lenovo ThinkPad X13 (codename Zelda, Intel); confirmed
> > > working with this quirk.
> > >
> > Link: https://lore.kernel.org/linux-media/20260904090751.1814783-1-rh_king@163.com/T/#mf5306ef689ce38ed331a3098272cb0ac2588ed79
>
> When linking to the original thread on lore, the patch.msgid.link domain
> is preferred (see Documentation/process/maintainer-tip.rst). That would
> be
>
> Link: https://patch.msgid.link/linux-media/20260904090751.1814783-1-rh_king@163.com/
>
> Did you mean to specifically link to the descriptors though ? As they're
> in the same mail thread, I think the link to the patch itself should be
> enough. Do you prefer otherwise ?

I wanted to link the usb descriptors. I'd rather have them copy pasted
in to the commit message or with a link to lore
(For the usb descriptors I think the doc says that we have to use lore )


>
> > > Tested-by: Kean Ren <rh_king@163.com>
> >
> > nit: I think we do not usually add the Tested-by: tag for authors. We
> > expect that it has been tested :)
>
> Maybe we shouldn't :-) We merge plenty of code that hasn't been tested
> by the author, a prime example being API refactoring. Actually, reading
> Documentation/, I can't see anything that explicitly approves or forbids
> a Tested-by tag from the author.
>
> This being said, for driver patches like these I would certainly expect
> the author to have tested the change.
>
> > > Signed-off-by: Kean Ren <rh_king@163.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index e289cc71ba98..32bf353013a1 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -3216,6 +3216,15 @@ static const struct usb_device_id uvc_ids[] = {
> > >           .bInterfaceSubClass   = 1,
> > >           .bInterfaceProtocol   = 0,
> > >           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> > > +       /* Luxvisions Innotech Integrated RGB Camera (Lenovo laptops) */
> > > +       { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > > +         .idVendor             = 0x30c9,
> > > +         .idProduct            = 0x0122,
> > > +         .bInterfaceClass      = USB_CLASS_VIDEO,
> > > +         .bInterfaceSubClass   = 1,
> > > +         .bInterfaceProtocol   = 0,
> > > +         .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> >
> > The quirks are sorted by vid:pid. Sorry I did not notice this before.

Can we please add this to the CI? It is a bit of a waste of time to
manually verify that they are properly sorted

>
> I can handle this when applying.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > >         /* Intel Realsense D435i depth camera */
> > >         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda
