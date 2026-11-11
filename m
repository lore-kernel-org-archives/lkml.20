Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388129;
	b=YD1A1PJp/sZgbMDKYPFBrPk5I00miWpoZvWIVwVJT4wMY3F060re0NjvQ1Azfa9NMxfe
	 DFQRnypoutv86yh/F2P2jC9yG6WM+DP87O/F9ULYV6175cewZhf34B2oiTPw8glLWv9q7
	 Xa+WyFZwYYjwmpNx+Vr9be6ne/5fQ1AJ5xoYN2eOfcWOkDYgCy4tO9CwVAKSQLubNURUS
	 SPju8P5tt863JsDky8b26zGFcGpMk1/pbtG418GnGvv87GWb1CXOBoZcLi3A2avoKcFsN
	 uic6g+soqg18raGziwCzslNIHcBgiLCC3hNVktMWeXGX/jMxlkky7pUHp9ulyud+LOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2+mgBvQ/shtZqA+TTuzu202ljIOPoD2Y/0b4VMkwg3E=;
	b=zcfkG7RmFlpsC9XSkwQGT/7/zX5IbqM6M0Ig82ngCO7sQgUSyY4/RVrtOJ071ubahhG9
	 WnHZEo740wEcr/9A59O0QAS10ytZ+oJFyeT+R9D3WEitSl6x9Sik6a8LR/4b3RdMk/l9x
	 8h0B0+UaF9Nu9nWXuugvjjV6bx49dOihNsOPQFLUhJDbYTdzdAQ8RBv8ZwJvYxcGs1Ett
	 pIoUTog8swOKHx3fvjFCAhtJk0ll1991CXx9m7QcovQoaFel24nBUyQ0pKsqyeAr7HSrL
	 YwAmPorBm0ZG5DTjaz8CIeppd6GI+rvgngZF/qs15hYFyVai7vm7jctza/iq0ZFlWbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ao27sB8m;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F2D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ao27sB8m
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so33208985e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794388127; x=1794992927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+mgBvQ/shtZqA+TTuzu202ljIOPoD2Y/0b4VMkwg3E=;
        b=Ao27sB8m+kN9hCK4sBqvV8DDJwfv4+MOTIyOdg10ZhTk/seJ4UB2GAnN5W8nj03y3Q
         IbtLMFoJUga42Qbm5mlFHuVUtYmCbeapnMCTpBUPRMFVUqCuIUSLxJS6J8/KeG2wI+s6
         cZqdpobOLYrcr1TUVVJZS0eFPRraIqFBxPOJSqp76ILmqsZwWzK/W0iDFDQCX8+j2NGW
         io8uvedkjyugafJsK76YQGAUf+Xj4vVGxswu5NZKawPdRv7kPE7kIglTAJ0XNc1QQOie
         mGyLNSCnxjgHNq/lvR3wEAtbvIEwDcOx7EY03++HOG7Z3eEvDXBSYWnSVbyr3x1TusrC
         G3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388127; x=1794992927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+mgBvQ/shtZqA+TTuzu202ljIOPoD2Y/0b4VMkwg3E=;
        b=LAHUsNIVkxtFDfp43cB/ueMpJrufYIRqB6MTd42Qjkq8V7xcawWGD++CbOp6C/2P1X
         rGB7jS1/vW/hJ5uKFJPyUtXQS+x7WbLpNdnJQmrxDO1wfn0o69xiMEIQHiFoGY3uivJP
         X0CJXQC8tHIc17OOah4cF8R5EiKtQfg/X/qX7H6A5VPYDcfbFnKSd0P2P2vYca6qiqZq
         I1mz6w32KQkrei/s7LnFz7vzan3m0hyt2UORxz8nrasklx41LSRrgSrKi6V9HpOrRSR3
         wasn87rfznxr5EYGcyrQ9qsqxjP0VUCfiBLO8Fl/hjCvwQnd0d4umCHqYaCduOuT3oYD
         Qx5A==
X-Gm-Message-State: APuU4Z973OUMjDLt8LKPvSWi3vVFr8fbmKimENh6pCx6pebU+WgRnl7E
	W9ORDfXxoj3z+C2fd2yotZesnaYryIV+DuwyLURcDdcoep3uLsTAGFh1yybi5IVXUQJbxAQzplk
	uqYJhtrw=
