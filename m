Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B302477282;
	Thu, 24 Sep 2026 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255066; cv=none; b=OGjOjxGukEIAIdtHS51/0mvHzHWKMsSZhnaeVr15YghNEPRPaNs9IfGnXhc9HrqRQY6l5GGgjdS8RPFKbrP5w5JBNmxt9TbAERDoOXAf/KjnXQ9BXsQWgUR5m0ITLZgwYrkuMustyax0KGv7ID8p4gE2vBG/U5E/zC4LTG5dWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255066; c=relaxed/simple;
	bh=rNu89Yhc+Z9bVkPK9PF6TItjbBoRfGHp7PDcuI7xSTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goWVHhEtYaKAiGpGd9ISoThlm2RL2M4n4bZ/TNBkdwmvuu5EdyuT/tuDnqayT6rpsAm3hMCtzuyIBcYhXa0O12h8P52LzRjEsnUldj4JD6qo0+cxoX8ghDP/+7BEXi9kUpl2BKl6VlPEJBWbjMcTCDPCHUiG5ACaJkv/rpcpsT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/9LBLXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/9LBLXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4C61F000FF;
	Thu, 24 Sep 2026 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255056;
	bh=rNu89Yhc+Z9bVkPK9PF6TItjbBoRfGHp7PDcuI7xSTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T/9LBLXxYdZbXqdvqhyPAafY9mUOQs/2jx+g9USrrlmRZA/52Cs4VCLIebSeKug+2
	 +bwN6+Ll2QeJ8zyL8JwstQVikYnYAgaZWMxVupL/AcjMhFaTz195dotVOLwrFi6K5n
	 Vw+lsw4wGSdNCsm3C59J6yrquOSfYhyzXwXdeRTrvHixYRvPvvrVgxdeccUD+FwvMN
	 MmqgRUYkqEHaQJWJRIqb/TRj+5b2Fa5OB48fFgCWkZvj0XtSLY1N85nwPnjmrjkLQW
	 Bn313gUP4nvTzKimHvBV0sTPMPuPGK/swklEI4CNYTM4euGWQ4W4Jpe8t3Zl8pgsNf
	 Llqb9IbGg+2fA==
Date: Thu, 24 Sep 2026 14:04:10 +0100
From: Mark Brown <broonie@kernel.org>
To: david@ixit.cz
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 0/8] Speakers for Pixel 3 / 3 XL
Message-ID: <249d5240-f2cb-4f1a-8f22-449a516e28f6@sirena.org.uk>
References: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G9ep3mMsX08Fo81X"
Content-Disposition: inline
In-Reply-To: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
X-Cookie: Oh, so there you are!


--G9ep3mMsX08Fo81X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 02:46:44PM +0200, David Heidelberg via B4 Relay wro=
te:
> This series address:
>=20
> 0. demistify the hex to BIT() macro and add left/right rx spk

This doesn't apply against current code, please check and resend.

--G9ep3mMsX08Fo81X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1H8kACgkQJNaLcl1U
h9BXvQf/Zmscl1waRO7LosF4Jp8xx7lD/0hx8dWhpFlqzU+OWTSkGZn2BKhBhSR+
pinNP2qKMK/tJOl8+eOldL4k1qvZGxMoa+GjAVXd09qxhb9T4tFzcpwkJZPI6Fd1
jvaX53YzGufycRbN5HxvcbND12LO8jPGrLnV0m+bi5vt+5XkQ1fNs6DGME8Zx8ns
1KPY13moMVlPtEpzoyY9y3A+n3qn3dLAwUFB7KdMPCKOdNGZwYpPHAer40tdVMZf
lOAXj+rKxewYgc9jGIN4fBlCgrzmVj0ZHjLr5LNhAA43BFnYqHVV0Ww7MKKxFos/
p1IBPVdjKwZouAbERZqTWXYEqP2MUA==
=cQ8a
-----END PGP SIGNATURE-----

--G9ep3mMsX08Fo81X--
