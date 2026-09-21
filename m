Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537804570EE;
	Mon, 21 Sep 2026 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992062; cv=none; b=lijQ1JMGD4NmqzhmX9b9oi76inTRkPdMeBQiKxCfTxplR8w9eot4MnZLEAkVlmJSg/9AF3LhVPlK/4ia04/BeuCy1IXq9gAIuyTuYZ2AZ8QSSpx/lSsvowfQxE/CoHbPNr0LJChHtREmGqpbOf9u6j0j9BHZNRTlJwj1812nUAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992062; c=relaxed/simple;
	bh=szPsIkpaK1eqGplbH/7ezCBMSCYHWs1TtIY3iLOXh7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E5sU5JYlvxE1CfZV+ZRCFktnTLAHQZmdZX9kn0gChtSVQ8PLBVVpioCmJb90lwoHL/ebmdepijgGj4w7b2x2c5EMM53Dqy+jNpSSELSbYO3XyX0lVgP66LGb5A/j8C0Ciw1vLiAYCeF2tOWGTcgIvex0YnLPrTPMkAzahyE1uZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aa8uSrnH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aa8uSrnH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED291F000FF;
	Mon, 21 Sep 2026 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789992060;
	bh=zUC55LROEiFwXMeRcXEt/SWt5WnEKav8EfqNxM6wbr4=;
	h=Date:From:To:Cc:Subject;
	b=aa8uSrnHGKtj+GcLhOSrW6T5Stp/UZySGhQVOkaFUJV6XYMph7XcHi+zxYRr3aKK1
	 F9uSWhDjNH18APJNNOU6hRbjCIWlDlBiSsuWzUoFxm6VLz+uV9EtGT3ojFy2tLrpVN
	 yy10zYDUbx2IAYnQq16ysa/DSP8r9x8cr/LjWLJXZfF3YoJIn217fOk/thBXTIMNwZ
	 Eh6548ZuU2tJgx51VYtsL4ca5uJf8ACEphQWsqgxlGxEZIbgz9/wJ3jfZ9YiFXh9QT
	 lR/m7xj9G4UHhWi4TdQKkE9fMeJ6bul0UuJe462vjbhORxS4EXOboacQGWOddj+R6V
	 a9OjZR51zYitA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 00AC21AC5367; Mon, 21 Sep 2026 13:00:55 +0100 (BST)
Date: Mon, 21 Sep 2026 14:00:55 +0200
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
	Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <arEcd0vIRVds2efB@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x1TgybkvmLrQMBdl"
Content-Disposition: inline


--x1TgybkvmLrQMBdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_pci.c

between commit:

  41dae8ac5a3e1 ("drm/xe/pm: introduce PM PME support")

=66rom the drm-intel tree and commit:

  320662381ca24 ("drm/xe: Poll GT for C6 before D3")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_pci.c
index b134d90c01a1c,d66d5a0339ae3..0000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -1380,9 -1379,7 +1379,9 @@@ static int xe_pci_runtime_suspend(struc
  {
  	struct pci_dev *pdev =3D to_pci_dev(dev);
  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
 +	unsigned int flags;
 +	bool pme_enabled;
- 	int err;
+ 	int err, ret;
 =20
  	/*
  	 * We hold an additional reference to the runtime PM to keep PF in D0
@@@ -1393,26 -1390,21 +1392,37 @@@
  	xe_assert(xe, !IS_SRIOV_VF(xe));
  	xe_assert(xe, !pci_num_vf(pdev));
 =20
 +	flags =3D memalloc_noreclaim_save();
 +	pme_enabled =3D xe->pme.capable && !xe->d3cold.allowed &&
 +		      pci_enable_wake(pdev, PCI_D3hot, true) =3D=3D 0;
 +	memalloc_noreclaim_restore(flags);
 +
 +	xe_pm_update_pme_enabled(xe, pme_enabled);
 +
  	err =3D xe_pm_runtime_suspend(xe);
 -	if (err)
 +	if (err) {
 +		if (pme_enabled) {
 +			flags =3D memalloc_noreclaim_save();
 +			pci_enable_wake(pdev, PCI_D3hot, false);
 +			memalloc_noreclaim_restore(flags);
 +
 +			xe_pm_update_pme_enabled(xe, false);
 +		}
 +
  		return err;
 +	}
 =20
+ 	err =3D xe_pm_wait_all_c6(xe);
+ 	if (err) {
+ 		drm_dbg(&xe->drm, "Resuming - GT C6 check failed!");
+ 		ret =3D xe_pm_runtime_resume(xe);
+ 		if (ret) {
+ 			drm_err(&xe->drm, "Resume failed after suspend was canceled");
+ 			return ret;
+ 		}
+ 		return err;
+ 	}
+=20
  	pci_save_state(pdev);
 =20
  	if (xe->d3cold.allowed) {

--x1TgybkvmLrQMBdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxHGYACgkQJNaLcl1U
h9CkQQf/dE1YUzDS64vYqjZwLlvC9ebthcbsfyxPgiHuYQZ8yX2RusLdi8spi2Hy
7k38jzAuxfmsEk+u4WzwSLthEuJAcjsD5CCRPoA8aFSS5w6tKkOv49iT8619KZlG
Krp7l7GpmRQ1vDTWD5Kulgw+4vaEwVBHyj2TMDMjMNZRxab0+MONzG3wOm7j6hw6
dywfnjNvw+9yJbRLe0ZLPIHpRVd6hVHdeyG/G0sY8YSkdgytUYIqNSamBMhvWI6E
usRoI0/Xwdf9eIWi+snRHKXutXQnt1Jj71fGpeFH4V34w5DB4kAgtL7bYM4rQWS9
zdKH0m/OowxYj/Htgd053ndJ4e8Jog==
=tRQt
-----END PGP SIGNATURE-----

--x1TgybkvmLrQMBdl--
