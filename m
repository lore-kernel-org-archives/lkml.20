Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A365A47FB18;
	Mon,  5 Oct 2026 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203409; cv=none; b=Iv2hmINOks9rBSetjrU6QrmnsfOFtB8A+u2HB15k+uhfmQjjU2TlH5Nu/zIHFKDwawThTwwrh0CbF3YzX3MuD0+EayoIjKAoqSfUUWCSPAe9VnOHdLPVbe7oW4XSqKOl+sjssWHinlXNIzBvLTiZxgdbtnpL0PmfjlxdNVTQHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203409; c=relaxed/simple;
	bh=w5qnpQIVi8E3GgamoNv0O1pqB2TilcF/fGeuUw0P5Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaLEnbdBokPcA/6YwJ1IoKGZein4wAnyu2GCuoA9a9/Ri8Do4kqDazd+8YBh+ytuk0sy2L42b26j2zQ8n+hFS13iYtqmi+2dNyJFNdolMtPqetiBg3Zo2gSWy47uEuYMEl33vW39ti+S8Bwx7WmUMw1+kvu2v3gAu2OvGWC3bBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW1CZPH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW1CZPH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277401F000FF;
	Mon,  5 Oct 2026 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791203407;
	bh=w5qnpQIVi8E3GgamoNv0O1pqB2TilcF/fGeuUw0P5Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CW1CZPH6IbffrTN3hMqWcGpEpLxGwJAH88GSfzenntBMFM+JpWaFz/cCk32P+3zv8
	 Gv2NYOFdfvKiKBG2U+Grn/xnRErHnzhE9HTSbnQBaz8QTPh8D7Tyqk8lmuJz3/r+ND
	 +4L655sf5NlB36xVTS1dB/quuXOdDnKQ0hDPrWoiMx98B1dSKBH0Tj/mKAhwTD01jr
	 4UmaHPgSaBQ+LYTnuKdLxPDGmGir+u0XhhdhQ7VjZpkcRDUT8ioOxhL17esQK8XHYm
	 qtSKjCuWW5NkyFHGmtYCFRXtEFzhIS2/JhvfeLGbhxDdh0Y9gHgGc39gqUKrbjbhIt
	 4ROVYTCOh8YZQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 499931AC57CE; Mon, 05 Oct 2026 13:30:04 +0100 (BST)
Date: Mon, 5 Oct 2026 14:30:04 +0200
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the landlock tree
Message-ID: <asOYTIMx_4Grpzvz@sirena.co.uk>
References: <asBE3Kc-zUsT46XS@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="29I16veZJFmi+nBY"
Content-Disposition: inline
In-Reply-To: <asBE3Kc-zUsT46XS@sirena.co.uk>
X-Cookie: You will forget that you ever knew me.


--29I16veZJFmi+nBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2026 at 01:57:16AM +0200, Mark Brown wrote:
> Hi all,
>=20
> After merging the landlock tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ld.lld: error: unable to find library -lcap
> clang: error: linker command failed with exit code 1 (use -v to see invoc=
ation)

This is still present today.

--29I16veZJFmi+nBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOYPQAKCRAv73Ows9A4
iXs1AQDdFuzaygP7szVLd0DTJFlGyLEDEhJRuIq7B6CtQVLtyAEA7tucCCHmTmZI
l9kQMMCIiK+XfXfVdoNt6PojoCuzJgU=
=zXHR
-----END PGP SIGNATURE-----

--29I16veZJFmi+nBY--
