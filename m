Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794459807;
	b=0/SslZXR8DOc4SfFEP5ek+ACYek0twUZ5GyxRedV0c1b8tdoo+U7kktYMDIm4rNv0sFj
	 ad7dZq+v4sN+Dx4iX9iFWJ40IgI3QKzaZxmrWwE7E5g+OqQVZNpIhr0L0bbeJ/KV0BH7B
	 2jtcAlOtUbjpLqODYDcutgbV5lFRYKQbSoofiPKviHZvwc0FCFkOSVMsbjvsCIULkyHtr
	 s0piBHbPZzr1AZvU5lrkj2dLfDkpmCW9tl2NWTdWDMlsC9n2Pv7ybQklBA6rWri+Vngpg
	 sBPLjxZCoXTFWsRYlswPTE+Wj/Ss2RaKr8JJl3PZtsv/n1eMhhMilxt8gaykONEgBKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
	b=tVALPsQ/gpafhyc2TtWQ4OvFUqy8TuGUhaO1e/zs/l5ThSUjszveX+Hg+oL0u/0cpCwh
	 lRv5ooQz7bsCYfGA/M+opEqCESwvlTfHWvTroYZzN1KIvK55wacS3mK3K24LijqwETgKo
	 Ife2ZFGdhXAySFzrf11iETZ8lhxIAQ6G7K6I5faipW9rAo2pIO9Ebd7CMahQA1fvWa8ea
	 /cE6ROOPsnwDKqoWQtYMRJ86hvSsJiillnC86oTr+h4CEGBpvis9q1S4Yx0tuq3/LLTwN
	 ne39zt2MIkSJsFh9rI/Uw73IXSUtMkUeYIYlGkeyenclGWn/KoDm/MTgPPC2+uLgEKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaemNLOU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB2606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCB2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaemNLOU
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab30d04674so1870021fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794459805; cv=none;
        d=google.com; s=arc-20260327;
        b=OUqa2yKGieMh4j0HffPNyf1RrEhuNFH6BBQyKLQrmk2ldL2EffDv57vsBgH2wFtULR
         027RNG6whS9OaGv0rk4fNZoK22FunJjDpGz0/NdHc7Izq5GJvsR6hCc5dA3uizdRhGnW
         fQ429dl+FOgX/rAlZRxR792qBe/pmYkZhtE28v7p4+AluHoKuf4Dr+hRWhkQxUsJXeil
         7im+naSxeowXo6ixAlAhVRBp9xbyk+6ULBFXKQFN7Qy6+q+/VCk5SuVk5tq5iPg2ZnpW
         pCfvUgER/xQS2sx/F2ZzG8dtOmWb/2aXXUlH9C4dTN4KDq6l9eIv0czWBub8Yi2qiciI
         tMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        fh=wYY8od3mK7/VG7xo9kmD1h0xbQi7dcCveUeZaAe/XiA=;
        b=RTaheBzSuDLaTQMY5K+Nrm0w4DdP3p14cUbP9ClU+s/r4m7b6mXBOWwGUBTCvCqqAc
         p7339ymxAwuKuD1nEVOIQBp8TjVKpOp2CZCsiUqfPy2hrk5QRFfveSdcdesXQgrGOnBd
         xKENyhT5ric/LTbDsFXWhcrSqByjyGWvsgJMvnyIHnt4qOKhZnWD9P6GbPr/I1HccThB
         I8WYoLyxuU5nnlrejd2uW9Cz7AzlYwYNdce6wBmCDDPEf4wbiuJCiWz0dRr6O7ye/C8t
         OFXlIok3UrLS273rKaO0tgHnx4KSLDql6SKqFoAXlNNVfsW8iIrUCA5m8p/JgPXs31+/
         oJUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459805; x=1795064605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        b=gaemNLOUmMlOj79oNRsDVgPcnpn7O7LSUXjc3Z9LQes5hys/5UrxmwWdqdVCGvBUwU
         +W8tFrrKOU+12KJ/LOuGu9kAooCzky7Xdm2lGJnpzrHN8PMTriAC/ja00bjhDL90Dnxz
         js/vaDgdJHekplKfZKF6dkMBx3t1kMwTpdaVJooJacKipBVoceS9DhbVh4rmPqYjptRn
         vohBQ8BSbqQddzriTcvFGOomzeOR/kvTP6PjurupmLHPC0XPmQ3X77Q5v2Ru8EuqPaKK
         CDiIRnNyZV5eChxvCDDYJv/z40MMxzKZONPs3ombVXGp2r1yJsHjswXSfBTMeXe41jqg
         dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459805; x=1795064605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        b=Kc1SaUK+bPeTfSarXm1WWzREM6mm585qnePDsa7nFuB0MJ5db2nzV5Jg3iTtXtMoYE
         ljMH6+Wtx8MlAfXcjKy7YXigj/JFSQODJZX/lHio4pkCO/u3P6ef1LWuBsWqwxvEAacz
         wX09Q9xRd/RL874uLrZgHuMzL6N4q0Jox9CZBRLuVHHjTNk5QNWwLMnBgWKDsy7eVsAq
         zW+Cn9UxoUNyHiAQxjxGrvm41sKGumc7wmSh8IMjaFeiLDyo33Zhx0+qVN/9ji7gt465
         CW1mc4R1NnvTzMdLzJicUCzaERgvvedAzV+2JmArBT54gxSrzr5XFNVnvSEhQRhASSeO
         cQlw==
