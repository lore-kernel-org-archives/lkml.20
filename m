Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960847;
	b=Rh6NRe/m3v2+pO0jXpM3lmvf6G98od2mtkUvE7gb0cApnYUgyUTfAIQDrAI8j/gXEcYW
	 6uDbm7Weq+gNmKR0eq+EUW8nqWedOp4i0guj4BL2ExXuUqK03UNgOyLRkXVcPvog3h/+o
	 1eeWEmNYE8LHj8AgU0i4MXkTntVO44wkkDpIT9qVF2XaEM5K1sAtdyK/0V5o0I53jaVrI
	 zj8Q7KqlsX1Db6LF+j+FBOAwx/TbSpn5MlN7ku2FfPxsjhLAPgpS5wyUyjvSQ+7FuKZe9
	 L2MPzB7QUEINRxo0d2Ul1sQe2OEAmx2Kn9sxVHIthBw8Mic9qN1mlWlYwCMM7/opLOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EAbgVGUld3HpnIPduKowYF30RMUoJTrsR13doWBMVWU=;
	b=fAGdCE4cYlyH4Yswj4C1bb7XGAf3NjihjdPng0wGXbarfjP/9u0IDPKA+y/tDl0clVBz
	 rjNWjpHZoIQEAQPR4HuNXB+wTSUPE9SAcGa2pdAxMGBebaw6wr8y/U5jv/tXfNWQNmYLN
	 +Dm5HtLMIPPH8oWx1o19Tb0Zd1S4EU2LTcM3wJ6HbZARiNuEP3ki1BL2lLirF9x+aTjjB
	 ONTP/GHti8eOUdm6/ccfbsWUVp6gOnndwighAnvZZwW29uWGrF2Pdv+dVpKcWIBCzTGTu
	 teK3CcfSMK4VKixguFivt5RprSSfxGmyl6c3U6CczEGMPwvtTZjybsVgeOtznc/EiOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GC+TsGsE;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4A606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE4A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GC+TsGsE
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so5044275e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793960845; x=1794565645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAbgVGUld3HpnIPduKowYF30RMUoJTrsR13doWBMVWU=;
        b=GC+TsGsE8wO2Hqmh/BvcfoRAtl1hYOJCA591nhaN0pElgXjO4M20iBXdOIPR3RQliw
         3qlaglFraP1oT1m4iODRdxxnTpqnFA3+vCr/3V7msrqxK4ZHzvxYrnVNN+YvsVNZ6n8X
         RSYs8R+x3aGovviFhxMIPmkJ5JTzuWi+SsrBNx53LoqQq0YT2b+SO5ET5HXiA7wgA8pQ
         glJJ3s7RN6tV0DY2ad7Pb+XT06BUX1wF423tkB2AGe1rUmodr15NWHEZbbIth4uAdpr3
         sQRJw3yoUJ5ShRTxkaZhL37nzua6weueFVwHdIgRv3mph1yPnozKtZY5bq9F6AjIYjaC
         rGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960845; x=1794565645;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAbgVGUld3HpnIPduKowYF30RMUoJTrsR13doWBMVWU=;
        b=Jt80Bg+UsgSHY1dBt/m97XPAYvqmuT+5ZTJMkoj6bRRj6Dc+mieVRVwjhmNdnW/lHF
         Alz86H3PiJYb9yxqRmDRhdJIleVrxUP8IOetz3ZgIPhXUUtQLBI+bxyfJvMyYTnZ7x7v
         9pAW4SAt6yBw3tyEpP+588UaWGsJaNO54kEWCtSASCwsQNkuzA4hXTIpDHTmHhVNin/e
         zVOdZpsQ15LuXyCG6ByR3ML46Q4+Fu1L+GIhnXUFoZiGMFTyHyxhME21RPhl6O2iYhjE
         kGy5pT0xk0K+VtKdsMeKRZYsHg/4GP/5djhyhAFaQG/2RuU11FDw6sjjs20HR+1mK/0d
         hxaA==
X-Forwarded-Encrypted: i=1; AKwUvBx58FjB0YeRiRBKCcYzU1e1SrX2w46J+5F1ecR6LnKoXGPHnuKr8mCx11jabOrOhRVhxoSOKe9pDfTPPfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MqBfQRDvnC2zb8P0KBDwlRnclNmXLBBR6i6+ohOeNQViEE5jN
	4XhTxO/Eb6yScab/qJqAId74L0q4Fyyq41WLonnhuTKH5aPBH9tol2cZ
