Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECB34D93C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049314; cv=none; b=OAVvXImqM+tiUOCQm4gwxDMri9+cwQvO2jWYoI/OYPc6d7rwz9LdPhWm/RWh5t+e/giATVBrKNmkuXtlsXAkX+79BLgupeyUNDrCewBgW6DhrYUlZrNRHFsC5auZEyF8Y2iyrBOPiikzDVaE9Gfb6NO6FrGRX+eaJ/fvG5otyY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049314; c=relaxed/simple;
	bh=gVIiukMQBR/UKae1V6qy2f2ccgJvs6E6sqWh2SgqJrI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTRUr2tGm2SdME3sB1P9Vc6NyewqvxMzyBh8AHzM35tkdPZAvk0GvH0viDEUh3xjTzf9GucKy7xMUft/9JRcCK8+/YoX5LZFffFTf5Qg7UpSNP1m1A6eQ6gx1yeKmvQr/zwBKKDYxj2j5EsyQDJhSKBYX2hJsEJ61QMqEUn2mAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBmAT/Yt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBmAT/Yt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso6327255e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049311; x=1791654111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z77SESQVvKzIOx1JBvsEbMeEzNyqGqnMV+3z84Kkkog=;
        b=qBmAT/YtSvi7KzQ7ua+VR0mvOogqw9+LloYLSTznYTKRHb2W5QQIwR7fv3tYLjxFyP
         Yn0va2/Trp/9mqy6FX/tD98CO1b+n2aBLVJ4q3wgbmq26vWMVvcpDbMbRHMZWg9fyJHH
         o5DYWCaOSWDauCXU0BlN6DmLiIm+4b+7hiLcf36EAIrMPGqaqGqL4VqhF2XMGvLj6z2S
         xvlQmEXoWQEcMMdPEyZydqb4Snlk4nfjfKrx/XcVP9AIzb5HiuMwwFIkMvadb9ZIavc5
         rvHXgmv1XvCzENkR6sHPQJ4LRktPrzZSkBq10Evn7df3FTsg/rmmU33ZpGz7uYSI0Lne
         7c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049311; x=1791654111;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z77SESQVvKzIOx1JBvsEbMeEzNyqGqnMV+3z84Kkkog=;
        b=a2LMljQALKFOhzMh+t3UOQH0KM5O0gOW+z1VrCepyecgUurBDZ82AVSK+zUUoWHGs2
         xImYA29VTc88YHr6cYsdd0wuSvMBpHiRB0fv9+S+sQzDf8PxIYWPttjcHQcQIGe5ZFYd
         J7LQZUwC/ai4pLg+nunISf5nPu0X3lnZeVOJje3lM0FUMOHCq5kqXbVWTb/2wTIqONRA
         +ZUg/07Ouow7hMhU6LMOJUxtMqz7s0wljUPZTZRd7CxhmA1GGaUEd/iC4fHWrvp0vTh1
         eLy2P2Ao1kuHskeYX+5J02z+zlJ/Cm5A2AQeeWqrYKjD6AOpgvwbfSJJl0LH/coUFmHT
         o8cg==
X-Forwarded-Encrypted: i=1; AKwUvBxsNz0pDIuuTjngGIa/AS/6SSID3qdLpIAFNuV0phLqKeBGGc+XWt7DVq5d8U89IUI/W2axGJvwfJJuyvM=@vger.kernel.org
X-Gm-Message-State: AFuF++k7dusYmNjVxlsEMvLHMFNjaV5GKsiqzJsoAmuat72ZGjz2l70Y
	OksgDNQPsgnjNEK0B2PaEMx1ZZwWSU0+UkJ0xPO+KCTu3/M1MIj0jw6d
