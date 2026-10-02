Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79285493649;
	Fri,  2 Oct 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942188; cv=none; b=nDdeLalT3XzuV9B9g4iMQC9+pvKkyvQjpO7fNgaQ6RJswYStBK8ZsyiCPEDeGykKERRe5RJOvFS2LL9ZLgtVjmosFzeMNYuyE6TRftXsk3iHtDzyn+YOS3J258DbJrs+UAa9cXgS5kXuSAf7CDVhjPaQ5Ju1K2O+JzaCGgfZfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942188; c=relaxed/simple;
	bh=jOcDRnklkMgmPm774oWtcfd9RDQ6pUOTDLH7EEg8Roo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZwwlzgMlQP/drAzvIjCD5Dc6+Ev9eRQKW80OUAZCOfgsFSPM9DCuyPkV6hh9AZDKOUuAfb8djP7aaZrgHAp2jPXtd9U8dA1BEPUzVjUtUUrdM/zDgPXoO60YMo/OnQt1bCGQQfmZxG8fLHWp8sGiu7zIVE8H2TOStwHvwwwnq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7sbB20D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7sbB20D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D411F000FF;
	Fri,  2 Oct 2026 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790942183;
	bh=RSfD30IZWnjtjXV8E3LRj/ELy85Jrj6EZVRalRD69XY=;
	h=Date:From:To:Cc:Subject;
	b=k7sbB20DiCj/wEmd/29BfuuG7B3+MUE82l1fDO1J1tUCZalPDtPKgp7W0NaOKquu8
	 ejfzORcEPiNeP3BdkEzxDHF5uLjESHWfwarla1R4lFyLwEwjdsNNM2PWlp17h+y3hh
	 MEjqw5KclBZIRnn0zyq8pDC2nT2HJrzGxSdxOvY6NL4BmgISfZbXgh/84V46FwGcr5
	 +mKvcWEH8KVZr3l/HEGo8zo1IDs6ON/g+NZUzrxKKKvQs9K/N4KA650yJdxTfLiW9Y
	 J6nB/rpPC2BfSVm7GXrDmFHcKupy8W12lsSDEVf7wBNRSr3km6qi2ojH602ylZVYaH
	 QNuHILfyQDw+A==
Date: Fri, 2 Oct 2026 12:56:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>, soc@lists.linux.dev
Subject: linux-next: manual merge of the imx-mxs tree with the arm-soc tree
Message-ID: <ar-b43IGJLSB4an2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7zVcKFgh5qLTfFge"
Content-Disposition: inline


--7zVcKFgh5qLTfFge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the imx-mxs tree got a conflict in:

  arch/arm/boot/dts/nxp/vf/Makefile

between commit:

  2e1031df3c5f6 ("ARM: imx: remove nommu support")

=66rom the arm-soc tree and commit:

  c90f5f176da7f ("ARM: dts: vf: add Iris carrier board support for Colibri =
VF50 and VF61")

=66rom the imx-mxs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm/boot/dts/nxp/vf/Makefile
index 1733506c0c725,47be8bc318e28..0000000000000
--- a/arch/arm/boot/dts/nxp/vf/Makefile
+++ b/arch/arm/boot/dts/nxp/vf/Makefile
@@@ -1,9 -1,13 +1,11 @@@
  # SPDX-License-Identifier: GPL-2.0
  dtb-$(CONFIG_SOC_VF610) +=3D \
  	vf500-colibri-eval-v3.dtb \
+ 	vf500-colibri-iris.dtb \
  	vf610-bk4.dtb \
  	vf610-colibri-eval-v3.dtb \
+ 	vf610-colibri-iris.dtb \
 -	vf610m4-colibri.dtb \
  	vf610-cosmic.dtb \
 -	vf610m4-cosmic.dtb \
  	vf610-twr.dtb \
  	vf610-zii-cfu1.dtb \
  	vf610-zii-dev-rev-b.dtb \

--7zVcKFgh5qLTfFge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq/m9EACgkQJNaLcl1U
h9BJlQf/TMX3BzXaecgi/O3zpBkQx2ZpOuoGYtc7QfWMT5vr9rqlbsnpmhmeiZvh
49RYjbiULuS9L3iNzx8l6YoMK45M4NwfE4lxb5KvIP8x9UhLG6RJY6uyGL2tBret
roGgT49fUT91x+1Df0/J5bFXd9kbXD0yAnos/pJ2whyUJq1bsRE4GkHIbm8tMJZX
JZxIbg8604tYm3IK3rvpTwpGCV0TEtTp0eMwh4t08wsQ+zl4HymMTy6OAjLlLmq7
5w6dqnJaczbXE8ffFeDwZ5kyFo+IALPtIkRW1kOQBKkeTbIhsjv1Hups/hEmD5EX
+X2oTa5RtoDfACScbp8obVRJw6RmnQ==
=X8t/
-----END PGP SIGNATURE-----

--7zVcKFgh5qLTfFge--
