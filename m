Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843196;
	b=avxSWYFC5TdaN9C4qDQ+AD76+y0XhKIUZ4p3VbSVujqGr9gGY+JkjWRc8sLQ/LsuOr1+
	 QVY82r5uAk/CaKsgevLDcHTVM08KI+MFHqzC+T7CKvFmAmrRt7MPj26Cw7WoTfHHuKKJ6
	 Hkw50M0pRKm8GPVQZgUd2xogUoAvm5xKmtdZ3jX2/bi4lxYgx6TWMbv8EyHnPzA/0C0eL
	 0IIdgRTU9cr2l8tqXGGwspSa967QaWZ9pjyY2L6PTF2ZlVbkOPKaA28XMzc22RIqFSg+t
	 0PfJRFdBRTYO6SSXN0PrnmJXGwcQskP7GfngyPKIEHfXctKWP2ggtCGtlmA9hpprOqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843196;
	h=DMARC-Filter:DKIM-Signature:Date:Cc:Subject:In-Reply-To:
	 Content-Transfer-Encoding:Message-Id:To:From:Mime-Version:
	 X-Lms-Return-Path:References:Content-Type;
	bh=mAEHk156ALRm/Yk38m2Sb6tcWOHC1b8Vy26wU1dgEA0=;
	b=znt4f2TFogAO4FW9o8XdzaqfDm2gfIOzxkq5T+n8wBfF6SScnqk5rgKaDGLFRj806RHz
	 Ri9ETrZVwfWZjf60x0TQUFXIBboxh9z8QdCyWcLjHL5eMXeF5nREByNQzrqKv2ZJDRc1M
	 gPM6Lu12LJfuDxl/SHxUgGUWXnN28XGLbmmhw+yMY/gkIeUtBiFpNJacpnGwoyMWXyxRR
	 5ttlYa/O8sKmyagX23xf5mBAyg+AIJSTYHruurh/1Qqb+zuiPM0xB3SeTLU1raoctD2sN
	 ItxTycXl76QY0gGIntUxAHUdjCglbEM3njQx+0iTRsH7ZP8Xeb4QbCVA/cVhM6ljUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=SotxgQiF;
	arc=none smtp.remote-ip=209.127.231.36
Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304BE606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 304BE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=SotxgQiF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793843190;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mAEHk156ALRm/Yk38m2Sb6tcWOHC1b8Vy26wU1dgEA0=;
 b=SotxgQiF9ljVkzBcaF38B0g9igWK+Sm+1s6SPsJGdXH5mSb2fEUHnmh259S6ynBaULJxfK
 Czv6nKXHVNPctX2O28H/FaMNv10WEJ/nlW8lVxfCDQy9N2Pi0ulj9VyS2+XrWNBSnwNUrq
 5N1NYFIip+5Uj5ucbVs46rOgd8gyZARBhmKOATJyQFZBmmnxxp2YF5xC8pfU7VJHQrHpDR
 b6is6TcK/261tUoAjao97baDkpGvZ9WbqxMzLvCaXnaelkWO7jewMdYpdAsyMce/gvP1oz
 ldmeaAQFjOL8RgxKpOxlZTVdyrXXyucP97jN26JpoaP4/XMWLK/6qCTuoVWxyg==
Date: Thu, 05 Nov 2026 09:46:27 +0800
Cc: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <conor+dt@kernel.org>, 
	<devicetree@vger.kernel.org>, <dlan@kernel.org>, <krzk+dt@kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<palmer@dabbelt.com>, <pjw@kernel.org>, <robh@kernel.org>, 
	<spacemit@lists.linux.dev>, <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator tree
In-Reply-To: <5f595068-671e-4823-95af-da1702354a16@murena.io>
Content-Transfer-Encoding: quoted-printable
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.4545f39b.8adf.4983.b26a.7df21480401c@feishu.cn>
To: "Maud Spierings" <maud_spierings@murena.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16aebdff4+94c4e6+vger.kernel.org+sandie.cao@deepcomputing.io>
References: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
	<5f595068-671e-4823-95af-da1702354a16@murena.io>
Content-Type: text/plain; charset=UTF-8

Hi Maud:

> From: "Maud Spierings"<maud_spierings@murena.io>
> Date:=C2=A0 Wed, Nov 4, 2026, 23:31

> > diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts=
 b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > index b5d5112de358..804abc85602a 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > @@ -22,6 +22,161 @@ memory@100000000 {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_ty=
pe =3D "memory";
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D <=
0x1 0x00000000 0x4 0x00000000>;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D=
 "regulator-fixed";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name=
 =3D "AUX_VCC3V3";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-=
microvolt =3D <3300000>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-=
microvolt =3D <3300000>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-alwa=
ys-on;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_aux_vcc5v: regulator-aux-vcc5v {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D=
 "regulator-fixed";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name=
 =3D "AUX_VCC5V";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-=
microvolt =3D <5000000>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-=
microvolt =3D <5000000>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-alwa=
ys-on;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> > +};
> > +
> > +&i2c8 {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&i2c8_cfg>;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0p1@41 {
>=C2=A0
> I believe this should be pmic@41
> If it needs a label it could be p1: pmic@41 but the node name should be=
=C2=A0
> more descriptive.

This patch follows k3-pico-itx.dts, it uses p1@41. And k3-com260.dtsi uses =
pmic@41.
I will uses pmic@41 in next version.

Best regards
Sandie

>=C2=A0
> Kind regards,
> Maud
>=C2=A0
