Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489964;
	b=16bK0VOBmgA+ZF78yRk73mUX4yqwG0rLAIboivxfTnxU5cjC/9v9BZaI3VZ74i+kJ2FT
	 uY+VbmPAImaWfPc3qhCZ+mvuu9i61Y46FsHT3DTEzj6joW3mzeriTaMOKHuwkHkg+zbti
	 ZUTdTRiB31QvFiOsBg4BCSi5L3pNF95XQgzpWvKkLD9fLP5CHWQDRawEi7JBDDIMuKyFA
	 GHQmZaIICnptR+tZ6nbA2oEqZAxhbZYUqky2oEwFH+qL2wp/9+IrBcbhElVhpZHslDJ/K
	 OxQvpD6fzI/SwaO4PJbaIxz2Ugr8Q99MEGS4rEoESn/IkQgkbZtRa4csShD8cWWShFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489964;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=zYRM9MtNeNslk7QcIWF7t4sAkiaD9Q9bb18oY5zf+m8=;
	b=edFkNhFrL4ZMzKk/+m2AR4uUvsDnquUMYnuVnAQfNRqgJjnI1yqdVWn4y9mmJRjgVqYV
	 3tNWZedotk7oKGm0VQWQWnxiQS9Ewi1M5Zh1Fb1mRvTojGPu+HrGtMOH37DP9Auj+nEX3
	 t2lBUPfHRr3D1pkXTwdnnPQ4hhEy5QzeqLQRKi/ock2nNqwCEY1Kfab3wRlJxAwZSxoC7
	 NWNHZJHDiJpUFvUvR9rvsRbthR5WNi3ZVJbodKaa8kurQkylDnNDmzjTHYozhUpqMWJqW
	 RwkJHXHEyHnkfJ0pho5nwCELu1dmM8RUBhhZcqACv2AAy/ofYGRE/WY/P34DwhY3m0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=imw78RQV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8219E606A31E;
	Tue, 20 Oct 2026 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=imw78RQV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD991F000C6;
	Tue, 20 Oct 2026 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792489964;
	bh=zYRM9MtNeNslk7QcIWF7t4sAkiaD9Q9bb18oY5zf+m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=imw78RQVyqxXyXIfVMuonDQMs/i7Eb+6b7LC3lr+cWorJbzGr1bDbd73vaSghnnQ2
	 FKM0pBrRWWAOucPFcZKWr6F3/GmwgTFkKoEaH4uCHjJrUx1hzQTnnWk6JQgF7FXsp/
	 fSPOlqDeYM+2EnX7JBjLcrxuzsgg5K0TblULfj80ku/rtH1NxTfux4364HakOKuglt
	 /sMQEWaJx289+o6e+bZAq4UQgjz5nT8QC/34D1NbzZQ0dde4u1EW9hJDDucAa8eHJy
	 TAxWKafkTwtosxh5nc5w/Wepu6I5eqOXnN2M/CmASSuoN3e1eLuEGdjjQc5WWtmn4h
	 dRN+hczysa6kQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A2BF11AC57D0; Tue, 20 Oct 2026 10:52:41 +0100 (BST)
Date: Tue, 20 Oct 2026 10:52:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	luyuantao <luyuantao@kylinos.cn>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <atc56cq8Vhz_2M_o@sirena.co.uk>
References: <atZBBqj4ON6kYWSK@sirena.co.uk>
 <20261019190959.799653-1-lucid_duck@justthetip.ca>
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
	protocol="application/pgp-signature"; boundary="gZRriHLnrYvZPd15"
Content-Disposition: inline
In-Reply-To: <20261019190959.799653-1-lucid_duck@justthetip.ca>
X-Cookie: You buttered your bread, now lie in it.


--gZRriHLnrYvZPd15
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 19, 2026 at 12:09:59PM -0700, Devin Wittmayer wrote:
> On Mon, Oct 19, 2026 at 05:10:46PM +0100, Mark Brown wrote:
> > This obviously isn't the right merge, it drops the fixes.

> Two of those fixes are mine, so I had a go at it. The code that draws
> the panic screen was moved into drm_panic_helper.c in drm-next, so two of
> the three need to move with it. The third one, for the panic screen
> setting, made it through your merge fine. Today's drm-tip has the same
> gap.

Yes, quite - the move causes issues with tracking conflict resolutions
unfortunately since it doesn't show up at all to git's idea of a
conflict.

--gZRriHLnrYvZPd15
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatc56QAKCRAv73Ows9A4
iRULAQCs9sAS3y+L+3JqxLeJygjCnoKRmyMdvhZ/rwLzPaBMeQEAy5JzFJn9OBZj
dK3aiCovcvVy7LSBbSTfBsMZ++Kw3w0=
=64z8
-----END PGP SIGNATURE-----

--gZRriHLnrYvZPd15--