X-Gm-Gg: AYBFou3uCEqvLmFzFTWGt2Yvj6Y3vs879w8NLE8xPxMIHe4oG0t70s97tD5v7d7ZH75
	jD7Gnzu+xcqqReU4zIC8ENHJ5sNnq/ZiSY1DRm8D4Cy8JoieLFLvh0GD+24c842MlLT5p1PGPtZ
	MawbuG3Tvh7HUvEQitAdwwIDhdr4LrdWlieOs6uOEXg3ffn0bOSQJowL5WHxRfq6Sm9lMjYcvdg
	INqxcFvPzFaQsXmJnYGZWjlqjFHkLis7Nf+N5R0yxG8W8JcHbKEpym4QUcAOcouJ/3an9Vv/Qhu
	PReMNwMMO38QtVKhG9LUdCtX1V9P+pXB/ZOHu7hXAOSdTmk6ZTQDkRcw7s7rEAW+ZCx/dwZkvch
	zUCy1C/GSPC15M0+IVFlQHQArKf/kL39qYyHT/YOD8sBPHMpmRXv6l018WaR2rRJKb42QNHcY3i
	SLtD9/X8UykRiWVO/Uj7KvY+u83Clya5lLSl2PqitAUgVI43SXhQnaz+SJcCjU2t6w3ZcDNtS8x
	AiubA4p8q9bUxtO51zTiWmnDC1OYCqpWj7pG0kgWXf/jCmFc6NSKY/WVPxnWHKH7mSpCm5S04B5
	i4mPVw0w/3ZNr3NDoLyOsQLY69J7perw97J22Tv8H/70qtVpGgBdYJ9PLD0H5Qh9zhIPs/rDcqT
	U0GZ4ypq7mRS3vw==
X-Received: by 2002:a05:600c:1989:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4ba0937df21mr28345495e9.20.1794388126715;
        Wed, 11 Nov 2026 01:08:46 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba02043149sm117997075e9.8.2026.11.11.01.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:08:45 -0800 (PST)
Date: Wed, 11 Nov 2026 10:08:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] checkpatch: Adapt comment to mod_devicetable.h split
Message-ID: <avQwfW1HRIrMcp8i@monoceros>
References: <20260706090748.3809275-2-u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r73japqpugoiebqy"
Content-Disposition: inline
In-Reply-To: <20260706090748.3809275-2-u.kleine-koenig@baylibre.com>


--r73japqpugoiebqy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] checkpatch: Adapt comment to mod_devicetable.h split
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 11:07:48AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> <linux/mod_devicetable.h> was split in commit v7.2-rc2~18^2~16 =3D
> ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers").
> Adapt the comment in checkpatch.pl accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2b7a42bbdd94..5a3d0516c4ec 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -700,7 +700,7 @@ our $tracing_logging_tags =3D qr{(?xi:
>  	[\.\!:\s]*
>  )};
> =20
> -# Device ID types like found in include/linux/mod_devicetable.h.
> +# Device ID types like found in include/linux/device-id/*.h.
>  our $dev_id_types =3D qr{\b[a-z]\w*_device_id\b};
> =20
>  sub edit_distance_min {
>=20
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda

This patch still applies fine to next-20261110, is it still on someone's
radar?

Best regards
Uwe

--r73japqpugoiebqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0MJkACgkQj4D7WH0S
/k6jzgf3fKWfH7pGUihXbeLYZKt4v8UiBoEV9F+aAOPwmld+1fOlfUgUmnqvb9HN
swJPKWA9eRQ1WxgW9RCR4FR+/hFnnfsCsCT/6xk1RtV1xjCuasfjAmBBUoBxTDVR
o5NLio3gqfzJrJNUxNJ26tpbpM2C+Eu1TXb7beQmI52W+5DjQHrY09zjHX3C4/Xd
TaHgUg+dsJQRzzXWdHHxg9jZAHPda9dSNHhbKx6NbKZ8/wr8vP3yzORZA/JPEv4y
hsqA459HyjtJAM4nrMcV9g7OEIQv8na/QgQEeE22GhMkw2q9Ke4VIvlvcGkzzSzt
nfmuyDgo0n8n1nu7/HGDiY1GsXUl
=iuR9
-----END PGP SIGNATURE-----

--r73japqpugoiebqy--
