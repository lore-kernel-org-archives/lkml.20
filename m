Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541484B5409;
	Fri, 18 Sep 2026 10:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726335; cv=none; b=s0WY+xrE9bTk+IZdx8xzECvitnL8YhGhvz4hKL9O9yEbEZqLIbbbYeUWEVe+PqWkqTULCYwZr5YB8K5XOUnYaotnnWqADCVz0JuuQgETtYIET/KQnI9/kNS6u9q71tJlNX7o9/CxSIJW2/ihGnpbZnX5gE2yStJ0FwA3VkMTxJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726335; c=relaxed/simple;
	bh=Pt1cke3CLObQrYz2qqjU7Zf9MlmuF0TI7eNOZ4I4vIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+3uEIFruJo7LI3MkyGFFH5How48F4kKNRXiGu84AsvX1yQtejmyFe1s8xFQAbggZbKsOCj3mN63sYuBOLT8ppf5NteghXl34yzUyIWF2poh5Zsc50AaoHsrXrh64J+JBYDUQksXT6un810VYsbdhzxtzHm0O7aI9QSMNJkkPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiV39HcW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiV39HcW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D0C1F00893;
	Fri, 18 Sep 2026 10:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789726332;
	bh=bBzIZTXLbuSGJU4gy/OmKtQhw84C0Ie8W4f3SHToX+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GiV39HcW5PXF2oPhAD2lcax6Ppyjl7xDnBvt2fXJ2aSIZOVP0ob6roqs9vfr7lyya
	 +/oRzs2+uFUHpTjUDTzC97vlJLgfxi68xgE/BLKBmkANgf4fZGkzyOoGJcXrK1nKjl
	 FLQSyTYYbkPMNm6QLlaPQ7vPhl8Orpdpp39PZG3uVXQgpr+O0CGDqON7EN5S2HPPDQ
	 coITKsezQs7EcYj1+T89UE4GppWDLOLbXX+oUCX+2It0wn6SWK2cbKZ0/RL+N7DUab
	 khaX5HQ8YRRdFwwA3dAniTrV+QCZrFxltdCpGdVwJRP/KPW4MmXfLgBZpx7Gmp9e5u
	 fyeCKQFLJe5IQ==
Date: Fri, 18 Sep 2026 11:12:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] regulator: add regulator driver for the Nexperia
 NEX10000UB
Message-ID: <731ebfd1-4080-4343-afc7-95af081a9990@sirena.org.uk>
References: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
 <20260918-topic-sm8x50-nex10000ub-v1-3-5afe06bace03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N5WKgnQX/Wzww4uf"
Content-Disposition: inline
In-Reply-To: <20260918-topic-sm8x50-nex10000ub-v1-3-5afe06bace03@linaro.org>
X-Cookie: Dental health is next to mental health.


--N5WKgnQX/Wzww4uf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2026 at 09:25:39AM +0200, Neil Armstrong wrote:
> Add regulator support for the Nexperia NEX10000UB dual output LCD
> bias power supply which provides programmable positive and negative
> output voltages mainly for display panels applications.

> +static int nex10000ub_of_parse_cb(struct device_node *np,
> +				  const struct regulator_desc *desc,
> +				  struct regulator_config *config)
> +{
> +	struct gpio_desc *ena_gpiod;
> +
> +	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", 0,
> +					   GPIOD_ASIS, desc->name);

This is GPIOD_ASIS so the direction might not have been configured.

> +	if (IS_ERR(ena_gpiod))
> +		return PTR_ERR(ena_gpiod);

The binding says the property is optional.

--N5WKgnQX/Wzww4uf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtDncACgkQJNaLcl1U
h9Dyuwf/dZMKKFYpFNY7fri+vtRcVkLdrirMZhn0H9L4QFsUACH9vAOK5fTdqsR5
v3IqCEGNN9GuLMCldIsXTjoRIq4j81aoCzGzO42AWHj+I/0pOJDqh9ZVSvrc/+j8
kUlFy/rdD+O3itLXJIt572iVcoXIgGDOJrySNEQa4POgloDWgUu268s8SOVlcJdy
JkPI++oq9HOSnzFyhz+DmwV//6QLDWpR9opN8wQHwM4BW57SvJHVZRAv/6EZycCD
WrpzblJ1RgjOZSzT0Vq9QS37elu/y9795nJfr110yFIj0e7qVUpBL8JTAKPuK8as
UNp3KpYQQIrKHsUzZs1Y2b0xv6rqMg==
=HJjm
-----END PGP SIGNATURE-----

--N5WKgnQX/Wzww4uf--
