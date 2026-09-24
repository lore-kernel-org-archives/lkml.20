Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFAF407CF6;
	Thu, 24 Sep 2026 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283613; cv=none; b=jiqHQXQh1meQyuNdY4I0/GwxupPdbee/lYPNohYG1xok9E8Z/Frs3Vse9sQpu+vqvb0cmdcH7mfUTZpR2DUXU7Ym4KJOLULjYK6QzgsquY7VrmG3kyvrpbyGIhykrQW0J5sfAHpP7/3k+WlEeq1B/XnryQEGDIIEwsKW72HILLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283613; c=relaxed/simple;
	bh=JQPDeHCrBikZ5ToHRqN+loeZ1baBfW0+JipDOUp6tMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE7i7xLydtcx4+857L2UAnDkK3YJgo+0RWb8pfWXMuJ1UIV4fh5fneOPh21a0twQzGoSqRSGRhVgVY0+utTiggJ+I/MT+oCK29+IfhVImNMdsL5lcdGCLyCfngLnXwXtPy0h4GMBgUelyFj+53lIbH8aq/DGbZJEgUqQEyfTEvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwGm6clR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwGm6clR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D031F000FF;
	Thu, 24 Sep 2026 21:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790283612;
	bh=PwJOVvkMlxAljxs9EmNGUMj/t/l87e3L1ciWxDWzd3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KwGm6clRr+o4Amr6Ir9PjBd0Cr6AHQli0vJZChnR9ieVPp7HscV7TFVNwjcKJHVH7
	 Wu57k1gs9pzG79huOHxEB4pAINo5NuQBHs/JsxEZ82W4b3Y9Jfs9QHiw5hpsNi4TCh
	 eGaJSb1MYXEJJayozxMuJ7t7TWndogvg7qnY9Zn3AtUbQWEIaqdgcN/nqZ1X5hVmxN
	 EDESGUafnc/NrSfCHREDpOelEEnhzQtmBydqgaH8Fiv1D57XJhvVghD+sQ8M1sd7WL
	 LzYYlMOECN+xbRrsOPBmo8ZTocRi17sxTpihrR/IfO/SEWeH1HflO6UATH0HehFMkv
	 5TPeEyZmFN5JA==
Date: Thu, 24 Sep 2026 22:00:06 +0100
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
Message-ID: <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y+6on071O8QTkAF9"
Content-Disposition: inline
In-Reply-To: <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
X-Cookie: Oh, so there you are!


--y+6on071O8QTkAF9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 10:35:08PM +0200, Krzysztof Kozlowski wrote:
> On 23/09/2026 09:00, Joshua Yeong wrote:

> > +    voltage-service {

> There is no such service. Don't invent names. See DT spec.

Looks like it comes from the RPMI spec:

   https://github.com/riscv-non-isa/riscv-rpmi/blob/main/src/srvgrp-voltage.adoc

> > +  "#voltage-domain-cells" on the provider, a consumer lists
> > +  "voltage-domains = <&provider DOMAIN_ID>" and names each entry in
> > +  "voltage-domain-names", the way it names a voltage power domain. Both
> > +  properties belong to the consumer, so a consumer binding describes them
> > +  itself:

> And where do you explain what is that "voltage domain" and why it is
> completely different than everything else we have?

> No, don't come up with your own naming for standard things.

That also looks like what the spec says (some of the description is
copied pretty closely from the spec).

--y+6on071O8QTkAF9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1j1UACgkQJNaLcl1U
h9BDRgf/ULwJBqpkvE1nb/w6KJt9M73kmw7FUwKNe3U7s9SQ5BID77H3eui5NcGD
JAH0sWEUxQK+I7r0kyC817OZr+sMBi7ADiSX/TFEGVpEs3NzWuSNoIAUphm+ToE+
6Y/3OpI3OxL7V/O/45vJ81tjVHf4YTYdj6JLVW/bSwKEPOjH++mXaJyAi0WhZ+gO
hLVHYdlTzVUaH4/JRqiqmPs0tp6n9tgBPrhrAnYIsKM57xkeREVPhIjdAWUVa4l3
ZFg7R0l0XXG6wTZpGCRU/NTvWJau0sHXPtbkfrtfUSFskJYtt1L4lpwsEYOhYJFm
YH9kDyZ3K8DbnAQlZZfTbBLVNZ/9jg==
=/9WJ
-----END PGP SIGNATURE-----

--y+6on071O8QTkAF9--
