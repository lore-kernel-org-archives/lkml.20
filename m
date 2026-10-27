Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123238;
	b=ScxNZ/BL4+FDJmeqVDGu9mtZ/2kqUIVkMRvqwKAlwldgtc8mev0s2eC0Dk/bXjWIcluJ
	 tJ8+7W2yMOsVRd9uYegCXnz0x9MtThEqTUTBkEHeZjHhNhxFDLvFtNWsYMLyCDqcuSjAc
	 7i4mgof6v8MRlxV38odDgAZK7cAKqFfsswomqmbCIALZtbgvVt1BXE1u8WtSwwuFjJxo2
	 /Y3boIyNvUxjQQ6ZvbBAbH+JEYrnpmaC5InxJX6sbSlxFlp9OOcFLboF5dvJ+kW6HO9e7
	 T6G/EjFxgNp99ZeCxnHxmkfouJlMIIrklx+BxC7v1W24kmMkjHVvFdKWEFDmCsnhBYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123238;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=B0WmHqt0cscJHveslkVyUeUM8TEfsZfLiCkpxKjH9o4=;
	b=rKpfMITci/QCZm3As8KKyK0OKgpuRcdOCr7EoCVhx1f6ojZUa3QQdlGyZDtsJLc4GhAC
	 Oq2mz05DQksMyUrGDjqbOubitjW+MBqDKyRmWrp4CPqaHpXasj9NrSRGn8AQ5lQVw14lK
	 v6XjkI4ikJFy5f8GbSWDPAvPYhWjDaJQhjMDCWx9tIe01nznCHYQXPd6tvyxj1bt1hy8s
	 NCRXWNToafsq0IndcF5a21QnGgU6MKkAs/Wtcczgoh7inEaE14c1FrysLXlNS6aSPOHzV
	 EMoNtJU8J06UsZWLyaNJtl/bUos19v+9pvzZ8thOzL74pwEPtbQM8Hb30ELqrk4Fl6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kT6Hbttd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C29606A31A;
	Tue, 27 Oct 2026 17:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kT6Hbttd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3B51F01825;
	Tue, 27 Oct 2026 17:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793123238;
	bh=B0WmHqt0cscJHveslkVyUeUM8TEfsZfLiCkpxKjH9o4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kT6HbttdiBLrR1m3OW27/DR2kyYb/PWcfkWadakIG8ssY/hobR35DzdT4GOhBOvuo
	 Zm9Ju81O4rN//fkMnenozPvZH0zbQ8Cjto7FDT0L5EoA4DAvkded+7YA26fLyLpmPx
	 Fy9FLXNkZXDmkmv1cmvmRu9joGDqROC+iIgCyP4haYPSE3VcW0E6Ro1kWEanZQYKYa
	 3TzKzqiXVk64RQGt12mKi/ZAObBVpOOKEhUAFppTCDjxJ/6cfj1fwd9YNbo3janghy
	 CDem0JctUTybSZnjzMco5QwUb8SWqJU6lyKDeyQLdHpeQAPqYyhh66fpGiYG8kRZCo
	 vpnzmXfQXiJbQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 824171FB1AE8; Tue, 27 Oct 2026 17:47:15 +0000 (GMT)
Date: Tue, 27 Oct 2026 17:47:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v4 1/4] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
Message-ID: <auDjowGAJtxOMmOj@sirena.org.uk>
References: <20261027114634.79706-1-clamor95@gmail.com>
 <20261027114634.79706-2-clamor95@gmail.com>
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
	protocol="application/pgp-signature"; boundary="+XHv1W9dviYH0tpW"
Content-Disposition: inline
In-Reply-To: <20261027114634.79706-2-clamor95@gmail.com>
X-Cookie: Whoever dies with the most toys wins.


--+XHv1W9dviYH0tpW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2026 at 01:46:31PM +0200, Svyatoslav Ryhel wrote:
> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.

Acked-by: Mark Brown <broonie@kernel.org>

--+XHv1W9dviYH0tpW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCauDjowAKCRAv73Ows9A4
iW/fAQCXV7KhjzT8cE6hGtVt0/Qz500eVRVBYFcd/8e34zrE8wEAz4g7C/8qDMia
2VHHW4qZ487dgQRJU3Mz6UhN4KU5Mg4=
=UbbV
-----END PGP SIGNATURE-----

--+XHv1W9dviYH0tpW--
