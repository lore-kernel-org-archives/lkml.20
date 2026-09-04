Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2037551993D;
	Fri,  4 Sep 2026 18:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545496; cv=none; b=hXHQ60G4ucLEEp+Fx/7DqLy60RE/yr1J2+A86F5lEfSgJt0kNNXVrSMGyAIgbOpOJZd5zYMcH9NLNO8Hyl5gX43lRQCbjtw5REyVWmx53ckJZYEUsbizczjGEUDs6LfeToFMaxWwHjD/Wr7W4hrU6aWG57zxL4+6S7NXBDB8hbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545496; c=relaxed/simple;
	bh=XGGiULzKxbsxMPwMm0rzgoRz2gHuP34SyUxw6Q/rCxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqCpkhMtaoisZUNYLPV3j+3fPpjwX8/UWPsL4Slsd4rVUbcIoMyrC8OsQL7Xfc788mauEAfYgYF5BQhC5dTqJDmY3hTiaTG0BzEU1iQwsbv7GAT9nDFsSRb6i4scuyaUckF5fKNiRJi0m1dLxsID3hVWnpCMDgs1I2e+i4KgRJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAG0DrCF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAG0DrCF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716131F00A3D;
	Fri,  4 Sep 2026 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788545493;
	bh=0TkkvokzXAQ2u4nXOczocp1spZDiEVbEAmQgLZLTlPs=;
	h=Date:From:To:Cc:Subject;
	b=hAG0DrCFXbdp0ZElmFA3VgvYlfcYrlOcFCGmQ/h+++SXmS3i9A5S8UgmnTSv1lkcZ
	 arZXyCrc3o2SAXKM0cw1i9r3B8a862rMSvKtV9z+PIlW5muxpBVSUKvFmtfS4twHve
	 3W7adJ4tD+i28GpUWFTBkIRRR6ZQNpsQVUPh+EVdyEA/j7etfN3lZevKwLMFyYiOv0
	 l1F3v2ZFkVVOCNMCUea1OaWKPtOAML3biOH0ezwuA+w9oXG55kSrS8abK7fbGoAkZJ
	 64qCERJm1Sgc7PAOlkSF4AbfrCZUidGochYg8JHNjucI0AW6nlnKIHIY6LELT+DgZr
	 TpamqiM4dhnLw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6B4C41AC52F1; Fri, 04 Sep 2026 19:11:31 +0100 (BST)
Date: Fri, 4 Sep 2026 19:11:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Golla Nagendra <nagendra.golla@amd.com>, Vinod Koul <vkoul@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the dmaengine tree
Message-ID: <apsJ089VAvtYHRpP@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TBlVQDcZQGDKIi29"
Content-Disposition: inline


--TBlVQDcZQGDKIi29
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the dmaengine tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: unused label 'err_disable_pm' [-Werror,-Wunused-label]
 1171 | err_disable_pm:
      | ^~~~~~~~~~~~~~~

Caused by commit

   3f30db282c28c (dmaengine: zynqmp_dma: Fix chan probe/remove error handling)

I have used the version from next-20260903 instead.

--TBlVQDcZQGDKIi29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbCdIACgkQJNaLcl1U
h9DvOgf+IeVM3Ied/lpzvsw/ClqUrmawOV59X6rlatYuGHtTE1jZSJTjvids7f/m
H7KZxO+H4Q8LgJlxeyGlYmY3loN0eeBOUqvkuqNFIpQD0vUkwsfUm9XaDiTpALl/
tn8obkUSPgTUgR+JbqbZJRMP/AKeM9scr74lvbUwd7TxTtk0klSFI2Iugz0YYEEp
CQxWd6wPVoVbuJ1oLUxePSDUJFcRPQqAQ32Sf2DzLby14uPm+i5a0Zm1v/H151E1
ZwJuUVZzr9880ZCbRobT5mWVj8pc5kPb8F1OZs0ukLhS6DlWljvkT7+LgkFhnksa
QTEmeXkwItEomBAVFgi/tQXDNiIEwg==
=dmyv
-----END PGP SIGNATURE-----

--TBlVQDcZQGDKIi29--
