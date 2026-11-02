Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637370;
	b=WS/CGPAKKwKcQ8CCIyVYPLLHL6rofU7o6nsQMCB4IuNruqYb4vYPVyGrVRDVJs9ThwjZ
	 D4pECVayvgQzDKI8/Y5NBl10PlAczKbapJhdU03JfIpSEXNcjIMB07jhbip5artXZ8ddZ
	 gX1A1zKCTl8UHfMi41jkUJtnKB2RyTQnQeGLkp14XNg+/m6XKI3EZms9kPfRLOjuBQn8Q
	 cCqfA9g2zR2fYK3PfhDPu4WPBbzlfM98vGdSxlaYzQExYs0nSwJPeY51RUzNBzly1m2sB
	 Y7EhB3AVySgriHuqKmz0NXjxdIEueSM5O+cRq4EbqOrEy7yk4+jKwplFzBy83EFrgWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637370;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=cq9ukigHdSmxQ/3GosSU0YLrM5L7oG0HXbKselWxJ6E=;
	b=hVk/Y89VCexotUUG1CYz3oiduWspTgAUF9d+zKdyoKa0R3gPTsOT83KJnQMEVBInZVMW
	 8dVcePdiBQqfZBidluOO5eIaE71eHLBgL205736wvH67NgYzfliDvyH3KNI8w3UMELwzp
	 r9ZKFrLl5cND4RqNMr6KCkHV3AW1zk38vbvJTPQ7EoBs3G9ealTVZNQ9XOVqaQru2otO8
	 hipP/MRolxnDZBBXUnY2TgMhc32317t64xTRKWS05S1P9GqPXLBCRN2mQjq1OCnQro0Lz
	 Id2wg4PAf9orDmHXxQlgV0Ws68IDm7VGSaTLO0qGoZWB1EyFG08Z3n7fKnKiJ9iOqug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mknHtKyo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81856606B0F8;
	Mon,  2 Nov 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mknHtKyo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5680F1F00A16;
	Mon,  2 Nov 2026 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637370;
	bh=cq9ukigHdSmxQ/3GosSU0YLrM5L7oG0HXbKselWxJ6E=;
	h=Date:From:To:Cc:Subject;
	b=mknHtKyoV0G/QKPOx0XP2cCr4BvA1nEoVhrC5RxyFSZyDZBQd2u4JNUMLDGdomTpK
	 wAB8+wz8ERwXRCDSKp4d0cJax27bcRJHWQQzFMFQPoGC1EbT3DiYBmJM2tHTXng9WZ
	 8ULaP9B43NIfa8npijGGFOBU0esiPoDDrT8QQ5i1beXiZMdspTnJoEvdmJphx4dAAV
	 +fZ9jFMnst0xpP5ZU4AHIQ2mNkiGvCWpn2HBw6hOvxZvJy/biuJ+Wolh1foI8T7nBO
	 Rhw+nfNI63vBPag5GCPaUYcclJNQhmNBkGO3pTSjPtu5005MxAddHgG+E+cCiTu4kb
	 X40pbsm4rvQLw==
Date: Mon, 2 Nov 2026 16:36:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Extensive merge conflicts in the turbostat tree
Message-ID: <aui79mZLqkXYhZzY@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="XUtjhrji32evlLeZ"
Content-Disposition: inline


--XUtjhrji32evlLeZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The turbostat tree today has extensive merge conflicts with Linus' tree.
Looking at the history it appears that there has been a divergent rebase
at some point, there are a substantial number of duplicated commits
between the two with things built on top in both branches.  The
turbostat tee does not contain the power-utilities-2026.10.31 tag that
Linus merged on Saturday.  This looks unintentional and is creating an
enormous and likely error prone mess, given this I have not merged the
turbostat tree today.

--XUtjhrji32evlLeZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrou/UACgkQJNaLcl1U
h9DjaAf9HT3IasUNFqaYY65fW2tKEt16Zi9IXxRWmxP9A10d5NWN/lLyVEDMKk9s
cuua2jlASLD4W+icarLNkJlMA4rJJe2hxw8pL531bZ+ajQI5oux0vHM7cKe0r2X/
BXlfc4nRuQxCvz4iFODYydtLPUCTQ6zWS7R9dh5ORh9dytqeRaCBk/jvQxTanyvL
OXzs44xGnEfDbd0gjfcsLKWNC/2ob8y5G3E2tYKtVg5tG3w2RVaVEzeXsu2aRHee
1woOJry6tnAa7nTD8mPeUL+4WUB4Jplv/UkvpWoR4bZqx95w6av8fiVIT/Swiw1C
6wOBUxoxzZt4hKRVJeiFu5PAfiMcrQ==
=VlJr
-----END PGP SIGNATURE-----

--XUtjhrji32evlLeZ--
