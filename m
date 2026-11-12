Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502490;
	b=ZJBatHA/iNvYOB4BX52l+9ecSNVeb+JI1v2lMHTwHrI7aZEvahF2ZEuEqQ4PMvG2E2Wa
	 q4C03H923D88fuaIzh+E8+ICj+1P/rfjdIwGg/mvOKKZ9fm7w4aTucrXFUa4E0oA6g06o
	 kALO4fDp+GvzE+g9wyi7w6/LCXISwfvz27SUzCWA6MVF0O2aIftFa56f/IXG9s8EBNqec
	 rwVDsczWLVByBrQ9szIHz+se4wsGBRT3wUUaRRtzAa4Rnm3I9IBYrR07u1gP1okGgqHDc
	 bKfgLAsFmHMiOTxl6PD40divqghGnadZKdQuGoVCqCn2iAeNwteemISGRJm1qrvWPrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502490;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Bw9lp8JxraQCUa7imhgE/6xePoXKhhxbsG8AElA/I/0=;
	b=FB0Pz4rdehdwY+WrZ/J74DgHntmjJvyaqOJDsVZLqsK3Eb5u+m06dPjlcR1pzKKa31TO
	 Oy3gLvazRwL51KqmAxI5Xo5oorJiRI3wRfb3y6460x2yQybYRlAvrYl+RIGPuhyw1Zd+1
	 Yi7OOt42NQdDayEQeD0gfWSbN8QVh9nLRYvsKy1FnLd+gvLzl3uloiAbE+nEMQUe6SJz6
	 wylQQxSJWH8Ir3nNY6jMtZxhMnjsoLVYUustRpYI+7n7bKwe0RWTxCUARHcdmkAmVRX/g
	 BlyA0N1HZ+iYVrrkN4RyFkAsaP/f+Tf+fReh1cGdO+hhGqUwDZoH5zByngTNq/fN5Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFGF+syu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08628606A31C;
	Thu, 12 Nov 2026 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFGF+syu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3F91F000C4;
	Thu, 12 Nov 2026 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794502489;
	bh=Bw9lp8JxraQCUa7imhgE/6xePoXKhhxbsG8AElA/I/0=;
	h=Date:From:To:Cc:Subject;
	b=dFGF+syun1+iuXQ29DDghc7ae2KbAveo0mtkBhTPLqW8IDjs2YHxz4nTIDcx0V9gG
	 dOEilNHjTlaem49/cfQMUj+MlB9pXFLpoRkMM0PQkSPHKkGHKLXRHFsAmTDP88w3R3
	 PShSfPRPcgltE/BVzl8zIK2nYkS7RUfdL42t75uImBNYW87OSe1BUoc3YIHxdU4aCJ
	 VymscX5hiLi65BWtHZKih2XwpmcP/qtbgVK19+SFnN1kvAZ2C0P0k2Lt6P/uiRiqE5
	 BcPUiHci9ozb98Y22TBEDC4gkB3B5yy7eOWXU1UgZx3jjpuzJrdnMRA18NtP0M+FyT
	 kWP4NpEl8mFTA==
Date: Thu, 12 Nov 2026 16:54:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 12
Message-ID: <avXvVg8Dzn73mu8_@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="gQ7fdVK6n+i5kaBL"
Content-Disposition: inline


--gQ7fdVK6n+i5kaBL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261111:

The perf tree acquired a conflict with the perf-current tree.

The vfs-brauner tree acquired a conflict with the mm-fixes tree.

The v4l-dvb tree acquired a conflict with the origin tree.

The net-next tree acquired a conflict with the origin tree.

The net-next tree acquired a conflict with the net tree.

The bpf-next tree acquired a conflict with the origin tree.

The drivers-x86 tree acquired a conflict with the pm tree.

The phy-next tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 5916


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

--gQ7fdVK6n+i5kaBL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr171UACgkQJNaLcl1U
h9CYYwf+M5ClImY+tPOFASAkRbk0k/P/W7JFh37zWAtCSchQdYI6XFHAYQy4qaad
OIP/I0UwXjyW846U0BGzCmvQ92OTbll0iwC5T9knSu9QRpAdWKtPxZh1FjeoirVt
b2TguwJ7VERfjSGzz9sI4xQahSKP0JBGMGDmHgkNuIiO67g207OdhPSwwnjchQ19
jH7Am+ypr9Kd4dpl5CicvZ9oozbybp6XgZkU3ATdxy8rNRlksUwf8xTBw2lM9lzE
QGVr2Y5516l2f9R5Tn7Ckc9BJLwaTNguOlGldUfZtAPhzHJlCcQgxQqLKOHDJeBO
QrpkKBV5YQ0CHRfMqSv/PSBmHZKcCg==
=dglh
-----END PGP SIGNATURE-----

--gQ7fdVK6n+i5kaBL--
