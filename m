Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862958;
	b=H1eUVWFQhf3ndsf7fe0iLwNKpEU5l/o/xD0aD7Z2nPoovOa5ArqrkA0bUOfm5dtlO7V/
	 s3Zzvhqi6ocP1WyUnzgrldFuUKH+E9cCqp20Np/JOFDoGB+KWiX2ZtnuzunqcCCSX4fgV
	 k/wRCs8qemwbi3dT3EYkmBn0hUEe1FOhguxD6CsD1cexAIJNJ/nhH1TwLflQ3zeFQWi3p
	 joJJFm+LQV+wqBNmjA0otaTls1pGhkCaLC/F0PJEem1OncdeopYcxeyze8sq34Pblh4mX
	 JhVrXLvxnN2jStbGVppsCVZK7URA7xZW+98REUlOB8JFEXk3o2r/5Hf7N0isNDpVG1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862958;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=s6pUY9Widi5nXjWVVQIAl8KSmfUdpPP/1yLjtnuYQM0=;
	b=aEvJkJ4qF9Q6nRrbAn+7rKUzTe+GvXJt+x/vleaUA/6/jO/Wv3vItKrLvjLvUQG5jJ/7
	 hzjx9CVDWxmDJLI4JkgWdVqEUCKzaYkJuRy4IQC93Zha2P+wGNhH1AWO2dkPxR/pYl8Q1
	 jmMJy47I1NlDE7zSGP9EdfX3xrSUgFnV3DWMjVtP99tisH4EcG1t1+qrireM+th+mELWR
	 rPIsornhvfqmG4maE4pGBMV8N23rgrAK6JACw7grquvDCQr+HnPyDtqCAzJR+XjxtDpaC
	 2j9X+gvLuz3Hprt2qmGGk3hWK21yuCVMhHAT7sPmQMZjwQPLxfl0DI0EvMOcnkP9EKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nViA5QCg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC71606A322;
	Mon, 16 Nov 2026 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nViA5QCg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE4F1F000C4;
	Mon, 16 Nov 2026 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794862958;
	bh=s6pUY9Widi5nXjWVVQIAl8KSmfUdpPP/1yLjtnuYQM0=;
	h=Date:From:To:Cc:Subject;
	b=nViA5QCga5Uz3gCjq+nzVOw7sI5ePBBUrhS6Lu4+l1MTxhqxPUP7oM6LIdercJNF4
	 IXCOkEQro9PRy+mZa9wP5s8KSRkNk9Xk379M0yQIYxsOkpPEK/hdU0WwQkvqbKRTN7
	 7F8gZLQtKoxpWHAA1BBbgzKB47qJ1IJH98MefvESZKdmJHrRIc9otUEbjCptPSmoie
	 5qx2mmTx8FZ5aR6MyblBu+TckTSnLsDKbBysV0eQoA9n3PMtVBVz3HFdCMkWffuqV4
	 xelPhsUTVGfSQUxGB0gIzztB83YYuOa8x8Nuj7Q79HOMwhF01D9TddmSL5hAhrRfPH
	 BY2NMMQpi91aQ==
Date: Mon, 16 Nov 2026 21:02:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 16
Message-ID: <avtvalTGHXI17cR-@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="WKdevi1XVTA2eG38"
Content-Disposition: inline


--WKdevi1XVTA2eG38
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261113:

The vfs-brauner tree acquired a conflict with the vfs-brauner-fixes tree.

The bpf tree acquired a conflict with the origin tree.

The mm-nonmm-unstable tree acquired a conflict with the vfs-brauner-fixes tree.

The asm-generic tree lost it's build failure.

The v4l-dvb tree acquired a conflict with the origin tree.

The crypto tree acquired a conflict with the origin tree.

The drm tree acquired a conflict with the drm-fixes tree.

The mfd tree acquired multiple conflicts with the origin tree.

The tpmdd-keys tree acquired a conflict with the mm-fixes,rxarray tree.

The kexec tree acquired a conflict with the mm tree.

The platforms-x86 tree acquired a conflict with the pm tree.

The chrome-platform tree acquired a conflict with the origin tree.

The battery tree acquired a build failure, I used the version from
next-20261113 instead.

The gpio-brgl tree acquired a conflict with the gpio-brgl-fixes tree.

The pinctrl tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 6550


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

I am currently merging 436 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--WKdevi1XVTA2eG38
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr7b2oACgkQJNaLcl1U
h9DF/Af/X2hOOzEpcYGq63/PCsTP3+zZZRWPvPWq5KXgqZRVfSCiqrWFqkJudHhK
zPM/eKvMuldWivvceWhWHajFX7HtraA0G/XCyFLsStGwYDigzOyxxGp07FnKWjhZ
mQF8v+nG2HbPyF4cooWAf+yZbrLQRmhr3tjs/hVByIdAgTI2XUhStDK0MW420Khp
7Os1eknDfZBbfagNrhHJS7b3GTxVcmgr2B5CcngNb/dyCMiRLql6VOKmKAT5Szr7
SeUi4QJTYB1mHXXhBk3fE2X65H06QhFBrebWm3z+nnO3s9NJzt/g8z/Vz3RoiPPq
us5Gz3IS9kqwIJIX7fRThat2BgvAUg==
=TxOE
-----END PGP SIGNATURE-----

--WKdevi1XVTA2eG38--
