Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857170;
	b=DpfeMs47aYsFWiDdDXeSwclAnPLtaq4yL5TcTaAsux9GcqcGIdWd6VT/iRblUCH4T1B9
	 uph02OM2+ujjJ5uCH0ZqjKtyBWDZHDeNmHSxR3Bmy2fitzvMFtinVv28OOVmMGwmjJ9dX
	 9L2mVYXU6FYEDoG3DUXDJ/+kw6bIC2ErITaIDoxNL1WBm5ax34hxm3BUeIsH9anns90p7
	 IClsbHHVhM98jOfVxQZBveMIdJHrsyOB0SKPk4+wFmCRhdqv++x/VUYCziMKFNgQGNVod
	 Hirk759o+kzpfx2QYFEs2KdpoD5EEV4YlV4SM0U/CVoBtUV9wr8eazqqAdtU6zMn3VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857170;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=hOeb09sjE3McuO1NMO9QxIG0IpjBOCMaek4xXRv5sjU=;
	b=EffqJkiI3Oxhseuh5W3lMigTZlvM0I+kRc1Cvjtd9AAUFy0rb+iIYBrP7I7cgVve2I+T
	 EpUvbPcm3yJ4uXGIOLL3JwVVPDTXKJ8K1AOALt6trRKlQTURfa3A4RYdJJS13fSAu3MPN
	 rHltiSUB+CMAPE8hFESDpS2B8nDxX17sMXnVmeQ0sW29uZsiDy7qqNlYqKjesjmNK2JbC
	 GF+oVe3jbgOPCHThlGABLTfYjvkgMahPFw9+/NMTgEnYo902sFu2uL6EYnTf7ORtPfsfz
	 epktFXN0oBlQ6JDnyuUeQAOsaqoV44isblanM/25XcIkLl2UTZGksWWB1T4q2o2MntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="keJ5t/U8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B4606A322;
	Mon, 16 Nov 2026 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keJ5t/U8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992941F000C7;
	Mon, 16 Nov 2026 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857170;
	bh=hOeb09sjE3McuO1NMO9QxIG0IpjBOCMaek4xXRv5sjU=;
	h=Date:From:To:Cc:Subject;
	b=keJ5t/U8+1EIyhp5F9Ca+hmcWWggxb1Jl4PQVSMruUKIn6JBvAtOY7x3eG1lcpXSD
	 DHPX0NBJEn49AGGw11qIn5B8dffnkijxv7eWNly1V6MgDApJHRrZIYm+k8O8c33mkV
	 WszSjMRJWX5A4xOp52bHeBhlBjRDzN85OkQRn0DXEjUoXs9tweAtoDbEm8kn5fyfps
	 z7SpdNTi4vG2vSqypwrSw2/X6yu2gUdNQgvOsaq724NDQLbbC6tcYBzBpygeDslw0T
	 jloY6Bpv1HnZ/XDoAZ9HYM8QyDZ///r4iDctv1TnP4FlwFAj5u8uuvEpdgfQSEFXKE
	 Z+8ijAVezlBgw==
Date: Mon, 16 Nov 2026 19:26:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: Chipang Kao <chipang_kao@asus.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mingyou Chen <qby140326@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: linux-next: manual merge of the drivers-x86 tree with the pm tree
Message-ID: <avtYzidDS9_4b9QU@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="Zzr9e4yKgbbr4QHd"
Content-Disposition: inline


--Zzr9e4yKgbbr4QHd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drivers-x86 tree got a conflict in:

  drivers/platform/x86/Kconfig

between commit:

  699041135f75b ("platform profile: Extract the core from ACPI")

=66rom the pm tree and commits:

  ef696e89f836c ("platform/asus: Move ASUS platform drivers out of drivers/=
platform/x86")
  3abfbb21e1c92 ("platform/x86: redmi-wmi: Drop redmi-wmi driver")

=66rom the drivers-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/crash_reserve.c
index 53d76ba6b3c31,80092c86d586a..0000000000000
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@@ -503,11 -483,16 +503,17 @@@ void __init reserve_crashkernel_cma(voi
  	while (cma_size > reserved_size &&
  	       crashk_cma_cnt < CRASHKERNEL_CMA_RANGES_MAX) {
 =20
+ 		char name[CMA_MAX_NAME];
  		struct cma *res;
 =20
 +		request_size =3D min(request_size, cma_size - reserved_size);
+ 		/* CMA area names show up in sysfs and debugfs, keep them unique */
+ 		if (crashk_cma_cnt)
+ 			snprintf(name, sizeof(name), "crashkernel%d", crashk_cma_cnt);
+ 		else
+ 			strscpy(name, "crashkernel");
  		if (cma_declare_contiguous(0, request_size, 0, 0, 0, false,
- 				       "crashkernel", &res)) {
+ 				       name, &res)) {
  			/* reservation failed, try half-sized blocks */
  			if (request_size <=3D PAGE_SIZE)
  				break;

--Zzr9e4yKgbbr4QHd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7WM0ACgkQJNaLcl1U
h9A+Kgf+KSsKhsWIQ6wHVesbaf9iko4S2kJRjmZFojOupoHvy0bWle/dFJWMGYeK
yS2OzzBs1uBP4jjWLJ+37uc/Vy5yz6+nXlUjAI37R5fsVSJzUrV5taYFzDHJDjaI
hBc0lkK4YKMRS7DCik7oTqZwBMHTOF7r1csh/yvdK3Azryhzgp7L7dk3sWDiY2jr
XZ1kwBuv9z11/WEKX/fIn2sVmf/Coyu3EOqEf8vrTNy2dCFL3MxQn6ugvFFPJHWG
lt7su+qp5mRX88YRr+agMTepGwQ1DHr9JiwcIirK3efid33AmesSWd9M/x77ebmO
RJE/I/Lrm4Yuly+NCBxivSnm8EAc4Q==
=Vk5G
-----END PGP SIGNATURE-----

--Zzr9e4yKgbbr4QHd--
