Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A66368D74;
	Tue,  1 Sep 2026 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262176; cv=none; b=rXt6gmu337fzl2Lyi8SkLsdfwUQERr3pjmTdRoFLSStQ0aVYfpVxAEuqvhD0OrV9eJYhxx6lKbTbZkpw4Uw+qJeV5ju2KLE7VGH5l3bH9TUBlADINYN+q/I0PlCjycSFWqbf47r32ccalXUpgVE2dzYZ3DbLLePG7/VFyk1Mvko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262176; c=relaxed/simple;
	bh=zD/QKhO4e1xsEPj6nhzGBZQ1U4jatt8skzRPYtkEybo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akO8C1n8+rAPliPdxr+ufuDoj5LBA08JnZlZk2NrDUxTBzje7/+QSzEjYlhe9hiX7ZC8t78PWu+Ie6CDu6QbLH9pjRuL03MDoG9SGerTzttxqh+wCihOvvkamDUwkZBMhCn6148eWDyMhkLea3gt+9Hm0RYuMW1NHdNZfseHUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCVJvmhN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCVJvmhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4E41F000E9;
	Tue,  1 Sep 2026 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788262174;
	bh=/Iyb8/k4rRD6W+DXbibyXh+1dU1PMI0/fTnF/bkpN8E=;
	h=Date:From:To:Cc:Subject;
	b=BCVJvmhNSz9kVZwYacQUT/pIK+DHD80NQ8mw3xjBV5LmlF7kkg3Tgpi0kcyfQ5lge
	 qTfQdUnXrEq4wHmln5qk207HbzI8M7bH+d3i275Lgr1HjpO+bHPulIGsgNmN572XGO
	 CwgPel2UfAGMvEZTQjPIlO7jM9oTs3oFtAaDM78SXTyBhX8WLJculvlH/67qem1KKb
	 k/ye5M3gjlEqwfKtIbI79yUIl8C/zAOXZUtjTtlIYNCafFeTQ0iGsNddR6iLrWZrx3
	 ZaG6ML00aolL6dx9SqdNTscd/p1Ur662Sqs1QWCwnUD3yfclxu0dZDayYz6GBFwFd0
	 rd+JNbLtS6v0w==
Date: Tue, 1 Sep 2026 12:29:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the risc-v-fixes tree
Message-ID: <apa3G5qHROwJl5PU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UuTobIx+5ERMwnjv"
Content-Disposition: inline
Frllom: Mark Brown <broonie@kernel.org>


--UuTobIx+5ERMwnjv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  8718e5a3090bb ("riscv: patch: skip fixmap mapping when kernel text is already writable")

is missing a Signed-off-by from its author

--UuTobIx+5ERMwnjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqWtxoACgkQJNaLcl1U
h9D09Af8CzceNeQNMOxl1kI8aDIgXWhfGO4CxE+r+5UhnBXxbM1PHFHOXvmzdO6a
Ze9B7J6nhMRgUXkf63C6pO9/kOr8Rli43dH7a00DYNbYKAH4XKArnmwwT7Bga4yu
VyKAlca7UgRGUBakFqEBwsOBW6Fuj/XhOT0gDqeSH1ERgcMBE4+5jjiQqIkeSrn7
Ph1OL+ApGbIO4clDeuFu8QoSipOZMu7+7E0Z/PtDxODEtHi+vMkSjBYKT41/6RnQ
UiDky7nftzwP8jdR49r8UtsU45xP/Q3ZcBGRQUcD4zMGsszBAViyQrvpEz/P2axp
ekO2aJ3fADF7tlCxvJXRToSu/xUHeA==
=HWsK
-----END PGP SIGNATURE-----

--UuTobIx+5ERMwnjv--
