Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE24B4BD106
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597448; cv=none; b=tKLEBFzkcZLn2ioQe2LrjdgYMLgfSXtc6eFUjldApk0cJbyliXpvFOED5rJZcGV+aIBJuQg7s8D13io2610v2pbMSXmP/+hoyebrzCSg1NywsIXhjKBirFc9vvjSa+i0ziqMlgFh1LmBFpTw2lB5VOUenqVBf6CY7KVyN3THv9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597448; c=relaxed/simple;
	bh=hsmTgOXWY31yOiEwYfObS2Rz+k0nCQ4lsbwNkTGpX2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSt8e+GzcvE974bvmRYVcAl3x62wwuPUdL8lwpgTZc1OHE1d5InEjYOVftDpzLWf/aZWC+5KxuSyzzFnqrlwEc7pPpwGfCcb3RNwT2/NH0PbLrLq27xp1Vd9mmUX3Wl+X5M54iwYTDPIRq3EkYw5fgIeyOLuMiXm1Lm6Rv9ga58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y7qiIkgj; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y7qiIkgj"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso594792a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790597446; x=1791202246; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm7WiEcvZgYFQgA/86utiXIUrMSJvOJdKJld1YmBXzI=;
        b=Y7qiIkgjLbdzFTRurEE6SNfIvHulB7dz4jgPOVvF8rkQNH9hCxW1dSKh0R+x4XYya5
         omFJoLkNqiFAbqNB9qshnJZo7ihJUbXleM6KagaXDKvck2RQSVubGIs016cnAYuuiQp0
         3C+7bIznvIWpoqKdXRYoeuUqvsHkU4qeD3z0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597446; x=1791202246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zm7WiEcvZgYFQgA/86utiXIUrMSJvOJdKJld1YmBXzI=;
        b=WsC3iEfOKX37qLiytba3z7ug4VFtoytPXi5gnDnkPqVfPnK9kuJHcrHH+OeAngahwA
         3sTuNflAo89KHWW8bNLIrQo9gq4smUxeyDXW4nQFzh6V1sH2+1NxxFcyrU8BWhdsW2r4
         tA7Ec9qqa5+4wWsIFxUVKb3mLhwIy6Bn8rgondB42sMkFHEp3yRTqn9vJK4QXHuaLmte
         tqBOMfFauh0Kaw+sZXfd4jKPlOJ6cKVkWoKEMjD5MW8VEITepIZ03Sw7F7ksFIqpSaur
         A5M/kkfzNa/heRlVEbsCneTR025qjR1T99b9ZsvyKf7EB86bj6XS9ZVH+i0bpDtPvSN+
         8G4g==
X-Forwarded-Encrypted: i=1; AKwUvBy33qcZfGHFXfa2jyYTfdHaSMZp8TBNgkAAaBW9nSHutY+TtRIeGTzcrYqLXJ/W4NVgVN8qmkGmqUaxguk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjzGbw2p+BR2A32IA0UAZkTxEpiAlNwVlCgJ5Qr1p/hM6jc51H
	4c+iWuEK0KQmJDXNaTJDgKM0OjZVXnfYNR7cv5k4usHM4cfgM0YLrwpbvZyucw3RixPdkpbCVVS
	+oNs=
