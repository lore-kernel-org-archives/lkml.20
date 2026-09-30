Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C634CA771;
	Wed, 30 Sep 2026 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766968; cv=none; b=BdjwuPnsMVNZzT+V7eOIw0ZVKoJVsHXBT59+OR1FIR2kpeFrUeUPDJwWflu1nVVnx+bVAJwlehTovaxBKI7yKnq3IrAPJufwUK6V4P8QZ3e3pMF5NHYbTcpsPXqfydU2NAUYJHYvA+P3EKfQnaeLASEGqkmjn67uKbMCkFwV/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766968; c=relaxed/simple;
	bh=wNtxULtK6eULPUjGiYwWMXIygOOTLrQkWFOYajo/Er8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3UgOMqV7KC+BhhMv0ig3HRtmHQDDBj++7DDMG0YbOJrm/CrpxkkUcTizJJO4lgEdrxH/CxQ8tHqe+MoE7z/VEV3OFXWT+C0hepbYn16aLhZ8CYNZJCYyUvzyrziNRxkxgM7bJoeTXbMoIMa4LOR/LEO8iKXSFe+IRNcpmKqaKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmAIuNZy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmAIuNZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08141F000FF;
	Wed, 30 Sep 2026 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790766966;
	bh=wNtxULtK6eULPUjGiYwWMXIygOOTLrQkWFOYajo/Er8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AmAIuNZyeA8FGmHo9JzPgNkUOVfXA+fL6oo05mhl9bpz5/rydSxroild0R3rWaxKi
	 o2sZdw1cKjSTmZxs3GK6J2xTyBUy3wATc9ouyNc35OEHfdLy7pnY7ATh7Ic0HwvjqI
	 dHYwxrHdAyveOImOGatEqi4Jbc/mfBG0s0gdW+7wxRFnR76iH433o039DnSFng2m2R
	 Q/IhpNFfBjIA2biQDXUwTrA2ePyRz27vOKo87em8Vs0vGKjgBmD0ICw71WFzOIPNQe
	 LEf88WRzgRwu1SgBWH2snhdRXUr9QU4WiLB/OwbAmV5fqqMpA/yyPIWaPnYmzxfGab
	 6AGXlEKaPnABQ==
Date: Wed, 30 Sep 2026 12:16:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the scsi tree
Message-ID: <429ecff8-dd64-4703-8ffe-42561acab4ad@sirena.org.uk>
References: <arp2hp7wRlcK_4D8@sirena.org.uk>
 <CAMuHMdUYNwi_MZtKGxnLLpUKDVAgRK8zT+2eaOcHAqcecx_LcA@mail.gmail.com>
 <3fa086ea-2868-4cac-a34b-2389355c31b0@sirena.org.uk>
 <CAMuHMdVZpKLzvmRyJ9=jhnT8OhXtTRsHYOAir4S07mzrEa4mkA@mail.gmail.com>
 <CAMFBP8NvykpHj7Dh7TPf-U1f212Av7cppwaS6g-_G4K8ktmr4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DTJ7BBsZiqXPiIIP"
Content-Disposition: inline
In-Reply-To: <CAMFBP8NvykpHj7Dh7TPf-U1f212Av7cppwaS6g-_G4K8ktmr4A@mail.gmail.com>
X-Cookie: (null cookie


--DTJ7BBsZiqXPiIIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 03:11:20PM +0530, Ranjan Kumar wrote:
> Hi Geert and Mark,
>=20
> Author of commit 29e3f0856e854 here - confirming Geert is right, this is a
> genuine double-put, not a style difference.

You probably want comments for this, the code as it is indended looks
like a bug.

--DTJ7BBsZiqXPiIIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq873EACgkQJNaLcl1U
h9B9eAf/VNEcr3ZqLs3Hy5/TVwMFaYjLhAefvwhLTtVX0RQTnmZ+qlpJU2paalcj
9DXMHv4AX7sz8mGcXFB7xccZ7HcuD1JO1pZ2DCQsx4/CsparJRCToUWTqe21OBbr
OdX/DhUWAFN/rRjTiXY3wS0BdLnGE7YTTFlHzfdtK/UQsrOTnCE64s5M7cmc6HrB
M5/8KJ6COOdC1v4tchUlsRca/EFQ4yYXNGL/9Xybh20Ozg4ciNTO5W1fDP2qmd0s
CWIuWE2fk7ngZnEF2FCf1IT3rP76fjpFI4QIl//7IaZBzjz9BK7KVAeCPS2MNWY8
ES23p4XFpsW6H2aEMSEUhmSmlnAHhw==
=k7eB
-----END PGP SIGNATURE-----

--DTJ7BBsZiqXPiIIP--
