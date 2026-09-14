Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE093ACF16
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370565; cv=none; b=VRnUAt+tyWvZp49qzVTRFz/5HnyEpKK8FS4yyzunH87uAbRFq/iZ0dP4/YrVovit3TXyYFj0AP/c5olyE20HSTvvtSex5qn3LS1ylqqITi+igTRuAFJvNxCG4Wlm4/6flR3ondtLNX3t5eUBw5dr8ZHjq9HsKsMz0oNWwuR/c2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370565; c=relaxed/simple;
	bh=5NBVtwAK0BAoXDnntVPQyaH3IyuLl1zCV9teA8E6PnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qgp5f6DJ1jmv1dNNnTRk0yN53/McwkFWvSjKD0cPgeb/HyYFdokxnNuy2erArAxjQFwjbrbde8swG10pwDzON8oHyOcNANlVJuJKMIfqgXhKBTzZG9EFjv5MQe2GX+agZnJ+/Ovrp627eyK3nnN0MwpwOpNAQrmEEg9v7I9oD+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lqASA6ZL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lqASA6ZL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so6673635e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789370560; x=1789975360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5NBVtwAK0BAoXDnntVPQyaH3IyuLl1zCV9teA8E6PnI=;
        b=lqASA6ZL6Ht4dMepBaEUizpDJdypfAn4OveqtXpPdzI+asgnuwR3FZcyXJpR/biBMa
         ZqVqH3zi2YGRv51vHLbIuSdljhEmyXKFBxI04Y/G0Fws57Iy5yUHtfchS5G9BtkmgfkN
         nmKflFrYmXi5AVS/LrvtenmC335VoJHn8cXd1zmzCwAME61eZZ+9Pk70vCffDb3N15ak
         RFJvZ72usOyFLLzzRFS3P+v8yqay2hYJQS1kQV4LjndudZ0ng9YiCro5j/KKXzDg2SuE
         WNkF3dK1FHbV4aKMrPKzZmw7HiMCkPy9WKUiVt0FrAj5x3Jgsop5eN9OVgOEvhChv7ZR
         bkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370560; x=1789975360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NBVtwAK0BAoXDnntVPQyaH3IyuLl1zCV9teA8E6PnI=;
        b=QdCwWDYW4KbDvmr9ak9+eUKxmqr8CIYtvDFis0L9a6YijWiujOqUn/g3yFOoIwfa/g
         O97CWONpWWfeUB4uDlV9NmedEgkldwTyjThwsmZY9qIff+3yJFjKiIxhQNXOM00UzRDF
         WMFvunY4gU9Lm4Im7UwVevOrGIfrOPYEoeHN4oZjyS3NVVW5AY+m8qsaHMxL9bygVY15
         MNmxozqSWcXfeh8bruJiSHDta4zzIcFLjJeP4FTZgzeTLUmE14t1nXfLAtz+MuISXyRn
         zrXM/BSkj7y21igBYQbQPfbLjuRku9GtzKWE5V5EL2IP0o2wAAdc7f++P5/Ozk7WyXAZ
         ceKg==
X-Forwarded-Encrypted: i=1; AKwUvBy5jRhIBAhBYlWu0qeg+CE9RafjXcn1p6Bk0r5K3hQBl1xcDBbagwh7FEk2nocrSsa/Y9NhPfzcZLtT2Lw=@vger.kernel.org
X-Gm-Message-State: AFuF++nHcv6LRMau9v2h6NRFGSNEFwOGeNTqWPtBROII1tNA+WjUeSex
	u2WUTMjqlCEMmPpZ6cvJZZnxxAhciKoJI1YuDgL4C7CE1A7n/CLeBiqO9vvCTKizwdE=
