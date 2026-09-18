Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1532B13E;
	Fri, 18 Sep 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734717; cv=none; b=njEYDPwr3wwQ5ZT6a1UpXrKKAVZ+W3BvAylmPqQdx4LB+AKow7GCHlBXz9KLLJmT6wBOarLyIsqpC6+FUhgNFB+QPqJyUcbMk60yuuauLSKjt0WoerkjNhIpbDgCa9NIUvSVFTghjQgs3xVsk5cv5FOZKQ0FEQLhmNO6bdkAQNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734717; c=relaxed/simple;
	bh=fO7tF4xVKRhHR0VMS/+uMtQleIqjcge7aHQVeFPn/sA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kKpZl7rpRTWwzuL4zxmt1RRRw876XHtaqPz/2yoUWcfQGcW6xHYD2jlvl5QcwZ/fDjN5NsNiF4AZPgt3Y9d+sCAZvbLMLPihanOiv7wWBmBoY2eYqsIdVtj9+6wF3NDFewb/7pUE44l2OtTVN4ieS7GoflYJ1Ps+EMHfBkMLxd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOEgdxUW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOEgdxUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC56C1F000FF;
	Fri, 18 Sep 2026 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734715;
	bh=mcbpFykktDTlxaKPErE7bYETrYZXM0BETFVgBMC8QSw=;
	h=Date:From:To:Cc:Subject;
	b=UOEgdxUWEmUbUzwD0gKEy2VwGwD5qM6cnt7FV/YlUCYwQ1t/EGBM7B4LDZvpIorAD
	 nMr8wer01WtYPHVmwQbSRSZFyqXuDoF/J6WLotCM4TXeF3KZuWCFLAg6Z5YEtrjBpP
	 ESXsqV9uYLNIYFvcBbuC5l9OW73DLU3EJzQnjLo+Gd1FAHzADqJzUOEhURKmSFThhp
	 9FigjmGrIndtOcU6unJILYBH2dSfmkz5BzAyvQ5qS68tQ2n66R8Vdr4A5vvp7kx3Eg
	 iDl7GOpSLzsK7S4UGULBnAhhTAPKgCJ6dm6wyUJJmDENNQ2JS8vAy8Ld6ZmR9iiojN
	 xx/jtsNl7jf9A==
Date: Fri, 18 Sep 2026 13:31:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Ilia Levi <ilia.levi@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <aq0vN0aBIt1UxQTm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gJMJjjEb7FBGVZjS"
Content-Disposition: inline


--gJMJjjEb7FBGVZjS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_mmio_gem.c

between commit:

  d0c0952878193 ("drm/xe/mmio_gem: fix destroy flow")

=66rom the drm-fixes tree and commits:

  fb2ee38bab802 ("drm/xe/mmio_gem: fix destroy flow")
  7cf85c190814c ("drm/xe/mmio_gem: reject VM_EXEC and drop VM_DONTCOPY")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_mmio_gem.c
index 5ffe03d361902,3cdc9538957d2..0000000000000
--- a/drivers/gpu/drm/xe/xe_mmio_gem.c
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@@ -177,9 -177,12 +177,12 @@@ static int xe_mmio_gem_mmap(struct drm_
  	if ((vma->vm_flags & VM_SHARED) =3D=3D 0)
  		return -EINVAL;
 =20
+ 	if (vma->vm_flags & VM_EXEC)
+ 		return -EINVAL;
+=20
  	vma->vm_page_prot =3D pgprot_noncached(vma_get_page_prot(vma));
- 	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
- 		     VM_DONTCOPY | VM_NORESERVE);
+ 	vm_flags_mod(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+ 		     VM_NORESERVE, VM_MAYEXEC);
 =20
  	/* Defer actual mapping to the fault handler. */
  	return 0;

--gJMJjjEb7FBGVZjS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtLzYACgkQJNaLcl1U
h9B9XAf/YfNr3EkAV9RH+nYVp0enJa3oQPViYXIad/rhKKwdJLaIu92nhqxHKCbE
wAI6BoYzWJvuOJl0WnqsFaRMTt3LD2k0vliSClV8F3Rh1BbeKyThRBL7q5W9tK3u
WpbPQXLxeff3raqVACZ1ktPHRlnrvVQbTHxDhys6cMlg9W8sgQS3/gm1hMfMV+on
Gq2tX/fWCeZeoKHm8pHN+pikjb0n7ia30xcwgUobM9gYjVrDE0thfjOZKZIqq1w9
YJnZTZd2+h7qbaYmj0IZvGO5B/hprtvy5QsCXQ1DIAtEpcri6Zd9DWXVx8ojqH/D
1LuVRVVEyPMawfpYJLwxUi/8OFieMw==
=fy3O
-----END PGP SIGNATURE-----

--gJMJjjEb7FBGVZjS--
