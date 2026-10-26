Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793002889;
	b=Nqnr6BEOkBrIsKJfZsl9ffq0majEa/ug2NS64ria8qEgVuYCLsxNXEvlVMNU/OolsoqI
	 8pJDh56laEGM/IT9iOq9dR1cEfxoQCyGG3b1QZM2QkDoLUxLki/SVzFL0k3ed6Wz3iUog
	 HsLPYNhPAenR+6wwDI8ReJI6ejNhcDP01E2k5WlFSEhcTuWQ3VdlhK8wQozQlNUNTn3xQ
	 qIMeddRsFFbt9O5kNQgrRZGfw5KmSgr9qrg5Pko7B2XXupMMpOzZxc9FQMjG/7W57cc0P
	 2BfUqwg98ZJjIyznWX0EN2gwWQ5FYUKoIUeZME9+j7RdJOjdQ4h2UcwLSg//zihmKhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
	b=Gfyc2d7TmA7LUj6Jxy+CiduqV+MVQlEkzKy0BRZ5cIoXDmOboWQWMC4+2uoA3COEc4ld
	 CRBTWsxnhfEfV0uryGTFsnJUZg7ZN6XA3UFckuQ83TVjABVMA6WNT3wX+3PUmRtAC7Omo
	 WG+re9cfErsXEonEzdn+WD3TjRwiQx3BFAulFOoE9QkQ6NiXNfbWYAy5mfnXTA0zqGKz9
	 oehCLi3B9SpZX5ggPoyjiFfYcmql9Wq2Cj/JyPMFv7d1z08EQY7fEKIGQnM3c4+yp/X9H
	 xPwyevq4XCuoDAuWdQG3lAFnUIRFT/O/eRXcGTrfOZKrXJUvZQsaAKlgIU8fZRW0RnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AtbFCSID;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B4606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72B4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AtbFCSID
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso1324162b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793002888; cv=none;
        d=google.com; s=arc-20260327;
        b=B8cCgEyTw51WDA63HuKf7GKkV01KERbg+0c4xgdF8DgCF0fuWwtqN8UhbcojWO+fWw
         txNViiYULstM90nObG/3xE8PRmIBWPWMBlEmqvxy0m7RjcRVWj9gB+iK7lbt50Se3FJF
         o5TSJhx4+k77u90dPNhyL6hUlDLL2p7h4Fy4WZRlsN5XgfT1TDRzf0helxosHmy+vVGa
         HFEabUs8+1j9TvqsyfRY9c/knMkJvpgSC8l8VXddnnhmchv00EahqOYG3ceSTKaptSFe
         GHD5voTspzh+HIqhf3RxArsohdBRR9ILBOOcIh5jgc7vSx7od34N7W+h+0J9OdFIMuwu
         ODHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        fh=sYYl6g0qv3+iZmw/UewbbBJHRCyZG4cBSFZivnti6BY=;
        b=AN0kPzkLj4O3hbCQKAZJ3N+yQXt1FPkeRMl7SDxB/r2I492CXnJJamhURxDWzebCEs
         9gLhLvLp9nHL/GV/IsnSNg5na/XazZmJcRYXGMIsR57H1yr158cq2Bl9NrDzigm+B0QG
         p7sJKrNaJXLI08E6yl+yEfhgPGSNnz/OAO9RUR+leLBmWKkodnfbg6dW/vSAMWfXuIjJ
         nxvk+MRoOIRt5Ba9ff/MY/6YjxcsEonAWryuGRJMp7SlVsU0377senPS70PvMbYKJKqk
         UsuIG9XN/qYj8dyw2IlqxdRaSOH78+EnbRxYS7JcbyFeRcXP8PfxsW+LMdel5lgd0M6K
         WR2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793002888; x=1793607688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        b=AtbFCSIDCp6OV4Vh9wQP04MNBYkf0e9/ExwlrbRocYr2B1yABRWZ2GjGOn4OjNBwhT
         oquX/CzpObnyxuwGW05om9z8mtUS1qTjwRVy5pX3hlivQZwFIJvJZ9kg2vOG9DbgQtWN
         ptGBva+NqrndKfctGb67McZTaDdg/8/WF3gbaAcBkxDtycxK9qjrDLF6VqHvKZCXtFda
         0aakJnTvsDo61HBiDnxb+4NOPnI3UlF8uAlhXqE33B/t9X4r+IaCeaL8KNi5wGksdo5s
         wI8jHnYsZmU1MhubUVFSVgPD/JG4Ar3dZrqcZ+S/qb7si5Nrgews1AQTDd//PWyQS8/l
         n7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793002888; x=1793607688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3YIRl+8jG3N04z3aAGjtNPDALZjVxEdDCHikUWgSTk=;
        b=GatWyxbxGt1awxbnkG77EJmvWWzWLkej5fxZvpy/rRQjKFn1XfUPjIGi+6B5Ku5jip
         JeCM4iKz+rJOkW7r8KrY+7l8eSUoj57GR8jj+iMaOGCx+QV9OeZV/TiZ7W8oUPeXJshh
         4oYUrzAe1G7OE+8QRpJ/MnyW0reMxNs3i6NuHvBcRxBTglCLNc7SKVz2cj2yd9KcELbX
         Bp5uJiC/BpqvkH2FM+cgMoxFP8tfBZZvyTecb1tfwT0iYhHw3acexUmuvH8KI+JR1Gqx
         fS6wgLYk3wMQzsws4z8yvdWii0jX0MqjJ3JwPUrOMlN1vVyqLsR4gnI+Tnqhc9uh4nDs
         ox6w==
