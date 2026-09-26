Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B43835A387
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404350; cv=none; b=EzfMxN+D8+Hd0mYqD/tXIJn1ODJcXD9M4DkiLfeoU4++2/w8kM3WBvvER6rlYz3OcxDze0kjLW3ml1QVZvkxFXRFJJbpi58vm9Tv+XEYO56uUWQwcci38c+K2Cf1HSDsFC4Bs4xg85nW8g6n+dpS1+aGCjA9MBkgJe2kLtM74Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404350; c=relaxed/simple;
	bh=RKnDzIDzmT8Fb769giFnrQq/6P1KJS3fV65UjMQ0CGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cI1IVKqI0F/h+RPk47aM03cVpdPGjaEBEa4dMHNlSD84t3fGPmiiT/paT3i6j6+dVaSBDMkxKU8Vwzch7OEmsJmeXA8OmEm6+4Rq/8Ean3BDDiQmYmnF1X1Up/VlIyXqyHAa7r/CFXDXD3qQLq2vi0sEZaUibhv2MKKUg2Wg60I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gXX5Z85Y; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gXX5Z85Y"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so14901575e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790404346; x=1791009146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKnDzIDzmT8Fb769giFnrQq/6P1KJS3fV65UjMQ0CGg=;
        b=gXX5Z85Y0RwaWosKfpCqGaIeWjwWs0BChPeTyEZAMy6FaxIPVSiIhA1GZb/H9AVtVe
         DwOF/oRYap8Geej275IqIR6jebCDgn65+2cHbsJ3EVzFGSW7dQPRrlptcbAnKUnhJz+E
         q5E0lzj3auVEcsIhPropmnySt1AlwT0oCCWyLf1XBlzIiLp1pKBo35KIQIxz9tYXxXVL
         nkbFPPcRH/t4dGygknK+CqOw+3Wdcw2lT2j7dBuuMdBaTIh+tziwSesP1X96/ViqA3h1
         KO6olydEn/pPIG6QpP1yS5JW/gkriEfKMpYQcHe1AWl2jDqZAF51lzysOjRSAcDSCYNa
         ppTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404346; x=1791009146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKnDzIDzmT8Fb769giFnrQq/6P1KJS3fV65UjMQ0CGg=;
        b=PZVu1kBjpP+wlAT82ANiLg8mFftxvSc0pRMSWmlyT8jSUFkvgXV8ijkQevsKMPETEa
         vL94lTbNA38TdJ8GYZm8MyRNOoFEZu+ubuIHkgxc4tsF5C6yElxb62zd0sNrhjb0q5s7
         fQBF5p1XhiOtA8MMToQRRq4VMjuEAmNrItUJTiow9iq4wcYOVbinQbVtKpl5hRaK4gIY
         1+pHICgb2aAmBaqR1DpBEZ2gK20MFrbZxXrStSkO+wgjyUO20jquuFueC3+tjEY/WKef
         C+pmV/4bUqaX4XN3rGbpfWPAFdE2SFNHpxwa+5ZCTichy1FXY246a53Ppm0VZyDZkGEJ
         reHg==
X-Forwarded-Encrypted: i=1; AKwUvBxruC+zgTh7RKQRFkZpVCzVD3evxLLF0JeUmE8sX+ne0pBsT/cLKt8JcWjY1W7WAqg7bhSe4gF66Z66lLE=@vger.kernel.org
X-Gm-Message-State: AFuF++mfFdOexb5PgS8RlEe78oM0MqSI3KnFUEHtna/K1vDH41ruD/Xo
	VmK//xCkrT2sVXqILGD86h9kWyHi6T4jiIE2bWs8sGcwshND/xsqj84HP70CwQpmsEY=
