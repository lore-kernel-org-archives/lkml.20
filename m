Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410444C51C;
	Fri,  9 Oct 2026 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574043; cv=none; b=IjnZvlQE2kXEZrVsCS8yY5AHmbFQKK4YgGY3Av20Mchor6AhAFzlmXKtR+OcEQ3+MXq9cqVX/8vnfsv7cS6ryRrSz7zj7co7zqo9MyU3sPq/AVQP158UWgy/wiCUr4fBuqzI74XoFb9HAs8PuLWUm3TL6FJbf6baWaZDwqRcEO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574043; c=relaxed/simple;
	bh=D7SD21DoMvVyV7YSdZe1MUn1giqdD95rIHlF8jqXGFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anXXd7/hFd1yocS+AcEDacVjV7UXV7b6yGLi43rzqrU5s2YeCNAXDxmIno812WD7A/aSbWwGg3kG0DotGCjP009BuMacdgTrxnV2bXWvPIXQDqYejfmsJ0rPHQDlM2xL7UWpZIaxWVv1rWCENBYTbzv6GoivVMOtVkXfzxvomGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f17/1qy/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f17/1qy/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016A61F00893;
	Fri,  9 Oct 2026 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791574037;
	bh=js4MQwhe0J98ovKD7yCqc27kGlqgykJcML1tKy1sLwQ=;
	h=Date:From:To:Cc:Subject;
	b=f17/1qy/cYV+gnaeyXQ9DSesbG/YLh3jqKHyUHNi4WRp0Jr/1TyEb+UeQXumvsOSc
	 U9N50bU1M+n0GJEsW0oURgkvMeD7XPU7NEaVLbltyAtEKlUFRLySZqb2GlvN9e5XWw
	 LtzrQq0GdsPV0NQ8cNYLkYFc5I92O8CFG0uv3/nc2fDxbeHfc2LjI5BZ8JDT99FEIm
	 fHi0zima6z5eI8/6+DmZ0S2oCAMDEnNBKgXPrwgl9ScaEsLXkrQS/EEoauQZSdFFTI
	 NuOvOD67Yyi7pYdikMMDRzlUk2+xmS5in19lrTknBpyy2j00oRDz19n0eJq3/znBVF
	 7lnDwklsN4ugg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B49A51AC57D0; Fri, 09 Oct 2026 20:27:14 +0100 (BST)
Date: Fri, 9 Oct 2026 21:27:14 +0200
From: Mark Brown <broonie@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Priyank Rathod <rathodpriyank@google.com>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Message-ID: <aslAEm5Qsgp-9xD9@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KaCU7AGt8SUjp5u7"
Content-Disposition: inline


--KaCU7AGt8SUjp5u7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/pcie/aer.c

between commit:

  79c168e2aa957 ("PCI/AER: Skip error recovery on false alarms")

=66rom the pci-current tree and commit:

  d4c842c3af5bc ("PCI/AER: Fix memory leak in aer_recover_work_func() when =
pci_dev is missing")

=66rom the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/pci/pcie/aer.c
index 922a726a52a50,c376c3adbefd2..0000000000000
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@@ -1373,16 -1370,9 +1372,15 @@@ static void aer_recover_work_func(struc
  					   entry.domain, entry.bus,
  					   PCI_SLOT(entry.devfn),
  					   PCI_FUNC(entry.devfn));
- 			continue;
- 		}
- 		pci_print_aer(pdev, entry.severity, entry.regs);
+ 		else
+ 			pci_print_aer(pdev, entry.severity, entry.regs);
 =20
 +		regs =3D entry.regs;
 +		if (entry.severity =3D=3D AER_CORRECTABLE)
 +			err =3D regs->cor_status & ~regs->cor_mask;
 +		else
 +			err =3D regs->uncor_status & ~regs->uncor_mask;
 +
  		/*
  		 * Memory for aer_capability_regs(entry.regs) is being
  		 * allocated from the ghes_estatus_pool to protect it from
@@@ -1393,15 -1383,15 +1391,21 @@@
  		ghes_estatus_pool_region_free((unsigned long)entry.regs,
  					    sizeof(struct aer_capability_regs));
 =20
- 		if (err) {
- 			if (entry.severity =3D=3D AER_NONFATAL)
- 				pcie_do_recovery(pdev, pci_channel_io_normal,
- 						 aer_root_reset);
- 			else if (entry.severity =3D=3D AER_FATAL)
- 				pcie_do_recovery(pdev, pci_channel_io_frozen,
- 						 aer_root_reset);
+ 		if (pdev) {
 -			if (entry.severity =3D=3D AER_NONFATAL)
 -				pcie_do_recovery(pdev, pci_channel_io_normal,
 -						 aer_root_reset);
 -			else if (entry.severity =3D=3D AER_FATAL)
 -				pcie_do_recovery(pdev, pci_channel_io_frozen,
 -						 aer_root_reset);
++			if (err) {
++				if (entry.severity =3D=3D AER_NONFATAL)
++					pcie_do_recovery(pdev,
++							 pci_channel_io_normal,
++							 aer_root_reset);
++				else if (entry.severity =3D=3D AER_FATAL)
++					pcie_do_recovery(pdev,
++							 pci_channel_io_frozen,
++							 aer_root_reset);
++				}
++			}
++
+ 			pci_dev_put(pdev);
  		}
- 		pci_dev_put(pdev);
  	}
  }
 =20

--KaCU7AGt8SUjp5u7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaslAEgAKCRAv73Ows9A4
iUZiAP42/faa30/nshFc5UL2EUUCHO8+SlPH+I2r6UIS0GsQZgEAvPrEvLRrLL7r
WLOPgSkjN+xCqJSVamuWNJD5wcDF2QY=
=ER1R
-----END PGP SIGNATURE-----

--KaCU7AGt8SUjp5u7--
