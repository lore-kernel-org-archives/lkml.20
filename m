Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21863B0581;
	Mon, 14 Sep 2026 23:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427301; cv=none; b=aVxDyLleDwJtJas3W/y4FhclA0Dhm9AqIXaYxGsEowFKrlwaDO5RcCjsl3K0SParlJ8cszraaR8ynobXFjrEN5vMYzgWjyISZdZ0qfjt/q95vTJBUpiZE9M1fuNvHfOtc+1dHWAnz1pp34hNpaE7iTQ1olgYR1LK8C6NLrBlCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427301; c=relaxed/simple;
	bh=0kd6U470hburP/a7YVVUprf1DLkWd0LKevkn3J3aRxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkQwRkfUkpwBE76ASKWmj7UsteDUlpxMxpBpxHNXOlqCXBktoIuUtwfsTJP02dI6od9m0M6daVL03ichjDgRAGanAmW5cz6FdRg6IJFhfSPvGhzIvR6xry88XtKZwLrsnqrmCsFPNdx5WzGk6xg83W1P1TPAGHVp0SrtwR6QQQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIL3Tx/1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIL3Tx/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957F91F000FF;
	Mon, 14 Sep 2026 23:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789427299;
	bh=+JwfP4y9dWX2umGppJpN343xctgJroMcZ6+wN0r1j4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IIL3Tx/1/cExYPHaIpyvy0J20exmoyCYxZzxIY4LpJA+2wv7mpvHrm+To0Wu6soa3
	 LjLEeQVmzDiHS/nYbtWkAWfjfPwNbD7QumCG5aVX/tEH7wLHAeKWMvCmDnFm3JNVOr
	 Ioq19vwmpwdeyWShySn0KEdelCgDpTPaqc+ZkoGX0hq7GDwwWpglahnDfsfn3Aq9xd
	 mKNywz3Is8AOQQcrmLqzCE35WvjF+HCJQsYLRD+ciqwPqsWRQUGJYCyzcD/9kgoU/K
	 BJf/rjNhu1Dl7x5Js38YAkbP8kkX7K4exLPUjdHrD8RnPgRgvpYQN95ALbShxHLp0e
	 3Y02aqwuK4z+w==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id A238F101088E; Tue, 15 Sep 2026 00:08:16 +0100 (BST)
Date: Tue, 15 Sep 2026 00:08:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the arm-soc tree
Message-ID: <aqh-YO7Rqki2ehLb@sirena.org.uk>
References: <amY1zEUOGFe4Op6W@sirena.org.uk>
 <fd352f58-8100-4b0f-ac8c-25b08d0e2886@sirena.org.uk>
 <aqgf5o_gSUQH1AF0@sirena.co.uk>
 <b6ca14bc-a4f6-477b-bbb0-da12d27b61af@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xp+J77/ykdLTk1ES"
Content-Disposition: inline
In-Reply-To: <b6ca14bc-a4f6-477b-bbb0-da12d27b61af@app.fastmail.com>
X-Cookie: Orders subject to approval.


--Xp+J77/ykdLTk1ES
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 09:53:00PM +0200, Arnd Bergmann wrote:
> On Mon, Sep 14, 2026, at 18:25, Mark Brown wrote:

> > These issues are *still* present today.  It's making noise whenever I
> > check -next for ongoing issues, it'd be good if the branch could be
> > rebuilt.

> I assume you hit this on the branch I pushed out earlier today, which
> started fresh from 7.3 with just a single merge. I've amended that
> commit with an S-o-b now, but I'm not sure if that is what you are
> asking.

It is in whatever was there when I fetched the trees this morning which
was some time before I finished the merge and ran the summary stuff so
you may have updated it later.

> When you write "and also isn't showing up as a merge", do you mean
> your script has an exception for merge commits to not need S-o-b
> but fails to detect this one as a merge? I see that about half the
> merges in linux-next (including your daily merges) are not signed off,
> so I'm not sure if we are all doing this wrong the same way, or if
> there is a different problem with the soc tree.

As indicated in the original mail and repeated followups the relevant
commit is 3edcea7f0413e84863300998ad3838eb87e6fca7 which looks from the
changelog like it was originally a merge but is not described as such in
the git metadata, it is just an apparently empty commit with a single
parent with a suspiciously similar changelog.  My theory was that
something had gone wrong with a rebase or scripting.  I only check for
signoff problems on non-merge commits, merge commits are ignored since
they are not normally signed off.

--Xp+J77/ykdLTk1ES
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqofl8ACgkQJNaLcl1U
h9BpfAf+N0qMWHybnYPoX5MY02Np8i3KeJiufCQkrsdAk1GlrPftgl0FRn5FQshY
oIjF2tOO8itqr5QtqXL9SI2ejS18hbUxWV+/49BID35uQj+2AAtsR1yGz7dr06qR
W+AfvI0iqkEcWCNpu7q3MmZ1kUp1tRlXF3V80/FgZvfGulab//4sYM7/3DUDBcRW
kVWsprw96kUJbCQ2wLyVFd4VbroSCJquHuO3hPsvUIdwnNU81NK3j/loPE0zQGfW
I3zPc2BVCOhIHNPaGNb/vTAvnJABHphFehlVZXzaUQASV6v7RS+vSXY+C5uNF1Z4
Z5lhHKLX0fjN2WzYizS4jaDv9N0FjA==
=Zbn3
-----END PGP SIGNATURE-----

--Xp+J77/ykdLTk1ES--
