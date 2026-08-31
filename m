Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610374749C6;
	Mon, 31 Aug 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191688; cv=none; b=bRRwu+o3qAqDGdrXvz9qjq/Jwc3suHd/flfIk17OXrRRqyvGnfFaWfZhYPhywnVyMmgatNDi6ZiYAZD0n3ZjGIIAkhcWAiQhnCZmeKQn3fkzT8XUjCj4yF858k28oz1agl4KpxAN7k4vnlFfxQXD/7n2ihynSHpNXSYTAzKPfMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191688; c=relaxed/simple;
	bh=3ZI3BVzQ6ArZuHEKQMwId/WUsQen5TVAx0mt2oPTk70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKBFZLJ8WK7foO1Qxt25osRq28mftzrAsyre5XE8fUfkdSE/g14vcptFzG84LnyvK/H9maJqhGC7gw9y9XEOHd9WxsTbuRwRdnDSj3nBOsxsYgpcoiqMLhco2xorss1U+JxhRs4gVu9u19JV3MNooigv0TW/hGJ/1XYfoZ4znf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2MA5c6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2MA5c6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577C51F000E9;
	Mon, 31 Aug 2026 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788191687;
	bh=vYMGH2pkKT/lNroPaZtldkJbj7DNNgnofQZ6f6vjLqU=;
	h=Date:From:To:Cc:Subject;
	b=M2MA5c6NukrEw6XjeIMKpVXvlDJc9tO66y3sM0sYNmu4jyhmnFPj9AbZoCJwA1Xu5
	 eQ3FiQ9ZV9+cPKV1KoiSeMT+F6R/qoZylHIQqs6AR/UMP9cjeW7TxoHnZaiy/TP0UE
	 DuFauPjmolv4xAjsPaJ7ABYIak1UAAEE7w4EU5d9uhIa8XOPAieXI8FDS7UZPVjpze
	 pS7FuLKSrdgMhgMUf+xxvAhMdV5kyfLzuIC5kWuyGTP/LNLzJ2FbiFqi3jXQuI8s95
	 /3YygDnEm3JpBqievSbsfvr9jLKQ9FHYKa+/dRCZ7uu1A/xfBHihQUPb/iwEss9LTC
	 8fZHLZguGexxg==
Date: Mon, 31 Aug 2026 16:54:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 31
Message-ID: <apWjwwWlbgpY5une@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vKAAAvGvW66e4M37"
Content-Disposition: inline


--vKAAAvGvW66e4M37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260828:

The repository for the configfs tree was changed.

The drm tree acquired a conflict with the drm-intel-fixes tree.

The hwmon-staging tree gained a build failure, I used the version from
next-20260828 instead.

Non-merge commits (relative to Linus' tree): 1222
 1254 files changed, 37062 insertions(+), 9470 deletions(-)

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

I am currently merging 426 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--vKAAAvGvW66e4M37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqVo8IACgkQJNaLcl1U
h9BTkAf8D2M89Hpnvcpz2n4PmAGQqE+UGK7BUPOlbmmCbqnj4kn4knGIQv7uTrUX
rW+nvjzFtDSrBe9D4fruByUH6+ZqUAa1q71y30yI6vHAZIcmLf/Y2DtvAu/DEgN0
m5V02vrnMQu851OGzRAKghkAe8g0WlUBwFi2U/BE1OIcuwq/53kVtE5hsq1XA237
f9iNI2SNWHj5eZs1m1e45CtjOCpJli48LdGxR3uOgCP+IGFBDW98C9SD3oJsrZIk
rWmmkrYglyMmcqOPzK8XWPLMstKSAr1DvryKcwyyxDD1YRSvJUWm5/Q5xXfnKrDB
C6GbD5COxsiZD3zjRdsNyjAB6FrC/w==
=1zFI
-----END PGP SIGNATURE-----

--vKAAAvGvW66e4M37--
