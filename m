Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386184;
	b=NdJ6NU++ny4paHCueMToP7m4u0mPAzyGWw7pQ7NtCnIzMOH35tmMXJvq0UIHCCdvWhzu
	 3MdwxomVO0g9C/56pevwhBswCzomEVL4KhZE5TmbJnINdV24bjxtSsUGfjXM5LjdowSau
	 dY1ySXuQwaqk1s8dBD/PHsE2DajoRAbTiEvzJ0iZ6KmfC0hRjPrPT1K/2rkab/+zm9sE9
	 CBpKfBGvmdt3+SOCLsp623Yr81j+ZrA7je69+6XZHcy6BE9ydWjb/Kk09gAxzxTWg+TlU
	 7Rajl1Qimfq27P84yOvgYAjdD5QN15dJ6C46QnpwN9RhQ8RsiuXrI/WCejfU5d3zTAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hwCzX3wFkjwi9d1zxYJZk9eA77a7avCCt18YWRijvq4=;
	b=37LO9Q1o8nPRifWFC0/ETmJgP7ZB3DF0jaG+ALOrlyQLh7BgXpxX2/Z8cTAC454NJgvq
	 0/D6tnL8jPB1UaNokQfAersHOfwVVl8Fq2sh30vugHDFRG2HAcXr6tcQEfUDyVeS9CypG
	 b7m+c460YI82WOMqXw/H4JHqUvAROpZ3/MhV5J+iquCVJDnlLqRXtd/mgOnPZT6hwbdbS
	 Zg/uHdYRfC3BNaG2uF8RPtCWJxrk5ZPhqvX++QTkdLsEH0Ta8gTArITsWIyfFa6/S/Uby
	 /j5s4qrz5nKH5q3S/pMPRs1DJI+Sht6hXQ+z2lCQSC6FGRBBmJubu0D575/tmewIyfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=da8Yt6+l;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DEB606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9DEB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=da8Yt6+l
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed1f1a7695so11502755ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794386183; x=1794990983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwCzX3wFkjwi9d1zxYJZk9eA77a7avCCt18YWRijvq4=;
        b=da8Yt6+loKDHP3T/IbJVtjlnMUo3fPvnNU6t0ZzaWLb0qOFftg9MJmTJwa9iH4RU7H
         O7ZlCq1qrpsff3drm77RcUV3HWK75KdpP4ZoAPY5ZDtnA23dZInLIKx5Ndfczn4vs6KG
         3LwSWbGXCB84crZ61ALLkDMoUdzicDnBzgKButMoTEEfl27Jj9s/zwto+zF0dMu8QnXg
         5UAXiGRPLOuC97vdv8UTnC4ClQnUEMEr53y86M5+gHg7ZM+WSWQyyiI8Bt65DiNYIwSK
         Df6emGo/MTC5BqGCobTWiyX/QfzAul9UikCPvMTfQ1HejeSvhyaA+Ec7nXf8f3fHExjm
         KEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386183; x=1794990983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwCzX3wFkjwi9d1zxYJZk9eA77a7avCCt18YWRijvq4=;
        b=h+QaZehcsZOxvuPG5eCNYiq6uiMyi2dmC1IDevVHVH9PcQAfHzU0PzdV9VM+yJ86Yn
         5GzOgA3/7s1jBtvW2dPfByBmchhv5lQhgK+P6ENVVFC4Nxd1Q0rGStRIycLF0xGTpucu
         CFIvbUdJStOBmBz4UnhJJXQ2KrpXinBbaZ9GGUU/67ova1FW8+xPdeksLYkXBR/KgC96
         FpYDZtuuey7vSPrb0B2eyPaPNP3W0G5ZdQlpCPgWeBmsV6FE9IUNeWUq90j2eAlCrj+0
         jf2eopgD7kfqVzHMd7zS77PiyPSLySENmPxuGjhWR5b9CuUHEY8Oz3xYQjdsst2YpjWt
         z0bg==
X-Forwarded-Encrypted: i=1; AL+hErEfAC7L4e01CJsAWJDQVZ6HXh1+jaEglyTPQ81h2bTZ3Rgt9zDOuavRh76PB6DTJK3FaQgbLzkHPAdjtc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jbMRkBicYormoJOlRuLaHfhMRKKhrLbXbAuIptXPofc0LGu5X
	kRSbKC1WzDqPnWHIfeNGXzSkI09rzMDFLb3bEByUBHPnU2u73VDAai9iCAXqHwTxEA==
