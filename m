Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283537;
	b=J3yW67GS1LFPsQ9DYDZt57zITF0KXjqdiHU7kuv+QHGVoNCF9i2z8MgOS+HmiL8OeZ3s
	 QPzoc5X+gn33n9rG4Oh7Jp6HYMVg+n28Ae8oaIhrPkbuXJ/lNH6SPT0KBXd9eTQ/cjBgO
	 MbYaxZg2yJX9C5C032qW9SRSnOv/62WJW3ZsGbZEy+i3QFSr2Cbv8x4Q9UdDsa4UYI7ZW
	 Aqe83k/+SVmF1LS8EJVg1uYDHrBq58NGJbwyjot5qdw03/xsvmBpKwro7Nd8ilr8BAfjc
	 tI31nAoIEgS9PSA7EDDqtu2BtcCvB5Ef/wYVi+/U/ddKnfWcEminmaI1/LYu3sJmoVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283537;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=2/CaLQjFPN/5j2tv1OoKal/cr1v0fSPT1QEcHxxtjoA=;
	b=wVL6QAH3N7Q6IsMfhnolgi/HyChSzC+uHMDVnlkbiXo7xvtN6p21WsiiAha33W7ZKj38
	 Reo9G7mn52vPZVSFjdjU7J9aOuSQ/rKnhFDap4vRpvFPi7YE2AvlQeAEvaDJu4UahWuLQ
	 SJXAhyz5qC8w76M6bMtGi6DjG8yNk5YEAnKIldV9nUR928UWj/qrw+nxAabIAnP5XYXty
	 GS43ND+4/LD2WmCvAiqdYYuAIAUIp4alttO/kJvh+l+2CozyOEpA9AgX1Nx3XYJQJG9xM
	 rNORGdRc+I1bGFlzxM9PdzDaN0lBmbToP8RWzDP3oIMPEmM34tu1bz3xDTQfyaUdMNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8XG8k6a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A10606C468;
	Thu, 29 Oct 2026 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8XG8k6a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9018F1F012C0;
	Thu, 29 Oct 2026 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283537;
	bh=2/CaLQjFPN/5j2tv1OoKal/cr1v0fSPT1QEcHxxtjoA=;
	h=Date:From:To:Cc:Subject;
	b=k8XG8k6ahldoSa/aj2A4H2uS5Np7344KxTm9ilIHkd7BpytGx6ujYzPkZgAVkwOSq
	 Qq0eekpy9xu1G0gWpxUkcs/XyRm5hnP5yP5rN1W9Ss1DMNirwi0g4ZfGPG+GrzIGxu
	 V0dJY/ZcMG86Plu2uETSIha+1mV1bHo4yxKe11fZ9unK8k1H/ZrZXkP4F3Ev7jfW3T
	 wE7+jjmbmuGlewvfwxh9DjtF/A7mSIrHo/hwE5QOEHfDcryKgCfBcCgpzcpiKhh25I
	 mL1f2d+RW0pNuzMLXoWgQOXnZp3MgzKgpD5A+OKkI5e3Mv9NTfC/bS20QUj84kyc6K
	 wfbiecMBxgdMA==
Date: Thu, 29 Oct 2026 14:18:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 29
Message-ID: <auNVzohWPUoDTZEM@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="+cpwWj47SVcym6b+"
Content-Disposition: inline


--+cpwWj47SVcym6b+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261028:

The vfs-brauner tree acquired a conflict with the vfs-brauner-fixes tree.

The amdgpu tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 2827


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

--+cpwWj47SVcym6b+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrjVc0ACgkQJNaLcl1U
h9Dc+Qf/XZ3VS8q5LR1qg5BI1LemxjLxRzTHCSseyEofQX2TfgRgH9cvpeUxHD97
TKiOOJQoWcB2xlYgXiasbDx0r3GlhEulgyyZVQh5SQiqmGe0r8o4CvXyAaVybgpT
HbWH2nUmwpsI5hApGWzthHA8529wR/EKv69lnabjylEpsXi0q56dEMPtanrjtE85
/pIPwX70fQzSUakLHMlwmayToLqytRDmP2oUyWDjF2pR4xM1cU+uYr/JO9h/XvEB
fSGXywswzmiV8++NGsjBvytO0aSxPi3Yt22MAndLQhrQ01mI7wytK8wjQG4z0qB4
u+9/4+M/trkrarWRAImuSXziOCs4ow==
=BOTu
-----END PGP SIGNATURE-----

--+cpwWj47SVcym6b+--
