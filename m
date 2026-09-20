Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3647277C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933609; cv=none; b=V6Ht2zy+BHakwwxlWfItVUKdAfApmrIrNzaqgTg3P30Q6k3DtV4s8sjLnAvjnZWJ7r1fSwtYkH51CsR2CjrA8VMYSaEQ+ZvpZWBpaxNRYXOOfkiyP6X0rEHPbqy/TJKy3WpEBZ7dncaeu6AqxVukqHOdIfT7Y9bS8RHuOLSTpkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933609; c=relaxed/simple;
	bh=NGNvEP6R6v24NUCZuXiZGmdcHRDhU/4UlKpXWm/wUe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3g6tZYzyQRBGCJMlkv1n+fKm3CJv4Y2u/oZnj7cfzNJuOqhMmISRPkun6HGbmvwAGERYev8e21cinfuk1zn0sD6pY53RGahtUDEit4Nmt+9xt5FwMQn5SWYxmZiUKdwYLi+LJqsRZs36HdasiT/6uSLSsivrVQRBAJIdvJZNk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gqxqNR8V; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gqxqNR8V"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso1847590f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789933605; x=1790538405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNAs3l2moedeez3GaXQjJrBDG6B5wQ5RhmPGIelVwHI=;
        b=gqxqNR8VphUGFB6SCOTjei30jep3SNAwTv/U11vbdagN7A+UUfmKKTcOXIgL23qMV2
         tL5l6zuPdAYPrsI85YuBmOVRO4t4MfzdiflWHeMml1LkB9Ks0f5uArslV2EYxkEWkB1e
         UBsHyCm70K4hNrS97NyIscGs+GPtZxdgNKL4xP7wv+E6Ad7gyujuMzgCxLBQJImzKciJ
         JfFqKYHWbBee3kg1bIcKkOiL6QWDkPvi6efgfxv3GYnZlyQ7ShHNth4TB3IGS18SwdpC
         V5+leCX7icQ/8EkAXcZxiPt+/t69a/eRb4J1yKnVEKvyX31k/vmttkfWXGiMsuVb5Sw4
         iqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933605; x=1790538405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNAs3l2moedeez3GaXQjJrBDG6B5wQ5RhmPGIelVwHI=;
        b=o1G3v7dbXd75QV5kCEFMJ4mL/KwN5vjizdkZ2lptvpUSf1jj2McpuCwLbB/yj/tYAF
         ZPH0gTOOnvy0UjPzFeGqRm7uJABCvC/k10ICCBjG0kp1Cd4ERA2PklBLf57aEEapNlV9
         evrXv0i8x+cRecbYY0pA9HMGx6mZLzHmBA8uxRvz+hxTJ0RU+bUU6RQgQ252+aWiobPJ
         o7vII8zBesDJqVPiG0UCIxtLpre09H5idsaNHjmNFMdpDUlYcTKGRK6sV918nwt2Xctn
         DWU0pA3xnzHQR4B/ZNAa3l8Ny3VO9/UlRKnX4ZG92BWJSs+OQ+B+vtknPRbFk+FWOLHj
         cS8g==
X-Forwarded-Encrypted: i=1; AKwUvBzSt20jj0i1bItae75pO7emEmlhq01cKUN2C9BITZNH6PDCZjujxKY1KXq+xjZgaYJHjVaGBsw6ZiWBlyA=@vger.kernel.org
X-Gm-Message-State: AFuF++lfoXaiubEeOwguGPx7YFpJOMGW4N2bvXKNUIyKmIUmmlllXixy
	7RRsKB4F+QUeXEQE5PrrNARSnBXhUZfAcssglO1XpORt17gOtysoZBAleepG5m8fNNk=
X-Gm-Gg: AYBFou2nAiMxoFYVJVZ6YWcT2S+PZmTCJ75rv5IEhJPsraFfuvylbk+9QTP60Vn+h1f
	qIdbVgypY/LtuDQsASuHJwGgfOEOdh4gasLSfhniTEya3++reljT2d+BZtuEku5VCASRi9GUMHw
	YW7TOCJXsigxLwlWeQShpGo/rQ6wtjqsOKNTjnX3FTdYU4uPdO/ovP49hflwf/mHtvUuF79jdNN
	Jti4y8JPNReulv3qZc1WbMXaJd1Lk3PU6J5P6VR8MIAgB/bzxE2BVa15Q10/wG80Un5p+KSWblC
	9fz/8d15VnBsep5g/wBWDOayVc5lzOhc/u2RUD1HYJMGYB8hEBN9w1bY0bHd7NBnCK+74H9DUEK
	v/DpTiRycZx0fp9VsGflejV5unEYFbb8xSURHkaoLYdwpNz3KllSX8mWMDlb5DIUs1F+NTVBlaU
	L+wOcX0DynWFs/MAiSb3PtjBQfXG+8Ck1/m+yo6GKD2CUDq0PPj5oPaldDjyVO6PV8K+IQsHHJp
	otD
