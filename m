Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433834;
	b=3Sbs5YRokyi5SxTmmto1pPb06zOb7zcVoKHxXzZbNJUlMC1ggYa8kSu2MUh1BaGZ4zLF
	 Fce3XsfptyP/JW+INYeuSBSjDymarW3ZR7CNu3Mmbxi7bJhIPxYOjnQfZNwOp+Omjp6by
	 I3bq6+P3I7Bk7bwLPB8xPXvUe1hJ7525tXNqnvFNww3TqTddWe6Smwnvr68m+I5ji4OLE
	 Y0WSGzocJ7yLBmv2bFgIORk+2ozUqwnxLEog84bgjnfAkOoh09dGYK/5NCxZhYahq0yEC
	 8f96RFtDcygFy19G4RIfZQHOyL0dO3nTM8VKHrTw90o5lea7k03vNvZR6jbMq68kyvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433834;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=XZTc4CuHXJBV/hC587TVfDbMB2dmU8UV+xmsRZMnudE=;
	b=xLMWmiCV9G8HQw7Mp10mkD+LD6rFaKzQhNGP338TtD4y66Y8HzdcY9zcTFG1ib3M0N1E
	 RCHz9v8inLhd90glQGgeugk92xBBi8X02Tzk9doMrUXF65R4k5b0N0MDOBoVtABX1q0kx
	 GrTQphWph0SKfFqEyHVyiKCWadGWR+UmiVPNfuKElnZ7l2/5GsmI9m9Lmjd8cNtUEcxUY
	 KjhYMVFapPEiaaBHOthatUa5TR/VIXt9KdxdBjNIr6VuazscYxWp8p35dIIRmy7f0oQ3n
	 paFK4n1I1jqVQmNUDPD5CMZD7XZ6ah2BihJVUczf7iFArf5z8AjqO7YDTKUFUsViQgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bc9tWQl5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BA606A319;
	Mon, 19 Oct 2026 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bc9tWQl5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730731F000C4;
	Mon, 19 Oct 2026 18:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792433833;
	bh=XZTc4CuHXJBV/hC587TVfDbMB2dmU8UV+xmsRZMnudE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bc9tWQl5EqQXFhMpiKnsm7ZtGeWStFVXhI6mG5bvKl0iEQ7CMzvhyG3lTM0+QCkNJ
	 Z9JVu/c7GWvXAxf3yFh6bMNsQ4GofdniJALVXcabCzl8yugk2wTfrrFWNhe3twQGAo
	 7a1zFMUETRpmlDhJ5ihgeMWbG9NL8vnxVsdKxuUAkpUmXjAHJRL9But//87SS127bX
	 jGnVxbC6Hc6ZpU/UJQnGKl1Pt3tS+ol8DRGhr4bLluB2m864fCE1bl3bNEFR0nkWiQ
	 SqMBN/z+ZgY0L5rSu6MehM+RoMRmN9xAxn8E8/Rbt9y/RLlaTTEebtr26rTN0nZzJl
	 PYC5WvV91Dzxg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E11291AC57D0; Mon, 19 Oct 2026 19:17:09 +0100 (BST)
Date: Mon, 19 Oct 2026 19:17:09 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the landlock tree
Message-ID: <atZepZTcoR9teu-r@sirena.co.uk>
References: <asmHRyx_uDkK-tJs@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="QoAb88aGW0F1Eor2"
Content-Disposition: inline
In-Reply-To: <asmHRyx_uDkK-tJs@sirena.co.uk>
X-Cookie: You buttered your bread, now lie in it.


--QoAb88aGW0F1Eor2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 01:31:03AM +0100, Mark Brown wrote:
> Hi all,
>=20
> After merging the landlock tree, today's linux-next arm64 kunit failed
> like this:

This issue is still present today.

--QoAb88aGW0F1Eor2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatZeoQAKCRAv73Ows9A4
iT/xAQCeDhBjpXVMEuMGwbVw1o+W08DpxHyk2ORvF97svbCd1wEA+Yv+0CHTdRVC
tdBtttkOukYIjQsJy1ePw2YfCmC6eAs=
=j2fp
-----END PGP SIGNATURE-----

--QoAb88aGW0F1Eor2--
