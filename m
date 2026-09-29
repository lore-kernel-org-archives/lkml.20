Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE53D6CA3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660880; cv=none; b=hlOvqH2RsqV7tlhBQ6tA/Zzi/F9yqlKH/pm03r4oCErDl0INAmY2Onj6ENDrpLIdXTvBd5xMi6VbWSpi0LSFQbthN3naxlyxeWBrqRTGOWYyLKpPsjXOL3d1b4piXoVutQXQgxNlotSapBtxccjqIr1dZtmVPbPTpnxRi9Zz2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660880; c=relaxed/simple;
	bh=CDuQm5RAa6fP2MiRVZ5uOBH+aWa5eA70HoXFhMlM++0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUJkytVD9PrN6hjkUxeFx4Czqb94h0Lmb5+WFdAYhZIbthaArOWNruaJ5426kH/4c/GLoEDFAGDk6TNb/OmUNujGRzbeiqogY87fOcZE8BCw/iscaSBjnTuQjc5Nzc8cUUSGoif7YWFYrSUTCsybHga7n4LfSYH07ye+GLhp/d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XZrcfOYd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XZrcfOYd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso13029805e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790660876; x=1791265676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JeHGaTR7TjIlYYRqp+6saqTg4D2/subzB+Hz3wyrU48=;
        b=XZrcfOYdRhbnMLJUcCaxEvlSWRp3JLGsdf0JURztGy48sU4Q/szhhNG+MdfGNq8Vd2
         wlkFBE2lU28L+cUzGdBI5/zAxwY71M39XYhiVq46nP19o4r8xjJ0VzfT/CEEycstFvep
         bs1wdffWPpnkBrwtLqbUD1+Ss6Ahxm9m6/e0aIAmZ8eigj6cMmIMF6PYftWeKXcHeC+w
         XmKJbAstR7i3FKyt9oVZbvitnKglyQCdDge1Q9iLpTNOW49Y92QFtu8dbknGuIfZrLSI
         +0Rbx16VpjrqyEQ6+CDjPHsRPHqODsgHptzdZbWW4idq8hMjqeXcvffdRqCE105OFnnt
         4twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660876; x=1791265676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeHGaTR7TjIlYYRqp+6saqTg4D2/subzB+Hz3wyrU48=;
        b=2u7iDw0QAAvDVBWNFEhBjNtzGvwLa9u53rrldTkAuPo0buG7h6yKv3dRzhnyt6eI3j
         QqU0GaOh1kCXMoc51zGaVClrtOwAIMxoAKCZJuNxJ/0ncKQH7TqLbCSh/mgZfNidB/ij
         /qunrgVVJq7S3pVuxWOIG4A2E5QpA4Dlye8zMnICWwbX0TU9UIL8/vPvoAe+gD+lipQQ
         Xvv6fqMybkZMIxcnY/ixGgqUNGNfOyFtE+ORLggqlREC6w7vSr1WMwXSFM6QnrcthLgt
         nDQ1vEEKflT65imhQUnJvMIaKuNtauZ9ewaT9AZf5+F3T+fosMdugJ8w67/zgIdZwbUk
         Xo9w==
X-Forwarded-Encrypted: i=1; AKwUvByzbZXM3I49aOGQna5pfIrzcvMkNSeRax03gRhasuvQuwJJGRKx1FGx99qLP4vppbopGbZj6ivNmM5tmWA=@vger.kernel.org
X-Gm-Message-State: AFuF++mBijHElTs8KNFSOSKYOgxTPJ0KeqiY3HaGUlmSWyB5qp8iiu4U
	geTarWqRYkCdFLrtF/o/D0adOG5g/qo6ZxAdbMsb29Bu93iwcooiz3TeF7A36aA6ZnA=
