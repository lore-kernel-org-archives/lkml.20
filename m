Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111F370D63
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362270; cv=pass; b=Vnc9kWtKbFG/XBxH7jB2M7ifHbAta0/a/ZkhQBxZeefAv/LDG1K6FTL/IFJ7sF6AfBD9PCRwkrYQy0VO9SV9z8s9LXmQphVCeQ+5SFLRccuzSX78nxzxP3aNc1SmjJOEILEkezDRaSSnAS/B7iR8tAbdvWtV1GoPt76BwwRwDCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362270; c=relaxed/simple;
	bh=bZfs3GmlmJp+9UVl015Wa8TGidJ9KDc+UwsCi87NnRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJMebJ0uMd6xoL4i23PInBqo9iCh3qn0n8alb0c4eyZSMLGyuzd13H+LdW9MQXAHIiG8YHTCZZMz/oJspkaB6tO5HCalEqXVfdLd6yBNutID2Q3bdUS8xnHH2WdK1JQFtKaa3dYCoDXp4ftCuv7LhZbspcN8iSqQO6uU45kGXqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y43RX8Rx; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y43RX8Rx"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8664769db58so16255987b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788362266; cv=none;
        d=google.com; s=arc-20260327;
        b=XnbdG7BWVn5xcxXlSkQfgag9LPtBHoEFMCBFFbtsodVlVJ9GN9vhsKAHV+w2/urICC
         opKRLcFDcLSPiOMtuAciYjMRYm620FUkKZ/0GRiED8BGY9RYBn3xDeBwUj+RGiwO+ZIR
         tmrgFx7Eyd9SCEWE4nZezPk6Hvp3yv0c5+17/rKTtk+wCm6Q5KkUt/G7DI0hgvyMXrwo
         mefe3xJnGYa+JSr3IJ2V+zZhFeDbH4pjS5lF5cExwF8Xp1j1k10mJUu+7vweiOl0QNoE
         2/k0gu/lmCbWIHDESp5AAt4MD4RmEEBAbWt2sKDeq3brtbbmm90H5DKzvjc7iOE7RHOi
         5vzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dThpWTlOJfitRUpKBKjgJW/n37x+Th1lB39VNPifol0=;
        fh=OS7qEI9cukAOVQuf9t/nZ4y2yoWl8dWNQnJSMb4+Wio=;
        b=Fkbb19OGt7df4UCvoYImMaTwcYqUQd2s1fIxdeexO7Web9sjXnRAhlqVTvTXWHxLLE
         7dbXX5UeWm3DAwXt+Z2ATDL3M6eIwpYRwWU7qwg6Ep0/ih9XKDqmYLhkq/65OtRFhz5v
         e7V1yRBGJsJi+oREIRFu8omxbnPxr+aVJBExbwkkCDgvn3+Lg9qKX212ytm19XxKzvTw
         yDZ8bJ2IDsPATqHDH6+ssZgnFpaVV6eIEejxoxZaXp8OkHJoLblAlqM8I2NUU4vcUWvq
         ukFzBvqdEQXhUBKvAYf5dSZclFeAx3f3egrJMVOH3gZhM0gLMBmnoZnvcRYZfynYmPnj
         VXqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362266; x=1788967066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dThpWTlOJfitRUpKBKjgJW/n37x+Th1lB39VNPifol0=;
        b=Y43RX8RxMyLTdAgxNvHY4Zc5LK7jkM+ZJDkSQK/D+9kPVRnrsiE9+GmVcv3S57sPsl
         xXKbFXithxxGdPEHvecWwaUTAmIt8kzkcwxmWQdDh3AvMvaKIKMwqsnHDxuqL0EwO5u3
         CJa5jKvIoF6teAxDHj0enltYibsXVnAm8YPjNWcDi26Aci3IbDdK8OsHUL8xZO9D88hc
         KYJAzWtJdSp82uGj84PP2OagqEJLQW6qs8u/2G0sU+gOGvrJCQc2e6niJv+Pbsep++ut
         uvUDYqjeEbSYmtvDVkYsEtg81klr3XmFZSAPjZZL3Tgk6wiOp5WPRkGH3Hk3xSLHb8VL
         lpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362266; x=1788967066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dThpWTlOJfitRUpKBKjgJW/n37x+Th1lB39VNPifol0=;
        b=CCXGxPiZSYLXqVsqNcJgXxvdp0FP5HiXQkgocXmXH0C8MheZp/Gk/H1TzKjV9trAmL
         ov7MgoqS9HzF0vE8JFhfH7NHihhNqMzbuFz96yrOUdSANr4gBbsnKxNeKxrC+OaTwixn
         cGx6hsSeclAcdpi74TwTW/LqBch9mkjTyFnoTuipkv51f3PaC6t4zGvG3035ISWRR2sG
         eiIdoHWbv65I7AZiuisRq+23jIDuURB12L0iMyWPNzAH6onuMOtiHmZYD61B26bMT+Mm
         CcvF6IdPikHNZ89vPE4Z7rHBNmCFP2Kvebalf8IItg5KsawXj0ngNnfA7cXnS4kUFf5F
         fXzQ==
