Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198451FCB0;
	Tue, 13 Oct 2026 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910817; cv=none; b=oipsRe8pTB2VDh6/J99NokR0wRsMbFhxF3b1mraMdIoIjpeNlljUhV8HpvZmF7ogOHqxwn3E2rD8xqSgEFLexcSlIjxQWLNxAN67Yab9fGUVLWAYvyJ3xKyTTzkT/fkEUynN+4pLt0Aap90j3/wKb4wlMG3T6Ui+nycw6Wd411Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910817; c=relaxed/simple;
	bh=Oox5P9e71dP0eGmlR8k3E453NWcu+IxspH6EDXk61Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ci8BPama9Xi40SLJXr4TmeY3XZIexiSTWW+mqohizhP2VbzbwPiKdLXAAPEfnG7SE2bFJYJzWKeluul5uWiLJdvIztV/i/H6GdEpzrHgnNboRZdAhZJRL83Uw8mWk5SA3cSoAvqMZoTQ4Qzl3hGqMAsbWia/ZGzJALNgWP+WkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TN4w5Smd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TN4w5Smd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B631F000FF;
	Tue, 13 Oct 2026 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910816;
	bh=ngJqSC+yt6t1PadhQ5OLvlasXk8cxUnZKa6uhhTn4E8=;
	h=Date:From:To:Cc:Subject;
	b=TN4w5SmdPOy1wxYp9T8v5X4U8eGPgXEW+WhCz/11oiC1ZbcNZ6dRTvGRq9Ib3XHNz
	 UqXds29a6et+qVYXZB+GSqotZNcaWf69OTBx+yLfidu9WmW480JtSp/UtGB8Me0M3y
	 W96Yiq03J8C+Y5c81lvJ1qQhRe/4LgzrKjdS6x9S9J7leFYroT++DXvkQ9UqNT+o4k
	 Q/RGmU0CWiO38VfcpVgkuhrnD8PGJkNj9mcY0/qO1doO5cABSbJaDJ5awqAcxaQG6O
	 ARMXTEn03U/AfWm+AsCTYnYP29Vel/TnElVA2wd5y/fkK+jBzzdzqDytN0x24RQWlC
	 3wxeq5q7nHhqw==
Date: Tue, 13 Oct 2026 18:00:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <as5jnDJEt1iZZqZk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oZzMAfT0G+OLY/kf"
Content-Disposition: inline


--oZzMAfT0G+OLY/kf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the block tree, today's linux-next build
(arm64 allnoconfig) failed like this:

ld: Unexpected GOT/PLT entries detected!
ld: Unexpected run-time procedure linkages detected!
ld: io_uring/rsrc.o: in function `io_sqe_buffer_register':
rsrc.c:(.text+0x1a9c): undefined reference to `io_register_dmabuf'

Caused by commit

   4bb7978523289 (io_uring/rsrc: add dmabuf backed registered buffers)

I have used the tree from next-20261012 instead.

--oZzMAfT0G+OLY/kf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOY5sACgkQJNaLcl1U
h9DnUAf/d6vRvuuVUx1NTjtMNjYpMJegpnV+IBns9KPWjTbEPlNyLrSeHpNSsKWW
v5M9ziI54faH9UqmaHIj7GvbEnN15fGaLJBG08rDlC7QjQNg/XJy9LYvzY3UT2/T
x6QHK5YjbCs4q/lacVJu3Dlxyt6CtI4OWlPidzmvH9kGhHQhKoePEijWNOyYGqEx
AlV3ecoNXQrPXOlsUTvlsA/kkPscP7EwhiuQSxZl679rAVSsv1BKlBqdB+FQXvzg
1Q1PVt9BhjPO34fFCHH67OWHDkXH3RwefY7nRowuNcww+CWy6YKjxR6SMXdbE5RR
drL3AVxYCTIanr2WPV0PMV1ZkQsUeA==
=MmWi
-----END PGP SIGNATURE-----

--oZzMAfT0G+OLY/kf--