X-Forwarded-Encrypted: i=1; AKwUvBw7/MSHK3w9tfx9+QZUNIruS07BWPvsDjrzaY2oHt5CYBdGVeO4efWHUHtFkgzTiWM4GMLXDtBAalxKVnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9DEuhCX3is+YiH9l2jQGznBIx2fhreexdalLtETKvhGMYCZn0
	gohnWxMRjkEF3OBgsYBbzbSfiy+yV5HGtXervDUg22I/lWNl/tsdF4rgmJ1aHAZ5/S3oPaBJyHN
	H4Wli+O5HBGony/uWm579j3DQpoTW9hs=
X-Gm-Gg: AYBFou20zTGUJ/ux3/dnAVcuB7bA454rEIaU3Ab+kMBctkPsdp4Uno5v7kiyp2baXYa
	/W3iRO9ahl3Vwwbgua7Y/lqxXTNlkGCIUmE3pj9xOg4eRILB9b9x3UeARkuTXgd2/36OreBwcy/
	e25MzLBmHFDEtz+G2RxreQEkCzGYCMAFxI8zQYEwfRUaZPT1UxsvyO320n34Cmb1JK90MLnQgI0
	7+5UFhlDXa6/9QjGPM6U9Ydgc/CpJkHQeH/x1pvd8Y8kfJ0DW67bA5Ms/ByBji/P0mVINuIPUF2
	aRN+Vt9WuumpZHlFNtCJHy1Qch6FydaS580aH/x+VzeVadqqEFQDJlZufTskFN+MSuH4Bpc1bqU
	Na3ocMF6u9zcmY0aj5LEaipfO94oHkuXxtID/1J0/U+DzLIkii+6f
X-Received: by 2002:a05:6a20:db8e:b0:3dd:85a8:cad3 with SMTP id
 adf61e73a8af0-3e7bfa95ca3mr4905748637.42.1793002888123; Mon, 26 Oct 2026
 01:21:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026003918.155321-2-pmazzini@gmail.com>
 <20261026083058.04173f10@kemnade.info>
In-Reply-To: <20261026083058.04173f10@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 08:21:18 +0000
X-Gm-Features: AclHuK-pzB2ukAo43D26PIOQvYip4LrlulkX87-Zh2YxM609r20rprIHYc6RIYc
Message-ID: <CAAxh=jvGJVNTU6o9L-8-AeHDVHBcBwJDxwwoNZDwMN3tjRk1pg@mail.gmail.com>
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I will drop this patch in v2, so VCOM stays off until a consumer
enables it.

On Mon, Oct 26, 2026 at 7:31=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:12 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
> > Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
> > always-on before the driver stops doing it.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
> >  arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/=
nxp/imx/e70k02.dtsi
> > index dc7ff108aa85..bd9c6c6fa117 100644
> > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> >               regulators {
> >                       reg_epdpmic: vcom {
> >                               regulator-name =3D "vcom";
> > +                             regulator-always-on;
> >                       };
> >               };
> >       };
> No, please not. That regulator is in practice used with a not yet upstrea=
med
> driver for the EPDC on that platform used to deal with the current kernel=
s
> fp9931 / tps65185 drivers. So it is very welcome to have it not always tu=
rned
> on.
>
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm=
/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > index ff9d50942884..6cf5603c0752 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> >               regulators {
> >                       reg_epdpmic: vcom {
> >                               regulator-name =3D "vcom";
> > +                             regulator-always-on;
> >                               regulator-boot-on;
> >                       };
> >               };
>
>
> Here the situation is a bit different. If I remember correctly, there
> is some special EPD logic in userspace on top of some ordinary kernel
> display driver. But thesse things are missing is devicetree?! But
> that might need to learn to deal with regulator enabling/disabling.
>
> Regulator always on is probably not desired here, either.
>
> Regards,
> Andreas
