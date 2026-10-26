Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023408;
	b=3f+6InqAwkkTcAQM9umW2h5ERM+eFRuGji5obYVGEqskKG2E9avQP5eEFqJlyq5GgH10
	 vioVBmVFUP0IsWKxZjXGm4xVt/t+FxnAGUROrbKQcR6WkRrMrVBig3TJ5KhWvN66p0Vvy
	 6QEcuIN0gDH+0fxXVwHbeS6iotvQnCImeDXr/9hqjWvylUmjJkGdU+FbRWFcNvuEOb/3G
	 tibLFATy3iMFDNP52OfM+ZU1xfH2qxMsRmxKhUuI8YqedI+X/YVNE6Ahc9U6fqpSx3nLG
	 rsrz1h3OTHzmoN4wEpGhCj5nlWwZN4oMGXjfrXF1SxcxuXDWhzEuowPy/M/2e3AdjZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023408;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=YhILP7rHDWnLkp7QI8ndd/GW3m0K/hNub+wtq6q4zB4=;
	b=AS48HCn4wglR1qsWgBctuV1cgPnX42sYLaU6uAv9YdweDB8OqbMEaVmIA4RVWQq6DoTS
	 E0Ck24xY0pe31KutJK73YY88pWmDRfQwpOmBVsZoVVSMaOl8N62ZzzPTUqYQ386usQHP7
	 zEdelkuEAh5ye3d8eTpgdlIFSp9hjX83703guW9OHqTlv4p8gABXRNUDWzrO2v1XoNuTq
	 FqDz5pjZwyAO2eNbfyEQQHAVJ/36WJ4tFGx1ixKW5aMlbvHRwHrcQ88WA8ryp3G/EYLix
	 qWVKU40ck1Ii5+OAiNlJcu8Doo/AvYTpVTDfn7yqVtMS3iejC+ldVSDwNdrVh7ymtmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPvwCuzv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A87606A31A;
	Mon, 26 Oct 2026 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPvwCuzv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58931F01829;
	Mon, 26 Oct 2026 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793023407;
	bh=YhILP7rHDWnLkp7QI8ndd/GW3m0K/hNub+wtq6q4zB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oPvwCuzvFa0BFA5ALCmiyl6ULUHdWNydDikVxAUcmudRy8OlSWuP0Ee2ZjjIxNtRT
	 DPd4bokvdOkV9yuV91+HC1eS3Go8cqQJhTXlqzIq0nT9/eb5mMz+dGYNnARVHF4xDi
	 ES03ssHpPbBRmhZRT4jdzZkSKY6yguH8dc8qUMme1/Oa1vMogNSJLM7S9HwO6ppJBK
	 MpbmpaIXGnyb1cEFL2wINZR7wGaVn4WCeFKp9mEfhw8Vla449FGDa2FQ07EJ5lGTPw
	 PAjd9VmBSf1IM4CWXxyJsr+UQ/jA/MPElac+R1ZSObFXo8W4BIxxbV5vR6mHwxx2gU
	 uEEuKSVq46QlQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AF9E71AC5994; Mon, 26 Oct 2026 14:03:24 +0000 (GMT)
Date: Mon, 26 Oct 2026 14:03:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the clk tree
Message-ID: <at9drMPrv1IvPovj@sirena.co.uk>
References: <ar_0GFOb5hZfhHHx@sirena.co.uk>
 <asOdxWlcjSP0DrB0@sirena.co.uk>
 <6ef47587-5d3d-4561-b0be-f906fe48c8e2@sirena.org.uk>
 <atZqw7pdZjMwahdf@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="7LTfCSOg4+A54S6r"
Content-Disposition: inline
In-Reply-To: <atZqw7pdZjMwahdf@sirena.co.uk>
X-Cookie: Don't let your status become too quo!


--7LTfCSOg4+A54S6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 08:08:51PM +0100, Mark Brown wrote:
> On Mon, Oct 12, 2026 at 08:01:34PM +0100, Mark Brown wrote:
> > On Mon, Oct 05, 2026 at 02:53:25PM +0200, Mark Brown wrote:
> > > On Fri, Oct 02, 2026 at 07:12:40PM +0100, Mark Brown wrote:
> > > > Commits
> > > >=20
> > > >   d31b7d87d1b28 ("clk: nuvoton: ma35d1: Add missing WDT/WWDT parent=
 clocks")
> > > >   488d2cfdf3c99 ("dt-bindings: clock: ma35d1: Add missing WDT/WWDT =
parent clocks")
> > > >   9546425453234 ("dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX defi=
ne")
> > > >   ea2ee01da5555 ("dt-bindings: clock: ma35d1: Document the missing =
crystal inputs")
> > > >   35ba0118dac01 ("clk: nuvoton: ma35d1: Keep the clock count in the=
 driver")
> > > >   e92291a009f7c ("clk: clk-gpio: do not blame the DT property on pr=
obe deferral")
> > > >=20
> > > > are missing a Signed-off-by from their committers
> > >=20
> > > This issue is still present today.
> >=20
> > And today.
>=20
> And today.

And today.  I see the commits were actually done by Brian (CCed), who
also appears to be a new maintainer for the clock tree - I guess the
contacts for the tree need updating to include him?

--7LTfCSOg4+A54S6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat9drAAKCRAv73Ows9A4
iZArAQDWTVKyxLldGDc/jBtJEySFbzGzSi/x6DOUxq0O8zTkLwEA5/90FDlVl/x4
83HghkvqRE4Bmr2cBkXOB0OP9IhXWQM=
=RFrq
-----END PGP SIGNATURE-----

--7LTfCSOg4+A54S6r--