X-Gm-Gg: AYBFou1f7OEVbyKUHTiUWC8YjaK5vYtog7qql/+YB6yXr1wXeCpwtUqXoUw5g1k7mqS
	uohnWEHk6n2FwKXwvQ7N8OvLOcfYQ+QXGrp/7DFQXaVHE+HHnqn3/9FNBtiiC5N7LSIMPPFbRf8
	nMkyHTn0tUJN46Zrc2AnFzFmVKIvgIeDnWd3nRJOeUjvai2pv642ysf7gsk4yJ5I+GN4Jcmmdaf
	fQ2oKLdUXzleDEORUCWulFZkzezJxXOOw3/kZmOnn0pKlQY8TXUAZjTruSAbitQ4tauKbMmJqyC
	lSSAE7+b4PFDHpel1etPXvYvwehDJqI1hs+YfGajE0dfIYmu0TmIq7AAs5Isc/ugjlHa0m4Ktuh
	hSpqDybJPf8+WteDcnbazthkIjMBb9Lvkfy7OfRe+b1yrhDOCp8tdRKTQs4xEVMWswu/RcKY3cg
	d2gYgzACV2D1cUsn9DyYtpKsVcDPTx3pfwunqxtGiayObAspwIHnOHjufxNb5OMzft4vPZIleT/
	HiLmBgWcGEhiXaOIpDZcjV3QTbEVbezj1odHg==
X-Received: by 2002:a17:90b:1dc2:b0:3a4:8c41:facf with SMTP id 98e67ed59e1d1-3a48c4202f8mr141320a91.41.1790597445811;
        Mon, 28 Sep 2026 05:10:45 -0700 (PDT)
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com. [74.125.229.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm20725776a91.4.2026.09.28.05.10.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:10:43 -0700 (PDT)
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04f7f2so1796438c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:10:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOyJYo9N/m1ePaWSgu0lq58cjIjYV/MSKuEJo1kHiBoVaKdy977tKANXbuSVC3vapv83fevstP+0yvL48=@vger.kernel.org
X-Received: by 2002:a05:7022:689b:b0:141:aa71:6e02 with SMTP id
 a92af1059eb24-146ce2a0f65mr14559278c88.2.1790597441109; Mon, 28 Sep 2026
 05:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uvc-ctrl-bound-v1-1-7b5cfc68bae1@chromium.org> <20260928120252.GB4406@killaraus.ideasonboard.com>
In-Reply-To: <20260928120252.GB4406@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:10:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
X-Gm-Features: AclHuK_-lgmEmOmfxcxZ6_9uVZ5ilRo7HifkMu9cud87ufINOQ3FYQtiYfguUNg
Message-ID: <CANiDSCv5pd-3aO0Eb1-rvsAOGNpB4rhpjtnTosU6Ca+xBxN1qQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@skynet.be>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent


On Mon, 28 Sept 2026 at 14:02, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Sep 11, 2026 at 01:23:50PM +0000, Ricardo Ribalda wrote:
> > uvc_parse_control() passes descriptor by descriptor to
> > uvc_parse_standard_control() with the number of bytes remaining in the
> > buffer, not the number of bytes of that descriptor.
> >
> > Because of this, malformed descriptors could leak over the next
> > descriptor, leaving malformed data in our structures.
>
> What issue does this fix in practice ?

Look into uvc_parse_standard_control().
Let's take the UVC_VC_HEADER

Imagine we have a malformed control at the beginning of the descriptor that has:

buffer[0] = 3
buffer[2] = UVC_VC_HEADER
buffer[3] => Beggining of next control

With the current code, buffer[3...X] is parsed as UVC_VC_HEADER.

What does it fix in practice? It avoids that data outside the controls
is parsed as part of the control.


>
> > Change the code so we pass the actual length of the descriptor to the
> > parser.
> >
> > Note that this makes the existing check more strict and some devices
> > that are wrongly parsed today will not be probed now.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index e289cc71ba98..429f1ab19a2a 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
> >        */
> >
> >       while (buflen > 2) {
> > -             if (uvc_parse_vendor_control(dev, buffer, buflen) ||
> > +             if (buflen < buffer[0] || buffer[0] < 3)
> > +                     return -EINVAL;
> > +
> > +             if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
> >                   buffer[1] != USB_DT_CS_INTERFACE)
> >                       goto next_descriptor;
> >
> > -             ret = uvc_parse_standard_control(dev, buffer, buflen);
> > +             ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
> >               if (ret < 0)
> >                       return ret;
> >
> >
> > ---
> > base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> > change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
