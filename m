Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AFC43DA49;
	Mon, 28 Sep 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606262; cv=none; b=KnQCFRJoYkJSyxAFQUHpUoLJTK8wCqO2rqAkJpW9XmPcYGOtEM6VE4LRaNXpbpl0BCUEdswMu25cmqB3M27yhLEk4AaOW1eZymVYaBW9k6hmDAMBaLCBLkAK9jrcUlBfV6uu7T8ydpfGoyuGcz9cIDOgaho4Meu0gFHAhNi1SE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606262; c=relaxed/simple;
	bh=GjxFit+L1s6ZQTfbcOK2dTuX5KZF9Mf9RzS8bwlG1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCIn3P0mOMNI5o6DNvuPxvIBPfR5+51UEa26MRpR/0mm8q1QxhhRH+Ey9bUglvomh1nZwghFc1SC7PaT71b5cjbco2ViheVmLe8RuPvThilUNhIrTAokifL+9UJae1tkQEm+Mc5YV5w9GIWoXL35U3B2fsNS0fOpwV/XR1oPmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oM3dK9eq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oM3dK9eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9320E1F000FF;
	Mon, 28 Sep 2026 14:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790606253;
	bh=OYudM0OPcpKU6VI62Ou8ITGddkDhlWAUVzfC77wnFFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oM3dK9eqtoLP2NllG/cj+tI943eZ0RrqrCsmXhbrTbC2Generw/8+62bvAM4qLzKB
	 /x8jV4NUzk/mKu3oHbdorstuKiWR1xZypCYC7+dBywJnHuLgCIGNZeAjdKXe1SeFI1
	 2II8aSSf5foQUVkBvRTeXaV/t2Rn2WS23KAvb0TfWP0r2b4glmoZE5aH3yBRe1gCFm
	 Eg7k9ECJQVLniWxeSMYO3ZKEOwVPn1frIU1wKpcvmlhqxsOd203FkjjpOTlKGbHNRI
	 ISkNxIvOEs9ZydIJXMisVF3pGUw7HXOpoEffEP6oRZKPJs5LPcWpd4pdRIfNDiGuZa
	 Z2NWMjaueh7hg==
Date: Mon, 28 Sep 2026 15:37:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86 tree
Message-ID: <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk>
References: <arUBQuAfW4HJQHik@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPLIGcNtmw0LwGbM"
Content-Disposition: inline
In-Reply-To: <arUBQuAfW4HJQHik@sirena.org.uk>
X-Cookie: All is fear in love and war.


--bPLIGcNtmw0LwGbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:53:54AM +0100, Mark Brown wrote:
> Commits
>=20
>   4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 suppor=
t")
>   9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning in fan=
_curve_get_factory_default()")
>=20
> are missing a Signed-off-by from their authors

This issue is still present today.

--bPLIGcNtmw0LwGbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6e6kACgkQJNaLcl1U
h9ArIQf/eqgTw06ax/UJv+xvXrhsn+0PwGaCMLPAt+m7n2FGwr7UVbHWduOlc1JY
oJ2G+ofl/x/fFhDmFFDzERpgOegX8SZeGdq4N9tRBNQR6rJDTB09o9YJHW/OJnHG
2pU04hdkHMq0Y3ZGyO2cVSd1WDc7ECI38n1M3VXuLEsK/T5U79tZp+AG+2KYBntP
1xJNxSg2sOFmVbZaMmZMqycLRONIt6pm3CG36LUOgoNAVaY7tv9w1gro6XBH3Abg
JpJnoX3FYVl+WbqVuGtAjuxivg6OxJ64WDZt3uYGNBf4rg741qJihsd6b04F2cWz
84dHJhVipA69b3bFV9rOSZana8XT0Q==
=WHZ8
-----END PGP SIGNATURE-----

--bPLIGcNtmw0LwGbM--