X-Gm-Gg: AYBFou02DXeXatfHW96MMqVsOm7e6I4+km5iQauAxF15WSQZIW/shBro32+MAPHME7h
	Lc82prW6JiYKy0olm/+NMg1mrQLis0kWEYOzMQI7Er20eqxlvn7T3qUGTH19CZ2hb+yW4wHGX1D
	4xp/bsuTdM75OWbBngQDWkkM+6z0PdfRsbeRA9ew+AwbZgrJb/+ZZgZTQTMIydrHooE5NybrywR
	srRsogd0zcJaoABRMBLD9f2iI7pLFHwIm/OP4gC/5JXUZ21dxivwfUSKHUAxC9ag8jWXo1gKHqI
	vK6jRvWTlDtIls1UtlZYHY0+3SvN/hNvKAhQGUDLzKslTgFu3nEQdzoCqmHPsiemGSeqkY+uxxN
	k5wBIzmRzHAVMmacp+aYnyabQJG/m92yfdyYep0FnQUBD+9ntJ433wqSorxyrysQgp2O4yPgN5E
	uZTLrZX63QFRAEMtYGDwXvE4WE6dyRXczMslB23sBzZe+P6fHXrg8av1aS6ifRV/4B9FFimJ8dO
	mun8RV/QZrZsVRDyQ5oZ/EFK2WuXsLdvZE=
X-Received: by 2002:a05:600c:8b77:b0:4a0:1365:8559 with SMTP id 5b1f17b1804b1-4a0275663d6mr89538915e9.11.1791049310749;
        Sat, 03 Oct 2026 10:41:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm198130905e9.8.2026.10.03.10.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:41:50 -0700 (PDT)
Date: Sat, 3 Oct 2026 18:41:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Jonathan Cameron
 <jic23@kernel.org>, Liviu Stan <liviu.stan@analog.com>, Arnd Bergmann
 <arnd@arndb.de>, David Lechner <dlechner@baylibre.com>, Andy Shevchenko
 <andy@kernel.org>, Joshua Crofts <joshua.crofts1@gmail.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>, Pan Chuang <panchuang@vivo.com>, Shi Hao
 <i.shihao.999@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: temperature: ltc2983: avoid -Wstring-compare
 warning
Message-ID: <20261003184149.6f29424f@pumpkin>
In-Reply-To: <20261002124902.3703019-1-arnd@kernel.org>
References: <20261002124902.3703019-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  2 Oct 2026 14:48:51 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> When __ltc2983_custom_sensor_new() is inlined into a caller, gcc notices
> that the string compare can never succeed and warns about this being a
> possible mistake:

That function looks like it should be marked __noinline_for_bloat :-)

Although doing a strcmp() like that is just silly.

David

