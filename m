Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130E331A65;
	Tue,  1 Sep 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270700; cv=none; b=Rmxdx9lvzoD4xPZtsPgpLwtBPhlzyh/axYhtSpkSXZPu3OLDBC7v4vpMGs5XSLtdCBqsYM6TmUYA/VfRiYV7QdErIt8gceB0YGqj5ezr/svpC1gbCzRUHSTBCOj/MLpyYTFcVyp5038UI+0EN4dhfOz593YQWHBSbCeBg1e4ZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270700; c=relaxed/simple;
	bh=4Xuos49IPoauE99zrGQFRWII2CylA02umuI6lWsww+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TI1opTeRe1+hmFDD6W7+Ej+4o/sNdUXfvTTPMV/dflVSZncJAS7lmJlHfx0j+uvw4u9HeR7lXL4jvhlqcuhSyRyFq+dPF03sHOm0fq+UoI8mPevxGy1JLTkZ6rxtvl65j6KIfKKNDY/pJMBfzSMkNlFANqsmPYyHwuEiWkDiQkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAEwh2IK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAEwh2IK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5F01F000E9;
	Tue,  1 Sep 2026 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788270698;
	bh=/S9xy+0id445pRZ4HT0+mbuF4ZnCmPIWndTZ+BoBlqw=;
	h=Date:From:To:Cc:Subject;
	b=hAEwh2IK1dsOk0pyrpwIC/kVMg2f7OLFgp8cM6I9SVBwr2IwIfJsLcT1Vat5Kaizi
	 k8pq9Rj1Ya6BmyaTCBG1hkuvTG5rZBOrF+t0dwLtwpuohowqwQ8sgvbbRJbgNvywCs
	 MLopCRhi4EGo57ivfXjNHVkFGgaOvSqR6WKsEIoHVhEKHonGEMMboqFTVQSSDbf/LA
	 dEHljWROj6/gX7Qrdv02eD8X/0Yl45fORgh6ATk2idf3Qfv+/tppM9q+JlQRp7sNop
	 r2/b0ZfYR8KAmI2WuKnPIjW5Gv/bdenJsaP7xfQRFWip7aJBjVW4dMMg3T2P7SAWqJ
	 lEnKRFdzzEJzw==
Date: Tue, 1 Sep 2026 14:51:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?B?Suly6W15?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: linux-next: manual merge of the security tree with the
 vfs-brauner-fixes tree
Message-ID: <apbYZsfaO9BnB8nm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MU9XK5rAkYaEX5xa"
Content-Disposition: inline


--MU9XK5rAkYaEX5xa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  include/linux/ns/ns_common_types.h

between commit:

  82e9343260dfc ("nsfs: keep namespace tree fields stable until after RCU g=
race period")

=66rom the vfs-brauner-fixes tree and commit:

  f675d2e955696 ("lsm: add LSM blob and hooks for namespaces")

=66rom the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/ns/ns_common_types.h
index 6ed6b497831c7,5cfe0ce3c8818..0000000000000
--- a/include/linux/ns/ns_common_types.h
+++ b/include/linux/ns/ns_common_types.h
@@@ -116,8 -116,13 +116,11 @@@ struct ns_common=20
  	struct dentry *stashed;
  	const struct proc_ns_operations *ops;
  	unsigned int inum;
 +	struct ns_tree;
 +	struct rcu_head ns_rcu;
+ #ifdef CONFIG_SECURITY
+ 	void *ns_security;
+ #endif
 -	union {
 -		struct ns_tree;
 -		struct rcu_head ns_rcu;
 -	};
  };
 =20
  #define to_ns_common(__ns)                                    \

--MU9XK5rAkYaEX5xa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqW2GUACgkQJNaLcl1U
h9D6+wf/UXlhwUWf3PxsNsPRbJL0E5IiMqtoZd4N/HWUaK704ThLlMshO1ZgoWtM
ObBXJ6llZHSXQQ6HNJQ6hOzAG7lcjOJt70PguNBbKc1N+FXdKKzTPQ9ghW8oFMJ/
IXSx+42KYISQTahDf7x1q7qpVOvgBtlkK5Wddv1yT/UFUUC/foCHeCEhoJ9A/stB
cWgxPObVGv1E64PCaBTLVzpAfOKlLPpJy467qTvSOwEoqnaPh48SH5kDEazgnZlE
dUR2RlczXajxNfR1Cbmdhly6tlNAvvGJV2n1n86fnXx1yMDmduZOKkyEBlZlDuB1
w17+LXACJ0hz6YECippQpv23XEyk6w==
=d8Kr
-----END PGP SIGNATURE-----

--MU9XK5rAkYaEX5xa--
