Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372121;
	b=nHVmI1lM5AKscmt1kssPzPcocM3GJDUhk2KHNnvAC8iB85QqVptNHBGPRsl2S9J0vdRd
	 73RFtXowIm0UnfaIZhjf5AuPhUAAJ64zavZnxb2ccIhF60I/bQy2luxzgAkFKuhbXDPdE
	 tD5aKVWGnywBGWf+CgwV6RguR7vxwei3wcYGCGv23/tVNYTzyDVy9pM5+bPr2iwkobEiz
	 d2skpyD3V2mkA8yEeo1rn1rWy65e/i5wfwFv29FCsL0Nkr8Ksif7S//stWE2PTo1bQ9dJ
	 UCxDjvXBoEjwJ1LX5WTyx5gLa9C39RZZCDkFytZN8z7Iztu3BN1yMOeQI1l/kR11y+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372121;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=nHkDZPb69+uTPpEwG2sgAEgHzwtN/SsqxRJ2qzJHpoY=;
	b=nqAC8hsOlDdHb5koAp7tKSmjQIaZ/4bHSfugJuBEAQBk8VPIWvOjm4gmVPX2iFFhrqTf
	 WHQn60gVEYQdbjGcIYcyGUWgM289lnfxxsD8D6qnVUHfOAkelj3bDrJ7V3cx7McT+f4Bh
	 DJ7qv4lt94Rk5HOticQPt2rzGpwlgVhYBL0Hgti12CcxV7jC/JRWGc9jRTPJznaomJJe+
	 CjY15UF/80kDxE7/rlMvrik8icigKp8PbVe6dhrAA/rRJ/BI6qnCig76bdtMo1Feno/UV
	 BNdhkXzCG+D3pas74Y2/nQrvcp/Um8g6IUvYYND/2xdUzLRGmiLCBFKLoZv80eQmJUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cgZpwmOp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F52606A31F;
	Fri, 30 Oct 2026 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cgZpwmOp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D431F000C1;
	Fri, 30 Oct 2026 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372121;
	bh=nHkDZPb69+uTPpEwG2sgAEgHzwtN/SsqxRJ2qzJHpoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cgZpwmOpQUBBjHKu7ypMVPNVJD5+hfvw1dikmX1fKSIDuMth4ApCaelzuodAFqH4B
	 BsS36is5IXIczywHSOHiZsFCUOi70W9OGKiQAmAuY7MqZXsZk2joQm5HWLvOsJeOWv
	 /tDQDuvOnjz4/D8P4PsHUGecmo3BUK3Cy4oGY0/8bfX+UgzI4gJJOMClccxP/AqodK
	 QaLgCDNC+pC6GU5TGFYJvd91KOBiGeJKaWo04wWR7d5LMphWMwWix/oksCl/cYwSwG
	 2VPUCni26FgaX8OnUloumN+BDJ+jmR1Aru4n3fawq8EqtljN+I6m3kM5wozfpXuoQv
	 l2TY6OcwSZRyw==
Date: Fri, 30 Oct 2026 14:55:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Alex Deucher <alexdeucher@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Kevin Wang <kevin.wang@amd.com>, amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [PATCH linux-next] drm/amd/pm: fix up the amdgpu merge of the
 smu 14.0.2 zero fan restore
Message-ID: <f3a400f2-93cc-49cb-aaaa-41c978b0b842@sirena.org.uk>
References: <auNVlhF6DGyFYx10@sirena.org.uk>
 <20261030104101.3496560-1-sashal@kernel.org>
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
	protocol="application/pgp-signature"; boundary="pGs0dLWYcmH7SmvC"
Content-Disposition: inline
In-Reply-To: <20261030104101.3496560-1-sashal@kernel.org>
X-Cookie: Orders subject to approval.


--pGs0dLWYcmH7SmvC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2026 at 06:41:01AM -0400, Sasha Levin wrote:

> Mark, this applies on top of next-20261029 and is meant to be folded into
> the amdgpu merge resolution.

Thanks, I rolled this in today.

--pGs0dLWYcmH7SmvC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrkr9QACgkQJNaLcl1U
h9DptAf9G463TVnL+fB4xIKzLw46Xsj1UfKTW6zWoQR1gH9GPUNqxxncia+YulrV
t1niT1wOmpSVXqag+y5YtwXT5ov1tuSyklpVLBHG8wyqer4E7vjkn25/eXVEs///
k6tZfaqruBdDkesUmWrMV53mhTp2iwrX5jhnFAnuiaaQdJNWNVJXQH1vTF9xc6GE
9Qt3Zy8jf0r127arHRrG4lVoEbL4RqpaLoJrYm9fvm8hxULtRQWyRj9zwgd4EtS1
znnMHt2Yf7fX7oN2Hd2SZ1MTNPKTx7FVKBwGxYUguHlhr1/zibXCDkebIUzho7wh
f21Ez5buaCNFqUGrLYn1sMH1qqXL7A==
=9GUG
-----END PGP SIGNATURE-----

--pGs0dLWYcmH7SmvC--
