Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764043;
	b=I83gO5K6uSnOlLKVCkcA9k/7/XZchUdMH26ue2E2KYJaO0gcLUOToUkUmonHGdmDjrLU
	 INAFaFqcA7tGpngZKwFvx/3NtNhFH5LnD8hMwZD0kqDL6pE/EJdXV5L2qkKf39DITjS3Q
	 m6HiI8sNPoatFcclW5Us4ace2YV/3tds1Vmvp23kr0QzdRHY8lTPffmBESNy6L2nqjTBv
	 7+3sBl8d9ZMGwnBY7aUahKxHCZUlKjwEuxeBEhUzNmGHvoVCvGYeJQcuWp4j5Cl+tbNUM
	 T//MNuUY+NjknjetbeEBFXlBbRQZf1jmcaNFix4IHz5/C0I2WAFfA8KfCyZz4dZeREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764043;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=KVNjv/qYChjhaWf3ovesLi9snwq8JT7tBCGpJRV0ffM=;
	b=xTreFYmT4gx/B+c8z7LmUzEVsRrWGiyyiwiqj5/ndaPMc5Pk3t1132II/OmXEpwnkxzI
	 Q5A+7DPGw0t6aO1m7PKhnyvDdcxBCooPBG7NMzaVL5wh2ABY/ivIpeUIBclO+gkyW5HhU
	 9MiIQau8KpGInmYohKisHGWGvYKNH5yK7SAc6JxUZTz04VldxWYzas5zRVZkk4dpF2bm4
	 0Y2CJFzn4jnWHbWGyNdbfp+p3ww6bGqEmckDpYar8OsNz9q7QynxWK3FFZ/v/7AV6bOKy
	 wKHCN19Y7iCWNcKaJHApW67DtX69xer4Vt8OSbXHzIAVCrVrCsbvlyeennK2czcs0yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUlkIRWT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794CD606A31E;
	Fri, 23 Oct 2026 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUlkIRWT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED76A1F01825;
	Fri, 23 Oct 2026 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792764043;
	bh=KVNjv/qYChjhaWf3ovesLi9snwq8JT7tBCGpJRV0ffM=;
	h=Date:From:To:Cc:Subject;
	b=hUlkIRWTGobbVxDg5zxYcTSLbSb+WUq4VyU2Cm6HTW4fSwvtCGEMTKHZ/Ry9n40K+
	 3TGr8anK2T8FsG/jzT0HOjRA4USbuTSHl2IRFYL3wOmPtz/YjJ/ewCGJdn6XxPl/S/
	 sph+0LQa1SYYRL83snbNms2UiTOS330ObIT4threnD129c5hRquFc3O3nqkjEESgWV
	 8OzY7BF3GiCnSBtlm8zunNOnZ3cSah+MwzGtKMWbWB2WiNVgJof18HAhpSvBhA9qTu
	 5jAzZYLW5+Xf7ALXVIEvVKAJBjR/MLKmuKJOJdix4zfv4edyHynmuVx4Pg3wtkimwm
	 A9LoEYaCpg/cA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9F07A1AC5994; Fri, 23 Oct 2026 15:00:40 +0100 (BST)
Date: Fri, 23 Oct 2026 15:00:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 22
Message-ID: <attoiGXLbVxCtei3@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="SDiQ78ijsi/K7Y/d"
Content-Disposition: inline


--SDiQ78ijsi/K7Y/d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261021:

The kvm-riscv tree acquired a conflict with the kvm tree.

Non-merge commits (relative to Linus' tree): 15966


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

--SDiQ78ijsi/K7Y/d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCattohQAKCRAv73Ows9A4
iSJUAQDox5otM+4RiQBCdrsKIaNenKViQMN6QtpkxIAF8RVosgEA6/N0O6SvBjsn
ErgY4Uw6KanuDvZbKxOCZS5cd3PpFQQ=
=rHZF
-----END PGP SIGNATURE-----

--SDiQ78ijsi/K7Y/d--
