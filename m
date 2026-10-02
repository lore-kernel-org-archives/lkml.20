Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6670353A73
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790919024; cv=pass; b=cY7oNj0Vrp0BZz7jPhY2gW05zkYPCigCeymRBUxGbkAqUW423W/BV6GFKp/Mayh2sQDAFcCfeHL07ramMnTIXVqgntYIMpkbB0Lyw3mwuCUNb3rjwQU62SFhx6fuvNzhabjuDRIkz5mzW1HhPWS5ODATJza3/jodFn4c3zbYDmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790919024; c=relaxed/simple;
	bh=2FN2drQCDcOIEhnWtNx7hv9cEpL2yj/Gwb4Ajj9yhKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O77VdkqyhXmUAwCC5mbIGObzJm+Zj9Pv/RlQco0kDzAUyjAB8oxMj2BAuTkkkqH9FQPo+1aV04dTUfwbmFIH8Vy4g0EGjwH9i9NvJ/hGoPHwvFc0qVBffnvEGixuLyvYNJyZMyYQDnSf9G/GDpP1kX15+oQokyNIk37IFHzieo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kdy8br0M; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kdy8br0M"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-6756f62025aso4046441d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 22:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790919021; cv=none;
        d=google.com; s=arc-20260327;
        b=AcKDanL5txLnkglinGtDY1wpEbX8GlOuVBT00W8i3OpEeflV2SMlrYr1fUCZyqwZa5
         ngYqL2tqORo34yXuV3FVUPfeBK1DoiejGYUDdcnZnuzu3laA3arqzZgLS7BmZVlzwlo1
         zJmBdXANtvkHOZTEtEcebWSvgZupUxgZes5P7m3b+FBP2h2IGWKei16YkZD7ivpidRPq
         DNRZpmZvjZG6ZqWpkQ+aEumj6PuwzMy8B8lcIBvXHcToX/8FrLmpOUFsqO+K24Loqwht
         E0YanG2uYaGI5tCBVdXgjhIXTGa1aM1vSMJOL66teovi67lrpK9ezPjjADJY7LNj9Du1
         mGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j4RSpQmQv+xAXJttA29f+V90nwjJ9XXA1sdJdukgetA=;
        fh=0oNBPofqayT6aj+OWkrZChFfO6vU1XqR07hBpoMnAlI=;
        b=Q2Dfcnv1rZ5D/h6hUDcM/Jkbn9kdPwXydl8muP7klegW7Fg1e4AYgf8px62tBPvKHj
         /6hMWVS3mL8RSJq/GV/9FX3aOjGbFStNMZRyaHIL9BDzexADI6Wsjx08GcBuuGl94J6t
         IT4kPASEjYruMmaZYaKQDmWy9MxCIkTqG9BIyd5FDLFH1MAOHUiGV5EwzkQeyS1t71y7
         PxZiXzkTc6stLwRa5DB3u8Eq7yZ6XcxIOWlQqA8M4mPlNdulckeD1GzlwY+lX02qNPYI
         ZG2DYdLpkoixjhyguenFVSNVh0H4pLl1XHfhFoIXMVSRslYWTPciaEr+gjRGh7tzC6ss
         kfmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790919021; x=1791523821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j4RSpQmQv+xAXJttA29f+V90nwjJ9XXA1sdJdukgetA=;
        b=kdy8br0MEo8XgFOEeqaGH3yHZMfrKMfcclL3ElZSNJkXy3hsevJ2UIjxOdcdq2DteI
         1DZ0+j5okspRpzQrzARc1pHT3rgbcMpVT9eXnCBGPIWH/4kF7RSXehR4CIrxrPsSxtNh
         Z6SwLYwNNA2dut9JnzIYjKd3+05i0OrCJq9aU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790919021; x=1791523821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4RSpQmQv+xAXJttA29f+V90nwjJ9XXA1sdJdukgetA=;
        b=IQeiw/xv7bM4aObCzILKnoOFAJNDRdAOfoo0K53bjCMYa6/ZRt5SzveC4xUxYNPey2
         OGCbHaNLyobHFlZC0uww09TBX04K2OjE4qmMpxtLpShab5E6YE6zua5FuNse9Z92CEdA
         iEmIxnz5GHpzUAVO+DJ1TNVM1Dkc299xFQQgHeUSA+Y7n/bRE1hOQmM62ANwUbaOQRMn
         Fki1bNFzbM5XLIg5YyvHUj51CClvQs3yh5YX/iymb4r3vbv/QjsUiaig1a6kGOMpI44R
         dGuMZgKPL0QWr2GmZAnHDOrjC1LG48i66nqu5JkrPXnv/35lEN3W44Wlvbt7ZWZuoo+b
         Pt2w==
