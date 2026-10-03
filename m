Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE32472AF;
	Sat,  3 Oct 2026 00:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987300; cv=none; b=nBs07YYafGbibYYt4LnpXhGcTqXLQUN16ELYSRl+B6TXik5BprncBf5WjLAEo0BS+sqTvrnoDxZoikLl0TpfC5OpAKGThxh9uHLIyfKY6zgJqjO0254odwIAvvlImfGYPucD60eIU9IdzADSoSeWR/FxxBcr9XmVnn+W/J9C90A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987300; c=relaxed/simple;
	bh=OcfGfSliasbeWdBaKqPQbcsHZyIN1kZ4/ldTFkM+RF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hx3BMTtAEdCRsvnWUy0CP/JtNzesIqenDCAcSWUxEnoanJjZIxwlWSXsHVxv386mRX5IQJ6mn006oVzwmjmzJ7nBJGgt3WV2Tc/ufj2iMaC5CDncBuYfYusiLCU0MUJ19syoogpePWlYovXSzKkdXqX3C19hRciL2NXURNbFhg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3UIX8iG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3UIX8iG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACD21F000FF;
	Sat,  3 Oct 2026 00:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790987298;
	bh=l+IsL9f8haxtULqd9zYY+CEDTqzojCOVipoPz6PBOBg=;
	h=Date:From:To:Cc:Subject;
	b=P3UIX8iGiR3D6GFpsUdwcmdKy41x1QE9YR+uttABzrIBteuAc0Yoe5q+/N1zP2/ei
	 63GExWNB7ix5yIpFg0Rh5RPP47zXwWSyzGhiKOAfN1JA8xS6HbD4+Kb3aR0xAuqZ4Z
	 BkcajfcrR4MyTrCla1pwvb9IVUFVBNf8L3J+Kdtxvh284hAPW7l9HZKpMPdeCkLMmZ
	 KvUpOk/dJYRN8+nJqzEvlAMr7tXO3rIHaOUqsKMnheKykjYdFfTHe0VRwTlWN6Hr9x
	 yubmDcwOhLfQZp6jH7e1WTWBsaiBIDHfgGDcmgJPSkb381KWAPW9KBF5L/2UNefD5C
	 dddReOVCpOl0Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7F2C91AC57CE; Sat, 03 Oct 2026 01:28:15 +0100 (BST)
Date: Sat, 3 Oct 2026 02:28:15 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 2
Message-ID: <asBMHy9MlhwfexNV@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OZMNTZnKR8I5rk4I"
Content-Disposition: inline


--OZMNTZnKR8I5rk4I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Note that I will be travelling to LPC from 2nd-9th October, as a
result -next releases will be at best spotty during that time.

Changes since 20261001:

The rust-timekeeping tree acquired a conflict with the rust tree.

The imx-mxs tree acquired a conflict with the arm-soc tree.

The omap tree acquired a conflict with the arm-soc tree.

The net-next tree acquired a conflict with the net tree.

The mlx5-next tree acquired a conflict with the rdma tree.

The drm-rust tree acquired a conflict with the rust tree.

The kvm-x86 tree acquired a conflict with the kvm-arm tree.

The tty tree acquired a conflict with the tty.current tree.

The starfive tree acquired a conflict with the stm32 tree.

The bpf-next tree acquired a conflict with the pci-current tree.

The bpf-next tree acquired a conflict with the kbuild tree.

The kvm-arm tree acquired a conflict with the origin tree.

The landlock tree acquired a conflict with the jc_docs tree.

The landlock tree acquired a build failure, I used the version from
next-20261001.

The random tree lost it's build failure

Non-merge commits (relative to Linus' tree): 12636
 13101 files changed, 836746 insertions(+), 315745 deletions(-)

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

I am currently merging 431 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--OZMNTZnKR8I5rk4I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasBMHAAKCRAv73Ows9A4
iTFcAQCJ2zZ0zmZIIBoXQhMFkfycvovmrTj3f4lpyAeLXYDPjQD8DO3oLXdJk94w
Qwi0A/Wklz4FhkVghTkVfJqwFQ1/twg=
=mlWk
-----END PGP SIGNATURE-----

--OZMNTZnKR8I5rk4I--