X-Gm-Gg: AYBFou3IJmDQJ1cOtqt+4zpjw05jfLfOwnOxzauwqPeqPJ811KZj6TGamB5c99RXfog
	wdleeOjUtkB3EIesA2Lqy4K3HIxL7DY6ui0wlQirzrq3nCtMKeYWnOLq++54GCRpzfwlUOzOBIo
	eZmd2ykmDTnutI3NFneBmhtKbfDG0pZvyJilbzfql4W8N8N1u22R2WQ6T6yTpjKhlelyuz1t1qF
	Y+HfWvjncgkcr/kqT6kaY2ETG72F+sIVQBIORUsu1RXuVCtduuupMKCWTWpaHRBnQxEG//RAQU5
	U1K1GTgOGJz1eRxX5QlXXHMdl7ft95YRGCfRZfDXk7XK9X34aQuDghCmT1zves1ig2czB3JED8L
	P0nbwqsuDQJl3n6jeREHsDTqJE2JNf7chZw50se4rrUUWpmTfcX9VT8CLPSum2Hu2d02/oeoJzq
	J6qaCFZZnFgTX6rPLKg2QQ3AFy9HBRcmDI38pbBBC1aI0MSE+KGCEd6aEF/w/oDGE2v0Io3tyri
	3BEU7R6/KXqxPSpQ1e7BIgRAiqOWFgzjrUuboXjboCL7nE4b6l7O7P+icyt/NEXkLYsW1AZ6NPi
	tv90PN864NMsbqD7aGadGIXoHRbZ0VIQFlnLhCLxP5v4lRFhk6mu0UXY36H0sFWqoefeGS261gM
	fX0f34tNhZFJ1aRoF6PGIcKSD5GhNsHjulQikFnrrSn9xOJCwvdn62NMy8iGx7mLqsG9UMP/Cj3
	3I8PCc5p/sbKQX
X-Received: by 2002:a17:902:da87:b0:2ed:294c:2b9c with SMTP id d9443c01a7336-2edd7ac1ea6mr22278895ad.51.1794386181887;
        Wed, 11 Nov 2026 00:36:21 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dd43bbsm17865115ad.57.2026.11.11.00.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:36:20 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Wed, 11 Nov 2026 08:36:18 +0000
From: Benson Leung <bleung@chromium.org>
To: Di Wu <diwux@google.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, bleung@chromium.org, groeck@chromium.org,
	tzungbi@kernel.org, linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <avQpArYRzrCb5MDq@google.com>
References: <20261111072608.3490763-1-diwux@google.com>
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
	protocol="application/pgp-signature"; boundary="jEief8IRC6172HB4"
Content-Disposition: inline
In-Reply-To: <20261111072608.3490763-1-diwux@google.com>


--jEief8IRC6172HB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 07:26:08AM +0000, Di Wu wrote:
> Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> PAGE_SIZE limit and is the preferred helper for show callbacks.
>=20
> Signed-off-by: Di Wu <diwux@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  .../iio/common/cros_ec_sensors/cros_ec_sensors_core.c  | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/=
drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index d03e40c91582..624d4b32b034 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -149,9 +149,9 @@ static ssize_t cros_ec_sensor_get_report_latency(stru=
ct device *dev,
>  	if (ret < 0)
>  		return ret;
> =20
> -	return sprintf(buf, "%d.%06u\n",
> -		       latency / 1000,
> -		       (latency % 1000) * 1000);
> +	return sysfs_emit(buf, "%d.%06u\n",
> +			  latency / 1000,
> +			  (latency % 1000) * 1000);
>  }
> =20
>  static IIO_DEVICE_ATTR(hwfifo_timeout, 0644,
> @@ -165,7 +165,7 @@ static ssize_t hwfifo_watermark_max_show(struct devic=
e *dev,
>  	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
>  	struct cros_ec_sensors_core_state *st =3D iio_priv(indio_dev);
> =20
> -	return sprintf(buf, "%d\n", st->fifo_max_event_count);
> +	return sysfs_emit(buf, "%d\n", st->fifo_max_event_count);
>  }
> =20
>  static IIO_DEVICE_ATTR_RO(hwfifo_watermark_max, 0);
> @@ -465,7 +465,7 @@ static ssize_t cros_ec_sensors_id(struct iio_dev *ind=
io_dev,
>  {
>  	struct cros_ec_sensors_core_state *st =3D iio_priv(indio_dev);
> =20
> -	return snprintf(buf, PAGE_SIZE, "%d\n", st->param.info.sensor_num);
> +	return sysfs_emit(buf, "%d\n", st->param.info.sensor_num);
>  }
> =20
>  const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[] =3D {
>=20
> base-commit: b70566610b48ba49dec636019da4d696db64b085
> --=20
> 2.56.0.455.g6c5a503b38-goog
>=20

--jEief8IRC6172HB4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavQpAQAKCRBzbaomhzOw
wnMVAP9z09pQgMCDirHGoNohxo1OdmFC8Hu9n9+XFZhqMxV9XgEAu7GyPH/nMTCS
qVL+/Vey4OZJEroKyiCXHqlZZf2WJgc=
=nQzv
-----END PGP SIGNATURE-----

--jEief8IRC6172HB4--
