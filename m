Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27427331A66;
	Wed, 16 Sep 2026 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570668; cv=none; b=JBxS1Ug6N4gdi3shSxw91t1d9iRu0ZS/Xjv50UozjUCxzKr6ZVKFLlwnt1k2q+NuuqPzCZVmUssSuCiB+dBwLHhdnevRIraLlkHmC8SUmOVS3UxpYASLc7040SSLzgx+sU00cZmR/k1zdzMkOYaAkfJgO9YdY+hKZHNf5xmm/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570668; c=relaxed/simple;
	bh=jfF3y0ResI8gzlF9uoVlYfuyN5cfpBHZSUaD8oDWSh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KblMxbQcQDsdy77I4nPi5HpaAtnxUsknuZA/+W/t0REOeT4hJYx9VfCxNhKR3a6Xs5Qg2bBf8kmzgGX2s9Gc7g4ufa8Ir1+91nrgemtL8a++fghQv0mZv5W3ZbxRhmYH/X96/biBFWYNCc6jv3Rx1Q+kwg/mqEUTW3HszklOHck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDm5Kfoi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDm5Kfoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B64E1F000FF;
	Wed, 16 Sep 2026 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570666;
	bh=AY1Jj4y7uEOYFOuVDIRXr3glxRZXqLp8tyu0yBByFBg=;
	h=Date:From:To:Cc:Subject;
	b=kDm5KfoiwQkmEA6JAV9hAiYmZMa4pKNwTSfQKi/yHvcTEWVpmBZdDnZFjgo7LJQl+
	 ij6RD3UIw7NtKnoL6ZDMIztx26J4pIbIhozkaVDyB9ZaqBmmqPZoq+0+7WwzGSsRQr
	 J9e6x9kl/TXcKmMBxrr3iuLwp0EYjqnemd4x2IkM8c3/wZD76n/e1h1CKzPfKcWJIy
	 AerWja1RaY17i9ER4I5zOffrAlQFoiYjlMcxiEfOOMPIeYVS6s0kl5PrhtVi5Y1qty
	 eDVR/zvZkvc7tDpowkLzf9kEUKIEd0Ki5DzdGbW9OiIg1+IHJpSuR2S3pzywl+/ZbH
	 KumIins5kcGIQ==
Date: Wed, 16 Sep 2026 15:57:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 16
Message-ID: <aqquZ_Qr2VAgLHoU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bFTSym1yj1RF3J8O"
Content-Disposition: inline


--bFTSym1yj1RF3J8O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260914:

The ntfs tree lost it's build failure.

The drm-intel tree acquired a conflict with the drm-intel-fixes tree.

The kvm-x86 tree acquired a semantic conflict with the kvm-arm tree
which I fixed up.

Non-merge commits (relative to Linus' tree): 6193
 6613 files changed, 365808 insertions(+), 104394 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--bFTSym1yj1RF3J8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqqrmYACgkQJNaLcl1U
h9BV0wf/aptaPORrgMss34w16oxIpLa7KAzdIt4Dze5Owx5w4Gq2lXlFgTysdZtP
bA1vrB+kfnewIkSnhfX+6YokRk8+KMlORxChdMTsBGhpbg5j9Q3fxjJJiuMtrm3n
oebYEUUUskU7DWBty0lODnubTX96pb626QMF3FCGyt2W4I8tR9OW/hPFxb5BG2ZO
qzbeMe3hhcq5lg2TkxRkRHc9pkq55suVczvXSndg2uWr/Z6dvwcrYNfYFtoyywR0
NPQAum4229UmkEhNXfg2V4HXPguLDJPFVcsvP7tfPVCqXFH9j3LTfaJ4GVu77+gD
NF0DuGPm/hLQE8aQqZyh5HfBQAXC4g==
=pXbu
-----END PGP SIGNATURE-----

--bFTSym1yj1RF3J8O--
