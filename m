Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624623;
	b=WXuq46hhzIKD3AYEPRaqBltwUmY9pVpBQ74rNKjqmdOAGd2c6qOsT+eJxfUrYudQVghJ
	 hWqxIzjga2e0NOjf+Ct10nfmj+yO8by/DP9YJM1CnTsbmucF+Ta6EgbVPHUeg5Vos82Tm
	 76hAEBIs4kKP0CbEkKD8N6KMzHi74Or8b9spMEl4UucjbCeFIYFHRrf/b0pn4Or3MeifS
	 vaEA3D4tUmeqN8ryRF7zQsfI0u0BcbZIaveped/bFgTm1MZqlHhRGquYc+yH1FYGVpuic
	 wWG8Dub6vNs0oPlDcK4Zvu88MrmoZHDiXzu6LvcFXAmgqN7DtHAL95uDfhWZIlJcBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624623;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=GhahHf/z9a1SpWspTc2G+jNJcATeYX6H/XNF5eqjU/4=;
	b=HOOi9d/m4+SeRupEseWxmmFalG7DvB73Qb2BqOIis0VLRkxIqwT1XUquK5TbrQJo4w+y
	 1NNIKuL3iXH6menS5KfwhaB6/xYujTFCctFkuuJFbENj3GHqlJSQ0pW2ToeOEDfyQ96WO
	 iWSq3MUqjYSYGrLKevh51PzffYsVXXYx/rTMi7+uLNFRyw2xc4GHn/Rwwm9ijkFkQV+f9
	 QpQj4Bt4ByX/4BXfZYSTidu4CXRV5HWBbp68lIDKabZGTPd1mbttZXBCF3lzQ0U9dtV7O
	 h+ZdPSYj+ikDCYXnae5gJngM5ZzoLNqNkg5eMlFDTxq38wEIhDItFaQfJJoYtUjscRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5U6CWpC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3BD606A32C;
	Mon,  2 Nov 2026 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i5U6CWpC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFF61F00A16;
	Mon,  2 Nov 2026 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793624623;
	bh=GhahHf/z9a1SpWspTc2G+jNJcATeYX6H/XNF5eqjU/4=;
	h=Date:From:To:Cc:Subject;
	b=i5U6CWpCflpR9ofnMvaQPwxaA5g8d00JLQK3yiug6hvpMsFqreB4fasgNjPPgZONj
	 2JsW/ee/4n2XYTZgUaaJXwayi/MPcZmqwRx6BKVxc3KbB0UVGF0liIBcsav48En2EH
	 ItMZx5P150YTEp7IJLHixDZl+A4kdbs4P83PgB9F72oasyfU0i+4sJAujY1dVyQh2R
	 Eo9v96uB39/6u7yQxb1KNVfIB4SSb1YNgCfOU1WqLlN+4KovK8JN4VLtB4quXy32KU
	 v/uwCjVUEoeD+xpigxHVjDBtis5nARmHypi7AhpyCM6EypAW9JbyXcnoQSB5/MyDy3
	 pQk9ROi0DcqnQ==
Date: Mon, 2 Nov 2026 13:03:39 +0000
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mm tree
Message-ID: <auiKK8qMNyXVpN5R@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="zbHLEATU/J4mGlGw"
Content-Disposition: inline


--zbHLEATU/J4mGlGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  cd240bd6c820c ("xarray: clear the new head's parent before freeing the old head")

is missing a Signed-off-by from its author

--zbHLEATU/J4mGlGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmroiioACgkQJNaLcl1U
h9B3BggAgdYIa1kei6n+A27k+lSrbSiW6+Nh5IB5z5AbwNkRab42f/eJOi7eWEn5
PhsVwjwKLPaRP7CceGnC8pelQX/FEOsLXquTQXm5/28DSj+utI22LOMRDGqhB2Km
xr6UQD4UUlLjmPSawogJ+TYow+viKj+5XWcMYF7OtrfPLCIYsJUkN6eMEg54vzzY
25A9DDEGiL9Ln1H86+TB4rfiVftf5qS26kHd1cUaYj3RgIjCLmc1X6AiFLC6x8ph
H+i8Z0Dvi3hwT4ERooYc9TbG0pEScYLN7K8WkTp/YtL29cDwicsG+AlX9WKv93Nm
eGDjaZ3xqXpueeI35VkAx3Tns11WLg==
=eC9V
-----END PGP SIGNATURE-----

--zbHLEATU/J4mGlGw--
