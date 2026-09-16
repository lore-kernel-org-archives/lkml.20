Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F606381B1D;
	Wed, 16 Sep 2026 13:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565620; cv=none; b=ZdBp9ZnLycAlqAqftldkiob/0VPRFvBVtN054PbOFh82pJs0n6NTzATc13ielvkpaSFlugJAd624am/fTJJYNrDZRnPfVMfrR1OMB3s15KJNSbfQOtNOIkwCyfIJkIzK1PB47Crit4Y/qNU7Eb5mm58YGiBYCgxZINVj6p/24ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565620; c=relaxed/simple;
	bh=Y4NzPUL9L4tIEd9zy59/7Y4AiYMSe/1eG0LgDQEaXsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTXplXX2G7OJNTQouHf7nxrL4aPkIzEMZaKPRvke2ULIMpS36w712JnljYwDFS0jbpknqP4+dQ6m+uEqMxY6xOTGGzmNwQE6J6oD5DborMePAAKWeRAnhfWM2S9LBI6/d1kpBE3i+m37l7+guGQoQgJu2Aj9zPvjqNDxkniksRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiBbjLOD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiBbjLOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4C51F00893;
	Wed, 16 Sep 2026 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565611;
	bh=48O5W+8FxmPWYMElE36wRWyIA2XwfxakENPtIBB9GHk=;
	h=Date:From:To:Cc:Subject;
	b=RiBbjLODw3pcQwKwCP/6Mv8N1W3Q/am+WxvzIZwUZj5F3U+m19zbafJmc7CtD+duZ
	 GmDjNescsQB4tqqcaDCEM7NKaal9P4WxpMXgPkz3m3RRScyamrgBGAMVy9wCPAvjDk
	 x64zU8VWyVoS2rFcdrmGI4jJQdvufxmI+fLk20elOWlbLqrexQ0zjzdW+QaA5c2TM9
	 P3fwovgCLyF3TlDcUhwHgBrqJsrVDF8sjGsB7UB49vmzNUCvKXBXAMYOC3Fldzu2Ai
	 a4uzGcosl4vrSpBixNGVgurEZdodL3qG7rDlcQlXcX+Vuq4auK3Mx9Bn+1eiNGMRQ8
	 Atgmh30QJXeEQ==
Date: Wed, 16 Sep 2026 14:33:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kvm-x86 tree
Message-ID: <aqqap3DngKznNrSA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+xw00WeumcH4DC+3"
Content-Disposition: inline


--+xw00WeumcH4DC+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-x86 tree, today's linux-next build
(arm64 kselftest) failed like this:

arm64/vgic_its_save.c: In function 'alloc_64k':
arm64/vgic_its_save.c:289:21: error: too many arguments to function
'vm_phy_pages_alloc'
  289 |         gpa_t gpa =3D vm_phy_pages_alloc(vm, nr * pages_per_64k, gp=
a_base,
      |                     ^~~~~~~~~~~~~~~~~~
In file included from arm64/vgic_its_save.c:24:
include/kvm_util.h:1062:21: note: declared here
 1062 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr=
_pages,
      |                     ^~~~~~~~~~~~~~~~~~

Caused by commits

  36a062568ea80 (KVM: selftests: Take the memory region type, not memslot, =
in page allocators)
  6c28a0d7cf125 (KVM: selftests: Automatically pick min_gpa for allocations=
 based on region type)

interacting with commit

  6f182db39fb00 (KVM: arm64: selftests: Add ITS table save tests)

=66rom the kvm-arm tree.  I have applied the fixup below and can carry as
needed:

=46rom ceedc17041d689c99453d14f867d6b0badc8da8b Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Wed, 16 Sep 2026 14:18:38 +0100
Subject: [PATCH] KVM: selftests: Fix up phy_pages_alloc() API rework
 interaction

arm64/vgic_its_save.c: In function 'alloc_64k':
arm64/vgic_its_save.c:289:21: error: too many arguments to function
'vm_phy_pages_alloc'
  289 |         gpa_t gpa =3D vm_phy_pages_alloc(vm, nr * pages_per_64k, gp=
a_base,
      |                     ^~~~~~~~~~~~~~~~~~
In file included from arm64/vgic_its_save.c:24:
include/kvm_util.h:1062:21: note: declared here
 1062 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr=
_pages,
      |                     ^~~~~~~~~~~~~~~~~~

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_its_save.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_its_save.c b/tools/test=
ing/selftests/kvm/arm64/vgic_its_save.c
index 864da01539f3f..9a8a65fd7196b 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_its_save.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
@@ -286,8 +286,8 @@ static void setup_memslot(size_t sz)
 static gpa_t alloc_64k(size_t nr)
 {
 	size_t pages_per_64k =3D vm_calc_num_guest_pages(vm->mode, SZ_64K);
-	gpa_t gpa =3D vm_phy_pages_alloc(vm, nr * pages_per_64k, gpa_base,
-				       TEST_MEMSLOT_INDEX);
+	gpa_t gpa =3D vm_phy_pages_alloc(vm, nr * pages_per_64k,
+				       MEM_REGION_TEST_EXTRA);
=20
 	TEST_ASSERT(IS_ALIGNED(gpa, SZ_64K),
 		    "Allocation at 0x%lx is not 64K aligned, GITS_BASER cannot address i=
t",
--=20
2.47.3


--+xw00WeumcH4DC+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqqmqcACgkQJNaLcl1U
h9DcfAf7B/BbRnFmcCTD3k09Y0n/hk4r9OCNe9IYr5IoWCx9QYR5E9fSey8IAulL
T8PEUaCA1nNJ4ABKGCH9dP4e7dwBRIDQ1ROQhjhcLdgSQZH8ju+sxiXPpRonITn6
3Giw/gF6H5FW+VJe6lc2BSSzsh/F0x7kI8YVBfmVn60Se6wE04s3wl00QBxk0KST
ZEkPDOWxouZDqySQ8p5bE6t+VcJOq1LBeDPCSLagSmzMVdyeTQDq4PfEFn2Jd7ZI
EOKEFLxSgDri5K4x3s+BedMOSR/of/4Qs9kNX6TwauDPaPXwGDKaoC/r97b5QcwT
9cA2deqZdeNfb/WIjdVSUw3xuG/mGg==
=nCXk
-----END PGP SIGNATURE-----

--+xw00WeumcH4DC+3--
