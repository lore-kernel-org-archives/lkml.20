Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F04A1A0B15;
	Sat, 10 Oct 2026 00:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791593313; cv=none; b=OHdt7ml4R9NeYeuDLEVvxRAxViLRzl95soMKhYHjs/uKgzz2TCz2NPi3/SSP3dubPDKgQkW/9zJ6KFXeciWIgg61x/q+E2oar52Nq6ze5FmfCc799/R49cmeMwLQR9NioDX/d2k07Yfzaea5HNC02do48Dfqt/RJv093g2wVy4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791593313; c=relaxed/simple;
	bh=Vo0CwmL/jMNKCKB0uh3q1zyyo/FOrR3WaNsVi5Se19Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+E9rR0JFbrhs83ZfcnL6p2qpeiPzHz8XUwJsTO/zFYiRm7q536bxPYceWSs/ZJvWgciEC/kWoxX0dWnF7yAcmewsT5vfT6MsPXMcoIjM9GZE+jfNgq8JT91DPSUrHtXdYnxgi0bbVNdQyf2ikpTaSUFMCyH3YZplBaOT/rwyhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R279cFaV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R279cFaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15431F000FF;
	Sat, 10 Oct 2026 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791593312;
	bh=i26YSSBs6FM5olhwQ3X8PrHtVmzcSukcUaP6/pYfMZw=;
	h=Date:From:To:Cc:Subject;
	b=R279cFaVl1SGg96nz8lrQAYqxNoadc++W8lcwg1yCjrmZpbF1GoEB+WkqaaomNvlB
	 kRXXJ8K0Dzc14DI6IVaP+B7S6woZyIJ2PvUVjAjsW/zKMv+xjIsDrlvWRjIk2gtHbs
	 wECYkcpQEP2zJtzsSfAo+eldydUEd5GVnioFWQzd6nkZvQsvgWFTkZJ7ZIjGEQQkXx
	 +bK1ELkGdNWK0XE7Noof1QNPAf1Bd8t4VuUuv/TUJbipWtLw2UIyUnFLkwPsKFJ/+i
	 SORjIehua50BFlbAtWFxSkzaJnO5Wrcn5ZS4+y1DRfr+4mubCZAnZXbHCHGMUT3HvJ
	 Ez7GSA506b5Tw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 28CBD1AC57D0; Sat, 10 Oct 2026 01:48:29 +0100 (BST)
Date: Sat, 10 Oct 2026 01:48:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 9
Message-ID: <asmLXRgApyR1TAzo@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Yo7u/Zz6a4aIlmY"
Content-Disposition: inline


--8Yo7u/Zz6a4aIlmY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261008:

The kapi tree was added.

The vfs-brauner tree acquired a conflict with the ksmbd tree.

The vfs-brauner tree acquired a conflict with the cifs tree.

The pci tree acquired a conflict with the pci-current tree.

The staging tree acquired a conflict with the wireless-next tree.

The efi tree acquired a conflict with the kbuild tree.

The landlock tree acquired a test failure, I used the version from
next-20261001 (the build success yesterday missed this failure).

The kapi tree acquired a conflict with the kbuild tree.

The kapi tree acquired a conflict with the vfs-brauner tree.

Non-merge commits (relative to Linus' tree): 14604

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

--8Yo7u/Zz6a4aIlmY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasmLXAAKCRAv73Ows9A4
iU1aAQCguNB5BlUm8ftBFgJ80rrTJsZT5Y0gtrYA62TBpRf61wEAm6m5ed5gexLd
W2ximF/O2ObSQ/+B0JEoI0neGBIO2QY=
=aC+R
-----END PGP SIGNATURE-----

--8Yo7u/Zz6a4aIlmY--