X-Gm-Gg: AYBFou2LTxa20bLMd9QfhpDKezk+juPZVWmQVzs8XbDg046/nMJr8cp8ghFPZrnabXu
	GW3oYEp2Ff6crvaPvGiKlH9DNrzHXBLIwa3QRqGWo7JYjDxHJstv1yAF/k9IwB9PqUMWplHn97/
	klZnFZkBv/GFV0GfU+3DlP75klZJFVYzaNo7K0JPJhNVoSxp/WvSbzr2iZ/J6ScPw6KNHR4Ao0k
	r8DFrinqC+P2qOEaUO1U4jwabCQS8hyxctcYlGMfp4Id2OQN6+y58WP8eygHMWxd96PXI87Z/bE
	/ix0UnY3rYbDKip0O8q6PpWfRDung5m98bxuuvuSV6QdEq6ZSnpMkeLeuwN1GT2wj7NaZf9zsnY
	UtviSMmpeQR03geiPsXoAIBBhJ7ZUwWLllFOYl3UHeY8ZGxLQV39+dDsvWq1jblQSo7ou/uY+nh
	jxK79T8bXV4f8yONTEXlSMy09nNyhQc9mqozqYqYLnKi9zhIi8xa4u+fpjYQ10ZI0P+hFhTDVUc
	er5g8HdWTGx2uc=
X-Received: by 2002:a05:600c:3486:b0:49f:f9d4:674d with SMTP id 5b1f17b1804b1-49ff9d4695dmr17829285e9.13.1790404345436;
        Fri, 25 Sep 2026 23:32:25 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49ff06b6108sm130167325e9.8.2026.09.25.23.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:32:24 -0700 (PDT)
Date: Sat, 26 Sep 2026 08:32:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	Mehdi Djait <mehdi.djait@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/tiny: sharp-memory: reject devices without match data
Message-ID: <ardmUk4lMFhnc76E@monoceros>
References: <20260925123608.2082429-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j7h5nzpwlz2f2g5n"
Content-Disposition: inline
In-Reply-To: <20260925123608.2082429-1-yaojiale02@163.com>


--j7h5nzpwlz2f2g5n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tiny: sharp-memory: reject devices without match data
MIME-Version: 1.0

Hello,

On Fri, Sep 25, 2026 at 08:36:08PM +0800, Jiale Yao wrote:
> SPI driver_override allows a device to bind to this driver without
> matching either the OF or SPI device ID table. In that case,
> spi_get_device_match_data() returns NULL.
>=20
> sharp_memory_probe() immediately dereferences the returned display mode
> to calculate the pitch and transmit buffer size, causing a NULL pointer
> dereference.
>=20
> Commit 572a00852635 ("iio: dac: ad5686: missing NULL check on match
> data") fixed the same driver_override issue in another SPI driver.
> Reject devices without match data before using the display mode.
>=20
> Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Note there is an effort to make it impossible to use driver_override in
the core and only allow a few dedicated drivers. (See
https://lore.kernel.org/lkml/20260922-driver-override-opt-out-v1-0-58c35ded=
3b83@nvidia.com/)

That should make your effort to implement that check in all the driver
redundant.

Best regards
Uwe

--j7h5nzpwlz2f2g5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq3ZvQACgkQj4D7WH0S
/k6Qcgf9G3X0KeSPaCKttnPz60x5oy+ze4Lrp0MR133CvtMOi/KpCFTC0JPCuv3a
M8mOGrUG7qRG9hwJz2xlMIeNTtr3Jib0Jgu6pZYvMaNnVJBmNdDF4sTWaZmx5hL7
A/qqL7LyP9lRn6Ko2yw/zhyWp276vGLp/yjW3tFDpUlJucJ8XPXfmYJlZVvgrvoV
4NAfE+Byneex1y222VYJX4lsZ70byfg0BVuBtxV3kxsdIRW9y9vo+ZBAyzgmd57s
Y6GxPfU0SKn/qiRPg54hhtwSAru7oele0BN3Hjwf41Ll2rt59Troh7l18UONatC4
tXudK822kPgqBO/Ax1CSPtsjwbLZgg==
=Gwu0
-----END PGP SIGNATURE-----

--j7h5nzpwlz2f2g5n--
