Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624510;
	b=Sq9mqz8cRdkVGpn0mruD7LYndqjL+JtkVin/O7Sz08gDmgpqFSJV9UlIAo+/91k56F8d
	 ojv6jbVODS0QHjUoynwwijSVCIXFt2rmQwckvLAmPaCcQmVR9zutnc7Pmkba5BQ7CdAFK
	 3dr6Yte3od3Ku8hfSWpTuDqy7QOWet+gFjBTaHpq3GmbRHZ6gSMJeFDbpHC13BuofSUbc
	 HiTBxuBIIyFI7bHwsMc18RsPy5vzsfW5oBAP/ZIkc5qbfOlJ9w6w8NETKQ2/SG1qQOzIA
	 iTsKbTlc3nHEsHBY0ebZFlY4wfTbMrGbah0kb+6QbW73fr9kMACdA1VRVXsU0V9hk1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624510;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=QR3aOYvSWZKZVMxu2m666WYK6HuKFdiZOXt44+sVb98=;
	b=f7vhgQe/zdyK3ioEkLVE0EaIJy9yzZJi9tXFEShS3x4Yeal2hVX9kPYCls8lpunR65q+
	 66rzP3fawpeHWdonOMQ6lEGV/oCGuoPJnKmYTMs3C9GuXbRV2a3laU5rywlI8d2BmSui6
	 rexQaQScyJdX8HBmxPFEZwLL3KY2UP6gYN8QB7tmWMhXjHUcyO6ZQfD5gX3oSLWIu5jyG
	 dzk1Lo6qsQ9cwsZ1dQWpZIkY4kPb6bibn4BcEiliPE9alfzLdT3Pb5/QDMjWkJE0bacMp
	 o4NkGMHKtNnwhfkt/6rFBzru4/buFHUYqltJKFG6ZSHHlF8ksCH7IIh7Ul/SrMyzW6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ApFQF7cG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E34606A33B;
	Mon,  2 Nov 2026 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ApFQF7cG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E086A1F00A16;
	Mon,  2 Nov 2026 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793624509;
	bh=QR3aOYvSWZKZVMxu2m666WYK6HuKFdiZOXt44+sVb98=;
	h=Date:From:To:Cc:Subject;
	b=ApFQF7cGtIh0Oj+vGxSj/uV0iGSyfPxHxlrOP4xJZnb8trIIvM4t4849wN2lOvRjW
	 B6qjtl9AVGjiHnDXRyg7Gm7Ey7G/CQWs2uhNpl5R5pfoyhwJ4hl8WD7qBCBPvP/EES
	 FQi3sRugIWZiES/pVjAMqy7tvweGA585LR1a0pD/+mIhp8FxJT2p7nJ2BztcfEs2ZC
	 W/ZcjNJYk6k2rYdwXwrkude+UZreoMgpxveNigoRZyqO7V7rkSoL2i23Egl0/xHJKD
	 r2aBbl+JYS2P1SNWeY7nGRs425lEeI1QS+s7Wvx7zcVImEG8ZpZFc2ba9p5N8LOr0r
	 2u9wJe+F/Myrg==
Date: Mon, 2 Nov 2026 13:01:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 30
Message-ID: <auiJurORpAlpSWgY@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="sv/oeeoyqDQMQHo1"
Content-Disposition: inline


--sv/oeeoyqDQMQHo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261029:

None.

Non-merge commits (relative to Linus' tree): 2711


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

--sv/oeeoyqDQMQHo1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmroibkACgkQJNaLcl1U
h9BX/wgAgZnRCKsZQBoeex8LaSW3q5bZnbe3cFrJadmSzdI3QFXs27R8hcnaw+4N
Ayt9l+Vx/BaK18mK7y07M/shp59wxRgWAxaUoNEeySBHfUgyLSGO9XbadF57hBw8
JOzMnZPz4GdkJB9RrbXuc7Kpx+ZBgJpTD8vuPJhf7z92u4P0hdxOYkkOYXJZpV4b
cjundudI8dWV2AKSWrXaoWCno1jnVaxniYJ2Lm8L2DjmGF/h3NiarjT3qoD+NbfS
/JNprRGJ3d6q47wuAjgdPUPKe+fElzBrj5ghfGkS+4JPwhjXQc4CUmsICC1vyCQ5
ssA6UkyxYnOYUUb/zgCBGsya14J9RQ==
=rDwz
-----END PGP SIGNATURE-----

--sv/oeeoyqDQMQHo1--
