Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709067;
	b=VwxofwBi1rvS+mX2A++vya/oNNPpkX6u6/pShmfV95SDtW/hDSdOEyPZjFgT0Ev9sl3I
	 3Ld5twnWnyV8CM39wClT0Dm2SbqtBG84xFegXQIpz8mLm2tguMcSBTUN1EasldmxnOO2Q
	 cWr0C+4zTq24tuJidvy6k5XshXea1+PAyBvY5q1hF+v48c9+GbdziY8nHRvNGKNIvpU98
	 L++mrUqYv56MHWlbnGFnkrKyHyEwXJ8WnH+UCE18eSNFlRhVS9WFmDyhYX9kY8c27NzMA
	 XnaraJKGnZTHntnFM5Emeaw5YrnsTQu+Tw2miUNA0OXSHHBpowvj0DQd+T5AEAz4zOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709067;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=QBcqKmclROYeCOX7A4e5v1bv867bbF3DOoJrAggdBz4=;
	b=SPBwFRv+R60TJ4hgElYwymJUkb4i2BoNnxUpw7rB328Q0gFl5m7SttrYPDB5zKkk4O6l
	 PgWBwQhtE0hCiffTHMBcM0hSJ2/W8qkaZF6zVx2RwPOm8/z/iNSctYT0QGhN0e29x7hSl
	 LQE20M6Iij09DSwahwUFq15GJzaamSbT+LRoYgLSzHjtJMSWF2RfqD8lmC35vA09HPQyt
	 2EtmtDEXZQcI0zn5aXSFgcbKOlM1yp1MuHdpA7kRwW9hIRYl5Ak+pJ/IvDT0O/BEGhUad
	 5pUiTh7USW2dbKw5RN6B2tQhbWouWQMLbp7AmzXMLHkfIXRfe70YlJqBVhvqGxugouQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RiYjQKPy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AEE606EE83;
	Tue,  3 Nov 2026 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RiYjQKPy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7301F000C1;
	Tue,  3 Nov 2026 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793709066;
	bh=QBcqKmclROYeCOX7A4e5v1bv867bbF3DOoJrAggdBz4=;
	h=Date:From:To:Cc:Subject;
	b=RiYjQKPytzzgIQOoHpEYAvO942+U0C4Jdzg3IHUflSLtY6IczTP7W2ekp/NoIWuzN
	 HLzG2WiBGiJUZpceDXY6c35SvU9gYa6t4+m/BlkAe0zgUT4V/Cy0KIDpiVZHT4XlvQ
	 1ehUHgGs3HUyegxQK0/dYObx/A59hwDv4vWdchfLqLJT4BYEbG0BzAfyW12OhFvltr
	 3fnICJSQ6QpiUSI7obNQ3xXY9pu4S97nySTacyLBRMBd4+g2vDaDR4iM2CXp7SHyWe
	 uVQRcmtkzZ9RBFDSORcVU8ZpohtcOtljSVoWKXXnr3emaPmPVkrpfcnRT6zVpCcK/N
	 DxJMEvPXf2BoQ==
Date: Tue, 3 Nov 2026 12:31:02 +0000
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vhost tree
Message-ID: <aunUBu8EQC-pEUGr@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="62tK8vmu5O3YEvs6"
Content-Disposition: inline


--62tK8vmu5O3YEvs6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  9494608239a5f ("vhost-scsi: validate event queue descriptor direction")

is missing a Signed-off-by from its committer

--62tK8vmu5O3YEvs6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp0/8ACgkQJNaLcl1U
h9DUUgf/WdPMGZ5g7Om5HMtsmLKSePAr01UEBzkPJuOeWd1cu/zU5rfpENADFtrc
zJvteKoDLJoRnTdPLzOir1bF3b7PG8Z9Pohu9UXThl3ocY/6FWeKOrczIXp0AXhY
f4HT1wCYupdDm7TEpXveL1c+NF/HivpFiChKYEJJmoSLCdiNH5aE9IG0MntxLJgi
RtfGVz5ynPYkStzjEs9ibtME/ERt8tPyhv7jMqPaTccl5JDqu7521Li+BU7Tmnha
ujzhHOsHdVjtRAWfT2nkoGRXeRThU95mlYa/BPg/dBzpcu3nqpC/Mnmafygd/JSb
hCpkn4yP//qPOuEGKZof7v1HbofyWA==
=k+3u
-----END PGP SIGNATURE-----

--62tK8vmu5O3YEvs6--