X-Forwarded-Encrypted: i=1; AL+hErG5U4U45qH1REQxZuUpA6EJN4x7D5fnd5BBixP32pu2+4q5sEdVdXTtx9z+zVjyXuWZirrHMu61AMuRRps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+FzWYeDsbEJoRziY590WoQ7cYMC9I7oAueqW6QFQzQ0ySVZrz
	aDty6x3tU6P6xf8pXr/N0IwjC/mOIteznwfpnUiNSDwHpHuNbUfUPVEDjwaTSoZjYMaiMm30qjV
	BZiornkhi+2Ss8/exD+/BJvK3TID7/Lw=
X-Gm-Gg: AYBFou328J3yFRjQgGvlu+P9ZZKtr5iuFJN16peuMsmdEPZM9HVrfNFogtWHZM4llGI
	ky7LAfu/yU57El7PBHSHjTtDrfyy0XOLPKxzfroa1bZgCDMedpkshK7N0yxNwGywd5RtG8YneJ0
	AbG6pHGJVigxq4tqiOcrr3ayPxlxr3YlSXAASPiXkVzOHEKvzpbk6+PA/VLiTE0kS9l3/C9/BpE
	EA96hV0xvQlkFIfBlDXQNmSb8WpTIO/iI5yerl1qxFrnN7MVknF9lY448bGnRIWopbRDEAxHqwV
	HYqGFg5x8N3A5+liJf5H2ilB2NSrOlewWKIcsX2LfOKCXuwOPb1z6/ITiYfSqXGnadCfSWS3fRA
	7djc4UEWHjgj3bhQ+HsZSPRhP8Mhcoxta7ClavFQmPT1EEdd3NouBbjzsi7zqqtAXTxiYw8o=
X-Received: by 2002:ac2:5683:0:b0:5c1:4f83:180f with SMTP id
 2adb3069b0e04-5c15d79ea99mr1533353e87.6.1794459804558; Wed, 11 Nov 2026
 21:03:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com> <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
In-Reply-To: <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Wed, 11 Nov 2026 21:03:13 -0800
X-Gm-Features: AclHuK_1HOFnNDyAInx4WxkF0Jpvdf0PJfEA3HHVUlfWeMJnLB-aUMtv6VNxQng
Message-ID: <CAEy9hNV+tiw6RgjTz2zvCFriLb9Y9-aDhgfZMF9mxzUryGWqYg@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood - please disregard v2, v3 will fix this issue.

On Tue, Nov 10, 2026 at 8:11=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 10. november 2026 ob 06:37:02 Srednjeevropski standardni =C4=
=8Das je Arun Iyengar via B4 Relay napisal(a):
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The I2C core numbers adapters after the "i2cN" aliases and hands out
> > dynamic numbers, in probe order, to adapters without one. The Orange Pi
> > Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
> > for the header pins gets whatever number is free when it probes: TWI3
> > on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
> > changes with the set of enabled buses. The vendor manual and the
> > vendor BSP name the buses after the controller.
> >
> > Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
> > TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
> > changes for buses that stay off.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>
> NAK.
>
> Extension connector is not covered by board DT. Use overlays
> if you want to use them.
>
> Best regards,
> Jernej
>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++=
++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > index d5d39bac5915..98fc83291dc8 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > @@ -12,6 +12,15 @@
> >  / {
> >       model =3D "OrangePi Zero2";
> >       compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> > +
> > +     aliases {
> > +             i2c0 =3D &i2c0;
> > +             i2c1 =3D &i2c1;
> > +             i2c2 =3D &i2c2;
> > +             i2c3 =3D &i2c3;
> > +             i2c4 =3D &i2c4;
> > +             i2c5 =3D &r_i2c;
> > +     };
> >  };
> >
> >  &cpu0 {
> >
> >
>
>
>
>
