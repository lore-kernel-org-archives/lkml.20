Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7A274B46;
	Thu,  1 Oct 2026 13:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859645; cv=none; b=eFpiSMJhnz1mfSVjnwMBcVbONj2Ip4F+zJVI47Dy3kNo/BHBaQdQXCTQnTSXYkhUOLaK8VZ3Q7BOYWBScr0xZ/BUk1OVq0fB3q00RimLvBJuDOC6eScDgaapXzmSjEzzko8KN2A5DYlIYy1e2w47JU1sfUU+/Sa/XZi6I3AI2qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859645; c=relaxed/simple;
	bh=7xvMWahvepBm3s7Dmc3/QJBgnq5WKiX2bKv1WGcrweg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pDEIK2nrbHiT5uuLeJncI5fzrsQ4yAWqxJA2FGlxZ+DeZZsp/LMD8gXeA7JD5a5nvnaVdJMYutmCrAoi6ZdCDu5XB5d+Rv5HGsvL4GhViyWACXoCbmO6lIuhtTn/DxBx+7Wc2++oADcUxvpOimS9MidcOLTJ9fMuTK1dptmMbgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oL7y0Gmi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oL7y0Gmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0AF1F000FF;
	Thu,  1 Oct 2026 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859644;
	bh=+4gtj9XiQTZ6PXcJwHaE6gO4vJEn/vMeZ0YJDMsTDlM=;
	h=Date:From:To:Cc:Subject;
	b=oL7y0GmiAz8usstb+G5TXsMTS2pcXV49Vwd3xY9gZ2Y3ycxv/wTq4zaLkhvWsmZ1s
	 2RJwgFt2qyfMiERcgSUXIVi8O5HS6snGTfXYB4XOXchfDDMQR1Grj/U7vYPmkW+Ac3
	 Hnrkf6zHXZIGGQ79lnprALtbD5CfC8khsVeUTDcxvWOsSRE64gEJ0olTfm2nWFPOfM
	 iTGS6a/SoHc5W1eVlJ0+5y63yIb6YiPf3bJjzQNEWHl7PYcr5pWg6wycKq9d3pho+h
	 SVexnp4Oop4n1RifD1xXSSnj5n7stvhh4uCv82RH4DRXUdc4F8duefLuNtDyVqj0nI
	 eqkE7Qzp7/56g==
Date: Thu, 1 Oct 2026 14:00:39 +0100
From: Mark Brown <broonie@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rcu tree
Message-ID: <ar5Zd022vYh5cXcI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n281PN+GXlCAOcrS"
Content-Disposition: inline


--n281PN+GXlCAOcrS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  d563f311e7e63 ("doc: RCU: Fix s/strategem/stratagem/ typo in Requirements.rst")

is missing a Signed-off-by from its author

--n281PN+GXlCAOcrS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+WXcACgkQJNaLcl1U
h9Dkxgf7BaFhfwx9W5SGXgQaG1rI2eWK9oGSY3jYx3zmdsAL1Dxn1WDIqdorD5np
bIthoZ5hqker9q9ug7POHT47GAbRMr9n2HRKSF0Wtj6pP29oi40sqQ6Scyek7mLF
65qIww3dci2GOVzmh5skpbsbfzvaSdm06TrmDh6M2EiCVDot0FAcSTJCv6cwk3ju
Eu3cVfp0DIgYdw/RD58f4H60Y2CkjN1KgfuBDtrVog9P3tzcCO8xYEpFdGPcTuVb
3sWNcM+wFRdQs1xE/EZL9Eqw87AE/xTk+SMMzs6+1SiH1hNabotjjRodxLBCJU+y
wFb+NpGxUSnuMjjcOsZ5kkWbGdSIYQ==
=ieid
-----END PGP SIGNATURE-----

--n281PN+GXlCAOcrS--
