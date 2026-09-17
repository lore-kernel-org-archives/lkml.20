Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8E053B60A;
	Thu, 17 Sep 2026 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656521; cv=none; b=Ys07s9Dx3GI0Ri9tEQYlxAeH32LBbLlfio+e0yVtILr3/+lqRsujxO1t9fsjqJq5QxLUCPJPRveRRpbcSbCNRXQYqCFy9PnddDb4ufClhGEP5lGOt+UIw7+EKVgFZB5kDmnddpibBLiBV4l9CzerIt8LqlRjV0vWOnTKqkKnkx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656521; c=relaxed/simple;
	bh=h31R//7CWT5REzPhHFvA68iPbH/eD2ZgHk6mQ0sVvVg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KeWwGveVy6xkvl6fgK0uJQqizylsI0h/pV1CszJPre1K1PgPWBIjqQ7b4fPctXRYv+iHoesHKrGZOIIO+lQmtIh3nF1ATa8dvuBX8F6ERkgk5BNmTl64sYXtbHeqs75rNwb1LaDxoa6/49fTeUNGVArEy83RcfNHEkNaGGiPJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnvAJqG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnvAJqG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152041F00893;
	Thu, 17 Sep 2026 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789656503;
	bh=CEXuUbKMpl75pxzhK0l1Q/VIvs73zL371HaHNSlTMi4=;
	h=Date:From:Cc:Subject;
	b=GnvAJqG3/vafCy92Ly17jGpagbHsyqCVTt5H3RwiTP9VZW18S3pvkzf9waaAB9dHS
	 jXcyV51K0ex1e+PHV6hHofpqenTCgez+g+7jxJ4lMUJ7uYBufsbCJ0vBJq1MUryntL
	 rev25XYlsQg6FLELRS4s4F+aOJiDIIhHlKx8plAORCKa87Ud7xUwshoLiVsYU2wdns
	 m1sNBt2Grw1Srq+wPauJwNIUKHV79N/mJYYih2aiU371O8xpe+bZwrERSF2hS4KSNc
	 a2WdQ7xaT3sQhkvRr2OAHMG8A27v5Ps07SCGR9eN9fuOGNt0AW+/N40cqWYzBc9Ynu
	 TDTpQ/aFq82Qw==
Date: Thu, 17 Sep 2026 15:48:19 +0100
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <aqv9s5QlajVW6i3T@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GwdGHuw4KAV8X5aH"
Content-Disposition: inline


--GwdGHuw4KAV8X5aH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/coredump.c

between commit:

  85082b509089a ("mm: rename is_vm_hugetlb_page() to vma_is_hugetlb()")

=66rom the mm tree and commit:

  ed84b0b1d0bec ("coredump: select memory types to include")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/coredump.c
index 4d03826dd2498,668debe0cb97f..0000000000000
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@@ -1608,10 -1831,12 +1831,12 @@@ static unsigned long vma_dump_size(stru
  	}
 =20
  	/* Hugetlb memory check */
 -	if (is_vm_hugetlb_page(vma)) {
 +	if (vma_is_hugetlb(vma)) {
- 		if ((vma->vm_flags & VM_SHARED) && FILTER(HUGETLB_SHARED))
+ 		if ((vma->vm_flags & VM_SHARED) &&
+ 		    COREDUMP_MEMORY_TYPE_INCLUDE(memory_types, HUGETLB_SHARED))
  			goto whole;
- 		if (!(vma->vm_flags & VM_SHARED) && FILTER(HUGETLB_PRIVATE))
+ 		if (!(vma->vm_flags & VM_SHARED) &&
+ 		    COREDUMP_MEMORY_TYPE_INCLUDE(memory_types, HUGETLB_PRIVATE))
  			goto whole;
  		return 0;
  	}

--GwdGHuw4KAV8X5aH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqr/bIACgkQJNaLcl1U
h9ArnAf/Re2DVNwereTnnlkbLkNUm2tefyc5KO+pUJPRfqhwSN9TeynzLExdiee2
d3NOQ/3KFmfjFAx0O0WSdotqUXV3e2wFV8TEIXN7EGogADIPIX95FpkclK23BFVO
rJlC3TXmKAoSv8sJ+Ze+FV9xhfWtpWsUDRNfSxw6I9VbncXJZ4BPyaHIba3ydRFm
4MA6ELcsLdXCYffJq16SZJWy6X58P5nUer3IbOvuTkGKvR0IQqOZWkYKoNWSr1aE
BH1H9w8ykjEsyqMJsIANvDnTJy4hFd+ToonW/DlZupYfjS22DNSee+qiUqyn/5bU
QRS+vgincYgw6B9zOmx2DOnrmgOyNw==
=q/7L
-----END PGP SIGNATURE-----

--GwdGHuw4KAV8X5aH--
