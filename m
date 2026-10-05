Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98C47FB0D;
	Mon,  5 Oct 2026 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204416; cv=none; b=XUOxBGs+msAjgJVftIMzzAJKLdcmziJptyqU87Qxp17BilDgx721jMHi+ijHGaUDLomORK+kj10zFJOGMl2OFILWQaDTBERkmCb5WNrz7P1w2y+wxN3I/KMcj0iOrCtSUE2g6JTob4cM7KGjIHQN61UdJ0ZZBTSbJp3hymYnCAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204416; c=relaxed/simple;
	bh=nzPcucALgaQ4b0y4aDDS36nblCeoukfZgmW0wFrmRdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lC6WEItz4/A/ynz4W8fbw6vX3o4PA6gVNTEXJ/RMiuEkRWQeQTUV0IAuMhaD8UAQno6ARTfZYPJVxPbVJAr+Ay9NZy+GicLUT+14KzqFUOcI6lZH+Fu0VU+46Hn/y7CAwuLcM+qtuRYPjm0MnbbqkFc0FFik93vaSXx4pML/3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKXpXOC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKXpXOC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71571F000FF;
	Mon,  5 Oct 2026 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204415;
	bh=MYS5dHzbK4DoZlP1U/nKpmFCcMKkBO1LL5YaMVhf6pk=;
	h=Date:From:To:Cc:Subject;
	b=ZKXpXOC2oVGIqu6SKCkFIDryfjcwRcsDDXfeNxCpGUP64j+pxp0jirNjgDqn0RD20
	 aQUr1mW1mG0dLUWjnPy9OPKq8jgetTTBbDHpd7z4r/C8YKOI2FSYEN9fWsDWxzdCA1
	 5iSXfl7O3HpV99ICUhWRBt8EHda6kUjaQuamup66yosm92k44eI3ry7tGfsvq1ZfAh
	 7o/SDaAzMOKZ/BNNBYO3/ARforZ17SPJQIe749GnyZ8ckchiDdgGPURB7wXGIPMexN
	 XmVuvHpMMs4uuCwzN3fAFHP4/6xOkI9ke77s/+Du59s8Y5bL3GeOqtiAn8J7aFMZPZ
	 oqHMfPi6wBiTg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5E5601AC57CE; Mon, 05 Oct 2026 13:46:52 +0100 (BST)
Date: Mon, 5 Oct 2026 14:46:52 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 5
Message-ID: <asOcPJ4_Zl9HaYTd@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9hC/c1FXpTlYGKIN"
Content-Disposition: inline


--9hC/c1FXpTlYGKIN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Note that I will be travelling to LPC from 2nd-9th October, as a
result -next releases will be at best spotty during that time.

Changes since 20261002:

The nomadik and integrator trees were added.

The vfs-brauner tree acquired a build failure, I used the version from
next-20261002 instead.

The kbuild tree acquired a conflict with the mm-nonmm-unstable tree.

The kbuild tree acquired a conflict with the rust tree.

The drm tree acquired a conflict with the origin tree.

The sound tree acquired a conflict with the mm tree.

The sound-asoc tree acquired a conflict with the sound tree.

Non-merge commits (relative to Linus' tree): 13010
 13320 files changed, 858506 insertions(+), 322485 deletions(-)

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

I am currently merging 433 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--9hC/c1FXpTlYGKIN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOcPAAKCRAv73Ows9A4
iS58AQCU5EAlC0Ze1m+r7Kpa3EXYprLcYgCnjqMqMKTjCy1ugwEA8beYQHIXa3i7
0xVITVerfh6+DcIV7SwtPSX9rvH0nAc=
=akhu
-----END PGP SIGNATURE-----

--9hC/c1FXpTlYGKIN--