X-Gm-Gg: AYBFou0CNHPrUAVLf70RxdQumHy6c7TRwvCGl59QptpR+dxsaUzX9T7Qbv8JtCfkWmn
	5bG5guF3HNZtUS2Ab4g6dqAJDgn5pc19vwMY9IYTM52dhHicDAp9FvKqb+K1rwPKJYNyq90CmTn
	XJvUVdAP32ytHRNMNKop4s3hvXqwxGzpWV0bHw6RdObOjPZkxHgKcLpw1EOBeUYNpvdZe9Gowq1
	GVBU2IrOsy18XzppaEQqJQN9BzvH2xwKtBoMOvDTu4Po1hVbgFr6hMPMp5ulEJshLSA3rhvStyL
	owCqkR7uLTXNp2Sex1FxMnJzxhw/e9pkqOQg9uc3qzOj8XwPHl9Ycmc54XqwrttRQC2daRiSSbV
	a82qEz9vJc+ku/9Od9Z/eRS12SDu6z6Ecrus6wn8Kj7cLkJx7R/wh2uXn9nQiBFod6b6wQsgITe
	W36Tz4gEsS83ua8zsJiz9wwwjFWql7W2lo4JdcHkI28MaK3DAwmhr4P9jEzWKU9YOcmBaCIcRPp
	NAd
X-Received: by 2002:a05:600c:8719:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49fe66c8a5amr268539955e9.7.1790660875688;
        Mon, 28 Sep 2026 22:47:55 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00cfafa23sm47009155e9.14.2026.09.28.22.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:47:54 -0700 (PDT)
Date: Tue, 29 Sep 2026 07:47:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	Bradley Morgan <brads@mainlining.org>, Thierry Reding <thierry.reding@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
Message-ID: <artQhFRifzEj-DJd@monoceros>
References: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
 <20260928215127.1811259-1-dakr@kernel.org>
 <DLRA7CWTA1K4.K2BCBX8MBNHQ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7i4xitnibbpezyka"
Content-Disposition: inline
In-Reply-To: <DLRA7CWTA1K4.K2BCBX8MBNHQ@kernel.org>


--7i4xitnibbpezyka
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v3 0/3] Add TAINT_DRIVER_OVERRIDE for usage of
 driver_override
MIME-Version: 1.0

Hello Danilo,

On Mon, Sep 28, 2026 at 11:53:03PM +0200, Danilo Krummrich wrote:
> On Mon Sep 28, 2026 at 11:51 PM CEST, Danilo Krummrich wrote:
> > On Mon, 28 Sep 2026 18:46:01 +0200, Uwe Kleine-K=F6nig wrote:
> >> [PATCH v3 0/3] Add TAINT_DRIVER_OVERRIDE for usage of driver_override
> >
> > Applied, thanks!
> >
> >   Branch: driver-core-testing
> >   Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/dri=
ver-core.git
> >
> > [1/3] docs: admin-guide: Handle TAINT_FORCED_BIND when parsing /proc/sy=
s/kernel/tainted
> >       commit: f1850e443b0e
> >
> >       [ Fix a typo in the commit message. - Danilo ]

Oh thanks.

> > The patch will appear in the next linux-next integration (typically wit=
hin 24
> > hours on weekdays).
> >
> > The patch is in the driver-core-testing branch and will be promoted to
> > driver-core-next after validation.
>=20
> I've picked this up, as this fix is independent from the rest of the seri=
es.

That's great, I will make sure to base the next respin on top of that.

Best regards
Uwe

--7i4xitnibbpezyka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq7UQYACgkQj4D7WH0S
/k663QgArBi4fVbOIlKZk9jI0WbkAw8kxGQecc/jC1cqoY0MaDRRd1R3MJBHFZGS
MtcolDGw4kwFN2gJDPkqm6wzBYH6gUNJD9K2vN4/pq7O/w8fwGdkql0URAkFP6d8
+bAvFqIlphHEVEkTazLtRTqrb/Lc7j08r8AqAlYfaZj04Z0152PfoIUGvjiWe7vw
AFHstULjtwUOQe6VvJTIjwwec0KJrPkcFMGZRroIi/iC6AYeyH/QIUUyBAK9S2Om
Vfw95aqzvs1k6lsqx866tRlhXwoDW8YvQWWxKyKHM/yktT/Mjqysn0rEtiFJP+Px
w/WI1772ODDDblPFv3khxpm6c03A8A==
=WTJ9
-----END PGP SIGNATURE-----

--7i4xitnibbpezyka--
