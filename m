Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9778A2BE7DD;
	Fri, 18 Sep 2026 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732151; cv=none; b=mPMLDqG98Rs60nHtIQ51fyZIaS7fW7UvsO0H1HfSKLPScHue+aYmt3Ddc5n+w6qONVZ/w1RGHnUoBdxpbIOnmVIdJN2oICjILfpHi1UT1WV8OjQTJ9QtdjbMXaG9NnnT/3asBsGYt1ABja2BLLD1ilaF77+i4rLgqVdvGrH/7H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732151; c=relaxed/simple;
	bh=Yx2mj0oBpv4gvkXwas68yxQ3/QO1lkR0ggEiobduwzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bjw9U9dIOeK+nBcWrzm3RIPFxPQhQod3+4rNeB61+G+x/5EoQsggee3w4xIAWT9vQuwQDWFs8jzwuHGeuVjz3SAubiWBUiTrx6iUtsRMMH7c999maAbb/KDNtalIKnEbjuMxn82cuSR2xANmwOC9yDnaLJSgGcGZLzVhvvMCJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHl6e13r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHl6e13r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3AC1F000FF;
	Fri, 18 Sep 2026 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789732150;
	bh=bhGgjRseQgC/eEqxy1IqWrNlPeaAOmHZ05SQ/4+CZdg=;
	h=Date:From:To:Cc:Subject;
	b=kHl6e13rfNgTT8jhIuQ+kKdBbGBhoo2FYMXfNrZssyMfata50vkrXBV2J8A9x0d5j
	 n9leUG6ds4LzpH4cE22YCF/hxoE6s5/xE13zW8EMMiaP4bDlPyOytnee5WdsgXJVhQ
	 gOQv+cTIcAZlFypl3jB8udO+dCgzdTC1pMK+gmz1jX2kkzO+b4ifzYG4gcXM2Dy7aA
	 YiN7u61WlI02iZjCL8UWX2nixAE2u4MSdyVsDGkrtUUFN7WjT1THIawuaOH5QHMVX8
	 HHuKyIpfGDgk3uDEAsngxYwP4RaNFx1ZkY4trdckObd95BZcLmvwdBj5KwmC9rDQKi
	 3ORh6kg0kCV6Q==
Date: Fri, 18 Sep 2026 12:49:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-fixes tree
Message-ID: <aq0lMnjHbQIUW2aB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J7CLf5Z6i27KZd21"
Content-Disposition: inline


--J7CLf5Z6i27KZd21
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

between commit:

  04de4007d3238 ("drm/amdgpu: Fix GPU PCIe link capability reporting")

=66rom the drm-fixes tree and commits:

  7ea6a47224e2c ("drm/amdgpu: Fix GPU PCIe link capability reporting")
  15b2b06744561 ("drm/amdgpu: Reuse cached PCIe link device")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cf39db90dfe0a,dcf72ff438889..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@@ -68,6 -68,7 +68,7 @@@
  #include "amdgpu_vf_error.h"
 =20
  #include "amdgpu_amdkfd.h"
+ #include "amdgpu_ip.h"
  #include "amdgpu_pm.h"
 =20
  #include "amdgpu_xgmi.h"
@@@ -1353,31 -1354,6 +1354,6 @@@ static bool amdgpu_device_aspm_support_
  #endif
  }
 =20
- /*
-  * Some dGPUs expose their display endpoint below an internal PCIe switch.
-  * Use the switch upstream port to query the host-facing link.
-  */
- static struct pci_dev *amdgpu_device_get_aspm_pdev(struct amdgpu_device *=
adev)
- {
- 	struct pci_dev *swds, *swus;
-=20
- 	swds =3D pci_upstream_bridge(adev->pdev);
- 	if (!swds ||
- 	    (swds->vendor !=3D PCI_VENDOR_ID_ATI &&
- 	     swds->vendor !=3D PCI_VENDOR_ID_AMD) ||
- 	    pci_pcie_type(swds) !=3D PCI_EXP_TYPE_DOWNSTREAM)
- 		return adev->pdev;
-=20
- 	swus =3D pci_upstream_bridge(swds);
- 	if (!swus ||
- 	    (swus->vendor !=3D PCI_VENDOR_ID_ATI &&
- 	     swus->vendor !=3D PCI_VENDOR_ID_AMD) ||
- 	    pci_pcie_type(swus) !=3D PCI_EXP_TYPE_UPSTREAM)
- 		return adev->pdev;
-=20
- 	return swus;
- }
-=20
  /**
   * amdgpu_device_should_use_aspm - check if the device should program ASPM
   *
@@@ -1413,7 -1389,7 +1389,7 @@@ bool amdgpu_device_should_use_aspm(stru
  	 * the immediate upstream bridge. Use SWUS for dGPUs with an
  	 * internal switch so that this is the host-facing link.
  	 */
