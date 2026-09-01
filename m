Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDFD36196C;
	Tue,  1 Sep 2026 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262419; cv=none; b=Hk0agK4dPznd5ykEeItJ1aYmDcBg4rPgmUwT8ZVZ3yEm2Ryr7VDhujyQT0OrLPiY6lQqO/eGhApiFGXIDKRlUP2oKknAQEKrOEpCwaotcCh+BbUMiE56G1dt4vWamnPp1gVoJ9Z6Vm8KUWKZ/mLQZFUzO5o9ia/umF9d9wo2Vuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262419; c=relaxed/simple;
	bh=1nF6mG/x52NRdbXKbDsHP2XhPvpal85jDNa0iDAspyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZwYple0g6L577rvUVKAzNk1Fw63og0VWcNKxuRrw15ylfnSLG6Kri+WzrZt1H9PCvODMZN1xuNoe1HxvvUm736EtwzsrzxX+Jv3e4LjE20VXW3iG6DZworqeCWve1V4+GFHcuMIjGtuEYkrIWv5X6dz3TAZg2JKJtFVnaSM1aF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWyw9Jho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWyw9Jho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179F91F000E9;
	Tue,  1 Sep 2026 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788262417;
	bh=JlnJ7Uukhg8VkzKB+re1koB0u/aQUiCwqFkjDu/49lE=;
	h=Date:From:To:Cc:Subject;
	b=cWyw9JhodSZNB5Rh75XjAm7pJp3qJ8mtJ7np7FymN6w6r/b2icBMDUXLTRDahswOc
	 Y8grEw9UYYoZUCAeTpSOhr4k/yG4uTg0VtsjUNee7bthHDNx+++E6AhaSvKysp/hXy
	 fF2OVfQQiQq/0WJZBjQiL2PaWAldDVpulEVrMPwIpbpYLQtH96xVqLH3+8RCytwj7/
	 y3Lk+OyNdmg0rAfiTic8TNUYuUidxIBfDPGfrwmRrgKGGi1S9UEIZTjAE1FhoI66Mr
	 3eyrz/mVlIIiX5mkDkXyVqyUTtwgrrQAhGV/lLp6iP+eraPwx70uBsftFwoTp9EqgO
	 SfK/8T2aQffEQ==
Date: Tue, 1 Sep 2026 12:33:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the security tree
Message-ID: <apa4DlzuPqZi72gp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g41wv0L2r30z2gfC"
Content-Disposition: inline


--g41wv0L2r30z2gfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  5598cab53f535 ("lsm: don't call security_backing_file_free() multiple times")

is missing a Signed-off-by from its committer

--g41wv0L2r30z2gfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqWuA0ACgkQJNaLcl1U
h9BUngf/UIpdrOgoW5wKXRApVA9qyFiyNrSLeXE1Qz79ivpgmfWFrScqVpHJQROd
31i+Pyg6FpE6w10QXy7EPPyAMsgGWuqzWBGcyJ1foAffIdNZOO5OzA+pJWCm/Gv7
l6VMTNgEK2+tslO3519Y+NGIo30CpJrhmgtDsbDkuj3ud2BSZ4hMGdoCwHMV7c9J
YrBxs+VrMEtRpdWzflz/u6z8OoUEfMaBTkM1XOcbEzBz+RRAxWlbo0JQ7qPUfeiI
waLmCbyMuir5nBQUwO13pnNiT+/w30sbpFED5wnswlB+vAETPks9Gji/mYSTh4Ak
Bo/iYTIHoxJ714qDFVZfhbRC+dVKNQ==
=WfQY
-----END PGP SIGNATURE-----

--g41wv0L2r30z2gfC--
