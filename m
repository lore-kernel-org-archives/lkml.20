Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884B305687;
	Wed,  2 Sep 2026 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347975; cv=none; b=XxJfCW/AwICA6/XPueNDeBF1licARZNGOha1XWylbu/KrUQ8UinT0RolDaopJCLhgmXkeH9uW4w44Zzxvf1Ok1jrWeHm1eyX9aR+XLk4tBCQEnFZ/FUbaa/DQm+ovPbpZw/rfWzoQrkiCEaiV+LLCo+cD1CgdBBYBmem/orqVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347975; c=relaxed/simple;
	bh=4LvZ9PqtgcggCZd3tDUGCjpCFp+kN9mm4Zh3uStSNrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+axxpX9b0HdCgAMVWk6S5ox7k+cEllE9wKQ1BiGxR4bs8pXEyqNzZ/MhlyYN0dDoJlxjAAhOzeBqLSnzxVjFufD+aAUVF5MTRXWCdGiAUFC/XhGDu2z8UgIEYCoyjBVr/Ht/DfP15jKIyF41Lx81pi2tkHh32qT2gzGb6wt+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mln9H3Kn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mln9H3Kn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3081F00A3A;
	Wed,  2 Sep 2026 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347974;
	bh=+IZTwb+E1OTr2rUeuSI94jYinu97cokF1KkJVTcQXhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mln9H3Knc49z8nhdMjeRoxUTGKFRcOPvvHDl8nfHwnkq2y5RN6iPMm4k5wDMCy+Ah
	 g+9dLZIjCuVIpw0t0t9PP6rraNkze+DCdjFipcBkBwZJmzgEFj3gTvaVSayam1Spqx
	 TQZQ2wjlDGjUX4HMwRYUjj3tRI+8lMziK6oW9CWuod2QXVlAghddqTCBP/wBnznW2U
	 Cz+SuRNMbkUba2PK8zgRecgZ5O21IVB5A4Nqz8/9LJEaI6WWkJ+LvVQ3QXGD1L6rxy
	 YajO7qHIaoefpAyJvJ2GZbRQzbgnwp9jyqOQmkrq/JDO3gD2YnKKKNXd130UamCDKu
	 P1hjcwnXxjlFQ==
Date: Wed, 2 Sep 2026 12:19:30 +0100
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm,mm-fixes tree
Message-ID: <0ba3c22c-e9bb-4a3f-b5c3-63e00a5396ee@sirena.org.uk>
References: <apf4WaZ8D0P6W-FX@sirena.org.uk>
 <apgEi1GacpI4T5m2@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R0V8Vz8j69G/Zdxs"
Content-Disposition: inline
In-Reply-To: <apgEi1GacpI4T5m2@gremlin>
X-Cookie: Prevent forest fires.


--R0V8Vz8j69G/Zdxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2026 at 12:12:22PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 02, 2026 at 11:20:09AM +0100, Mark Brown wrote:

> > between commits:
> >
> >   0d171c47f2be6 ("mm/secretmem: properly account locked pages")

> > from the mm,mm-fixes tree and commit:
> >
> >   d2c5e077cbeaf ("mm/secretmem: properly account locked pages")
> >
> > from the mm-nonmm-unstable tree.

> LGTM, thanks!

BTW note the above duplicate commits.

--R0V8Vz8j69G/Zdxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYBkEACgkQJNaLcl1U
h9D/Cwf/bWF8YuWy3UUayOVfHbBpXpqDyIg1ckx/OFqTvo18fBMb6jo1D2lh645+
ixwzz7Sas6576dccpo2SC/RxZ70gRGfnBpgPbUfNp2TlfukSThll9GWx8KypxZvg
/spAhoraZnhT83UZgTfDYc8EZqnhvqD/eDKl9TSQXhZs+Y42uzVf8FUeDSt9EkqJ
b/Qt/B4/c41YoNmqTjioR7TC3vW3AA8teHiiPma+M21yeQCkRIEWrKdd54Qdp4Ua
YmCe7mvjXc5z+KHNTtmUQYvw3qE4jrMDOAPEE2YcwHjTLEuUR9Tjc4NISryLsXaa
OeOn/WkAzpOLp8GmIpJWVsa2qsdbSg==
=Qq/p
-----END PGP SIGNATURE-----

--R0V8Vz8j69G/Zdxs--
