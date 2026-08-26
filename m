Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9633330D23;
	Wed, 26 Aug 2026 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749620; cv=none; b=Uio4AelY0YQq+P/aWPMQsjRpXHVY9uwAzmm7naXQ25n3BJmJ/+OW6juoNyPhjgcxqUudwxUa8QS5W9YA8D+rN+cBQGOcNi8AT3+4+co/x+cr/1FLa5LpxZnfFFQdQsVYgXcyZgJ3AfIV1C0yT0TULccLevl4zDh8f04gOs8YoxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749620; c=relaxed/simple;
	bh=KCPt4VqvBGohKxD3Dwcv6WoTzJvhQocWGSUO54wScV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LpXjjbM8wEWJ7Km7qX/sBOm5Llb8iQLV/pfbnrly8ev6XdB8NZ3PYxbAoQ07ydGHBKc7Kii1H3UzFQuN91UEGrGiFUOJ3MiUkNLh8vHflpqkruBJJaw+CveaygdPu9RGzcpUASP1fWRNo59XVs2aG9g7wjbQlDu2TiVcXeU0Mkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn4ch685; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn4ch685"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930721F00A3A;
	Wed, 26 Aug 2026 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787749618;
	bh=Bzmp/j1GuiKz/pqEPpfnvj856Xv5G1uQrwT3Ocjm0/g=;
	h=Date:From:To:Cc:Subject;
	b=Cn4ch685J+ai5Xyn4m+PJAmGkdhx3YVXn8kgBWZNuIKOS9jfw28Gg7C04KJsL223C
	 P/0isy5xxf6v4G6X4b8bBIw70nQlJ560gkLo8ilorNKqkoj2fzjPjY9UNqtmUCwFUJ
	 2Z9MMYoh++x4DwkOQFKA9jukmuM4bnZlIuT5tu1mzEeZ8rAw8wMa+MxNPXQoIuJ4Dq
	 C2W4VkO0TchNLhavVtWsaeeg9usSEoq20WXQIDm1Gk8N7E6jZaQH1YjakDrtNjHZCb
	 gryULssbWsPlHGUKOxqCk/LZYI7KgxWYwpsooVGYV9eCl3g+LOL+KZMrg7EHb0qlkA
	 giu488fk4eFdA==
Date: Wed, 26 Aug 2026 14:06:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pwrseq tree
Message-ID: <ao7k768ba0JAB1-9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="onSukFpUnjhSR8dk"
Content-Disposition: inline


--onSukFpUnjhSR8dk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the pwrseq tree, today's linux-next build (arm64
defconfig) failed like this:

/tmp/next/build/drivers/bluetooth/btnxpuart.c: In function 'nxp_serdev_probe':
/tmp/next/build/drivers/bluetooth/btnxpuart.c:1906:23: error: implicit declaration of function 'pwrseq_power_on' [-Wimplicit-function-declaration]
 1906 |                 err = pwrseq_power_on(pwrseq);
      |                       ^~~~~~~~~~~~~~~

Caused by commit

   d51fc9d4cd6eb (power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable())

which is based on v7.2-rc1 and hence misses things that already went in
during the merge window.  Rather than fix this up as a semantic conflict
I've merged the version from next-20260825, this really doesn't feel
like something that should be added during the merge window.

--onSukFpUnjhSR8dk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqO5O4ACgkQJNaLcl1U
h9BiRwf/fhxkshLiVqz2hYKD4CHelbOQwLxY9glF+gbqG4m2vFJMApdH9gi3iVvr
ALm7WlU1OoN2hTQujIJ1FJaOq+Dkj+C+bQNxjpxG9NHFmqVBVNtZLYVwVYyMq6/X
KTCsD+Q3kUGCGWyGt4lAZRV/Sg4N37YpRvbKg2jfIDoDjNuLIV4SBGcCugFnCuhl
2Plhx4Nx+pbu074p6eUQjJsMwVQMpAZlpvOsYSCmdGGL8lw1HseUHea8HlTn/P3D
QwZdx4KCw2fg3iJZpwXkwmUSydL8zJRtR9p2hxcmuk8J2y2Xm1dV3a9To5iPCKg4
yiboLKsY45KV5e5P3bqBiNMMYRlkiQ==
=bhG4
-----END PGP SIGNATURE-----

--onSukFpUnjhSR8dk--
