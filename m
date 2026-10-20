Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505400;
	b=Lv5BghvzZEvUKCQi3USIlB7/zPZobYMSN07OwhDXhyAkmFF2FBJccgclK4r/cwkB/6f6
	 4Ngn2aBFUc+tEQxDTlmyHEwIEeCoOdGS64B8JhcR99nZiW4X5rPzohZA/WjsjtUZTM4r4
	 9UK6CigVbncEPblE6yC0bx+1lUTixl3Ppl/GG57sMBEI7dPDGWbvUYsdVgf/FnFI074qv
	 jba1bPZhD26Gn10gaLdcnMZViETRnhPy0qtBTjvOf5JXX7Kvzkgs/xvRcgSBFAq3Bf3Co
	 a4RpW9ww2mDEGJ87yvehZQ5PNQywBMEz7uxtJc1rTwCZF0bjI8pq1/foAud+II5sGZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505400;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=AwHv8HPvqhf4bKKO6ZBUu+5X4D7kMKQz6gRW8aYiJRc=;
	b=l8DJw+5wy+TZhT4eL3/YIFTRfZP+qA/LP8APWZeBQWi46krvKuP14we8unOUBuvfUnVt
	 ynjNqk7cGJjI0G5OB0EzXmRX5ViSo5mXv3I9noFMXGblbO5mgVVXIu2GkbOS2ocQxBmOx
	 oWc49M7KncJURBz3EfwmnojRNjAK5Vknh0f0HA3X/IvSgxCA7J8V2U9r3pQZjBB6s5qzl
	 rykC2Y6y0F3+Rb5nM6/yulGo2oQYwPFe+aGuweKUK3yV0/0uN/I4Sjl2uJE4ZmPRK9pfq
	 /r8hifbl5k89ArtJrLFaOfY8N5GmqnwwZfL/cd1NGN6FsPwUk83rmlwQg32eSgb73ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z78+H229;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75481606A320;
	Tue, 20 Oct 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z78+H229
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF64B1F000CB;
	Tue, 20 Oct 2026 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792505399;
	bh=AwHv8HPvqhf4bKKO6ZBUu+5X4D7kMKQz6gRW8aYiJRc=;
	h=Date:From:To:Cc:Subject;
	b=Z78+H229PqrNoOuydsnzVD0OEwWMq4Fwz5IK1mOSKlaBuf92E4mQeX8yqx5JfMog/
	 /VlvIQTIS/hY/y6s9J98hJyTSupGzmdqkSESBdJCa3L9fK/ouFGmp1lqtUgyAE4KiS
	 IxRsUxPSmYmG9m0kV6yjfk6dCsc9O2pJf9fPbCpBOyhS+hpLF/wam+vYNobtWb1ZMm
	 ehxx1RaC8YpHCkNZnyZG3225QCOGLH66mFmeRJkyquKowziZN/ChKSWFs5kBCBQ/bD
	 I0GHh6PiWr1efMSdS1pKGsBYnBpQKlilyycSPs6KLqAL/oeXt+aB5GSIWByAexSo4k
	 mfTjq1ea/lxjw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BA3131AC5994; Tue, 20 Oct 2026 15:09:56 +0100 (BST)
Date: Tue, 20 Oct 2026 15:09:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 20
Message-ID: <atd2NPxTfe8vjwks@sirena.co.uk>
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
	protocol="application/pgp-signature"; boundary="szR0u2whGL0D3THy"
Content-Disposition: inline


--szR0u2whGL0D3THy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261019:

The vfs-brauner tree acquired a conflict with the origin tree.

The block tree acquired a conflict with the mm tree.

The kvm-x86 tree acquired a conflict with the kvm tree.

The char-misc tree acquired a conflict with the rust tree.

The landlock tree acquired a conflict with the security tree.

The landlock tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 17217


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

--szR0u2whGL0D3THy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatd2KwAKCRAv73Ows9A4
ieBIAQDSgNP3ivS8IcykdFn5t6mFQwiEtSjRtgNxXWcECwaumAD+Nu9/Wieg3dPZ
8U2AdBbbAvPcdbpdqdgYxRZlhs04VQs=
=1lnq
-----END PGP SIGNATURE-----

--szR0u2whGL0D3THy--
