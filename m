Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352081;
	b=kzzfpNmld2iOqDPIdJX6WI6CtVcr5MMGoACAZrSE9Httxpt7wjvv9YyO4eXEMnz72BCW
	 H3i/GFaX872AUOpIAbQH5TLd3ksUBUP6NzfHsvAJDLYCsZ7Ez/a/WP8i6S5k8GP86RF6G
	 1MLNWsB3Oqf2tJ5QCyaP046vscPkdmQh67UeETZYV/pEdGmjEwTgC3qy6Ba2EbwItfHmG
	 cblAepWaUkiZLX2VdCH0VCJqHNB3DQQZlXQC4Vx9NMSrdTADktS0li5phDc5vkfMtkZZv
	 RHX8LPJuQV7FIGzoa93/Er0nbKD2bQvycDvAXYWCZxUiS249uChRi7ISwFq7+ffHa0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
	b=EoD2EpiCIAqlv54xygNlXAAiSmGkaz5u4ba461QmnpcfM6jsF13aAfFmykyQFwhIx79C
	 f7PE9myCxomAUY8kbdK9xe/CKlFtXtkYu5jkibjyHQccCTNHQ/vSPl62UZ1OefNXn3kMh
	 T2XqtUSclu5YRQdFXevINf9/VXUbCd34M/WbS6J06d+ugLy7WoayGIhHVFDkESj1EHRd6
	 RCB3xpd/hwhypHwHW+h1gLmOZQdnZFIL+fl3Ma43V8ORxCRaveCGc5b3WJ5H85kGdL3I9
	 ms2EcPeXP8zDnmPAvc86zPUc7msis/z2yG0bEGAVEROtLtC0FE5TP739UPX7ETHn6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cB+enRwR;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01ED606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E01ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cB+enRwR
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so2002551b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794352080; x=1794956880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
        b=cB+enRwRz6g2iMFhWCN+NyL7E1AO6er0Uz04tlmujKHtWpTW3sbsKxIsF2nNshn2KQ
         R/IsJLVsVB2M0SoZgJbbNAT7YutCGpjJZEIGmETz87FmezkNL6hO+TJc1lV1UHxZ7PL/
         dELK9iM+xfYCLJwCG6m8348YZ8Lgzbte8JgVmQgsgkgakpk5b0cTEN9frHWpnOXSF7Uz
         J7zJ9xXsM05gmNYaFTjsc44pII3UwQuV6mc7XrQw2I99ewJv6HpDnURry4gVYpVonZTi
         Y9cycn/rp5inNEfHIeVlNs2yQ7S9NHJANDnIzFfC7C9eocEC/a/ICf601fDjR5/X+VuT
         lNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352080; x=1794956880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
        b=LbMWt6b3Q4j1MKwe8VbLTfXfe3iuZ80MiKX2h3MUln/+llGq3WKE6UD0qbYmN532Jp
         BHDWdD3rhf+EkNrLHDOz+/hI5xvew6XAj3zoZYAXq7cXLd4Sp3+A55mJlcOg29GThLiz
         pljfgTgz3T5CnD/Eh6CUNIegnO3QJ2TevBQAYkz0AbpJktkhhaBr9o3HPbx/qUJBwGcq
         LxwseGJr5bozlTZU6DMPx5wOVWgu2bI1sRM+0Kfi+xil1KPWtIqJmc771ULfv/FmAK7h
         XHG7beZwIEkHWUJImOWq1cdjI6kMkfUw7Dc4nkJO/YaXZtK7roNWIxf9M/Dmul0h2/pp
         /BwA==
X-Forwarded-Encrypted: i=1; AL+hErGAeOXukY92A/QWDpBK5NiCSNSskdjggvyrySMwbJR78uBlC6Ydvgx7nM41ZZXgGLeKlTj/kn7TOjTdlrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c6GPsGWf2CBjQ/3gviS3Pz5Fs9LfbfD9uWH5hqBz4DfAZpP2k
	NL0RW7Eapn44g7yAQmLk+wwFEeZOyHpX7HaN3s9yBBxRzjk9INSibqWabjQP4c06KQ==