X-Gm-Gg: AYBFou1acB11rHAo9S8L+AWKu7XkWfSOV5WOExUU+AI8W6YrFodBJ4lqgPrV+9LAM9z
	WNaKQtNDDyd9TdejPtdqr17YOwTpP9mg+tateeVvY1gw12UxsOcS9Vb+XTFyX2jpXxxyQ//8DlU
	oTf63sotT8E5FpgeOzitLdli8jedMXMk1yWw7I5wdIyHHgFLlg3iVlnGDWGCwEYeff6wuCOkkPU
	cRD9cl5ob5AenQ35MUb0qr6jOAAyCB1Esyv/+7vBtSF86UtbG7trt2NVRmSQ5OLZPX0nGd06iuC
	B87q7fDsP05zVj/raTlwlSVWgd5CSzikx+5uhrfoD6cXmSRCwvIsC9+oB96resA+Byxjzdkw+YN
	eTW8h8Dilb3Uz1Qtdqemr2SUSsxx3g//zwlQwR4A9TlXcMJcGfRwwrnTj5Lz4h9ufW1+29szEpc
	wsTFXGihGLlZe8G3JMwVwf72M4VVlwUrPbY2rb0dhJJP6zEIG6tfUKIU6P+VESsST/WO2nY4JaX
	LWBWjzFEvSsEcmsAkMNGu9gKTradECt3AEwW1fMBaGK6XjEAQQ/nZParqK2WsUCad/HrJWX7cEo
	X2HjoapJWFMkcgAONsDYgRwsryRYxco+vi6Qrr/R0hZOHr8sxBoe9Cbng/zvigJ1
X-Received: by 2002:a05:600c:190d:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4b6de4a5d67mr34911775e9.6.1793960845310;
        Fri, 06 Nov 2026 02:27:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eab6esm59845305e9.1.2026.11.06.02.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:27:24 -0800 (PST)
Date: Fri, 6 Nov 2026 10:27:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com,
 morbo@google.com
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in
 sms_ir_init()
Message-ID: <20261106102723.1cc4d350@pumpkin>
In-Reply-To: <CAPDEY+X7q2yeWaa7J=Nre+pQqUa2C760Hh9NovdGNSQ=VsEr8w@mail.gmail.com>
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
	<ausVkYs1-3rJ5Fj0@devuan>
	<20261105113229.4126d872@pumpkin>
	<CAPDEY+X7q2yeWaa7J=Nre+pQqUa2C760Hh9NovdGNSQ=VsEr8w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 17:44:00 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:

> On Thu, Nov 5, 2026 at 3:32=E2=80=AFAM David Laight <david.laight.linux@g=
mail.com>
> wrote:
> >
> > On Wed, 4 Nov 2026 12:25:17 +0100
> > Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:
> > =20
> > > Hi Mariia,
> > > =20
> > > > Date: 2026-11-04 01:02:39-0800
> > > > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> > > >
> > > > In preparation for removing the deprecated strlcat() API[1],
> > > > replace the strscpy() and strlcat() calls with a single snprintf()
> > > > call to construct the IR device path.
> > > >
> > > > Both the source and destination buffers have the same capacity, =20
> > >
> > > The line above seems irrelevant, and potentially confusing.
> > > The size of the input is not important, because since we're appending
> > > stuff after it, truncation may actually happen. =20
> >
> > And gcc's stupid format overflow check is going to complain. =20
>=20
> Thanks for pointing this out! I initially tested with Clang, but reproduc=
ed
> the warning with GCC. I've switched to seq_buf for v3.

That is entirely OTT.
Currently scnprintf() doesn't complain.

David

>=20
> >
> > David
> > =20
>=20
> Best,
> Mariia
>=20
>=20
> > > =20
> > > > and the return values are unused. This preserves the resulting
> > > > string, including truncation behavior.
> > > >
> > > > Link: https://github.com/KSPP/linux/issues/370 [1]
> > > > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com> =20
> > >
> > > Except for the small comment above,
> > >
> > > Reviewed-by: Alejandro Colomar <alx@kernel.org>
> > >
> > >
> > > Cheers,
> > > Alex
> > > =20
> > > > ---
> > > >  drivers/media/common/siano/smsir.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/common/siano/smsir.c =20
> b/drivers/media/common/siano/smsir.c
> > > > index 283770d583d5..636ff228108b 100644
> > > > --- a/drivers/media/common/siano/smsir.c
> > > > +++ b/drivers/media/common/siano/smsir.c
> > > > @@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
> > > >     snprintf(coredev->ir.name, sizeof(coredev->ir.name),
> > > >              "SMS IR (%s)", sms_get_board(board_id)->name);
> > > >
> > > > -   strscpy(coredev->ir.phys, coredev->devpath, =20
> sizeof(coredev->ir.phys));
> > > > -   strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
> > > > +   snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
> > > > +            "%s/ir0", coredev->devpath);
> > > >
> > > >     dev->device_name =3D coredev->ir.name;
> > > >     dev->input_phys =3D coredev->ir.phys;
> > > > --
> > > > 2.43.0
> > > >
> > > > =20
> > > =20
> > =20