X-Forwarded-Encrypted: i=1; AKwUvBx17XQneR5cApGA0k05eB28eFDmnJZZX38g0lS+QYtvHt8Jrgf1Yq+UkUcnoABGQ3FWRafi84fSxicd7Cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx0tmhEvlETQFebEX4BR+X9scXuaz0yOn/z5tE71AR0eeESt50
	ayd1sPM1mRcwNAbohLArWQ4m2aUP6f3j2NucwJgFTuxnA07CNN6rCw5XsuYc8z85DwuKeMMwHRK
	bVqHCWeZfHlcZ2hgr5kAU2pe7Dx4PdZ1h17EaztJg
X-Gm-Gg: AYBFou3ESJ/G7rntwR38rsL+1vfhyVN0xwNwQYfBhmGsaHMAqOdyIVzOA95D8QS+N9d
	LcMcCoccW02Kn++Xnp2NTwj1d4n3SuXdKyJUYGn+tOrcY4cplZcG/UkA5KW+T+iJ0RUWcfFb0SA
	xxW4HEOtn7e/OdeOMNxJAhowjxlG3qlz9Z422OVcX62QXtk9T5yZpDiIWxRyNX0grFuaJ5clN8q
	2HBYSAa//mmzbir6L73I6SpYyygnexcDLVjTY/yoWuEn38pb3DuDrOPo3zDIdPFJGvjVrAAFpCm
	ydWxVdm7g1oYCRSg329xPwCcaK3dCMkroqyBPwS2qBgtFHTw+AIx48dymMZF7mIx0xJKZC3VjGR
	FcPMUu/u1/qgKj5cIHT48
X-Received: by 2002:a05:690e:169f:b0:677:aee3:424e with SMTP id
 956f58d0204a3-677aee34305mr399083d50.43.1790919021591; Thu, 01 Oct 2026
 22:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001110630.1476797-1-wenst@chromium.org> <2026100144-defraud-subarctic-b726@gregkh>
In-Reply-To: <2026100144-defraud-subarctic-b726@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 2 Oct 2026 13:30:10 +0800
X-Gm-Features: AclHuK8KtFG9iG6pzsLsK7sS5kycLBWn6HiRtg9sOfQ7De-Rt36thM7LOfPqgRA
Message-ID: <CAGXv+5Feu=pR0tE7qWyBCTGhLufR8QTyjSo-+DAS5BQwaO4FQA@mail.gmail.com>
Subject: Re: [PATCH v3] usb: hub: Set proper message when usb_hub_create_port_device()
 fails
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 7:23=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 01, 2026 at 07:06:30PM +0800, Chen-Yu Tsai wrote:
> > Right now when usb_hub_create_port_device() fails, it prints a separate
> > error message to say which port failed, but otherwise leaves 'message'
> > set to the default "out of memory", which is somewhat misleading.
> >
> > Use a small buffer on the stack to put the custom formatted error messa=
ge
> > in and use it as the error message.
> >
> > Assisted-by: LLM # local reviews
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Simplify to just using a small buffer on the stack (Alan)
> >
> > Changes since v1:
> > - Explicitly track and free the allocated custom error message instead
> >   of using devm_kasprintf()
> > - Link to v1:
> >   https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.or=
g/
> >
> > Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
> > was telling me that it won't work correctly if CONFIG_USB=3Dm.
> > ---
> >  drivers/usb/core/hub.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 0e929a4c9fa1..d7f39e86b24c 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -1480,6 +1480,7 @@ static int hub_configure(struct usb_hub *hub,
> >       unsigned int pipe;
> >       int maxp, ret, i;
> >       char *message =3D "out of memory";
> > +     char msg_buf[32] =3D {};
>
> Why are you initializing this?

It seemed sane. I guess this probably isn't needed.

> >       unsigned unit_load;
> >       unsigned full_load;
> >       unsigned maxchild;
> > @@ -1756,8 +1757,8 @@ static int hub_configure(struct usb_hub *hub,
> >       for (i =3D 0; i < maxchild; i++) {
> >               ret =3D usb_hub_create_port_device(hub, i + 1);
> >               if (ret < 0) {
> > -                     dev_err(hub->intfdev,
> > -                             "couldn't create port%d device.\n", i + 1=
);
> > +                     snprintf(msg_buf, sizeof(msg_buf), "couldn't crea=
te port%d device", i + 1);
> > +                     message =3D msg_buf;
>
> Please just do what the other errors do, set message to something else
> and leave the dev_err() here.  That way no extra stack space is needed.

OK.

> And how did you hit this?

My other series adding pwrseq to USB hub port power controls [1] would let
usb_hub_create_port_device() return -EPROBE_DEFER if the pwrseq provider
isn't available yet. Due to probe ordering it is always unavailable the
first time around, as the regulator supplying the pwrseq device (M.2 slot)
hasn't probed yet.

BTW that patch series really needs a look over from the USB maintainers.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org=
/
