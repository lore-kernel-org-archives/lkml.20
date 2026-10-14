Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC748F00F;
	Wed, 14 Oct 2026 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981384; cv=none; b=nfqBV9UOREnWF/cfKZ7pZArZNRDf5NlUrODpluB06qlzKC6uwC5u2KK7WUoYF05/0SgRRBKihz+hNEyfLYRKytymd4nYSxlSgpVbga3e0/kkbnKxkqtjP5wjj6nfSoqiDSX4DL3wAgu7/9/XrEGmgiUdbrsUljeNUlUrnBry7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981384; c=relaxed/simple;
	bh=myxfStHXDaFwFnNYyT+uFu5fr8q7dSIOwAU02ClFWrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UppOjMQB0EVKv7PGjeDpM5V+If1WQscaLha0PJuGWVF9BuidaPU6f6BdgUA5/5xvhvAG5/GWX2HnlwMTilC9UbZ3BcUVOM3TcGM6/nzWbXluP2hu0QRTPsCBlRXl3b1OMY99y2ZNXeX1FNJ/8z/5Gs2120cSPRo/368hJMzrRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBDlTbTc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBDlTbTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAE91F000FF;
	Wed, 14 Oct 2026 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981383;
	bh=R04ns3cQaV+CfxbdiXpUMVrN7FpcfhQ09Y0/Tk5vjMg=;
	h=Date:From:To:Cc:Subject;
	b=IBDlTbTciSK4mJUOlb5tlOOIP77x7YPxdebxMUVQflWtwPndwdrewZ3M04ZyetkLs
	 Mw+5tmV6XwfO5+1l3A/anqNLhdylrbPccuF5Bw0mtqpbQJ9reE2SbqMTEGkIF32tl+
	 cONI787CIZRJZPQDaF+TQy6VACD91JVPJ4Pzu8eySjGJRbcf0pezdAPw1jJUs9t640
	 mxpi6nWzIZJhndpOSzF3dPz3vGZq2BsXES6QejPyTQ/JI8T4IFipeg5PCw78oeGbbz
	 c4uGhmF6EV+gG1F7qpIJwlrzSKX5K8IKG07DwdE3MbG0qD8DlOZtAFoq05B4vlvpT5
	 uQDs++Q3+m5cw==
Date: Wed, 14 Oct 2026 13:36:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mete Durlu <meted@linux.ibm.com>
Subject: linux-next: manual merge of the s390 tree with the mm-nonmm-stable
 tree
Message-ID: <as93Q-hDP5cW6gaj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eu7t9jCr9C09oGVq"
Content-Disposition: inline


--Eu7t9jCr9C09oGVq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/kernel/traps.c

between commit:

  ed26d6fcf5631 ("s390: implement arch_do_panic")

=66rom the mm-nonmm-stable tree and commit:

  5cc8fe84f9117 ("s390/entry: Save lowcore on invalid kernel stack")

=66rom the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/s390/kernel/traps.c
index 115cb33732476,6b083b9584eb0..0000000000000
--- a/arch/s390/kernel/traps.c
+++ b/arch/s390/kernel/traps.c
@@@ -26,7 -26,7 +26,8 @@@
  #include <linux/entry-common.h>
  #include <linux/kmsan.h>
  #include <linux/bug.h>
 +#include <linux/panic.h>
+ #include <asm/pgmcheck-defs.h>
  #include <asm/entry-percpu.h>
  #include <asm/asm-extable.h>
  #include <asm/irqflags.h>
@@@ -285,11 -290,12 +292,17 @@@ static void monitor_event_exception(str
  	}
  }
 =20
 +void arch_do_panic(void)
 +{
 +	disabled_wait();
 +}
 +
+ /*
+  * Content of the faulting CPU's lowcore, copied by stack_invalid().
+  */
+ struct lowcore stack_invalid_lowcore;
+ int stack_invalid_lowcore_used;
+=20
  void kernel_stack_invalid(struct pt_regs *regs)
  {
  	/*

--Eu7t9jCr9C09oGVq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPd0IACgkQJNaLcl1U
h9ApOQf/cE04s7VAtRMXHk0CSuQXhc9Wutpy/Xk7dS/jHdz4EZTKAzCVJ8YbF7QU
2qjQ38SSyhpohC/jiphYd+ZfkAHpKH/GbyLZcjwc80dn6CS71Bz+rAy8ijK4wPe8
L2/dKNajdP7fseHwB9cqjpkTXFUYjiq9NGQUUfldZb4fru+Vi5nQS4vg+KGVem+9
d8rLuc4ftZfbdWCZxctcQvQp+N4AZj0ZeWi8s/OcH36q0GzqzLw5hDiuXKRaMOxS
vRa3Fe6AkisY+xJnhwKi7/8pgoQ4FB6XQNCnr6o7klk0ZAmAUCMSSHdl93lxkZr3
HhB1G68+fknxUOT2K/nAoG2v662nFA==
=RVwV
-----END PGP SIGNATURE-----

--Eu7t9jCr9C09oGVq--
