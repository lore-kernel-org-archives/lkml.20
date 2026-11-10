Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327077;
	b=mKWBQUDWTU63vEfuXULJvA+ZPeh0TIpP4Ux8KfI6lab3r/3ck5L8yBnOuhpLU7oguJXy
	 Wv/+GxCnJfCzWVgDTkdFgY4rUlTAEAi3WRRSzRaSPP6nPFKRKe7szgoPba6t5rfeAUVhX
	 NQ+dcZz24Vo7F+eI6u0wx5/G8pwHSNBEqUkKXxCrB3PLgN/bpWCprBdTYhDkI0dlX1Iy/
	 ObFfVzlVo+jkujzAX3L7ctPWR2p4AJH2BjAjdIU9H08o03YCurELBcFVZcHc15DO6L9wA
	 RQ8CIb5zaeYwqfM9NBJPXEAzaSCjTytBi/NhmqQ9t+SiYNxbLGqD8IIsJeho4bCbFoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
	b=lgrJeRiRNRXsYVVfr2brqOI+GopjItqRZoDd+0R/9D6FgQA5OjYDYCC8x9Dfdil+THpO
	 POUkbB1ceCAX3Pgi/8rfxADr9LDK8e+0ssPGYNex2iM/9n3tQx/Zetp8l+kjyfGAQ1Rbc
	 Hp9agKgOwXXKrMl7qpxU5TLgbRfNo045IUliyJaBwbFWVg9Kg7KzItqYWoWkwKtMqP03W
	 Sj3gmkLDDjTCpx0cZXAFP5ZL35I9eGnyXbLAa5Wo9+bqEv1VmpndtoLmVVO8GOUhvdJNg
	 MmbT4OWeFD3sI49BQuE3K6Ttw7fuL2OS2aka86mn/QrUkGECOs9R7HTQmcRd0OU+jcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4SrHFcv;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7817D606D7AE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7817D606D7AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4SrHFcv
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so327893366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327075; x=1794931875; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
        b=J4SrHFcvYJY0x+2aU3MDU0d6pzy/8p9BDg0oQhVlmvOZPdw2nqZpZJTnT8h1mslc38
         yAKt/YNbPeoeHCWvXu6tO+1eCwOEJF0TOGWDff4cz1LdNAn7Vrxg3Jh78MKy+IedJg9b
         oRb+Bo59J/WjA5QVCwyVvZ4q8bdCYW2A2MsvA2GCXucCM+0p7WEE+8sWVn5MtsNqANJ6
         qAGikGd8WhGUal8D2NNHSLgocbJv53jUdXtNYspydGIp28CNXGBgZPB4B1xVeu6NK0ww
         R+bClDI1VyrF46DZo7ZM5YHeMvI15A5Xc6ImgaVv5MpX6+O4f+kSfe6mxAzAJ41kPXi2
         pHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327075; x=1794931875;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6FXAOsuB/cuM2Q90beDrqDYRqrVlTbOMRM4fnMO4jY=;
        b=P4TVXpYhrar1KDKyEa0Dcjx9FbptEMBF9oUAaOfo1kzYEavt7xY3Ijg+/iKeh5Apt6
         IT19/cPphS8H+GMul+qzdcDVmYp+CmONU+8zNGIR+DpveUhPY4c0+xKl4rczKTs7otOz
         RbZuoEjO//AA30f5scs9uWGYUdf3NAiCo8UCyoPjJDw0kEeBYHpQQHPG0ar/hNmtJvrW
         /0o7/A7dFyCa34abO9ID+qk5SSAy3oFTLwjMoiBcCdJwpdWo+6SJbCt4jd83/dmXN17k
         LLtEUGeonTkxBQ+ZhZyDOErM5s7H8GbtpvpmexeqttE7A+QQ+aCHZW2fOaEHmVnWs5aB
         bCIw==
