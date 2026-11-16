Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857161;
	b=IF+nIA7H1MvaTy/Y63HiYpRXfMjV+paarIgA6ikRK4wFx3kKMWyfaCHKmPiodXDu29jA
	 GBm/8U7/O5oXY2z/DWdRXmVBET8DlQAPawPp7k2Mztu8HxUmAhD3u/mfazS5BPxkan/BD
	 +DqDiT95kSuYcAxS0YtszBGDoGCcjda0yQwtq9fKLo2qHL/fjwXtcv4cBJFNccOkSSMh+
	 /vCO5LKMDWG877J5ob7rzAitMqG2fyeXoQ1LrCzYxF1ZCnD3tUF8Felv1X119jH2PDOc8
	 Hx3UsVAAcO4RelhU0FRbiwJiTrdMdQa+ybFHLKkATwnJ6XwggXNyf1LiIIIinxeFp9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857161;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ojcfXEWMBwoi3cdKtzZVlpdfUkDcJsSBvwXVI/k/ugY=;
	b=EUlMJsBxzE6qFQBF2zwsOT9tNMvtScd7eQJPLWhThPieoJl7YcqyYjihxEz2EmZ+QTNa
	 8TnwsX+qfdaEkZ3O9YqVDZW5qJbaM6g9COoac5W4vGXWSo0wYNfV0el0UYVGwEVWxz+iT
	 XU2GhqnJaQsDsc4dfpXPfDPxJVaLvI1GhD+wAep1Y4rqWMXQK/FuJkG3EOGKgzIZCnSEM
	 WqMT/XSOFMcOLysjEVvYJE2fgSmVdUqC87o9fr9aY2e2rRCQlEtE3g+ETzmJV8FIH4iEm
	 DsBVriu9tB8zlj2uAbTOYeIQoeIFO3WSkGoq9rAAt160md63aP4Fm5y0vzKVxBpZkoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7uXKNMm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19863606A322;
	Mon, 16 Nov 2026 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7uXKNMm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAF81F000C4;
	Mon, 16 Nov 2026 19:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857161;
	bh=ojcfXEWMBwoi3cdKtzZVlpdfUkDcJsSBvwXVI/k/ugY=;
	h=Date:From:To:Cc:Subject;
	b=l7uXKNMmkjsptYo1V1F51plZD6ELGRa+QNi1eAp+WQWYdAeEIADIHp7uY3aPFAKFQ
	 E/lDpnFJD51OmTWMfy/yoy1sQG0zAxP+g1TY+IKjoX+3DXx6h+sxFdrBjqiIMKbpTf
	 uYPscqpwjGbQI447PWtycC92I+ex7+vAJ7c9S6yB5mEc3vvnW9onRiEjxExQWxr7Ei
	 R/IvxIi3enZn6wp0Jo8QK+oda+OJ5/FGCaSTLI8M2RSEzvDcBG/3U3/V/31jqaAY62
	 AnpSqP3C2+H5ACnFa70F56dTrPXgwuEUDeIZtM4ydnf8lPuufHWU5FE3HJsXEie0z8
	 YpgBPvlLOPJOg==
Date: Mon, 16 Nov 2026 19:25:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: linux-next: manual merge of the kexec tree with the mm tree
Message-ID: <avtYxJJhIzPVDYVv@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="FMOXbPAuJqdC4FBJ"
Content-Disposition: inline


--FMOXbPAuJqdC4FBJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kexec tree got a conflict in:

  kernel/crash_reserve.c

between commit:

  ed27d3cb114dd ("mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory=
")

=66rom the mm tree and commit:

  941aef93e9e1d ("kdump: Give crashkernel CMA areas unique names")

=66rom the kexec tree.

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

--FMOXbPAuJqdC4FBJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7WMMACgkQJNaLcl1U
h9BSfwgAga54k8v17hRgyGqkODyIxWEYcjY+8zIifIyOJIA2ILHLxOZYJi6N/1i8
PCtVRvhmtyKf+9Fqljkcqny0ypWP8c+vE4qBRT40W9AZ6G8DCm3Jk9r3FDumw+jV
3AYbjnhQvtHSVhsCvE7JGy449bECUVtitcZKTdz1aNf9OmaNAULXM8hbII+vPkUc
ICJrAe4CXz+YzvPn7PBU2SMw9tzsa7NmazF4Ce4FEGDT1UM+7PHXtI6EiDNc7O3Q
da6kLkl6Xrus6N2+V3BhVS29PfaraUuEt6+1vpxP4fECSicCGqVHsLqqDG5uvZa0
a3OjE7yqXVE1i9zmKUGNpWGseunB8Q==
=0LiE
-----END PGP SIGNATURE-----

--FMOXbPAuJqdC4FBJ--