>=20
> In function '__ltc2983_custom_sensor_new',
>     inlined from 'ltc2983_thermistor_new' at drivers/iio/temperature/ltc2=
983.c:1079:24:
> drivers/iio/temperature/ltc2983.c:559:29: error: 'strcmp' of a string of =
length 24 and an array of size 22 evaluates to nonzero [-Werror=3Dstring-co=
mpare]
>   559 |    if ((index % 2) !=3D 0 && !strcmp(propname, "adi,custom-leak-d=
etector"))
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
>=20
> This is a false positive warning as the code always works correctly,
> though the strcmp() is a somewhat elaborate way of identifying the caller.
>=20
> Rework this by replacing both the strcmp() and the is_steinhart flag with
> the sensor->type that is always available anyway and identifies with
> code path gets taken.
>=20
> Fixes: 3dd0c048409e ("iio: temperature: ltc2983: Add support for ADT7604")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/iio/temperature/ltc2983.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/=
ltc2983.c
> index 6655453c9abf..efad747c9e8d 100644
> --- a/drivers/iio/temperature/ltc2983.c
> +++ b/drivers/iio/temperature/ltc2983.c
> @@ -482,11 +482,12 @@ static int __ltc2983_chan_custom_sensor_assign(stru=
ct ltc2983_data *st,
> =20
>  static struct ltc2983_custom_sensor *
>  __ltc2983_custom_sensor_new(struct ltc2983_data *st, const struct fwnode=
_handle *fn,
> -			    const char *propname, const bool is_steinhart,
> +			    const char *propname, int type,
>  			    const u32 resolution, const bool has_signed)
>  {
>  	struct ltc2983_custom_sensor *new_custom;
>  	struct device *dev =3D &st->spi->dev;
> +	bool is_steinhart =3D type =3D=3D LTC2983_SENSOR_THERMISTOR_STEINHART;
>  	/*
>  	 * For custom steinhart, the full u32 is taken. For all the others
>  	 * the MSB is discarded.
> @@ -556,7 +557,7 @@ __ltc2983_custom_sensor_new(struct ltc2983_data *st, =
const struct fwnode_handle
>  			 * to =C2=B5K so __convert_to_raw() produces the correct hardware
>  			 * encoding: P + 273.15 K.
>  			 */
> -			if ((index % 2) !=3D 0 && !strcmp(propname, "adi,custom-leak-detector=
"))
> +			if ((index % 2) !=3D 0 && type =3D=3D LTC2983_SENSOR_LEAK_DETECTOR)
>  				temp =3D temp * 1000000 + 273150000;
> =20
>  			if ((index % 2) !=3D 0)
> @@ -846,7 +847,8 @@ ltc2983_thermocouple_new(const struct fwnode_handle *=
child, struct ltc2983_data
>  		const char *propname =3D "adi,custom-thermocouple";
> =20
>  		thermo->custom =3D __ltc2983_custom_sensor_new(st, child,
> -							     propname, false,
> +							     propname,
> +							     sensor->type,
>  							     16384, true);
>  		if (IS_ERR(thermo->custom))
>  			return ERR_CAST(thermo->custom);
> @@ -961,7 +963,8 @@ ltc2983_rtd_new(const struct fwnode_handle *child, st=
ruct ltc2983_data *st,
>  	if (sensor->type =3D=3D LTC2983_SENSOR_RTD_CUSTOM) {
>  		rtd->custom =3D __ltc2983_custom_sensor_new(st, child,
>  							  "adi,custom-rtd",
> -							  false, 2048, false);
> +							  sensor->type,
> +							  2048, false);
>  		if (IS_ERR(rtd->custom))
>  			return ERR_CAST(rtd->custom);
>  	}
> @@ -1066,11 +1069,9 @@ ltc2983_thermistor_new(const struct fwnode_handle =
*child, struct ltc2983_data *s
> =20
>  	/* check custom sensor */
>  	if (sensor->type >=3D LTC2983_SENSOR_THERMISTOR_STEINHART) {
> -		bool steinhart =3D false;
>  		const char *propname;
> =20
>  		if (sensor->type =3D=3D LTC2983_SENSOR_THERMISTOR_STEINHART) {
> -			steinhart =3D true;
>  			propname =3D "adi,custom-steinhart";
>  		} else {
>  			propname =3D "adi,custom-thermistor";
> @@ -1078,7 +1079,7 @@ ltc2983_thermistor_new(const struct fwnode_handle *=
child, struct ltc2983_data *s
> =20
>  		thermistor->custom =3D __ltc2983_custom_sensor_new(st, child,
>  								 propname,
> -								 steinhart,
> +								 sensor->type,
>  								 64, false);
>  		if (IS_ERR(thermistor->custom))
>  			return ERR_CAST(thermistor->custom);
> @@ -1195,7 +1196,7 @@ ltc2983_copper_trace_new(const struct fwnode_handle=
 *child, struct ltc2983_data
>  						 "adi,custom-copper-trace is required for >1 ohm copper trace\n");
> =20
>  		ct->custom =3D __ltc2983_custom_sensor_new(st, child, "adi,custom-copp=
er-trace",
> -							 false, 2048, false);
> +							 sensor->type, 2048, false);
>  		if (IS_ERR(ct->custom))
>  			return ERR_CAST(ct->custom);
> =20
> @@ -1286,7 +1287,7 @@ ltc2983_leak_detector_new(const struct fwnode_handl=
e *child, struct ltc2983_data
>  					 "adi,custom-leak-detector is required for leak detectors\n");
> =20
>  	ld->custom =3D __ltc2983_custom_sensor_new(st, child, "adi,custom-leak-=
detector",
> -						 false, 16, false);
> +						 sensor->type, 16, false);
>  	if (IS_ERR(ld->custom))
>  		return ERR_CAST(ld->custom);
> =20
> @@ -1499,7 +1500,8 @@ static struct ltc2983_sensor *ltc2983_temp_new(stru=
ct fwnode_handle *child,
>  					 sensor->chan);
> =20
>  	temp->custom =3D __ltc2983_custom_sensor_new(st, child, "adi,custom-tem=
p",
> -						   false, 4096, true);
> +						   sensor->type,
> +						   4096, true);
>  	if (IS_ERR(temp->custom))
>  		return ERR_CAST(temp->custom);
> =20

