Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769199;
	b=LRBRXSh9DxRVwBlSgVMqOkl8k9bnwTMD3peJJ8o8pjnKxeRL7T25jLAjpQ4vVDD2CDmZ
	 4kT1n6KweSLThmoph2enXIZaFXppFyS0PkIFfwdpN014EbIFUVdsFq8cxLYlNcJl6n/Si
	 Mm3ylavQUhhgKzopy+DmVsRZ7GKgx5QzCpPV0UINa3U+Q2GSv7ig5iXbVMLLS+wzwK2Qo
	 j7kpwhd1ZhIKr1d8Xt2VJbwCfDwcQ9rYL/RdmKKDcfDR6Y37pPoD3egP6VRKIayIHvv30
	 fQJxT/XMO9VHuCEMaJXauAbsF1kLchPn2iJNpU1m7WrhVmlu2n6I1sXsz+vXxXWW1UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769199;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Kt9v8HbgBSAawNnJmbjOc2Qk2kuS+bStiRfJDoe7KwI=;
	b=MM9KXs6FhQLE4htDP/Cuyz2zzzthA069MPBakbBCWr4WPL05q4H9aBB6Wr4cU1WT3LiR
	 djVYbgt6JFqoHswghbDTcqd4qEYoCf3imxHmJgMEvfsQapg5Q4EnMub7xINP4e1NylTqP
	 /lpHohfWXHZxItz662XwofVLBc1bNK7XHVdBAzUBShSpWkG6YZtBNcqbJX6rcn5JLLgb6
	 ZfG/LQ7G+mm/IVYglvRmh4Wcf+1j9qhkS3US3udksK7R8u6q9PXB20vzs6mNrfTMALMXv
	 CAuYWfn6GWOIMEgdQWZ/tpfg+YwH5U7B/1aji0SiFgruBjISQo+NFJntlpcAMTtv7Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtT7rZv4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF401606A31A;
	Fri, 23 Oct 2026 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtT7rZv4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3287E1F01825;
	Fri, 23 Oct 2026 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792769198;
	bh=Kt9v8HbgBSAawNnJmbjOc2Qk2kuS+bStiRfJDoe7KwI=;
	h=Date:From:To:Cc:Subject;
	b=WtT7rZv4MHvS1LPjzbg6VTwadcj5jLcM3tihZr7q/pcG36B6tM99aeo8Nz5ZvvkQw
	 2edg7bB1fNrhaK59mrQ0srUyuiWkxWmPuMUEFiAPXoajQqta4FfcCkJBSAq+Y5N4RF
	 Df7UodHfTHmL1ViBDlMrHNzgJ1AWmnaa525GpaAvHEHeDvpAua9/EiAUOXF892qDkn
	 4107+IMGzZEnN/+JtbWjrvhVzSY/HpMnPE/s5iYaOA6/b6JcIOL5LNtIFXpFZUAt3e
	 PrUT/jrVVlUKUUEPa9vB7BRBl3VcBypn5wWRSxb7YbmC4Kq1Q5xu0DIeyL2qwCbaDT
	 lMyky221HpljA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3D9931AC5994; Fri, 23 Oct 2026 16:26:36 +0100 (BST)
Date: Fri, 23 Oct 2026 16:26:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 23
Message-ID: <att8rFmi70XWl4kD@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="s+o9i+z9e65s+PwD"
Content-Disposition: inline


--s+o9i+z9e65s+PwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261022:

The rust-fixes tree acquired a conflict with the origin tree.

The arm-soc tree acquired a conflict with the origin tree.

The jc_docs tree acquired a conflict with the origin tree.

The hmm tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 11571


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

--s+o9i+z9e65s+PwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatt8ngAKCRAv73Ows9A4
ieHjAQC7LL3KJVmSSHxW1Q1lOMxa3a+z1qrU4rDMGU8ybaQPigD8C1j3DNMIkrLi
7EhH2DB0PlUfGs5BZQcF5S0PJYTapQs=
=AetZ
-----END PGP SIGNATURE-----

--s+o9i+z9e65s+PwD--
