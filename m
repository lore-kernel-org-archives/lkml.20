Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C1B33DED9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787778191; cv=none; b=SE9TtNRm2aFlfyOGpB6n7zvJKcFxna0SYM/MSgDg1gtOjW0VboHTgJpAFDsWtl34IWYAumd+9JKtmYwp4r/u5hXNP67EWc3DXb2RKX4h/26B8VtBjVdEsOckeT1bay1ceBNieWB94G9vGiMpjxuIIShBvb1GbOh04SeNbo/RVAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787778191; c=relaxed/simple;
	bh=G95DSJvyvHD4TuyBwIEBp3aTZlrEO0waUgZ97+t02SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxqHvMAwlfPVIymwgkPRgp/4QeLEruyVU4SspYYD4s3znt4X2WPoNxDGDJmFKI/ASC3+PS5//JRKnPAXeqFoZ/r0yhypkJ3aFxgZGHc1kxTumNDS1Ti0hPUwBmF/uuImXWsWWIS9y/oPeYyKwRnFXknoPeLTQJcitqMb9wi2Obg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ey0ti1W8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ey0ti1W8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caea3f742bso365985ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787778189; x=1788382989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjM9GmdvyoqfoPm8mJ1pDYW08lI1V210DwwMkEe2Ph0=;
        b=ey0ti1W8Fqt6eYwkxHe8/9accoG/aNgjIXYvmPZwZjWWkgpJae8DwtBvi5ko7Xz7JY
         jCFCA3GqejcgkHhAAfWj64jyUAtjGpU/giFdlpGuHR/gLjM41wMggL0crZm/azQjq0WG
         LdzzzViCUwgVwSITo8N+t20jIlaGLnAs/9je5Pke4ogFvE4rBrrfXWDWu9W4hQ44mf5z
         RlsviL9MMd8QSjFYokQ8y3Vt3xnJTUoSZoZAEDTCkn9o83gdSQAo2fJh0JiMUCezOKfs
         xyUU7HExsE9ur9Vi5IxcS/x6Vy0eqdQHGTs8FxtHNt5yDlK7hVP38mfZiM7w8vFDjsX7
         Aw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787778189; x=1788382989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjM9GmdvyoqfoPm8mJ1pDYW08lI1V210DwwMkEe2Ph0=;
        b=qjc6ivLf8cXBxEBrPEHcsx05QJs6ZCkBZV4/a5JlHIiuqLiPDWuG8dXlMImrvcrEuH
         0VwMgvbwUJ2dV4TYV9VjruPziGV6U/IVtmWK6cdVrWJiEVdzff7ZB7Bfxo8RAHHrF56C
         CqG9edGBbxVhirD1MjJBu3mvohkGbP11QKDTDM0sz/0vGVvVwIU4ep6HFnYg+g3baOmC
         NM/4hI+ImSNkIolp8swqNRasX8c/x0t/finXU3hVq7OPJ9T11yB5A0JmMhgHg0fJBFlJ
         fe7a5GK3w5Mui/Q53wkG2Aorhm+HTPc7CYie8BGIHL6ErPslDPAxKLZn8e2jHRUXbYQT
         L0EA==
X-Forwarded-Encrypted: i=1; AHgh+RohYSEkdXuCyjonMwcsZjVbQWkBdoEWTI4wW04NgqLIAy9am4aSoDHtctjVjjqq6FwevpPdM0zLP7gPv7s=@vger.kernel.org
X-Gm-Message-State: AFuF++kOoeb4anWrs6XdW77tagZJX/8mdYMw+fzuXWVR8lKoi7k/AbL3
	OpIY/cc9Z9byHyIb1QWrErQSSm5Xv2POKpMFdhUgb4xYOYjKUsR2bABIg4l8FeSIcw==
X-Gm-Gg: AR+sD12J23S24xwCKVY9GvbGyWtZdAn96xRGtRZ7D8jldckeY5ksryeGVEAdeWAVlBA
	fQYXepNW3pNBzYyMgJqY6K+OQm5fJo3cnw+4owktFYNQPXg7uF1P0qAcMNNhiJtYfc9My2kVWDL
	lu/6KQ7XWRNcTMb55a1UO4LZThQrDyg2bcvGej/YDEXuTAH9F9e7ufwUVRXC9nXdoFtkbjckolJ
	n8yJUwyjtAV+K+pITYDW+xjf07zjiLVMeTMpOS8yTAtX0nSIBrtcM9hoQhYBk6uWZArC+YDwOM8
	4HqB1ArCfCG47WveCGS+IyuhwaSZWBoct4Ihk04BUmmg2SZ37i0XZKGps2flhST39PggjbYMbZq
	dAKCDq99BuTdrtbwbPy8A/HZVdk2UxIM0hFbwCE+gASp4suymbbPkWfpaTzVprc1whs/G+mrTMh
	DmJliNay0vmMN9Cu1piPTWhZb9P/WtqoKSmHxjBAjIIS88SwM6lMzVXoMUr0KLSuYYHIpduAeJP
	ai/TBOE5L1vAE+ZdcqEPQ==
X-Received: by 2002:a17:902:f549:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d707a501e5mr124136705ad.6.1787778188443;
        Wed, 26 Aug 2026 14:03:08 -0700 (PDT)
Received: from google.com (51.86.127.34.bc.googleusercontent.com. [34.127.86.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c1a0a2sm10897065ad.66.2026.08.26.14.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 14:03:06 -0700 (PDT)
Date: Wed, 26 Aug 2026 21:03:04 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, bleung@chromium.org,
	gregkh@linuxfoundation.org, akuchynski@chromium.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: ucsi: displayport: Fix OOB altmode array
 index
Message-ID: <ao9UiKAEtsyEt7ZZ@google.com>
References: <20260825234545.2076049-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gz09TSVTsWtWbuFW"
Content-Disposition: inline
In-Reply-To: <20260825234545.2076049-1-jthies@google.com>


--gz09TSVTsWtWbuFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 11:45:45PM +0000, Jameson Thies wrote:
> The UCSI displayport driver indexes the connector's port altmode array
> with the GET_CURRENT_CAM response after checking it is not 0xff. The
> port altmode array is UCSI_MAX_ALTMODES elements long. If the PPM
> returns an invalid GET_CURRENT_CAM response above UCSI_MAX_ALTMODES and
> not equal to 0xff, the kernel may crash with an array index OOB error.
>=20
> Update the UCSI displayport driver to verify the current cam is less
> than UCSI_MAX_ALTMODES before accessing the port altmode array.
>=20
> Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/displayport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucs=
i/displayport.c
> index 7067f2561b84..8d2032d0762c 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -74,7 +74,7 @@ static int ucsi_displayport_enter(struct typec_altmode =
*alt, u32 *vdo)
>  		cur =3D 0xff;
>  	}
> =20
> -	if (cur !=3D 0xff) {
> +	if (cur < UCSI_MAX_ALTMODES) {
>  		ret =3D dp->con->port_altmode[cur] =3D=3D alt ? 0 : -EBUSY;
>  		goto err_unlock;
>  	}
>=20
> base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
> --=20
> 2.55.0.860.g4b6b3295ed-goog
>=20

--gz09TSVTsWtWbuFW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCao9UiAAKCRBzbaomhzOw
wgCoAP4vqDkDyluInYvf3CtI7ierjfnXdyn9lyg3gLa1LpKzLAEAg29Lc21QUG3O
a/cl6MGV6xYVAH0zkyRyP62oiHFrmgA=
=CSC7
-----END PGP SIGNATURE-----

--gz09TSVTsWtWbuFW--