X-Received: by 2002:a05:6000:40c9:b0:483:3695:6ea6 with SMTP id ffacd0b85a97d-4871e25c7dfmr13023830f8f.20.1789933605511;
        Sun, 20 Sep 2026 12:46:45 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4872446067asm17286003f8f.12.2026.09.20.12.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:46:44 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:46:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Bradford Love <brad@nextdimension.cc>, 
	Kees Cook <kees@kernel.org>, Deepanshu Kartikey <kartikey406@gmail.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: ts2020: put regmap_config on the stack
Message-ID: <arA3TaFiFOx7ubjj@monoceros>
References: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
 <20260804114625.2314430-4-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dfpnyg4nzvnqoewx"
Content-Disposition: inline
In-Reply-To: <20260804114625.2314430-4-linkmauve@linkmauve.fr>


--dfpnyg4nzvnqoewx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] media: ts2020: put regmap_config on the stack
MIME-Version: 1.0

Hello,

On Tue, Aug 04, 2026 at 01:46:23PM +0200, Link Mauve wrote:
> diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-fro=
ntends/ts2020.c
> index 8775083f4dd6..27f096ce522e 100644
> --- a/drivers/media/dvb-frontends/ts2020.c
> +++ b/drivers/media/dvb-frontends/ts2020.c
> @@ -18,7 +18,6 @@
>  struct ts2020_priv {
>  	struct i2c_client *client;
>  	struct mutex regmap_mutex;
> -	struct regmap_config regmap_config;
>  	struct regmap *regmap;
>  	struct dvb_frontend *fe;
>  	struct delayed_work stat_work;
> @@ -559,6 +558,12 @@ static int ts2020_probe(struct i2c_client *client)
>  	u8 u8tmp;
>  	unsigned int utmp;
>  	char *chip_str;
> +	struct regmap_config regmap_config =3D {
> +		.reg_bits =3D 8,
> +		.val_bits =3D 8,
> +		.lock =3D ts2020_regmap_lock,
> +		.unlock =3D ts2020_regmap_unlock,
> +	};
> =20
>  	if (!pdata) {
>  		dev_err(&client->dev, "platform data is mandatory\n");
> @@ -574,12 +579,8 @@ static int ts2020_probe(struct i2c_client *client)
> =20
>  	/* create regmap */
>  	mutex_init(&dev->regmap_mutex);
> -	dev->regmap_config.reg_bits =3D 8;
> -	dev->regmap_config.val_bits =3D 8;
> -	dev->regmap_config.lock =3D ts2020_regmap_lock;
> -	dev->regmap_config.unlock =3D ts2020_regmap_unlock;
> -	dev->regmap_config.lock_arg =3D dev;
> -	dev->regmap =3D regmap_init_i2c(client, &dev->regmap_config);
> +	regmap_config.lock_arg =3D dev;

If desired you can keep all the assignments here using:

	regmap_config =3D (typeof(regmap_config)){
		.reg_bits =3D 8,
		.val_bits =3D 8,
		.lock =3D ts2020_regmap_lock,
		.unlock =3D ts2020_regmap_unlock,
		.lock_arg =3D dev,
	};

> +	dev->regmap =3D regmap_init_i2c(client, &regmap_config);

With or without that approach:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--dfpnyg4nzvnqoewx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqwOCAACgkQj4D7WH0S
/k5tYwf+NSbNp5/ZckU5Y91RbX8TTRaOOsBcTw4N1MEwf5SUk4jb8JbOev/yP0z4
p57RfINMjHRzsNEMg2HzJHvjoFzIRMd7LitmUMKzk3ZyOgpZL+5wtXBLnBpQV19z
JrXU9NqKLxNABi543SvBqu24DjltBlVgzh7O0I3ANVrebReaSt7yBRCSSCk8tqWP
hKKaUR+u/aab1GNJBG39e7JpDg0koBsC+Eg3gYT5OaL4vXNaawEd9r7D8Yw/zNPH
IvGVh986h5MHHNJXObv4MWR/Md3tRgoSgOgYmENyFz6xklO6jYMoxThFXPxI+XTG
SP0q29DLk4dPORySDim+62yqVzBxmg==
=5lJx
-----END PGP SIGNATURE-----

--dfpnyg4nzvnqoewx--
