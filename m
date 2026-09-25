Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C03CAE95;
	Fri, 25 Sep 2026 17:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357158; cv=none; b=GbPciTQf2TO4NaHeH957JdVA1D+dReS+rvJpsQUON2okLz1KYjQnTYiLO8+WzDrhP9BapsZnURzPtxObajeQ6hh0Aidpv3Cw3ChO7K8EO7eZlztXrBXYLNYD5TP3EaXun5Rtq+MO+E55fZ7Gsl4qUlFp7TuEMTQ0jZSMD5uF9Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357158; c=relaxed/simple;
	bh=Ek/6rcPltp3J9j1WTuVWmcfKF9lHth6E6EbZvGWPZ3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4y2Zo2hqlG6eUZ8gqEmRxcuhgyZUZ6gXbpgtlS0JGUpcOxZJspSuxlsRH01y4S2cGtVXUMYj56PaZSyH4hnO/nx2ya7up1+vC3kUAdPvo9D6pXSlm+RsGuq2LqapjIxD80TjXxSWJJKCDVHph7ZBt1uUPdG666xTgX6v1Sr9mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/nkckml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/nkckml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1F81F000FF;
	Fri, 25 Sep 2026 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790357157;
	bh=vqbbftagvc5RrWc60ar+tiKzwgArqbaZHAHOLJoaJIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/nkckmljYWXcqMe5MEAbcUmyEWfsjlm5lbbv4B8HLnGbDD1E9p8ATCaNkk9Ge0Xo
	 J7sbKkrqVxYxlIBY0PsUfsMig43ROxd+0/3+fcvkFwtp+Agb82RD/5mUuGrgi5cdCa
	 queuwxETICGk1ExoEeiiSWNGIrp95J7rcvlshOKpAM642vpFUfUUPT3hEPaKUNmAKf
	 lZPP8m463FoFHmtbQ2kOKMEXRo5VXVUFn6K//BMKHhsEQpHlERjmS4AVq3y8CvqrVN
	 GM9iiSSObtHq0yIk0S55379ztu05cyxXbruVD4W80SiG30TQVFC5t0c/hawXguF9bo
	 CqzFbVxUEGBUw==
Date: Fri, 25 Sep 2026 18:25:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>, lgirdwood@gmail.com,
	rahul@summations.net, anup@brainfault.org, lftan.linux@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <b9b0fb81-5a2a-4258-bf5f-eac91dc4b535@sirena.org.uk>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <48ba811e-e293-4e94-af38-5cdae4562739@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lMCewI6j6WlsEmdV"
Content-Disposition: inline
In-Reply-To: <48ba811e-e293-4e94-af38-5cdae4562739@kernel.org>
X-Cookie: Love America -- or give it back.


--lMCewI6j6WlsEmdV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 08:11:54AM +0200, Krzysztof Kozlowski wrote:
> On 24/09/2026 23:00, Mark Brown wrote:

> > That also looks like what the spec says (some of the description is
> > copied pretty closely from the spec).

> I think we should not create complete new bindings for one spec, but
> rather map that spec to existing code.

As I kind of said in the other mail what we're doing here seems close
enough to that - these specs exist so you can expose a regulator on a
platform that mostly handles them in the system controller (ACPI style)
for cases where some external specification needs the OS to directly
configure voltage levels.  They do actually look like regulators in the
system, if the rest of the system is described using DT they'll need to
appear in there so they can be plumbled in.

--lMCewI6j6WlsEmdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2rp4ACgkQJNaLcl1U
h9DgEQf/ev/rFRn1zowFYLxpvC1F7SxcEnn1ugjOp1iS4DSKfF5UqT/bxvBCw5kE
6Y2cjEgpsfC4C9eH/uIn/fBVGN9872aUeZRNRUyoGCZ073QReFnO/EgB6wsjKQx8
Wv6DMnDmlf3tdCxRikYbr1oegxiLLeYjnMUHbdzMuZEe/xc2LraSTtMiEhWGwI+C
fS58wVWMRBaoeGUIeTxh9uDD1rbbeK0IecPQUvXw1COnPmzO2zKdkCc4pE79cXYJ
sBwsJHNhqmpHS0a9A/KMDc3vGkJJFab3WVoQhwJK2WD1YwMApm0ndK+FNHe2is+A
xgRr7hlGTIfvjkx4X71DI6NZO6+3VA==
=yuxX
-----END PGP SIGNATURE-----

--lMCewI6j6WlsEmdV--