X-Forwarded-Encrypted: i=1; AL+hErFaE03zu03E7bLE1aTccUxrp/Z58Ygv5xo9uftvseOGFlpnSFP5jNV9Gmxm6OFqAnQ5VFmWMMVnrD0UNn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FW0dbUab5FbhYuDUv1POmJKKyey6b7WhPzhLEbQ114/Hlrxnw
	/XBX+RKp1VLdAmFv7L1sCeXXzsRJoyqzKsa7jY0mMCmDkCsA2qjvyk+y
X-Gm-Gg: AYBFou1CZk7UgYl+zmcUha8dzFnXNQ8wXgO1tB9cZLWJ3Y8dvdgl8Q0/uNPgrJQgbov
	fYa08YnEEKjgHRlznEmCPxeFEUdYjxSU7Y8uDTWwrAjvjhf47uKh8ELuDHh1PDflZC/0n3qD7C3
	D2XHvaPwBacV7LI1e723PNTkthBBfb8C7CPoEV8yrDbZLYQarXvBd47+86CYvUp9IZ2YVmW1Vgv
	sR/+Xs8amYAb4DZZb+bcLoGm2MWH2FYO4SYGnsl1bSy85ipck95TQfFVsstVFc+wIHMSshpaH2R
	OR3bcWqBzVPTvcZz1aTHo8K3A83Ssfzsmja7deey0oThYHXrYOwMy1SeyghkNdAFrirZ5DLxb0n
	kYZ+hPWj+Y7gro91/UWBAu8n2aHxejwUtunx3hFhYYUJKw13gKzb5v53fLbdGKXqTTJYQPDam7A
	tRvBPticQd5bFFJI+lgKkfBiF8uPe6oAs8DelpzZTDSMuSDo2VFkeHASsLH/dBGEgapxF5rjtQS
	RH3IBxZgTL1GBoRbGkssF8NWsQ/34Qb3Lzk4474wqUewCx5EG13RlQF6HE40IQS1l7KusBz0dTx
	gsG2VXD5dFABLOf8fBRILT5NQam/rY209WQiFtdp+/Fd9fQw3irbiON8g+tuWxZSSH+vYB1GJx1
	TUkNTjBggPuuCPoT4yihZbJUPXkDyDBxz8I/AlToCavOtMiuA3Kj5Na9mFaGm4MUplZmFrfJzpc
	yL4KG55jQhBSz7WhDMVxZzSEQS4lK6Ljtw1jevssYRIJ0hnD2xBRWI1nvJ8YXgIBe7pirspuGRB
	XR3lft06xJSuQZJ0tIWftkJtYpZ7+n33luE50C3I9Eu99AYs6Czq1aXwxTCPmHQ++Jh4jYTkY26
	rVwWjYPN
X-Received: by 2002:a17:907:3da8:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c5049540483mr285400966b.23.1794327074616;
        Tue, 10 Nov 2026 08:11:14 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a591485sm127282366b.32.2026.11.10.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:11:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
Date: Tue, 10 Nov 2026 17:11:12 +0100
Message-ID: <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
References:
 <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 06:37:02 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The I2C core numbers adapters after the "i2cN" aliases and hands out
> dynamic numbers, in probe order, to adapters without one. The Orange Pi
> Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
> for the header pins gets whatever number is free when it probes: TWI3
> on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
> changes with the set of enabled buses. The vendor manual and the
> vendor BSP name the buses after the controller.
>=20
> Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
> TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
> changes for buses that stay off.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

NAK.=20

Extension connector is not covered by board DT. Use overlays
if you want to use them.

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++++=
++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index d5d39bac5915..98fc83291dc8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -12,6 +12,15 @@
>  / {
>  	model =3D "OrangePi Zero2";
>  	compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> +
> +	aliases {
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c2 =3D &i2c2;
> +		i2c3 =3D &i2c3;
> +		i2c4 =3D &i2c4;
> +		i2c5 =3D &r_i2c;
> +	};
>  };
> =20
>  &cpu0 {
>=20
>=20




