Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674166;
	b=OTo8fjMpvPim7ZPlkOke5vmyRqudylUi0kpAlLZbP2Sem8kWzyidttz37IUI0elqtWn6
	 tez3hUlH8OO1AGwPOL0ggw12Y27xLoJckp597NMNAh4eiFOs0aNN1vPEKZZEJzcOViGP1
	 DHgo5pb/EhKAtKu36m3R/bCvBLOVUrO36vWdzCaToDsT8Qt7RktvwWp+wJY2aXgAyGIAm
	 mqJg1SJh9zrRVOotvspXMq+RbGUv7TwPsvIP+48wB4jf/DlghBs54jwzlHGhtrR4D8YHq
	 zyN0w3bigvWtZ7ejOMFvGQu70sAn8wDCJYh70TiScopkhnGQG+7MP9l0jNvy4JGIVkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674166;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=96M0JIlvrhHNlw+ZNOUcukuQxRAaeI8eUPO/Z8lpA0w=;
	b=uWRO2kAE7xk4Hj+m6eKQEYKaZy5/Wz4WveG20CP/icaQL3tmF5vHbTgUwcnnUhXmeuKy
	 6ne9G6kYPBvxz1pZv6Se7zEUvv6S8tdTZEOoe+TlWeOzqdkGyVw2XCZlJ397fxTe2QJmG
	 0/j22ZFXYoXC3CjulBHyL6bN31d2KUyi0T9wxBJZZKaTqOR2A6px0SEgkjytCilrqWDsm
	 4kbzno1i2qzeUL5DLB1BuiOYNKvtT6bHTIKAPH74NqYqdNs96JTTh+6p6hNwNSvC+NZ3F
	 DqpHRq5V0160iN/FtA0DgHMNmvLPRSjBnJ7NPy7p5Xi+bw8wu7gtQQRD6hbsr6nkckA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JnH4qfUA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E45606A323;
	Thu, 22 Oct 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JnH4qfUA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EE61F000C1;
	Thu, 22 Oct 2026 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792674165;
	bh=96M0JIlvrhHNlw+ZNOUcukuQxRAaeI8eUPO/Z8lpA0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JnH4qfUApuJIDbP1YQ/lGkgCUJyTg7xLytYDWjG2aNGzKGgl/o0yfhdKmz/V3vsz+
	 opsAi1FwxFKkxIxAlK0SLNBJaBc+k6VWeL0nksgS4RQoxWIxqAizaQp9evgIM9rVDG
	 Y46CUnOc5yMAj5Dbinob8y2IQkbrjHlFKkOB74hMkKwZlN38N4kyVSAkMJ0+zyEOLc
	 MhGhNK8ewnDfQlqDmDvxu5UXZoMIzkpq4243PSKyZmhTHmWjMkUt93zM8q4HsXOjhY
	 FJ9nkMTOsrU2en0ylK8fx2IBXpDRluY6wrJU4qzIckNenDWUnXsGmg9yJodk3hkeS9
	 AOBTi7koOvHyw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id AACC11D0A3FF; Thu, 22 Oct 2026 14:02:42 +0100 (BST)
Date: Thu, 22 Oct 2026 14:02:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] ASoC: qcom: Add Shikra IQS LT9611UXD EVK audio
 support
Message-ID: <atoJcqd4koWDnm0C@sirena.org.uk>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="A23nRkldlVRrisnl"
Content-Disposition: inline
In-Reply-To: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
X-Cookie: Whoever dies with the most toys wins.


--A23nRkldlVRrisnl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 03:13:08PM +0530, Karthik S wrote:
> This series adds audio support for the Shikra IQS EVK board variant
> that uses the LT9611UXD HDMI bridge as an I2S audio codec instead of
> the MAX98091 codec used on the base Shikra IQS EVK.

Your thread got mangled somehow, patches 3 and 5 aren't part of it which
is causing a bunch of problems for my tooling.

--A23nRkldlVRrisnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatoJbAAKCRAv73Ows9A4
iWElAP9+lBGYkEsXYsymmiufYYnhLWggTbi8kQe2JYHhjpIK2wD6Arlj3ULsJDS/
CKgxkV89FJHZC6ORXlBxeq0QcizQ5g0=
=9kxs
-----END PGP SIGNATURE-----

--A23nRkldlVRrisnl--
