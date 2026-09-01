Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BF481A9C;
	Tue,  1 Sep 2026 17:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284567; cv=none; b=T/D11/LS6ZpUAJpJ00oLKe4qEFFPbPZyMjnFnyAKoYoca6bJDjvAfhzVyu58KRvqoOdAbfH25BUqE5cO1xlkPJ9XqbzJaWX4B1jvYEX7VNw+N9o+nne77UA4i6wwAu/jNBR8jpVKs6MSTcgMjl8huc55HXIjOzQh0RwuDNzHKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284567; c=relaxed/simple;
	bh=AfX2uy+VIvyqDSC322w2j9bfTrGkts6R+sJwGWFx84s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJuzcIfaa1V8p0JDx83oYvBr2+Z4Bb5FixJmuKaiobbMniTUZzHVd8VpGmrVvrrxKiQJQ90CTxjKWmTgfx955iNSDMxlrMm8pQF60ZIfjauE9ERTDy6RnsR9iFAi0LUsvGRhvG9/YoJxlDrHkm7dCPYo0B+9e2YaItiIInwbanA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mzp42zTX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mzp42zTX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56DF1F00ADE;
	Tue,  1 Sep 2026 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284565;
	bh=AfX2uy+VIvyqDSC322w2j9bfTrGkts6R+sJwGWFx84s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mzp42zTXd8gD5doZ/JTFfrgws4u/Ety7fJzPvZTr0SATyXarmUVLEmh2/0/eTRtLq
	 SNNIdLlFIc5npkuSUhsdlYrv21yetQmTOCaXIHFfRq8UR7hTo8jk8CprF7BwdTK3YM
	 xY6j+Eyccq4PKQJD3pt5WKzzSvOahVP1NiKBCccbU99fa2vM+Azt2g/rL/k0go26Zr
	 YyHSY6k/jb+UY9g37vvNOArh60y8uuTdzI+GtjWKZVuLxbJWMHB1JCN0WS0g0QkMPo
	 DD/BSEfyhbEb0TN4Hhgd5/LIqnwq88/lM8MZkyI+d/b9+XqZkiEUaoSUitrAHQC2IO
	 ydz0Pi8xCKvdA==
Date: Tue, 1 Sep 2026 18:42:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] regulator: dt-bindings: mp886x: support mp8864
Message-ID: <20260901-lavish-crucial-21ee0a54a5fc@spud>
References: <20260901043123.5401-1-jszhang@kernel.org>
 <20260901043123.5401-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yPYItfSrEh1qLSCT"
Content-Disposition: inline
In-Reply-To: <20260901043123.5401-3-jszhang@kernel.org>

--yPYItfSrEh1qLSCT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yPYItfSrEh1qLSCT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcOkQAKCRB4tDGHoIJi
0kZ/AP9Z5Fr+XuI7A9d7KuLIIzRqEk9k+T5lMxvXyv7/lHjg4AD/X2CTTsdYryd2
jxxfmvyAE+799QbUufoKeTKo6m/viwE=
=U4O0
-----END PGP SIGNATURE-----

--yPYItfSrEh1qLSCT--
