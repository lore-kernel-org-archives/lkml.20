Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022943;
	b=iEXyh7vwAcVLCcDp9dkDTEMgC4eORB5QI+JP3RpbZC+1Cot/hAIxo6hiH0z+yuoKQpza
	 xiBqFvpw3NZdA8rCvQO5X4gCLw1+TSNRcLwoRLRZ8eVvJqjNTFQFdR896OnC/j/wmlbfs
	 KI7E291gBY5AYtz7qKAK+ef9t+7fV0B4kpuWQLDh9XGbOY2Vu9YcixyMUNfsKSh/StrQ9
	 si4JmIbeNHjjw2F4VWdj70DtxQD2+lUv+PhSXQ7xsOYJrHc7PgHQDAy8ihymXjKEtcbVF
	 kJyRPzSXEpm682WRabDIYcnxpwNiYjKupD4/fGhpyjqwG625rIjBoHsoAXOTSGpTSUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022943;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=RTUBs6WQJMgh6tr5gLsfaGKNyCFd/8RrDen3XTg/U2Q=;
	b=IHhgq7j/rExBbj+CDiMu3incjVWDpstbsjomGEFswj7RPJWh58cJGeEWMPGv28SCaotG
	 oNBXnRZD6lzi3yrUmUdJnElVq/ofl+s0UNGGtkfCuqDcjiKFBLYPW7RbPNjojJU50bSe+
	 rr/tAlKKfOAQrmDSy3VSyV3fA5N2sC2y/WV+z9PTUR8OC4S7wyXTZXVVrcyd1ijXBg2aR
	 NZ9A1Jvo/4AzOrwnsGvC1z/meO0lMhMfaxBgbbydmD72Bl/W5Pf5oI8Zbt9GAhbNe23AU
	 6lxukglaIBC8/Ze8+upctGkZhCu5IVsutfkXSbQBCTGayx06vadt+S2Fl3q/5jfkXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gR4eV88J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE739606A31A;
	Mon, 26 Oct 2026 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gR4eV88J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387FA1F01828;
	Mon, 26 Oct 2026 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022942;
	bh=RTUBs6WQJMgh6tr5gLsfaGKNyCFd/8RrDen3XTg/U2Q=;
	h=Date:From:To:Cc:Subject;
	b=gR4eV88JRIKarwq/Ak/fQx2vnx/wMVOeLxFiIVciUcde0MV1Ut8vn6/BKv40Tdo/G
	 lfeZvZkyau5oFNrE5ya+NHOat1ccL/HtDd1F9V1w7mx6tr7OC+9Agk+ec7+5tqXz1j
	 NlGL7qgjXn3Mp1cpGIKx5x2t3urVnyLvKWTEAk8diXmNUEj+C3rJ7cDQELmeH/ITCT
	 mh0x2dGLPEc9+lZTyWorA0Bl5Tkbnz/x/5MxA6skYw6LG6KtpBp9rdGD+i5ynlg4+B
	 grPR9/hs6aO15t9uw0CPg6326DTzwK7kMIyfuu+9K57+UryzLyXG0OhUBPD6i3EHGe
	 3+L98DmvldnXw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F3C521AC5994; Mon, 26 Oct 2026 13:55:39 +0000 (GMT)
Date: Mon, 26 Oct 2026 13:55:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 26
Message-ID: <at9b26gopmjpqDjm@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="XX8YVahulm1VwC9F"
Content-Disposition: inline


--XX8YVahulm1VwC9F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261023:

The ftrace tree acquired a conflict with the origin tree.

The libata tree acquired a semantic conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 3618


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

I am currently merging 434 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--XX8YVahulm1VwC9F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat9bzAAKCRAv73Ows9A4
idKAAQCthoXMULrwadzV11JFNlkbau+68RTyZVg4+FAT2AGqnwEA7yt6Qb7sFf+v
q1s0fKQb1LvrJH8lsVJGxEZChi/uvgI=
=5vMJ
-----END PGP SIGNATURE-----

--XX8YVahulm1VwC9F--
