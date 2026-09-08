Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D8521219;
	Tue,  8 Sep 2026 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859142; cv=none; b=NXDaDROnxJfJ7JIPQ/Ae60TQUKK533LmMdQmfpY8tc08VcT/WVuK5vED6BR/G2LOE6n3cCw4Vt/4NyfYQBdByGkaljB5fxaI2Xvb8N5E3NJPVASim20FDsgaK7qb++9lLDnbZJyr5TO52NVmNOkeRjeJ+FbfMGzn5f9oAFmtRn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859142; c=relaxed/simple;
	bh=jC952bHmiBBRZiJqd17i/7x1m+YVL1dngpkL95OZce4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyeAY3euvx8n4vbXuFObTVI/ubkOgE1MRDQ8bcjHg1cMOif6fmmHSHcGwB1LJ1TxnQ9f2m8NIsZvKazT9dSvVdCFHBRvsF+hAWO5Se+GQijA9hfymHO3mUM56sQhPV+sEyTcOoUJWCJ9eDiWlDegP7BnF0irZA18ascnyVhO+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB201F00A3D;
	Tue,  8 Sep 2026 09:18:59 +0000 (UTC)
Date: Tue, 8 Sep 2026 11:18:53 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, sudeep.holla@kernel.org, 
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org, 
	ardb@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap_RRSM7RBONvHaR@orome>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
 <ap2_926WXr7uAYVX@kernel.org>
 <ap6I1FN_2ylRzFXH@google.com>
 <ap-74AkHSGXbFCF_@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajtkrsfbue5mdrla"
Content-Disposition: inline
In-Reply-To: <ap-74AkHSGXbFCF_@kernel.org>


--ajtkrsfbue5mdrla
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
MIME-Version: 1.0

On Tue, Sep 08, 2026 at 10:40:16AM +0300, Mike Rapoport wrote:
> On Mon, Sep 07, 2026 at 10:50:12AM +0100, Vincent Donnefort wrote:
> > On Sun, Sep 06, 2026 at 10:33:11PM +0300, Mike Rapoport wrote:
> > > On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> > > > Keeping last-level mappings is interesting on some architectures as=
 it
> > > > allows mapping/unmapping pages from the kernel direct map without t=
he
> > > > risk of splitting blocks which, under the break-before-make rule, m=
ay
> > > > trigger page-faults the kernel can't handle.
> > > >=20
> > > > However, mapping the entire direct map at PTE-level is costly. So
> > > > instead, create a new memblock flag MEMBLOCK_LLMAP to enable the sy=
stem
> > >=20
> > > I believe MEMBLOCK_PTE_MAP sounds more descriptive.
> >=20
> > The idea was to have something close from NOMAP, to emphasis it is one =
or the
> > other. But PTE_MAP sounds good too.
>=20
> Could be PTEMAP if you prefer.
> My point was that unlike PTE, "LL" is not perceived as last-level, it
> should be looked up.

We were discussing the concept of enabling entire block mappings to be
removed at once from the linear map, so at that point "PTE"MAP may no
longer be accurate.

I imagine that in some scenarios we might be able to go to PUD mappings
for something like VPR (say systems with a fair amount of system memory
and we want to carve out 4 GiB for VPR, split into four 1 GiB chunks).

Thierry

--ajtkrsfbue5mdrla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqf0voACgkQ3SOs138+
s6EFrw//chVhQxMWtCxc+JK5ON8AveSiC1Dhl62Q8IhDi1Pr5AWMxC7K8li30qSy
0r+vt3im7cyLAkLE4+kAZXtHcCV1288tZZErEnuotKkDkGDaDExBqr5yHlPseVq0
2ekvvxz7mSRh5Wfxn5Tq+MYQcwUYACknVRhGjuplsa05oSZA7GWbViEHFVP25/Pq
14BkCYqXXj/NfSceq84ukKSePfpEG9Jrmnl7Ey73eyGHNeRvziLQC7qd9MuHwiqp
Jn9Geb830b3ufqnZK23k5BuEp/+lAGTkflZGTlEM5A6yTIEnvfVtpimFwGtHret9
L0HZ/xg087+Wj7Kdgu/VjdftAzj81qqnKT8dpnGWH4SwsTLtcRDqxpNZatKlVJsF
NJG1Q8yBEtB+KIIiSK/00K2im6bSroJoGbTljdLQVi/hjBkQuDHtugvyyycXYc5y
cLPWS6i+0eG+IWvM+wGH7zWT9kvJeyYWh8jH4qk/J0sTkVlz5IY25AOerpGGdx4S
slR0PSPzLmGm/uHHm6PpuJK8vjqKJkGmsLiXQ5XkrUgmOG8EkWHG9Uzx358zDsQg
AYe3yJ0IiuCS2fketV+KzHy7VqFU3tC9kgkyrIO3PJSJLSVSeTVFNJ3WTUJTEBBb
ztr3XvA0Jm7feoWXZzfW9fwBYnq+5ey+M+KDQ6qsCZGpgY7FCeo=
=5bgM
-----END PGP SIGNATURE-----

--ajtkrsfbue5mdrla--
