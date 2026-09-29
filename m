Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1E153A394;
	Tue, 29 Sep 2026 15:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694780; cv=none; b=WjzlG/ni1yD6qYzRx71i7dR4SGaX7lQK7109+JnnRb2nkHv3XUrUoIckdH+vgdCMeTk6fabSroJRJG0W+CjDGQCtnwLSzi0fGwySyB8yibk1G7iMM6yGL6iZtn0Nnkj7WU3gSdCg+zdiDqZKAsZP0M+ER0bYGBo/qKC26Tg6Qso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694780; c=relaxed/simple;
	bh=71gNwfxr6/N6vQIAikOqpfr/6urSEFtP0LH0Qflal2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biCem3OcGGRk9wWmCD1NqgcmEK/sIa5XYWRH0SRhFinGat9hAq/jdbLPscRCBjAGJIEvreV7D46RpDMg58g/itOKR8XTM5Qk/nOB2Rc/+bpScHEHcjRr5wajY3qZMuZQR+tjl0isxQpOogmex7/15jUfNWUUVjK32G1BzDVxMEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOs6TUNE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOs6TUNE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DF81F000FF;
	Tue, 29 Sep 2026 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790694769;
	bh=71gNwfxr6/N6vQIAikOqpfr/6urSEFtP0LH0Qflal2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IOs6TUNEwsMsxtzhByZCCG5v/hE1nOaCS/c7tzIOg0Z6nTOh2fmyYWrxqbb6mLNow
	 iKNNg0SZWY4DyQ6KtFIImMfj3fX67wu74V0lc1TTfDEWKgRuVSdaHZcYgl5Xw7gIfm
	 EPIB+VlN9vLUovkWDO7qx1MRfiGSfspqDP/t5sKKKLfgr6OwRWtgLktbGOQVvhtU2Z
	 fH2WADrabD7LoCH1VaDsTfHbRI3vVSm25eRwIl98UnnO8ZOzrHXw9ZIrLLoGb+5jKh
	 u7aySXzYeee7WL/GolIBcQc44SMzL+DBbGYgR870Jvgudj1UODeiZi7C7zH+XfX2Pg
	 eCC0goxHGE8/A==
Date: Tue, 29 Sep 2026 16:12:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 29
Message-ID: <3837cbfb-dc98-4472-b685-fc07ca880158@sirena.org.uk>
References: <arvTTZ5DDHpyfmUX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P9OMB+vPvsNeNoJ6"
Content-Disposition: inline
In-Reply-To: <arvTTZ5DDHpyfmUX@sirena.org.uk>
X-Cookie: 1 bulls, 3 cows.


--P9OMB+vPvsNeNoJ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 04:03:44PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Changes since 20260928:

Also note that I will be travelling to LPC from 2nd-9th October, as a
result -next releases will be at best spotty during that time.

--P9OMB+vPvsNeNoJ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq71WwACgkQJNaLcl1U
h9CpQAf/fWcGmsVousdIjMY5SyT6K5NtKvw2DX5VVjXQ/1kGlPHzfDgmDocI56yW
iB0qHQ2HOF2FIWzYn7I+fYi3Thn7IqCjV3XcFCF26Ra6kMOiKoylm6zf5Zg8yAmn
yoE9QIMTVsF+ndIbtSr0OupfS/1GhS5wtuoCKd5xOY4Pz/Z+XnRLF70NXqNQw89K
/dUjjCRnn0GeXxiTlkEn0yg5yNq7SjZFNaf4upYl6HH63UWZUs+Hl7sBMxWpZiyx
EFn9ANB4vMOoDQ0n8vPgnee8gcTX7P3jVAgstNpDJlQCGp1vQ0HwYBzto9ci1BUi
SyhDQkHTeE/jTpaS4/20V3/uMhwaKg==
=L7fl
-----END PGP SIGNATURE-----

--P9OMB+vPvsNeNoJ6--
