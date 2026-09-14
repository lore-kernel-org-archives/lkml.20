Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF14756D5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393627; cv=none; b=kMQZMxkguNYgOhRFi0J+Xflyy2XugvRF+DCXhvMShWitBMnhElRxCU2vp0U8Zyq/ivoVjDtrE6KU2ccq1fJr5kwfoX8jZK8x2M0oXbXyN/OjrhW9Y7i2B5rZF1v0zDrtHHCYig9iAzs+d3fhhX9/P9eazVncoyj3NKunFSO+nIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393627; c=relaxed/simple;
	bh=MNva5Egbp4GTECZac2xn6Hsqp29gr2YNQYG2gOiBHDs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vw7TsW+ju/8wv0vRzPLzrcc31uoiFm1yVwgOSMkqN1jOB7wellp9Z3/RbPT0GrdjejIoC+faqFFgKsxSHsucN5Nu3SuMzPWwO7NvRcDvzmd7m+hTJfKUUIXGZC5YDMcRL0gAJJ+ivi3GdSgtWjqZmCrV75SZ98CvQYtJ3sxMcdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m28BEUBZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m28BEUBZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1073258f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393623; x=1789998423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9ZsAwbWFuoLp7QlixkKcUSfEsXC96CDaRk8OvCtRDk=;
        b=m28BEUBZkth84ELHOC/6XYLAMwJqTd2YNBA81Y/3NDa6HEfuGG69i7F+VUh4Pn+p3/
         YSs5CbyRbWgzqlt6PaqvD7s9ZkObZjQUZMJATJjToFyW2wI50ICsS35S/qYtY2MZfVZ3
         fjQ4id2rNdZMPsI+RIEmn96wJxxjwUTj4tKn2mPEqa9a41gyEMIM3rJ6XiN2Zb/97lxT
         uLRW2IyOg0xE4y5mGE+7cOu/CyoqJVgzxqpOlIAtVAOyoNwfkUwiaF1A9vQEXG8XwZRh
         TJd9fhPset3Ovd/wOlWlOSGrqdFnYEjxiJQ8XGG/rEqF8BAWVqndncL+5rnL5jWaIM1w
         LXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393623; x=1789998423;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9ZsAwbWFuoLp7QlixkKcUSfEsXC96CDaRk8OvCtRDk=;
        b=Yah6y+KyncawJgHgnspN+J0zDd145em1xJcoXOfldWgWvdxromFvijyrKLYG93Tnje
         OzTNjBcH8+q+VFTceNao8o38uJLiTujCasqmT1UkA0YpaAOVPzZLaaUpKZQBUKtNQUVv
         7wpv5hL5/oJYkRj+5nqEW9ABf174o1gzmARFlPWK72+nK3okgZ1+iHQ2yLYGPhdgiyUb
         61OEIC7z/Z/x5mOpy+aBOUM30tIkpTbq9dUNzh8XINxll7gkt3sdBMCONOBXImNZ+S86
         GaO+zN5TV85+9LjZddTBBeYQDhTWCZ0RbLf7QjWR2MUljUOYm0IxAyHYSZ/mmdVz4e+h
         CU6g==
X-Forwarded-Encrypted: i=1; AKwUvBxjmW89n/ZfsOuj6aUXU5CefPZpUOW9L/maID9EIVXZxY0kCQQFD7VEQ+kAtmsIcMW7uoHlytgzq/KxOxs=@vger.kernel.org
X-Gm-Message-State: AFuF++n+2LPlISYZTMVFUR8KqyeXrjyEF+cCc+mtHKc7Wn8vhvma8OQU
	gdH+6Zaa0B07VyRVSH2yjz1YFiYWjH4++1696ADg9ugy1O6u3jr+FLrx
X-Gm-Gg: AYBFou2/7Sp2ybiFXwpK/N4WROuyeISGQrU9nklzVa2Kwh0WBAR+35K8hQCluyELhDQ
	fYDxYGJuknJiiLmi7YsRcjTdfk5bcw6GYk0pohhKxoIni/a5tf74FBV3SSgueZOIt1OVijXz4YG
	k1oNn/JjlvCI5tzFqjqZUuVWp9QK6P7UzX7KqzgQnWwOCQKZNxl8FrU5v8B846yGuXNcOqXJrcS
	31s1uswAwJiZ7HHbNEsJOgz0QugEzZmhX/Ft3p6ND99Tn79CtGwgPq/cwyEzZGFmdqFQXSclrRH
	8cZF4hZiviCJQJ1NHj7hVAHMrGOEBlzoJJpKy0mDcjXFrP0imMiSo2anDc2AADtybD5tjL3y9Fm
	8XB/7kS/HTqsbThFHqDhDklqHHS1f8LqKCbkfYJpzdIzANyviaGBF42InSG7qpAPKB21p7rz5sh
	QOckDS1dA4mPj1PVBFAl5lroPEBz/LK3vEYXLsMHDP7glnS5qDtoY8PT8JuJC6SfB9aKRtoRYrM
	iPYXeAjfAw=
X-Received: by 2002:a05:6000:41f5:b0:487:274:75d4 with SMTP id ffacd0b85a97d-48702aaf3demr3185001f8f.19.1789393622777;
        Mon, 14 Sep 2026 06:47:02 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm27980373f8f.32.2026.09.14.06.47.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Sep 2026 06:47:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 15:46:56 +0200
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
Message-ID: <20260914154656.56824fbd.michal.pecio@gmail.com>
In-Reply-To: <TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
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
	<20260914110949.38a46596.michal.pecio@gmail.com>
	<852003c6-317c-4004-ba2c-d6c4b0bd31e6@linux.intel.com>
	<TYUPR06MB621791B56D232A2219614493D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Sep 2026 13:00:40 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> > > But xhci_discover_or_reset_device() is called: before
> > > hub_port_init() calls problematic hub_enable_device() /
> > > hub_address_device() functions, it calls hub_port_reset(),
> > > which calls hcd->driver->reset_device(). =20
> >=20
> > To me it looks like both drv->pre_reset and
> > xhci_discover_or_reset_device() are called in this path.

Yes, you are right. I mistakenly looked at the "warm reset, port only"
case but there seems to be no possibility of falling into this path.

BTW, SuperSpeed audio devices do exist. Basically, any audio function
in a larger device which needs the bandwidth. Similar thing with HID.

> Your code tracing is correct. drv->pre_reset() IS called at
> hub.c:6412 before usb_reset_and_verify_device(), and
> xhci_discover_or_reset_device() IS called via hub_port_reset() =E2=86=92
> hcd->driver->reset_device() inside hub_port_init().
>=20
> However, this path is not the actual crash path. I apologize =E2=80=94
> my earlier call chain referencing usb_reset_device() was an
> assumption, not from the actual crash dump.

Note that xhci_setup_device() is involved, which is called from
hub_enable_device() and hub_set_address(), and these are called
from hub_port_init(), which is used by hub_port_connect() and
usb_reset_and_verify_device(). So something happens there.

Is this reproducible? Then add to xhci_free_virt_device():

	if (dev->sideband)
		dump_stack()

and we will know how it happens.

Regards,
Michal
