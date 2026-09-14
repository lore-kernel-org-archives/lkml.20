Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868A41A923
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376999; cv=none; b=faH+XxyfVLHB936WepMUfjcAIt7yx77HsbTPSabJU19MKPe9Iwa506UEUTsTCaS8k0TZC5UFLGlg36Lziy21Q/6R2+7d1gPbn/IUhtAAmQ+ecCw2Co4tn7CEa1Xl+6P/rPv2y2zOAhIODdxOybvz8M49ry99wNuX4N1w07sIHdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376999; c=relaxed/simple;
	bh=1kVakWwb4/O2W0QBYbRSV5OAQs5TNNaD8JWC0qzoXeY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fES9OoREkKtWufutFlZO2JMjDcZii8Zi7ljUaJZJNaG/7jZf6FNSxq4mVTerP9/40yPXn2SUGLkKo2/vFayYp5ZWfr/0qKoSpBpPt+C4+aZ5t8AV/l5yqJxgSI44oHsx6T2XCitQiVkrfvsgqS7rVUpSRX2x4eWW0KodlrYvh9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXxn4BkY; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXxn4BkY"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a9e35826baso1432066a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376995; x=1789981795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YNHrWqefdK4CC5IKT6xWeKyw7c4j7DYV95RWxnMh5VU=;
        b=bXxn4BkYXxdkh1DHZtQ2JjGoiZtxtQumiopMi2mbaOdNHI1gY0RrdU8yaFewink5fm
         19zaLfxgijvZXHb0/SJjG16kSLSffX8XUPBxLzpB+e1L8N1UK2+4wyEFn6+7ZjeaZCex
         oOPLuhgT9x+Ox0Au9h/Xque31VQ+TiigpBY/8+sdhgUOufKjd4ELYrv7iNxDCtcG/TwV
         BaHF8EkniyQk9BXOZgq97Ie2ls7VRciKdkEcv0mhHgo9eAGeDKLMfJ5TVXqcpUOy6+32
         QlhQoLUSODni8GJudVcyXBcNMO3XQ838OLKXH2gv5fWTGMWarqUt4EUsvjco8uUo+CBn
         CELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376995; x=1789981795;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNHrWqefdK4CC5IKT6xWeKyw7c4j7DYV95RWxnMh5VU=;
        b=JqGFBxW9yo07/HweHpepS3z8D/srf535Zq9kfS2004A5nYIJHdk2v3rWg0E7Stwhz3
         8pkM6r1d6JBP8vLGZBT38ytCrWi8TG3BBCdD13nV5Np10z5jek/H8QQ5fmScSKfbwHib
         2VOL0CYzyhiXO+r0b7z3puzSq+x+KDoHJxbFq5jt5Z9xIY8UMP47klrf/j2rly1/rezA
         SpUM8LAmm0odNRJzvGmr6cPmIRvORPfNlGlaXfhyusz6JlQDbzD2DTg0Y7QbSDV6Cdkn
         LxiD9Fdrg7+TW4mWUtiEIRemCnplTtYb7Iy1UkiY5uZov43Rtpe9BWz9CJ6U3geHd7Tq
         VjGg==
X-Forwarded-Encrypted: i=1; AKwUvBzAh6oFdGpZpJHMyFFpJvWoLsIlXCuL+Le2FEq/ASqvpXruMK4Qf2WuJUivNxc+TNk+cKFgrQWNCXA1+Q0=@vger.kernel.org
X-Gm-Message-State: AFuF++lJrAAdShHqEugB2V9QkjL0SvYez7Nn16prJVptsnf3nq4cGJwW
	/IXl+VamIzh1fUB/8vMbomOuXh4CJqIRHpgcWYAA3zm4vpdJ/U2ueXwQ
X-Gm-Gg: AYBFou3th8K+ossNb8mjFAk93AymR2qxNqXAFqlVIp61OAvpOI2eiIGK75Muq7bLDab
	IxjU4Pzt2Q8M7Gk8Y5a3Nk84f4g9XzaDSLA8/rRzrNq4/CiyJ8DdwpYuoh+wL6+fB91kQx0CcpZ
	WK1kdmzHi7kPUgJdsen0knTKe+QnTvrXthejFnhGzKabFPe4VucVgV8bcej44RN+9g+m/z4/zY6
	bz5UN1Ys9WLNP9x13NL2aPuoX4d1vJA68npaxAHhaypwAFguF0LGjAz+ytJ2AEc+RozjGNec7In
	NXQSWIX8/8NsGKXQ9F/pWgKD+7ZTWo/J4hGSoXXik7ad6AZWN5xQmQALEf0ezPo/WSfW/ZedZsp
	ErKJ8iTwSwCrvGUGIpHplY5rRNHgAyPVQiL5YgnD3FN5qKz0Wt6AkonIk79q73WOA5f+lbZBW5s
	SvfOlwLhihkSXYX8/OEeyDHLprlQUCnq5mwYqa1cPvYvTy+tX9+8KVC9k2qtnAVTG15JM7gVSQK
	34hh0Cm658=
X-Received: by 2002:a05:6402:5002:b0:6a5:f9cc:748b with SMTP id 4fb4d7f45d1cf-6a9f61e6cfcmr963541a12.9.1789376994933;
        Mon, 14 Sep 2026 02:09:54 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59149dcsm3982522a12.13.2026.09.14.02.09.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Sep 2026 02:09:54 -0700 (PDT)
Date: Mon, 14 Sep 2026 11:09:49 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Selvarasu Ganesan
 <selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
 <quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Message-ID: <20260914110949.38a46596.michal.pecio@gmail.com>
In-Reply-To: <TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
	<20260912141837.06b2f3cf.michal.pecio@gmail.com>
	<TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Sep 2026 07:04:17 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> > It doesn't cover hub_port_reset() called by port_event() for
> > SuperSpeed devices, not sure what that is and whether it's
> > dangerous. I noted that the original patch talks about hub_event(),
> > but maybe it's a mistake?=20
>=20
> Thanks for the analysis. A clarification on the hub_event() reference
> in my patch:
>=20
> The crash trace shows hub_event() at the top because that's the actual
> crash call stack from the failing device. The full sequence is:
>=20
>   hub_event()
>     -> port_event()                           [hub.c:5966]
>        -> usb_reset_device(udev)              [hub.c:5875]
>           -> usb_reset_and_verify_device()    [hub.c:6183]
>              -> hub_port_init()               [hub.c:6228]
>                 -> hcd->driver->address_device()  [hub.c:4781]
>                    -> xhci_setup_device()     <-- COMP_USB_TRANSACTION_ER=
ROR
>                       -> xhci_disable_and_free_slot()  [xhci.c:4438]
>                          -> xhci_free_virt_device()   <-- frees vdev here=
 =20

So not a mistake and this is indeed a dangerous case. And AFAICT, in
this path udev's pre_reset() routine isn't called and therefore can't
be used to fix your issue, unless USB core is patched to call it.

But xhci_discover_or_reset_device() is called: before hub_port_init()
calls problematic hub_enable_device() / hub_address_device() functions,
it calls hub_port_reset(), which calls hcd->driver->reset_device().

But I'm not entirely sure what happens if reset fails before this call
is made and then hub_port_init() jumps to re_enumerate. The function
bails out, but sooner or later somebody will try to free this device in
some manner, I suppose, so what happens then?

Regards,
Michal
