Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7529B47FAE1;
	Mon,  5 Oct 2026 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204809; cv=none; b=RoCVOsWtLvcKPA48AK/AaYB6WOZ97bPN/IR0AuCitgiTorPa8700NBqNNXUHH08gr7I0NSU5Us8C2eXal/QBqUhI9hfhURDG+ldijhmvB9ho7L34+BYbES4n1ef0GJHLbe+uhjK1VqzZgfxjsX8wGa1DNMouwRONoAewpYYfeRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204809; c=relaxed/simple;
	bh=2sv5F7Pxf680BSPdRURsepJj9zWVp+vNxXnfJ9PMA6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QC+001SM/HIuzBZUiCyPLVRARr05zhqpJgpby+xzwze8NerD05vttAREgIENQ1jGMoH/RWeg3ydS9MZOdvhFNeOxgUVe0+/i73NLCztk7beaGqtS5UdG4XtM5xDUV7xQM0RYxDznzf3M5mp2O/lC/o0vcYqFLjBRzaHJ7zRSLKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgi5/Ivj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgi5/Ivj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3450A1F000FF;
	Mon,  5 Oct 2026 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204808;
	bh=3sQT6X6QceSPrCLlADdIU0slrJlNjENj+tYDAG0hMlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lgi5/IvjJTziOPv4pWkq2eIPpRTeKeRx0a/dr6qwL/PPSRqFM1OKRbef+Zj9AF8h2
	 czhMJzE9wYqZS8If1CJuRTW6Z9pD9ByQJOQmMCA8p0tfGtt9/PRsqnyLbQUQKtW0g7
	 YQNnx9phrqbKBpcZBisGU+vHNDcrRW41EvV8tUPHrKS1Y9mXy5pRfaI3+1Ewgfhy+j
	 FcnPoAEfqrg52TDDVowectF0fAEzo9VZYPX+wVZEQjTTAz6qL0pruLYD8IHbWrWKcN
	 d66A05F81yWt8carVGJcq28FysexmxSwfwAr0KiqI5Kt11L78mtBrf8DJKmUvm4tH5
	 zEC9QcWakaDAw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CB1C01AC57CE; Mon, 05 Oct 2026 13:53:25 +0100 (BST)
Date: Mon, 5 Oct 2026 14:53:25 +0200
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the clk tree
Message-ID: <asOdxWlcjSP0DrB0@sirena.co.uk>
References: <ar_0GFOb5hZfhHHx@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tl67HfF8qNE+oEjR"
Content-Disposition: inline
In-Reply-To: <ar_0GFOb5hZfhHHx@sirena.co.uk>
X-Cookie: 10.0 times 0.1 is hardly ever 1.0.


--Tl67HfF8qNE+oEjR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 07:12:40PM +0100, Mark Brown wrote:
> Commits
>=20
>   d31b7d87d1b28 ("clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clock=
s")
>   488d2cfdf3c99 ("dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent=
 clocks")
>   9546425453234 ("dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define")
>   ea2ee01da5555 ("dt-bindings: clock: ma35d1: Document the missing crysta=
l inputs")
>   35ba0118dac01 ("clk: nuvoton: ma35d1: Keep the clock count in the drive=
r")
>   e92291a009f7c ("clk: clk-gpio: do not blame the DT property on probe de=
ferral")
>=20
> are missing a Signed-off-by from their committers

This issue is still present today.

--Tl67HfF8qNE+oEjR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOdxQAKCRAv73Ows9A4
iUHfAP0acweMjDdhiPkurKofK7gCLZN35aVsXYMwuF829qR7MAEAqhFFpEfRQVDw
Rrqdvnydig559DWeIWcGiXP9Q4OhuQw=
=bIRa
-----END PGP SIGNATURE-----

--Tl67HfF8qNE+oEjR--
