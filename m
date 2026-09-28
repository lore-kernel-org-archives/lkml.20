Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8954C1512;
	Mon, 28 Sep 2026 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604950; cv=none; b=g0sG55Hp+AWMfHUuxQUeYQLDLhahLkhmAXTRaqAMinUvG7s9kalDhP4aCsVzEsZlNOe9YS9hCYugc6nEYypdmFnoQIGMe0l6orKiyggJeJfLKo6JLulGq1KDsxxa4iNcIsCvwJHhSd9fehe6Rt79syXPgQTEX3scEMkG5PUhi0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604950; c=relaxed/simple;
	bh=OXwqhz1PThyexeiPghAjLV8f3X7WMITsAt8/7Gl9Lgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C3NlL1kp/Gr4+E0Hkyx7oz2iEEmaZrgFk2Pr0pBvcM7e3L53E8WwvCTtdyFVN5MmdMFQHt3QDd/NMyALu+TUkiRsSE+vycooa/gm+9gwMwlc4yvTwclxTWGd1nxPxwbk5t4Bty2LeRoDCIaRjzwFhrtxVSaYTBnU9dbI4Gt7u2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFqBoOZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFqBoOZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617621F000FF;
	Mon, 28 Sep 2026 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604949;
	bh=Skh8DQCp2nv3OaiAXzd2UCRfKEC6MN1BjZflxEjDB9U=;
	h=Date:From:To:Cc:Subject;
	b=iFqBoOZ/q7+B5CQwwc+M8uol5zHMsGlDQmpAYuFuc8s0lphnAjxwE2ju4epnoAKii
	 rIvcERcaUp9l8YicuDrzKdaPPjYg/kBMsUsV182dhBDU4IG1HfFiohiFttwKCKHlq3
	 4NLGsGPfFc8+ZgLZCDwq9dFvT365MfEwGYmdL2mGF3Jb16rfZJzA9ufFLjE/3K/wVy
	 0D+kWQmfQmIiDGEMCiurUB/JroNhWDojVONM8B01eosAFEgzSIZa/OPKsZ9xiTdaoX
	 JCmNM1NPEQu7pUsy4A5BNhm2lRQYvOdTEJrLNZ8kDOf6mV0Ba3bFUhs7iB5M4hc0QY
	 7e8khmS5Gq4UA==
Date: Mon, 28 Sep 2026 15:15:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Fan Wu <fanwu01@zju.edu.cn>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, Song Li <songl@zju.edu.cn>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <arp2kBw-3U_092_A@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DpoZFWxevV8j37Ow"
Content-Disposition: inline


--DpoZFWxevV8j37Ow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_v3d.c

between commit:

  94cf5971b1d04 ("drm/vc4: drain the hangcheck timer and works on V3D unbin=
d")

=66rom the drm-misc-fixes tree and commit:

  b4448823f151d ("drm/vc4: Use the reset controller to recover from a GPU h=
ang")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/vc4/vc4_v3d.c
index 0f0c090afa6e2,b40d98c9d1d28..0000000000000
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@@ -9,7 -9,7 +9,8 @@@
  #include <linux/component.h>
  #include <linux/platform_device.h>
  #include <linux/pm_runtime.h>
+ #include <linux/reset.h>
 +#include <linux/timer.h>
 =20
  #include <drm/drm_print.h>
 =20

--DpoZFWxevV8j37Ow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6dpAACgkQJNaLcl1U
h9CO8gf7BapEijDrI3TElqUFtxQoStsBUWQF4tc6K9wQCdCUkqeQ/+e1WP3nMVaa
s1EBs4mdVfPUual6BlmGnnc6jtjs4ae8UbEOV0UejDdhuHsgPwBLdfxy34GWe6Rr
ZXRZ1hng4gyNGAORh7NhZJ3GSIrUZYETt3gd8nBnOcQ0M1s7P2y1VVDejW243QtR
FPe/Gkfwn7F10vF4rwg2zUEaxLqDe621whBF32YBXluW5SBYeEEo8AWp/lBME2Wf
VZ/9zlEZWyy2NR529mqWkm4YS1aO++EyA+7XzYrMIAohx2eFmYatRVnJUXU4jp0y
zgo29C1QMvEcThq+r3H+49sJVk4Xkg==
=T1Ux
-----END PGP SIGNATURE-----

--DpoZFWxevV8j37Ow--
