Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647073;
	b=QTh9jDni8ocJfbcYTRXv+AOVtAmpl+bK6q3xTosbEgT54Nbjo0L+AFZoPGM6IaTWjdRU
	 R7Wcw8DVha2VZge1uOuojqUOJ0UbSulKZyHiglDXm7dSpNFfSaVd8UYaIuKPXbI9cPK/0
	 5fa54UjmbF3blBo3z0XEHbRozhbxILYfPe9cQn8lsyJmCOTJA81tkME5YJ7n5Jaw5FkBr
	 MzIK8fbUiAGftA0EPZMJy2Y7tbOl1CcgjL4nc8Wr6mrRSgQXqebkTHmjIsHuwRSt7v905
	 S99PLeHTz6KQ6Ot2G/aBmntmDhCNfBgqUyMaGlzJ1bgKff4Gl0phYcKOv1UQ7jH08Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647073;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=/BvsI10eotFI4ccYQ0bO5MbbNbTZEu74xghGdzxZ0bw=;
	b=gji4XKlHaUpZ7R8RN9nnZnOx90KJig64r21qYOfcmJ1KAPiJoUPtZXICxu+cDoEQaMgj
	 2MJdbwnEtYk8M5S/UIxRPAU9rnyuXrdJV7FL/EXoq05xF6av9iYITpENQMM+BPQZW/1a5
	 lpug8eHC2Bxt9Q+sAow1jet/xVIjCaW+dUD8rs0rblInuZ+o7pmY18H4FeIUBEbyCkohD
	 VO/hBUUcuaOxMJlsc9k5dyqE4zV7AZeTcHVH2fkQi8yaHJiHcVN3jbKlY9dhxoAHj/1l4
	 FmJY/wHBc5oJjyVT69yhdwdiHIcQsblvTSyA+X7jxlu13nB2OkZa/m2GiyMJcn2xv1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Grf2/mtQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B264606A324;
	Mon,  2 Nov 2026 19:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Grf2/mtQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7474B1F00A1B;
	Mon,  2 Nov 2026 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647073;
	bh=/BvsI10eotFI4ccYQ0bO5MbbNbTZEu74xghGdzxZ0bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Grf2/mtQ+QROHEH1KzGMtTYTM5qNC/Kou/zB6QXwZxEIwo/xHAra+SIC/iEA9/LCe
	 P4TiiH1D8U7Nz7+djrPSS7KvVqgHOHzykqMLc1CBClcMSeRkf5uz/iQ1jKauNjAd8C
	 i+Awp2VwsjRFtZAc+59LF3N7AFa8v01vUqDB59vcm1PWyoKbMIZcmL5vL2JlDDUmhV
	 EAiSbEmbfjHcQqK2RTTy81NXdxPIfejDtVX+iexGOzvchU/Co6157UB9w7mhMdlFST
	 wwyA2w1d0hxznZ6pGQvl8enh9PnFO0ZHtpau3IXUWsHWEMN1X9rZQ/PEPTsfWFlAK9
	 UgUY/S4zlq1hg==
Date: Mon, 2 Nov 2026 19:17:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg KH <greg@kroah.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	LiuJunyuan <2058432396@qq.com>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the staging.current tree with the
 mm-fixes tree
Message-ID: <2ac173cc-d840-4afe-a9ca-e2197c9be530@sirena.org.uk>
References: <auib_crbWYfKZw9V@sirena.org.uk>
 <20261102110214.26627fcf298c77b8ceee12b8@linux-foundation.org>
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
	protocol="application/pgp-signature"; boundary="yGUAmS71DtfVhYdd"
Content-Disposition: inline
In-Reply-To: <20261102110214.26627fcf298c77b8ceee12b8@linux-foundation.org>
X-Cookie: Used with permission.


--yGUAmS71DtfVhYdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 11:02:14AM -0800, Andrew Morton wrote:
> On Mon, 2 Nov 2026 14:19:41 +0000 Mark Brown <broonie@kernel.org> wrote:

> > between commit:

> >   88c41b4cb3432 ("MAINTAINERS: sort component entries alphabetically")

> > from the mm-fixes tree and commit:

> >   24934cb6b8cd9 ("staging: vme_user: delete driver")

> > from the staging.current tree, the rare delete/delete conflict.

> > diff --combined MAINTAINERS

> OK, thanks, that's nuts.  I'll make those two patches go away for now.=20
> It's not exactly important stuff - think about it later.

I wouldn't worry about it - the actual conflict is trivial, the diff
looks much larger than the actual conflict was due to it being diff -c
and MAINTAINERS being quite busy.  Just plain diff is empty due to the
delete/delete.

--yGUAmS71DtfVhYdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmro4dwACgkQJNaLcl1U
h9Bymgf/X35vzgT9WBb8nR+DXUMMKa6U10lLol0JGB+fuEvRIW9FBdOVFAw5q6SV
OIfw/CD91VEtCwN6j6JNhPsy1rTNempeejj5wbExpvFGALYOKyqMWG0SjHy/3G/D
IR3Hhq6dm9U0AQHTUeaievsigKsbSHQgYBE8BnMd+fDDS07G5hDdwwtaxV0TiPfQ
fYG2IbLt3ZHjtuL1itFoKoqhVSJlyrbUCf2+ht3hf44n/z9IL4NwsuaZ74JLlpxt
59ZXc+BB0wwCSRUsyFsbGy/0tVriFCwJpNYU6UX0ejt3Qt2vGzHZfGIy3lskjJVm
A/2HaeJn/yIRuQdNN9wNafDFyPXerA==
=D86m
-----END PGP SIGNATURE-----

--yGUAmS71DtfVhYdd--
