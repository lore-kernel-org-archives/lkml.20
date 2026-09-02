Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E30476CD8;
	Wed,  2 Sep 2026 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351235; cv=none; b=kQ+k0zLKACXUYXCupvDOVgvqxKVuyPlFE2zidwSHxl9sSYyeXjHG6bGjqtm5e8BHwYmv+ZIqPnnmQyPplcrpAoBsmSHXwYVk6eW40elWxeshmZy6e9d7Pb0rIuNREWawDxJghrkLetBjv+NO9NhIte9Ao+YVqkHvsqMvOqVG0Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351235; c=relaxed/simple;
	bh=od4PSKrAZa8RBy09FjlrGIRvWgmhYP8ZtWooLSpb+PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj8PGDzpO9sfgR6C5kwQ6JyZETkmFeZZuw264k4gNZr+DoYLahFb6xrM2qP1HEPap5cG6eyBpyVHl+VYf+zpTMjwBggyJONYlMLaP4jVUsTtK1wSiXQz5kV3ZNT/zH5BUbA+q+LbTrlKv/jzG/Zc6iO7lAFvQk9AeNwn66ADpxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fayqkXs9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fayqkXs9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386461F000E9;
	Wed,  2 Sep 2026 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788351231;
	bh=s2O1Tsm7w/qpAB8pn4EvmwDfGE5HdPYvnYladWk1CtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fayqkXs9CaWLk0bUat06OK86QlbZi3Yl4vMRs6Dnm62G9zecTNg59PXX0UwMbu5e1
	 vgm/uPH72MCSIm/XAuFCs/64UUfT/oZE0XDD2fOuoKqki/2ZpvCc4hOV2OqKcAYcdV
	 bxdrsA0Gc2PoPn1RV5KvAA05GyGCxg5VsCW+Si461MSIbA72ktO1NQvR64yv1WUm2G
	 fo4OgUEb9QmkezKIVtaYktwGmT5cN6WxFFDeOfVxicuIbZyNcGxYxRXuhGCe5auyWf
	 1OGa3fr3V4mZxqLmv/X91Lgs2wfQJ4+8nNCdjJxUZ7patkfkJdPvgy0vKdoy5IR8dv
	 UVWvAnuoYimKQ==
Date: Wed, 2 Sep 2026 13:13:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: linux-next: manual merge of the mm-nonmm-unstable tree with the
 mm,mm-fixes tree
Message-ID: <b76cab9b-8e50-4d84-8b93-8d1161542689@sirena.org.uk>
References: <apf4WaZ8D0P6W-FX@sirena.org.uk>
 <apgRMUMN6DVFmJ8u@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="clcZ1kR12U/lsiEc"
Content-Disposition: inline
In-Reply-To: <apgRMUMN6DVFmJ8u@kernel.org>
X-Cookie: Prevent forest fires.


--clcZ1kR12U/lsiEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2026 at 03:06:09PM +0300, Mike Rapoport wrote:
> On Wed, Sep 02, 2026 at 11:20:09AM +0100, Mark Brown wrote:

> > between commits:

> >   0d171c47f2be6 ("mm/secretmem: properly account locked pages")

> > from the mm,mm-fixes tree and commit:

> >   d2c5e077cbeaf ("mm/secretmem: properly account locked pages")

> > from the mm-nonmm-unstable tree.

> Thanks, Mark!

There's some more duplicated commits here BTW.

--clcZ1kR12U/lsiEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqYEvoACgkQJNaLcl1U
h9Dy2Af/XzzskNwfTNml5w8LTNn+0WID1cRZtRW+8fHIh8KuYuy7myLbgCbqS53J
qF1ysBlnzPQaKWRxz0wrLL+CRD34A+JXsszW9IPWlkrBFeBfsaPAWSVx42+EyL7W
o3l+H/8GKaW/+TEMYJmuApLPAfHK8O1IRGCsoWt0VF5mI8+zTF7KN9PmDnhrGDCq
pz5afpMDzd0hXqvVFnBZkpCHs7TMNgiRcZ5SR/Z2gMKyfXcVnv/MhbC8LKkfC511
c1umYhxJOqRnj/FVN/kizgUAbJG3OK9TXv3ImD8gNOdPc09FLJl80rhY97ugyCgO
WvKR9nYb3NbVqOPq7Zybl5rVqUfe6g==
=s8ay
-----END PGP SIGNATURE-----

--clcZ1kR12U/lsiEc--
