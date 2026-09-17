Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5EF394785;
	Thu, 17 Sep 2026 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656535; cv=none; b=kXuUVjVqYcYJNOf82HgNQbpN6KXfmVBe2n6Ms0jRnwcvaErmutcW+8hBYCYYrBuuTWYAHNUqtD8xojBU4ZH3WQbBIVtYoTsv0OGgQ4l/5BZzDqCOzd3v0Fwm1KJLZrHxGtLr0ox0nhuCOhPiPTyCDVdE+DFa4KxPkUSJbOBSEMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656535; c=relaxed/simple;
	bh=jzzLjvzIjnMaEoDwEuV+M7Tkl8K5c0vVFPHr7NRFxQY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J1O9x40jXIQIkwU7fiBoMpmzHum4lCaeyVjkeepAmF/dfNvCBxitfA50Nr32CsEX7nXGaAO8oTeAsecVrdWV/MUxrOYAhuWd15niZdleOmYXtqTQXRBcw2aNuLIzmyka5k4+GjzAiPxhdwTNBUQLpC7NrBJ7WHHpCEOYKUR56qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEvaty8F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEvaty8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A321F00898;
	Thu, 17 Sep 2026 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789656512;
	bh=7mzfxJz3GAvDBa2ePUG40/hDb8U35QAN6W4Gtn+Gnlk=;
	h=Date:From:Cc:Subject;
	b=mEvaty8FbocoGjj4T2n0FfYjZLWxkO5U8TGjdsfjO/SWlAsUzg8Yw6/oc7ZeTV/wm
	 botd9sSMIpuGIcRvWSm/7aS/0d2jiXx+UdJ5Nf04X53hy1KfRFCk87M81qNaZ9RLnQ
	 /ZBII3gTwbJ6fMybJ8sZ1JA7SJOLQTCuQN3mdLJzQgtdQbvmiFdVFMUavoHlZln5DK
	 n3KNyA0JL0p1gY8WSJvvJYAvibterLhU4ibCR1+jpDdXF4ag1DwTLIU7VYugjJIOk1
	 FdVdY+0+eZ9W0sCE68zLEfEOoQDrjYSf4Jqrmmpm/35yY0rXECtnKqDG2jFc6qeXi0
	 duKPmYrrBpW/w==
Date: Thu, 17 Sep 2026 15:48:28 +0100
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Miklos Szeredi <mszeredi@redhat.com>,
	Punit Salian <psalian@google.com>
Subject: linux-next: manual merge of the fs-next tree with the mm tree
Message-ID: <aqv9vKbIDQ1gYVwz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xG0KDWN4iCz4rWwp"
Content-Disposition: inline


--xG0KDWN4iCz4rWwp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/fuse/dax.c

between commit:

  e0adb1736318a ("fuse: dax: do not set VM_MIXEDMAP")

=66rom the mm tree and commit:

  c1f6e67c4fe74 ("fuse: mark DAX VMA page protections as decrypted")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/fuse/dax.c
index a5994f1c637d9,32c88ef814340..0000000000000
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@@ -826,7 -826,8 +826,8 @@@ int fuse_dax_mmap(struct file *file, st
  {
  	file_accessed(file);
  	vma->vm_ops =3D &fuse_dax_vm_ops;
 -	vm_flags_set(vma, VM_MIXEDMAP | VM_HUGEPAGE);
 +	vma_set_flags(vma, VMA_HUGEPAGE_BIT);
+ 	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
  	return 0;
  }
 =20

--xG0KDWN4iCz4rWwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqr/bsACgkQJNaLcl1U
h9By1Af/SqIvCKTdd/Sk6YCySYvY1xwDEMs85aG5IIfIpwvbPbe2rZqY9l0q2NnS
UKMqzD0J5k1i3Aakiq5vGA4bujIkY/+bf5PAu/fi8cW+MKzAv3Jds8tPismP3Lgk
DnNE69B4DZ3uqgYD++PKHVEZmHWFuBu72cswreLvWTek9927RmofZqUY0q1eBiwU
ZLwqfUzQjp9cx12yxeTgai1cJ8gkg6DPqz6y30Es1CRDTVAl14uZgzlhLchYLRcA
UCDc8cpw8oRo7eIqVTsTs2056O1xQY6DT3XsIOQjQw6TnoRqHTMsO/3U8Gi0RSnu
+Qola4wSexsr4Q/m/g8Rvj+B093dcA==
=8s4q
-----END PGP SIGNATURE-----

--xG0KDWN4iCz4rWwp--