X-Forwarded-Encrypted: i=1; AKwUvByG36TnqE3WLGxrG6feUKZosQ1XDkdWi11XwZ0KHa27Gz+j7fBRPrfk23vfqatVQd0VKfr+tywr5EbCCMo=@vger.kernel.org
X-Gm-Message-State: AFuF++lplGp/jllRy7D3plCVq7trIiBM/uEMVLJ0Rghap3mKiPAgrWJw
	RsWDwKAZJ4rz2ulBifHbIhht1gLJjQJPLU0R7+jeNkk3XBWkOmGWLxJdX4o5pw7IHR4YX8Kv7sR
	OZ5SoRwETkJfOsjK+CHK6UnoNBFvp9rw=
X-Gm-Gg: AYBFou3Y2g73Py1xFUkMXp/RG2PwzduP9P9/K6jj8A78DmxI2J4NtX7W8w+8LmZXDlw
	uA8wzxVkeSdw/Bdp27j63Rl/f6YIZImQ1QpUbga33zIaRIh02ZMa4tb7zHDFMIxYmhfcmvXZ6h9
	OWrq5vRDxTwmLOwUwJIT5yQ2F7XS8hUZLjllXnJBUsRn/5/Ca3aseeT/bbhiz2FL3x+r/rrQO05
	Xeu0AZ8mnBE/XQmu2vBTtYOJiHaxMHKGpcj2IxLV1Dzb8hALTtH8FEIUAsSlYkI+HqtYnw/OIb1
	HPNNGCRUtfz7NwlFCXTAEm9PnV/Cpq4q8IO/Gyg+Qu8DUOrAb5TCR0eDiopwEGA+r5ULUxEa256
	EZ1bWCjnsjwfdzKd7bT+7BvpACe2y0Gt84hBzILFHJA==
X-Received: by 2002:a05:690c:c50f:b0:85c:79d2:91a4 with SMTP id
 00721157ae682-86c52217cfamr26209717b3.17.1788362266227; Wed, 02 Sep 2026
 08:17:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902160407.257899-1-catherine.l@intel.com> <c02e3bfb-dd46-4c58-96e4-8f8bb5ca3508@molgen.mpg.de>
In-Reply-To: <c02e3bfb-dd46-4c58-96e4-8f8bb5ca3508@molgen.mpg.de>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 2 Sep 2026 11:17:33 -0400
X-Gm-Features: AcwNN1Vye-PDzuBaoECK0IHWQJQC-7zg2wTIVZgfc-5uCEXCtPHb8qUQSdBRg70
Message-ID: <CABBYNZKWeag1cAgedSbqizoDee_FmujnWQ+v9hbLAB9oRgBs4w@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: btusb: Add support for Intel Otter Peak2 (OrP2)
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Catherine L <catherine.l@intel.com>, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kiran.k@intel.com, L@web.codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, Sep 2, 2026 at 7:07=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de> =
wrote:
>
> Dear Catherine,
>
>
> Thank you for your patch.
>
> Am 02.09.26 um 18:04 schrieb Catherine L:
> > From: "L, Catherine" <catherine.l@intel.com>
>
> Please use the format without comma: Catherine L.
>
> > $ lsusb
> > Bus 003 Device 003: ID 8087:0043 Intel Corp.
> >
> > $ cat /sys/kernel/debug/usb/devices
> > T:  Bus=3D03 Lev=3D01 Prnt=3D01 Port=3D09 Cnt=3D02 Dev#=3D  3 Spd=3D12 =
  MxCh=3D 0
> > D:  Ver=3D 2.01 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 MxPS=3D64 #Cfgs=3D  =
1
> > P:  Vendor=3D8087 ProdID=3D0043 Rev=3D 0.00
> > C:* #Ifs=3D 2 Cfg#=3D 1 Atr=3De0 MxPwr=3D100mA
> > I:* If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driv=
er=3Dbtusb
> > E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D1ms
> > E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
> > E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
> > I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driv=
er=3Dbtusb
> > E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
> > E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
> >
> > Signed-off-by: L, Catherine <catherine.l@intel.com>
>
> Ditto.
>
> > ---
> >   drivers/bluetooth/btusb.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 03039ceaa77d..a4fdf6549127 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -488,6 +488,8 @@ static const struct usb_device_id quirks_table[] =
=3D {
> >       { USB_DEVICE(0x8087, 0x0037), .driver_info =3D BTUSB_INTEL_COMBIN=
ED },
> >       { USB_DEVICE(0x8087, 0x0038), .driver_info =3D BTUSB_INTEL_COMBIN=
ED },
> >       { USB_DEVICE(0x8087, 0x0039), .driver_info =3D BTUSB_INTEL_COMBIN=
ED },
> > +     /* Otter Peak2, Wildcat Lake */
> > +     { USB_DEVICE(0x8087, 0x0043), .driver_info =3D BTUSB_INTEL_COMBIN=
ED },
>
> Please sort and put the comment on the same line as below.

That's not a good idea, we still have the 80-column limit for the
Bluetooth subsystem.

> >       { USB_DEVICE(0x8087, 0x0040), .driver_info =3D BTUSB_INTEL_COMBIN=
ED }, /* Lizard Peak 2 */
> >       { USB_DEVICE(0x8087, 0x07da), .driver_info =3D BTUSB_CSR },
> >       { USB_DEVICE(0x8087, 0x07dc), .driver_info =3D BTUSB_INTEL_COMBIN=
ED |
>
>
> Kind regards,
>
> Paul



--=20
Luiz Augusto von Dentz