X-Gm-Gg: AYBFou25LKSfvmiZs10t0fAB5wRSirZpRrsBjlp5YLfP0IrTcvfFEKcIL6zgbWFY3nD
	5zC419uxYLIXF2IDF+FpB/dGhu3TMcM4Zi2Zah7AWynQltKhR5roYeMVj6zZeRk55g2ChmQIR7q
	Rr5xjQvrpchiCAgoE2gdpFvwk4Jp2cizAjuGEoym5v4wAOFq8x1pDBDNYv3Rj7/TGsACmisU+Ig
	1LEa6YCeWFt+eWyItCvqeYcmUvjBdg7fwRgplmbIH6RRlqlIgopDjjs+UEoh8CaafXxxNRcuYVQ
	7N337RR6K6XOsGUDhQibawbmgE9KZTHtYfFnMi3omkGPrPHfyO5mkKKlC4h5yZcKYVzwEtJ+Aee
	ZgYXubo5JhbksRnoNUiASwHQItIbQPixzKuhWDeUAQaMKjjbZbMM9VrcCUU739FWSH+Kgb60mrf
	0wUH2OHIzFgGGrPHp9Z20YamGTPNRmo8jN68rZqPm+6i1s5JegkUxW1JSxO6c8yX7NoTfnOsRy2
	zQwCnfaIyA6ofUSSHAzKEXQwstVTzRYohCiFFPR4kvR4GXwL0vor3Z2hp7fHg==
X-Received: by 2002:a05:600c:548b:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49e7a6625aamr13720395e9.8.1789370559823;
        Mon, 14 Sep 2026 00:22:39 -0700 (PDT)
Received: from localhost (p200300f65f19a904d5c06a7863c841d4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d5c0:6a78:63c8:41d4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e71e300f3sm198482485e9.7.2026.09.14.00.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:22:38 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:22:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Saravanan Sekar <sravanhome@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] regulator: mpq4210: Drop the mod_devicetable.h
 include
Message-ID: <aqeghbaA5yS8aO9R@monoceros>
References: <20260913-mpq4210-ohms-fixup-v1-0-dcff627001ff@vaisala.com>
 <20260913-mpq4210-ohms-fixup-v1-3-dcff627001ff@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n5ywwnv2z25hkbgi"
Content-Disposition: inline
In-Reply-To: <20260913-mpq4210-ohms-fixup-v1-3-dcff627001ff@vaisala.com>


--n5ywwnv2z25hkbgi
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] regulator: mpq4210: Drop the mod_devicetable.h
 include
MIME-Version: 1.0

Hello,

On Sun, Sep 13, 2026 at 11:40:18AM +0000, Tapio Reijonen wrote:
> <linux/mod_devicetable.h> is meant to go away, and this driver does not
> need it: <linux/i2c.h> already supplies struct i2c_device_id and
> <linux/of.h> struct of_device_id, and both are included already.
>=20
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Link: https://lore.kernel.org/r/aqRMb8q7BT3uZ9iF@monoceros
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>

thanks for picking up the suggestion.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--n5ywwnv2z25hkbgi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqnoLsACgkQj4D7WH0S
/k4GpAgAokIXS4bLfKhNIx0SshCZ9XhCw7DHg6bS5Zez7NpE6GsOiajjl2CUZKPa
HjSkricKdreGJm/mQI55gxYkzXrQ+p3dzX4M0+MlWFjbfLhyPddiOfPYze1k3FpS
A2EsKD8LOGUYCs+DPnN2atAfVSy3JlMEU/mrc0Ckx3JQHQDx+yPUdVLeLxtfkATe
D5Aoh5jbeAAX8jsPiRNay4V6x9BSCYXl5DlI9n3px3alDtYlUZqlOc8AgLvo7OfX
2ilFZlWwn1GvnCYsOhBlRB/G16rKDG0Pjgyrh+ZNu5JanTIkap0/DWWESsebHjqU
d03AvoYE2P0vIQpZ2zQmNTK3e48I5g==
=/zv7
-----END PGP SIGNATURE-----

--n5ywwnv2z25hkbgi--
