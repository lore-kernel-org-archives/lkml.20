Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01AC468C34
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760201; cv=none; b=BnEQcPD9Zoe8Xhx+Zv8o1gbjKf+Y3ozwAUag6E1Yr8nz8cNFSuG/CKHLrhoykYBLAHaz9l7JnYSVRg5Ug1VG8PmbzBDaHENtWKEbbLFZoTIX8nnyx8ragMomjLk1C/b3IiDGPhXsLU9rVp8Ge5YtFq+w1t3L7HjdsvbhFHuzhZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760201; c=relaxed/simple;
	bh=+16QtwDq1//lvFyG9fKKvK26/1o3S9Jzkd2YP1TMJmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxIEkh2r3MhIobD7+PVtjRlI5asu61h6sYYoOD/sEzHQaC1mFyxNZFT3TEZeLth6U3W0QupXpwfU+NnEplk89u0Irx/XThgPHeAdmVvZAdoM9FQ0cXZIPsAezlHs7NFvQLso6ynngRnMzWeDIhJN+1cOwekCmb5nuAwv8fncbgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kr618L/p; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kr618L/p"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso1071519f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760198; x=1792364998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcUFAmvYC3+zqJMiUlGkPj1hBaQn7R6Mw/mFH4fX6fE=;
        b=kr618L/p+ZINapqGMbGF02/Ysz0CbeMpb7EqJMGBHe/M2zJvzSqpOMYmjq+dvbt2jE
         aVNnlZFFf9Q9YPxy4smkFUpQczEpamoZq5OpQWAz/t9VtxRhWm2kRH1bNReo5hwL+kws
         VSO90mVzUoQ59eGzsYwsyqonndSrWoCXWDtKvseG/RI+3W+yEcLiOLaZ6EbiK0+rMOGq
         iX82R6U0wyAJKhdAT8HMC73/Kt8rFudQUzstIhiZzNPQyt6BE6dzLEQtXveYV2g59EWg
         pcujABMX/8sv2wQv14EgWd8afS/uFYQB569W7PoOB8kQBh1ceUmPGHPRPHJQb1Bpd4ih
         T4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760198; x=1792364998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcUFAmvYC3+zqJMiUlGkPj1hBaQn7R6Mw/mFH4fX6fE=;
        b=qMPWl9Ksg2+Zr7EZM7Ls1aWeS+7V2tRQ7XEkn0FHZO9Cb3HwUcY8P7JXkr1hMCut+5
         l5tpKHbm3IR9aWRe4CjzbrY9fOYqfJFHk1BRu3Xw6MpELlmw7gqJqTpbUu6Wo35TlgXf
         V5x6noZPADj3BzR0Pr/H6Y3bbk9HLu+b7nkju2fuddlwQS5gsHkF93k3GDV7Vkog9r3e
         Cw6dxF0ER/zWeGFViB0oRPOBGyThP7fVpoDiMtdUIuvxFUkGyDWUfyQGLEoNQFRBw9KQ
         Yny8qoe6QU7QZNVtMfUsihzqE+DQn9RWosaCbjIiExW5s4v2P0COeF3QrSn1gXDi/4aA
         CsFw==
X-Forwarded-Encrypted: i=1; AKwUvBzPWli1wcOmU13H5DI+khqcjOaQAQOjrfLkmNlYxBkDfJdAjt5yhTjGvSWi6P11ND6AgJuV/Q6Q+2QR5a4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTOgpyhkHqGYw/IagHXoizVtc2b+dPIPGEwDrjxp/B92M2z6G1
	A9fRef7mJ3EDvpUOPOlzAzeBu0ZIYty8VI7OdeyEcp1MomyIHSingpjQALECCeLGFXY=
X-Gm-Gg: AYBFou2WYhohLMgXh1ixBCsVY5KInUIw/Uboy91L6qvUUIi3fuq6AUl35S88xR+xzUw
	iiBb3uS9pZOMlsY3bOfojr0v9jJetzCbHhqX5xTpdcrykWOTP1rvfPxDSzwmjEQnkbnrhuIQqck
	jkPbFD+u6rNnU23F9OtEP5myTjn1+RXOv1ql0zNBmsLW63o4QMr9lVtsIjO1uZswxHW+o4geR7O
	Sraxn7FoR/WXkv0e3M8scvW1+XCEc6q51o2MOxGMlahWwOyhrRbjPwhbm9Wjmjrfjt2U0KffEDo
	ihj296PeZVW+jYq4OLf8Au/ED25ODmGHlihAmmnJ7HaYjdRsNsi0J4pRcMW9ocuZXmBQVXuNV7/
	elxeINuWpQo1NFJfheKrdNBpe40nzNAxIK1SmQyjUv3KK9Ph8VSqG5CK2/8LwAhjb9ky/1fFY0e
	O5BrA/5FczAqz5ywu/0CS+VMTyLTCgO4g0ATObT+T7pOfepX9bTkyyEsGFEhp6i8V+PnJQS3WiT
	RNW
X-Received: by 2002:a05:6000:491c:b0:488:8751:e78e with SMTP id ffacd0b85a97d-48dba9bdd09mr15386734f8f.16.1791760198010;
        Sun, 11 Oct 2026 16:09:58 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48db97ce3aasm16619964f8f.21.2026.10.11.16.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:09:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:09:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	joshua.crofts1@gmail.com, error27@gmail.com, narcisaanamaria12@gmail.com
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
Message-ID: <aswW2bAapx3318Zd@monoceros>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20260929184900.39515-3-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="prqxuytw7zq4oius"
Content-Disposition: inline
In-Reply-To: <20260929184900.39515-3-abdelnasserhussein11@gmail.com>


--prqxuytw7zq4oius
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 09:48:59PM +0300, Abdelnasser Hussein wrote:
> The driver currently relies on OF/DT matching but lacks an SPI device
> ID table. This prevents module auto-loading on systems without device
> tree support.
>=20
> Add the spi_device_id table to resolve this and ensure the driver loads
> properly across all supported platforms.
>=20
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/accel/adis16203.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/=
accel/adis16203.c
> index eddb786d4747..905485fd556f 100644
> --- a/drivers/staging/iio/accel/adis16203.c
> +++ b/drivers/staging/iio/accel/adis16203.c
> @@ -11,6 +11,7 @@
>  #include <linux/iio/imu/adis.h>
> =20
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>

Nope, please don't add new users of <linux/mod_devicetable.h>.

You can rely on struct spi_device_id being provided by
<linux/spi/spi.h>, alternatively use <linux/device-id/spi.h>.

Best regards
Uwe

--prqxuytw7zq4oius
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMFz8ACgkQj4D7WH0S
/k6kywf9EjX7GsElJJsb0VH6miyI4XnlA671jxyreWl8IzCOm+VoTZxx4dp8ulcN
IZJM+szmAKlVq77vFMB9/ZNczuPCtQAf2GDlu70aXCrTKpgg3d4zRKYTjdKNg4x5
y2Z+7nphR4rgx2zv9rHu1h3ErB7O3AI5Idxm/DnSQLHQ1ORNeGN93ZcvErD6dJxX
s4dcRXvOHbNpA+sN2h+2+pYX7gxj7wFoVFKX9IgHTISLs9g4/0KiU0o1xIi9Yn7U
oHCFngN6yZuI+20/ccHX4RhZ9EyrChTTkQL4ru8H+TU/v9L2Dl6B3aeJQAafr1KB
lQH0fT0VphJojd3seU53jPC80txX/A==
=MAFV
-----END PGP SIGNATURE-----

--prqxuytw7zq4oius--
