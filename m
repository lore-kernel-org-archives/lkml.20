Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A455381AE3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444410; cv=none; b=uO+rKWKeZnCeAg/YxCR5mjvMKC/NPEyf9vScRElPQKEYvNdukSJU6UL3BSl0gibLrrARpRegYCXe8C2IQ0yLSkKcFHK5YZH9awFEgtvdmsW3tLMwxgBV0ClnbDij+mZFRAQFy1LOPNxMaGU278FKUuJPIDf26bl9IOLzdtrvORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444410; c=relaxed/simple;
	bh=KcI35c12z5q95Rm/Z6go1CFkLzgkS8reg6B7PXUNWtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoThbiVllOqNLilLxXMrf8Pkv7K/RyXGwdz6e5nqi7QkQNo+0GSUaVGTHMFbkuIriuUHdWl9v4W5hnGqHOuaoeyo3MAXECLHXOTygYvkh7Lyl0x5v4uohiQr3FHxiP3S2TO8oS1Wf8PdGzp9K923r2OT7mswIU5u8Pr47ghAe5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kVmoeyKI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kVmoeyKI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so9739925e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790444405; x=1791049205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wn6j6zoykw9Mi7voF2h9tDDCeeyDt+Ldwjo8Wc1yS3g=;
        b=kVmoeyKIBYlc1bjElDmKlrmpPWSwn2YkhUQHWzqD0L7X6Wb0b/3FCqRboa0P28sy/g
         ba/x5Q558vJgqXtR9qnJ1PRbl4raQsEnHM0QIPJlyZoqFWd9An0RdTjYzLuhFnHU306F
         WTTmUsIff2+XDjjK39DZ9rD7WoXjStN7PjUEOjIxzqTimjmf5/4CUH+y/hA2nmsz4Y4h
         7G+GNZrerPS6uqU/laGvD6oQoo6cJras5y2V3qoE1DTSF8c9PqM3WC7h21Q6ZrAImZPz
         XQ1zbnUChWr93F97Dx9C92sTWnU+eSEGJ/XgQ2WJVXA4IW33nSK3j1XCrKNd5NjzztpE
         5gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790444405; x=1791049205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn6j6zoykw9Mi7voF2h9tDDCeeyDt+Ldwjo8Wc1yS3g=;
        b=BuI7p/gdF0XrRNhTncAH82ARAfI6vJztXszH4ibXAaLss3Q6R3yUtEcxG++/w3LkF7
         s9bQaTWCjuifPly8WIweteu66NOcmmyTriyeEP7+C1y9ztHhtbWKt8RJ3IuBlEjPtjkq
         07HY1zHnEBoyI/XS9cte73bvFD3P3CltL/s9Lnh68ZYUEqf4hCLr+JH0CzyV2dbx0uju
         z2+DAxY//4OJalUxke16QLifS1MAe4WCfnM+DueLLfIxY1je0+H+NGtvseoa9RSGpDBu
         rpkEHkWHnouPfz4l8L4RyvHn0qE2GQv1ZXF6Dlz6LTWBv2vLvE9+405M+87u1E9rT6IE
         19uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLoP3QgoBRJuh99Mg4cvo5a1/7TVjN9x6bkgchC4hO6y9d/5JeBQIv0DzyL9W2QOLVGgJsh0Hsdb1xEdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lKhiX/M+1VZAedyD3xqqdF0dxCbF5PXUuw1lDWT0u5/LHSEQlE
	IyvHmZa2fOHm3a7q4tA1yEbSbF7k0PfJOMpdaCuBFE9ZC7K6/qT2AonzUvgqz8WfaEk=
X-Gm-Gg: AYBFou0ShOr0xo2j9bDS1uyfbNEfVef/6SSK1gR6wSVldqk8ijxR187fr/oGgTnBYh4
	wPuKZBxioyMU5McuXn+2imshLqzq68qLnjvCzgU4MURV7S1w2PhC3doYlqWMwP4hFHGA6NCbifb
	2hg2OcwK8TRO3zRyX37ch9hm7bkj12BqRYqsYpszX4WPVqQ3U/OAgP4sgckEiE9uQygN/s3vXIn
	gDj4NW8cIjEp7vfrAr4/cpe33DYcVguAo1p2HIJN6oC7nu12jooqjeq7l6sKDDTf5owRj9rmf1k
	eDkRkQpIbwA34XZe4jRggXPLkva39V276anPpeTQtz8kDMm1maSp7SgeI5aDuVSWnZgjpf0du+Q
	wQT8W3sRrg1BJZhY0CHlTgTCShttkgvmpYi+GjNLhEVE6J152jpCeqEi8x7jpMyDE6wqel/6+vP
	zn3fBeC/VYcX101jOMFoVK41gHQJPU85zuQn3AwNl0XuTMNiqqVssnZi04m3J2CwWQQlRhzMUfu
	1DU
X-Received: by 2002:a05:600c:8719:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fe66c6373mr172397205e9.10.1790444405527;
        Sat, 26 Sep 2026 10:40:05 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm258213585e9.3.2026.09.26.10.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:40:04 -0700 (PDT)
Date: Sat, 26 Sep 2026 19:40:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	andriy.shevchenko@linux.intel.com, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: Fix section mismatch with CONFIG_MODULES=n
Message-ID: <argClwhgQyMkeq29@monoceros>
References: <20260926163506.487201-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bagdw4pjcxz5xbkx"
Content-Disposition: inline
In-Reply-To: <20260926163506.487201-1-danishkhateeb03@gmail.com>


--bagdw4pjcxz5xbkx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] serial: 8250: Fix section mismatch with CONFIG_MODULES=n
MIME-Version: 1.0

Hello Danish,

On Sat, Sep 26, 2026 at 11:35:06AM -0500, Danish Khateeb wrote:
> Without CONFIG_MODULES, __init_or_module means __init, so
> serial8250_pnp_exit() and serial8250_hub6_exit() end up in .init.text.
> They are also called from serial8250_exit(), which is __exit, and
> modpost warns:
>=20
>   WARNING: modpost: vmlinux: section mismatch in reference: serial8250_ex=
it+0x2a (section: .exit.text) -> serial8250_pnp_exit (section: .init.text)

Isn't that a false positive because with CONFIG_MODULES=3Dn .exit is
discarded and so the section mismatch doesn't matter?

> The exit code never runs in such a kernel, so nothing breaks at runtime.

Ah, you found that, too.

> But a function that is called from both __init and __exit code can't
> carry either annotation, so drop it.

I thought __init_or_module was the right annotation ...

Best regards
Uwe

--bagdw4pjcxz5xbkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq4A3AACgkQj4D7WH0S
/k7ZcAf/UnktH4AMRSBuBcs2lYd0LhmDf44H5AO2Llu7n67f/+lX60ZuxdAIzivg
GogXB1QhoqopdhMl9ZyBjWWv7jxZUGilxC+UOMc6QmXjJnnEdaSt/caYqYFNXsWy
jZHHklFgCuWOGy6hN3P7jQI/lzGEt7H6PFsdUEEB9ke1FYWARROuus36BaPh6pgc
Wtk17h4GOJj7o4m0viHhHyZiuCAC1JHcgYTE8fBss9s+IBDWcHm5o1C8JnywKBD7
dxgowsGpwQcgt8nUulmBn6LIEcrYZFZeiSzrLx3zdRglkD8X/TtgpIlLnK0L2i6p
OHTcqXqUrCAczTI1bc0hNar+e7ZN/w==
=ntAv
-----END PGP SIGNATURE-----

--bagdw4pjcxz5xbkx--
