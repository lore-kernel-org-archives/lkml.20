Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93895678C2;
	Wed,  9 Sep 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963996; cv=none; b=MqXsC3s878JRW7NphQqoP2LpQ6tLPhnzUnHrwF2JxE4oWgP1a04//b1LPMddwsCglWxa8yUPzKSzYc5lTKH1+4lEZTsOP4uYwWYlS8IHMyQrAV0x+cdnW81mYWTEylVqVTdgqwE/qXn+HFwfPr8bLNgAok2xaGnNAd21MNklqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963996; c=relaxed/simple;
	bh=Mqiw9oQgPsYgz3xFcpvs/dsC5TaCEcR8iMUWAkOKQkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrVEd+KueaqjmZ69an7yAdF6zE568rZmhTYR9QTZhQqqZFJVZev1JRb80N66NWXChqGdVD+D6oOmpGvMXW9WZFbrmXRKfn6201Cf01ScEYYLk4ioXlwFcLsOP2Ih2yExNuNUzuswutxFaLl0u2ATeQDdHTsdNaIuQzERKUs/jM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gqv7M2VP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gqv7M2VP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23EB1F00A3D;
	Wed,  9 Sep 2026 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788963995;
	bh=hEiWUjxVqSaaGj61lND2vwaj5Pcb4DbNJUqDOiOHgEA=;
	h=Date:From:To:Cc:Subject;
	b=Gqv7M2VPHWs8a/i9urAxpMCU1DbPtjPBgvuay7YD7lUGJv4CWU+SofjUiT4V0YAQF
	 frSflfYmqD/lxlTX2e/xHpxGQLgMxpoQTj+T0dzXxBUTH52/+HXRfybqBdFcNp8UOZ
	 DrtZojAe+umyzCWSRzDessQvOUbpQwgtxy5imG+NB5fcANu+OsjO0m++8YwZDJovDq
	 sQ48moJUpJ0uf+r2J/C9CaX0ib5sRHGf6iRXZ0AErfB4Ucy446mGnnouTNWXtXamZM
	 w414l6kG3H5j5nNvfN5T/Efiyz17c8I1SLaxbVgkoQ06BZ3vnQCSLdwpn+ZAreGR14
	 J7as4GL92fVYw==
Date: Wed, 9 Sep 2026 15:26:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 9
Message-ID: <aqFslycxhWY4OG7X@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pPuTEkt0D2PVxv0J"
Content-Disposition: inline


--pPuTEkt0D2PVxv0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260908:

The clang-fixes trees were reorganised.

The wireless-next tree acquired a conflict with the wireless tree.

Non-merge commits (relative to Linus' tree): 4700
 4951 files changed, 267053 insertions(+), 68394 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
.re tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--pPuTEkt0D2PVxv0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhbJcACgkQJNaLcl1U
h9DfOgf/WmsVLEUFzDn4dlgPXCrkPtAQbd1bvMpaCUpNndiQ44kHb6H11eLJ+Dx2
Ih/0RWSWMhpPtC4DkXYPJarIDX+qycRzpA7xfGdQ64zS0FpxFaZzJnjYT2ApVqDC
zvzBrs51aEVvs1uKN6GjNg+yJKQ+ud6b4REU6ZpVUKDGW/GIZCpwZ4KQGY5stur1
u8VKIu+D2fzBzxrzs+f+RdXkomQi4wItYr3wwmlGjt1sBx9DLNZeEdEruN3tVIBj
fnGe2Y9HLZP/8kdm/Va0MniYJ8HKeCRZKFNYr8Ed35m+DxoGDUAuckASy/7oRew0
5frUGDH9px3nDHSgv7ImIWFEPohUxw==
=h2N6
-----END PGP SIGNATURE-----

--pPuTEkt0D2PVxv0J--
