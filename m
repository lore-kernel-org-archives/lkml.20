Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307CF4F4741;
	Thu,  3 Sep 2026 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455170; cv=none; b=Kw4jGpeEaBUjWX/BVQ9+I30jgNsGC5P2oS7eCYrHVPpbJJ9mivJHqooLWyX0mgUmKmiJHyeIh07VJvJwuO9qY4MocxFJC0xaaZWbmtGI5qLbuwbWrO0HPM5+CXqQTSh9JI0LN6RkyAKefrAW6qv0Pxfzu8jaxmdNdgRyXUZriQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455170; c=relaxed/simple;
	bh=FYsVan1Y2udGvuAf2szxYmolGcoIXL4SRGl4OaMxfUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khfzi0xMhBp/2za562qIwdcJ5M5gDG7RYUkavSGvJfCDPXI7o7O5bvwXU9GLwB9rAr8HCvHKjuhnz2jHm4PldG4IyXd1JaTiX8e+218kY71vabld2h5BfD5eh7GDgv2OzZ3mW95OkWgyRNhsHXvfSbu0OJTfRTkSrUdPmMBD9EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/GzYqH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/GzYqH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363C61F000E9;
	Thu,  3 Sep 2026 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455168;
	bh=IPebg5JkwsF3I/VGl2MlWgYwCszAg1nc52NJtiVUsHI=;
	h=Date:From:To:Cc:Subject;
	b=c/GzYqH6KddwztMjmiM9jwU1Cvue8nfU0W9KiXgG4aitL90/daQPjjPeHfv0ynByN
	 ZoN4SNRuiWYFX9aHkN916thAlwMj55aaDLrXZ5W1yJO/ngbAPjfO0lMTrZndImevTt
	 sTFU5ZwOixlUhNtpkgAgCgxs7UVQg1Y4ACld0WNOobWcNL5r4sDmNZFrM9jrpfaBil
	 Z+MuKPn+mF5YVY/p1CmrZVAuVbVZzsLetXpSFP9LnoTo9VOg8HM65SBQcaFrfiHvvI
	 EmbmVW76pMH/OLtiXeTU3/a+11LMloUIFkUcsRBUbrHkYjYx52mmwo0AtkjGaSdcQ3
	 5rWRiBV8L4ULQ==
Date: Thu, 3 Sep 2026 18:06:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 3
Message-ID: <apmo_bW8nV6BlCWe@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s8D8G/tFbrfL5Bms"
Content-Disposition: inline


--s8D8G/tFbrfL5Bms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260902:

The bpf-next tree acquired a conflict with the bpf tree.

The bluetooth tree acquired a conflict with the net tree.

The gpio-brgl tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 2971
 3323 files changed, 184076 insertions(+), 33164 deletions(-)

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

--s8D8G/tFbrfL5Bms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZqPwACgkQJNaLcl1U
h9CuVQf8CgVFBr6l4YeOqI9DYrQtcW7P8nnBri/Ur8nq4m+qdXKntuWyaxjeOuaP
+7+2mVhs/ZIvlgWTOJk8DZUc+o8nRacTTZjk+BZLudC4+THujZLIi4WNuS6LESl4
cfOUScRshV1rL67Q2NmWmJzzaDQm41eraA8y4PiODj4Ka/ZwAwyaY2GG2Pgw1DDH
F+TcKmZCtr3EjulSNTeHW5FnMZ1cMzTLaF6hw22/XBf9gL9HBEYJVhKIfQfoKmRa
20ZE+pgFyDdEjdEX+1e5zyxhGXgzNhUPU5HN0bkLscuegJy10j23+vzET9SnmcdT
/w6X6ul30/4pB58foEgK3lAnLu20xg==
=usUA
-----END PGP SIGNATURE-----

--s8D8G/tFbrfL5Bms--
