Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDBA4A7CAC;
	Mon, 21 Sep 2026 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999685; cv=none; b=jSritQ+StMSoN3GVCgBVXRNJjsME5lLL+QXVGbbFNqRWOSc4TOhWAWHgSsGllCmShkN5JYb68Uotl6ga2bhzCq21zrMmKa+CuFnprQH3DxRVaxN+6oQHVOGwDI1t2Yc+YC6liB9LetJw8VcdO3hhoRGxHDA73qdgfWfNvXsGJ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999685; c=relaxed/simple;
	bh=S5sG1A3XoDYK7PQLLRxRraMQjEuEVQcEKffwpzDFrUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZDnh0zcA/cU/0Mq/e2tVjErgzIUzCCOigDkmZMTMzqw59dj7mjbsY645BV2V46JsfDrK277OKTRnF4PX8cfciTiw71OxYPD0yK1riL6zgSAIjG0FOFgg0WSO9hkvE0fJggvNpO+9BE3ileGUCBEcpB8W3cbeKaiTQr71ffCCGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPdZkt23; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPdZkt23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C371F000FF;
	Mon, 21 Sep 2026 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999683;
	bh=S5LuG6TB+e7i+ecPNoDn+NJhhCI4qxCBBTULVYHWi2g=;
	h=Date:From:To:Cc:Subject;
	b=XPdZkt236bQqL6HbGyHF1vWNt8P44Ts82mXVWDZIRKmPPBjkMGFidWYhC7iDxtoJ4
	 djIikMQ3ZQpp2uVDtvdHtyCtBP08MZx0fcU0RJi0UMA7ZrxCXdmCiT3Cm4qoAu51EQ
	 ZIGw724aHwPAioZW3Xv9dm9jeJnZ8LmsFF4v/G0YXeLuf3eYkO9xjp+256j7ldTHtQ
	 ZZXso+0PXBCon1MliDw32N1JXgr2sns1kiGFhGqyDSRDAJXsIvIjnjSKhjWpMwbwWK
	 w4BFvo4BTl2pacewjnJfNizUHt9UQ2n5+g+5QjGdApZuGKaFMvWq1AHff7A7tudjP3
	 1oafJUagh5z1w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7F1731AC55A7; Mon, 21 Sep 2026 15:07:59 +0100 (BST)
Date: Mon, 21 Sep 2026 16:07:59 +0200
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Carlos Llamas <cmllamas@google.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <arE6P6potQGCz4Ba@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mqDV2+535bVBzA+A"
Content-Disposition: inline


--mqDV2+535bVBzA+A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/android/binder_alloc.c

between commits:

  90ce81d2f4f35 ("binder: make shrinker rely solely on per-VMA lock")
  c8084d338eb95 ("binder: remove mmap_lock fallback")

=66rom the char-misc.current tree and commit:

  fd2bc059ed466 ("binder: rm -f binder.c")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(deleted this file too)

--mqDV2+535bVBzA+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxOj4ACgkQJNaLcl1U
h9Cw8gf+IWB17YL0EIS9wvuouLQtiKWkHB6sQZ1c0VBjyMjY9xYbj7ZB0kttt0XZ
G9gwbFuHZcIj3rVcCa4YOhTGpXvCO8cCRxmz3PP0k/i/vsG3O8kPwbC4BVeHcMR9
aOB8dA5+kSCr/Fit5LJaWTQwkPSIUNk0UGFsSlbVQcO1KSAkpviBcj89QXQnwtBh
iKyzn//YjlickDH2UHoCRx8cuGDaX+SWTQkACDEBd5S5XXFLGQG7A+/ORPspUXQ5
h62f/27mBxdArqzVHhzfVRw9Cao5LMjwM1MAXw7u0nfwzWWAAHjR3eRDusHuKseD
JCw+Ijb9X0X+twcpwiL21cfFjJQ6ng==
=hmE8
-----END PGP SIGNATURE-----

--mqDV2+535bVBzA+A--
