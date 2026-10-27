Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111820;
	b=FkFu+IB/fhhnQtz1ms7buCirXatPVnmqpSBBDnMzAoaVTt7JFn2t7mQ6r1X1mBGLlXlO
	 5mHbbxxQreE0agEu3yx2bbC57OTFSWWeV41bsZYPl17ddDd1NowvRm/vntDEoOsYJZXJT
	 piWxnBwBEqCfvfJAgcdQXP4eLUa52Ae3pfmxPiH+xyY3M3zXmwF1qQw/MqYcgIHjn5mYj
	 5f4Y+fY5Lwz98N4puEHCfwRGxnPi4Y9LfEkLYvBhnpatgXxvKaQ4tJZGz+/u/ELv7uA/v
	 iUqDffb6mJLD+85YMaad+dvfsgxpklp4OeCY4EnebW+Rz4DxL1ujB+GtXkZ5W1KIUfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111820;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=k6A38n5/DVbf6gE3bQ9Uu2PJFa1qm6iimUjwIS7Cwvo=;
	b=jIj1Yyhws3fO+yKsdwOh5p9fWoBP9ONXd5R+FdbKdCVKZU28eRJEF5YDOiMCd2wH8ix5
	 hbXP6RVEDr/sO7sxyXm9xlOKUOg4FO2alEcZJMwKcv4EkVNj/MsqZ5MHXwrgePsGIbNed
	 t16r35VgFT0FW56dXbSg8R1Z4rYSMd5tjtnEjUWxMOMZVJ5SlZK5WKN7yvo83dDciEgQr
	 ZZSZkoTbnug+R6aqMnIo5vwNJ1ymuJLH42SCja/w08CugAqTfjR5s++j5u0MKIc5QN7K6
	 1MSDP7ddAY3B7TeV6JABfExM2IzuQIuVAYIagyLdnVnMYF48puLdg/v0jPOLU/mFhcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLow2nFk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67A6606A31A;
	Tue, 27 Oct 2026 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLow2nFk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF6D1F01825;
	Tue, 27 Oct 2026 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793111819;
	bh=k6A38n5/DVbf6gE3bQ9Uu2PJFa1qm6iimUjwIS7Cwvo=;
	h=Date:From:To:Cc:Subject;
	b=fLow2nFkJ/d9MPk2YbHIjaeET6P0rPk/2/N1plCYiWyOXl22OBkJ3AiTK6tU/I6bw
	 2c7uc5zpFKg0IThguCmr3dAIOZEZM1TJDHaiPwfY5NrxT33GAJNIpiyPngxXhA03eG
	 CYg/i06IzZwWl0U0dBhaK72cIImycGpbr5MyA5poYQEM0nIoaPlwmm2smjY0F3BSpI
	 DU85xMNyL4qCJ7IspXFBjs219m2/UrT/zr/uG6uoZ3jBXI3VJViwZGqly4D028szV2
	 OEd1LAK8U0a8076eSDlq2MDZCLSXgjcwWc8ik64FjcSFLCYu4ebgqwSrnFLD1VsXej
	 GaK4QC5li/GgA==
Date: Tue, 27 Oct 2026 14:36:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 27
Message-ID: <auC3CLAhC9c9Vrye@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="alJl0fT37FA7F257"
Content-Disposition: inline


--alJl0fT37FA7F257
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261026:

None.

Non-merge commits (relative to Linus' tree): 3457


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

--alJl0fT37FA7F257
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrgtwcACgkQJNaLcl1U
h9DHBAf/Uhf+CDoNi0vc+czyVBDsFpyLh4BLPi/5ODl3eXJ6pASP9Ik197oAu1qH
o4DqgosAAGtm3q5a13UMnUeYaQi47Lb9VYG2AjNhsatmfz+TkccKgh6xMJ2mSmEn
bANLJSgaIYO466+8dIP9MswWWm1gSkDeeynb4yXKpoSq4LIrXq2wpIkBrei1lpf9
ytZnxFcRguhyvqpsvPvkmPt/4eTuZhEanzdjDm3lYY0+YjsUGkj0FuZT4oLT7wQJ
dJT6W+tacG1SgGXokQhQTDCWtAm6xm5a2vvSYuFuFZmAJdXabTpEO27kZ93/IT/b
9iCeNNK04OcDz57YL4UzvKSFzT2r9w==
=TvKu
-----END PGP SIGNATURE-----

--alJl0fT37FA7F257--