- 	aspm_pdev =3D amdgpu_device_get_aspm_pdev(adev);
+ 	aspm_pdev =3D adev->link_dev;
  	parent =3D pci_upstream_bridge(aspm_pdev);
  	if (!parent) {
  		dev_dbg(adev->dev, "ASPM: no upstream PCIe link for %s\n",
@@@ -1739,17 -1715,10 +1715,17 @@@ static bool amdgpu_switcheroo_can_switc
  	return atomic_read(&dev->open_count) =3D=3D 0;
  }
 =20
 +static void amdgpu_switcheroo_pre_switch(struct pci_dev *pdev)
 +{
 +	struct drm_device *dev =3D pci_get_drvdata(pdev);
 +
 +	drm_client_dev_acquire_outputs(dev);
 +}
 +
  static const struct vga_switcheroo_client_ops amdgpu_switcheroo_ops =3D {
  	.set_gpu_state =3D amdgpu_switcheroo_set_state,
 -	.reprobe =3D NULL,
  	.can_switch =3D amdgpu_switcheroo_can_switch,
 +	.pre_switch =3D amdgpu_switcheroo_pre_switch,
  };
 =20
  /**
@@@ -1968,15 -1937,26 +1944,26 @@@ static void amdgpu_uid_fini(struct amdg
 =20
  static void amdgpu_device_init_pcie_links(struct amdgpu_device *adev)
  {
+ 	struct pci_dev *swds, *swus;
+=20
  	adev->link_dev =3D adev->pdev;
  	adev->link_partner =3D pci_upstream_bridge(adev->link_dev);
 =20
- 	/* Skip upstream/downstream switches internal to the dGPU. */
- 	while (adev->link_partner &&
- 	       adev->link_partner->vendor =3D=3D PCI_VENDOR_ID_ATI) {
- 		adev->link_dev =3D adev->link_partner;
- 		adev->link_partner =3D pci_upstream_bridge(adev->link_dev);
- 	}
+ 	/* Skip an upstream/downstream switch internal to the dGPU. */
+ 	swds =3D adev->link_partner;
+ 	if (!swds || swds->vendor !=3D PCI_VENDOR_ID_ATI ||
+ 	    pci_pcie_type(swds) !=3D PCI_EXP_TYPE_DOWNSTREAM)
+ 		return;
+=20
+ 	swus =3D pci_upstream_bridge(swds);
+ 	if (!swus ||
+ 	    (swus->vendor !=3D PCI_VENDOR_ID_ATI &&
+ 	     swus->vendor !=3D PCI_VENDOR_ID_AMD) ||
+ 	    pci_pcie_type(swus) !=3D PCI_EXP_TYPE_UPSTREAM)
+ 		return;
+=20
+ 	adev->link_dev =3D swus;
+ 	adev->link_partner =3D pci_upstream_bridge(swus);
  }
 =20
  /**
@@@ -3855,6 -3835,7 +3842,7 @@@ int amdgpu_device_init(struct amdgpu_de
 =20
  	spin_lock_init(&adev->irq.lock);
 =20
+ 	amdgpu_ip_map_init(adev);
  	amdgpu_early_init_rlc_reg_funcs(adev);
  	amdgpu_device_init_apu_flags(adev);
 =20
@@@ -6434,16 -6415,10 +6422,10 @@@ static void amdgpu_device_cache_switch_
  	struct pci_dev *swus, *swds;
  	int r;
 =20
+ 	swus =3D adev->link_dev !=3D adev->pdev ? adev->link_dev : NULL;
+ 	if (!swus)
+ 		return;
  	swds =3D pci_upstream_bridge(adev->pdev);
- 	if (!swds || swds->vendor !=3D PCI_VENDOR_ID_ATI ||
- 	    pci_pcie_type(swds) !=3D PCI_EXP_TYPE_DOWNSTREAM)
- 		return;
- 	swus =3D pci_upstream_bridge(swds);
- 	if (!swus ||
- 	    (swus->vendor !=3D PCI_VENDOR_ID_ATI &&
- 	     swus->vendor !=3D PCI_VENDOR_ID_AMD) ||
- 	    pci_pcie_type(swus) !=3D PCI_EXP_TYPE_UPSTREAM)
- 		return;
 =20
  	/* If already saved, return */
  	if (adev->pcie_reset_ctx.swus)

--J7CLf5Z6i27KZd21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtJTEACgkQJNaLcl1U
h9DSGAf/VqKB2h62QUDt4ZOwAbqUTPQgFgYKsmVGBNMh8jUF1E3M5JjZXLg78dyP
3CWLW4RjqbeJgmmy+O6YzYCsq+fN7Fc2b08nnZD3BxSrk+C5akAXrjG7piejLCjs
de5Y7OlUFvNTsxkViDaWauaMJ8254dQ3k0uOGVGxDoOi6TNZlkAAztlFRnBez6q+
0a1xyH9iE+jiet51v+sC2xQ18IVhxk1uwOkoJZJDDT5/3d7fQge30F1MRvoLtV/T
JrhviDEm0NF8MpnrHoiVAgj3kGLwtEzPoJDYCFcOuOV2OUsFpibT/RRndcl5c8kf
IJ2fu9jpQUOGMTnwlyv3IRGRwbq/Tg==
=Xo+Q
-----END PGP SIGNATURE-----

--J7CLf5Z6i27KZd21--
