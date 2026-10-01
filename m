Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C4A4A8A1C;
	Thu,  1 Oct 2026 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859703; cv=none; b=YJeyo34/8xImDuAyxxfn+7nUPY78Yb6m8+4D8WsUX8pYa6ksizwiPCaIjIz9mWuM4sbWGp9hTbnbbtn7coE+ugqrZ2+fM9p9AJn0lPOcbfJkKM+Sw3W4nxAUQMBLsS4iWmZujFHulAb6Y1PZaXeYst/oJXUe0L/P1wrU8CWCAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859703; c=relaxed/simple;
	bh=LrwlNaFJ2v8hbqoa3sr+qtvzClnZmJg21s35C8glY+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZ1wVAJey+WWmyUKuQ4w6hnbpkJoao+kfFLyZ0UdPL1iRs00WHIiHH3GKzYPCLVSuonyqCrhff5bPIhekw3LH091M9qvK5lXb2eymqIWQUUrF7x4ToKwCwsYSty/1QS2gYHRAEZQBMkdSVeB+otR3/bK6ItBIeiAgGAGdnegbYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Opz1WAiK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Opz1WAiK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5162F1F000FF;
	Thu,  1 Oct 2026 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859702;
	bh=hGJfoccQkMV88i3kDFHhfxl8sJcMVBmVJS3DlubFORU=;
	h=Date:From:To:Cc:Subject;
	b=Opz1WAiKiYdNTbOiWx8StZCqrB2o4Vl5f3ArA/8pCTzsdE7H90x3jzh2drWayHHZd
	 Ar3sF83Ku5SNfilmaj46mtqZJK4CRLHH1bXom4Ec8ZjtK1q84j++5Gxfaq+ykpgX04
	 xJIttAiggjsrupf9FTRgLn7gOCqyxl887BVhMTBSTkzjQaigTD4AN0KuXImkavTAgM
	 d+wUQ4f0sL24tgPZDmRmwd+OtdDLXJVDwfUnzhf1D08RQvaLkS0NGkvHNlzVsf4+Qn
	 dL23jz9ZhyKlkf7BRaKPIHiOd9nBZpz8ccpBoa2AZeT/YNALaBhXzzBhbbo5zv5f5B
	 nZhRMXOaIpWwQ==
Date: Thu, 1 Oct 2026 14:01:37 +0100
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Oliver Upton <oupton@kernel.org>
Subject: linux-next: manual merge of the mm tree with the kvm-arm-fixes tree
Message-ID: <ar5ZsSo2ybT39BEQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ofTmahm9Ici+AgZQ"
Content-Disposition: inline


--ofTmahm9Ici+AgZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  arch/arm64/kvm/mmu.c

between commit:

  bc502b86a3cfd ("KVM: arm64: Use stage-1 leaf size for VM_PFNMAP")

=66rom the kvm-arm-fixes tree and commits:

  8d9cb659cbf21 ("mm: rename is_vm_hugetlb_page() to vma_is_hugetlb()")
  56104155616d5 ("mm: drop some redundant checks around hugetlb VMAs")

=66rom the mm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/kvm/mmu.c
index bf6d6526639fa,73c8492e85c4e..0000000000000
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@@ -1468,11 -1468,30 +1468,11 @@@ transparent_hugepage_adjust(struct kvm=
=20
  	return PAGE_SIZE;
  }
 =20
 -static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long h=
va)
 +static int get_vma_page_shift(struct vm_area_struct *vma)
  {
- 	if (is_vm_hugetlb_page(vma))
 -	unsigned long pa;
 -
+ 	if (vma_is_hugetlb(vma))
  		return huge_page_shift(hstate_vma(vma));
 =20
 -	if (!(vma->vm_flags & VM_PFNMAP))
 -		return PAGE_SHIFT;
 -
 -	pa =3D (vma->vm_pgoff << PAGE_SHIFT) + (hva - vma->vm_start);
 -
 -#ifndef __PAGETABLE_PMD_FOLDED
 -	if ((hva & (PUD_SIZE - 1)) =3D=3D (pa & (PUD_SIZE - 1)) &&
 -	    ALIGN_DOWN(hva, PUD_SIZE) >=3D vma->vm_start &&
 -	    ALIGN(hva, PUD_SIZE) <=3D vma->vm_end)
 -		return PUD_SHIFT;
 -#endif
 -
 -	if ((hva & (PMD_SIZE - 1)) =3D=3D (pa & (PMD_SIZE - 1)) &&
 -	    ALIGN_DOWN(hva, PMD_SIZE) >=3D vma->vm_start &&
 -	    ALIGN(hva, PMD_SIZE) <=3D vma->vm_end)
 -		return PMD_SHIFT;
 -
  	return PAGE_SHIFT;
  }
 =20

--ofTmahm9Ici+AgZQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+WbEACgkQJNaLcl1U
h9BuuAf/bNtQMvrwZ85fO1VARn6Th3vq7bvL0ijfbTwkbEn82cXkNrTn6F9KLZBS
hTSzcZZUV03A9RfTuLYEjtCbIuEqrK9IwpLGsHsaQRLa6kvz4wYwlL82ZcIT2UJA
/YvPb2lKu/gyPrV3GQ7XbmiOkztDwQVOIISKMMRDkVdtxLcpAhkSLu9QlKpFrzKJ
8s3EeGIAaMsWjr+xWnW4ciNif0Iscte3tUb4fuzzICbO1D45cllq4617cHV9wjRZ
TMniIvZBiFvg37z1ROvbdBRl4kvX4Ko7WEW2WWTk94uzmh1F8AHpjAIrvflzlhhc
pYMHLTiH3P44LptPjlECAE03AkQEgQ==
=RQxQ
-----END PGP SIGNATURE-----

--ofTmahm9Ici+AgZQ--
