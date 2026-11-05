Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888583;
	b=HE1Fj0EjRlkZJhE6zapZVeNPKpKrgnwQufDNyT6Io3qGcA5aNsFyzqKIxoPvePhqcDwh
	 6urO93Ts4thHtJQtB54tkRxDnR3iJgbRkx61A6Gt4+M4HidcjIff5RN1QeyuM4pQ/A4hT
	 mH4BkifTRh20WAL5aplxx5OJbLYHsGcnnep4NLZAYOAQz/We7JQEdwmUjWo5WiQ9QFP37
	 JF+PuZB0IrMg2ToaRvMbdpTenSyoGRpdF8vqVZrdMJtj5B0460Xfrc17iDnafyxFNrzh5
	 92M74LFqwET3OcToh/+2YooluPuZna8a2HyQSr38+jD1K3EnyQd2unrZoGZlaoamJlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888583;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=FN370TWSiQQTuqW2+R3xWeEzcFS3wozY9CEFOHp4uTU=;
	b=3/dRJ2UcguQMMXh7WXjJfK6Um6JyOqgHOnC0rWGHUe+rDHEvWd0W+dA4oDe18gDsxxRb
	 kdO9LBzr8ZpNl5uKRjiKvGffDDmPzPMBonngMH6j/XebSuPBxw+lSg+mUC3buv5HBx1I/
	 qAuwjGGh8pxos30HgJaNIREDu10SD44EkZ7SNa5JHLY4Urq+ulCZXh/CVidNFN7xVrzxa
	 EUJxZ8cGRU7vosAhqcDuWJIJ6ZXhwdXk8R1zxYHEdP/TRt7sk6Uz4MfwAdkxDFoecVIWs
	 FOpVIb1dk72lMBcVg9xMlRLP0ATxmSmJDx3M8NjrYTd5Vc30d3qotHJO7P04VVecaSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG0XqXEM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B9606A32E;
	Thu,  5 Nov 2026 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG0XqXEM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C801F000C1;
	Thu,  5 Nov 2026 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888582;
	bh=FN370TWSiQQTuqW2+R3xWeEzcFS3wozY9CEFOHp4uTU=;
	h=Date:From:To:Cc:Subject;
	b=oG0XqXEMpWM9F9JlZCEl1WnKdYPEQWMkJdmwpwyjbWv7Mq2t3IKU9KNrYk6ZM/dbb
	 GU7Jm2TQ7GvkUPLioIZ2Mk/4B2l3H8xPeLUlbcrP1Uzys4EhWQeVyxHY13A+UZyEeF
	 1H4ckqL4GzWNLYwT+LEwqjwejb8k02IJYpuYOC0NXkJTOLnkcBGfh/WHBa4jqJeCr+
	 RacWmmOqtHj4IuTbtiOueVOnTG6YLWOIt629WX6eD/VPB9MUE1mYMtnyzVanLH44OK
	 jpu3hE/KF+NIrYZRVdpWEx4zTs4744lOv8HA6PnqHcxtD0xqolj7DeGcaPTWWlsqCf
	 SGnYMV8Ve6IiA==
Date: Thu, 5 Nov 2026 14:22:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 5
Message-ID: <auyRQx48UB6C1kgo@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="BT/1i25FtVucNigM"
Content-Disposition: inline


--BT/1i25FtVucNigM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261104:

The wireless-next tree acquired a conflict with the net tree.

The w1 tree acquired a conflict with the char-misc.current tree.

The leds-lj tree acquired a build failure, I used the version from
next-20261104 intsead.

Non-merge commits (relative to Linus' tree): 3339


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

--BT/1i25FtVucNigM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrskUIACgkQJNaLcl1U
h9CUowf+KyGFW4ETSpzf53NwIMgd0+F+Q+dQ4ls2EJH/sgw3LIwAxX7bOAkO6KWv
FGtiFB0bMK7WGj8dA9QzHNHNiDUaVDV/hdlAGWSRA71CPrFgs/H5U0wRkPYYb60H
gGyVVtBrEPLKoFpaDRBN4CFTnq3h37mu0oVWGlNBe5TunR0wBB76XvjwXBtqSV3F
OXJd9rpl2XR8atejCQmumfpmfhUghsHy+7VfPWnTAEQRVo2RPNW+lPMfMNdqlgHR
RkKAGEupISmB9cQOYGESuH0+RWAxjMiEkQBSb4V8v2mF7Sp/+XK3xBnW/h8XhsjH
nd0GlDA4UdByXVRdgCQJK7Kz0QWlAg==
=wUPD
-----END PGP SIGNATURE-----

--BT/1i25FtVucNigM--