X-Gm-Gg: AYBFou0NYDCJN8zqS/OJHPcF/0EgQE8aLq8oI4r9a/92Q/ouYoQ+PuGHgmMKhY0GxiX
	7G9+wuc/+ratgr652oyz1IQZbgjAAXdOpMw2ZzY/U6y+bU9mRTrSP7ZNEYHzvqA5mJSW84zSwNR
	rSttd6n9j1GTvEnoaBHcZ5thIyIha5dXmYjgn1k7ob83+0DNsIJtvyxiQI1aPI4Q462NdSy/cKH
	hR4yjlgRrfiYJshlhax9/3vsMGYxarWYxifJtldvGCtVIp2Tp/Vcy/7yPNeJ/EgSHF3YQ8ckF2k
	Yecs7JPc1tNBCqt+IWuSu0Se3U+Vaqqgsc6eJRt9KNjLWeVNHhnCkSJEbTz4506lQcn7EUVA90X
	gFLYKyZ+2X4pUvppcdQGJT+AE0SPSq0YAkfUKPHgNc6PRCdV/bdcKqLuw/HKuwDF5L8r3vRHIDv
	ucSpRJnG16klienZM5rFANL01MbB7pAmXLOxeV3ICpgi/TyXYlN4L6AVEsHzQE8nz6906R9xBB8
	/HIMsNJJDmKnC3l+F5HcAMUTOP6RMDK/jiOGei2HvdZ1kRex9jZDaIM2mghDMs2mPg0XA18vGcK
	cHbyph7uEzbFDs2QnCyydnU95rb4py2lm6shqSDyKweWUMM9s4YnxZRQDHnRRcYPlnhuD5vGgTE
	Lszhn/AQXUn87k5r6AJPBSrmTY3EkIMqj9SXPn9d4zL0MWFJ9RdtFzQAmOEYVcKynv+x4pUrbAl
	8C5zSryXhTuDkdAg==
X-Received: by 2002:a05:6a00:2290:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-8bc1c2a9279mr528151b3a.44.1794352079387;
        Tue, 10 Nov 2026 15:07:59 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa506bca4sm1426781b3a.0.2026.11.10.15.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:07:58 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 10 Nov 2026 23:07:55 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 15/20] mfd: Use named initializers for
 platform_device_id array
Message-ID: <avOjy_fN7YtF3qfm@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="19MCwox2Lta4/77f"
Content-Disposition: inline
In-Reply-To: <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>


--19MCwox2Lta4/77f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:40PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Also drop a tailing comma after a list terminator to match the common
> style for these device-id arrays.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/mfd/ab8500-core.c | 8 ++++----
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> index d5602b2f4a0e..8638fc8472f7 100644
> --- a/drivers/mfd/ab8500-core.c
> +++ b/drivers/mfd/ab8500-core.c
> @@ -1252,10 +1252,10 @@ static int ab8500_probe(struct platform_device *p=
dev)
>  }
> =20
>  static const struct platform_device_id ab8500_id[] =3D {
> -	{ "ab8500-core", AB8500_VERSION_AB8500 },
> -	{ "ab8505-core", AB8500_VERSION_AB8505 },
> -	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
> -	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
> +	{ .name =3D "ab8500-core", .driver_data =3D AB8500_VERSION_AB8500 },
> +	{ .name =3D "ab8505-core", .driver_data =3D AB8500_VERSION_AB8505 },
> +	{ .name =3D "ab9540-i2c", .driver_data =3D AB8500_VERSION_AB9540 },
> +	{ .name =3D "ab8540-i2c", .driver_data =3D AB8500_VERSION_AB8540 },
>  	{ }
>  };
> =20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 96aac158fd8b..3c7e7f1efd0f 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME },
> +	{ .name =3D DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index e74936ac206f..385121867da5 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,8 +435,8 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397" },
> -	{ },
> +	{ .name =3D "mt6397" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> =20
> --=20
> 2.56.0.rc1
>=20

--19MCwox2Lta4/77f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjygAKCRBzbaomhzOw
wvFsAQC87smEjajHkfFGbCeGY6Cj/9mvC0xw3nuIrtpr77YwHgEA6ablXqCzLa70
BlcM4GE7l2ZF2r9VzxPGW7WUD7O+TgI=
=nN+Y
-----END PGP SIGNATURE-----

--19MCwox2Lta4/77f--
